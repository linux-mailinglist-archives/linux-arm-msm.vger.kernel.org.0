Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F09C06739EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jan 2023 14:22:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230197AbjASNW3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Jan 2023 08:22:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbjASNW2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Jan 2023 08:22:28 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45548A267
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 05:22:27 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id w14so2835923edi.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 05:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HjnaFfzoum4fVFwQpjzSWANLBAr3dGbDb/tk9McUQSA=;
        b=YlgmdXuKzt+ckoVJ2QvbtV/qEbLLYPA836G//AouOx+X8ghWzymUrdLJ++BIgmkBxX
         eQrZk1rriEh1eHMy6fJs0R5agF5csQygs10/kCEP/5/UDiAtpDckiRPH1kr0zV5jhjCw
         KAmUF7Di7RSMAXRnCOUvCZuhYJkcOa+Nto4//ahihqNlajYw5Rc+daX0CPCup58HPIwj
         fAebC1juX2rGtbqHT2DliJAqnaSl9qlm7q4IGnfTsWoQ5udUGjO1Xa9lWvqJbxD5KCGa
         rZ+Chv00u8CyII9kX6FkCJUUD4duKhSRbO6/KsHGMrglFNfD6GnNyyxUjHT9VT8x/A0w
         x6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HjnaFfzoum4fVFwQpjzSWANLBAr3dGbDb/tk9McUQSA=;
        b=sEyhAG5EpENNRxOKLQZvcrstaeG8K0BK83i4dYZaJL2lplSFc4n7R+eJVpEm/3HHhT
         HmS1xOJHvtvWAQUnDGfybQ0WfZRMzdmdZ65fqMR9yuYARFfJdYtmNpSsjKHwCnOaMAd9
         IyHM5CvWFz+NATXhCBao93o5ZbxxckExWkYsGh74p1dgXwq8BOL8NTU32sep2NH2j9tQ
         GyRH1qKxN/c/600zrDKiv/BfenIJ0+3wKE5p4eir4t2AG9hjCbIgVZAOtk3PwcrwWeBX
         G1UMGwzHoOKe94DxpNOjfX7wjyaD5t+kkQxFM+mwYcDnWP19HObM3oXm+0n67qbu8z36
         n1BQ==
X-Gm-Message-State: AFqh2kotEORrCarn3VQEn0Kxb6TC8qbmSn9PFfVrgbF8sqt4VnhqDl/f
        L0wPI9mua0QGxggKt+L6u0QNzg==
X-Google-Smtp-Source: AMrXdXvSIlyDrGDKQikZpyVd9/i+iDGugeWBGGsAZB7YwtSrGuqX4pZucEnoR94/4rLHjugp9AZAhg==
X-Received: by 2002:aa7:d7d5:0:b0:498:dec8:f41e with SMTP id e21-20020aa7d7d5000000b00498dec8f41emr10740056eds.3.1674134545739;
        Thu, 19 Jan 2023 05:22:25 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id bt16-20020a0564020a5000b00482e0c55e2bsm15532646edb.93.2023.01.19.05.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 05:22:25 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 4/6] drm/msm/hdmi: make hdmi_phy_8960 OF clk provider
Date:   Thu, 19 Jan 2023 15:22:17 +0200
Message-Id: <20230119132219.2479775-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119132219.2479775-1-dmitry.baryshkov@linaro.org>
References: <20230119132219.2479775-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On MSM8960 the HDMI PHY provides the PLL clock to the MMCC. As we are
preparing to convert the MSM8960 to use DT clocks properties (rather
than global clock names), register the OF clock provider.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c b/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
index c3e7ff45e52a..cb35a297afbd 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
@@ -422,8 +422,7 @@ int msm_hdmi_pll_8960_init(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct hdmi_pll_8960 *pll;
-	struct clk *clk;
-	int i;
+	int i, ret;
 
 	/* sanity check: */
 	for (i = 0; i < (ARRAY_SIZE(freqtbl) - 1); i++)
@@ -443,10 +442,16 @@ int msm_hdmi_pll_8960_init(struct platform_device *pdev)
 	pll->pdev = pdev;
 	pll->clk_hw.init = &pll_init;
 
-	clk = devm_clk_register(dev, &pll->clk_hw);
-	if (IS_ERR(clk)) {
+	ret = devm_clk_hw_register(dev, &pll->clk_hw);
+	if (ret < 0) {
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
2.39.0

