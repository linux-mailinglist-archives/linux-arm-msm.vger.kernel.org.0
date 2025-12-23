Return-Path: <linux-arm-msm+bounces-86311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA53CD8E0B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 11:42:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8FA213014D69
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 10:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2197233D6FB;
	Tue, 23 Dec 2025 10:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CvGaeNAC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EA433B6E1
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 10:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484187; cv=none; b=Q83qd/mf3CsTOhAjpPkSbZra5Z2YoUN7z045dH8lt69/9XGWrQkQJkbMpj907gdX40BFdjkib3+xmhaEtwb7C4qm1H25N65kxrUsH3o3rSarfXbX7SBWPS7+W5b0oZxyktd/QQRtIUqGOmEZEYhBTow1M6V3zZRBSvry5X44uAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484187; c=relaxed/simple;
	bh=ASfJiTL1q6DVJolR1J49qe+02Q0L4hQQW/yS4XZqnOQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D5n0GgMPsP5sQdrlSCnUZrTCmTakAE2N7sOA10Iu+OkdUsiKK/UOA8BiLaIRd9B4wGg8QoOHwXracmCX82vnfeOKq+pY6/ga37rskvUy3juVGuHqs0e70hnbsCwGhfr6iZEQXrvemustr12dzYvDxbagJ4dDkj9BiRGTAWFiHbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CvGaeNAC; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59911cb8c3cso5255578e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 02:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1766484181; x=1767088981; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hNHRxnSnE8voMM72m011bJb2yQG4C90b65WjUVIP41I=;
        b=CvGaeNACxFbRNNbMnIdwJRvY9R3oAUxSAtJUt5V7bo+h7p+hcuUn/FQt9L3AZocHwT
         ZITB3DwXnkd4U0JP/lLHHb4s5n4t7ckw1lM/GZpUPfkJmq7g84K7dvMrW8GRdedHWB7Y
         zFCHEFveR9SpqiWk+B7HA6Zabnp3olVI4NALM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484182; x=1767088982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hNHRxnSnE8voMM72m011bJb2yQG4C90b65WjUVIP41I=;
        b=OkKB06iZZ14rdP6KYWejxlbWILQiHtBQ6gfaPsadymYc693dSdq0tJU3jVXWU+ZONP
         uqY5O7rYOsUiO4PFBGzt7zARjzJFO+q2jvkMZI24ENpcmvqO835m/mcJkZE/Ym48olvh
         CtHik1+69iejUQPqhU2Oajn3abuDTufVNjTxZQF2RxjBjWtY6I10iWXyBL1TtRhucb87
         lGLayTY37Y7In/mAwvJVyawZUY76XqMYsxa5r4dkRYPMK3im9xPSyBGjXWieoHlpWt2o
         vu8zICxRZvbUytKaka+VsfmoPTNe7HUpY18YubbmEeQE5YbH7Wj+jwR9Et2vyN6/S9rG
         dLXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFpStWP9FyTyl/fhXoJ2kpNiR6Jv6Ue1UcGuQfGgMvib+hH58MU9x66ezt3HqbiAEdIN0kkhF7WEJjJI5W@vger.kernel.org
X-Gm-Message-State: AOJu0Yya8Cm9dDoeYfZXNSwdqzaFpvPXno+7cSmc+wxAgjgqYu2c01n0
	7UKEyWWlq6TPfipUQMhgQ4+823/hAUzTPOTyIfTkeN35MX/D75roBe4JtIMMufPdxzA0vBciKCZ
	D4ENtzg==
X-Gm-Gg: AY/fxX6yEOx+MS/N0wtzfMUVTRjZDk6GKtRP4wN3NUDMfqXifVXEPBGJ2V47o9EIGgu
	CC4bCRI9w9rt6TlKTsgP+FHpFwcCCUdC75qn4oA2DAepLD23Y1JxBnLDcLcadLbcIp9iKIm8QoU
	RGZ46W7inuSZqcCQmq3WiyTObLeqrohripZBJy8NsBJ5OqibO3c54CNhAwZqoxhXR2lZVlFKFPE
	+iInMLlBeN2F5I/cdSZnw/l5KrETDh8PEi9TrWwkw1/Ahf2pXaHPmU5S+I+r/P5aPZUAFCRn2BO
	QRdoCrnyA0hzLMYn1yrtBY6/+LEBVTV9NbgWYa4QxzrrjLZAwQVT/QazTXTsABI5K7KkM+2ZRwu
	rlOULOKhB1mogXNDGRh4mzsNe9bhjh3DMfKWO77RSG3jUTg3tiNJfazk6lQx9LXHUIOGSIbOAbT
	sBFLvXJjN9h5Lq7koZqQEK7hamfKyjFaw/cIDkJKRXZCgnYb4CJNlYmnI9KQ4KvLWYQL+GJA==
X-Google-Smtp-Source: AGHT+IGNtNheNogZqw0341pm7gPXzJ8uyXpjG5TDNVfW1wZ6fEI74LDfk1NPk65WaE3b21JIBKcnSQ==
X-Received: by 2002:a05:6512:10d5:b0:594:2dbb:723a with SMTP id 2adb3069b0e04-59a17d5da8bmr5427175e87.39.1766484181553;
        Tue, 23 Dec 2025 02:03:01 -0800 (PST)
Received: from ribalda.c.googlers.com (165.173.228.35.bc.googleusercontent.com. [35.228.173.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185ea248sm3891990e87.43.2025.12.23.02.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:03:00 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 23 Dec 2025 10:02:58 +0000
Subject: [PATCH v3 2/2] media: iris: Fix fps calculation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-warnings-6-19-v3-2-e8f56cb204ec@chromium.org>
References: <20251223-warnings-6-19-v3-0-e8f56cb204ec@chromium.org>
In-Reply-To: <20251223-warnings-6-19-v3-0-e8f56cb204ec@chromium.org>
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
index 5830eba93c68b27fa9db87bac63a691eaca338d2..0ed5018f9fe3326f5bcc1678e854589c65e8a954 100644
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
+	fps = timeperframe->denominator / timeperframe->numerator;
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
2.52.0.358.g0dd7633a29-goog


