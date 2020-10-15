Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C5BD28F921
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Oct 2020 21:03:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391443AbgJOTDo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Oct 2020 15:03:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391439AbgJOTDo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Oct 2020 15:03:44 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 444D8C061755
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2020 12:03:42 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id z2so4867589lfr.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2020 12:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IyCk1ZWUW2yfST0VQTlsdKN7P4gFoDnnFZaxUhGVXFk=;
        b=udF8VfgwCPwP4mDSZHxOTUeoZ+UKdrud+AcDZ7nGlDNmOij56qY7u6O/vOUfoLAlLx
         q99/2Tu5CSl5pBIWShz33MD1FCWuvWmBO5h3je6KlwzUpF/SQJr9V+V3DAvWEkKWW3b9
         WXIMDkzbL8BFrJ+3LB5TtdMWnsVDgd+wsJIf4or0/zGTngtWrgcjm1P3wUSsXEgOjBA2
         2rYOfe1kAZgFvou5mdtN9j5VnZ9QFx0/JSBvjaOkQjGi7f0+YxslntsR+nK1V6HOUifD
         oDfCAXjQa6YSU34Kg5a3WPLBYvNRf8wokKH7+/BARxjlxj4y/hhmo0q8dOqWPvqsTIoz
         eyvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IyCk1ZWUW2yfST0VQTlsdKN7P4gFoDnnFZaxUhGVXFk=;
        b=f+tAfwoQj6ftHRInEF8fw1RR4LJpKJRQMs7A+waw79lxdgniEmwW5v8NVYfqHEIsYg
         Dkow8c06kffLbrL5/qAlob4hT8AHWZCau0qZPwygvJXYtcvNIsCiyKym+s5BcUceg1Yp
         gaMT3qamyhboYU/ua2C/aGdv+U7eNvsi+V7N1d5fZMwaoeTTme/bkLJxxkSBBhiR2Y0A
         4bJQIwdEpdtUNzLqXoy6N1X2CQv95x7aBvtXuDnrg5TPM+AemtZWhs4iPxUMxtP45p7U
         acPz4EbWG58YGi5ObkJkU+IKmpoAlAINPzE8jAhIIbhXvheOPheAAnp+fYjU/sIhcauy
         gTrQ==
X-Gm-Message-State: AOAM531B46oUg99LIwJvfKZPtuE5WyOtgzt7ggrUExjHq5ql1tHw//rm
        TM8lDC7J9V4o5j42VjAHo7r+ww==
X-Google-Smtp-Source: ABdhPJxdJHhhA2b0ocyLA0V5KO8bb02eV68EYMcbBlYFjsRhr+aGrSQz9/7RsEN90Os+Uk1n7bdfyA==
X-Received: by 2002:a19:514:: with SMTP id 20mr14877lff.512.1602788620693;
        Thu, 15 Oct 2020 12:03:40 -0700 (PDT)
Received: from eriador.lan ([94.25.229.2])
        by smtp.gmail.com with ESMTPSA id 71sm1309781lfm.78.2020.10.15.12.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2020 12:03:39 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Harigovindan P <harigovi@codeaurora.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 3/4] drm/msm/dsi_phy_7nm: implement PHY disabling
Date:   Thu, 15 Oct 2020 22:03:31 +0300
Message-Id: <20201015190332.1182588-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201015190332.1182588-1-dmitry.baryshkov@linaro.org>
References: <20201015190332.1182588-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Implement phy_disable() callback to disable DSI PHY lanes and blocks
when phy is not used.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 255b5f5ab2ce..79c034ae075d 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -200,7 +200,28 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
 
 static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
 {
-	/* TODO */
+	void __iomem *base = phy->base;
+	u32 data;
+
+	DBG("");
+
+	if (dsi_phy_hw_v4_0_is_pll_on(phy))
+		pr_warn("Turning OFF PHY while PLL is on\n");
+
+	dsi_phy_hw_v4_0_config_lpcdrx(phy, false);
+	data = dsi_phy_read(base + REG_DSI_7nm_PHY_CMN_CTRL_0);
+
+	/* disable all lanes */
+	data &= ~0x1F;
+	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_CTRL_0, data);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_LANE_CTRL0, 0);
+
+	/* Turn off all PHY blocks */
+	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_CTRL_0, 0x00);
+	/* make sure phy is turned off */
+	wmb();
+
+	DBG("DSI%d PHY disabled", phy->id);
 }
 
 static int dsi_7nm_phy_init(struct msm_dsi_phy *phy)
-- 
2.28.0

