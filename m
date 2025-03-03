Return-Path: <linux-arm-msm+bounces-49987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F089A4BF6E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 12:54:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68FD6167C4A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 11:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BC931D7E57;
	Mon,  3 Mar 2025 11:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p/i2GIMn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2258020CCD0
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Mar 2025 11:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741002796; cv=none; b=hD7y6fBycSU6+yF/kRd0/yykx4xXxckTOarUuUbChI+TFktFQlEXQ4fGaA+j3iYDGKTLCFkdQKOxLpedkANQoatSGIdLafAPcu37A4AaKPHRbjUN8E7YpZwRu8/fM6mSsp40OFBETub+FzqalvftsQSH633q/M+OhfdXD1UZWYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741002796; c=relaxed/simple;
	bh=Ptm4KxIluZ+jSWtrQSjOBYj1UGbgZbWT5vsr1kgNS3Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DLeUrz9sVHHExtH0/xG7HQx9I0EFtLl9MGmTGnyD79yhFoFIMAGR15nn8pjqU46BpA7ZhvDTB0pWqldOjIwln+Gn8SJy7LiEdnOnBSKw4sRG5KMFBrjj+HL3QJQsvorqiEjXmQP7LXAcf2gQtS52rAuLemRwwx/Gj9dWNE2iNyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p/i2GIMn; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-abffb7b9619so129408366b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Mar 2025 03:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741002792; x=1741607592; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/68y9vyjJip2to2j240QGsQ8HiHsCa2cvvO8a3/jxD0=;
        b=p/i2GIMnuFKab7nrtkydtkExoEbU5sAV+TRDBGZ/oy2kd8j4Uo1QoxgkgWj9ceTv27
         PiIGH2/0vt7DBFho6GtaqYF/g0zUvtdFf+yVsPK88DbesoUIR+bYTGL5kTZpy8HDUA+o
         /ffr464boVVR5pZcInz4sA+NbWlVh9XvtedPHUWi7VlWH+8Q/mnZPLb9B8vn+FhyDAN1
         hD5uZ1NHgmXstMpBF/uD/oAR8kbNggbBsVNTRWoGviuUNgNnBmtX3NW9SWa9Zjr+TxNu
         fuHRfl5InnAbUMuF5JzvTiXA68INSjaPJI8n582SxReN1JhR8M4AOfPyFxgzdmiNvKbZ
         B0RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741002792; x=1741607592;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/68y9vyjJip2to2j240QGsQ8HiHsCa2cvvO8a3/jxD0=;
        b=lwq1DbB4y8qV8J2Gr7GJxJeH8YUmDtiz1DDjy08gDGZlt+gY+kZW/MC/8pmn9ZZE5M
         n/WAo2d79yxF8ZGLds5hmxQap7V9nYPAZ9e2Lo7+HEAryfQd0Ib0MU3/sIvuDBwIma7L
         70DJJeK4lVUD/8lgMUBSNyINQbZvO2I1i2HFZact2v4elXoszREXuhHfKkFvN1GM8Son
         sgYP7UkOtFdbgsYfB228VCc6cBYNTk8bOn+y3ENcbuyWkdHJaf6Nbmd08JPz8Ch4E3+E
         0Lb1iAI5nR0wFWvWI+b8pPNRYsJB7TG66hL6IaulJJY8MxQNLeCD/QkyGDNkX3HMI+bF
         845g==
X-Forwarded-Encrypted: i=1; AJvYcCX0+jPqDKnYs4eKZpPDVTPtSxmEG0gZ/RIpJFhJqqgdWNdUhlIDBl+knG5Es51rKiR9wbnl7AS/QwSt1RbH@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7HoWbJkkREZz2BZedroJ3r6kDNTSh3f1+XbWPAv4h4saWVwFh
	OYASqgyOxxn2KHa/kXAzOiCm67hdAaEdxoAQF0p62MLbxwEPKpG8hnUxCcszgfs=
X-Gm-Gg: ASbGncvR1FHyhFDJ4k58rm1Soi0rCFg+/oEzdAKej39yRGkAzWs5fmGkKFi6J4LgH07
	clKP4D3sS5BTpRzr/mFk3AaE/eJkZKQ9FDc1UUaxkOAm2blPEevZksDiajhrKXcvjArGPFFLNrf
	zGb5yLcvhjOl3e4pfvWSxzP1Pv9/GiRxAMSHrKFaTWATjsK8+1uH7vz/52ynrLMzGdESbIm/72m
	j6SeSpMWvWubj53s8f3UARYFqe2Hzp/kJjqI/s5upZ6TuC/KgcAVVV5AGLpTImRy1DFXreqN81O
	0X+8z/UccPQgEpKCFPb0ikI7cK9y7ImkM72TwJXB6bg=
X-Google-Smtp-Source: AGHT+IErxoCrIU2R1yZszII3GJHpNQelDYR3jhTxYYW1Pc1yGBLd8/zjIyAuHQmCs6GYrJKlqbIJLg==
X-Received: by 2002:a17:907:7f06:b0:abc:b8c:7b2d with SMTP id a640c23a62f3a-abf261f2f71mr1397972566b.32.1741002792270;
        Mon, 03 Mar 2025 03:53:12 -0800 (PST)
Received: from [127.0.1.1] ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac1de83fa49sm86833866b.158.2025.03.03.03.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 03:53:11 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 03 Mar 2025 13:52:51 +0200
Subject: [PATCH v3 2/3] leds: rgb: leds-qcom-lpg: Fix pwm resolution max
 for Hi-Res PWMs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-leds-qcom-lpg-fix-max-pwm-on-hi-res-v3-2-62703c0ab76a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1659; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=Ptm4KxIluZ+jSWtrQSjOBYj1UGbgZbWT5vsr1kgNS3Q=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnxZghnLOYgNBsNjRIrX52QXGpjisNrc6qKtqD+
 3XbN92qtFSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ8WYIQAKCRAbX0TJAJUV
 Vn5eEACc13uyB6gVqJz93ceCHPyd7qK1dCWoROUTsWftQMYJEpYnDQ2LXOrJb+iwsCeu5jnbKc8
 ixLFD5CPi0hyIvdkg+MJ9EaWBodou0bjYSc57jGfS+W30oNtlDsiaRfUBhiACMlA1cMeyYnz9pD
 cFcFsBvsnJDhFCtrJTtzEEyQdFCVPfe0DJYMgZa0SGEJL+2r5cXMzzK++7JfIIaQClzrEDz/qKX
 z0YvOFvvnGChNBr5zWDvKO2sH5F42o8zHwAljoPnUMHd4xD9RzXfxp9M6OPX5wmh5DM4r7B0e6q
 rCfMMQUvijXvfwWJ5d5C9Z9Iz+26gpvjeEKVJI8VeNxo/xDnAVP8C1KBJSwPosNV9stJvOHViEd
 s8B6WTyRvSRMZ6bhcHnSvmCs/JQzgkhX0vHUIi28ypxBTPwvcwA/rRC1pZX8XwFkn2OGBE5bOBw
 ry8AgBsS3lTaIuiCovwKb+SP5tIIco4QX0o9fv6eVPsWdUtkmSYPmcB9Vx8wDfRMs4q36SQL9sD
 8pM+zVDN/y/pClLltTWcYbzaissXYwIVQ9HKYLvZE/jBJ3c1Ho9zDS25ju7Vwm8tE5ngfTrKN/E
 gYGE4SNV/S3s+at9BiALOutUOk/M251kWjcVV4e2dBtTcFNbf8v9vzMG/rTpIS+B/fY3QYUjrxy
 Aqic7HReleXfSHA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Ideally, the requested duty cycle should never translate to a PWM
value higher than the selected resolution (PWM size), but currently the
best matched period is never reported back to the PWM consumer, so the
consumer will still be using the requested period which is higher than
the best matched one. This will result in PWM consumer requesting
duty cycle values higher than the allowed PWM value.

In case of Hi-Res PWMs, the current implementation is capping the PWM
value at a 15-bit resolution, even when the lower resolutions are
selected.

Fix the issue by capping the PWM value to the maximum value allowed by
the selected resolution.

Cc: stable@vger.kernel.org    # 6.4
Fixes: b00d2ed37617 ("leds: rgb: leds-qcom-lpg: Add support for high resolution PWM")
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
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


