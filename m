Return-Path: <linux-arm-msm+bounces-9977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C49E784BD19
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 19:44:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B0771F24FA6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 18:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EEA614002;
	Tue,  6 Feb 2024 18:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d1nr+2Yw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCFE134D2
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Feb 2024 18:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707245025; cv=none; b=kLm05Ko5v+G6j2PL6Dq+E2rDD2IexPE+nFXAAVp3LDJ3DRuDS+T6e4ciwsbDpmc8V/oTsieVhPi5JUT6cU9dR2iRdqBhjxJobF2nRocuIWK5gOHHRVwQfWuN8lgfDUbIQ4PxDR5pVxdQUkx1zbc/3WeeJFUev6c5wXb0qhVpJyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707245025; c=relaxed/simple;
	bh=eVTHPrT2Om77CguELWV9DheT0YsZYlvmQpUZDIbQJew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VktMhGO8WFbZad85x4qIHFlibxvA2VmFn/CPONCOCiRkLohou8hjbLahLYLyV4UGvV47E5a0N46cpwj4cBvfjKyxgF5OOlFRadl/s5uX+tmeqG22r1SltsOyccyBC+5ZbfSluR0ZExG8O8ae6aseJvsbtZfz/QciG/ajqnXvuOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d1nr+2Yw; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a380a1fa56fso171130366b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Feb 2024 10:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707245022; x=1707849822; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xM2C1iHMDXw9CwZlcSXjRB1uc7rC+T3sEjwlxMY+VkA=;
        b=d1nr+2YwHnbjAZxbYIACIvrQa3Hushxw16qK24cdSyo37se8svev5SnHHjW1tNz5Ml
         o9bdSNiF4+9uGPSsc0BOyzsiiHrQ5sitdPAkKmQPCKKFem6B7zYP8vLKM4T87TnrwXCK
         0o0tkMn5hMKpb0l7OOZfa1K8tDk1iaNvpLsJrFQMIn/6VGhrEKfJnuqK1ke9pDSb+jB5
         qrHeStwNV+LHm8uhm84WluNMJNRWEMb6Cb9RWIB7wshBtHgkHnHaVqOajNuV0TeKaU/7
         kY+739UO1UDPVIOTooqO8kEHeMzuvoLRXsWduMFeVvIexuZbdcAEon7zbnhrDRmB8Vlu
         mbKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707245022; x=1707849822;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xM2C1iHMDXw9CwZlcSXjRB1uc7rC+T3sEjwlxMY+VkA=;
        b=fHPuFppgsCkGJbDCigqKokRbo9J4V9oFCzqZ8/BONGVpukxZfptQDNl9avcolatQZL
         GAfhMNAJPRnVRbJPpKTVCNufQR4cFKcItyzfbuXW3Sm7XO+tH+Qk7XXn9cOWD2VNcXeP
         A5uiL0faKTo5IxGMiDHqZHIHPx28h6ai6Hk4jJp/QaIWu5d1OYeGIixJ0F7LM0fMzWGQ
         zHCr3zJoI+qBxjt3Q3y/WHnQSFJsFFUEjzQlx6Kk4ntfHmsTUszgfNa04nRMILgAeRh8
         JuVLuu4RxqbZTaZ4GjDpNzUANB4bbp63Z1Arg0W02e8R4y5d48yZfmDcrE3xpEQgvrmi
         3aNA==
X-Gm-Message-State: AOJu0Yw20C7It2glZqmyrO9GMHmZ8GIKprW4DJP3mcRV8N1ta35E8y40
	3FBGBkiQPMoBoVLJv6Cigbf5p9UG3rWt5DlfcY+SGfosvKVfNP0RTfeWlP0/a88=
X-Google-Smtp-Source: AGHT+IH2iK/Y23icXwXCpnp6cD01kvobMXN3oGi4oEp+g7RX4ln5paAS4U3jlHLpu42XaCc5V9Wzkw==
X-Received: by 2002:a17:906:4e8b:b0:a37:687:275c with SMTP id v11-20020a1709064e8b00b00a370687275cmr3895405eju.20.1707245022012;
        Tue, 06 Feb 2024 10:43:42 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWM+GgllHBWJ2Etigt3pjbEE3yQWss9rZmqNix9IDfjo96W69+gFfgzX+EoOyxHGK9XyfhotbgkKC/2xK0Rs3ENtxKyU9Rv6N29Q6+UzFrih3srAH//Lf/RoSThaXYcb9SX+7Oj++/Yae6fy5u6ZrpertCdAMcBDia7qcSLrEubBjVSXU3FhCsssN0p6lKBF1fMp1xCZmZhyfG8FoK3FXgHrdBf7vJ7X5G2DxfxbkERILWbIrM84Qkumq1tEx4QcMjIkOVNpKjWBjPoZEUEgQpVmO/ineA+S0p7F7MH/55feTOJpKahEPD3b2OIlT1dlbuyPnC3Tj1hquwYfEYHjPawp6nkr9i6h04jiuswwfBBSu+I1GpZtmb/DoXy5npAupQjn27HGRIKhcnx+liyK6Lk4T/8HshXfewb/2sTER1D/ARMUMDbhLeKQqe/aIREZ8sQ4OadVyDJ
Received: from [10.167.154.1] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id un9-20020a170907cb8900b00a384365e3b9sm562305ejc.195.2024.02.06.10.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 10:43:41 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 06 Feb 2024 19:43:35 +0100
Subject: [PATCH v2 02/18] clk: qcom: reset: Commonize the de/assert
 functions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240105-topic-venus_reset-v2-2-c37eba13b5ce@linaro.org>
References: <20240105-topic-venus_reset-v2-0-c37eba13b5ce@linaro.org>
In-Reply-To: <20240105-topic-venus_reset-v2-0-c37eba13b5ce@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707245017; l=1957;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=eVTHPrT2Om77CguELWV9DheT0YsZYlvmQpUZDIbQJew=;
 b=BZQy6EUUZshJ+QDMMiLJvwCLm5SPTPfLO63fDw/6rPwVOSyeW8TZ1Eh0LDNn95U8eLZ0YsW3m
 AZQz+o8uwqQAtJZdCTKk4N2E5PrOw3bN7o3Qtzw6VTv2nXKOAtbYi7K
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

They do the same thing, except the last argument of the last function
call differs. Commonize them.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/reset.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/qcom/reset.c b/drivers/clk/qcom/reset.c
index e45e32804d2c..20d1d35aaf22 100644
--- a/drivers/clk/qcom/reset.c
+++ b/drivers/clk/qcom/reset.c
@@ -22,8 +22,8 @@ static int qcom_reset(struct reset_controller_dev *rcdev, unsigned long id)
 	return 0;
 }
 
-static int
-qcom_reset_assert(struct reset_controller_dev *rcdev, unsigned long id)
+static int qcom_reset_set_assert(struct reset_controller_dev *rcdev,
+				 unsigned long id, bool assert)
 {
 	struct qcom_reset_controller *rst;
 	const struct qcom_reset_map *map;
@@ -33,21 +33,17 @@ qcom_reset_assert(struct reset_controller_dev *rcdev, unsigned long id)
 	map = &rst->reset_map[id];
 	mask = map->bitmask ? map->bitmask : BIT(map->bit);
 
-	return regmap_update_bits(rst->regmap, map->reg, mask, mask);
+	return regmap_update_bits(rst->regmap, map->reg, mask, assert ? mask : 0);
 }
 
-static int
-qcom_reset_deassert(struct reset_controller_dev *rcdev, unsigned long id)
+static int qcom_reset_assert(struct reset_controller_dev *rcdev, unsigned long id)
 {
-	struct qcom_reset_controller *rst;
-	const struct qcom_reset_map *map;
-	u32 mask;
-
-	rst = to_qcom_reset_controller(rcdev);
-	map = &rst->reset_map[id];
-	mask = map->bitmask ? map->bitmask : BIT(map->bit);
+	return qcom_reset_set_assert(rcdev, id, true);
+}
 
-	return regmap_update_bits(rst->regmap, map->reg, mask, 0);
+static int qcom_reset_deassert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	return qcom_reset_set_assert(rcdev, id, false);
 }
 
 const struct reset_control_ops qcom_reset_ops = {

-- 
2.43.0


