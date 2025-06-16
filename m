Return-Path: <linux-arm-msm+bounces-61473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF231ADB568
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 17:30:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB86616ED61
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 15:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A16D52206B8;
	Mon, 16 Jun 2025 15:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nUVkwTx8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E122405E5
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 15:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750087764; cv=none; b=LR0Nip/9qPHAcXPoWpbkmGDrd0HECM5bWT7P5FXX3qPLK1BEAcPhRFyAc6EOO9GzB9gT03fSbMZ+tI1gXbGhNj0ovH2+3W9TL6bkGfPhLuJHLf9XOAzJjS2CGBvuUGagJo8nBExmhd3xt7oGBGQG0UR5cZ9NYSHafiyKXSKpKxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750087764; c=relaxed/simple;
	bh=QTqQXKpSaHgVdqMQgqBRH2JWW49/Aln0Z1IoSGyHsXs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bad7nRchn4goAMp3UhoyaVx3a7P0BcfPKsmbYPHAUy0zBOm3sTVjiPIFjFw7O4toNKvDSygTl5pnw1W+8Z8fo+rtVbOyWpLrPVc58iV0SDzRLiylqcWgrUvnR3KsTyQFA0lp5PT6eGIGwOzDX3J1ia9EDZmZi/HgDtmIbNo7m3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nUVkwTx8; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-32934448e8bso38986511fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 08:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750087760; x=1750692560; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mlyAumQktw9+u0JXM2Txd/n03QRXeUazVPfU+3yUgZY=;
        b=nUVkwTx8nCCbmMGbNIhwjsfBAq5gZy1gieKj8mO8JOCAWSBLY6VvX4rA/BzNxUiWRM
         0PE+KUeYbK6ScZwqWJm9/Dbe/PhjuonwC7yaOTm9/GQjCuG2NIHxAa+kXXtKepAhE9GL
         M7tI9rEFxiS1whWoAbdiRz0bszPX7HacAEJHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750087760; x=1750692560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mlyAumQktw9+u0JXM2Txd/n03QRXeUazVPfU+3yUgZY=;
        b=Z9DD34eCTTuO0f8pt/3ylPj/8rRhO+rH3TZj3+lV31jlMvX9G4AKYU9DFCNJ6aV0x1
         JKW8NTazV0Fx5zjX5jkr+aVPxw7uyuojqixO2Wc2ts4wgouE0Yyut4sz5DzeruzBlNrB
         tv0MYEWWg8osJSZgmgyBcLSyKhhM06rJJ0It6+ew3DDXIrqqpGUUWeKNkQObpU53DiTk
         mWS2GGA1Xlhn+ajEu7aUnp7AEjdA0RcFkBf26NqU2Cf7gYf4NzITicKIcy1iUKC9zOZB
         T2wZNjg8eJSzl4fZ7CR+KQQszejnshuLkmFoyy58oC/TvNWTeNUafAqmVonJtkGfe/U5
         Fa6g==
X-Forwarded-Encrypted: i=1; AJvYcCWlEuaUvy7u3FZx4O/oHcsMaDz71ur5ArpAFNtR0xY1CkssHun1l4wBqSUJLggr1zRZro7iDgzAmMWa6Oj3@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1a1LCnHSkMZUzxnnO11lIW4mRqvVp+WjRfVPHwDJ64NymOFkZ
	+OlxBpijHTFOfDhFY2iicBA4wCEBlBufWPHfTbm7LCh6GZ2smqx8rk/528Te45l1Qg==
X-Gm-Gg: ASbGncutDTSk592xNLBI3PDuqHmNKDc5v+wW0NJ2EH4EuttWr4G7vroesgzko53Im4A
	r8cxm1yV5ilnskj9yUc0Qhvz75T7QoGUkf8hkof7XKMPtz5GywRqYIqh4ifmKIsb2d5Y4O3QsjI
	gyz4WOCXTrse3IZxEK81e89dmmrIjxfFr+SViZNl3sgfRtd04aSnqWJDDIN5hcs9f/OEJPzW5Eu
	ivePCZ4XjX6BcikRRzu891mSgwwTnIhokivokif5Z5424iqkCJgWe2caTzWWTcikimPcL+qzGUY
	F1faz3FBD1jdyfquN0/5Ul/DK6P8xJxGxhvaI33CqHrWr2JEIvuyrq3zaR5xz0btvpJyhXEBwI5
	QSGV68oms3EmRu2aaAJzzF1E/4O0+BVcqbFiiLT7Diw==
X-Google-Smtp-Source: AGHT+IHXgxUoxsW63ox+OnSgw8OyuXCA4mc43J8ddOKq402U70VL/w2SFl0wGPNxpkoy3jGyCrD6iA==
X-Received: by 2002:a05:6512:1188:b0:553:af30:1e8b with SMTP id 2adb3069b0e04-553b6f19a2fmr2486272e87.38.1750087759937;
        Mon, 16 Jun 2025 08:29:19 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac11ff5dsm1568020e87.31.2025.06.16.08.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 08:29:19 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Jun 2025 15:29:16 +0000
Subject: [PATCH v7 3/5] media: venus: Remove timeperframe from inst
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-test-v7-3-b8c0f98494fa@chromium.org>
References: <20250616-test-v7-0-b8c0f98494fa@chromium.org>
In-Reply-To: <20250616-test-v7-0-b8c0f98494fa@chromium.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The driver only cares about whole fps. We can infer the timeperframe
from the fps field. Remove the redundant field.

Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/core.h |  2 --
 drivers/media/platform/qcom/venus/vdec.c | 15 ++++++++-------
 drivers/media/platform/qcom/venus/venc.c | 16 ++++++++--------
 3 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 5b1ba1c69adba14c3560a4bc6d09435529f295a6..9cfb860e01e752bf9856a3550f59c8c7b43647d2 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -413,7 +413,6 @@ enum venus_inst_modes {
  * @tss:		timestamp metadata
  * @payloads:		cache plane payload to use it for clock/BW scaling
  * @fps:		holds current FPS
- * @timeperframe:	holds current time per frame structure
  * @fmt_out:	a reference to output format structure
  * @fmt_cap:	a reference to capture format structure
  * @num_input_bufs:	holds number of input buffers
@@ -484,7 +483,6 @@ struct venus_inst {
 	struct venus_ts_metadata tss[VIDEO_MAX_FRAME];
 	unsigned long payloads[VIDEO_MAX_FRAME];
 	u64 fps;
-	struct v4l2_fract timeperframe;
 	const struct venus_format *fmt_out;
 	const struct venus_format *fmt_cap;
 	unsigned int num_input_bufs;
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index fca27be61f4b869840904cc0577949635bc63cab..7d6612234d18a49573dc502d48ee61a900b63194 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -471,10 +471,12 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 		return -EINVAL;
 
 	memset(cap->reserved, 0, sizeof(cap->reserved));
-	if (!timeperframe->denominator)
-		timeperframe->denominator = inst->timeperframe.denominator;
-	if (!timeperframe->numerator)
-		timeperframe->numerator = inst->timeperframe.numerator;
+
+	if (!timeperframe->numerator || !timeperframe->denominator) {
+		timeperframe->numerator = 1;
+		timeperframe->denominator = inst->fps;
+	}
+
 	cap->readbuffers = 0;
 	cap->extendedmode = 0;
 	cap->capability = V4L2_CAP_TIMEPERFRAME;
@@ -487,7 +489,8 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	fps = min(VENUS_MAX_FPS, fps);
 
 	inst->fps = fps;
-	inst->timeperframe = *timeperframe;
+	timeperframe->numerator = 1;
+	timeperframe->denominator = inst->fps;
 
 	return 0;
 }
@@ -1622,8 +1625,6 @@ static void vdec_inst_init(struct venus_inst *inst)
 	inst->out_width = frame_width_min(inst);
 	inst->out_height = frame_height_min(inst);
 	inst->fps = 30;
-	inst->timeperframe.numerator = 1;
-	inst->timeperframe.denominator = 30;
 	inst->opb_buftype = HFI_BUFFER_OUTPUT;
 }
 
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index b9ccee870c3d1238e04cef5e9344bd992d86d737..4979392aa20b6dc94895c7089878531b92b57754 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -401,10 +401,10 @@ static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 
 	memset(out->reserved, 0, sizeof(out->reserved));
 
-	if (!timeperframe->denominator)
-		timeperframe->denominator = inst->timeperframe.denominator;
-	if (!timeperframe->numerator)
-		timeperframe->numerator = inst->timeperframe.numerator;
+	if (!timeperframe->numerator || !timeperframe->denominator) {
+		timeperframe->numerator = 1;
+		timeperframe->denominator = inst->fps;
+	}
 
 	out->capability = V4L2_CAP_TIMEPERFRAME;
 
@@ -416,8 +416,9 @@ static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	do_div(fps, us_per_frame);
 	fps = min(VENUS_MAX_FPS, fps);
 
-	inst->timeperframe = *timeperframe;
 	inst->fps = fps;
+	timeperframe->numerator = 1;
+	timeperframe->denominator = inst->fps;
 
 	return 0;
 }
@@ -431,7 +432,8 @@ static int venc_g_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 		return -EINVAL;
 
 	a->parm.output.capability |= V4L2_CAP_TIMEPERFRAME;
-	a->parm.output.timeperframe = inst->timeperframe;
+	a->parm.output.timeperframe.numerator = 1;
+	a->parm.output.timeperframe.denominator = inst->fps;
 
 	return 0;
 }
@@ -1454,8 +1456,6 @@ static void venc_inst_init(struct venus_inst *inst)
 	inst->out_width = 1280;
 	inst->out_height = 720;
 	inst->fps = 15;
-	inst->timeperframe.numerator = 1;
-	inst->timeperframe.denominator = 15;
 	inst->hfi_codec = HFI_VIDEO_CODEC_H264;
 }
 

-- 
2.50.0.rc1.591.g9c95f17f64-goog


