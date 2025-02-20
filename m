Return-Path: <linux-arm-msm+bounces-48588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CDCA3D03A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 05:00:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC39517A181
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 03:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93B071E1C36;
	Thu, 20 Feb 2025 03:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q2jjsEh2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8677D1DFE3A
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 03:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740023976; cv=none; b=IoTBYAgM0O6Hhfvk3Q/kTeUo1knf7PYluumd2puZjTsARzS95qyhkP/DcVCba8Ir519DhvdVwASEeXW9Juw/p+37L0+CDX0RAKr7GAaBEdQJjER/dzuRwwe311/sB3GxvLZ+I+DcbwC6oDFU2wn8PxflWAJRxzsedKIlorWZbyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740023976; c=relaxed/simple;
	bh=nf1990nbPRPUmWhyQS4UntyiUuMTRclKGAirmxmgwtE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aSucbP6KX52hEpV5iJsXrgpt3LsWBva5JknEfOCiR11+bgJuv3oiHfIqWyOoZmDsYVY1A3BycTKzo76UmcWu4S0OwIfmE6kue2QE0IFMQBnzHF26vgHVX+BUidfxoJnjd+RCf4CiktL+0Y8VGBUlE5m9Fkm6DF7ZQ1NH8/2sYcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q2jjsEh2; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5461f2ca386so472170e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 19:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740023972; x=1740628772; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j2pZmceZvEXbNiDq1E7KLAfqLw7wNQqTqrfWu6Knqbo=;
        b=q2jjsEh2RLjZmMhzyKgXpqcKogo/7YGPPiJvqKNmzNxSYOP3FeOqrtK+512U5GFsHW
         EKKTcJxf32ih4SKbDcEzbEc8+M5sGcR6HXTKP7oaLTiNbPzgiV1b000xhJPAmOwNVpCG
         tVuT0FlScDNBxnh34JwTcrhbggvKnDQXxuXTZGDUPFQvIfFC+LiQn04S2BV4iLjZJWCY
         7ww9rSSF76yftsw8jzinGI4HB4/O6IxcrNu5Ad7fPqg8zoh6ShIvJ/N2oIXHd8r+BjmO
         IUU/s1JHI3EQH9C7MCzUO6Y5w8EgmyfrUCLDKnoNL3No8QKqist1fMsD0oDO6dLIzRIJ
         ybXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740023972; x=1740628772;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j2pZmceZvEXbNiDq1E7KLAfqLw7wNQqTqrfWu6Knqbo=;
        b=AdLbDzl4VP8+UkLaR0crfXybhNcZz7S7TOtHQCS57IMs8Ex+qMT4thIPccClQH3RRQ
         Ta2qK/LcofOrsE8q3Vzemm0sBBBr5croC8tjL8lsRmuzQ9HVhCLQ+wQDkyyTkphN2U+D
         fuk4/iUthlwPdW/qsXzjqXdzXzR/jbxBV/VrOkpGLBnjfYcoelaCnXQnmwjJGLRNu8sn
         UAEN2y7fwl4mbs5xZK2I7rV10oHLXn2JWn/GUi3hZRjCpT1rzj2YRGF1TxQ89tuKpizK
         4yRLjz+zUhUW7iyyOELf/DYCp7VvbTFOu7K8zyhZ6O3ERN3nEk3Ml23+BDPbw+nRhgTR
         WfjA==
X-Gm-Message-State: AOJu0YyoO3VYDu8z6k336lG/sriJj495BiNouQpA/TMajaIUyfjXshOS
	mfZZx6BzHcVVtmaeOyS/vC1NBU/rucIGTycovDr/5RRCXhyn38uhV3qeOxvpC+s=
X-Gm-Gg: ASbGncteoTOxyTkQ50P9Q/TCFENnbvUSAMggP+4JaiE5nqV8845Q8x51fNmVVYkAo2a
	/lC/lZUGtojEVapCqxaiF01f0fMb/9kvDBv91uC4umYvxvEqjhjIsGMvlVNFasmV0r5tYGhV4Eu
	QgCQB92pVzTOMv+lFcOlnZA1hLNGgG61GAyjADRBjysQ9gFFHmeCXyxeP4k/UD33FtsKuhEm3rv
	v3ZQGd74nCKQFcWCcaDTx77gEgUu3jObow7sSvznAMStYYzoo1ENepmC4j8q2TyKqq5fuu0sjEw
	saQAYbf+/Y+/J5HNSg7as18=
X-Google-Smtp-Source: AGHT+IGk9aAQ5Qp3H6XQfrsAQd91nSzvDsbfoGQxixgjlM46VhY/y1A9U6xZYuAp9drjT2otPqTnxw==
X-Received: by 2002:a05:6512:2398:b0:545:2c86:17e6 with SMTP id 2adb3069b0e04-5452fe2f270mr7487945e87.5.1740023972498;
        Wed, 19 Feb 2025 19:59:32 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-545225f22ebsm2143909e87.16.2025.02.19.19.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 19:59:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Feb 2025 05:59:23 +0200
Subject: [PATCH v2 2/5] drm/msm/dpu: enable CDM_0 for DPUs 5.x+
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-dpu-add-cdm-v2-2-77f5f0df3d9a@linaro.org>
References: <20250220-dpu-add-cdm-v2-0-77f5f0df3d9a@linaro.org>
In-Reply-To: <20250220-dpu-add-cdm-v2-0-77f5f0df3d9a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7830;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=nf1990nbPRPUmWhyQS4UntyiUuMTRclKGAirmxmgwtE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBntqidQBMNbpenHJCJuqAz5esVnj6GyGf2kOiU+
 xAvlmkq+M6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7aonQAKCRCLPIo+Aiko
 1bThCACB9GoLVESwKD9dNmVVDT3uPQj6KJvTP4Ozi9KZXH9LDOLwQGNsI4QAaz/CbGemn7GETtD
 tdHfOaGQ5MZkLxQilqTrQ1AB8XHkbYQRgAhNHGFIO2leAZVJpkWH3z2QWFJIcL95die0FnEWv8L
 GfryW0QVTruxHuHf4damQhpkhzZ+9sbuKXz0nosWWnHFfhXEuITQAx0e2EGsSK1pQflY2cB86al
 9nwhpz7DtELsAI7hSW82RdrxMI6PQK/UQnJ2uL4jrHyagyuQ382zdHg02CCRjIzONLKAshz5VJ3
 m6xfruYZpIDSI2fFKXGSkGBpQHc6s4dTq3TLZ+HP1+y5c6OE
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Enable the CDM_0 block on DPU generations starting from 5.x as
documented in the vendor dtsi file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h  | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h  | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h  | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h  | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h  | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h  | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h  | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h  | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h  | 1 +
 11 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index bcb39807fe61e231d6e318d8729ed86f213fb06a..85fde7243dd4d011ed1e3a5719fd6c98cf7d6e77 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -452,6 +452,7 @@ const struct dpu_mdss_cfg dpu_sm8650_cfg = {
 	.mdss_ver = &sm8650_mdss_ver,
 	.caps = &sm8650_dpu_caps,
 	.mdp = &sm8650_mdp,
+	.cdm = &dpu_cdm_5_x,
 	.ctl_count = ARRAY_SIZE(sm8650_ctl),
 	.ctl = sm8650_ctl,
 	.sspp_count = ARRAY_SIZE(sm8650_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 36cc9dbc00b5c1219e1aa557dd4ee0e801b5c9e7..23188290001ffb45563a9953a9f710bacb4dac89 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -388,6 +388,7 @@ const struct dpu_mdss_cfg dpu_sm8150_cfg = {
 	.mdss_ver = &sm8150_mdss_ver,
 	.caps = &sm8150_dpu_caps,
 	.mdp = &sm8150_mdp,
+	.cdm = &dpu_cdm_5_x,
 	.ctl_count = ARRAY_SIZE(sm8150_ctl),
 	.ctl = sm8150_ctl,
 	.sspp_count = ARRAY_SIZE(sm8150_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index e8eacdb47967a227567a96a85a93a69befbb00d5..de8ccf589f1fe026ca0697d48f9533befda4659d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -414,6 +414,7 @@ const struct dpu_mdss_cfg dpu_sc8180x_cfg = {
 	.mdss_ver = &sc8180x_mdss_ver,
 	.caps = &sc8180x_dpu_caps,
 	.mdp = &sc8180x_mdp,
+	.cdm = &dpu_cdm_5_x,
 	.ctl_count = ARRAY_SIZE(sc8180x_ctl),
 	.ctl = sc8180x_ctl,
 	.sspp_count = ARRAY_SIZE(sc8180x_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index 2fe674d1e05988f39f66a01fedee96113437ea65..b2ebf76e386718b95292e119d53e67f5d9f0743a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -309,6 +309,7 @@ const struct dpu_mdss_cfg dpu_sm7150_cfg = {
 	.mdss_ver = &sm7150_mdss_ver,
 	.caps = &sm7150_dpu_caps,
 	.mdp = &sm7150_mdp,
+	.cdm = &dpu_cdm_5_x,
 	.ctl_count = ARRAY_SIZE(sm7150_ctl),
 	.ctl = sm7150_ctl,
 	.sspp_count = ARRAY_SIZE(sm7150_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
index d761ed705bac30d9ffef3c0c9140e5e8a5e930ad..9ac4086b69938799dfe861172f0aec25ee0186f3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
@@ -232,6 +232,7 @@ const struct dpu_mdss_cfg dpu_sm6150_cfg = {
 	.mdss_ver = &sm6150_mdss_ver,
 	.caps = &sm6150_dpu_caps,
 	.mdp = &sm6150_mdp,
+	.cdm = &dpu_cdm_5_x,
 	.ctl_count = ARRAY_SIZE(sm6150_ctl),
 	.ctl = sm6150_ctl,
 	.sspp_count = ARRAY_SIZE(sm6150_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index 76f60a2df7a890c5346fe248d67d646ade574fe4..cc2951112bdadca60fe51faeecb81e57280662c3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -216,6 +216,7 @@ const struct dpu_mdss_cfg dpu_sm6125_cfg = {
 	.mdss_ver = &sm6125_mdss_ver,
 	.caps = &sm6125_dpu_caps,
 	.mdp = &sm6125_mdp,
+	.cdm = &dpu_cdm_5_x,
 	.ctl_count = ARRAY_SIZE(sm6125_ctl),
 	.ctl = sm6125_ctl,
 	.sspp_count = ARRAY_SIZE(sm6125_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 7382ebb6e5b2a0c1190e914fb593da93879c0d9a..42a00550eefbc10e97515340d6d8b33d4ef5e3fd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -204,6 +204,7 @@ const struct dpu_mdss_cfg dpu_sc7180_cfg = {
 	.mdss_ver = &sc7180_mdss_ver,
 	.caps = &sc7180_dpu_caps,
 	.mdp = &sc7180_mdp,
+	.cdm = &dpu_cdm_5_x,
 	.ctl_count = ARRAY_SIZE(sc7180_ctl),
 	.ctl = sc7180_ctl,
 	.sspp_count = ARRAY_SIZE(sc7180_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index 0502cee2f116e8ce24a0daf995f46b1d693aacaa..828a02429405238807562dd0aa29575f8367fdc7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -222,6 +222,7 @@ const struct dpu_mdss_cfg dpu_sm6350_cfg = {
 	.mdss_ver = &sm6350_mdss_ver,
 	.caps = &sm6350_dpu_caps,
 	.mdp = &sm6350_mdp,
+	.cdm = &dpu_cdm_5_x,
 	.ctl_count = ARRAY_SIZE(sm6350_ctl),
 	.ctl = sm6350_ctl,
 	.sspp_count = ARRAY_SIZE(sm6350_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index f7c08e89c882038aa658955ca1202bda3d928e80..795e9ebf8c11dcc7d7cae7444fc3e386ced5792d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -396,6 +396,7 @@ const struct dpu_mdss_cfg dpu_sm8350_cfg = {
 	.mdss_ver = &sm8350_mdss_ver,
 	.caps = &sm8350_dpu_caps,
 	.mdp = &sm8350_mdp,
+	.cdm = &dpu_cdm_5_x,
 	.ctl_count = ARRAY_SIZE(sm8350_ctl),
 	.ctl = sm8350_ctl,
 	.sspp_count = ARRAY_SIZE(sm8350_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 08742472f9cc812fbaf8f842ff7bd78f597e2b8d..048dfb9dbb601bdbbf6a1326a7af8680f2777b5d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -412,6 +412,7 @@ const struct dpu_mdss_cfg dpu_sm8450_cfg = {
 	.mdss_ver = &sm8450_mdss_ver,
 	.caps = &sm8450_dpu_caps,
 	.mdp = &sm8450_mdp,
+	.cdm = &dpu_cdm_5_x,
 	.ctl_count = ARRAY_SIZE(sm8450_ctl),
 	.ctl = sm8450_ctl,
 	.sspp_count = ARRAY_SIZE(sm8450_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 4d3787fceb72fb3641057a7ea04ae6503b671042..a5b90e5e31202900c0bb5bc4a705a6b269005474 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -407,6 +407,7 @@ const struct dpu_mdss_cfg dpu_sm8550_cfg = {
 	.mdss_ver = &sm8550_mdss_ver,
 	.caps = &sm8550_dpu_caps,
 	.mdp = &sm8550_mdp,
+	.cdm = &dpu_cdm_5_x,
 	.ctl_count = ARRAY_SIZE(sm8550_ctl),
 	.ctl = sm8550_ctl,
 	.sspp_count = ARRAY_SIZE(sm8550_sspp),

-- 
2.39.5


