Return-Path: <linux-arm-msm+bounces-78968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 86950C0ECAF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 16:06:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86A7418866A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 15:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6CE530EF77;
	Mon, 27 Oct 2025 14:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CyFhS6Cj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9BB30E823
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 14:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761577194; cv=none; b=AHG6MvVRbMOrStQTQXqLosOgc+rFE4Tzt6M/O8an9L36mHyYK7IzHE6KsJWRaGcUAhA+kwzu+00ETB4Se0A5N8QaDR+y+x5YoT+pm5kB6QO3SyfZWUMDxNyqTqOF5UvpVcUeM5Akq+WX1oVs6EOWdlVA53oyFBVhfxjsGaqVCgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761577194; c=relaxed/simple;
	bh=BDhxfQSATkvz5PZ4qM3SXapXE8VjPOJ1bFOc4+xtjJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bKsvL1BrMmq5YX0Mw54uMxn4e1mddCKXRW2WMoZCiH8LbvyqDTTDl3LEJ7/c544wa2hiyUV1pTivz/trxM3LSa5DV63kou+l0WJof/7Q9DoWmszg++qD/Oe1gG6xReF9Z6ngNhY6lDiwmiK35nGX+Vj/nTvIEoq1VZiohi5TlWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CyFhS6Cj; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47109187c32so25579745e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 07:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761577190; x=1762181990; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sxgfIdENtrsIjMM2UdQCTeBKGZOKjcZiEo3cUFxAXcY=;
        b=CyFhS6CjTJxQ15iNbOHgJoeqMj9cvI6N/aw6GA3fTKlIxRbtpPmULLDpi1/e6XnDvh
         Wrbc6Wcua5vdqc8b4LM81tiV1KCxJULb1fxMNUGiAZNYC2A/IlXgQkBIZwgQYxMnHjIA
         Iq0IGOlPNuKPG9ARZvuNxEzLW6LDPcX8I1MPhqsmnkXoyYCwBKMcFJMA1CJeYsHg+0vK
         PyEv6ak2DfAeH2NP99Wp0V4CRPAbpEcr03WT9fXaxSLbeeRVWYDevsFiN9v5Jifg5brK
         ZrJw8VZeQwuCzjBNpWljHAopvW9dYIfEoXzIKX1Y/AmCuDdiAcP21RTS90KBCGJl3YD4
         mQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761577190; x=1762181990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sxgfIdENtrsIjMM2UdQCTeBKGZOKjcZiEo3cUFxAXcY=;
        b=LgXpQZPcxpWYMK9CxpP0ZvEZgU1YNf7oyUWN41Kp7zkiqmHsqWhC4QFZ/HPwlbKxiV
         d0KcKDoYMreGtgo4CmNG2tYTg1cKMQAsQLj0TqzQvyl607QiKtegB8+lmpbP3AJQ17yn
         5F+VCqWxaQVEDxYOrj78u7f/JuNDavyVgqZIDNKD87gZiPR2w/LtsjaSCxEL4ZSOpSrS
         iDM5FAmbYDN+NvHqu8LBALRLIAO96vV58f4YUA9IsEfHK2F3NulDLjGeDd/zCtZB1jvk
         xddmZe1oCHUX2KBvJo0zUcPMyjMdiUsUBClAGfhFqfL4JulhGGEDs6DadWMZ2N7GzAkA
         S9tw==
X-Gm-Message-State: AOJu0YyCzDV3vvVObSq2kRgph0pZPP9hOHIRqKmbMLJnTJDBwolT6+5k
	E+800D9vS/kp2lWPVhiUL86rxxDo5Pr2SXogjNwqczamBNthiRuIWlIpG0yel+QpAt4=
X-Gm-Gg: ASbGncvsw5lEfJEwf9ETmrW8kDhG4HFqmt2kuH15M0HJkwd76v6DJgwDzDuJ8inCnlJ
	D8nBynsittSuVJGH7TvJmXbTstz6VJF+2rrHpfWxNaleLLXXXZrnjtMrK0AqLXI7K4EU9BPblc4
	mv8S+yd7dSmphxTXcDOoM4swMqjItHGAMPZtWID2b8v7fhrIR6TgMQGxa1zK9Sm/ZfgfRn91AtW
	WIXUTArjZPf3clXE0CuVuiaTVTWJa+8uEKmfl4+XRo5k8dxW6RnRHQBifcTSVWFqG8PRn6ze3sF
	Gi3hK6vfSKDZXm2J1N8y8HvUJWKNCpouHpzVAZqeXQn58JRzu+xL18dHLeirKFjn6WnQOxwd2Qk
	069E2i+hE9MRjW+fz9gFDR6HxWfK+MzFaTk42wFPy9PR6IopyXV525E5K3bqZ2NBpSLAMSewSoQ
	==
X-Google-Smtp-Source: AGHT+IFI4cGNdhTLrO5Qc68eGANNKGWaZMi+SP3ROTN0APpf5MvdfI+OdXOP5hYM78+QFJFoWJtOIA==
X-Received: by 2002:a05:600c:621b:b0:46e:48fd:a1a9 with SMTP id 5b1f17b1804b1-4711791fbbbmr291640995e9.33.1761577189636;
        Mon, 27 Oct 2025 07:59:49 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952df682sm14624801f8f.43.2025.10.27.07.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 07:59:48 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 27 Oct 2025 16:59:23 +0200
Subject: [PATCH v3 6/7] drm/msm/dp: Add support for Glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-glymur-display-v3-6-aa13055818ac@linaro.org>
References: <20251027-glymur-display-v3-0-aa13055818ac@linaro.org>
In-Reply-To: <20251027-glymur-display-v3-0-aa13055818ac@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1827; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=BDhxfQSATkvz5PZ4qM3SXapXE8VjPOJ1bFOc4+xtjJc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBo/4jSsNQdfZaJPuhDANBhKWGrGuBai9h3fb5GV
 MTF71NO5USJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaP+I0gAKCRAbX0TJAJUV
 Vm8qD/wNEZMmVJpLmnjuh7sjJSc9hUiNL+mYlGlFqUULl7omP5nSihGm4XLWF0qNFdOx3P84WT6
 UqlANYEjYW2GXOMhs6dbn8jGHwQKpN7rQwWZJEDIWktZfhZ8zwj9FEB+vjz1Ve99neltqNF8pTl
 90iwDmK84agODV99T+u0TmV4vrdaCx+n4H08dwDoimXabcjRAs8REBSw9S2H/NVwOE7syyYD+cY
 ARAiN6jIkkPKB58gFiWg8pa5CsGKFM2Bj3LxROf5nX88iT5LiwBXwP6PgIHd7OuYXhr6BnYONhA
 siLyu645x1ibQ9sHQCT0IjyJQGYHdU27xejBgVirPi2bDhXfK+aRD6yyAHVxaXVma7wRYtN/Vf9
 9iTbegXtr7Bin4b7mD1vin+ve7bDSWJ7AWOoyyfvOXrhwTmj5IAzaPbKiIHNFq5jUSna7ecSie9
 pNXh5FPrEBGBQhEWo7KXEWzYWl9roN2Qa2+ce/u00uzfDbIpiVS2/CsiH4XAWCxpcd5PO78U3Ul
 PqQRVzYex+DAvPqhJkvMu2q8LfMgvq/I7Ii3zQH79uhhA8ayH1IO57Imaiio39bG2C30WAf9iXh
 eNLA8mRxyX9POZyWbX0yEEgxhR845VvyJJADb968LzciDmRR/YMoFjgjoYB3bqQOoCFXjC2tf8o
 snHhBwsIOVs7Ckw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The Qualcomm Glymur platform comes with 4 DisplayPort controllers, which
have a different core revision compared to all previous platforms.

Describe them and add the compatible.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d87d47cc7ec3eb757ac192c411000bc50b824c59..9bd9cd5c1e03cc17598b222177b6682bbcd89f0c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -130,6 +130,14 @@ struct msm_dp_desc {
 	bool wide_bus_supported;
 };
 
+static const struct msm_dp_desc msm_dp_desc_glymur[] = {
+	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
+	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
+	{ .io_start = 0x0af64000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
+	{ .io_start = 0x0af6c000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
+	{}
+};
+
 static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
 	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
@@ -187,6 +195,7 @@ static const struct msm_dp_desc msm_dp_desc_x1e80100[] = {
 };
 
 static const struct of_device_id msm_dp_dt_match[] = {
+	{ .compatible = "qcom,glymur-dp", .data = &msm_dp_desc_glymur },
 	{ .compatible = "qcom,sa8775p-dp", .data = &msm_dp_desc_sa8775p },
 	{ .compatible = "qcom,sc7180-dp", .data = &msm_dp_desc_sc7180 },
 	{ .compatible = "qcom,sc7280-dp", .data = &msm_dp_desc_sc7280 },

-- 
2.48.1


