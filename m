Return-Path: <linux-arm-msm+bounces-17490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBF38A5B1C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Apr 2024 21:43:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 301D3B2327D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Apr 2024 19:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 285D21635BB;
	Mon, 15 Apr 2024 19:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SO82mOYD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4888B156671
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 19:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209700; cv=none; b=CcS+6MXhcOFY6uZFWAMdqfIp+fraeGpczt+177PTVSii9/8K/0FMQmnu1ZDiZZaHNbxJD7h3uBDfn5tC67FXl0gIhpHEVwe+I841Qg5RFGtrTLEt2hrNE+dTKdIuRW7ezqYwNu0yNzzY7UUJDmbvAAEjkN6XUWowqWJFoO+mxLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209700; c=relaxed/simple;
	bh=xLgrZZRlgHue6M9OsvJFWob4LMm7t7pNYu1OWpjQXlI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LyoFspNGmDuuzjyxnDAFnXIe8ASyO94rhmSk+SE0d3ZSdH9WuEhrXdhSDPmMAjsInXjZET0mo5s7sMW2KTSVl1vQg67FtYd8n7rEk3Xkm/6ByACpClY6g12rKJZPYpJWRc2E8gi2V9rHSQye7H1mr4MswlFaMx6E/QjZK129ImU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SO82mOYD; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-78d61a6229bso247229185a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 12:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209696; x=1713814496; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LUBi0S9+ghcjER4xO9v0racZxhYV4zff+IOh7tdBF3Y=;
        b=SO82mOYDZw/UKakxnQuTFkklz4l2bqLfzMNsNZxhPfrWnvs78i5QXu0tuG8APBtV4L
         Ut7FdGWF/e+NeELAA82rM56O7kIvrlMCvZdjzXhH5aCbsN9+Z8Asggpf+NweU/OMjy9d
         CpJZkTdLXvRC410dH3UAV0vRUyn44OVUMQbGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209696; x=1713814496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LUBi0S9+ghcjER4xO9v0racZxhYV4zff+IOh7tdBF3Y=;
        b=AZ96utDNHD0M4CF1V5k3cQZtMFIoSTRsUOVGUztOFABclkI2rx1wrzOBK27zEoKs+m
         5IEGUkuRjMiRmhAsAwD0q41VV2Gx03Eev2TsTcgYZ/0Gt+JEvhWsifsWEhkzZFYUm8sH
         GNizjXVgIjSSW7OP8+wDXdHe0NqBZxVBF7Bg7fQR8whVtKfpJVB+wMYK03c0ZsOT7EP6
         GlZBQGIew5QpJO1kuFWtQuBJJ3adoHiF5a0Vi5rryG3v6l1rxhwFUZbYcmpm8swf5Ywx
         wxQqrh7gq2LsF4j62Mfub5aXZg8bsDJu7BEbzqNv1ci1a0ujm8LP9jZ2UAmoy4kY+x8G
         Y4EA==
X-Forwarded-Encrypted: i=1; AJvYcCV9eNPIisKANqonv6mqStAH+KX0nCX9Rer0MS+vJ/XIcjNElISC3S58g7ttjA7GrD6KKuakPtbF4cIMnoibkgLipZ8w2i/nn8OTejDXRg==
X-Gm-Message-State: AOJu0YzjJCg1IPfXwW13AFRJYzzsVkp0vEXPREPnjgcOYkekfzMykQfM
	OybIzHVrZwq79aPzTCpfNl0NJL8uwDQjVVMw7rBNMoMoAvj2KUyaBxt/LA0uXQ==
X-Google-Smtp-Source: AGHT+IENHla9VOs9zol9LIJSv1150+DgeHz4OsMQu2kACgbSSAPw34HTPzLa823VVZ1Js6TnsSST2Q==
X-Received: by 2002:ae9:ec08:0:b0:78e:df14:19dc with SMTP id h8-20020ae9ec08000000b0078edf1419dcmr4888734qkg.20.1713209696184;
        Mon, 15 Apr 2024 12:34:56 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:55 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:42 +0000
Subject: [PATCH 25/35] media: venus: Use the correct div_ function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-25-477afb23728b@chromium.org>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
In-Reply-To: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>, 
 Abylay Ospan <aospan@netup.ru>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Pavel Machek <pavel@ucw.cz>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

us_per_frame does not fit in u32

Found with cocci:
drivers/media/platform/qcom/venus/venc.c:418:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/venc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 3ec2fb8d9fab..de06e1712d09 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -393,7 +393,7 @@ static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	struct venus_inst *inst = to_inst(file);
 	struct v4l2_outputparm *out = &a->parm.output;
 	struct v4l2_fract *timeperframe = &out->timeperframe;
-	u64 us_per_frame, fps;
+	u64 us_per_frame;
 
 	if (a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT &&
 	    a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
@@ -414,11 +414,8 @@ static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	if (!us_per_frame)
 		return -EINVAL;
 
-	fps = (u64)USEC_PER_SEC;
-	do_div(fps, us_per_frame);
-
+	inst->fps = div64_u64(USEC_PER_SEC, us_per_frame);
 	inst->timeperframe = *timeperframe;
-	inst->fps = fps;
 
 	return 0;
 }

-- 
2.44.0.683.g7961c838ac-goog


