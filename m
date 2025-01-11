Return-Path: <linux-arm-msm+bounces-44783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D7927A0A27D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 10:55:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C13F0188A1CE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 09:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB564191F6C;
	Sat, 11 Jan 2025 09:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mzmvtG/6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA03190665
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jan 2025 09:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736589329; cv=none; b=mP7dJhyeuWIzROU/VI39WNdMPMhnYUDXUSBDYLB5I5xtnloRZjrnXbo+/gRPyi4QWz+QAnsHNykw4vuzRHyYgoh57PTxH/wttCWAxtYSeuJTds9sdkmw6/Q9YcvbKcT/xb5MyfS5mPvB5D5f12q1az9A9y7tmrj7WjTd935vdYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736589329; c=relaxed/simple;
	bh=wNqPLVCH3hrYmgRdcOul7vFmT8NC6JPiLWWSYrAMGoA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m0XyAz5zi1BLRvgdkCc6VfI+tRiWW8SS4mCUmOyhiocERGbvDlV2K3iuoq3Tx1bH2j17h3D713sbh3+arZEiefEF4WNnJckfFs0YYE+3FshNApbYgooAtD+DEu97Byufvy3C+ooDTXMXi5v5jR3CMkDFq7tqFE6PIDF4BZ+VAWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mzmvtG/6; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6d8f75b31bfso23094076d6.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jan 2025 01:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736589327; x=1737194127; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oCQd+Ixr8eKIqoAvIvPqynaVVvGYXfmfSE/3mmNL7HE=;
        b=mzmvtG/6r8mK1zoH6VyrK6+xwRRAqfawlkHIsMszsUYLwvRYn/6TL6Qr61/nvx8rAs
         Gdd6cw9NSir9g7J/HgO8xO7qrQTrxXDEXPVfhXpquWrhuvR6ClZz03Lm7piHlXl+HFPd
         BDIm1RO4GnaeoAduoXWkj5W/YsYTt8+q8gCHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736589327; x=1737194127;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oCQd+Ixr8eKIqoAvIvPqynaVVvGYXfmfSE/3mmNL7HE=;
        b=W7yiGOfg2qE9DlGd9EzJveCYARc0sClF4Aq7Y3pHkUOYVA0X2LSlJBYVeCAHEpJ/Ku
         iN/7HcFv1gaY7xje1Y534q3BbWjKiazOwPQttD2dZKdSI+fbJvBUE7Lge7CccJB1U0Fl
         v4/crxX04+Ps0tBFgGFM9U2UwlDdadb02ljlwv5omfdptSPLRPlt/QbLpDu3IL9Ya57u
         2fAtetzCZQlGvKmp/x/5GjGvAN4gtJzmCON9vPDMM0sslP4u0zDp6Oj4seo2GKTuZX4P
         WWHnPD76EtmLjL2AYkvjNczXDiuZlEAmQyaCh6UvWJVlrQJrfpY2JxuSBneq2+XyfLsN
         uqJg==
X-Forwarded-Encrypted: i=1; AJvYcCUkoQjZePoMB8KT97HV7HZcJUtBPq37KU+SEV6MIsRgTXxMVhZSYce4iGc168PS3srDei9nlAI5kwfONqxS@vger.kernel.org
X-Gm-Message-State: AOJu0YztSu/HCVxtDu9POahBvqyzOWgTJ30eueV8vYpaScHN5OcogRc6
	fzO/MXz0CttbnXcRnETeaDRSD6eZ9La9VcgNOCas7aH0lekeEj1oTgEW214gmQ==
X-Gm-Gg: ASbGncuZGM+gbLY+swcHI94oNVlr+ZVSgOVy2UlSpdhpxcJQPSNC2J2XIUp/xYQpepz
	X4K/cBsd7zG7VeomVyWJvhqfdgknew+rZ5uJnqwttiHTHU8NxxAbkJ2FDcG4rHTl4k6d1auE31c
	V8i88ZLvdUs49F5DQbdEw4yxDtE4Xx08u8V2kSXztJruJ5ReKgL0hYibEc+G9c7QZ416wsrsOD0
	Ulg0tRM3fHJhD1woVdiagnYsdDAppd7zX6sxA5WDPIfui1OtnIp2DNK5ACHUgMc7KThiiCh1AjU
	TkvIGCOvuLWmPR2TTLFhy9UJT2blj/4Pk13I
X-Google-Smtp-Source: AGHT+IHefNcjGKIvCVrBMfxFKkoA1dyzaoWQ3H4EQvH1E/W+4lJXoiyaYADeYG3+4FMKAC4ihgK0qA==
X-Received: by 2002:a05:6214:4111:b0:6d8:8416:9c54 with SMTP id 6a1803df08f44-6df9b1ed60bmr244663736d6.16.1736589326457;
        Sat, 11 Jan 2025 01:55:26 -0800 (PST)
Received: from denia.c.googlers.com (172.174.245.35.bc.googleusercontent.com. [35.245.174.172])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7bce327b8besm267096785a.59.2025.01.11.01.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 01:55:25 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sat, 11 Jan 2025 09:55:15 +0000
Subject: [PATCH v6 2/6] media: venus: vdec: Clamp parm smaller than 1fps
 and bigger than 240.
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250111-fix-cocci-v6-2-1aa7842006cc@chromium.org>
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

The driver uses "whole" fps in all its calculations (e.g. in
load_per_instance()). Those calculation expect an fps bigger than 1, and
not big enough to overflow.

Clamp the value if the user provides a parm that will result in an invalid
fps.

Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
Closes: https://lore.kernel.org/linux-media/f11653a7-bc49-48cd-9cdb-1659147453e4@xs4all.nl/T/#m91cd962ac942834654f94c92206e2f85ff7d97f0
Fixes: 7472c1c69138 ("[media] media: venus: vdec: add video decoder files")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/core.h | 2 ++
 drivers/media/platform/qcom/venus/vdec.c | 5 ++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 44f1c3bc4186..afae2b9fdaf7 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -28,6 +28,8 @@
 #define VIDC_RESETS_NUM_MAX		2
 #define VIDC_MAX_HIER_CODING_LAYER 6
 
+#define VENUS_MAX_FPS			240
+
 extern int venus_fw_debug;
 
 struct freq_tbl {
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 98c22b9f9372..c1d5f94e16b4 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -481,11 +481,10 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	us_per_frame = timeperframe->numerator * (u64)USEC_PER_SEC;
 	do_div(us_per_frame, timeperframe->denominator);
 
-	if (!us_per_frame)
-		return -EINVAL;
-
+	us_per_frame = max(USEC_PER_SEC, us_per_frame);
 	fps = (u64)USEC_PER_SEC;
 	do_div(fps, us_per_frame);
+	fps = min(VENUS_MAX_FPS, fps);
 
 	inst->fps = fps;
 	inst->timeperframe = *timeperframe;

-- 
2.47.1.613.gc27f4b7a9f-goog


