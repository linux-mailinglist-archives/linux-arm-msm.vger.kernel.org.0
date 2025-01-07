Return-Path: <linux-arm-msm+bounces-44117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E928A03D0E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 11:55:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A24E63A436D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 10:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 508051EF0A1;
	Tue,  7 Jan 2025 10:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YyyZYg/2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0205C1EE7B9
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jan 2025 10:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736247282; cv=none; b=W52yifuJ3yF+o5wmV9xj/OkXWuFTTu4hg10+5Lywgn3+81MoMY+zpQmy3Ke7mRhZufozkBLaot7Ip2Xy/fo/iRY6FUfq34yiBEvDa/cxeMNF0hCk+czuMbwLmcZ9StJ+opXA+CSsJhhfNiFRMOHOWviP91UvVRm1XUD+AYuirQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736247282; c=relaxed/simple;
	bh=hAlPOuL4YIiXg0HpbIYhah7+pVVbm4tj/0Q43k0VF20=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JIGRR0XAiISVQg32NObrSBpI1XCEUUe/BPOAgq4xEKIniM7malpvNF66GP+1x3ruJObNDchJ/rMc4zMFzUVDqT3EpypQhFjNPie1G9HTlshO6CnzCUajf804d1sPcgFwbJeojUesNY8rfuUtfV7e4BEepyoy9u/1ml387l33Lzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YyyZYg/2; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7b6f19a6c04so1312514085a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2025 02:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736247279; x=1736852079; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x7AhuqiCmj982Ah3x3XQKiIUQdsA0iVwLzLzuPzwXZk=;
        b=YyyZYg/2LXoTHPab+Qn3ruxV+Qj39JIkpaDjyMXjtRQvxTsV8katWB4fkd/8Kgk9+P
         zBYuRYeJ/2VKW5jy9PFYSiDfvmvlzv+buDOlxrUVDVviYPktzINuMR+WQUf45VE8Q9Lc
         HbFRcIqnngzLTHfkwHtlcBUBegrxOJKPTbROI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736247279; x=1736852079;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x7AhuqiCmj982Ah3x3XQKiIUQdsA0iVwLzLzuPzwXZk=;
        b=U9dZ1b1Qo7FfT6FvOnKeUqBuHe2vrtvRzajuTBff5fXv3v+IvftzxYM1BIEzUVld8b
         n7JsapmWdPz7y2j7a8IQ+TaFj6aNgkMC0wHcesXrBgdECeTdJcXXIeZkDPSmy2csEgD7
         Jsrr2a67Vu5RFfiaBBZgBEWqeDYRJlLqetoW9T8hi9/MngW6+kTpZrYY6LpXzBlgKkyP
         1rSUOH4i8SLHrRUBCsRr7e0ejzliQosjP7mwC0g872YPVZ1TXSGxUUhnTagesZTFmAKg
         NmZIR8JoFS7GCJvFvqiGKsbAjBNEgDCGuOBOEvHdTT5aG9f0/JMxinxSYasgizH6aGVD
         L8Bg==
X-Forwarded-Encrypted: i=1; AJvYcCXYCRGK9ttdPxjho5aPtkMUwL10NwvGmBfw0Csp2nUIaaTMFUS4KRYrAwNFkgAw3D+b35fFO0PnyyTNoAwb@vger.kernel.org
X-Gm-Message-State: AOJu0YyZuId9V/BfWo6D9WO1V0JxNWdCv7Px9vHY8nQ9QyuVko7zgM5U
	Z6aOaiBY7SVIxUrmLrHx0lTyLrY6m/8AuP6ofj+JhGl0H8SJFSLSUcDiQOcZbw==
X-Gm-Gg: ASbGnctWCDFJGS3MNK+6Or95qdIaDyY9uZwlNp0WFSi85DVN1mS1ljtS3mRxDl4/hiy
	jyQmTfturUrh3Gflj4cTeQIugz7QRjSYqkZg2FGgqlj+WtJze4Heglsx+DvvF4RIPvsamCdZaHH
	LYal4j+SlXF4dF9He26KsIFBd4/TvOOADriSgp6gCbYISj73BD5Gestmo3iQPKXA67TRYLpxo/1
	1q4jH0eUQdaa3szrvnYox7cpihClskXyp2Vic/2mTiCdIwP3dI8UeGkdop8H7b7KPlGKP6fPtHo
	ZhUkIshW/WsG8OZxxg6aUX8B/mWK8W2zzaOb
X-Google-Smtp-Source: AGHT+IEr1GIvCAibNT1Cus6y+TxBjy/ciNtZckuKb7ozOEXqw78URoC43V4anznqKm3gQW/t4bn6Xw==
X-Received: by 2002:a05:620a:2948:b0:7b6:cf48:ed5 with SMTP id af79cd13be357-7b9ba7168edmr9711278585a.7.1736247278981;
        Tue, 07 Jan 2025 02:54:38 -0800 (PST)
Received: from denia.c.googlers.com (172.174.245.35.bc.googleusercontent.com. [35.245.174.172])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3eb30b97sm185094401cf.86.2025.01.07.02.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 02:54:38 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 07 Jan 2025 10:54:31 +0000
Subject: [PATCH v5 6/6] media: venus: vdec: Make the range of us_per_frame
 explicit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-fix-cocci-v5-6-b26da641f730@chromium.org>
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


