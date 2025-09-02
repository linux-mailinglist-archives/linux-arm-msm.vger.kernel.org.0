Return-Path: <linux-arm-msm+bounces-71605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A722B40106
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 14:45:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8C841A83821
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 12:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFEFF2D3EEA;
	Tue,  2 Sep 2025 12:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rSwsslF/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39CA2D3218
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 12:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756817126; cv=none; b=L2f4Pu8W52o5pY2vCobE1LIsXBZ4wNBnkLtpB6vJAA8QFLk717ItPG7QjLJ1/eoweKkTeNXIEKDgeEPV5dRFrmWefbGyQimP6b3JNV8/hpq445RhDQ86qaHrbGES5GJp+X3dbSkUSLCVVmGR5fLReHwZZ/PBjDV7HOvpAY7ouZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756817126; c=relaxed/simple;
	bh=UNrXAhPVi4o6V+j9oe2jBczmWPYtdyhHPFccqvTrkIw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lXuOPdjuH0VaWKcrMqZ4DYhAVqtd56Br0xzWBpZZO8zYrJtzNcDWzn1hHl+3UXZE/sI1ktnGgszUEuJpx1EcJsEw0COC7HRIxgDYIn9wMR9BuN/0gP7Oabt3HcmiCDArpSmUMN8D7qxnvGTasOl4dAuEsQDyNAh3i4Y07oKde0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rSwsslF/; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aff17215facso27149866b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 05:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756817122; x=1757421922; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=csPaPsQC27/26lrBD+VImmVav8PzALwsLag537KkFZg=;
        b=rSwsslF/XaDPHvL8tapdLgBMG50IeRY4pGzhfFesX91YlNI0/FueqbOaXo+c/xI/yr
         0L/AsDhS8yPkZGJsppn89DnWIbjvnEnr2Z5SLWknklMOS1TTfxZEWZWfldCCmzT8K4i3
         x4yARdYUpi1iwk7KVyF45+id+HAIYFTrv3N6IOjbWByALq2k38aI5HwXWzcbG7Fef73E
         8m9SIY69cnP23eOnbuID8CcMSDduKrTHp118OJF7gePGnKSuVvv6QI6TVquKmXtR6R+Y
         i3KkIXoUeXenvYJxyFVp/NTqpeZnx9eXUgKpp099GgQvnGZ1Uf8GmEX+2cRT1BUh/ap1
         I47g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756817122; x=1757421922;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=csPaPsQC27/26lrBD+VImmVav8PzALwsLag537KkFZg=;
        b=hiGpxAIBelwlBT0V+4CjL4sCI7XriD+364H79etu70wOOhBGGaUJ1ASgqvshqlAKL3
         yTRf83p1QO6psFg0WfDOQrs61pvp/hlEX+jljrzSALWw7e+MaMWO8svHReuqWehj+JRc
         7JX4JchrfDtS2zE+PWkgSutedHq6Jt8yJ8BEB0zuNr3OXdK9jQ9A1MK4LgivzfvcUtaR
         Bm56nvUDHEbf9t59Uhn0iWfNHNeCJLr4cnX3AOAFNUyjjSpeW3hezQUBgwZvy8b7KUP+
         x6U0rv1Ag/owgUFLakzFkVK7HXL+Ta0BGNU6EEjMZJzAK3sWYbu+lXkIOVUfDsDF7G/t
         Kptg==
X-Forwarded-Encrypted: i=1; AJvYcCUXnysXbiLkn1zkTWEFqgeu8ktyDXEDDUjJN4Y8w5P8TW1Wzhqfb+vUg3ddtYlEzBDnDFCHcG0xED5VBeD4@vger.kernel.org
X-Gm-Message-State: AOJu0Yy063JmsNGd8JJCY3fCuHwzF4E5Lh+tCm1KQEJ2VEOcjkVfrE9W
	fjU5Qua0EuhIvb9GUROdwwj1UXBhRBIg4K6B7obLCm1dupNdD21dGfwMGvibJS3bB50=
X-Gm-Gg: ASbGncsHeoOH6+WWITSrwYF1j2D+5swfLDrumYknUFuU2/EATZcH9s87gs/vffwx4OU
	cYUq5uv/QlCZRTuUfYhvWm8cu93Ayi0PoS3nl0XKUGVpwW/QnHz1F3h2DRaXrsC1fd2k+XBdwGc
	3CLs9bgqNR/NLja9/a16S/R/199NFTxOubmMr/AUtjgXHVzBdHXjMX9kAWmLwzH9vRa3m8aDFUQ
	XxQSMSmWmK7T+vvJ/viJVHn6t2jFFQPN2TLCoSw+WE2DX3BsjqcCEIHp+1mudWQVafnQV2jBDgD
	pi/fpg7lUXHTZvZh6J1fb0pbszHJf8hlGCijtM2Xlhdv7lTSwo+kyMopXAlP/h5r3RUcJuE8mAO
	+sC5lWo4gL1XRF8FcObYXmBS0DKlxpmztT22AEuukebX12yIRZw==
X-Google-Smtp-Source: AGHT+IHRXjjY5QVhZ6cFLHwA0qd5L1D+QNqT/szHt20vMBzDpzLtoRIB6GLAZ00WBotXJEyvpBkaag==
X-Received: by 2002:a17:906:161b:b0:b04:3333:7e64 with SMTP id a640c23a62f3a-b04333384c4mr299543066b.4.1756817121893;
        Tue, 02 Sep 2025 05:45:21 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0428f88a61sm515784866b.70.2025.09.02.05.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 05:45:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 02 Sep 2025 14:45:11 +0200
Subject: [PATCH v3 2/3] media: iris: Split power on per variants
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-sm8750-iris-v3-2-564488b412d2@linaro.org>
References: <20250902-sm8750-iris-v3-0-564488b412d2@linaro.org>
In-Reply-To: <20250902-sm8750-iris-v3-0-564488b412d2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4858;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=UNrXAhPVi4o6V+j9oe2jBczmWPYtdyhHPFccqvTrkIw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBotubbdrPRrDwIu+LDoXTGkBfCTEQ77KQTzQ+2w
 H/Z0EoedrKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLbm2wAKCRDBN2bmhouD
 16NzD/99btLDs7l5OSD7/aBm/zl2Y3SkcQai30PDc7DaY8MyG2viRNEx4iaFlMzbqc1XgwQfzKJ
 EUBrvp9azeg3sDzrF7U5/1xyA+jio+Mt1GodWx+fIB3W0ZtrjoUKG9vVD0UaG9e0vmOXpHeUk/i
 CkVgDQl9gWFrt7XcrOPVNDvoD7xUBV8cl8onXhrBnUQPAmoTVwJX7x4gRRFRmzk2sE8x2uttzEH
 K7Yro4wszvVKbCG2BgtV9+JbgJ56mIcNJ3sgK54IH7h/ty4AH++6BfmIbF/Yo97OrTzx9adVJ1M
 oqWgW+sKzLcDYK3hKWX5Q6786VMJqKL1IRofjZ8+ZYkrprqkRohxU6r61xEHlIxYm41v/fL3cXF
 rqWfs/HI7b9sJZsU9Muk5nklPOi9lGplX6GUkKP5od8F8DC/aClmGshCNwBUffJFUCo2aRm0En0
 vw+N05bdRVPI+q2rVK/vZqE6xSnCmcHrt5/vKKIeiyxxw/f9rjzVhJ8kUrKzR4dKx0gYsrrHgCX
 DkWf4wyKNa/Us2NIP7cp1Hzdqj9TZK4OY172R6ViPTaTbTNCTVqBvYE7xsco/qOoxEIFFrRdkzk
 MXTMYegngQhU20YbVuMWDUTE4q+i9F+JTVtpHkLsVz6/OYUMsHGTDeOnj57dXVZZOBwl74surwf
 xzcbMvgtNBKhNJw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Current devices use same power up sequence, but starting with Qualcomm
SM8750 (VPU v3.5) the sequence will grow quite a bit, so allow
customizing it.  No functional change so far for existing devices.

Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
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
index bfc52eb04ed0e1c88efe74a8d27bb95e8a0ca331..27b8589afe6d1196d7486b1307787e4adca8c2aa 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -292,12 +292,16 @@ static u64 iris_vpu3x_calculate_frequency(struct iris_inst *inst, size_t data_si
 
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


