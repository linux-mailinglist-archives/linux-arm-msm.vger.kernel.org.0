Return-Path: <linux-arm-msm+bounces-49988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1946A4BF78
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 12:55:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39738188989B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 11:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B20820E00D;
	Mon,  3 Mar 2025 11:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GR2fYYdF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40E720CCD0
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Mar 2025 11:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741002798; cv=none; b=Dx8QcxyNIpqqTKgCiwWbtjGLnYd5S5uMG/gvxNxLwxS1A+MpDYE+ETIGv/d/tytplX6r0lR3cSVHhspQ4h6Aqac0cK2oBECe802opEEquOfmKmxLvG3N2g1sMbHSxUpP2y2TxA8afd0K26RXayeyI2HUFlOO8bKnUUVhrjWS+dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741002798; c=relaxed/simple;
	bh=p7hkdHG3Uk3MNaKmI5KRSyrO6nMtHV/TriUgNA5ZLkc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SOjxeXL1tlEwl/dBKdBOrcKc2Qlo6eOOG35Pb1zeqeiVIb5YULhk7UiLDat+qT5a1Fkbz+Xn9ivwby1UtJlsA2NGuEdRTggubloQjhGAXmKCuv2FnFt98crtGQiXcrh/2XeNQkyxdJLib01vP0RTtoqndkoBA4/3ibmtqv8oWxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GR2fYYdF; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-abf3cf3d142so334791666b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Mar 2025 03:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741002794; x=1741607594; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=egcF/0fSfpEIM9jKlb06PQtyWEHsWxmve3UKG8E7nkQ=;
        b=GR2fYYdFVQ8cWKiQEgcWR3zWYB6YYoUR0uCifv6xlrL7rMy0cGHfd8b4lnEOqMWMbS
         WzyDYhsT8FcKRADZhvh4Kx5dhKHdG0MMBC1nRbtaszCG1+Br/RseS6NNqSsaGDsiNKnB
         IzC4oGZTSwPsjBTmP/84paPJXyQVTUu8DMWq5TLMWtxFPwa2iGzGt27VoBt3f6f68vsD
         B+VWl4l8LsXxQMdlXmvdaJOgr9Hcn99BpmkJ67gqi8ybWdRPBi0CtsyJNmqsAdZ1NgPs
         IT77d7PPXQTZxdNQYSX0iI1VCohQMlcKO7Bpz5w8Rmy7PwjxC2VLIy7bZIhgAStisJe6
         eiUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741002794; x=1741607594;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=egcF/0fSfpEIM9jKlb06PQtyWEHsWxmve3UKG8E7nkQ=;
        b=F9awxJ7eXh3JCw8myyUWKk3upAwPfe123ZmnPjIF8CO3L6pM0WfAQasu7KsQeCgeSX
         psCEYZvhmiYpmLj5RfpoO0Sp0Ty6W8zvBApavVaVvjS5TLa3f12w3nxl5uVC1iTArm+z
         /Xi/DfAchwDrqqDZimGTz1D7wpkZnaVZJdGLdTOkZgpOOQh/WWj3QsGrEhvxppvplLto
         Ktd1O8bE15eHxTGt1PsTzFAWGBneKRK9Q5K5AYV/DAU1hga9E+ox4DujdlVbn1KdQUNz
         VjyNDCKg/eakb8S3KdvR6ZCQeXbMkqT+RPpu544Bdcc6u14C92pv1sXwUNMRSKvDEkNA
         Y5Xg==
X-Forwarded-Encrypted: i=1; AJvYcCXd4ldbFdsYLL0ROS4akZMTAaSbM7YWxW5+IJlWmlZ0l6GxytvB1T+VGCtWAKOE7EQ5B2gFDfvKCkLnwv1R@vger.kernel.org
X-Gm-Message-State: AOJu0YwbaC45JOHT5TQ1eGTvOrz9LdM+6p3XqlzOIdkotyWoHzvysiLf
	7ryme2WJsOmxJ4Ldg1D3rVg9m1j22pgVSxcK8YoZNmnMD2OWIsxagUQuo3zABGk=
X-Gm-Gg: ASbGncvTK+FBE5XbvKtq47I/GhIDvo/pIifsRh0ppSFGVeyTDtfaUFfqOUI7HzxCtGj
	maPzmLixMd6e0hUti94fxpiqUz2LVs7lszSXyUXwYhoYCGEHDfSEFpnJsLFDO8WbFxZwqz/zMa+
	kpuYtiTvjmJ5ite9GzrdZYsqC6rSeBHo/RHyAwxkVwN4CWNpXpiILlkV8bF7EgweuQ2EM3eH9Y0
	taOLiBml85Z5wJuzB6dGN0VPiA09UougtE73INvCS1zrmhZ4l3LDvOZUXioVmPVoh0BTmehQbfM
	BEYyEGrGzQVYB1dXmrBqtvobhgpPRey4O8NidZlB1B0=
X-Google-Smtp-Source: AGHT+IEn2yl+zGSi0lGbr7GuumDLDA2KQKipUpCk7GYI/B361NHJGLE4LlExFZMYijY48JcoBPBUsg==
X-Received: by 2002:a05:6402:350e:b0:5e4:92ca:34d0 with SMTP id 4fb4d7f45d1cf-5e4d6b4bb17mr36004144a12.20.1741002793949;
        Mon, 03 Mar 2025 03:53:13 -0800 (PST)
Received: from [127.0.1.1] ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac1de83fa49sm86833866b.158.2025.03.03.03.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 03:53:13 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 03 Mar 2025 13:52:52 +0200
Subject: [PATCH v3 3/3] leds: rgb: leds-qcom-lpg: Fix calculation of best
 period Hi-Res PWMs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-leds-qcom-lpg-fix-max-pwm-on-hi-res-v3-3-62703c0ab76a@linaro.org>
References: <20250303-leds-qcom-lpg-fix-max-pwm-on-hi-res-v3-0-62703c0ab76a@linaro.org>
In-Reply-To: <20250303-leds-qcom-lpg-fix-max-pwm-on-hi-res-v3-0-62703c0ab76a@linaro.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Kamal Wadhwa <quic_kamalw@quicinc.com>, 
 Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>, 
 Sebastian Reichel <sre@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
 linux-leds@vger.kernel.org, linux-pwm@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2125; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=p7hkdHG3Uk3MNaKmI5KRSyrO6nMtHV/TriUgNA5ZLkc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnxZgiyqHWf1haD9iRgMsk0Qyq6WO/KweHfvpfz
 xnu5vHbyv6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ8WYIgAKCRAbX0TJAJUV
 VjQJD/wP9bczE8rW6CvDOvpJ+sOXg5GTtEI66RM3uKAPtmvc8+Soxy7rJchtalzl21sjnm5MoUH
 cgTwF1YrC/eq8jUEMozsg95EO2PBAa/H364bFDQN0a/EvUrjliKxytPRJu88qNZU8BRE3xfgm9+
 vvu7mnVg1HVnyp0BWberU7hwOHL8uUXe1XcIuGLS1J+g4Ug3ZPHRip+Cpw1BKYZJrHeGZDOKx+f
 bct27pyLFk7z0JKMCkxByvQf3RdPpFYYUZC9rROEOosJxf/ce/f3gbreCqwj4WoYpzt+vOHBIMV
 rMZ6dfk2/UUHUudnH/5YHpS2kVo+8e3776TxDMPs6xJYuimIA1aKocK+XsrGMADCgXoMktCLBES
 Z1kNaBOLHjbPYKzNU6DLgtReKI86/z6yhfoTbKNgxw3xMegwo+FAaQhPYyGIJi+GcsbZKoq0HsV
 fjk87QUBjx+dA12MVWLQzRRVdMDwaNLVXm4sx6t4bX4uTUIKV8mlU3NmhCb05uZzcrry55L/0hR
 oUw8xUAuJq8CVsiKCRiFdA4W2EXBNwaBsj8EIAKxxHykqf0G/B6VngjiIh9fOaFgt93FWlRmiV7
 2wE1ixoR7eYwPKszb5nKJcf1uWtQIXU8uzsWQqWJRDVh8X/BnPWMhm9rtgztO2oRxQf8cW0Carq
 SaUVL5zmGZTrO5Q==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

When determining the actual best period by looping through all
possible PWM configs, the resolution currently used is based on
bit shift value which is off-by-one above the possible maximum
PWM value allowed.

So subtract one from the resolution before determining the best
period so that the maximum duty cycle requested by the PWM user
won't result in a value above the maximum allowed.

Cc: stable@vger.kernel.org    # 6.4
Fixes: b00d2ed37617 ("leds: rgb: leds-qcom-lpg: Add support for high resolution PWM")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/leds/rgb/leds-qcom-lpg.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index 0b6310184988c299d82ee7181982c03d306407a4..4f2a178e3d265a2cc88e651d3e2ca6ae3dfac2e2 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -462,7 +462,7 @@ static int lpg_calc_freq(struct lpg_channel *chan, uint64_t period)
 		max_res = LPG_RESOLUTION_9BIT;
 	}
 
-	min_period = div64_u64((u64)NSEC_PER_SEC * (1 << pwm_resolution_arr[0]),
+	min_period = div64_u64((u64)NSEC_PER_SEC * ((1 << pwm_resolution_arr[0]) - 1),
 			       clk_rate_arr[clk_len - 1]);
 	if (period <= min_period)
 		return -EINVAL;
@@ -483,7 +483,7 @@ static int lpg_calc_freq(struct lpg_channel *chan, uint64_t period)
 	 */
 
 	for (i = 0; i < pwm_resolution_count; i++) {
-		resolution = 1 << pwm_resolution_arr[i];
+		resolution = (1 << pwm_resolution_arr[i]) - 1;
 		for (clk_sel = 1; clk_sel < clk_len; clk_sel++) {
 			u64 numerator = period * clk_rate_arr[clk_sel];
 
@@ -1292,7 +1292,7 @@ static int lpg_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 		if (ret)
 			return ret;
 
-		state->period = DIV_ROUND_UP_ULL((u64)NSEC_PER_SEC * (1 << resolution) *
+		state->period = DIV_ROUND_UP_ULL((u64)NSEC_PER_SEC * ((1 << resolution) - 1) *
 						 pre_div * (1 << m), refclk);
 		state->duty_cycle = DIV_ROUND_UP_ULL((u64)NSEC_PER_SEC * pwm_value * pre_div * (1 << m), refclk);
 	} else {

-- 
2.34.1


