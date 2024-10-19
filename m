Return-Path: <linux-arm-msm+bounces-35132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AAB9A4FC6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 18:27:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E12FD1C2459D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 16:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1624D19048D;
	Sat, 19 Oct 2024 16:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qaWnqYaS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BDD18DF84
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Oct 2024 16:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729355214; cv=none; b=IsdlqVPpIyxBImPNJb+DOc+K6gfMXvE3aqEFn1/LrBzGbpJlTFdaE2ppt+8Sub2sFqbRdKfdfNCdvrDOgXrj+crKgojTHuIeoPvF0Gm/RP2CbLq6v7nPiFsmsZc6CEpNrIiWHwh0TMHfP5zsM8YPDJvjjDuzt5ihO7LVnmg5+LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729355214; c=relaxed/simple;
	bh=9IJyzCE4GaHn616VyWC1aCINwEhMZfazYzFsYxs/DqI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kbu7C+zoc6lsoGJUbEkjdX9T9hMSjhsE4e6rhriqiHOH8YnizXC2wCUivzgpRUKGyr586cljoxDda7TJyW8wdK1Xt3l3xu48ViM4VGXmcO2CLnuDEDaeGNmvfLYZ9nlQYsyd8qMLoXJddBxtNeqd5uWzvEUGXgt4QWu1Y9jHS+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qaWnqYaS; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539f4d8ef84so3329113e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Oct 2024 09:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729355209; x=1729960009; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=16G8+YLdPReYNbCbPPpWhAvrlzQ+kcERenlbkmZcLtU=;
        b=qaWnqYaSLz/pThmGlvGHvxO7krkNniLKhC1J7TQ1iWffeiZl8bbFyIxW/zxNSHm717
         lg0hSJGJX36jHGqwJh5i31CP/kj+P/zamu/mhSoskx/bH3fp9uKdN8yQOArL+LOfJb9s
         GVGmVPxrNhB4Ikh0xrhwmX1RBm5riIxBByFJCij7s4f4XTTg7TM+nFDC4/fOJGYT2f/N
         2eNA05cQLl/4npCCImSMhIU0pZVO+G8IiFQNN6i4X7oV0ZYoHZTszl4j71ytPHj6I7FO
         cwjF0EhUu1mePeWK6KlJO8gPdY7IxAIlqjgM6pQUdeXsWDJosPKFBxDiljJzcJY426xX
         02OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729355209; x=1729960009;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=16G8+YLdPReYNbCbPPpWhAvrlzQ+kcERenlbkmZcLtU=;
        b=X7WN0VmUrM/7XKeCICRcrwF0Ng8zwCLBOVEyJrsnyj8ljHkdY/iwX50+9wxV7OznkH
         m7+zL3r1mJwtAEhi0eCLPEHh/lGurcPX5AbqBn+ETTDBb4bmfCr8I6Efp0WbAf9liAf2
         o9Thl4/cRE2TZsVFBwZmLUtICmsLL6RwCUhfxY6Yh78JcNpSV40RcL6ujkFiHluW9JEu
         B/v+lyp7b7KEA/85bZId9T443U5SVtSBCtnKNU/Ln57lH2RmFnHg7xr7YpnvYsyKpU7Y
         9yCUqZ22XW7iPBrXD6Hm7oLPmLnCn9mkj1i0n1upe90ka/Qt6ey9D/s9ac0Qyj7PjL5/
         NVOw==
X-Gm-Message-State: AOJu0YzMXbU+TIgkOG8JAkqw0c900OjaByEW573y7ovPxFjkpjzKUqCd
	L6icYQ5Dy5QQETBtlT3hpJz9piStjdHswfHD0hoP1yG7bJePL47hpn5MWyyH6Ks6pg1gdh6g6A4
	ft/A=
X-Google-Smtp-Source: AGHT+IGtQFwyylIOslHO+u2spOzWxKXOJ59teT4Gen6bVfg+Wb60THn0JlAUqa8cgOhePPz2UUrssQ==
X-Received: by 2002:a05:6512:3b82:b0:539:fc23:1497 with SMTP id 2adb3069b0e04-53a154410ebmr2984572e87.9.1729355209174;
        Sat, 19 Oct 2024 09:26:49 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a151f0c65sm576590e87.125.2024.10.19.09.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 09:26:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 19 Oct 2024 19:26:42 +0300
Subject: [PATCH 2/2] soc: qcom: llcc: add support for SAR2130P and SAR1130P
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241019-sar2130p-llcc-v1-2-4e09063d04f2@linaro.org>
References: <20241019-sar2130p-llcc-v1-0-4e09063d04f2@linaro.org>
In-Reply-To: <20241019-sar2130p-llcc-v1-0-4e09063d04f2@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14449;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=9IJyzCE4GaHn616VyWC1aCINwEhMZfazYzFsYxs/DqI=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnE93ChdRgcGcy1StCcOqdbrzX1XQ7bAfWV7lXt
 QWzfprHOVeJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxPdwgAKCRAU23LtvoBl
 uIjcD/91iaxwyPN09zf37Dw1Z9JD6lfhxpce9Mn1iqpdaIOQTlztbZQe5YuRxmrNEWRBBRdunJ5
 lDB02e7xai2w3X2nqRBQKzcvzABkR344huF9EVNt2YvWXiepWaW9B/SQzxz3oggOx4EdUvBN3jE
 iiXi9lhOmNTLth2AUBcO/aBFkGIJ+ZJ3UWK8cJNnLPTKKOJzRv7GsxY+UqSSYaTynCNpKEFpMV1
 GZG6TaQbxgVcMmAv3h2+TM5Jf/bEscKEH6CZ+eaRY+b32lbTJt7vzn7lJkrwRNaVzt9XTN4xcvC
 /C1K4R4GShUZ2IfNDJ91qnSY2GFZ87H818WjX8pZQWcsGNfhuiR+7IfadWXQrtsSTwk/0W3BlO8
 yHKnsYZg/YihEiZ7yXl15ASg2XFiEiSa+EPQGG7lHgbNSBHYMhtAoJ0a9lZYBeIhOls7xDidJeh
 SHpRjKv6YFAr5dkcxU1XrmCTQmW3vSs/1u0oFRsHy8dkLJkItb6sl5KWKWKh/MMXjMS6NJZ2aRT
 fNVe6U9tKsytfSZY6Wi0MKy0NUd8amBwg3ojWpu5yKOHaZXzfaKOMhFDCm1ibxeurlFudl0/Kr+
 DWDUfetQ8ukHayBU+qNg0fKQGqCZk7zIHhkRwSNxUAGpCd5bXo46c2/vBnplI0tvagC26UZVFdi
 +5b2GXSK04f5xMA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Implement necessary support for the LLCC control on the SAR1130P and
SAR2130P platforms. These two platforms use different ATTR1_MAX_CAP
shift and also require manual override for num_banks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/llcc-qcom.c       | 468 ++++++++++++++++++++++++++++++++++++-
 include/linux/soc/qcom/llcc-qcom.h |  12 +
 2 files changed, 474 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index a470285f54a875bf2262aac7b0f84ed8fd028ef1..ef84fe3b2af4e777126a8308bfd4ec47b28aeae2 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -32,6 +32,7 @@
 #define ATTR1_FIXED_SIZE_SHIFT        0x03
 #define ATTR1_PRIORITY_SHIFT          0x04
 #define ATTR1_MAX_CAP_SHIFT           0x10
+#define ATTR1_MAX_CAP_SHIFT_sar       0x0e
 #define ATTR0_RES_WAYS_MASK           GENMASK(15, 0)
 #define ATTR0_BONUS_WAYS_MASK         GENMASK(31, 16)
 #define ATTR0_BONUS_WAYS_SHIFT        0x10
@@ -140,6 +141,11 @@ struct qcom_llcc_config {
 	bool need_llcc_cfg;
 	bool no_edac;
 	bool irq_configured;
+	/*
+	 * special workarounds for SAR2130P and similar platforms which have
+	 * slightly different register mapping.
+	 */
+	bool is_sar_chip;
 };
 
 struct qcom_sct_config {
@@ -298,6 +304,408 @@ static const struct llcc_slice_config sa8775p_data[] =  {
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
@@ -2687,6 +3095,28 @@ static const struct qcom_llcc_config sa8775p_cfg[] = {
 	},
 };
 
+static const struct qcom_llcc_config sar1130p_cfg[] = {
+	{
+		.sct_data	= sar1130p_data,
+		.size		= ARRAY_SIZE(sar1130p_data),
+		.need_llcc_cfg	= true,
+		.reg_offset	= llcc_v2_1_reg_offset,
+		.edac_reg_offset = &llcc_v2_1_edac_reg_offset,
+		.is_sar_chip	= true,
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
+		.is_sar_chip	= true,
+	},
+};
+
 static const struct qcom_llcc_config sc7180_cfg[] = {
 	{
 		.sct_data	= sc7180_data,
@@ -2839,6 +3269,16 @@ static const struct qcom_sct_config sa8775p_cfgs = {
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
@@ -3146,7 +3586,10 @@ static int _qcom_llcc_cfg_program(const struct llcc_slice_config *config,
 	 */
 	max_cap_cacheline = max_cap_cacheline / drv_data->num_banks;
 	max_cap_cacheline >>= CACHE_LINE_SIZE_SHIFT;
-	attr1_val |= max_cap_cacheline << ATTR1_MAX_CAP_SHIFT;
+	if (cfg->is_sar_chip)
+		attr1_val |= max_cap_cacheline << ATTR1_MAX_CAP_SHIFT_sar;
+	else
+		attr1_val |= max_cap_cacheline << ATTR1_MAX_CAP_SHIFT;
 
 	attr1_cfg = LLCC_TRP_ATTR1_CFGn(config->slice_id);
 
@@ -3383,12 +3826,23 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 		goto err;
 	cfg = &cfgs->llcc_config[cfg_index];
 
-	ret = regmap_read(regmap, cfg->reg_offset[LLCC_COMMON_STATUS0], &num_banks);
-	if (ret)
-		goto err;
+	/*
+	 * For some reason register returns incorrect value here.
+	 * List compatibles instead of using .is_sar_chip since there might be
+	 * SAR-like chips which have other number of banks.
+	 */
+	if (of_device_is_compatible(dev->of_node, "qcom,sar1130p-llcc") ||
+	    of_device_is_compatible(dev->of_node, "qcom,sar2130p-llcc")) {
+		num_banks = 2;
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
@@ -3486,6 +3940,8 @@ static int qcom_llcc_probe(struct platform_device *pdev)
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


