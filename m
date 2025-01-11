Return-Path: <linux-arm-msm+bounces-44784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9C8A0A27F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 10:56:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C19B3A9525
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 09:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52CCF1917EB;
	Sat, 11 Jan 2025 09:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="C96bSz6T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9204B1917F0
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jan 2025 09:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736589331; cv=none; b=fTTlVfH7WOyz0eQAv3Bv4lQaIOIY54U0FXDOjZxrjDAnOjRiCfb20i2aKHQlHZXlzb84GZE4COQleK3BWWzidxoUOrBFTX9CIVRk6slB7cBa1TstQNsFNl8lDJm8igHG/az3N6kyxTruNqG4d53PPz9acG/DDd84n0B5l9GhaNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736589331; c=relaxed/simple;
	bh=+5gKBR6lmCbLgDxwlcOKTLF2APbAil9sB0eDtQkBz/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZvXiVAPiCqKfIIN4+2yqRTLQFAflD9kDxPoJZ3hESdelDm4271ifPuKzH45WzZOZt4WsuYcC1+G36nlsgykF+feIyDQ0HHI/P+uuqUX5vedjC5U6V6jbBDAXsKD8/ojfcLYT/5/rw1X2GXqv5WrGNXUutfakkcMtFuGQBrG70ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=C96bSz6T; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7b70e78351aso236813285a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jan 2025 01:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736589328; x=1737194128; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oGXizJerOok0lDZxPeMPfVFSvShgmDlyLJgvxCS81kE=;
        b=C96bSz6TaoQXqnsfWjFREu7KcD0EjOj6CbbnAHPSV2wqMTwI6pYbppEnh56C8ciRLt
         H/6p4gZMwGnmmDFNwcYC9KGNozEAzwSgg1WjdQioFifHmeBNay88+Q2Nqm16gdQZszcM
         ZX50gFtVpauN4oFNajPz3VpJMepN/dQNUDEQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736589328; x=1737194128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oGXizJerOok0lDZxPeMPfVFSvShgmDlyLJgvxCS81kE=;
        b=DULErJhT+7PC49mI8w3G8isu0J3FYF4CwrZBHnj5gEU42r7fcTeztG4dOBvHT4GFPK
         GJ6uTNXgX43Kj6VCkO+lFpD3VAGjm413DNOA3QbIBPxaU8pXjTUuDnUfYU/zbARmioiq
         B3ne/PYz9j1jHLLzdg1B/5TGaVq7jwwdFCALwf2Df8VifHF7ySS5FF6XGeRLq8oQIxQB
         HOQGDZiZuoBPl89c7lI/WP90Z1bjDo5ixjB+Z43047mcYzqIUf9w20kn+Dc465ixyEyX
         VxW7P49HvrKwdyEkXamE8eOWNtBg6UfxfAhS92JqbDql7wdI/Zxd93w3DPemRnUCzuTD
         /hZA==
X-Forwarded-Encrypted: i=1; AJvYcCWbu8Vmu70tU6wgik2oq3aBoPRKUF+WB7ISJvrYx6HKH9aXWRiPcZNcJaU3xi7ZPliU/+/xdYIex5oyWvdb@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1wk+XG1a7MtlQ/t1HkXxU/JsqB3NR9r7siGyOoN8onCLjKgYV
	Ya8JYfF/y8Q1N1z7RdAiRRy6on1Cpg9GbAKaOPItzNv8efsotNGNJI7+Q5n6Gg==
X-Gm-Gg: ASbGncsxVBGNG6iqIkLjeQoVB6XyVug00fLaptswv8N9+9vDRXhmf6uxmAbrLMpXMkE
	b7fPpbZjTbKSI2y9495ob5HbnNQB/EeLuR+DpTMuibAWGcOxwW0Y5fhm+W++oN62foeNjP3ymY0
	HVqrPdLYCMRHgRAZkn0P0AZZJtxxZt25VkIHo28Q3meDGrRN4+ZsRM4aLueuWubwYi5+exSw//C
	1iffmSZsXtAnUq3ppPx+/5pvwTsw86eruWOSGm2QJKGlO1Y7WvjNCSKvBGIfyYyiZTkXFEVsVzR
	xrYm7kAowh+8BGw8rFKf12I++wCo4wLhBm9O
X-Google-Smtp-Source: AGHT+IEpVR9I5biYuCr+SXV0UBeBGfKSe31bfLKgP7VOr+BuuQiGS7W1xlNlsmHP///j6pnH4LIVBQ==
X-Received: by 2002:a05:620a:462b:b0:7b6:c540:9531 with SMTP id af79cd13be357-7bcd974a281mr2043337685a.18.1736589328570;
        Sat, 11 Jan 2025 01:55:28 -0800 (PST)
Received: from denia.c.googlers.com (172.174.245.35.bc.googleusercontent.com. [35.245.174.172])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7bce327b8besm267096785a.59.2025.01.11.01.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 01:55:27 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sat, 11 Jan 2025 09:55:16 +0000
Subject: [PATCH v6 3/6] media: venus: venc: Clamp parm smaller than 1fps
 and bigger than 240
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250111-fix-cocci-v6-3-1aa7842006cc@chromium.org>
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

Clamp the parm if the user provides a value that will result in an invalid
fps.

Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
Closes: https://lore.kernel.org/linux-media/f11653a7-bc49-48cd-9cdb-1659147453e4@xs4all.nl/T/#m91cd962ac942834654f94c92206e2f85ff7d97f0
Fixes: aaaa93eda64b ("[media] media: venus: venc: add video encoder files")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/venc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index c1c543535aaf..943d432b6568 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -411,11 +411,10 @@ static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	us_per_frame = timeperframe->numerator * (u64)USEC_PER_SEC;
 	do_div(us_per_frame, timeperframe->denominator);
 
-	if (!us_per_frame)
-		return -EINVAL;
-
+	us_per_frame = max(USEC_PER_SEC, us_per_frame);
 	fps = (u64)USEC_PER_SEC;
 	do_div(fps, us_per_frame);
+	fps = min(VENUS_MAX_FPS, fps);
 
 	inst->timeperframe = *timeperframe;
 	inst->fps = fps;

-- 
2.47.1.613.gc27f4b7a9f-goog


