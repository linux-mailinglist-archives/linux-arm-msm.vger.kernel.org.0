Return-Path: <linux-arm-msm+bounces-67695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DF1B1A37D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 15:38:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 68C134E183B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 13:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE4FE26F45D;
	Mon,  4 Aug 2025 13:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rB7ttRBn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B355A26CE2C
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Aug 2025 13:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754314676; cv=none; b=VBWHWJhsGAM0Rwd6Mwo/baaVpNK2xSDGAEH/1QlQEvICYni8dG0HiDg0roOVhHRts0py7JVuYn857PSDc6B93UL6u326YsA5A1F9q0+QSTUjECZim+Exk8uaKLp0A8afSJf/26nzPVVbt4sABT9MtdtDYsYP8OEkqHFBnK9T0RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754314676; c=relaxed/simple;
	bh=A2MR5XCymdFdhBQ0wssTFQOzqHCcouyjjeJHUvvxDsA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nsl3gPraA1g3zoGkr8Lsorz7jS/NQ9dPD/qVw9zxyrlU+beX9DZUbuFbA8+FiLugGJKkur4WxVKdKuwDcm85EOvOzV6Q1SOKy0s4DMEdwbGrGuibMKpmWdq2hBoa8HggmMhT5xT7iSK2APSWti5NoH8lflHm3wZu3qhTU8aVQTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rB7ttRBn; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-af92f13d27eso44182566b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 06:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754314672; x=1754919472; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eh6d/IgXt2tPrt2Z4fiSLP3izgoSz3E8GH15HC3FcCw=;
        b=rB7ttRBnaQAExv4ORW+ZOK7kmUQ9ZRC2OpwyCgC0eC7FNOlf1FeDa8pgrg0KKUDUzv
         E+NqmLQJgcjsuC8bBeo/30nRX54iwW9l8iAEqca+RqFlcJm+9VKiDxBl8P6sbvYS4/Is
         wScfE+x9DOQXxCfXmeLOf/o9Brrn1owjTA1UrCw6YIzCHTl36DfFRfmyVce/W+DHSc3n
         ormWU7eBbgg9km4thGPGGjohft3a419DXKEsJ79NJ+IYR1e0/XbfiW4E1Tp1nOgKxpkS
         Fn6dFxqzQJN6Ee+5zP/F7cCV9hrSHiBjbAQigySYzYma3IIvRLPOhizFUQFCQzWskzRs
         RT0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754314672; x=1754919472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eh6d/IgXt2tPrt2Z4fiSLP3izgoSz3E8GH15HC3FcCw=;
        b=Y2UY/g6Bv1R2OByDj263euwxeeKUhceo+R66Bjir9QwpHRMJib+UT9hucprhwOvVOJ
         tq0BIYwD8dwpTOO0wlEzSHV2n+VLo2kFaLFLyT+EYLv5T/IWwamcunPcil4cQP1FjEw4
         ckhQSPDgSoMoGYds1mV4dtnMtU83T/LXEMQ12ZnrfNtfUWZLlrDP6yKxRLQhVu9ZvhAv
         +ABDEbSK/OAXJe9jFdURn43XOivxVweEmpocLGXt+m8q5bKc3ZJL3CgYzb3SssjReHaI
         LKwOGxp4VA7TOUlygDqEtXJnls8Un7Ygzztz9py8O00cS5zJWbqxiBJAd4g8rQ8S85kp
         Df6g==
X-Forwarded-Encrypted: i=1; AJvYcCWLAA0GUyCWmRmEvWNc+TiD2VCp8xreR0ernkFNDDGPYG2l2qr/0abe9FTl8BZAIEcczpNF7CAaEoO384nH@vger.kernel.org
X-Gm-Message-State: AOJu0YzpgpempDOnvIs/bdJzRLz1UV+Igxu1D+yz2LTiTqtAYV3aoDYw
	b9n//fUMrYB4LIQq3upuHPTeJIwqBDTXfoO85FmXI18iSbYjppC84RBUaaDphV1jHAY=
X-Gm-Gg: ASbGncu9qOKIjFw92sHVIoabA/92BoJ3fd2XTUK6hXprGl4b/GmJibFgmfJynPPRwYF
	zWBh1xdEUh+ETNQYKZK9NKPsfB2BQEib9heOa5hVhg5ID57HdhQieISZXe8rtoBrLXB7ZNTrFbu
	f4QFIzPIpJ6YsTCiUpulJzdXSSKJ5p+XA+H8aCYq5a8xDtmuRTcE7n5wSoiBcdWPTfiUZeY2hcF
	lcThTJcPtTBG3R2IyTKor+Y22HTjH02z9w7OjQM7sD0C1P/lnV9hVi/YeSnD4W/QnKmlzdQL3SG
	JJn89RqtVNQ1dsL02hMbcXa6jY7hqbKLTc93pIDAb6cqHSNiBIRBiOW2b2ZbHnXNkETJ2onAf4U
	MZUv09PJhg7FDuXwJt3/uGhKa7WmzuISM+ddSuIA=
X-Google-Smtp-Source: AGHT+IG3n11Vbg+G3YNfeR4OEieN3b7+GBrJrvuEqvgh4Zw+agGi7OOk2lFiTXK2pqxicgNxUsyNhw==
X-Received: by 2002:a17:907:9691:b0:ad8:8e05:e5e9 with SMTP id a640c23a62f3a-af93ffa406emr410130266b.2.1754314671971;
        Mon, 04 Aug 2025 06:37:51 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.218.223])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a078cbasm741533166b.5.2025.08.04.06.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 06:37:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 04 Aug 2025 15:37:39 +0200
Subject: [PATCH v2 2/3] media: iris: Split power on per variants
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250804-sm8750-iris-v2-2-6d78407f8078@linaro.org>
References: <20250804-sm8750-iris-v2-0-6d78407f8078@linaro.org>
In-Reply-To: <20250804-sm8750-iris-v2-0-6d78407f8078@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4799;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=A2MR5XCymdFdhBQ0wssTFQOzqHCcouyjjeJHUvvxDsA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBokLepsWB3TcSnLLq5Yg/Y82VwfazwyqCMYMQbf
 gH0NTYVPhOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaJC3qQAKCRDBN2bmhouD
 15IVD/wICWpGWzbrojI6/kY0FGVsONiRtqQBc++oD4PuOdFxElJg1ZrJn3LPzikGfDcQvETk0ea
 V3nGaody3nOA7ggCmrA7Dlr4LptmWpzWieMCySl2KTZEIu2pYF5WV3yozrW7T9od0MtzgLOuQ2t
 ifS+NxJTNoyLklfA4iJczCeqF7MC5R+J2367W6lFIdhNS0wvhqFNYyLe+onzRUqh5VAQTTbo+ov
 oEr/42vC8KeiYkkvbB6O7pyFu9L0pZO1vsxmeCf/J7QkTMT6DnKdmD5cM8wZdqzgPVAPmj+MIFD
 w59MdsJqBihVf7lbKeITSXftiPoSV01PJP1xnLQThWJrfmtVZWnt2kCDN5y4DYV+zKpQDXzvwaR
 Ay2QAs2rafGpgvy/hDD9+LjsqkNVy8Mb3nUCL2KhmrNQBrIUHpE+HSaRd0iHc+h9ZEOHOZCYF5n
 fT6XceLVDewz8VOMVn9NC7pSZHza4GSwLPNEzbU1M36ERjGtNH6qG/JyoVRjhZznQlbDlT7uigB
 LHVmGFZzP/niXO1FzNFTBZIUyPjltIysPL4eRe/jHSagnf6yOp0/a7iGHuQpnGVg6Dp12DmZfxn
 eaTVOqb8HP1dK9OeGIZW/3dwYNnhFMaxTMvZnBkKKdUeSX93UeG18HBx/UsuBL+JjAXO3FaPxqW
 6Tnffh1HXNwH/XA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Current devices use same power up sequence, but starting with Qualcomm
SM8750 (VPU v3.5) the sequence will grow quite a bit, so allow
customizing it.  No functional change so far for existing devices.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_vpu2.c       | 2 ++
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 4 ++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 8 ++++----
 drivers/media/platform/qcom/iris/iris_vpu_common.h | 4 ++++
 4 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
index 7cf1bfc352d34b897451061b5c14fbe90276433d..de7d142316d2dc9ab0c4ad9cc8161c87ac949b4c 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
@@ -34,6 +34,8 @@ static u64 iris_vpu2_calc_freq(struct iris_inst *inst, size_t data_size)
 
 const struct vpu_ops iris_vpu2_ops = {
 	.power_off_hw = iris_vpu_power_off_hw,
+	.power_on_hw = iris_vpu_power_on_hw,
 	.power_off_controller = iris_vpu_power_off_controller,
+	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu2_calc_freq,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index 9b7c9a1495ee2f51c60b1142b2ed4680ff798f0a..c235112057aa7b7eab1995737541b7a8276ff18b 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -264,12 +264,16 @@ static u64 iris_vpu3x_calculate_frequency(struct iris_inst *inst, size_t data_si
 
 const struct vpu_ops iris_vpu3_ops = {
 	.power_off_hw = iris_vpu3_power_off_hardware,
+	.power_on_hw = iris_vpu_power_on_hw,
 	.power_off_controller = iris_vpu_power_off_controller,
+	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu3x_calculate_frequency,
 };
 
 const struct vpu_ops iris_vpu33_ops = {
 	.power_off_hw = iris_vpu33_power_off_hardware,
+	.power_on_hw = iris_vpu_power_on_hw,
 	.power_off_controller = iris_vpu33_power_off_controller,
+	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu3x_calculate_frequency,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 42a7c53ce48eb56a4210c7e25c707a1b0881a8ce..6c51002f72ab3d9e16d5a2a50ac712fac91ae25c 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -271,7 +271,7 @@ void iris_vpu_power_off(struct iris_core *core)
 		disable_irq_nosync(core->irq);
 }
 
-static int iris_vpu_power_on_controller(struct iris_core *core)
+int iris_vpu_power_on_controller(struct iris_core *core)
 {
 	u32 rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
 	int ret;
@@ -302,7 +302,7 @@ static int iris_vpu_power_on_controller(struct iris_core *core)
 	return ret;
 }
 
-static int iris_vpu_power_on_hw(struct iris_core *core)
+int iris_vpu_power_on_hw(struct iris_core *core)
 {
 	int ret;
 
@@ -337,11 +337,11 @@ int iris_vpu_power_on(struct iris_core *core)
 	if (ret)
 		goto err;
 
-	ret = iris_vpu_power_on_controller(core);
+	ret = core->iris_platform_data->vpu_ops->power_on_controller(core);
 	if (ret)
 		goto err_unvote_icc;
 
-	ret = iris_vpu_power_on_hw(core);
+	ret = core->iris_platform_data->vpu_ops->power_on_hw(core);
 	if (ret)
 		goto err_power_off_ctrl;
 
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 93b7fa27be3bfa1cf6a3e83cc192cdb89d63575f..d95b305ca5a89ba8f08aefb6e6acd9ea4a721a8b 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -14,7 +14,9 @@ extern const struct vpu_ops iris_vpu33_ops;
 
 struct vpu_ops {
 	void (*power_off_hw)(struct iris_core *core);
+	int (*power_on_hw)(struct iris_core *core);
 	int (*power_off_controller)(struct iris_core *core);
+	int (*power_on_controller)(struct iris_core *core);
 	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
 };
 
@@ -23,6 +25,8 @@ void iris_vpu_raise_interrupt(struct iris_core *core);
 void iris_vpu_clear_interrupt(struct iris_core *core);
 int iris_vpu_watchdog(struct iris_core *core, u32 intr_status);
 int iris_vpu_prepare_pc(struct iris_core *core);
+int iris_vpu_power_on_controller(struct iris_core *core);
+int iris_vpu_power_on_hw(struct iris_core *core);
 int iris_vpu_power_on(struct iris_core *core);
 int iris_vpu_power_off_controller(struct iris_core *core);
 void iris_vpu_power_off_hw(struct iris_core *core);

-- 
2.48.1


