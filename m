Return-Path: <linux-arm-msm+bounces-44118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D235A03D0F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 11:55:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60D7A165213
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 10:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50B8D1EF0A3;
	Tue,  7 Jan 2025 10:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NT2xyJq1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FEC1EE00C
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jan 2025 10:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736247282; cv=none; b=Ruj6KfRcdsHeTn2e8Berne1Aky6cOY8iexjgIa1wZclrqWHJqU7lcW9MvwN2Zf+jScQCpft6sc9kpb3bOqI0E7jpHVnupTNYj/RMIZGmZqqnvkaOVtLDsDIgE4MNht/2NEWLA/4NRHKxbpP6bOmkuVmvt+vY7/Wc433t3xqfHuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736247282; c=relaxed/simple;
	bh=jFMkE+aUW4A2Tjf06APpBG1sAvp2ejflRJ8B5s0jBLU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sUOnzDJZeWODL6IRyqBNAQJ+CvzNzNFW6nKJrscdSiKID3U3B2Y7ZSHeKk82Vyifv5u4VuciIDMhPYPE3XxksH/o+mO8JxcBvYu7Ku9OvaHgSqxNNdt7XCNrJC/hwulYsz7IAS3xTAb1Lhf2IO0noS8ekxUmrB44i0/53XvMdl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NT2xyJq1; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7b6eb531e13so791741385a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2025 02:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736247277; x=1736852077; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f3BoX2c5ZbHlzZ/xObQ8c1PFxHvs7MLN/22FFGinwVE=;
        b=NT2xyJq1NDPYIKRf+414boTnR47X/0q5JYL/BQjJGxhq8TTORpSUxs4SLC15fp9FJ2
         yLWdENcKBDgb3V2qUZ2EKxOXApbAohhNRzb42UFuCLLTr/m26lspjIdC2HflZ0kNiGqu
         LmkG60b3Bsh7wEEaUPeFSiVlpUfuEW2iK+8r8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736247277; x=1736852077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f3BoX2c5ZbHlzZ/xObQ8c1PFxHvs7MLN/22FFGinwVE=;
        b=ksucmvSBwCiCiOESvwujAZTEz+N9kOSsZnoJ48SkVu9H7A7Z4KJUuwbsXKlI0CB0q9
         wWD9036XdNCs7+JTzaqFbF+WvesAbla8BJVMKaYKot3hpgPBRt0dnDDv7buNGDZuiQvk
         B4IdzNdr+44/tbxRbw1RzxVZ8wKCqnVF0FzSmrDDIKkvCre0GV75CGd3/j9LoYVGslgp
         gf38wNWQ1jmF+ri4o5RYudizTkujrxHj96yCQPDWoDgAl2bbSNxaD9xMCWmmoQc8D7SZ
         4A+61sQCypBeEdXs+TGWCiOM4vLZJNjUayIHq6/UfigYPGG3Iz7SqRbuBkou5TskhtmD
         kw4A==
X-Forwarded-Encrypted: i=1; AJvYcCVqT3zSsJaZWbVuFB6XuFGJftTUvMoDLhWv2JU2HnZmstfwlDfEAGWFTWaIhvglhtjmEa8s9GmUkaXLRqn3@vger.kernel.org
X-Gm-Message-State: AOJu0YzlFwbYgZVYIjA0oTtjA8ALkdfaRIqDoBWdeytS9T8qnjiZiwYe
	aHrRrNTvF6bouEMqsMWu3GH6PVh0xn848RjxMR6zw0iZYmGNzES1HWgsVV3+iA==
X-Gm-Gg: ASbGncsm6jtxYrAJOPz60b9J/VMUtDiXpXeZGd/nTPwRUk77z+umTixzJewT614WQNU
	o0Oxr//en8SKuDzcNrF9gj21KUYwmw06mde20ur+0UTBAnEZzD7GTeQRdyJmUNcwagVQTNUy7hc
	p7nWJvR3lA9nq3sSdE7SWZyhLiC3ltjarbVF/VvLOq8BwavKgucm+IqgD/NuerKO3W3LN8Cg5CV
	t83D43NWzwywwm2usr2eW+W9iUmLodpOblDfLEazMl3PVlYcvlH5j+NHKQ6UIs358uAUAyeNkU3
	9/mrPyr5oWcfBCoXSxdz+c6sDjAuWS1/lPQm
X-Google-Smtp-Source: AGHT+IGAVyKTISN9zpaJnwozwU+COiRxpnABqxxsvJgsi3kg81agGnrCLMtsX46fVIPT7llJuWHApA==
X-Received: by 2002:a05:620a:2a12:b0:7b6:cb07:24bc with SMTP id af79cd13be357-7b9ba7f6642mr9826632085a.48.1736247277498;
        Tue, 07 Jan 2025 02:54:37 -0800 (PST)
Received: from denia.c.googlers.com (172.174.245.35.bc.googleusercontent.com. [35.245.174.172])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3eb30b97sm185094401cf.86.2025.01.07.02.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 02:54:36 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 07 Jan 2025 10:54:30 +0000
Subject: [PATCH v5 5/6] media: venus: venc: Make the range of us_per_frame
 explicit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-fix-cocci-v5-5-b26da641f730@chromium.org>
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


