Return-Path: <linux-arm-msm+bounces-53870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF2FA849BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 18:31:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 096EF4A564C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 16:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B14A8284B51;
	Thu, 10 Apr 2025 16:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SkidFJrO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B155A1EFFA1
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 16:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744302616; cv=none; b=ag7xsqyeTyrwrkG3cLnwmZ51OhRfY9eqboiabN/Bf9gRNCCI+02+QT90HtQUH+OUhOZE3KVezYeblMZzzhntjSGmJ1riMMKOzkzXlP9LQNTfAfzhsoXNsKTcyMlh/YDeiMDOyPEiFy0p0aIGzJa5FRpvRLAf/8gZ1m+S3P2i6zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744302616; c=relaxed/simple;
	bh=9hnSK/z/at7Q/XPaFDHxC32ZrhxYmQz5KS3r7i8xong=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lSXS3HDGdU0M64zFL4667uQXuKDyU5IA5Ezm7weW+AbCxGOxzmQIA7Yam4G5/hql2AkR3G+BkgaVCpJStCTtgy1Ph7O9/gNhrv8F+a4qpRl5XGLUfWlwWM+S6ts2mBMi4VvceMvwYR1bLl0ZPMJbWPRbWi3PnUiKziw34h5fJdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SkidFJrO; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39bf44be22fso603173f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 09:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744302612; x=1744907412; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XUkiFVraV2V5GiQVRCmgiYRRVnT/EoG7D4jFzUZHq4g=;
        b=SkidFJrOGFs0LDSdMC7Mvnlt7Vi5/0XEdnJ/yYLMYaxDLUgD4FAbkzY70aqzo6WLZw
         MABvUTb/2a55YQBh9fL6/PNwwRXSckY3SG8vg5sdNcp4uW0omaWUVXbYat70thgFPpIn
         cNeRwZdxBtxOrWKJfIpC33QvB4Jb/0ucz39tQvaes8/AuFrxdFeib2evBQC6rp5WIdCj
         eVbjI8BjroGPjXihmNe1RQ9Gp5OOo88mQjWMo323m55BV5FutE3MnkQeUvJhSZYpXKr8
         6wtSYMpmChU9ld2fQ7FI4XB1m99jxlmkvWgQSi7D80wrLhJZIfWWh8NOMZOOkyTplbGE
         R18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744302612; x=1744907412;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XUkiFVraV2V5GiQVRCmgiYRRVnT/EoG7D4jFzUZHq4g=;
        b=mi43hAvHQ22ls+/tgDLg1U8TEPpcSeIX6rTfattOC+OkC/dG9GWbaD8fP2l7yQa3+v
         vEPQJ+0te3HdNt3E9YzL8IdJ10J9KLUz42KoAvhibfXyquOPAgAv9beBEPfHKRIBofJm
         o5Ydg8P9yEU7/qibGbILMnfVG+u+wq5XJvDXHxwTxXA8pz1YXyqlQhwKmF3Tq4TE+I6n
         pUgODc290XhhS85TVQV+ENIFOtXqi6sCcYEO59oemD2ls51s6s7KD6UkfbtSOy2ZWEbY
         fTvOSOAa9p1m5R4yjGFbcpDM1hhlfjeJoaLfxWlhJHJmv9mzLwrIkZRn1kK7rNRXtSg2
         tPNA==
X-Forwarded-Encrypted: i=1; AJvYcCVNM+vcMZ0ULPMa4GGgGovco4k5j64BqXe9gjfar31C6hJrkl+yURfwtqQSLMaWBH/SvQ0hHbisxFUl4nY7@vger.kernel.org
X-Gm-Message-State: AOJu0YwKggOFZa5zrGRk665b5+9l0wVmcw+ePNyhJlHaTeG+Kak7vgMF
	0EOYVfbzHfdpLJRF9dG6j0ZQywnQfMVmhEtcm6IkZWkaZ9r9YH29UBaXBdpxm7U=
X-Gm-Gg: ASbGncvvqpnZ7jGfT3D0sNEooMzH3Hhf2jZDu2zCAJ4OcKZnBJS1cN8r3OUi2swA76M
	wQmp+q7nWAFn0e+wbshYzXtehLKTjEI4BP5ue7hup2mnTiq4nh/q01L2jcRCOmPOcToASjDXBKM
	OeI2gxQqaudOq3fcATDoSU6CTylFvcHHlDZgh9u05qEqU8wCKbE0gBDgv6idpWXvCWBx8VeLvOr
	/CBCrEp0E3Kg4aGI5ucpLqcrxB2C4UsBE0AS6IV+PGWWKbsu1IWN2d7mZHevB4HD009JFx/SgKV
	k9kG+IEXETyXniZQiWBn+ukVKZavwnb8rLII/d1OQpogcx9urwiVFg3D96UYxQ==
X-Google-Smtp-Source: AGHT+IFxjF2gHLiKfg5QgRRMqEL6azQIXI7YefMvmf03mZOpilzBQB8kYkVimEZ402PU9nPvEnk/nQ==
X-Received: by 2002:a5d:598b:0:b0:39c:1258:2dc9 with SMTP id ffacd0b85a97d-39d8f4fabf8mr2980744f8f.58.1744302611961;
        Thu, 10 Apr 2025 09:30:11 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d8936129dsm5350663f8f.18.2025.04.10.09.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 09:30:11 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 10 Apr 2025 18:30:03 +0200
Subject: [PATCH RFC v5 4/8] media: platform: qcom/iris: add
 power_off_controller to vpu_ops
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-topic-sm8x50-upstream-iris-catalog-v5-4-44a431574c25@linaro.org>
References: <20250410-topic-sm8x50-upstream-iris-catalog-v5-0-44a431574c25@linaro.org>
In-Reply-To: <20250410-topic-sm8x50-upstream-iris-catalog-v5-0-44a431574c25@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3981;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=9hnSK/z/at7Q/XPaFDHxC32ZrhxYmQz5KS3r7i8xong=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBn9/IO7fY/TiYLmUCrygDjWc4Pe2AD87n+YDOZ7KCT
 UwU8KPqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ/fyDgAKCRB33NvayMhJ0dLUD/
 9A1TPXjDCxWywg98LnlS1ERRlAGO3nuT4o1cQJHKoOihdlkkS4nzqip4yr92WqARIt+mEH5gCYxgWw
 AZF7rbYuyDnZICt5fuMWHZoEm2Qcs7KXFhG/peS+dzH5qH8ByrEOnP5omnmQg6FAcKFek6GHZG/tO8
 lh+y8PXEnQhwlXejW0CSS1Wz6K9HOgRwHvkrN8t/PGez7T8YmdklBboXJOxz50pOaGbpuFEb/PPnln
 xCXmpwXGpsSIgE0GPdn2TQcq2knEwfXiqOXSmwwV6wvk9IHX92Vt1E9ZPepKHNQ0qNaURIhKYxmjE8
 a/xakMKb/O/7OzMcT8UEfsk1APHpK+XIv+RmW77lM8DlJmdDAOhFz91FmBFBCU+IIbO/WuS4BuXDt6
 awHGcNj5I7ulxY5IFIn9nkIYK019/DujZO6JHFXrnvf6lu88IVYoAt4wM8rvXubxb2ooaykqBXBLv5
 LtSk+FBQF/eP2XKa0eGghzp9D6XlGE0it2Mpo+VsKozE7cX6LRZYT5xY3otoj6JW+iHMAqLw6eIqki
 IluZJzB8Rf4sx2YxFhWpNX0IEO66/TM7Kv7i+HJVBf219pLKbcwxEYiyQ5gWkZNjTzKAkXRljsD7DZ
 SxkHLI88FydvWuqh0qeFIRhf1q0xoc8jyNKttNQgg3zoXFCemXp+2cZJ/MSQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

In order to support the SM8650 iris33 hardware, we need to provide a
specific constoller power off sequences via the vpu_ops callbacks.

Add the callback, and use the current helper for currently supported
platforms.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e Dell
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_vpu2.c       | 1 +
 drivers/media/platform/qcom/iris/iris_vpu3.c       | 1 +
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 4 ++--
 drivers/media/platform/qcom/iris/iris_vpu_common.h | 2 ++
 4 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
index 8f502aed43ce2fa6a272a2ce14ff1ca54d3e63a2..7cf1bfc352d34b897451061b5c14fbe90276433d 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
@@ -34,5 +34,6 @@ static u64 iris_vpu2_calc_freq(struct iris_inst *inst, size_t data_size)
 
 const struct vpu_ops iris_vpu2_ops = {
 	.power_off_hw = iris_vpu_power_off_hw,
+	.power_off_controller = iris_vpu_power_off_controller,
 	.calc_freq = iris_vpu2_calc_freq,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3.c b/drivers/media/platform/qcom/iris/iris_vpu3.c
index b484638e6105a69319232f667ee7ae95e3853698..13dab61427b8bd0491b69a9bc5f5144d27d17362 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3.c
@@ -118,5 +118,6 @@ static u64 iris_vpu3_calculate_frequency(struct iris_inst *inst, size_t data_siz
 
 const struct vpu_ops iris_vpu3_ops = {
 	.power_off_hw = iris_vpu3_power_off_hardware,
+	.power_off_controller = iris_vpu_power_off_controller,
 	.calc_freq = iris_vpu3_calculate_frequency,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index fe9896d66848cdcd8c67bd45bbf3b6ce4a01ab10..268e45acaa7c0e3fe237123c62f0133d9dface14 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -211,7 +211,7 @@ int iris_vpu_prepare_pc(struct iris_core *core)
 	return -EAGAIN;
 }
 
-static int iris_vpu_power_off_controller(struct iris_core *core)
+int iris_vpu_power_off_controller(struct iris_core *core)
 {
 	u32 val = 0;
 	int ret;
@@ -264,7 +264,7 @@ void iris_vpu_power_off(struct iris_core *core)
 {
 	dev_pm_opp_set_rate(core->dev, 0);
 	core->iris_platform_data->vpu_ops->power_off_hw(core);
-	iris_vpu_power_off_controller(core);
+	core->iris_platform_data->vpu_ops->power_off_controller(core);
 	iris_unset_icc_bw(core);
 
 	if (!iris_vpu_watchdog(core, core->intr_status))
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 63fa1fa5a4989e48aebdb6c7619c140000c0b44c..f8965661c602f990d5a7057565f79df4112d097e 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -13,6 +13,7 @@ extern const struct vpu_ops iris_vpu3_ops;
 
 struct vpu_ops {
 	void (*power_off_hw)(struct iris_core *core);
+	int (*power_off_controller)(struct iris_core *core);
 	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
 };
 
@@ -22,6 +23,7 @@ void iris_vpu_clear_interrupt(struct iris_core *core);
 int iris_vpu_watchdog(struct iris_core *core, u32 intr_status);
 int iris_vpu_prepare_pc(struct iris_core *core);
 int iris_vpu_power_on(struct iris_core *core);
+int iris_vpu_power_off_controller(struct iris_core *core);
 void iris_vpu_power_off_hw(struct iris_core *core);
 void iris_vpu_power_off(struct iris_core *core);
 

-- 
2.34.1


