Return-Path: <linux-arm-msm+bounces-44785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD0EA0A283
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 10:56:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EC99188B465
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 09:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E769192B8F;
	Sat, 11 Jan 2025 09:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eCMys+aI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B18A1922E7
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jan 2025 09:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736589333; cv=none; b=Dk7A4WKY5B0Hs023l7ZSP/tf9YyIBx8teKXbcoPpi141vHQAW1EFQdqiFZkh6KfQBmwo98dyvvN6GyCt0ptczEYeCwZteAZ3xjy1besvLTIxEDWloEk3B5zxIgYcSvXXOOFusbsgaeHhE+ppijcWIV8vzlfo1TcbFwQE+G/sACA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736589333; c=relaxed/simple;
	bh=BHqXjzXegfvyleJbFzCIkEZ/Ohsk17MMdh8326GOkbU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ljy/8MAPurhzQf8ISosQ+HgEOeiDuzURGlfII+V3kj3hNdhzSVLGrNeSzLOHagZ3grupTjEKIliYF7SilLh+04MtfALBo3aUEe1TA/055OV9/dUhIJr1o0CUhdUPNTGRncwGv7k+wdptyCoyxa6lmJJjFtPE4ZyqQdeloSDM02g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eCMys+aI; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7b6e5ee6ac7so232739285a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jan 2025 01:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736589330; x=1737194130; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L1KYqWnRc25c7X6AgX8mJMBcXv6X4I+XW042aps6zcs=;
        b=eCMys+aINUeyPpHOqwmcacUWkFZpKdFbU3ZRGl2lokoR4qr5aKpr4UDxLxbAkP0xhm
         W17GheV+iCuPMwLG3CEpQO/NQ1bwW2Q6OJzTb3cPHwjchTh3BfTxzkGoqiSEtI9FfXfO
         ck8Uj5y3NhBNhIllRRwxnAaPKwhiZJUhubre8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736589330; x=1737194130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L1KYqWnRc25c7X6AgX8mJMBcXv6X4I+XW042aps6zcs=;
        b=Trb0koaDlbOQVEj+FYP7IbxPkRHTgJ+jcvT8t+ssd2fZta+PZZz6/DjY9z92IhwLC2
         k8sdR1O8K4SxFO7BXvQZh9xs7db/DODGxd+1Dpiqq0IAbceUZtBcxW5XEOpNBxZf/NCz
         op4jzAhtsmjWlsa/R//ZFtp9I2jShPQvdyYEAF8EOyQ1QKmqcbKGTGw7G5AUG3m0rMKD
         4UHtITsZWMV9PasZyfm3CqEIp1TDZw8+wXmDzLjW2dLjzhnuboIN6ocHZOAMuiBhGsod
         uJ3tkTareQg0ZMl+WxAGv0r7ZZFiF9w/zTgXx4E3M+VysuYd+LSfn5+/CHytppzJeVff
         E4uA==
X-Forwarded-Encrypted: i=1; AJvYcCXyJPEnmB6d7KImLuQ3RofRYG2ZY6NtY/UssCTTi9S6J1v2XJTKFm883Rol98uTfRQaG8L6hjQzjP3Jxjoy@vger.kernel.org
X-Gm-Message-State: AOJu0YzOTgVCM3EYX8G600MuPAkutCHXudMRMiUzfL1q8FRHKxtzNE2D
	g9Vrk70iSj8qDqLqJkyYhThdDs5X8qsLAMIHFvrSryIosEY5Ey9BW2oX6SyZVQ==
X-Gm-Gg: ASbGncv922pvF3iKrr8cvE/QfKSgon3Cgh25sW1hkiv4hZHUhqTWwGHxhxm0XoMxqlz
	pEym7xoDMLe3y/DEr0TLNlLtQOJK4vQL3retj7y7n/RECi/qk+SRvQzxBJbgsV+fCrxfwO3x3yD
	MCsp8rqPACFSdBq1vizl/BtOMXjnycowMabe1Z4MkjaIJf+w2jVtQlKcb5q45EtEcNY6QxIzAQO
	OAVOS0fC6pSbQqcEOADfisFr+whhAIFvKC2Y1lome18dp3DhLyvfZsTeeWHQ2zhOqAKZoTfw8Ai
	LgDhrxLBqrxYMuxbn9CVDXJqEaFCxpUu2JNU
X-Google-Smtp-Source: AGHT+IEPxC3OyMHAru8G3Gzds3v7OF/JkO9AvPzj8XxD1gntOl6n6mbYKW7VgLUWHJdUgNP6gB5oAA==
X-Received: by 2002:a05:620a:4402:b0:7b6:d6dd:8826 with SMTP id af79cd13be357-7bcd97b8724mr2371667285a.55.1736589330581;
        Sat, 11 Jan 2025 01:55:30 -0800 (PST)
Received: from denia.c.googlers.com (172.174.245.35.bc.googleusercontent.com. [35.245.174.172])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7bce327b8besm267096785a.59.2025.01.11.01.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 01:55:29 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sat, 11 Jan 2025 09:55:17 +0000
Subject: [PATCH v6 4/6] media: venus: Remove timeperframe from inst
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250111-fix-cocci-v6-4-1aa7842006cc@chromium.org>
References: <20250111-fix-cocci-v6-0-1aa7842006cc@chromium.org>
In-Reply-To: <20250111-fix-cocci-v6-0-1aa7842006cc@chromium.org>
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


