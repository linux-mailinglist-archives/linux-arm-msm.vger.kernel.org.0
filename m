Return-Path: <linux-arm-msm+bounces-11384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4F185834A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Feb 2024 18:02:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 434DC284E63
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Feb 2024 17:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C329132C1E;
	Fri, 16 Feb 2024 17:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GO3m4Cjh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB97132483
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Feb 2024 17:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708102887; cv=none; b=uP8IhzWWfcjHSMZxPZzNZu2D7RO4lXGkBDjKdJq2dBQHYGNJj4hSdicKsB7UESKjUMaJwiwc160fiQlIHG6NaB6mbPxFptAWHJfaHk3k2lbrRppBQUAQZGgPiO/nfZkRUeQiZ9ftlHX6GyIJFJJlC8gr8s4UtMZmIXD5rp+pp/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708102887; c=relaxed/simple;
	bh=84rmvZDk8zW8CmAQCdqUYugRzCw8mcvg2iteKd1+WTI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sMSZo+a27S5U+Ao/YfsuZwMpYSWrmnmNT/CuAIQ4zGe2xIywec8hM6iNmXAxOKcsaCuHbgPbI3xzflif46+aC5lJhC3fbAyz1ktkXOjUFwWyRGMEwb/Kmk4WodiPCpSM+49itY5j4oe7nRdJAEvb/wye4oc0BylcuuGPIFrGkZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GO3m4Cjh; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5129859c6b3so916689e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Feb 2024 09:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708102884; x=1708707684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TiEpeDDImaOw/7EpXqQxgkCNsM3mPa/vvbsJHlnFxEg=;
        b=GO3m4Cjh9XJ0BoghcPoii/Oc/qH098Zb4zhrPiAoKiQJjAl9W5DiNPUtQWPzYgkJke
         0+qHmiQXKHfmfVU9g8Uoqg19oyBB91CxY4x3ZJVqZnk+8Xof5BwWB9UlFtXMR/BmyLOR
         +ILhaGVnXwGue+0RMlYdsWjEAOHmLjHWPWL7ficj4b7rJiSUiP7t2f+HZDKt36LOFUcI
         bieECdflWFEoTGsoO3wSjZ1iVtPgyw+RjVJg3aS9PAE6nNjPMErOMy94+iDLID29UZhx
         8HVVzf2/C57/XkSpi8EvSkumlGs+oFr8u0KaQ5o7Y9LNFbWjGb1TVAMQU1NmQ8sVJlRa
         pf3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708102884; x=1708707684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TiEpeDDImaOw/7EpXqQxgkCNsM3mPa/vvbsJHlnFxEg=;
        b=RRdW16uLGwHLl1Pd/WU5vFSobvWKY7oqjcbQt6qZyt5Pc320oO/AcijYxpcAzJBHQq
         gQBbMcEztCxWGfQWNoWYbx9MNsMTGxiU0cKkEVvPHgJzaINQHHrJgI7ahNS4C2hO6ZJJ
         q6EaftK1xIa/76AvvrJZo+F9sQ60XEo3vODKXQ1wcT/M8QOtHMD4OWhbQLDAbKYMduLK
         6/2QCcrYl5Ypzvp1cD9vkKSzzF2ypM6sHKnM5s2v0CjBiGVldeZU7wDxbetONM8MXlP6
         4DBAAf1/2WAN1ACH9cAe7XokhXXBjzfYZhXIfPdlOdhdKXnpxpDJ3u4Z0dC553GFQCo5
         /e4A==
X-Gm-Message-State: AOJu0YyCsW0Z1K9Xt/SP9fBWcVmflMgVOZLZk3K8xybQY8XPZ1U3Rd3R
	Z+q94PTYU41zkKC4knjP2Z7wf3kilqbIPqoY3784KTiFVWlXMsiRzdv2WOcMYUc=
X-Google-Smtp-Source: AGHT+IE8Tjchp09XxZHaTZmVANhIcW5m1PAkNqucoJupWuJwPnVGH6GRAKyVCEiT78F8gRWfT2VEXg==
X-Received: by 2002:ac2:5e91:0:b0:512:9a29:1a81 with SMTP id b17-20020ac25e91000000b005129a291a81mr810748lfq.14.1708102884192;
        Fri, 16 Feb 2024 09:01:24 -0800 (PST)
Received: from [127.0.1.1] ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id u20-20020aa7d894000000b00563a6c9fd71sm159706edq.16.2024.02.16.09.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 09:01:23 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 16 Feb 2024 19:01:07 +0200
Subject: [PATCH v3 3/4] drm/msm: mdss: Add X1E80100 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240216-x1e80100-display-v3-3-28b1c33ac8c0@linaro.org>
References: <20240216-x1e80100-display-v3-0-28b1c33ac8c0@linaro.org>
In-Reply-To: <20240216-x1e80100-display-v3-0-28b1c33ac8c0@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1429; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=84rmvZDk8zW8CmAQCdqUYugRzCw8mcvg2iteKd1+WTI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlz5TawkNXFf8B6q+w8cJ6kZXt6czU75fNIjfWe
 S7h6Gw6Y7qJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZc+U2gAKCRAbX0TJAJUV
 VuvRD/4z8UMEJIBQnP1ombhXmaNwnavPDiWb+WUoZcchzehTqQFuOvOd7gUbysgF1BetLgS0fBR
 bO6yAlQY9as5QEB09JCpPqMM8ZM5mdr2RrL0n8F2wBtaIBzlwL9Xfn4kw7FTcLTTws/hX4ALuMa
 ciCS+Fw6gOa9QCFCG94wLQo3BWEJ8WBnzIkN4K3yuhZ/Dd1B0ElfzvGGiR0EIozJe+u0sbHFzcG
 d56O8FaZQotNrHjwqstRaS8VJISvf7ern1/2pvbF/DU5hgVmLMF2tzKiIg+vnJB4sI/y73792yL
 CmRIKriZwzWe8VNlyfyr6bmo5N3EOYR7pU0rXsHQS6VKtwjYRir7dO0wpw9WWSlTO8rUtFRwk4g
 dl3gqxK+fXp0iJPXrDWbHT2osLWWIU4XOXfaa/vSMTlKB+dW7vkXXluONKWE+W51I9KtC96cywl
 kVVIikF8ZkEaCK+EvO0rBmubczFUFqPqrCTiQxR+p2w0QG4IXZyNtLhLM0IBIe44tpaqfOFa+7Z
 tFFosC1TELeeAW+2YEncvg08NlWL8AllQJsneqnirC/dlZYhmPCiw+5wNVyB3PpSE02GtW8xRs6
 IRseXiwYM4AC+tBkkFKS2W7PIqZNTY1oQZqvru/7jaIQDtKyY8QsXCJvQZE6k2R9sZszH9LlF4a
 ZzbVyEAPLeVLYzA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Add support for MDSS on X1E80100.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 35423d10aafa..6eda501e2a1a 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -636,6 +636,18 @@ static const struct msm_mdss_data sm8550_data = {
 	.macrotile_mode = 1,
 	.reg_bus_bw = 57000,
 };
+
+static const struct msm_mdss_data x1e80100_data = {
+	.ubwc_enc_version = UBWC_4_0,
+	.ubwc_dec_version = UBWC_4_3,
+	.ubwc_swizzle = 6,
+	.ubwc_static = 1,
+	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
+	.highest_bank_bit = 3,
+	.macrotile_mode = 1,
+	/* TODO: Add reg_bus_bw with real value */
+};
+
 static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss" },
 	{ .compatible = "qcom,msm8998-mdss", .data = &msm8998_data },
@@ -656,6 +668,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sm8450-mdss", .data = &sm8350_data },
 	{ .compatible = "qcom,sm8550-mdss", .data = &sm8550_data },
 	{ .compatible = "qcom,sm8650-mdss", .data = &sm8550_data},
+	{ .compatible = "qcom,x1e80100-mdss", .data = &x1e80100_data},
 	{}
 };
 MODULE_DEVICE_TABLE(of, mdss_dt_match);

-- 
2.34.1


