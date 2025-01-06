Return-Path: <linux-arm-msm+bounces-44000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F67A026DB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 14:41:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B87461885D1D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 13:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D451DED4A;
	Mon,  6 Jan 2025 13:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mN0cEaP6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62EB1DE4ED
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jan 2025 13:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736170815; cv=none; b=Ji4VDFV1kuNUxVxojV5egzp/AxF5Dicv0q9ggG3n+SShyKU7nSROp/lII0iPAeLL37RqTKHiKsclvrmnIWnSehsSlALP0NaKEXZkR++6LTQNqgdRpjX9+PoA0ZllLPu3jzFKVKdnrPTGTdSz5HeVFUrWhHXOCHAR22TVKppqy2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736170815; c=relaxed/simple;
	bh=5Q5B+vO8g/U6CHt36fHOQ4ZUPAjwu5u+O8RVnGjaQOU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U7sl7D6Cxr9BfbbYajsUJGoetw77ZzJI0pFKP8jeRCBulktbhohnIx7uXFEUDhRiNbVrRzX8rvOKbDI4eVuiuuAbCho3ToarcjSQKtJy2Rj2YohJubaw7VYAPYP56dXOb08ALi1ZVSZBgz8AJYw1xg8ChRtCHWgD4XixNQs9uec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mN0cEaP6; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7b6f8524f23so1574972285a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2025 05:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736170813; x=1736775613; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dtAqvkDjh2PaFdbysTqXE6H6Y5IVHgLV/gXYs6imBU0=;
        b=mN0cEaP6+zqFP3CRdYSnZ20pm0BZGOTdsrwZhW/nXoWFBxwmbnxCilPsHodXzrauar
         txXVO+SoTpGWiv6USoURd6crXGqArI/7m+8y3C45AmbUh36TZ9+7SlzmN4vfsQ3zVgVP
         eg+W2bU0xLG7DEeVqE5+MBUkOPrDHpCZSt0Es=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736170813; x=1736775613;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dtAqvkDjh2PaFdbysTqXE6H6Y5IVHgLV/gXYs6imBU0=;
        b=PiN/Uw5Bd+V1XXw6oOTBpBSIjF0R4YNQgndZuvMWIQIRUX1GuFspgzRuF4ZS8K9p7e
         bgXAX7+B6xLMBFh9ekdPjNwFIRrfYbEdPW2icV58UOzbB6xMWUYZhhBznCzAE+3EEkJm
         VPEwRAhxukMDnlZHvkx+U1q/7kGa+33QZMuLE+hRgsz+vkuF1Nitq2J2B7D6EIjW73NK
         jxG9kvgobJIra+U4l86xNnFkHJnDH8N59u6rEHNIQ1x0Q7mgouoGh9Ea8oPR3+QXaLZ/
         bunukCAyeyZY1mkHzr6dwgEMwtjl87/E30ewxBS3bc/qjD41qYYSEyDpG8XnHqStu/xM
         HhrQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4A6BQZjZgaAfevi6GAzG8H/xcfD5TuT+08e9UpavIemCBCnTK17W4gixJjvWPMi++bK0AHpk2n46ebkqd@vger.kernel.org
X-Gm-Message-State: AOJu0YyMY3CIMVd1MHD5HsCpcnTXMON7gpaxqDP/MeG0o53TTKkdzMdU
	OejcLj+GedVor0/5I2M5qjsJlTv/vw0/GqC2DS5WwtvDqTQjoCIZtpDNbK5K/g==
X-Gm-Gg: ASbGncsy6FG3mriPCIVcj39LjXYRjGQ2CDewkk2EuSyViWij0o2wrs91T22jRD7eTRB
	0SD+90DXHTPeUnKiMAsHlU/BH7VbD/dkECk5D9kVFWgRBD5FhU+4dmIBrq5feiM5NifFq6a9TPQ
	UDlbMarD1k8JF26SLwzeOFEEenDXh14rg27bvMTt6D7qtts9VAbRQFV/NX8mA83yJ2shYBaDhLJ
	ejzp+MTBmbWG3lgPO9yJ2BHWO25eOXwOGfWos+sqVDTntdmB5m1vcsHSmB5/W8Jdi0S5sCEOcW4
	o4Ca6I44NcrR8yHFVwMC1QmrSNFaQytS5efq
X-Google-Smtp-Source: AGHT+IHty6kiPE899b/JSwzYcAr9Qll9mS0qFE11JSQ7TgmlLBCHUvVXP+LphtWR0tpu29q+SbqO4g==
X-Received: by 2002:a05:620a:470a:b0:7b6:ece3:825d with SMTP id af79cd13be357-7b9ba716a6emr9941850385a.12.1736170812604;
        Mon, 06 Jan 2025 05:40:12 -0800 (PST)
Received: from denia.c.googlers.com (172.174.245.35.bc.googleusercontent.com. [35.245.174.172])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac478d35sm1501861085a.90.2025.01.06.05.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 05:40:12 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 06 Jan 2025 13:40:10 +0000
Subject: [PATCH v4 4/6] media: venus: Remove timeperframe from inst
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-fix-cocci-v4-4-3c8eb97995ba@chromium.org>
References: <20250106-fix-cocci-v4-0-3c8eb97995ba@chromium.org>
In-Reply-To: <20250106-fix-cocci-v4-0-3c8eb97995ba@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Hans Verkuil <hans.verkuil@cisco.com>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
 linux-arm-msm@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

The driver only cares about whole fps. We can infer the timeperframe
from the fps field. Remove the redundant field.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/core.h |  2 --
 drivers/media/platform/qcom/venus/vdec.c | 15 ++++++++-------
 drivers/media/platform/qcom/venus/venc.c | 17 +++++++++--------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 44f1c3bc4186..988198280687 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -405,7 +405,6 @@ enum venus_inst_modes {
  * @tss:		timestamp metadata
  * @payloads:		cache plane payload to use it for clock/BW scaling
  * @fps:		holds current FPS
- * @timeperframe:	holds current time per frame structure
  * @fmt_out:	a reference to output format structure
  * @fmt_cap:	a reference to capture format structure
  * @num_input_bufs:	holds number of input buffers
@@ -476,7 +475,6 @@ struct venus_inst {
 	struct venus_ts_metadata tss[VIDEO_MAX_FRAME];
 	unsigned long payloads[VIDEO_MAX_FRAME];
 	u64 fps;
-	struct v4l2_fract timeperframe;
 	const struct venus_format *fmt_out;
 	const struct venus_format *fmt_cap;
 	unsigned int num_input_bufs;
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 25edd77b9cf9..6b8906ced6bc 100644
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
@@ -488,7 +490,8 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	do_div(fps, us_per_frame);
 
 	inst->fps = fps;
-	inst->timeperframe = *timeperframe;
+	timeperframe->numerator = 1;
+	timeperframe->denominator = inst->fps;
 
 	return 0;
 }
@@ -1613,8 +1616,6 @@ static void vdec_inst_init(struct venus_inst *inst)
 	inst->out_width = frame_width_min(inst);
 	inst->out_height = frame_height_min(inst);
 	inst->fps = 30;
-	inst->timeperframe.numerator = 1;
-	inst->timeperframe.denominator = 30;
 	inst->opb_buftype = HFI_BUFFER_OUTPUT;
 }
 
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index bd967d60c883..8355bd59a5c2 100644
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
 
@@ -417,8 +417,10 @@ static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	fps = (u64)USEC_PER_SEC;
 	do_div(fps, us_per_frame);
 
-	inst->timeperframe = *timeperframe;
 	inst->fps = fps;
+	timeperframe->numerator = 1;
+	timeperframe->denominator = inst->fps;
+
 
 	return 0;
 }
@@ -432,7 +434,8 @@ static int venc_g_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 		return -EINVAL;
 
 	a->parm.output.capability |= V4L2_CAP_TIMEPERFRAME;
-	a->parm.output.timeperframe = inst->timeperframe;
+	a->parm.output.timeperframe.numerator = 1;
+	a->parm.output.timeperframe.denominator = inst->fps;
 
 	return 0;
 }
@@ -1455,8 +1458,6 @@ static void venc_inst_init(struct venus_inst *inst)
 	inst->out_width = 1280;
 	inst->out_height = 720;
 	inst->fps = 15;
-	inst->timeperframe.numerator = 1;
-	inst->timeperframe.denominator = 15;
 	inst->hfi_codec = HFI_VIDEO_CODEC_H264;
 }
 

-- 
2.47.1.613.gc27f4b7a9f-goog


