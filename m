Return-Path: <linux-arm-msm+bounces-36019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC649B195C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 17:44:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1D371F2215D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 15:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 199F7770E2;
	Sat, 26 Oct 2024 15:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="avbj6mES"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5F813A3E4
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 15:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729957428; cv=none; b=N9V4iLmXwHmFHO61z6TyQ3pN6jcLnINDbg27udPGORavgAtf6Savpr2md+MDDaFFC+eV+A6I6hcijYT8VdNyE4BDJivcg/6/SS4iL4Xp6nXzGSsgJGjE4BxSXDWoRlb687SRzNcwg+SxbD4vDGfcJartG9wIb5pcxMxvFuwJABQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729957428; c=relaxed/simple;
	bh=6j1ZmmWE0y4ED+Jm+F82mZmRwPap4+5uKPBK9BjftWM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VxyOshlD7A3Ns5pHfCh9h8hXjZufYHVgrdXPOo4WMB5vKabKWLVdUix/tXDm9l12G3BpQX2/YWf8y37rZhB5N68zW/ClqGE63rQ26xldaHFQlr+1Olkwz+hkr4l0o7mST22f9LvtinLfxs4aPDT2qQxq9WZ3LU2p2VI42nzpzQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=avbj6mES; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539f2b95775so3405179e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 08:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729957422; x=1730562222; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MfleBcORJUBwFnqLIr0FW7DYESYDkCCPxFgSZbQ6G0I=;
        b=avbj6mESN00MauuronGoduyO2ISdaZh5vmVivqxXnZNRTYJWXIhw0KHyrS63HE0Olv
         tq5g16o01M0Q9Lr7YA81kHOCLaMscP5Iyqkv0Nqq1mZur9vwbZdbVaJe3r7igfF3FqAQ
         1TU/hfDuoAdfKNIbaTaIEqFYbnDe/ic2UfvEiLDG7E4m4AReN2FwliGn27Mz8Ajs31JJ
         UyFwR7zbX6abH18iEouvPgdJO6Beru5yqutj1oN86zhyXazHMsDv6C4NpbrDT0IHGHmt
         0q0hG/m8fHs0g2HMe+Np/2UNy8h5LPn284Mm4lSpNsJQxdO4svjGlKrZ1QNuvKySucRk
         kwaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729957422; x=1730562222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MfleBcORJUBwFnqLIr0FW7DYESYDkCCPxFgSZbQ6G0I=;
        b=T2caEa5VPZZeSrG3ikWk8gG7jBIan17RDzYR3l1+D0dv8Oh31mXMXtxo3VuUvPIEmK
         DyfKhcnYsvWPRSe11h9ASLIVPdR8tUkpG5SwPhzD2nLokSFvaVzaAgyqAEwBpRcTvjOf
         KYcxCIcaUx2zYhuU8hZ2IUGWSPFt499Q3SsDNv/cESuwDXF3rlBgb4hFxmTaEzc5Agkd
         X76VsCAjFNQ4CZTGHB/ZDSqA7k1QWKslWT+A1Jqj1hV//x3m5Kg4CjeHWlfiekGZgw1N
         wHx0B1v8qvBcBGr2knA8usLy+u+CXZUY0VzkivLCVd1afQpoQ/mAqFdOfRmbQtqtBEQN
         nNGA==
X-Gm-Message-State: AOJu0YyCN1oUXcHV5StKKAmVXcFMj9X/F8QJV9OCc5r8+1PwjqJ1H0dO
	pyDuquEoCdI/YdjRhkUtChvRcaEnTVq0qRfXS5T9ZRxsPvx17XqoBKMzE8rZq0U=
X-Google-Smtp-Source: AGHT+IGabp+WAbRmsShZtqWcaEI8XPFfTGs/Gh4lGye9lhvu24Ti/I/LHL5IwDXCnZT22Izvg3qJwQ==
X-Received: by 2002:a05:6512:ac4:b0:539:8a50:6ee8 with SMTP id 2adb3069b0e04-53b34a35a4amr1895063e87.57.1729957422184;
        Sat, 26 Oct 2024 08:43:42 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e10a47asm534934e87.1.2024.10.26.08.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 08:43:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 26 Oct 2024 18:43:33 +0300
Subject: [PATCH v3 3/3] soc: qcom: llcc: add support for SAR2130P and
 SAR1130P
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241026-sar2130p-llcc-v3-3-2a58fa1b4d12@linaro.org>
References: <20241026-sar2130p-llcc-v3-0-2a58fa1b4d12@linaro.org>
In-Reply-To: <20241026-sar2130p-llcc-v3-0-2a58fa1b4d12@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13833;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=6j1ZmmWE0y4ED+Jm+F82mZmRwPap4+5uKPBK9BjftWM=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnHQ4oP8z/Nxs7vzQVbc9kvP0mIk7EG6XhsH3b0
 hsyKIj+qeSJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZx0OKAAKCRAU23LtvoBl
 uCYPD/9puMk74o0KHpdX1w6RVULvVbXbqDJmQYekBzp6NAaKwBx4rI6ZWsZCzclGCJk3x00KL9/
 0AF/NFqaJaJzwb4/7oJd+iZ0b+KQ9Igti0U4CB9QR0IJnz0Z/THoKrzjmTHX02W1izVqDbYJFI1
 6ABmi4XeS6t3QCdmlX+WIvXnfYfr4dOUCV6mvQLUAm0hH+D1DbDw1wWK/nmXr+5S4o9NuE/1ve6
 uJSAzFJv467YuDD6Kw8ZplAH+7woR6yIxBUHQS0NV7NSahhH4r2O/wmYrIfd2qCYelDDOblMLZu
 JRZayZ7jylrhmthDR6hbhATJN4C/u5NKFTLE8WpdAZ8L4fSLkbgEYVwtCEHMiOsWZ2QibrWdpB3
 0GSLljZ9EwMzAMEA+0EAB8NPcNexONEbfBS+ZTSJKjtrveWzNXozhHIrfcE7ggZVssDNUTrTX/s
 ttnoBXanZFv5tyzUJbaK3CLtxjqEXgCLwDE8E3OtzMXlE/sAOTWrj9VEKHX+m48PD+WtBpgtPxK
 93iCh8be3guO0wgVPux2dcm0hwaFngyGRvtVgh+BZGzx1g1RTR0rOwzDhmpZ6rt8M/AET/DRx1w
 1Ha+JLKVFnvnn+320qJHDgkZ2sOebZLgigHCmQ4+MxuID32sqyQ+YSGrm1la94XQ6nYoNYY0vRg
 yi2cNBb/gDH+4qw==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Implement necessary support for the LLCC control on the SAR1130P and
SAR2130P platforms. These two platforms use different ATTR1_MAX_CAP
shift and also require manual override for num_banks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/llcc-qcom.c       | 460 ++++++++++++++++++++++++++++++++++++-
 include/linux/soc/qcom/llcc-qcom.h |  12 +
 2 files changed, 466 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 891efd008b8e3d8b851ccf19d91e508b7a7bff40..783545b22aaab1b6037abd14727f9a835aa0b4cc 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -136,6 +136,8 @@ struct qcom_llcc_config {
 	const struct llcc_slice_config *sct_data;
 	const u32 *reg_offset;
 	const struct llcc_edac_reg_offset *edac_reg_offset;
+	u32 max_cap_shift; /* instead of ATTR1_MAX_CAP_SHIFT */
+	u32 num_banks;
 	int size;
 	bool need_llcc_cfg;
 	bool no_edac;
@@ -298,6 +300,408 @@ static const struct llcc_slice_config sa8775p_data[] =  {
 	},
 };
 
+static const struct llcc_slice_config sar1130p_data[] = {
+	{
+		.usecase_id = LLCC_CPUSS,
+		.slice_id = 1,
+		.max_cap = 4096,
+		.priority = 1,
+		.bonus_ways = 0x1fff,
+		.res_ways = 0x0,
+		.cache_mode = 0,
+		.retain_on_pc = true,
+		.activate_on_init = true,
+	}, {
+		.usecase_id = LLCC_VIDSC0,
+		.slice_id = 2,
+		.max_cap = 512,
+		.priority = 3,
+		.fixed_size = true,
+		.bonus_ways = 0x1fff,
+		.res_ways = 0x0,
+		.cache_mode = 0,
+		.retain_on_pc = true,
+	}, {
+		.usecase_id = LLCC_AUDIO,
+		.slice_id = 6,
+		.max_cap = 1024,
+		.priority = 3,
+		.fixed_size = true,
+		.bonus_ways = 0x1fff,
+		.res_ways = 0x0,
+		.cache_mode = 0,
+		.retain_on_pc = true,
+	}, {
+		.usecase_id = LLCC_CMPT,
+		.slice_id = 10,
+		.max_cap = 1024,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0x1fff,
+		.res_ways = 0x0,
+		.cache_mode = 0,
+		.retain_on_pc = true,
+	}, {
+		.usecase_id = LLCC_GPUHTW,
+		.slice_id = 11,
+		.max_cap = 0,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0x1fff,
+		.res_ways = 0x0,
+		.cache_mode = 0,
+		.retain_on_pc = true,
+	}, {
+		.usecase_id = LLCC_GPU,
+		.slice_id = 12,
+		.max_cap = 3072,
+		.priority = 3,
+		.fixed_size = true,
+		.bonus_ways = 0x1fff,
+		.res_ways = 0x0,
+		.cache_mode = 0,
+		.retain_on_pc = true,
+		.write_scid_en = true,
+	}, {
+		.usecase_id = LLCC_MMUHWT,
+		.slice_id = 13,
+		.max_cap = 512,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0x1fff,
+		.res_ways = 0x0,
+		.cache_mode = 0,
+	}, {
+		.usecase_id = LLCC_DISP,
+		.slice_id = 16,
+		.max_cap = 12800,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0x1fff,
+		.res_ways = 0x0,
+		.cache_mode = 0,
+		.retain_on_pc = true,
+	}, {
+		.usecase_id = LLCC_CVP,
+		.slice_id = 28,
+		.max_cap = 256,
+		.priority = 3,
+		.fixed_size = true,
+		.bonus_ways = 0x1fff,
+		.res_ways = 0x0,
+		.cache_mode = 0,
+		.retain_on_pc = true,
+	}, {
+		.usecase_id = LLCC_APTCM,
+		.slice_id = 26,
+		.max_cap = 2048,
+		.priority = 3,
+		.fixed_size = true,
+		.bonus_ways = 0x0,
+		.res_ways = 0x3,
+		.cache_mode = true,
+		.dis_cap_alloc = true,
+		.retain_on_pc = true,
+	}, {
+		.usecase_id = LLCC_WRCACHE,
+		.slice_id = 31,
+		.max_cap = 256,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0x1fff,
+		.res_ways = 0x0,
+		.cache_mode = 0,
+		.activate_on_init = true,
+	}, {
+		.usecase_id = LLCC_AENPU,
+		.slice_id = 30,
+		.max_cap = 3072,
+		.priority = 3,
+		.fixed_size = true,
+		.bonus_ways = 0x1fff,
+		.res_ways = 0x0,
+		.cache_mode = 0,
+		.retain_on_pc = true,
+	}, {
+		.usecase_id = LLCC_DISP_LEFT,
+		.slice_id = 17,
+		.max_cap = 0,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0x0,
+		.res_ways = 0x0,
+		.cache_mode = 0,
+		.retain_on_pc = true,
+	}, {
+		.usecase_id = LLCC_DISP_RIGHT,
+		.slice_id = 18,
+		.max_cap = 0,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0x0,
+		.res_ways = 0x0,
+		.cache_mode = 0,
+		.retain_on_pc = true,
+	}, {
+		.usecase_id = LLCC_EVCS_LEFT,
+		.slice_id = 22,
+		.max_cap = 0,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0x0,
+		.res_ways = 0x0,
+		.cache_mode = 0,
+		.retain_on_pc = true,
+	}, {
+		.usecase_id = LLCC_EVCS_RIGHT,
+		.slice_id = 23,
+		.max_cap = 0,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0x0,
+		.res_ways = 0x0,
+		.cache_mode = 0,
+		.retain_on_pc = true,
+	},
+};
+
+static const struct llcc_slice_config sar2130p_data[] = {
+	{
+		.usecase_id = LLCC_CPUSS,
+		.slice_id = 1,
+		.max_cap = 6144,
+		.priority = 1,
+		.fixed_size = 0,
+		.bonus_ways = 0x3fffffff,
+		.res_ways = 0x0,
+		.cache_mode = 0,
+		.retain_on_pc = true,
+		.activate_on_init = true,
+	}, {
+		.usecase_id = LLCC_VIDSC0,
+		.slice_id = 2,
+		.max_cap = 128,
+		.priority = 2,
+		.fixed_size = true,
+		.bonus_ways = 0x3fffffff,
+		.res_ways = 0x0,
+		.cache_mode = 0,
+		.retain_on_pc = true,
+	}, {
+		.usecase_id = LLCC_AUDIO,
+		.slice_id = 6,
+		.max_cap = 1024,
+		.priority = 3,
+		.fixed_size = true,
+		.bonus_ways = 0x3fffffff,
+		.res_ways = 0x0,
+		.cache_mode = 0,
+		.retain_on_pc = true,
+	}, {
+		.usecase_id = LLCC_CMPT,
+		.slice_id = 10,
+		.max_cap = 1024,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0x3fffffff,
+		.res_ways = 0x0,
+		.cache_mode = 0,
+		.retain_on_pc = true,
+	}, {
+		.usecase_id = LLCC_GPUHTW,
+		.slice_id = 11,
+		.max_cap = 0,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0x3fffffff,
+		.res_ways = 0x0,
+		.cache_mode = 0,
+		.retain_on_pc = true,
+	}, {
+		.usecase_id = LLCC_GPU,
+		.slice_id = 12,
+		.max_cap = 1536,
+		.priority = 2,
+		.fixed_size = true,
+		.bonus_ways = 0x3fffffff,
+		.res_ways = 0x0,
+		.cache_mode = 0,
+		.retain_on_pc = true,
+		.write_scid_en = true,
+	}, {
+		.usecase_id = LLCC_MMUHWT,
+		.slice_id = 13,
+		.max_cap = 1024,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0x3fffffff,
+		.res_ways = 0x0,
+		.cache_mode = 0,
+		.activate_on_init = true,
+	}, {
+		.usecase_id = LLCC_DISP,
+		.slice_id = 16,
+		.max_cap = 0,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0x3fffffff,
+		.res_ways = 0x0,
+		.cache_mode = 0,
+		.retain_on_pc = true,
+	}, {
+		.usecase_id = LLCC_APTCM,
+		.slice_id = 26,
+		.max_cap = 2048,
+		.priority = 3,
+		.fixed_size = true,
+		.bonus_ways = 0x0,
+		.res_ways = 0x3,
+		.cache_mode = true,
+		.dis_cap_alloc = true,
+		.retain_on_pc = true,
+	}, {
+		.usecase_id = LLCC_WRCACHE,
+		.slice_id = 31,
+		.max_cap = 256,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0x3fffffff,
+		.res_ways = 0x0,
+		.cache_mode = 0,
+		.activate_on_init = true,
+	}, {
+		.usecase_id = LLCC_VIEYE,
+		.slice_id = 7,
+		.max_cap = 7168,
+		.priority = 4,
+		.fixed_size = true,
+		.bonus_ways = 0x3fffffff,
+		.res_ways = 0x0,
+		.cache_mode = 0,
+		.retain_on_pc = true,
+	}, {
+		.usecase_id = LLCC_VIDPTH,
+		.slice_id = 8,
+		.max_cap = 7168,
+		.priority = 4,
+		.fixed_size = true,
+		.bonus_ways = 0x3fffffff,
+		.res_ways = 0x0,
+		.cache_mode = 0,
+		.retain_on_pc = true,
+	}, {
+		.usecase_id = LLCC_GPUMV,
+		.slice_id = 9,
+		.max_cap = 2048,
+		.priority = 2,
+		.fixed_size = true,
+		.bonus_ways = 0x3fffffff,
+		.res_ways = 0x0,
+		.cache_mode = 0,
+		.retain_on_pc = true,
+	}, {
+		.usecase_id = LLCC_EVA_LEFT,
+		.slice_id = 20,
+		.max_cap = 7168,
+		.priority = 5,
+		.fixed_size = true,
+		.bonus_ways = 0x3ffffffc,
+		.res_ways = 0x0,
+		.cache_mode = 0,
+		.retain_on_pc = true,
+	}, {
+		.usecase_id = LLCC_EVA_RIGHT,
+		.slice_id = 21,
+		.max_cap = 7168,
+		.priority = 5,
+		.fixed_size = true,
+		.bonus_ways = 0x3ffffffc,
+		.res_ways = 0x0,
+		.cache_mode = 0,
+		.retain_on_pc = true,
+	}, {
+		.usecase_id = LLCC_EVAGAIN,
+		.slice_id = 25,
+		.max_cap = 1024,
+		.priority = 2,
+		.fixed_size = true,
+		.bonus_ways = 0x3fffffff,
+		.res_ways = 0x0,
+		.cache_mode = 0,
+		.retain_on_pc = true,
+	}, {
+		.usecase_id = LLCC_AENPU,
+		.slice_id = 30,
+		.max_cap = 3072,
+		.priority = 3,
+		.fixed_size = true,
+		.bonus_ways = 0x3fffffff,
+		.res_ways = 0x0,
+		.cache_mode = 0,
+		.retain_on_pc = true,
+	}, {
+		.usecase_id = LLCC_VIPTH,
+		.slice_id = 29,
+		.max_cap = 1024,
+		.priority = 4,
+		.fixed_size = true,
+		.bonus_ways = 0x3fffffff,
+		.res_ways = 0x0,
+		.cache_mode = 0,
+		.retain_on_pc = true,
+	}, {
+		.usecase_id = LLCC_DISP_LEFT,
+		.slice_id = 17,
+		.max_cap = 0,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0x0,
+		.res_ways = 0x0,
+		.cache_mode = 0,
+		.retain_on_pc = true,
+	}, {
+		.usecase_id = LLCC_DISP_RIGHT,
+		.slice_id = 18,
+		.max_cap = 0,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0x0,
+		.res_ways = 0x0,
+		.cache_mode = 0,
+		.retain_on_pc = true,
+	}, {
+		.usecase_id = LLCC_EVCS_LEFT,
+		.slice_id = 22,
+		.max_cap = 0,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0x0,
+		.res_ways = 0x0,
+		.cache_mode = 0,
+		.retain_on_pc = true,
+	}, {
+		.usecase_id = LLCC_EVCS_RIGHT,
+		.slice_id = 23,
+		.max_cap = 0,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0x0,
+		.res_ways = 0x0,
+		.cache_mode = 0,
+		.retain_on_pc = true,
+	}, {
+		.usecase_id = LLCC_SPAD,
+		.slice_id = 24,
+		.max_cap = 7168,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0x0,
+		.res_ways = 0x0,
+		.cache_mode = 0,
+		.retain_on_pc = true,
+	},
+};
+
 static const struct llcc_slice_config sc7180_data[] =  {
 	{
 		.usecase_id = LLCC_CPUSS,
@@ -2687,6 +3091,30 @@ static const struct qcom_llcc_config sa8775p_cfg[] = {
 	},
 };
 
+static const struct qcom_llcc_config sar1130p_cfg[] = {
+	{
+		.sct_data	= sar1130p_data,
+		.size		= ARRAY_SIZE(sar1130p_data),
+		.need_llcc_cfg	= true,
+		.reg_offset	= llcc_v2_1_reg_offset,
+		.edac_reg_offset = &llcc_v2_1_edac_reg_offset,
+		.max_cap_shift	= 14,
+		.num_banks	= 2,
+	},
+};
+
+static const struct qcom_llcc_config sar2130p_cfg[] = {
+	{
+		.sct_data	= sar2130p_data,
+		.size		= ARRAY_SIZE(sar2130p_data),
+		.need_llcc_cfg	= true,
+		.reg_offset	= llcc_v2_1_reg_offset,
+		.edac_reg_offset = &llcc_v2_1_edac_reg_offset,
+		.max_cap_shift	= 14,
+		.num_banks	= 2,
+	},
+};
+
 static const struct qcom_llcc_config sc7180_cfg[] = {
 	{
 		.sct_data	= sc7180_data,
@@ -2839,6 +3267,16 @@ static const struct qcom_sct_config sa8775p_cfgs = {
 	.num_config	= ARRAY_SIZE(sa8775p_cfg),
 };
 
+static const struct qcom_sct_config sar1130p_cfgs = {
+	.llcc_config	= sar1130p_cfg,
+	.num_config	= ARRAY_SIZE(sar1130p_cfg),
+};
+
+static const struct qcom_sct_config sar2130p_cfgs = {
+	.llcc_config	= sar2130p_cfg,
+	.num_config	= ARRAY_SIZE(sar2130p_cfg),
+};
+
 static const struct qcom_sct_config sc7180_cfgs = {
 	.llcc_config	= sc7180_cfg,
 	.num_config	= ARRAY_SIZE(sc7180_cfg),
@@ -3146,7 +3584,10 @@ static int _qcom_llcc_cfg_program(const struct llcc_slice_config *config,
 	 */
 	max_cap_cacheline = max_cap_cacheline / drv_data->num_banks;
 	max_cap_cacheline >>= CACHE_LINE_SIZE_SHIFT;
-	attr1_val |= max_cap_cacheline << ATTR1_MAX_CAP_SHIFT;
+	if (cfg->max_cap_shift)
+		attr1_val |= max_cap_cacheline << cfg->max_cap_shift;
+	else
+		attr1_val |= max_cap_cacheline << ATTR1_MAX_CAP_SHIFT;
 
 	attr1_cfg = LLCC_TRP_ATTR1_CFGn(config->slice_id);
 
@@ -3383,12 +3824,17 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 		goto err;
 	cfg = &cfgs->llcc_config[cfg_index];
 
-	ret = regmap_read(regmap, cfg->reg_offset[LLCC_COMMON_STATUS0], &num_banks);
-	if (ret)
-		goto err;
+	if (cfg->num_banks) {
+		num_banks = cfg->num_banks;
+	} else {
+		ret = regmap_read(regmap, cfg->reg_offset[LLCC_COMMON_STATUS0], &num_banks);
+		if (ret)
+			goto err;
+
+		num_banks &= LLCC_LB_CNT_MASK;
+		num_banks >>= LLCC_LB_CNT_SHIFT;
+	}
 
-	num_banks &= LLCC_LB_CNT_MASK;
-	num_banks >>= LLCC_LB_CNT_SHIFT;
 	drv_data->num_banks = num_banks;
 
 	drv_data->regmaps = devm_kcalloc(dev, num_banks, sizeof(*drv_data->regmaps), GFP_KERNEL);
@@ -3486,6 +3932,8 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 static const struct of_device_id qcom_llcc_of_match[] = {
 	{ .compatible = "qcom,qdu1000-llcc", .data = &qdu1000_cfgs},
 	{ .compatible = "qcom,sa8775p-llcc", .data = &sa8775p_cfgs },
+	{ .compatible = "qcom,sar1130p-llcc", .data = &sar1130p_cfgs },
+	{ .compatible = "qcom,sar2130p-llcc", .data = &sar2130p_cfgs },
 	{ .compatible = "qcom,sc7180-llcc", .data = &sc7180_cfgs },
 	{ .compatible = "qcom,sc7280-llcc", .data = &sc7280_cfgs },
 	{ .compatible = "qcom,sc8180x-llcc", .data = &sc8180x_cfgs },
diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
index 2f20281d4ad4352ef59e7b19148cd324c7991012..8e5d78fb4847a232ab17a66c2775552dcb287752 100644
--- a/include/linux/soc/qcom/llcc-qcom.h
+++ b/include/linux/soc/qcom/llcc-qcom.h
@@ -54,7 +54,19 @@
 #define LLCC_CAMEXP4	 52
 #define LLCC_DISP_WB	 53
 #define LLCC_DISP_1	 54
+#define LLCC_VIEYE	 57
+#define LLCC_VIDPTH	 58
+#define LLCC_GPUMV	 59
+#define LLCC_EVA_LEFT	 60
+#define LLCC_EVA_RIGHT	 61
+#define LLCC_EVAGAIN	 62
+#define LLCC_VIPTH	 63
 #define LLCC_VIDVSP	 64
+#define LLCC_DISP_LEFT	 65
+#define LLCC_DISP_RIGHT	 66
+#define LLCC_EVCS_LEFT	 67
+#define LLCC_EVCS_RIGHT	 68
+#define LLCC_SPAD	 69
 
 /**
  * struct llcc_slice_desc - Cache slice descriptor

-- 
2.39.5


