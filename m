Return-Path: <linux-arm-msm+bounces-35909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 774D79B0820
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 17:26:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7A8B1F21359
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 15:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D59920D4F7;
	Fri, 25 Oct 2024 15:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VbPZgpMV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A79E20D4E3
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 15:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729869792; cv=none; b=Ck3AKcdu0pNtGT+XdP6vhhAxGvvSng5ZX/ireMbX7eod40Y+ftmq4Ez7HAQXUwXtQAIWrAuVIVIuZqV4a/HGq61Dt52JXbQ7ioGpU0VMdm4rM2czzJEcXRuZ4gQw0qEYkEhK8Dzuc5e4bmSn10twHsEJajf3Q3zAo7yBQy3OcKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729869792; c=relaxed/simple;
	bh=8FbeicR87fUKKJuKBDf5OiGYnoTGgTDP768BkLjnows=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b4y/rMb1w/DtQ+2eoPsjDCVJ3r0ivoIDf+OQyXFsUb3mcfXZ9cRXlf9+4JEEzCMdntK6AXGw/DcE26slgNVnbhAnEZ8fHGsqtxmD5juwecGouxMEeZRprivVgMeTZe1EN5kRlLAZsloo/UJ8xAJy05j1zdrrjqZYsmuhjTTbnow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VbPZgpMV; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb49510250so23275751fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 08:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729869787; x=1730474587; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n/+QskIXdzcW+et8E4WD6OyvnlorVlqZ0XDg9qDj3+c=;
        b=VbPZgpMVAgKQ/frIIGHJLN4BXqGnZ4gvUAa62SefDC7PZQyuEQgJ4AU91IMlCjAuwp
         zSDIQlmvYswzluoTCV5+72aTmmsB+tYFJnSYJuix9b9f4mcToD1QDuXuoufeIBjmAc5V
         3edCtyAko53gyYgMNrNh/du4376UUG9IuPbjRlWQp5kV3D1KU2i3+nbRC9uOIc3Hl6zj
         9cGEzGwPHkhAYeL9+pMWO+gPcAlT48W23s4m4UcHSpIUeZeYzSY8KcO9tS+FyWyaGnKd
         Ma37hoKa1yHripU8A2J5xjqT8oieftayD2WNarxXpmGaOZVV7pi4f532VsW8vyYzxFsK
         G45A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729869787; x=1730474587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n/+QskIXdzcW+et8E4WD6OyvnlorVlqZ0XDg9qDj3+c=;
        b=pcAlonU5/NeXMNR+s2iZzZCeyVA+eUwhuZvHEoF6xDf5Af7HXX92StKXtyHYHghWuL
         rSrYw48MSRi7cqJgVC7z66+A4TEwxWDsfZpEzDbxq1joD1EV7m4pRvtPwfu/kILu+ATe
         sxSEhre7X9cVL1wPL80kMOMOGnqlVsJMlg+0ze7lQOJ6DqBExRvZyL14HYg4M+pWMJW0
         2SjSsP/11Nil90J+h0/390pXo3rIjziKsq/87/PM2NwByRo3YuCBxSSUK9pIVq2SkIv8
         Y+R6z1HOsvhp9m9eTh85+PWo2G4iRP8BY002C0CvGNl7CpOmiEvRt19xCdCpjcP7HvTk
         rBSw==
X-Gm-Message-State: AOJu0YzbsVGMp4VGYvpirY7Usyl1ltIAxRA4NNGlk9YvAISZw8sWfTI0
	HcgIBrKDTwQvyu2r9UZ2DDbAHpPJ/R7IF1BOCWZwpAyPJQoBsa/aC4yo20JCU84=
X-Google-Smtp-Source: AGHT+IF9wgbrox6j6lN8CGv6/Q/9ChwfZpJKyciZPAPHKN8VsER20WcxzNSCnBm/r/jsLuBJ0VSU1w==
X-Received: by 2002:a2e:be26:0:b0:2fb:4bee:47ec with SMTP id 38308e7fff4ca-2fc9d59ef88mr59347791fa.33.1729869787202;
        Fri, 25 Oct 2024 08:23:07 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb46017bdsm2135721fa.104.2024.10.25.08.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 08:23:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 25 Oct 2024 18:22:54 +0300
Subject: [PATCH v2 2/2] soc: qcom: llcc: add support for SAR2130P and
 SAR1130P
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-sar2130p-llcc-v2-2-7455dc40e952@linaro.org>
References: <20241025-sar2130p-llcc-v2-0-7455dc40e952@linaro.org>
In-Reply-To: <20241025-sar2130p-llcc-v2-0-7455dc40e952@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13837;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=8FbeicR87fUKKJuKBDf5OiGYnoTGgTDP768BkLjnows=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnG7fP0YqsE/JOEf2MgIk/aicNopE/N6HwEiRny
 S+NiqtnEveJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxu3zwAKCRAU23LtvoBl
 uCO2EADAz5LE9YpH9WKIT3z3KBepk2dxGH8qbSjm8trAhHCGeulGwKDcuu2bYCTNmGKuaDm8+L8
 tfmzGNyTEA0naacr7liogC9jYZQPJzOESppXJDWfry/SpycgZP4mWJq+d4LrwZpw2hx10mvcWDY
 ISxhWXt7RfVstYAeTngVrMeaZmOZQwXGf8UXlOCMB4IYs6PYOxeD3bVcsk2WYOcFP+ULmTf2u/L
 QWV70hVk1YEkE1vJ5klHPyCeKaoZHGLq8Rz0npKuQpoBwMNULOunDMML48TRvHGT4HwopLV2pIY
 LLCIiyj81FFguu3k0BoNhdKuqzrr4DgLj7f0YWYUB7C0C4OYUY33hiaQ3z5pb/9OzkA2GboeZGK
 zaowolFsMcY9lLgQbddKF5QDnV36kMw/dDLafpbooKAqTXH/vKw/yNcZtQROjV05wig6fTz46yz
 FgltI2hTDXajB2Tmmbls28ihsuUmnzWwhPz09n9m2ybvpfUSB3A/YS4vCAWJB8I8N84XE9Ll+RM
 KraHwZhOZ7Tem+gg5y3oLT5I4SxNhx6+LF/HWEn6aH85bZZFXPU90ZkS5P4VHBW7+fRRwAdFH/g
 yQPqfx3laXV2VB/8JIaQlWVsD8D8eoZFBUayeFkDAGo6q6cjvFDFH3L0PmXDTzVUUXu8M2/mo9R
 uAim5uZlR2heP7A==
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
index a470285f54a875bf2262aac7b0f84ed8fd028ef1..49526486d1025995eb7678e8bbd3facf313721ea 100644
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
+		.max_cap_shift	= 0x0e,
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
+		.max_cap_shift	= 0x0e,
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


