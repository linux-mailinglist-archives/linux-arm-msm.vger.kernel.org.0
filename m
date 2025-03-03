Return-Path: <linux-arm-msm+bounces-50029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A99A4C6E8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 17:25:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD6F7175EB6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 16:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE19222F17B;
	Mon,  3 Mar 2025 16:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B68uI8ij"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CBE215191
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Mar 2025 16:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741018491; cv=none; b=o6drHK8b6D8ABAsQS/VCMhWQjL6RHMy7igWJK30ba7VZvMObflMgAP+vwRfnZUlHfRO15LvT4q0Mq5qm67ebiFnK85C0WcQdhjRwvwJzbEKvqSlFvmDJPnBCUcNqtNelgPcYnN6RlaD6LcAQ1FwVBql54KWVc7VMnHhOvxMCN1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741018491; c=relaxed/simple;
	bh=SW851bh5XjUCfDzmObPjOBzVvFjoWLDdCSaH8tLiKzo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Jejyo8+T+bKVtR26WSrqJO8xuxyVoGTjTBpLjglHBM7AUcBqLjMxANZPcUdSiRPqkPuTVKBBa7a63N3AKWUymHbjZ2mK4pemdhbloFxHKAflBVAG4nj8g6XcueQJFbVaV92UZ4kWDy8XRDszzOV6GFmFJIruGr9gvYOh37LnfWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B68uI8ij; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e0373c7f55so7093166a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Mar 2025 08:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741018488; x=1741623288; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4EjMp3BG+6HPrPb4bltHW8Z8/x5Nsu7f8FnE3Hkd78M=;
        b=B68uI8ijz3hT6UjrkrDttzLkjHyjYW1OHyBrxZLnuecTYEMSnrImxJXRadeaC7NHwq
         t16BHqOJyNOy9KRAPmSwBGxnjnfX7dk4Ib4E3FGXGuHuA+qxbxA0+1JTbYNbQgfCKDM8
         1sulTnr3T8uHBA4iFdRgZfLeQIZaiIDoxlM+ZVu2U1MZY8r5txHdyVMmPSpbtmvKlwn2
         K38iO4ph3DUeq8KTyKTr3nRKBX6bIvwOEnOr/XIkCJ0qmXZjcFtg5rtWkH8GDRg07JSQ
         CCBXgMb1gJAiziA/FQgk5Pygp/A1GkoRv/oHulMfX9fYI7xDRRkHjvxwovNkdwaEvRln
         e5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741018488; x=1741623288;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4EjMp3BG+6HPrPb4bltHW8Z8/x5Nsu7f8FnE3Hkd78M=;
        b=TKQ8WOS1G4KTsWA1AkZF9MMOO5jouzB7OKBS4v1dejkoJC0+wPhGtc0+7BVPZ8oYBZ
         tkl4zFwScI2PesuK8TkctDtJ9+HsLdg2JS1CuLMZ1IvQ1hyFtzdYICur7MEUgJalhttJ
         n4n9V6uk8pt6UY47xtZhlvXUmXpvzcjbUkiYUO26++yrPmZxTiYEnER3mZjSIvDNlp1A
         YHi8W0UUDnEXilXFj7gVjxnzwN7ndPrUYxW5YkYmmjUVnKrm0whpLCICvCP4qyl4SCsx
         3OjFgVJb1uuMArmiDxJPOQboGnI/fWeVt6zUlnNfckyVCnCTbV80BMj6kyEN/akQlTRd
         qVxQ==
X-Forwarded-Encrypted: i=1; AJvYcCX91PWQREUmIB5z9o0JEsffK278/Oe/Kh/GXIocJaWeyPSC8kPGbNFLm+xzD+RT3WWfdSXx9OBs8zWOdTSC@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+ieL+U4xBhYWeUejW6ztcdgfY15yCPWykDTuccIcXLdzY8ANq
	O1uRXiyPHvLYJFWxINjxC8Aims9Wr1St1u6mAPQs0gAxodBBQ7hXZkL9Cpcy56UEOIMhULmLrtO
	5
X-Gm-Gg: ASbGnctP0T+hKdxlENlZMufWSpC7gl9AprcxnBXRYQ1wDRF0V6K6f60+54/n0X5ykdo
	Q5Ap7HkvD1pgOCFqaAgWdVSQ62kJFKUXsU+A1vWYRR736ddciU4ELSVpyuCBsGe/GQ8EVGVRoFc
	VLJPCZwLfKWJdvIIHwxrAkY/G97lSBbCh4n/gkTivYWYBmPsf2a9zRKcLaseqy4Udxrl8MGBwI1
	Ec5Ezv5ZxY32I3hj95rVfH0D9czT3kye+u4BMz+kDCSG6ioSZSoLgAqHP44VKLJT4/ofphfBFYz
	te4afUGaKMOPPcv+dgi5KWRSo4tbmqiEY2hdg+jjnxk=
X-Google-Smtp-Source: AGHT+IELDSZLaGVUnWYgfmAu11bd705GWNzFB2vaWGLLDScnt9ixXKpiFk9Vfs/66mFlQOr1fmaO2Q==
X-Received: by 2002:a05:6402:27d4:b0:5e4:c522:51cd with SMTP id 4fb4d7f45d1cf-5e4d6b691cbmr14687640a12.20.1741018487804;
        Mon, 03 Mar 2025 08:14:47 -0800 (PST)
Received: from [127.0.1.1] ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3bb7560sm7161971a12.41.2025.03.03.08.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 08:14:47 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 03 Mar 2025 18:14:36 +0200
Subject: [PATCH RFC] leds: rgb: leds-qcom-lpg: Compute PWM value based on
 period instead
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-leds-qcom-lpg-compute-pwm-value-using-period-v1-1-833e729e3da2@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGvVxWcC/x2NwQoCIRBAf2WZcwOmLUXXoA/oGh1MJxtw1Zzcg
 mX/Pen0eJf3FhCqTALHYYFKMwvn1GW7GcA9bQqE7LuDVnpURhmM5AVfLk8YS8DO0t6E5TPhbGM
 jbMIpYOnV7FEdtHF03487baEnS6UHf/+7K1zOJ7it6w84+WIbgwAAAA==
X-Change-ID: 20250303-leds-qcom-lpg-compute-pwm-value-using-period-0823ceb7542a
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
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3533; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=SW851bh5XjUCfDzmObPjOBzVvFjoWLDdCSaH8tLiKzo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnxdVyTyNKYJNvHbQzz3p4W82eyaA9JJO/Jv3KV
 xsi6cDFabOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ8XVcgAKCRAbX0TJAJUV
 Vm0XD/9ieCUXuxrAtsGiQz9dCETGuzxsUW3/Lo2wSkvSX2x1oQxAI6BJFEtrQIbwZMEx4oUMwFF
 zyKwWWc4Vsr21BPzuKBjZnt0qM0RysrKcLPRYM+0gZJWhVLChEMrm1tgg7hHsIOFNkKUcSnsAH7
 W1K29AEs2CRYm488pnF/k/wbFeviaPZ6HX4L/qp8U/dDSCvIcEHZQAj8mvz5Ik2icugTtbdlykI
 1gQCij08r9CMOeEd8vBWZDkuTQF1KhaFnmpUNNdpU2I2vbqqQ7KbMJ9emDnixw+2388uWgZv95e
 Ga6Lfx/mADNjBE0Lex6gMoR5A7ENTsyVTHd2excKLWq3CAq6ENfM7v9AO0N3eOykKZVLBXbC5Wo
 WXRoyXClpidstj3uFf1FGZr4o/PjrsmrJCBl7N3dPUFoa578W4hFtHFIoo2k747bKv6M/CqF9zy
 UlTIS6i+qTRxR/rAuM2RdSB3Q1fqRb4S3b7EAIqINe5vkz0rkrv4XnxAU7ufbFh6ldlcxhvpe3W
 z7z3oCPbsDclyqR+EnpFij9xZDAkrgDNERNyLVAdreNUflevw2SX6Q03gopF6DSmTFgx4j9n/Ng
 TWKgqSis/gezuOGYuMXXPTmkKBsKGR5IdMraUR2bbPxtf8yRGzxGKkAa/BsBY7yQhuOZHmUvmgt
 7zhBY5f0D5ouXPQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Currently, the implementation computes the best matched period based
on the requested one, by looping through all possible register
configurations. The best matched period is below the requested period.
This means the PWM consumer could request duty cycle values between
the best matched period and the requested period, which with the current
implementation for computing the PWM value, it will result in values out
of range with respect to the selected resolution.

So change the way the PWM value is determined as a ratio between the
requested period and duty cycle, mapped on the resolution interval.
Do this in contrast to using the register configuration selected when
the best matching period was determined.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
This patch is based on the following patchset:
https://lore.kernel.org/all/20250303-leds-qcom-lpg-fix-max-pwm-on-hi-res-v3-0-62703c0ab76a@linaro.org/
---
 drivers/leds/rgb/leds-qcom-lpg.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index 4f2a178e3d265a2cc88e651d3e2ca6ae3dfac2e2..80130c205dce7c6ae1c356b7a7c5f6460a2b0bb0 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -523,8 +523,10 @@ static int lpg_calc_freq(struct lpg_channel *chan, uint64_t period)
 	return 0;
 }
 
-static void lpg_calc_duty(struct lpg_channel *chan, uint64_t duty)
+static void lpg_calc_duty(struct lpg_channel *chan, uint64_t duty, uint64_t period)
 {
+	const unsigned int *pwm_resolution_arr;
+	unsigned int step;
 	unsigned int max;
 	unsigned int val;
 	unsigned int clk_rate;
@@ -532,13 +534,15 @@ static void lpg_calc_duty(struct lpg_channel *chan, uint64_t duty)
 	if (chan->subtype == LPG_SUBTYPE_HI_RES_PWM) {
 		max = BIT(lpg_pwm_resolution_hi_res[chan->pwm_resolution_sel]) - 1;
 		clk_rate = lpg_clk_rates_hi_res[chan->clk_sel];
+		pwm_resolution_arr = lpg_pwm_resolution_hi_res;
 	} else {
 		max = BIT(lpg_pwm_resolution[chan->pwm_resolution_sel]) - 1;
 		clk_rate = lpg_clk_rates[chan->clk_sel];
+		pwm_resolution_arr = lpg_pwm_resolution;
 	}
 
-	val = div64_u64(duty * clk_rate,
-			(u64)NSEC_PER_SEC * lpg_pre_divs[chan->pre_div_sel] * (1 << chan->pre_div_exp));
+	step = div64_u64(period, max);
+	val = div64_u64(duty, step);
 
 	chan->pwm_value = min(val, max);
 }
@@ -829,7 +833,7 @@ static void lpg_brightness_set(struct lpg_led *led, struct led_classdev *cdev,
 			lpg_calc_freq(chan, NSEC_PER_MSEC);
 
 			duty = div_u64(brightness * chan->period, cdev->max_brightness);
-			lpg_calc_duty(chan, duty);
+			lpg_calc_duty(chan, duty, NSEC_PER_MSEC);
 			chan->enabled = true;
 			chan->ramp_enabled = false;
 
@@ -906,7 +910,7 @@ static int lpg_blink_set(struct lpg_led *led,
 		chan = led->channels[i];
 
 		lpg_calc_freq(chan, period);
-		lpg_calc_duty(chan, duty);
+		lpg_calc_duty(chan, duty, period);
 
 		chan->enabled = true;
 		chan->ramp_enabled = false;
@@ -1241,7 +1245,7 @@ static int lpg_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 		if (ret < 0)
 			goto out_unlock;
 
-		lpg_calc_duty(chan, state->duty_cycle);
+		lpg_calc_duty(chan, state->duty_cycle, state->period);
 	}
 	chan->enabled = state->enabled;
 

---
base-commit: 0067a4b21c9ab441bbe6bf3635b3ddd21f6ca7c3
change-id: 20250303-leds-qcom-lpg-compute-pwm-value-using-period-0823ceb7542a

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


