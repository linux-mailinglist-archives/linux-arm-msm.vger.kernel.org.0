Return-Path: <linux-arm-msm+bounces-44116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E75B2A03D0A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 11:55:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D05891651EB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 10:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 443711EE7C2;
	Tue,  7 Jan 2025 10:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CguypKy6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5514B1EB9F6
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jan 2025 10:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736247280; cv=none; b=P1/V12wAYaY68KThu/UzHxNvwE66frXzSHG9pv5gbM/r6/j/4FLrWvWSV1XPvHusIwlQP5UnYST6ZlZVFHPZpEkX6mcAZxJsPEB+Cjt6mK383jVedEY/Bo1MIJGwtTwzemjRB2N1Pfe+ontWtj1gqMflYtwc1Td8EiiteRSt3wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736247280; c=relaxed/simple;
	bh=BHqXjzXegfvyleJbFzCIkEZ/Ohsk17MMdh8326GOkbU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hPOl40JymeH/FB3Hz6zmyMqbvLxcPdY6dHxmZIWx4VJGcTccJj28aKRuCTBVm2wVayG/zdN7fH+6Nb8KzTK2NHAutW/amUnOQ4Dm4LfxrS9dwv24SkK2V5B41rrlw2aWq1M3b+mKDh7j6+xRQgEpT447MG95ICva2v5WGtm6Vwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CguypKy6; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6d8a3e99e32so125532636d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2025 02:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736247275; x=1736852075; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L1KYqWnRc25c7X6AgX8mJMBcXv6X4I+XW042aps6zcs=;
        b=CguypKy6ZMpZRnG+NSQzB6lh9yeD8YcENqMQfGVUa4ULeiqNmnTg1QRAxQZwJdFTO2
         vEwdjF3rFscKcLvgTNHNyZ1V+SXQOuSvd4ewAzMsfjPaBCIAkxpWTRA2qAxYY9IQUD5B
         0d/m17Vb6rOnGE6tr2Lfp0fMXcxyKOSOmBYKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736247275; x=1736852075;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L1KYqWnRc25c7X6AgX8mJMBcXv6X4I+XW042aps6zcs=;
        b=b1D+NpaQTMGOJGtm9cnDq0EzK7aFS1rm0YGJvvWBE2JHxM4mBl0ySKaLY1fN4h/Pna
         dSZmeae2PCPBtKHJbsogGc910C08KaXPi4ZI0LIVIXe2kyJGpl84TeEvqfl/4JUijZaB
         Ab4D6Ozq+y1wINZCdWyVpTfsFRBbJCmThCrYV6yRBflZ1nk9Wko23nPzdmPFNvvAdgAY
         i/C5NcMRpy48ZGuL8S8YfiauTvAwM0Iil7Ilh71kriobP3CDPZGFt8vIFTu62l2Pp3hl
         7/iQ6coL80BgqTVsANF5xFwKfHXZNuefpCKMICKbd1TZVNlYjT8tdAat9b23SR7jLuUa
         Y9cg==
X-Forwarded-Encrypted: i=1; AJvYcCWxktUX6LYMK2k/0Ku0qFzkXXu4kfOcoL5iMrDOyOpsaVuUy8P3BYbHM1FKz3A7NdzaC3GD9BicKBj9KMM0@vger.kernel.org
X-Gm-Message-State: AOJu0YwtslvWd9+DvBETlZdKfDvzroaUWz5hPgjB2uvsK8DYWpf9GjNd
	SryH7KsE1JxdiFuN5FJEUy6Hk3Ro+TKGIC0+AqXqosgX2Ciaw0G7DwVdUYq2HQ==
X-Gm-Gg: ASbGncvvKk2oFUltKHApKLswRvigN9PO6mpTq56yoSUssQw+Cn4l23hboaQdbVIyERi
	ISPaUievmZF40qz0IN5sV8GpsiHZ3iyMPhC5HDaf4uOEeiIUNFvxz2M/0D02w7sSpzQwXKJQCCJ
	eEVFD1iOwqlKppf0hYUNT1qiF7r6y0LvqUNrcz/yNmyHQFNy6sxwTm3mA4TPCqj4/McxcJkZt6R
	0VYfP9IuN8pNQj5r0r+HvD9wj5P1A2OOv/lGXmyjW2ObGCqz0OwcjGUtRMfn7//jHoa7j/4wbsF
	RG5EuPTLXHtdB0gVRQHLW/gm46JZb9Hp3i9y
X-Google-Smtp-Source: AGHT+IEeYqSZWdRFjCueXXmNknxsLb2PxqwfnTmsqfcQ/lgV7+HWTnTmz1e34p6hSwZwuYchYY4mRg==
X-Received: by 2002:a05:622a:2c3:b0:466:a9e6:6d6b with SMTP id d75a77b69052e-46a4a8caf6dmr989977671cf.15.1736247275338;
        Tue, 07 Jan 2025 02:54:35 -0800 (PST)
Received: from denia.c.googlers.com (172.174.245.35.bc.googleusercontent.com. [35.245.174.172])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3eb30b97sm185094401cf.86.2025.01.07.02.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 02:54:34 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 07 Jan 2025 10:54:29 +0000
Subject: [PATCH v5 4/6] media: venus: Remove timeperframe from inst
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-fix-cocci-v5-4-b26da641f730@chromium.org>
References: <20250107-fix-cocci-v5-0-b26da641f730@chromium.org>
In-Reply-To: <20250107-fix-cocci-v5-0-b26da641f730@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

The driver only cares about whole fps. We can infer the timeperframe
from the fps field. Remove the redundant field.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/core.h |  2 --
 drivers/media/platform/qcom/venus/vdec.c | 15 ++++++++-------
 drivers/media/platform/qcom/venus/venc.c | 16 ++++++++--------
 3 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index afae2b9fdaf7..1d4fd5cc75d9 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -407,7 +407,6 @@ enum venus_inst_modes {
  * @tss:		timestamp metadata
  * @payloads:		cache plane payload to use it for clock/BW scaling
  * @fps:		holds current FPS
- * @timeperframe:	holds current time per frame structure
  * @fmt_out:	a reference to output format structure
  * @fmt_cap:	a reference to capture format structure
  * @num_input_bufs:	holds number of input buffers
@@ -478,7 +477,6 @@ struct venus_inst {
 	struct venus_ts_metadata tss[VIDEO_MAX_FRAME];
 	unsigned long payloads[VIDEO_MAX_FRAME];
 	u64 fps;
-	struct v4l2_fract timeperframe;
 	const struct venus_format *fmt_out;
 	const struct venus_format *fmt_cap;
 	unsigned int num_input_bufs;
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index c1d5f94e16b4..e160a5508154 100644
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
@@ -1612,8 +1615,6 @@ static void vdec_inst_init(struct venus_inst *inst)
 	inst->out_width = frame_width_min(inst);
 	inst->out_height = frame_height_min(inst);
 	inst->fps = 30;
-	inst->timeperframe.numerator = 1;
-	inst->timeperframe.denominator = 30;
 	inst->opb_buftype = HFI_BUFFER_OUTPUT;
 }
 
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 943d432b6568..17bec44c9825 100644
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
2.47.1.613.gc27f4b7a9f-goog


