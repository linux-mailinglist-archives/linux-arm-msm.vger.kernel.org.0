Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9485454F580
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jun 2022 12:36:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380840AbiFQKgV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 06:36:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230341AbiFQKgU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 06:36:20 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 050D46AA6F
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 03:36:20 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id c4so6264891lfj.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 03:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ehJ1FDrt934m71egzidi3dn4Z02wK65douizV/opsWo=;
        b=z79ORX0B2DG0WrKHIrtYGnr8wOwlKxv4xsaBo4JFTQc4qQmfeSf2gVd1WkwwxDSOQa
         qQvEuLg36Hlv6KRFC7PyW2qJzglgB5PqFHd9VxY+IrzwcqOVzt/fBkVaum8YNytMOJ75
         egZEaoWAnBwzyQtbegQ0u+OuekCffMbqGTCTLb7BDFmbtb4NJehNKGhMw4VzV4SMOZPi
         IxMkR7A7GcVQpx5zpRU+SyKCfCjki2cbs2gnIWJz+vg3+vyuKLepD38aBh/N18CEZVAK
         u+1DXxI42JAy4mu4jiSHhtv+IQvJ5juK1+r/dv+xHFe7nUD7wk/zy07+MOBJ6ly1kE+G
         /ZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ehJ1FDrt934m71egzidi3dn4Z02wK65douizV/opsWo=;
        b=OmnOGPb+X5qc+sPfZqcFE0OfNFVB2lDGC4FZwfDQ5dnCE67z0+L2/6vCLlL+Kp2qKg
         novkaQrTLH7z4RWWlSs+v13GFvBXXMcaiJ/ayJpV3d4mi/3QlwLgPXW1hOwwi5gA00Rp
         wz75uKrVuPFovRJfGO1Cq1bl4ljMmswTnIV3Zl41mrlfUwmTnIT+lUlIoQw9rhTn5KC0
         QdEEwHsiLysaADu2Qbk99UoF9Dq0O0x+yL6Bmm0l/628wmdI3ql6utZEe2qVuZDAfjIc
         pbhlDiwlNOiFpwUexp9k9N55zkrAC29O1iCOkrHVLT5NUp7ieIWiUCU8o+qfS7PGBC+1
         3q4g==
X-Gm-Message-State: AJIora8Hb5UGdAsRXFsMlEXADY5lq1+Jga5u3pilAdX00FIEkJgqShi2
        d+AJWri4KEiagf7/UhVOSRmAfw==
X-Google-Smtp-Source: AGRyM1tolUPsyooXC8CKG0Qb9ywl2kd818tLY9kYd7mx7VhHgEdlvr9dZjbttKc3d4gGijpPelmF5Q==
X-Received: by 2002:a05:6512:281:b0:478:f324:6c0c with SMTP id j1-20020a056512028100b00478f3246c0cmr5236328lfp.287.1655462178370;
        Fri, 17 Jun 2022 03:36:18 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d3-20020a056512368300b00478ff020832sm591803lfs.106.2022.06.17.03.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 03:36:17 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Vinod Koul <vkoul@kernel.org>,
        linux-phy@lists.infradead.org
Subject: [PATCH 2/3] drm/msm/hdmi: make hdmi_phy_8996 OF clk provider
Date:   Fri, 17 Jun 2022 13:36:07 +0300
Message-Id: <20220617103608.605898-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220617103608.605898-1-dmitry.baryshkov@linaro.org>
References: <20220617103608.605898-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On MSM8996 the HDMI PHY provides the PLL clock to the MMCC. As we are
preparing to convert the MSM8996 to use DT clocks properties (rather
than global clock names), register the OF clock provider.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
index b06d9d25a189..cfb83e9dd810 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
@@ -707,8 +707,7 @@ int msm_hdmi_pll_8996_init(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct hdmi_pll_8996 *pll;
-	struct clk *clk;
-	int i;
+	int i, ret;
 
 	pll = devm_kzalloc(dev, sizeof(*pll), GFP_KERNEL);
 	if (!pll)
@@ -735,10 +734,16 @@ int msm_hdmi_pll_8996_init(struct platform_device *pdev)
 	}
 	pll->clk_hw.init = &pll_init;
 
-	clk = devm_clk_register(dev, &pll->clk_hw);
-	if (IS_ERR(clk)) {
+	ret = devm_clk_hw_register(dev, &pll->clk_hw);
+	if (ret) {
 		DRM_DEV_ERROR(dev, "failed to register pll clock\n");
-		return -EINVAL;
+		return ret;
+	}
+
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &pll->clk_hw);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "%s: failed to register clk provider: %d\n", __func__, ret);
+		return ret;
 	}
 
 	return 0;
-- 
2.35.1

