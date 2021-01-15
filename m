Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 571962F7121
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 04:46:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730630AbhAODpC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jan 2021 22:45:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732645AbhAODou (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jan 2021 22:44:50 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62E67C061793
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 19:43:35 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id w1so5579807pjc.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 19:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N02fXbKOI7v6bUS+6ErTrlEXeCZ9jXtdBRasx3q08w0=;
        b=mKunPSwe5cY8Jq+pZp/q/jWVNLm6J/94C7SlgZ1saNZD+u179Yg5eJLEWVwdN9ac6T
         3UmexIt33g2zin8AqRYNL7+wPKLVZ2mGBcaI3VL4hswRnnaw6f5zEbVTAnUJ93GwBA6q
         jKW2LWlcA+zSMTCRInUKsnLh/PSkLcstavtt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N02fXbKOI7v6bUS+6ErTrlEXeCZ9jXtdBRasx3q08w0=;
        b=D86NjX7n6Fkzo21hms1vWtH7uLGiMsriCXqE8P5jadiv/RSFYnUF6YxsmJyxV5YYaz
         Yn7hNlPQnlmiOVJ63a/IFEbAxfnz0fxuw9t4bRbrFc6eL3WJ25BMwrrk8hSOPJ8lK63V
         gBNT2aDnePbEIFMLndbUfUYZ1P6KqfM+9ChUSX2lTEXOcdBnBPFcFOmZXV/kuWKqAHD/
         Sx6N7Bylf1sSRW8awh9MHoKI+mcMv92qs2YkIj9uwE5fd4s61NNYT4BykQxdmd3WxfqW
         FeNVXZadYRtztV/QWZ78hzbme8Kqr7p96lxkWNDAX4zII0NP8uqg9sG+UQL3qzTwh3jH
         VR0w==
X-Gm-Message-State: AOAM5319I280li92S6GA+JWwTHeoHTzC6Cq3VYZfZQHzeR8Ir+X/NwTZ
        wKxX2fTeNoXy0yJppkrH8p0mYQ==
X-Google-Smtp-Source: ABdhPJwONZ49KttbKspvQKQ84ZbdgIuIs4XUSlLwyr+p6TbSHNrMDViOQjMd8t54JjJoO3hLbKGLWw==
X-Received: by 2002:a17:90a:bb8c:: with SMTP id v12mr8330161pjr.227.1610682214983;
        Thu, 14 Jan 2021 19:43:34 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id u12sm6499062pfh.98.2021.01.14.19.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 19:43:34 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, Patrick Lai <plai@codeaurora.org>,
        alsa-devel@alsa-project.org,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
        Srinivasa Rao <srivasam@codeaurora.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Cheng-Yi Chiang <cychiang@chromium.org>
Subject: [PATCH 4/4] ASoC: qcom: Remove duplicate error messages on ioremap
Date:   Thu, 14 Jan 2021 19:43:27 -0800
Message-Id: <20210115034327.617223-5-swboyd@chromium.org>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
In-Reply-To: <20210115034327.617223-1-swboyd@chromium.org>
References: <20210115034327.617223-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We don't need to print an error message when these ioremap operations
fail. The function that returns an error already prints an error message
and properly attributes it to the device. Drop them to save some code.

Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Cc: Srinivasa Rao <srivasam@codeaurora.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Cheng-Yi Chiang <cychiang@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 sound/soc/qcom/lpass-cpu.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index b267fe8db3fc..0ca957dcd3fe 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -788,11 +788,8 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-lpaif");
 
 	drvdata->lpaif = devm_ioremap_resource(dev, res);
-	if (IS_ERR(drvdata->lpaif)) {
-		dev_err(dev, "error mapping reg resource: %ld\n",
-				PTR_ERR(drvdata->lpaif));
+	if (IS_ERR(drvdata->lpaif))
 		return PTR_ERR(drvdata->lpaif);
-	}
 
 	lpass_cpu_regmap_config.max_register = LPAIF_WRDMAPER_REG(variant,
 						variant->wrdma_channels +
@@ -810,11 +807,8 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-hdmiif");
 
 		drvdata->hdmiif = devm_ioremap_resource(dev, res);
-		if (IS_ERR(drvdata->hdmiif)) {
-			dev_err(dev, "error mapping reg resource: %ld\n",
-					PTR_ERR(drvdata->hdmiif));
+		if (IS_ERR(drvdata->hdmiif))
 			return PTR_ERR(drvdata->hdmiif);
-		}
 
 		lpass_hdmi_regmap_config.max_register = LPAIF_HDMI_RDMAPER_REG(variant,
 					variant->hdmi_rdma_channels);
-- 
https://chromeos.dev

