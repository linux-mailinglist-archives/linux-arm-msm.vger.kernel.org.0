Return-Path: <linux-arm-msm+bounces-44787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C65F7A0A289
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 10:56:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4D01164F0D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 09:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBD8818FDD0;
	Sat, 11 Jan 2025 09:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iSdlN1C0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686C818FDC8
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jan 2025 09:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736589347; cv=none; b=RbyBug6KUWZ0e85pgtCAvm4uWjd5o7CtWdsh3iWJiSN47gHtMcWcezsA7puhftMUQea/j2URvy8E1n6Qa+FJaFqOM528e7f91ClsLhxEBkO6AiylAiAOmGl0XPXI+Ps3rdkZvLh4SW8i/Tq+t1tRy8Y4/ofOUIRBZb/GVyF0AlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736589347; c=relaxed/simple;
	bh=hAlPOuL4YIiXg0HpbIYhah7+pVVbm4tj/0Q43k0VF20=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QEiTd0bVF/ilWEC+5ChYBiOEArUm01K/tmy0CzYJAEpIL2zgA2suq6n4LvCtbyNkW1n73QzSOZWVoDE/pJYUb6m7SWaAOxqAIjZoc/IrhjLXshppegcNKZBkt/fRw0dtB+ZoaAvJaFPguVoP3fOaiZV+67gDL/JcxGhoB9tDWZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iSdlN1C0; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7b6f8524f23so300729685a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jan 2025 01:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736589345; x=1737194145; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x7AhuqiCmj982Ah3x3XQKiIUQdsA0iVwLzLzuPzwXZk=;
        b=iSdlN1C0rGRnzvzQnMULxgVbw+tZymFS0zBYfHuPP8TMxo83WqVvB4UixO+VAxvbz2
         0ChEh5pE4hOziKajDXj05dtstSe723KgbQrUMfEnVjvEEJAgYOODrKkMgpR7sdZMmW2V
         pZvGnB+SfNoWgq09RbTmkiHx65BOzFdglgjlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736589345; x=1737194145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x7AhuqiCmj982Ah3x3XQKiIUQdsA0iVwLzLzuPzwXZk=;
        b=aUD4XyKjzoy31zV1vphn0SwtyKKeXUk/iZpRtAis+oO/79/L3EKbJO+Cu9pCLg3Wpn
         2bRw6fEXseiKNf+9P0lBCGWhthkFfHQ/mzRqCVlodCxlTrnMHGmAIbY3yjos4Czk18j3
         5m1O1ogD1oQC0NH0/i0iV+6gVMV5VxcMNbxIvFb6RdclNPXzse7DQvDDtmmEpO8Lo3Q9
         giBeDeYGpbZrD96bF19xkvyUC4zjGLXdLTx+Ual3jlBrpQ4jccjoXCeQAfvecPLuH4w+
         rNRNb/F8+eRUlI/Iw2gM4DVdheftbgJgLefsVtfnfVrqnNSnpALBNcBmX80/0ektfOSA
         GAtw==
X-Forwarded-Encrypted: i=1; AJvYcCWbcuAuAtr0aP/dF+VLAiOMXDxFFWYohu8pZ364yVIUIGwv9nDil4gTeC+yqf/I7jTHThB4OSIlqN9JxzX3@vger.kernel.org
X-Gm-Message-State: AOJu0YzMhP4Sg0X48vLzS8egsvLPqCbCLJ+rKiIAub23qWoac510PQM3
	4zzFOaMOCW00JqxEi8FbCzFzGmcde0vBAqWrz7SJFQvgr7csuuD6776lbvf/ebai+fOpKNF2bxb
	sMw==
X-Gm-Gg: ASbGncuayDybgQ3KMAVuqRTVBQplfkG6cHcLskKxlQ9Ni6iVF4d4i4Z+zgcXn4KZBV8
	dd+3QhvkccCTFXV2LppOZUmpXpuG0M/0PZ2C21mpla8n1UGJNtC1ijhUM4AQUKqIR1F48qzs7P/
	TvGH337W/YRz4qcwylcem2Ty1ersA/XjrLJiB3tpuaBluU6Q9VKuITXyugc4aXLAO9hTFHgy9aE
	KLVGQcBR8ubrbK43MHnOCBoOrIYxT9M+s0hQ9o7WESciW0Lan+gLsw3lAfX7uDLCfFX/ckoe12s
	KzY1mVDiWT6Zv8JzWwc+T3nyIEWXMWspRo9t
X-Google-Smtp-Source: AGHT+IFPc65u5Xb9RCjGLJ3Jl3Vf9y0Du5AsKFgmKuWXejd7Aufwu6k8jsIz9OTvYdbOGhoPzK7nZw==
X-Received: by 2002:a05:620a:462c:b0:7b6:d0bd:c7e6 with SMTP id af79cd13be357-7bcd9759db8mr2313763885a.32.1736589334727;
        Sat, 11 Jan 2025 01:55:34 -0800 (PST)
Received: from denia.c.googlers.com (172.174.245.35.bc.googleusercontent.com. [35.245.174.172])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7bce327b8besm267096785a.59.2025.01.11.01.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 01:55:33 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sat, 11 Jan 2025 09:55:19 +0000
Subject: [PATCH v6 6/6] media: venus: vdec: Make the range of us_per_frame
 explicit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250111-fix-cocci-v6-6-1aa7842006cc@chromium.org>
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

Fps bigger than 0.000232829 fps, this fits in a 32 bit us_per_frame.
There is no need to do a 64 bit division here.
Also, the driver only works with whole fps.

Found by cocci:
drivers/media/platform/qcom/venus/vdec.c:488:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/vdec.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index e160a5508154..aa9ba38186b8 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -484,8 +484,7 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	do_div(us_per_frame, timeperframe->denominator);
 
 	us_per_frame = max(USEC_PER_SEC, us_per_frame);
-	fps = (u64)USEC_PER_SEC;
-	do_div(fps, us_per_frame);
+	fps = USEC_PER_SEC / (u32)us_per_frame;
 	fps = min(VENUS_MAX_FPS, fps);
 
 	inst->fps = fps;

-- 
2.47.1.613.gc27f4b7a9f-goog


