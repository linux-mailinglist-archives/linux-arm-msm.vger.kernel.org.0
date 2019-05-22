Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDBA126933
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2019 19:37:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729085AbfEVRhM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 May 2019 13:37:12 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:45159 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727499AbfEVRhM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 May 2019 13:37:12 -0400
Received: by mail-qt1-f193.google.com with SMTP id t1so3355661qtc.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2019 10:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tZML6VkciB7AuKKei7Kqbg+e3K02ODJFh5iugoLa3GU=;
        b=ZqJTTf89H8OWeKKoOJtmynNFXV7rb0e8QnxtvOdBncJjlCKAjY5K6UH3wifhFNrxJv
         ZzgggAfAs3fPRzOXGjd4/ATy83o1+RXlJjPzYFGav7o4ceZ3ecFJgK212EbeR08ZP8Fp
         Gu6ydgPk2bHvWeCaGIfKaK1OTNwD3myVndjGq+fSg1zFMegrAbBGaJFsjntpcNc2GaMy
         1JToWMTj5pmkBFLwKSuoWx6omWw3ELLOOG7g1giTX5hl6YuZebD24oCpGfMq886Le+EK
         EsmBH60VpYZauQbkPDSqVRjqvwuDHIzAME53Cxu34mLZI9yu0GStY03HJk+DEdPmS/dy
         5gtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tZML6VkciB7AuKKei7Kqbg+e3K02ODJFh5iugoLa3GU=;
        b=bzLYZpbTjqvQO4jM7xWZeHiK58tQYl17KwSt7USfK6C/ENuX50Y7g7cNxXjji1wRI+
         MoqCGlRQ6y+gF41XZcxdg3qHER9akSNpFCOb6FToN1GSYwz6cdq5pQVUHuECu+hHT8U5
         FhCuVxnYd+KD+QrR5D2xp2LmHIsjHFvK1ignKpqpDBIlUlrC0KEhXJKWjkGv+W9C2JFT
         oQN6jSEfRuAq9OcXG8r8ff4uul9C5xzIQb/k6YNSmKbX6Wc7uhomjOBqvFYlbuEy6Og1
         obZRONLA7r16HPfvJVxQAgiQ5zCdMQ4SymG3swZUwqZa3wWNFjJsZZRrrjULStHM4nue
         1Y3Q==
X-Gm-Message-State: APjAAAW9sg18cizrQIid2H8C835sp9T1btoQBCwyy1DxcT5IJuHZ/t/E
        R3CRAWpUefHSneDzULHXJRNE+Q==
X-Google-Smtp-Source: APXvYqwACFZKaEuG6C4xoOxKoLMhDaml3NRoW801dp1Y62ESCBRpNtQDuDaIvLMtGBgUu36tBg0bUg==
X-Received: by 2002:a0c:8a8d:: with SMTP id 13mr40433344qvv.88.1558546631511;
        Wed, 22 May 2019 10:37:11 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id w143sm10692969qka.22.2019.05.22.10.37.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 May 2019 10:37:11 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org
Subject: [PATCH 3/5] drm/msm/a6xx: Check for ERR or NULL before iounmap
Date:   Wed, 22 May 2019 13:36:42 -0400
Message-Id: <20190522173656.162006-3-sean@poorly.run>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190522173656.162006-1-sean@poorly.run>
References: <20190522173656.162006-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

pdcptr and seqptr aren't necessarily valid, check them before trying to
unmap them.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 742c8ff9a61c..7465423e9b71 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -504,8 +504,10 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 	wmb();
 
 err:
-	devm_iounmap(gmu->dev, pdcptr);
-	devm_iounmap(gmu->dev, seqptr);
+	if (!IS_ERR_OR_NULL(pdcptr))
+		devm_iounmap(gmu->dev, pdcptr);
+	if (!IS_ERR_OR_NULL(seqptr))
+		devm_iounmap(gmu->dev, seqptr);
 }
 
 /*
-- 
Sean Paul, Software Engineer, Google / Chromium OS

