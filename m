Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38A6841C328
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Sep 2021 13:08:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244361AbhI2LJr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Sep 2021 07:09:47 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:35032
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243413AbhI2LJq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Sep 2021 07:09:46 -0400
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id DAF6B405B1;
        Wed, 29 Sep 2021 11:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632913684;
        bh=aX6lNt/v2bM3fOhUKFXaVJ5cGbOoFHK0cgvLwy/sgvM=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=Y9GNT/Ozu5xpPI5SkDNEBzAjAJoeFYKkCEuXCar5Rm0+o8CHNwp3InBRgQrvq7jEj
         QU5zTVsspxz0xh7Fshfla6ZqugwzKLuW0knZwSL8mFavVwLT73xfAY7GOGEF7PovBX
         U+MfDH2fbswzilbJcSZJGlW2OI6gg/ikHu6Z7Sh4Gluilq5kMviKhp/DQXck+GKxjV
         zer2SVAJSSjrKgi0VKimiuQE22/z1+3yCHpSGldVRn3CcQKwV4Hhw1U4t/n0wc3FFb
         ZniyaHIoDsEG5HX3AgFEdZs2o6JKlgJPKZaEJ4JFg/xlOrgnA6eIEwMuB1iR1yDhI8
         rehr0oWkqJu6A==
From:   Colin King <colin.king@canonical.com>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/mdp4: Fix potential integer overflow on 32 bit multiply
Date:   Wed, 29 Sep 2021 12:08:04 +0100
Message-Id: <20210929110804.210725-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

In the case where clock is 2147485 or greater the 32 bit multiplication
by 1000 will cause an integer overflow. Fix this by making the constant
1000 a long to ensure a long multiply occurs to avoid the overflow
before assigning the result to the long result in variable requested.
Most probably a theoretical overflow issue, but worth fixing.

Addresses-Coverity: ("Unintentional integer overflow")
Fixes: 3e87599b68e7 ("drm/msm/mdp4: add LVDS panel support")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
index 7288041dd86a..deada745d5b9 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
@@ -64,7 +64,7 @@ static int mdp4_lvds_connector_mode_valid(struct drm_connector *connector,
 	struct drm_encoder *encoder = mdp4_lvds_connector->encoder;
 	long actual, requested;
 
-	requested = 1000 * mode->clock;
+	requested = 1000L * mode->clock;
 	actual = mdp4_lcdc_round_pixclk(encoder, requested);
 
 	DBG("requested=%ld, actual=%ld", requested, actual);
-- 
2.32.0

