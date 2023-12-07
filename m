Return-Path: <linux-arm-msm+bounces-3751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EE2808D99
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 17:37:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51CF41C20AF2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 16:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33EE9481A7;
	Thu,  7 Dec 2023 16:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fX9x1/9e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20E2C133
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 08:37:32 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40b27726369so12752645e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 08:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701967050; x=1702571850; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=irqia8R6fGw+gVdCZPObqSm/BhoAsGfI688KkfIakSE=;
        b=fX9x1/9evezldx6066lfWzi5pKIfgQECUezE0gOXsdG8K+lKjkpqPWGUaa2ri7CrVA
         WO/DYwpNxX+XuzLKYxviT/iDAAl7xY5V8v6JoVrhPZqRPM5wxy3gt/8dyqXoqAM5+Ag6
         eqw7UXZQz3hQ5wZk98XtU4w9sJfVPk46bPBaCGfN7gOfJWNx0+0ScaIpSuRz1BQMd5mT
         t9OyVOQn5ea5qAjuYwZxMb7dEBTvNvAxeQ5KoKJsP47tOe2vr5wd747yDH3vQBDtU2Vf
         yKJLgzwPPW9vP2rWxYZQJk1mCNW2LuIdHJ/jEkoAUVzvFpSA8Ke3dpFcxl6MSKnuOodN
         oyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701967050; x=1702571850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=irqia8R6fGw+gVdCZPObqSm/BhoAsGfI688KkfIakSE=;
        b=cES8EuBSzgOF43UbQvKTaJerU8sUQgH2T6uXg84zukHVndhVD5H8ToqrImcINLVVvK
         TmBqB+p+3FjwU6uL+l9TxQA60DuYZrIXwyqJsJO6vUfDkhYdpPlii0XtGyHqqixENiGO
         laMSsTXtNiMbo5L/nez/SU86IQbQihxN6LRvsBYXEESJ2C8VStMq50P+kPxqnYJSVqvk
         F5TU+ZVthxquMlQzaqBL1PZepIamJWHjo2NAdYEHQOQcJE3f9vtl/P1W3cih+Cglb8E6
         07LYdacWlV+yWFkAOXv6VBxScsfCDIUMo/E7O+yqpJDrdGzPTeSE8grzLyEQ8/XbAmN9
         S+yg==
X-Gm-Message-State: AOJu0YyoTTSyidqlbwmG16RObm+WHuAnIQ1SSF1kW7QVYzjcdKOf3Es8
	SIPTr5LhEDqleOF9h2l+2v2FlA==
X-Google-Smtp-Source: AGHT+IHMS/gd/XK1hnTjye0u6FJVczbf/wcZbbi+0BQsKGN+SRrXd9ba1C8zxyC14ryCDBNMElvbMA==
X-Received: by 2002:a05:600c:1686:b0:40c:258d:2f01 with SMTP id k6-20020a05600c168600b0040c258d2f01mr1274196wmn.105.1701967050473;
        Thu, 07 Dec 2023 08:37:30 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id r5-20020a05600c35c500b004080f0376a0sm175424wmq.42.2023.12.07.08.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 08:37:30 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 07 Dec 2023 17:37:18 +0100
Subject: [PATCH 2/3] drm/msm/dp: Add DisplayPort controller for SM8650
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231207-topic-sm8650-upstream-dp-v1-2-b762c06965bb@linaro.org>
References: <20231207-topic-sm8650-upstream-dp-v1-0-b762c06965bb@linaro.org>
In-Reply-To: <20231207-topic-sm8650-upstream-dp-v1-0-b762c06965bb@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1359;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=pN1DcwJDKt86C9TW3cEpaDhQ15k1t6TN12ykZTFzySY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlcfTGbloDh694L9Md9HCAYNQJZjwBRUQhOoTt+iAP
 0zEYWiGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZXH0xgAKCRB33NvayMhJ0fYLEA
 CbsGLaMiwD1kcwOST8v4C5TMqPU9pPOI+dae+FGp34VtT1Ga+UMXEDs5zNpZl9E5BFudRGsrOjTi/l
 yoygODhsUN8cCR8aJdrVC3MqnyPL8wF+GNbNLtNlO9ONfnbq2Rt6NEWSujGJH2t4t+ewJFT3KoBQTN
 U3+TGwtxrfgjvRj0mHxvCbugSg/wZTc/aoNRLHWK/P4LCcfy6AHXzqzVllW5Dzx2Zo8cWCAzqAX+/J
 fo75TfqW1BaDzpZGR7QFGB7Ovk78gBZkXTm3nfQhzpjomDIkLE9/BoSA9NtBd4sKCnQ+ERRqd43/nW
 d9JuIs7UM0Y5KoZclVi+plusRPprD49neLDk1PG735Qcbm7dhxUxlFdhfr3uuUVarB8GFMlfUFPswe
 18TF1P/3qxt5YJb8caSK9+Jm4IKXknvPsTpYO2LsHBmRFBmUwh7oneZ+gHlpTcJJt+zZxzSFnk2tDM
 R6xxTv7Bvohw1e8HcSA3celeOcEndHbbWOfNRpchoyGvJr3NQS/+EvwhfKHcMd20HZbZrdZm3jD3Hq
 dAppg8+2HZEJYBbHvl6zjCONoavtRs07X2OhP/X7tz5jI4QCttG636AdmsvMzQaChwhvkZ/e9csB1Z
 C6yWedHpThENBtF9oobuWrGoFcdkSc23gENibredkt2w/S3yYHPC8SF1HISg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The Qualcomm SM8650 platform comes with a DisplayPort controller
with a different base offset than the previous SM8550 SoC,
add support for this in the DisplayPort driver.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index b57ff6c3215d..923517046ab6 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -168,6 +168,11 @@ static const struct msm_dp_desc sm8350_dp_descs[] = {
 	{}
 };
 
+static const struct msm_dp_desc sm8650_dp_descs[] = {
+	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
+	{}
+};
+
 static const struct of_device_id dp_dt_match[] = {
 	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_descs },
 	{ .compatible = "qcom,sc7280-dp", .data = &sc7280_dp_descs },
@@ -178,6 +183,7 @@ static const struct of_device_id dp_dt_match[] = {
 	{ .compatible = "qcom,sc8280xp-edp", .data = &sc8280xp_edp_descs },
 	{ .compatible = "qcom,sdm845-dp", .data = &sc7180_dp_descs },
 	{ .compatible = "qcom,sm8350-dp", .data = &sm8350_dp_descs },
+	{ .compatible = "qcom,sm8650-dp", .data = &sm8650_dp_descs },
 	{}
 };
 

-- 
2.34.1


