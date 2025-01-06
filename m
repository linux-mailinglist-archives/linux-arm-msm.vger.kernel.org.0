Return-Path: <linux-arm-msm+bounces-44002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD64A026E3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 14:41:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05FED1885DA6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 13:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AF321DF257;
	Mon,  6 Jan 2025 13:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UJXIyOZD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4088D1DE8B2
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jan 2025 13:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736170818; cv=none; b=NSLbmjIvFyytkHyRymM0sSM08Ka6AhZCwyUtm/LKqCT3Y5X3SGyqMWc7aC1ewJUpP80rYVZ6HEPqfw+b95c/Ejw+gtUhgv5PsjLr1bb1AMjmT3IlgNwwGqOzzZ9Haj6Ald72J7KlhQenAWwTcPsnfs7PZDsTXRV67/evDsfpAcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736170818; c=relaxed/simple;
	bh=MKfqw2WVGARyLQAOD8Mt7Dqo3jHse4EHvr4z1KQ2TkE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cHgmQA2G04Shhiv3Mi9nXLt+ZKenAFGbIIcwWXxDuw8k3tmUqAZODmdoxPW/hg5FJsf+m7RHWrf7LINEnPjqncfQFIJgCatHH5XZljJz3TMB+9AhjdUYkES4B17q92FzQfGARw696CQ54XChJcViDf4OPP4c61KqJonZsL7dg1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UJXIyOZD; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7b6e4d38185so1159979285a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2025 05:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736170813; x=1736775613; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fr8YCqaCWwp/Be9W9ht5j9c8BF4MD3nNLHYL3KKI1+A=;
        b=UJXIyOZDLCqwwJcc9P3iK34i7mE2hQ8APvMppE4KuCMjHuxhaRwK6GuRp4+bDGKjJZ
         ZOhop9yxWZC5GTrcgVozLT41m3saXmDGHZhk7ndGgvVd6dVWLHZyl5Jlw/liCnUD7raZ
         i4B9g/Gp7Hwlu7ybTTcNiFmJaSNEL2D+BtBiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736170813; x=1736775613;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fr8YCqaCWwp/Be9W9ht5j9c8BF4MD3nNLHYL3KKI1+A=;
        b=K/1Cx/RLeEvkR5T27zOe/chcEiPabj/o54PaexhWJ6JdXjEDX6qo3dP1IhwFgXe2yW
         C0C9r6n9xQwPwmH2JxpOkEBWx7D9NNpQb1TUxCzaH2wsksw64y3ydTF7YR/1eIBxwLnn
         NucIonHFISsisI5NVMotPoSRP7TtKf1Oz8hS2EHQeact3Al+CisOlnH14f4j42Fr2V1f
         nJrVFis1Jg+H+vlSBxt7BXBpQPhim/MxekABW3p64vcXZi7K9yCM1GHVLkG/krqKDLlQ
         P2yR1USuStL1fFKCU/nOAlYVSpF7StanbgXqcgGrsP209RS0zdgO8OM1puAiNHOdMz4I
         CXDg==
X-Forwarded-Encrypted: i=1; AJvYcCXJ32pbt+Q3ioSAzeHkO+XXNri+/n/81Tp0BNRr6FnbKZ9LMxHGiPAFE5X8PaxGiSdOD+kHy3Ri+sn3lGJR@vger.kernel.org
X-Gm-Message-State: AOJu0YzfrD7UNAisPiF4TZgTOu0reDUbSexoB6qHQR7pa4d0Pgw/scTf
	8C6vNfx6Ti/lEZH/XYamT0zTW0e3wNrXOvlQfrEvaYsgBCBTeRur42T0O90YBg==
X-Gm-Gg: ASbGncvu3FZcAI3ifxJ0wG4NIoolkwvcyygJ3iobyaxI+6np+i3OV0FJqBBovRlvJHV
	nKOoUgWxT5du4YeVAvEehAP2DftFf8gx3lP6k9S7CcF8tK+quj0SHLLE3WZH4EoKTWg7L/z36d2
	3FwDMPZ10xRAQUG+58yo7lRZb6YvACdP4SkciWopWiOTE73ahcCXmcjLI4hx6ctrMaNYcDvYx2M
	pGKYPw7rxP2Zic8MKZedYpRX2RWsJNJicC1Gvy98aJFE99D6qUUZbLDAlPCi4Kd/luThNExj73s
	BALE/f9u2pmx2nZwBpscIoAA4qnFJGHLO1jG
X-Google-Smtp-Source: AGHT+IHcjB/Pb8QD204DXadECgJD3hF6JOTt0Wc101hAlBe7SX6FDrf39ifHgQZXoKerdzwzAWLNnA==
X-Received: by 2002:a05:620a:2805:b0:7b6:ed18:fe2 with SMTP id af79cd13be357-7b9ba79c187mr11546099885a.30.1736170813425;
        Mon, 06 Jan 2025 05:40:13 -0800 (PST)
Received: from denia.c.googlers.com (172.174.245.35.bc.googleusercontent.com. [35.245.174.172])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac478d35sm1501861085a.90.2025.01.06.05.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 05:40:13 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 06 Jan 2025 13:40:11 +0000
Subject: [PATCH v4 5/6] media: venus: venc: Make the range of us_per_frame
 explicit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-fix-cocci-v4-5-3c8eb97995ba@chromium.org>
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

Fps bigger than 0.000232829 fps, this fits in a 32 bit us_per_frame.
There is no need to do a 64 bit division here.

Also, the driver only works with whole fps.

Found with cocci:
drivers/media/platform/qcom/venus/venc.c:418:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/venc.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 8355bd59a5c2..5683a04bdc14 100644
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
@@ -414,14 +414,10 @@ static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	if (!us_per_frame || us_per_frame > USEC_PER_SEC)
 		return -EINVAL;
 
-	fps = (u64)USEC_PER_SEC;
-	do_div(fps, us_per_frame);
-
-	inst->fps = fps;
+	inst->fps = USEC_PER_SEC / (u32)us_per_frame;
 	timeperframe->numerator = 1;
 	timeperframe->denominator = inst->fps;
 
-
 	return 0;
 }
 

-- 
2.47.1.613.gc27f4b7a9f-goog


