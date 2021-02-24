Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B3C1324759
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Feb 2021 00:06:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235522AbhBXXGM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Feb 2021 18:06:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234645AbhBXXGL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Feb 2021 18:06:11 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7938DC061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Feb 2021 15:05:31 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id w36so5654367lfu.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Feb 2021 15:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RlKikzIt/rONQFY4pZWTu3Ycq1cfYGrrRaic2XmO02k=;
        b=MzOp94cSmfjpzUawBnjMSye+NAvtXmGFYcpJw12vAjojlYfUUv0Wv2wWyXZBP9Yjg0
         7cJ1Pj76XmGaR9u5QOaIk4Dqh9IhMnY0PJEt356JmFijQQrVlYXs1/hNfZdVSxI7KHLZ
         ZILg+3nxMnwA+TmLtEvlcoQQOmfGSb0BAcpzszhRRp4TnNsrpJYbtOMirN4A7StPWcyV
         Nd1hpgpA7KOjz25aRlKhTowffmA1PnWOyGLsJBCGri9khSEYrO6dclcx5i/xv+Y/1z9S
         upXNXFQSy4bOrUZ12V6ebgkH0ToFg5OkyA5jIHWkImj9KKH8e7Mj+8OCiTKQbb7nmFF7
         nQsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RlKikzIt/rONQFY4pZWTu3Ycq1cfYGrrRaic2XmO02k=;
        b=iH65gz0p9Ix8mqUccB+XSsXtzUtj7+akxkOC5V0ENcCXNZgyabB56WsnFpmjBmo4Qt
         656msuZ7Bho6PlA8uKaPR0dcRsaANz5sT6s1yCRsGiipy2H0FntHmoJ5YCQ1uFwDoPds
         BwKSAcwnzy6bjaI767M0dRp+toloq5DJgMFfLkxmZyxHisKGjmcJ00EURxCOk04BJ50E
         93SYtk+CIl9T3rpSBxN+19nbJ6oRveud3dxW3aiYH3ZpcA2QSc7dvR0ZEVrcoQVvSI+0
         U0xYbVvYCiOaG2Ps+1j7pAEnKUmPW/Ow1Wx1ESW3wJLc/nNVfc67n9rQZhnYoD+w6e22
         Zqwg==
X-Gm-Message-State: AOAM531NBLKN00shBVC7Qna05Gn8K/5xLrXM3z5+0en4Pyd2RGuqSvcF
        byBvHGpFbsMZiKLuDaaTX+Y6Vg==
X-Google-Smtp-Source: ABdhPJwUERX5nQ+xjx77ee9XxWTPYrpU0fvjarXhqh4xrXuFrfdFUwpDWEC4dmNfM9rI7Tn8uVFbBQ==
X-Received: by 2002:a19:ca01:: with SMTP id a1mr186246lfg.372.1614207930020;
        Wed, 24 Feb 2021 15:05:30 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b28sm776114lfo.190.2021.02.24.15.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 15:05:29 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dsi_pll_7nm: Fix variable usage for pll_lockdet_rate
Date:   Thu, 25 Feb 2021 02:05:28 +0300
Message-Id: <20210224230528.1216677-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The PLL_LOCKDET_RATE_1 was being programmed with a hardcoded value
directly, but the same value was also being specified in the
dsi_pll_regs struct pll_lockdet_rate variable: let's use it!

Based on 362cadf34b9f ("drm/msm/dsi_pll_10nm: Fix variable usage for
pll_lockdet_rate")

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
index 0458eda15114..e29b3bfd63d1 100644
--- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
@@ -325,7 +325,7 @@ static void dsi_pll_commit(struct dsi_pll_7nm *pll)
 	pll_write(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_LOW_1, reg->frac_div_start_low);
 	pll_write(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_MID_1, reg->frac_div_start_mid);
 	pll_write(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_HIGH_1, reg->frac_div_start_high);
-	pll_write(base + REG_DSI_7nm_PHY_PLL_PLL_LOCKDET_RATE_1, 0x40);
+	pll_write(base + REG_DSI_7nm_PHY_PLL_PLL_LOCKDET_RATE_1, reg->pll_lockdet_rate);
 	pll_write(base + REG_DSI_7nm_PHY_PLL_PLL_LOCK_DELAY, 0x06);
 	pll_write(base + REG_DSI_7nm_PHY_PLL_CMODE_1, 0x10); /* TODO: 0x00 for CPHY */
 	pll_write(base + REG_DSI_7nm_PHY_PLL_CLOCK_INVERTERS, reg->pll_clock_inverters);
-- 
2.30.0

