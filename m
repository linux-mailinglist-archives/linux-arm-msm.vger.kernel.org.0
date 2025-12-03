Return-Path: <linux-arm-msm+bounces-84171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8D3C9E528
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 09:56:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 55C3C4E1427
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 08:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E701A2D94AD;
	Wed,  3 Dec 2025 08:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MXi03m5C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E3A2D63FA
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 08:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764752144; cv=none; b=gMEuhTrm/iYfFGwk8PqdwE0OL0SlzSyl8TXZZaUYQ+RUM4XFEoyVlu6PiJS5H7/JyT0Kaprq+evciR3M6n7wL1VXjrkz+t13r3gtC5TGh1szcKIbhU1/FGQzeOE9qT5S2shNfdJt6RXVnSHj3Zo2/WNw+Ul+eHcbUzlwrBTnRWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764752144; c=relaxed/simple;
	bh=TZXuHFaq1KyCSjmm/uTwxEj/hY+OqQUuzjmQobk8SFU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BIM827lmi3+SDNl2HR5nAa+5vLzfm1xbtQMEcPEtsQM1PQHOqecfN9RUJrDqKM1jm8J11WZSemBh3dMn4yCUJOeQzVfVo4G1iLeAC/wf4Tx4CJkvT2WxVZVFfNGfsvA/IffjfbXY9dG4jCMV/3Y839NRkcCri76tU9BFo98CRjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MXi03m5C; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-37cef3ccb82so50711191fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 00:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764752140; x=1765356940; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YQl0/Jxgcp0DOIGMQfCvGhWySrzIG1pMZYIP0O7Y5Yc=;
        b=MXi03m5C2tB48/s/KiMlCD8h7B7mS2jhwMWPQN9PC1O+Rek5eL2cxhHaYmlG7p79vV
         0OsItXF1i6ZzR6zP2VbG6K7CoYemwqDHaxCxtZC64TeNa6PyzZwUqAH0mB8Ti/sbdkti
         Lo3XSC8qqmyd0gKjEJtVlHyogbTdLicN6NjI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764752140; x=1765356940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YQl0/Jxgcp0DOIGMQfCvGhWySrzIG1pMZYIP0O7Y5Yc=;
        b=kkgKcUKWYQquHHBGGsF9e1MIfT+rkylW4gdOxEuUIpfo9sjrI0TlWt81xTMJhw0RQs
         6PX+dJW2MLkAJgITWneuyTA/RiPzHX2ND0VTljSeHhgklhEDnZmoo6m/xp/XBD0Tz+uZ
         Yw0XWiC6T9MdAcg0YHskJojPUpKhz1yneCz44WHGhLYXjAqZcUJNEbY1yfDDQ2e6mO3G
         +MwRqreQCiFGGJX1YKCRh/xSBdsIWutLn75qBs4p5CS6zockhGx5EaK+ytjtzjXtuOdN
         0/6D84vTAQztmd4IPMGuVu4scvaXc7t1UtkW9C5YreLe6Eb+QDXWe9Gkta55DRXu/HW4
         m2jA==
X-Forwarded-Encrypted: i=1; AJvYcCXBIJHKF4K8HsGyOp5zur7DtGen4tcxqCFrXgR+/mHl4zMblfTB8EcCrmprQPaEDGG5/GzfkiyVQ/CosqYx@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5iQONrTiB1uEqkJsX6QnztFxpO0pCytCYdtOsAIFwZJRhhxYK
	qtyTv6XKCj0GuoNI6ELj1yP+rYHycuXd5RCjGo8lQ+QXjSTAeAtl6TClHtNHbNyD6A==
X-Gm-Gg: ASbGncs3GTMM/+GCkyJEUdORCKh7MLPwTSVvODBrSv2JdkhT2h9/bIi7eh4OG3zSWHi
	GXS94f+uOjIbzcF5zxiFoNzBHvWySA4TLj41d2TbLb/jPEzss5yQa2WISls+VWw6UwcSRaNjl21
	7ywot0fGlToyDdCAzXQnoiHZdIk0RTLI5X+CmXLaQ25cPx+WvYgIyjCA12iyvnHUo+ZU2iQj6xF
	w6sXAeQQJfYEn6XqfPEgrr8+o4fqs2JU+/1FS3DSU1zfPmNGmwDD5N3nKZW9DTpRKUBuaBUSosw
	Ae5AVLBFaG+m7lOj/J9F2F53Q733Mz9GzbRSOW9mF9hA2JFP/ijFnx2Mp/0Iv6JZZ4drztPFytY
	Xwi56225YAFAecYU6uEDFONvaX/lMv4czOxQ1Gnd/AAIX4aFay4kqZlneZBcxb+hz+KyGD29tsA
	ZSHRBJYd4gZjJD5tsT1yrXHVLngt0mBWxyyHeDn4kTSYvuHuD9+w5ThwsdR3U92E5EuHDX2Q==
X-Google-Smtp-Source: AGHT+IGlFlHmXIUMj1dgYAUXjSWNyqsmGRvD2s4S8AesPq+R0ZFdEvdTmQACTlVbKUfIiYs7iMs7OA==
X-Received: by 2002:a05:6512:2307:b0:594:2934:8b83 with SMTP id 2adb3069b0e04-597d3fab04cmr678826e87.30.1764752139753;
        Wed, 03 Dec 2025 00:55:39 -0800 (PST)
Received: from ribalda.c.googlers.com (165.173.228.35.bc.googleusercontent.com. [35.228.173.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bfa43f3esm5315377e87.47.2025.12.03.00.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 00:55:39 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 03 Dec 2025 08:55:36 +0000
Subject: [PATCH 3/3] media: iris: Fix fps calculation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-warnings-6-19-v1-3-25308e136bca@chromium.org>
References: <20251203-warnings-6-19-v1-0-25308e136bca@chromium.org>
In-Reply-To: <20251203-warnings-6-19-v1-0-25308e136bca@chromium.org>
To: Keke Li <keke.li@amlogic.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

iris_venc_s_param() uses do_div to divide two 64 bits operators, this is
wrong. Luckily for us, both of the operators fit in 32 bits, so we can use
a normal division.

Now that we are at it, mark the fps smaller than 1 as invalid, the code
does not seem to handle them properly.

The following cocci warning is fixed with this patch:
./platform/qcom/iris/iris_venc.c:378:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead

Fixes: 4ff586ff28e3 ("media: iris: Add support for G/S_PARM for encoder video device")
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/iris/iris_venc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 5830eba93c68b27fa9db87bac63a691eaca338d2..730f2aa1a83b2f4f90227ab9a7e04aee7c2c3cfe 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -408,11 +408,10 @@ int iris_venc_s_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm)
 	us_per_frame = timeperframe->numerator * (u64)USEC_PER_SEC;
 	do_div(us_per_frame, timeperframe->denominator);
 
-	if (!us_per_frame)
+	if (!us_per_frame || us_per_frame > USEC_PER_SEC)
 		return -EINVAL;
 
-	fps = (u64)USEC_PER_SEC;
-	do_div(fps, us_per_frame);
+	fps = USEC_PER_SEC / (u32)us_per_frame;
 	if (fps > max_rate) {
 		ret = -ENOMEM;
 		goto reset_rate;

-- 
2.52.0.158.g65b55ccf14-goog


