Return-Path: <linux-arm-msm+bounces-77201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DA88BBD9695
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 14:41:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 02ACD5018D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 12:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 712CE314B95;
	Tue, 14 Oct 2025 12:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OtiKkKAT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98735314B6A
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 12:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760445607; cv=none; b=SOzwKO1o3aJuM+NZMtMXpTz53Mc1jLd5qcD98FSdlw7X0TmtSGkIOzhyUlnO+hDu5ym4RXGPMfjmnMv92WLxHfG4ikSZUsgWpb9hEa8VLfk6wSnJx6e7E6R74dsWE6e0FR15aupu0jt1Q8Nbu5KQXOSt0KGbegFIEJeuwh6tWZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760445607; c=relaxed/simple;
	bh=mQsq9Lyl9Xj4ieWxCs4ifLYeBM7hE4agqANYBsIaYvs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d3CS55zb9P2nwcFEjLGR3cErxhSihqaL7wP5jF69z3OtOESiJW5U96Lq00cg/ELm9qQykd1BDaW82jC/oUYvq24vFsTocqsk4OyDa4g/3CPpq6GkmwokuL+16GPJwR15U8yInR+HusXabSFLDyinPl0D4SIFLumaAHFrjT6j/kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OtiKkKAT; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-46e37d10ed2so48807185e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 05:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760445604; x=1761050404; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1RYyzsf7oZTpApmmhnHm39MnizxtLSKAObcAdZ76I/g=;
        b=OtiKkKATctyk+AcZxVZ2GjGR2kA3nRYxwqmAMXyLtoARxWbyko+6Iu/s2dwNHCtDIC
         3lAIe3odM4tHy/AaHCvdI0k8UMftkmQqxTyA4ylMO82SVUSb2hPQk5B8vDANxBUmIxbU
         rnWOKcy16FZPIEmKY+IjxXCF85DgCMr8b7wBsXGAACfyjZjTQOdvTGTzM2pv6qlBZtPc
         nCLYdRD0GKwwWzBJvpTgE/Rr9Cyh15oJzcT+EHjDjE6cz4OVso3+rxblWVQ4Ej6cuY+s
         iSKj7yAHRWK04uqcaX/TVPtdt9MI9taOgX+poKHBot/jRkVb5CaBJga2DtrUh+M9YJbe
         AO5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760445604; x=1761050404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1RYyzsf7oZTpApmmhnHm39MnizxtLSKAObcAdZ76I/g=;
        b=LaWYqavB4PIDN9v2BkkIYnlXiFGJzcE9G5+AQBReplB7OzqSEt4YbAAAxsM4izKWGs
         FX8WmzxR2DGcttQOUYp10jh70gYh3KBWAX6kfsaR9MHsyZFI7XKvVfEQyQrC+fHa9HPT
         n4w63/dlHGUqb6bdtwciWcY1TxFN2Rk4lnxr5LOzl4sfmMEldgOTsSzDFnSIRxRW0Mi5
         HhKUtDo9rpDI0jQusfDQrAopxVzwtG0+KGhxRiSmrHlfUDFqheVPDRH6qZsH36QhuY4y
         sSiYi4hPma6UaGppjUmzVIRnzRt3OrwL1lFhX83YFCyrH1rbCk/5YAolFPhhArHQ0iV6
         c9gA==
X-Gm-Message-State: AOJu0YzhjX8/tIKDr2z91VpbD4Dkf78EdVGUGIy3UEGjD1Rux3D8TlI5
	5GH5lDBsjDxioFOT/2tUKC4w+94EeqLTN61pTVUxX67fSRBs37FoC45GlNmp0PWOmHM=
X-Gm-Gg: ASbGncvV49cuZK6lELFxSLoJZ1YotXMkRVxhjd/rC5sNeToPmoWKkI/ugYib5/Wffhe
	jSPWU1SRIKSujhF4vbj2LEMJPHLIftmq3ZJ6j1Pbz2PuhniwrqVpuFhPdXLYwvNUlgYNd9nmumQ
	IyZNAgtdFgexdM3hCFSl+kClCYMpwAMQ1NMbtTqX8F5FW2juG8Rl9Y86U5OlCzxhe1U7/SPHlog
	tFSRkQY9/EYUK6VbBo6ZUdXTNklbj9EBUyHDn4L60qsasWUqj4mKH+d+xDPNZoW6TTK/yiDtKSC
	Siifl6chCKRXLoE7uvHXMPXp2aZgdqI0bDfy7kKkqch/2v500G+Qh1Fd93n11DMyIIfcTRIaF5N
	UZ+Zr6kn5r8ObZvkXRcXkiEOkNao5t/qMEbolMcW39iI4VkWOlpcnqpOaIb7oZat8
X-Google-Smtp-Source: AGHT+IEf7Z8/P3u133rQ5LFYuWk/L8zLU2JN4M/uTzSeOh4jfJpa55YeNQBn0KZm+7kKT+tReAAC5Q==
X-Received: by 2002:a05:600c:a402:b0:46e:4705:4958 with SMTP id 5b1f17b1804b1-46fa9b9a362mr150432245e9.30.1760445603208;
        Tue, 14 Oct 2025 05:40:03 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb482b9easm245813815e9.1.2025.10.14.05.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 05:40:02 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 14 Oct 2025 15:38:32 +0300
Subject: [PATCH v2 7/7] soc: qcom: ubwc: Add configuration Glymur platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-glymur-display-v2-7-ff935e2f88c5@linaro.org>
References: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
In-Reply-To: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
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
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1513; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=mQsq9Lyl9Xj4ieWxCs4ifLYeBM7hE4agqANYBsIaYvs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBo7kSLNYRKifdBgcF3xKNW0WLXs4gtszg2kFZsA
 pL/BdVpBNaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaO5EiwAKCRAbX0TJAJUV
 VvKnD/sFavrflS06oimK1daRufz4+wRv0bIIBt/XB5fqDqKLrMdYTIA7A5Fsj7R08LRp5BTAcrp
 BJm0xLXVWeimbSlBheggj6qzBsm49RkBN4ZnBmdBPhiLMmzhydaU1Je7u8JUl7SoMX/AWYqBi0a
 uesyngx3xE97NQlls+wJmmzieK/dsUGa5VBFLlqh0OSNfX7cOCAWbYCePIb6bG9pWQuEH9beBBL
 p3n/QtpliEJl2jHk25LUUD41u8jOk+CV59HQdrnZpdMjSXV36M2sZfGpmOcHESc+mYACbCaQPZt
 TUC14Oy+kID1GoFwiPSlZsDx1u1dwfpJ/qjBtlP1Wbg8izyPK0tISJDXjDpJuw4hv1pG0f+w21t
 SPRTSVVHbBTDDgFAkuHREGYJnJJtmj5R+5OrYeW5ovdMYO6bYwbw/4eARHLDEHLjJ9N4ODcwm6F
 FGDbeAzXZGGpLN6oR7ZYAE2p41SYzHOy3YvTOHXIhp2S2PxUqw3xFPiuOXWtv9hmh/D2MkUBb2O
 55CEQyxkyQ6eTLUZeni7/5amUjQVto2+Ll2kZ5pINNLSzcJcR4SDFJvRh8mz9bqKNjtvq8W7Z0m
 KrBE/UfUAoDweX0ZAdmEiBfuJ4i2uLRPvCwxwpmr94rCTlZehiCcj/iXvvRPyEZ9bjGHVyIIwLe
 Uu9CvVduMzdmKSg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Describe the Universal Bandwidth Compression (UBWC) configuration
for the new Glymur platform.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/soc/qcom/ubwc_config.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 15d373bff231d770e00fe0aee1b5a95c7b8a6305..7cca2afb68e3e9d33f3066f1deb3b9fcc01641a1 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -218,11 +218,23 @@ static const struct qcom_ubwc_cfg_data x1e80100_data = {
 	.macrotile_mode = true,
 };
 
+static const struct qcom_ubwc_cfg_data glymur_data = {
+	.ubwc_enc_version = UBWC_5_0,
+	.ubwc_dec_version = UBWC_5_0,
+	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
+			UBWC_SWIZZLE_ENABLE_LVL3,
+	.ubwc_bank_spread = true,
+	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
+	.highest_bank_bit = 16,
+	.macrotile_mode = true,
+};
+
 static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,apq8016", .data = &no_ubwc_data },
 	{ .compatible = "qcom,apq8026", .data = &no_ubwc_data },
 	{ .compatible = "qcom,apq8074", .data = &no_ubwc_data },
 	{ .compatible = "qcom,apq8096", .data = &msm8998_data },
+	{ .compatible = "qcom,glymur", .data = &glymur_data},
 	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8917", .data = &no_ubwc_data },

-- 
2.48.1


