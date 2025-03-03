Return-Path: <linux-arm-msm+bounces-49986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FE5A4BF70
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 12:54:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85369188CF60
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 11:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA52D20D4E9;
	Mon,  3 Mar 2025 11:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tcEKZu3A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787431D7E57
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Mar 2025 11:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741002795; cv=none; b=GV7OcmuVShabcnXsp+RMGZ1LbhI103ckNHYplXwSxUvFta+StMSatF087Bcp/QeH4xors1biNj5grk8HJLUYE5Z1mwKyXkPDdL0mVDLOQe7Gau/hOQWF5rdOJx8iIByI/TxjU1bmKbq0V0aq2bD4/Mjf/EHuHTgv66PZOR99p1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741002795; c=relaxed/simple;
	bh=uKlaO0VtSYqlCulEvoLtkmUhyB9oj5gsIjZc4WzZr5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NhzboGFP3oRNiFfTbdTy47PZ/VJusENcMZBbT7vGNshHKYKTjyTh253bBk7CPDJWI6RpGcr1RcsB6y3BMXRh/Fv/SQ6EvZ6RgTN1L/eFNg5O/+54rXPh6Lam884/BaaTti+D0bh+5T0kaXoOnfzhDAFcMIse+B6rGO8oTkXhBc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tcEKZu3A; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-abf5e1a6cd3so288671666b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Mar 2025 03:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741002791; x=1741607591; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DtXhuUfoSsHo3hqQz5EZhILyhw+RNyGbAyDJWOR+1Fw=;
        b=tcEKZu3APPhdgjUAY/aHvcuQkgyftTG8+65l130l4oW3yr4NET89g/Yjlh2GJV//9C
         Jou0K+svlQ0InU2V2RPif4ceEhz4eqDgx0CCLtlRWImnnVEWJKCd8EUwd3NOKLjn1wwf
         6POx8Zrz8T+IB7Ysa61iw2gOBRwNCnTmWpmDAxM6odhxiBlXpjg11vAV7ZTxBMG/SGmG
         p8VFseHLZEmVF4OWjnDjHrgR6zZ1uzNVLKvmLRrUMEtadjgnMx+g+aVKSE2lB/Z2bP14
         lGyYr+yoZXohaxh2NRe2YeuFB5PIPfCrC22bEzRIY1LF8lwj43/+aBWlzxoiZjkfZeb/
         YXbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741002791; x=1741607591;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DtXhuUfoSsHo3hqQz5EZhILyhw+RNyGbAyDJWOR+1Fw=;
        b=m/MeaC8ppOY1+nOJux+HRsWYHk16YkLoAR8CtmzaI2js9mv68zE68HkioO3TTcT5yG
         GzSyUw4WYgXtKNSfaBoRZVNWzgeC/jXHXBpArikVLksNV8z6q4M5NL+SEOGAO9RTTLeJ
         wohWHy6qXJn0vBXyBV+1HA9r4Na7XOqsU1zaDY7Td1lExsoPo8SVBBvRUd0LEDqsfNs+
         V+0y62HFBc6zHlKIs4LV456wezHGhqrKvZl5XpWQO6VGmOvJ8chWdtb0jhx94oAISdGO
         /+tzrqL4PRVqVKOu2yR+BPfw9ikonjTRrRFMgcYeIgvTKEblghjAQF8GGsFLe+CLJxCH
         go6A==
X-Forwarded-Encrypted: i=1; AJvYcCUplRoSuYs5JhpAuUB5bHa2drO9JtC5aKNx2IPLdAmkBRbzsB5eIKmS2JB+qUBal+fxJrJOnqgMq8BGnTKh@vger.kernel.org
X-Gm-Message-State: AOJu0YzSc9YPL/v4Jgyt9qOFIv799mkyBXGs6WlyKAIAmdHfAPfRWzFA
	LanK1xOMz2L9drRisInG9iEHwJmmbw8P3WpLq+7sNzh2gbhNPx9hrH+s1NKYNdY=
X-Gm-Gg: ASbGncvfiyufmdSUHWC9Y+L+iYl+uhGGHSLdFRWPsjOPwkBAF9zZT6G3ETfPU5W9eav
	MJRRiNxlc+thmAJyZ+MrOa4fPh2KUDIQpzkVw4QTiDrpCGg6bFnOWZ6tc8N5z8xFmQo/S41MW5q
	Bm+om4eED+DMfAahXxyPU/HkAls/DGcC67R9k9K4KsAhIFndm1l9e/9w75D/Qrnznnc7HttYYIZ
	kqy1q8deBqiFhq9SIjwY8T+8G/7G9M/egPsaUd/OxO2lu3c646jkXzh/4vVfF0z9NNDscq6fcmO
	e+USW4bO2FbC/1nO7+LIO+OdOhmBPBSg3ETVW38HLng=
X-Google-Smtp-Source: AGHT+IFiXqW+Lwb1rqttilbKTCuFqrnwCuwyzVJ/cOH1SDiElNMin3wYFpdUDPax2lPnPWv8bfRXEA==
X-Received: by 2002:a17:907:9717:b0:ac1:e53c:d15a with SMTP id a640c23a62f3a-ac1e53cdb94mr96050266b.54.1741002790638;
        Mon, 03 Mar 2025 03:53:10 -0800 (PST)
Received: from [127.0.1.1] ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac1de83fa49sm86833866b.158.2025.03.03.03.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 03:53:10 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 03 Mar 2025 13:52:50 +0200
Subject: [PATCH v3 1/3] leds: rgb: leds-qcom-lpg: Fix pwm resolution max
 for normal PWMs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-leds-qcom-lpg-fix-max-pwm-on-hi-res-v3-1-62703c0ab76a@linaro.org>
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
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1589; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=uKlaO0VtSYqlCulEvoLtkmUhyB9oj5gsIjZc4WzZr5I=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnxZggiuDOGZkfqUQVY+9AhAVfnorbl76qyE9MP
 JBMYI0CuO6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ8WYIAAKCRAbX0TJAJUV
 Vt1NEACPUiQuUoYbNCNbZokEmpQboLB57GjVIEzFMwPmh1FQEiRui9yAA3dOOo+/2l4/d/sY1Nm
 iqGo2Tqn71CiK2WEZhI44HoMD0jJypHcAQIKEKmzLXLTd9GcW+GxCMwXg4G5N2VGLccJY2yKHoD
 vZl/9Gts5SgVB+z+TJgzK5JQLIBotZJlqJTqa2xrJ4GpB+NW91c7OmpgfIaEkP6XU0+0HVKNaYZ
 BopTmw2p+42Heqv29pyGRm+WCTpRFv3PWFLahDT8woEp92Qw+Bu1nj7s+jeVm99zs008LcnyAK5
 gVSQU5RNN8q5XHQ6sv1POSU8N5j+R/c4bY+PdnuAFOtNw87XUULyFcWYIzDSvuCIcHiTSRxvqKM
 SA7+4TxqL6PyMbOr2Xjx724j9pHszGQSkD3q5wth/DlJpu8lphKMH0XpxwVMRoTfwfC0X/Tr65O
 SJiafnT2TiAIa50gTnitnQCaoXGXRiH2Qt2yYrzNKJ/e0zWaFM40KePsqHQQeTr3bVOq5Xygcy7
 y12cIrmJPryAn2SMbO+CFuasEq4XPvcsSHVCKfTRgp5OjTByyR0Ppl7AswN6g4kEB2yxnoo9hXn
 /fR51OFPyN31yZR594DFRNcul687gYj5VPRrklVimZJGrffgLfTwpEM13fgkNQIkF7lJStAsPHY
 C0i0LawvGl2MSJw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Ideally, the requested duty cycle should never translate to a PWM
value higher than the selected resolution (PWM size), but currently the
best matched period is never reported back to the PWM consumer, so the
consumer will still be using the requested period which is higher than
the best matched one. This will result in PWM consumer requesting
duty cycle values higher than the allowed PWM value.

In case of normal PWMs (non Hi-Res), the current implementation is
capping the PWM value at a 9-bit resolution, even when the 6-bit
resolution is selected.

Fix the issue by capping the PWM value to the maximum value allowed by
the selected resolution.

Fixes: 7a3350495d9a ("leds: rgb: leds-qcom-lpg: Add support for 6-bit PWM resolution")
Suggested-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/leds/rgb/leds-qcom-lpg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index 4e5c56ded1f0412c9913670699e912b24f3408bd..4454fc6a38480b61916318dd170f3eddc32976d6 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -533,7 +533,7 @@ static void lpg_calc_duty(struct lpg_channel *chan, uint64_t duty)
 		max = LPG_RESOLUTION_15BIT - 1;
 		clk_rate = lpg_clk_rates_hi_res[chan->clk_sel];
 	} else {
-		max = LPG_RESOLUTION_9BIT - 1;
+		max = BIT(lpg_pwm_resolution[chan->pwm_resolution_sel]) - 1;
 		clk_rate = lpg_clk_rates[chan->clk_sel];
 	}
 

-- 
2.34.1


