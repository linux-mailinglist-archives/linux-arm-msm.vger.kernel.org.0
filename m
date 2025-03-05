Return-Path: <linux-arm-msm+bounces-50357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD22EA50019
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 14:16:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9CB7178C48
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 13:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3CD924EF72;
	Wed,  5 Mar 2025 13:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uldw4Q4c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2EA24EAAF
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Mar 2025 13:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741180169; cv=none; b=bC6qebeS/hhZeaBvMeHSoL6rgojPZwx+nEHOhA2dCqgPI2kvhi2CEOsB4xPkt/VyNeShW94Smu6BHVs2+v08P5q1iMtfvsK1bTagqfWn3RQrpiJHHL2p7qnqrVF9IihK4qj1/uc2exItSyGErAEYD7g0knTUQWH3WsJn3XSZDqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741180169; c=relaxed/simple;
	bh=IO3ztNskYo4u9R30N7LqqwZeiSmdVZPuFU2OKg54JcQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kz1DStoXxQeJ71bjmeN/V6NizdwtVm9ZE8csFa3vrvCajasQEFDQIIwGrjL5iHwWjHYK3uVyAAlft5tywxidTSxBO9tCL2XvuvVL4r8qrdd+E1sMNT9eY9phkEGKxR/vVD6yuXhWfYR2JxCAkgf0oc/XWBac0VnQ8+Rjta2CWLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uldw4Q4c; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-abf3d64849dso667923566b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Mar 2025 05:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741180165; x=1741784965; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aeNbtS8KoYN7apOK3taXAd+xNIlFPO6CmIlgIbZP94Q=;
        b=Uldw4Q4cG3Yb2+WdwyCWp84HW7lSjxGwR9x12GDkV7QKEvg0lMXw49f9F0b23vg7WV
         S2aYTP4Fkog0CvHoqmJButDSWJXswWY0THYwGRZmTK4WJ9jGl3MjKScZExMPpx3N9Poy
         HbbLYhppd/Q/gB2OS6WKCHw+W0OTkN/lxMrVtGAzuifFW0cXl5Ytqm4cg0vgbkeT+Pup
         ceeEfBa9jNlm9fmcM0ivUmbgSCyYOsO6rTUe5WdIC3cZC4n4qFEy9Jr1eA/QH2YhpxDB
         +N5bzLFR8ndTonMKv0EiT/FxPRJLPs+CfxCV0T5s/XEDb6GYrvoV5QmL6G0xPfLJE3jJ
         2UHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741180165; x=1741784965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aeNbtS8KoYN7apOK3taXAd+xNIlFPO6CmIlgIbZP94Q=;
        b=J3P4DqB/Ti8RrvgPU69A+7wYRV8HdMcR8VL80PAPzFXuSk7VWyg/riatt0wMW1hIJx
         MpDEtb4LVd8k8v4FCgBsL+up+E7iNwP+THNMtI2P7qVZFugcWCLLS91yQx1509Qp+1X9
         7xIoEm7NmktHYY7ee1lNjCkPhdMwcvueby6+TN5iuk8Ls9jZn0cCsSiLBlWHMl3/vqsJ
         poV4lZ84VoIgtAvXbdHhItKE36pL1QiItFLHlFtm9haLk08iSfa13ereb8lzmjxBDIU6
         Y3Ye08zyFgUfDdc+FB74WSVRWSqsHuy/qDszx6su+AHDSd/EcBGzBa8lW8aXQh+BAba4
         VIug==
X-Forwarded-Encrypted: i=1; AJvYcCXfjQWmXvOJ5anvpDV84QluZn4ZxqsOS+a4oWdduiVPquPnhNvDdk3GjVFpCHz4NIf1e/uLjQ2utJ/pkY+1@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0bLXvlYKwHWAFLRP+Hs0on5n6PRnLLbd01znYO0rfhYGQpddv
	9rcoXtrBvnaoxOSh9RevnzeONqCsvBJeeuOQrA1FoIcs5q7AlWeVfqcyP9vbmo4=
X-Gm-Gg: ASbGncvNaHp/2NoJ9viUgFSlc17TDUkcKWDcLY9o0fMENWfFTINv2lWMM5W8QvQTJKz
	QPuzSzK/BCkevvHjH0H4FCe2ifgwoR9I/LLwGX+jn6OfQmfHtC7gnRtY6itoM1Lezjm4h949pXU
	IPl3k53BZn/YDX9KH1+Se/M+fWZED10btc2s8J6scxhvm/YjakXzST3AKRqYm5Q39zIMDBuZHy5
	6lQ7IjrkVoDi6AxttSFn/0Zvhs64Z+6qBAt0/lPO/TH6W6EngbowXxp0zaYgxIRztCm8W0kcYVW
	z0oJx/N7dtnwjgDB5UkLtL8+yN2cgINmQamn5saqBP4=
X-Google-Smtp-Source: AGHT+IG5Y414x+a2TTKhCNZ7joG0uDxSqk7MQ11K5ICAcT6/Xcq5uDYDuZbx7u0m5wFRfgBRfRUvGg==
X-Received: by 2002:a05:6402:1ec9:b0:5e4:d220:3333 with SMTP id 4fb4d7f45d1cf-5e59f3954e7mr7447319a12.1.1741180165432;
        Wed, 05 Mar 2025 05:09:25 -0800 (PST)
Received: from [127.0.1.1] ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3b4aa5dsm9627341a12.14.2025.03.05.05.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 05:09:24 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 05 Mar 2025 15:09:05 +0200
Subject: [PATCH v4 2/3] leds: rgb: leds-qcom-lpg: Fix pwm resolution max
 for Hi-Res PWMs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-leds-qcom-lpg-fix-max-pwm-on-hi-res-v4-2-bfe124a53a9f@linaro.org>
References: <20250305-leds-qcom-lpg-fix-max-pwm-on-hi-res-v4-0-bfe124a53a9f@linaro.org>
In-Reply-To: <20250305-leds-qcom-lpg-fix-max-pwm-on-hi-res-v4-0-bfe124a53a9f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2187; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=IO3ztNskYo4u9R30N7LqqwZeiSmdVZPuFU2OKg54JcQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnyEz8h3GK4Cj6l4pvxkgnbGqdNoz0l+Bxb/J/n
 EJ9E0Kpp0eJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ8hM/AAKCRAbX0TJAJUV
 Vj57D/4pvDgFijBFEvkk5j2nKEPFKPgYdXhGkF4/hqaPWE2M9BxwjKIPrWt2SSfoOqVfLepldCh
 PMBbCHm6S4QsJAW9QzH3YfGCPNxmbVfjSdAvWDhcMZxFvgtfnfV84Fa1LJuXUq05AnYh31EJs24
 593MdFm7zNh7TdMyy+lUwQ4J4BvVoRW1drhkRG6YXjxGFdiFkMTlmqaAAOExm8Ov0cXMJKnk2rO
 apNRDf0DdBGH+PQ/KqQ717Mf6vO2GsvF/sf+O/+Wf+JQkmjzt0L5eKkAgleNbIVjCejwnlfrV7G
 GMbwGbpRuRM0g6CwUZEJ57GUrjMfPaDKBiaeFLZX4m4cxvdhVFLRQGAxBeI6l29+zFgEKIQsOMs
 8Sb2vh/WuiTNQXKzhjdGCiHWYSU2YCmdxUN6Z84wdZNd9PDuIXzNAAyFW/gBZUwmzx3lqVziPq+
 pJtblyjLVTNYmS0UZyzjau6zVvwVe68AqelDn8V/RqnX+La1al1bdxSlN/o7ldUTJYNAgDYLWVj
 5AkCXv1NiI16iFaLblKriTdkffhSCWB2MQRsSPUPc92OVpbpTJxUknRAL0G8R1PC+DtZ1HNLuT9
 DqN8E4e7VqCTfAg3y6JDHTsAMO33QU5mKRTiMEnUfyVMUA25DpBuYYZOt4B+2VYaNQB+P3PoX24
 SudXgbyWX99G0Jw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Ideally, the requested duty cycle should never translate to a PWM
value higher than the selected resolution (PWM size), but currently the
best matched period is never reported back to the PWM consumer, so the
consumer will still be using the requested period which is higher than
the best matched one. This will result in PWM consumer requesting
duty cycle values higher than the allowed PWM value.

For example, a consumer might request a period of 5ms while the best
(closest) period the PWM hardware will do is 4.26ms. For this best
matched resolution, if the selected resolution is 8-bit wide, when
the consumer asks for a duty cycle of 5ms, the PWM value will be 300,
which is outside of what the resolution allows. This will happen with
all possible resolutions when selected.

Since for these Hi-Res PWMs, the current implementation is capping the PWM
value at a 15-bit resolution, even when lower resolutions are selected,
the value will be wrapped around by the HW internal logic to the selected
resolution.

Fix the issue by capping the PWM value to the maximum value allowed by
the selected resolution.

Cc: stable@vger.kernel.org    # 6.4
Fixes: b00d2ed37617 ("leds: rgb: leds-qcom-lpg: Add support for high resolution PWM")
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/leds/rgb/leds-qcom-lpg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index 4454fc6a38480b61916318dd170f3eddc32976d6..0b6310184988c299d82ee7181982c03d306407a4 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -530,7 +530,7 @@ static void lpg_calc_duty(struct lpg_channel *chan, uint64_t duty)
 	unsigned int clk_rate;
 
 	if (chan->subtype == LPG_SUBTYPE_HI_RES_PWM) {
-		max = LPG_RESOLUTION_15BIT - 1;
+		max = BIT(lpg_pwm_resolution_hi_res[chan->pwm_resolution_sel]) - 1;
 		clk_rate = lpg_clk_rates_hi_res[chan->clk_sel];
 	} else {
 		max = BIT(lpg_pwm_resolution[chan->pwm_resolution_sel]) - 1;

-- 
2.34.1


