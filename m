Return-Path: <linux-arm-msm+bounces-44786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 742E3A0A286
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 10:56:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8246F165C1D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 09:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 567451922E0;
	Sat, 11 Jan 2025 09:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mCcEB6AR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D4019309E
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jan 2025 09:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736589335; cv=none; b=Ev+XlbVS7Glb7Dk91n7pLr2qtgpxYcbGA2hZZetOK3JiVxhMIeSB9BUx5LKYwHtQGLWZL04cdueCDZOTbgzGvSwdiNIDfc+VSJhEYxciOKGWW+9F5KVbnPg46Z/23miAKWC5/GzYMyajAOCbBA/eIIGrcTofZQ06IOxA3nXsuPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736589335; c=relaxed/simple;
	bh=jFMkE+aUW4A2Tjf06APpBG1sAvp2ejflRJ8B5s0jBLU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EvMylIobWCAbmJALgwYgx9hO65y7bFCdE8WSqM76rx6hs/wzGKEreoa2nLhjc9BkYVrMF7Yfgwxhc7RhCRCz6fzotun4c61ENoRsEb1JGwDaqWUsBCdzKjMb9ga28HAOUD4dqQwiJUSqHRE2ASgAkDAspbnURG99s5uW3Yp85zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mCcEB6AR; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7b6f8524f23so300720885a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jan 2025 01:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736589332; x=1737194132; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f3BoX2c5ZbHlzZ/xObQ8c1PFxHvs7MLN/22FFGinwVE=;
        b=mCcEB6ARKeodZcnA1Gx8oNr0n9S6uBgT4tEHYUrfrd7tMsEO7wYPvOQ0fK/n63Csj+
         RFrq4t1x2v/PutZLK5hQlHThygxjHiv4blcS/bs0Rr2U0DB1D/kMEVRFW2msX4wL84rH
         ClMYhX4zc2NlCWB+x+wv4fq4N23H693Egy3O4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736589332; x=1737194132;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f3BoX2c5ZbHlzZ/xObQ8c1PFxHvs7MLN/22FFGinwVE=;
        b=LmTTiZSUNNwV2DYLt8dSIpmf5ZCu9fbkc76renLrEYdkDfj7bz8aN7VMtDBUEQy+h6
         6nGkz7PeCNiKsVNGBdmgVG8XCPOLYpC06fef2nQAxhN92r3sRVjOEr0mmtJbD2ZilfD1
         4IZWjJf5k3iGbfs2k+DoZYehqC33BDdRpHssNatH+QaNz3FWDbxAwFK2qXCp/N/uYJr+
         1F5NBsibHT5c5pgQXnn0Q/4uJn3wzXNlEUq3twIUa61z87jAV++ScSZn9hJelSR0gw3T
         Nu5haLOHHiB0tKmv+ECN+px+fMyPF3frCOf2IiXxUoH6lQitXk2yrgw9EXIVddi0opcq
         vB3A==
X-Forwarded-Encrypted: i=1; AJvYcCU+1PnUF1XtYQu0Tulv2OElsnZbf8DCZk7pYbSKBW3RdA78nubB4T1NbwQfijgP77m5mc5CcDHj33E/Kz6X@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtdj20cEbTVlG3mJK3hCdAnkCLgefj7znOshyAc+qHkw4vR3+C
	8EvsEnAPxrkZoucY5uuoh3B2Pa31uuUIIAamUohr5Ma2JJbC9dwPwDk7B/g2qQ==
X-Gm-Gg: ASbGnct0q20D/3kjeQ7nRGd7RELwrliUJNu3zJ1RNcKUCG6R7+rVmAwdSqJlXwzdDXI
	47aNJ54qOqdJPHC9QaN1bDM37WmFT2qalwgXSxUzBYUZ0O0CyyczZW2IkXG6c9lMLazO61ysxu6
	Kml0wA7pkvRfP1gl6pIPc4Vsp4XURCA1j5exfavk3/2zpCO1HR89pRv3b50njqCDDpiCDzQOaNq
	kZ9USNjNTZZUNLO7EzIrmGt2j8CIUpnyp81xKgzGUBJAPtiOIyGIwjXdudw7vLcVbFgqqVLcerz
	whobmDbNOQh6h2DG9WV+U0GttA8yv4/NjyJJ
X-Google-Smtp-Source: AGHT+IHlflZapXB2U5EwdDsff9V9lka7ZWi7FvO7mOnx6N5gTF17d6mrdBuskWw0aArQ5dE890/KbQ==
X-Received: by 2002:a05:620a:2481:b0:7b6:ece3:825d with SMTP id af79cd13be357-7bcd9726520mr1906864685a.12.1736589332721;
        Sat, 11 Jan 2025 01:55:32 -0800 (PST)
Received: from denia.c.googlers.com (172.174.245.35.bc.googleusercontent.com. [35.245.174.172])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7bce327b8besm267096785a.59.2025.01.11.01.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 01:55:31 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sat, 11 Jan 2025 09:55:18 +0000
Subject: [PATCH v6 5/6] media: venus: venc: Make the range of us_per_frame
 explicit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250111-fix-cocci-v6-5-1aa7842006cc@chromium.org>
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

Found with cocci:
drivers/media/platform/qcom/venus/venc.c:418:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/venc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 17bec44c9825..2c1836712362 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -412,8 +412,7 @@ static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	do_div(us_per_frame, timeperframe->denominator);
 
 	us_per_frame = max(USEC_PER_SEC, us_per_frame);
-	fps = (u64)USEC_PER_SEC;
-	do_div(fps, us_per_frame);
+	fps = USEC_PER_SEC / (u32)us_per_frame;
 	fps = min(VENUS_MAX_FPS, fps);
 
 	inst->fps = fps;

-- 
2.47.1.613.gc27f4b7a9f-goog


