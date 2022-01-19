Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC050493781
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jan 2022 10:42:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239817AbiASJmZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Jan 2022 04:42:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235918AbiASJmY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Jan 2022 04:42:24 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 335FEC061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jan 2022 01:42:24 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id i187-20020a1c3bc4000000b0034d2ed1be2aso11577165wma.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jan 2022 01:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=W6a7KB7SvMINpfWb7ne04O26PGID7eQ1qPueQyfj8PY=;
        b=Bay58N8tiDWPlgJgYN6I95OYPeYK3d0b+vaW6sU+2G/2Aqp41cvGYQq2o1eVIJ+cGV
         6DtMtXE15rkX6yU2iT1gN2w9vol5Yibfzd9Wvsa0BJly0uu9CDX8rYLxtqV7xaXTH3Us
         wrg1C9awQ3OfZpoRwUVQ+/m/VLQABED26YeCxrQvA24qheCgUu1Tr4Mz/L2Pelbd5xs3
         sQakGyuvVQiozXXfTWrXG/BwUoEZureBLu2npry0tt0JBVV1z5dgl+/Wivrt1Hk/ruYR
         Em0k0MCbR3kM5GQV2Y1REswWsBj4u0X/YAZhXVtQK4FrMuJ8D4AsjvtBAPJne2b2J9X7
         ng+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=W6a7KB7SvMINpfWb7ne04O26PGID7eQ1qPueQyfj8PY=;
        b=i+Nw9fOkXPeEBXjN34r2twB5euM2PeapZ7ks1DHPXh2zVnc4u5wmL3mg/YDJqUfUEY
         V29uBgta7trhdIlMlXaqe0wgJE73Ie+5e5A2Ypo+wWb15hT4qmeIDpHgLE7+77P37RIx
         X/nuvx12IpySzf53bl3qLGk2C9rMGyk0M4oFWslYD+/32GkIFizkeXt0Zg2V852DAsTm
         m7QFVb24CFPkkPM0FPCibZHVxsBFxhVPJ24rUhGzuKkJ03lFVE/zw/Gt4AH0pABanoZX
         Tf0GuBFM4seloucLPhHu0vmJE26WAIMOw5BAO1TMZi4Srg3mYF87SG7d59tScLtHz1jX
         SU1w==
X-Gm-Message-State: AOAM533nOk82Ciu+KP1mO/XHvrwZ8da1DeEkbEBhrsUg8Fn2PbsdLb6g
        YS7/NHYPeH/yFhuVefPnPQ2zvA==
X-Google-Smtp-Source: ABdhPJzv+ZNy1SRlCbrfA7qAujrB2SkopWB3XbZMVK3n2741RNQrY5tyVelFxWc0KNyjwBKmX6M6tg==
X-Received: by 2002:a5d:6947:: with SMTP id r7mr199361wrw.510.1642585342629;
        Wed, 19 Jan 2022 01:42:22 -0800 (PST)
Received: from localhost.localdomain ([88.160.176.23])
        by smtp.gmail.com with ESMTPSA id b6sm17927863wrd.17.2022.01.19.01.42.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Jan 2022 01:42:22 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     robdclark@gmail.com, sean@poorly.run
Cc:     linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] drm/msm/dsi: Fix byte clock interface rate for 14nm PHY
Date:   Wed, 19 Jan 2022 10:54:39 +0100
Message-Id: <1642586079-12472-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

According to downstream driver, byte intf clk rate should be half the
byte clk only with DSI PHY verion above 2.0 (14nm):
https://source.codeaurora.org/quic/la/platform/vendor/opensource/display-drivers/tree/msm/dsi/dsi_display.c?h=LA.UM.8.12.3.1#n3991

This change introduces a no_byte_intf_clk_div phy property, used to
control byte clk intf divider.

This fixes DSI sync issues on 14nm based DSI Phy platorms.

Tested with:
    - QCM2290 (14nm phy) + tc358767 DSI/DPI bridge
    - QCM2290 (14nm phy) + lontium lt9611uxc DSI/HDMI bridge

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c         | 5 ++++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      | 1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 3 +++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 428641e..1f8287a 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -172,6 +172,8 @@ struct msm_dsi_host {
 	/* from phy DT */
 	bool cphy_mode;
 
+	bool phy_no_byte_intf_clk_div;
+
 	u32 dma_cmd_ctrl_restore;
 
 	bool registered;
@@ -484,7 +486,7 @@ int dsi_link_clk_set_rate_6g(struct msm_dsi_host *msm_host)
 
 	if (msm_host->byte_intf_clk) {
 		/* For CPHY, byte_intf_clk is same as byte_clk */
-		if (msm_host->cphy_mode)
+		if (msm_host->cphy_mode || msm_host->phy_no_byte_intf_clk_div)
 			byte_intf_rate = msm_host->byte_clk_rate;
 		else
 			byte_intf_rate = msm_host->byte_clk_rate / 2;
@@ -2196,6 +2198,7 @@ int msm_dsi_host_set_src_pll(struct mipi_dsi_host *host,
 	int ret;
 
 	msm_host->cphy_mode = src_phy->cphy_mode;
+	msm_host->phy_no_byte_intf_clk_div = src_phy->no_byte_intf_clk_div;
 
 	ret = msm_dsi_phy_get_clk_provider(src_phy,
 				&byte_clk_provider, &pixel_clk_provider);
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 4c82575..06d2284 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -103,6 +103,7 @@ struct msm_dsi_phy {
 	enum msm_dsi_phy_usecase usecase;
 	bool regulator_ldo_mode;
 	bool cphy_mode;
+	bool no_byte_intf_clk_div;
 
 	struct clk_hw *vco_hw;
 	bool pll_on;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 7414966..f4849e6 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -897,6 +897,9 @@ static int dsi_pll_14nm_init(struct msm_dsi_phy *phy)
 
 	phy->vco_hw = &pll_14nm->clk_hw;
 
+	/* For PHY version <= 2.0 (14nm), byte_intf_clk = byte_clk */
+	phy->no_byte_intf_clk_div = true;
+
 	return 0;
 }
 
-- 
2.7.4

