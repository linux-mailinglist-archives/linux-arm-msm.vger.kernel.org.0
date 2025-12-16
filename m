Return-Path: <linux-arm-msm+bounces-85388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F154CC4035
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 16:42:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 67FA23031FA6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 15:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8D6F369960;
	Tue, 16 Dec 2025 15:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cD5UOMm3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCEA369231
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 15:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765899752; cv=none; b=iBa6stV0XPFbq4P/duPSY9kfmAWlkBPu1O/P7vYDrZmkChbVUAZRjztEx2+pGVeKweghdQXcVkXzVdyNrubQKCQ9mcehdeD5si/mjXLCpNlwrs/738sv6R8fYapjVBI6fwY45OhxCRYcbPtauBftkRTIuZmKCvfSVYMnIQZBeiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765899752; c=relaxed/simple;
	bh=M5jI5mFgh0sO9xG8ITV3eUOJCXfWDu7rg24QOLJv8T4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HGqKMGvnVmhw0oVURb2aMPUrAv6HHJeNN/7v+vWmDT4foyA5N6IfXc6izYA/Z3tzoJ2+WTRvg+pXcDLhqa0j5Wz/jXvToYqr8gzTqnb7p/GKHJOyolbhH+xn8Mp9783IGSbhF+KmhYa3LkR+0ULNpMX2XNKR8efacZG03IHbBhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cD5UOMm3; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5957c929a5eso7158523e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 07:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765899748; x=1766504548; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ztlm7b+VM0LLd3VqoVbu/MTVuy9mYjOFBwoz/bGs1wo=;
        b=cD5UOMm3TvMdCtojq07eAg7hqxe5dbzv8mAdZ+hnTEA+yZdHhTK/Y3TNtoQeCIfNg2
         9pPWwlOQrynQ+VBLIwL/mwPpwyFfXW2QppwtSs5XyB9IZ029MvCOMYnojxIIs6vgH8wZ
         r/pB5IRYWLYk2v8G89hJGkMX/x1Hot8lMEAQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765899748; x=1766504548;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ztlm7b+VM0LLd3VqoVbu/MTVuy9mYjOFBwoz/bGs1wo=;
        b=c3hnToD4e9O+d/7kd8f793OA4nN0uSujGV0WlQP8DhNTzKyRewzcvWrNF3U2+p2ywY
         8nQBsbq1OElO64W1XQHQqGocpuZTGNC1jRce29+rpKxeclb5F/7YSywip0VmiRBwvOQB
         GdLBiU8Lzmgzaq1l4W3DL0DUvD2P+nemZxs2w69/u9W/7kBomuUror1yVNC6QMyijWNz
         F3xVzImSBKbcCuIFuB5UhQKAxWfPCknGFcQMorrZH6I8h4N3EEPtmDF/ORxO48+GKScM
         NC384HzmLoR/Emxbt7lh0ALIR9WltOfuyuGwh62y+9lCP35KVCC/K8zPPu2iN+baMU0h
         JbWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzTvR8YKNo9KB8aVtmvfs9Qt5qtMR+lLl/IA1SMg1k7XkqY4C64KpCzq3nZQ43je19HMvnN779+lNL6WBN@vger.kernel.org
X-Gm-Message-State: AOJu0Yznaf97Bj2sVSICPVO20l6ugmxuUjci/nzuedS6jy62IlQ74B3V
	/hxKyoeNFOEI50dNNyb7+eKMPKCj99dkK44sNwxzulh4+kxPNgVzEgrrZDaVWvRttUgEjtBudoa
	ZX1AA+g==
X-Gm-Gg: AY/fxX646mfkbTcePL8+3z875VNgxrbfrn4BA2g5p+H7GmxVuv85LtIt5Ncq4m+VkBf
	Vrnjjn8zm4WeXd8STaAWDw07spJ3HVSYUeSlBy/omLbv7dTYLnocDvBsiPAfo9x9O7D7RdB6waS
	XZ7QYCbcohQ6tpsqOMl+eeESBR83XFy3ZGo1wK8T918EX1C6ZNqPpxc4MQGv7KICiVJUjFLfNSF
	gCcBOsKecnhH/MyJkXdQAcVlTr3XTTE4nWwcVPN47lr5w9l/bPeTqGeGEegVmTGEUvCJM3cN14L
	i+CrlCv975V7PIwe/AJWPFyTRtaV3WjfKgtmmr3fPTCLGpJtd/mPGyyyU6RTKq+cIrl/ENeQEPg
	DMiHaXxtj3K+RTpmZWgUjSlYHvVOnOtNFZrSXsagD8rz1zRxCHyzBgrspJ1lOFpU0u8lkCbv8aR
	puwiCOmS9K9ztvDOK1uVHFe2n1F3thG9TslbXqhpB18v+tyt9LCMlWsya2pwwD6klncbsEag==
X-Google-Smtp-Source: AGHT+IEX1A/Iv3xmmU4qq0eqYZmFq5GrjwGFzD+8NRTYO1Zb7ju+OO+Wo6JMepkOgf9/tyK+xCBEGg==
X-Received: by 2002:a05:6512:618:20b0:598:faeb:2e2c with SMTP id 2adb3069b0e04-598faeb2e31mr3906303e87.34.1765899748347;
        Tue, 16 Dec 2025 07:42:28 -0800 (PST)
Received: from ribalda.c.googlers.com (165.173.228.35.bc.googleusercontent.com. [35.228.173.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5990da1a4b8sm1003489e87.31.2025.12.16.07.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 07:42:27 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 16 Dec 2025 15:42:25 +0000
Subject: [PATCH v2 2/2] media: iris: Fix fps calculation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-warnings-6-19-v2-2-12075e3dece7@chromium.org>
References: <20251216-warnings-6-19-v2-0-12075e3dece7@chromium.org>
In-Reply-To: <20251216-warnings-6-19-v2-0-12075e3dece7@chromium.org>
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
 drivers/media/platform/qcom/iris/iris_venc.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 5830eba93c68b27fa9db87bac63a691eaca338d2..3b941aeb55a2f498898a27a5f8cb58cdb26fdfed 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -382,8 +382,7 @@ int iris_venc_s_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm)
 	struct v4l2_fract *timeperframe = NULL;
 	u32 default_rate = DEFAULT_FPS;
 	bool is_frame_rate = false;
-	u64 us_per_frame, fps;
-	u32 max_rate;
+	u32 fps, max_rate;
 
 	int ret = 0;
 
@@ -405,23 +404,19 @@ int iris_venc_s_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm)
 			timeperframe->denominator = default_rate;
 	}
 
-	us_per_frame = timeperframe->numerator * (u64)USEC_PER_SEC;
-	do_div(us_per_frame, timeperframe->denominator);
-
-	if (!us_per_frame)
+	fps = timeperframe->numerator / timeperframe->denominator;
+	if (!fps)
 		return -EINVAL;
 
-	fps = (u64)USEC_PER_SEC;
-	do_div(fps, us_per_frame);
 	if (fps > max_rate) {
 		ret = -ENOMEM;
 		goto reset_rate;
 	}
 
 	if (is_frame_rate)
-		inst->frame_rate = (u32)fps;
+		inst->frame_rate = fps;
 	else
-		inst->operating_rate = (u32)fps;
+		inst->operating_rate = fps;
 
 	if ((s_parm->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE && vb2_is_streaming(src_q)) ||
 	    (s_parm->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE && vb2_is_streaming(dst_q))) {

-- 
2.52.0.239.gd5f0c6e74e-goog


