Return-Path: <linux-arm-msm+bounces-44573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 03543A076C0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 14:11:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C163E188A87A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 13:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6041E21B1BE;
	Thu,  9 Jan 2025 13:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HSeSaT5d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2FF21B182
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 13:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736428146; cv=none; b=NW+EdigMgvVj8zNSJ+BR9/Olx9v+oZH+9gKOCMEwl3GZMiPpwH2iVYH9ICQ4Zd+DbjTd5wLYoH3go5DX7dF3ODXjRRfajsso90C2n9JauOUP47Dlxse3cgHrdmO8uB8Z1in8g3rg59tCaB9rDYN/rPLovN/9vW40mWvPqldUVVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736428146; c=relaxed/simple;
	bh=p0pM/Ev9dlkrsTFP6t4YEadbGlQIQTws2872m+Bd38w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jniND1xJIRy0PQZax+Zum3O9SFT73Vo+5ACwP64dBM6C3m8S4X2ZJcL4YxHVz6VQvxF1DTa187JEtN/f9tsM3OiuIN6qMnKLnRbr3E7TBDnZo65tMhNv/7zdNnxaEGHcbt6ww2DYfa+46T2lEsY+SBeDsHH01IE169/MKMUIZLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HSeSaT5d; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3862a999594so29108f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 05:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736428143; x=1737032943; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IahHGy/Fda2UCFzLYdJQ2xhaS/fkMASiQTTXw59CQ5A=;
        b=HSeSaT5dnAP5cYPui4y/UVja8PEyLg2nCTukLV17LuWzG1S/wpRcrnwJU9Yky3qUid
         zuP9NV3Bw4elxxent8FZSpGR5Yd/aoRUmiI9bt2mF3x1zOHYxAoqbnSpp3uigMaumapp
         HxVckXCQKACTLSCEEyshDAZokGDVlrs6o10fgeWoA9Em+WaLWzoC4o+4Pw8k41cnny2/
         g7rxo7Na167E5A7l+2gDascXFwDguSyPz4zka7zWUJRATcyrRfe4HSBjijqm7kdSPwlX
         OC2epetzDOHqh7y8t+ux83kA/mTtWmnC+XIkobMYJxFLO+VriRIWY4MyLP45mojeIRdE
         vWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736428143; x=1737032943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IahHGy/Fda2UCFzLYdJQ2xhaS/fkMASiQTTXw59CQ5A=;
        b=Mmn3hIuw8XoQeogRIiqg01JCvG1cBLukLaKNDqJYnxd7Mw2jHGhmFlnrpvoO1YoyMY
         sQACqy1tlJHXS9J1hl18m/+WrI0om4Swvud1YCePpkk0n3nZUQO24/L1LuWEiBVhGxc/
         s5cC7KF8VzydX9gp2ucV79rloLsFHSISGh2DSugPZLpi4on1i0pLyjLew2HOS5UAWVCy
         +6xcE+QQNnNLmb21/MYifXziwhlrxi1YKe9CQ3pu0F6gRnI9igzowKGvKGf6A3ZLxzcl
         kFKw8cr+uj4SSSKnh9HMkcjXCiMRriT1SYym6Zs0o4uyAgnIeoDrPRy+t6aRoT6X4fRw
         fD4Q==
X-Gm-Message-State: AOJu0Ywo1k1I0oW6NOlHGD98At8gj4yVKhqntWNvt48qyXrVQn5AR3j5
	82XwSq7IE9l88jOwHzYYUNeqMba8F5RQdNWyhx48HBQhDez/6vjLJev7sTctZ7I=
X-Gm-Gg: ASbGncuj9Ybvyx63uOdCjS+NATGz6Osq/078IBSbVX20fFEjmfgVhG0sr/PWa3bERvT
	rrJ86SKdeYq9Ckj6OGlt+dVkWjG6gwHXFwQax2X/Qb02ZDRTUeaYrXQnHrtLz3+P7tA8g1ZIAAC
	AsoHsCYvE71mpOwmxX2IxGjtEhbKWTDT87lnaSNvaVQyiEs1EU55snLMA702RcUffWsPEZAIGPr
	nTWOiDzSLPYDAtVncA8d9P5RKus6Q1dMDb5adjoMKPgUV9XmTOg0MZRgIUnYi1szv6OLOv9
X-Google-Smtp-Source: AGHT+IGE1BMy5KJxDKlPOGD4A8Ycl/pEB6if3056FBx0nz4EBEvi1JnuU51/p7jeCBNC3L2MT0yt8Q==
X-Received: by 2002:adf:9ccd:0:b0:386:3c21:b1f7 with SMTP id ffacd0b85a97d-38a872f40f3mr1880243f8f.7.1736428142600;
        Thu, 09 Jan 2025 05:09:02 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4b8124sm1789167f8f.81.2025.01.09.05.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 05:09:02 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 09 Jan 2025 14:08:37 +0100
Subject: [PATCH RFC 10/11] drm/msm/mdss: Add support for SM8750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-b4-sm8750-display-v1-10-b3f15faf4c97@linaro.org>
References: <20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org>
In-Reply-To: <20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3130;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=p0pM/Ev9dlkrsTFP6t4YEadbGlQIQTws2872m+Bd38w=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnf8pZiTntv0IcOvcf5zrbYoy4sFGrs4p7XEg7w
 0nTZ5hFSoSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ3/KWQAKCRDBN2bmhouD
 10nPD/4hm/1Edz1IQ80NKbrbj9ML+bSHneNqEwCDZ+3qLdSS3aZ7tmoqA9Tx6SPsEFfqVYXZNdW
 MmqAPZ/pHnCmvlXuE1m1XoKUuqRvN5m3C+WUIESzJMsiMpr+pZ9wg/lUuZd0QneLQOAVznHXCEn
 LlaxalxYnowAfS78FRCCWfEKMwTElNYvUYbzymHEWRrb0tH6f0GKkt20ibdG3FGCyqAf+blTEEA
 qG7JjnZ56Dv0W2dLqpMexCUlvN4lWwBvrB2hfwxuBHNzlZdtU2zsQ6MTQlxEnwhJomFr5hpa2fa
 VZdJt5NJs+tjEdJMEdXSHt0eTYawNyCKi4mpu8J3S2woAolpl2FO0PmG2stnjNd6Run148WtPFJ
 aisSjufD53JSghWAIHlFRLOWudCTLHn9mxn+lZgcqMwC6ZM9Xu3pOfVnmExPTxTMMrZpj/zBSXU
 sIJ5mMZsdbB/dkp9wM1Y4uMeMgLKkCZ5ZbOGisvc+UMD7y67oFrNkLKVbBas0fu04E98Gx0zZIC
 h5i8p0+qK3/XEMj5qDYJMSwnHVfRhLyJ2FGrZgAFzD8ZksGPovlJn8wDcqZdtiONC0c0yoR1LLQ
 ewm344yX7F6jatadtDSnLZ8w/12TIG9eOgUVCgY+TExfU9ucyPj9VOw+TmQKZIgY2IffhPNW4cJ
 tdRo6+oI7itTENw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add support for the Qualcomm SM8750 platform.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 33 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_mdss.h |  1 +
 2 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index dcb49fd30402b80edd2cb5971f95a78eaad6081f..3f00eb6de3a9d2bee7637c6f516efff78b7d872b 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -222,6 +222,24 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
 	}
 }
 
+static void msm_mdss_setup_ubwc_dec_50(struct msm_mdss *msm_mdss)
+{
+	const struct msm_mdss_data *data = msm_mdss->mdss_data;
+	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
+		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
+
+	if (data->ubwc_bank_spread)
+		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
+
+	if (data->macrotile_mode)
+		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
+
+	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
+
+	writel_relaxed(4, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
+	writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
+}
+
 #define MDSS_HW_MAJ_MIN		\
 	(MDSS_HW_VERSION_MAJOR__MASK | MDSS_HW_VERSION_MINOR__MASK)
 
@@ -339,6 +357,9 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	case UBWC_4_3:
 		msm_mdss_setup_ubwc_dec_40(msm_mdss);
 		break;
+	case UBWC_5_0:
+		msm_mdss_setup_ubwc_dec_50(msm_mdss);
+		break;
 	default:
 		dev_err(msm_mdss->dev, "Unsupported UBWC decoder version %x\n",
 			msm_mdss->mdss_data->ubwc_dec_version);
@@ -722,6 +743,17 @@ static const struct msm_mdss_data sm8550_data = {
 	.reg_bus_bw = 57000,
 };
 
+static const struct msm_mdss_data sm8750_data = {
+	.ubwc_enc_version = UBWC_5_0,
+	.ubwc_dec_version = UBWC_5_0,
+	.ubwc_swizzle = 6,
+	.ubwc_bank_spread = true,
+	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
+	.highest_bank_bit = 3,
+	.macrotile_mode = true,
+	.reg_bus_bw = 57000,
+};
+
 static const struct msm_mdss_data x1e80100_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_3,
@@ -756,6 +788,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sm8450-mdss", .data = &sm8350_data },
 	{ .compatible = "qcom,sm8550-mdss", .data = &sm8550_data },
 	{ .compatible = "qcom,sm8650-mdss", .data = &sm8550_data},
+	{ .compatible = "qcom,sm8750-mdss", .data = &sm8750_data},
 	{ .compatible = "qcom,x1e80100-mdss", .data = &x1e80100_data},
 	{}
 };
diff --git a/drivers/gpu/drm/msm/msm_mdss.h b/drivers/gpu/drm/msm/msm_mdss.h
index 14dc53704314558841ee1fe08d93309fd2233812..dd0160c6ba1a297cea5b87cd8b03895b2aa08213 100644
--- a/drivers/gpu/drm/msm/msm_mdss.h
+++ b/drivers/gpu/drm/msm/msm_mdss.h
@@ -22,6 +22,7 @@ struct msm_mdss_data {
 #define UBWC_3_0 0x30000000
 #define UBWC_4_0 0x40000000
 #define UBWC_4_3 0x40030000
+#define UBWC_5_0 0x50000000
 
 const struct msm_mdss_data *msm_mdss_get_mdss_data(struct device *dev);
 

-- 
2.43.0


