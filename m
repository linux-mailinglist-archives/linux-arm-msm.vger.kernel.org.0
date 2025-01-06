Return-Path: <linux-arm-msm+bounces-43998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CE9A026D4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 14:40:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4716918855DA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 13:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62DDF1DE4D6;
	Mon,  6 Jan 2025 13:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NK/aRmgz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE9C1DE2DE
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jan 2025 13:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736170813; cv=none; b=G2mBAJRl5dOXxpWXSw2NUenYyyxx7vpL+ZxdGqaCdcu5Yp1CAeMUR/eJlCTZGgJPD1cQPi6v4Tae4npmhGoD6birdSrIdE2I+wHj132550LDg21hvvSg5qlWSL3TIwJd720/RoWfPODtCDBwiM+d/1WVQo5a9ABMIJnx7ae2hJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736170813; c=relaxed/simple;
	bh=gyc7PHkVIuT7bzGNideviSZKpST9Tf7H8/ISjHyIIjY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T24RKNHWQvbkMvL714m/L0ymoPcW9nSU6yFYGnifBst5omr2Bssh5a1iJoUbaD5OpNLQwX0RvzqxTxDOOM4vYbY9H2RfzzNCMFafwHLNrlH37ISTg6fg4FsXdhs0VgasQvPVIEOPYCWbOq0XGOgHMOmyDpRuqxwqfVlx2v1TpqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NK/aRmgz; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7b6f19a6c04so1229032685a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2025 05:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736170810; x=1736775610; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xMOQdsC3jIKqQqpuSf98ArK9l8+i2xudhvOp7OPxjDw=;
        b=NK/aRmgz9LKIXUPVFMhy4wbRTxq1E/szT1BUS+4vaPjUKQHxIGmfMG204yuEF8nR60
         2DTN020rRv1oUH9UU2NkN50uF8OzswPU35kGPe9JsG0jC/V0sNcyqkqqzikKWH22Z6ri
         GoW4F87p3YkOt6QfATh0uQ+pputPvZLNlKzXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736170810; x=1736775610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xMOQdsC3jIKqQqpuSf98ArK9l8+i2xudhvOp7OPxjDw=;
        b=wcv1yj8SD3Tt5nfXLdKYq4gOeVkA/Lso7xcmYyaqRY43zeF2Bfi0z6TTIaJntmYiSV
         cQAvdjyMlF6TKIDR5mHTjxnKS3eKrAigELDW6EvGkNIm0SbgHpmH4XqKTkq25ZqZaji9
         5YdDBi19DX2WjcYNXnCxw87yqNh52tbEj/6uS9WmWT4OwlTHJSVl5Da6Dk2nHAg2NQEg
         KW2htNvA7EH+cS1d0pdTn3KU+KGzcVdqnQd7mmWZEXHIAggvEaiPFQwFzgQ6MT2+OpQj
         9VTLofI3aDwzL/E0frd2jwg9TDJALKaD7iAxMBWVZil4a/WaJb5KQ9g2imqdQi8PvJh+
         8Ejw==
X-Forwarded-Encrypted: i=1; AJvYcCUna0r66s/Wn/WaZX12Iplg+IfMWunh7pXmcEiLtniBbgGh444mnbg6qLRhvvvT8wsr6Z491rycC7exq0tM@vger.kernel.org
X-Gm-Message-State: AOJu0YxD9ciUCLlE/B8kNFOR4KAUp29PViet29CBnytCwgElJwdGzyHu
	9pI5GxyWk5o/WDgvv81XbIF0brp46SykgkPdJNGNSAglpEEXryA2MgpNXoO+5Q==
X-Gm-Gg: ASbGncvBpkpfEoST0lDTfra9TS0nQ2n6K+qSatCMXddepi8JBTB+rOy3x2WVWtb45J8
	B5RKVHcrKKKceqT7rLq34v/ecy1cx0ObPiHPnGPtvNqUJs9jphFQSmOmI4OyajTMOVkdu0Tihpn
	51ygwViwYW+LisrQHfR9lJetG6NwbhfU/WgMqoJWxG1O+m9jF9dhfGV7bKj+0o6ee2UrxywP/ED
	UKvrXoGJmGXCATZXB2TB9RKxQ3XVYJAv97PzS5A+H+nKozIx6kUt2axJuN7fGt/8UDBc1HggIix
	Abbrpa8LAZYrj5Es4+KGYsv8cYxPJRUah+K1
X-Google-Smtp-Source: AGHT+IG0tS/HxvwhAy9Tnpx7Oq6KCN6+Gj7OoItlkC6sM95sCyRq2jDgb+/eacthbZcfoPddSstN/Q==
X-Received: by 2002:a05:620a:2904:b0:7b6:d959:59e with SMTP id af79cd13be357-7b9ba715e92mr8941485485a.3.1736170810497;
        Mon, 06 Jan 2025 05:40:10 -0800 (PST)
Received: from denia.c.googlers.com (172.174.245.35.bc.googleusercontent.com. [35.245.174.172])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac478d35sm1501861085a.90.2025.01.06.05.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 05:40:10 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 06 Jan 2025 13:40:08 +0000
Subject: [PATCH v4 2/6] media: venus: vdec: Ignore parm smaller than 1fps
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-fix-cocci-v4-2-3c8eb97995ba@chromium.org>
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

The driver uses "whole" fps in all its calculations (e.g. in
load_per_instance()) Return -EINVAL if the user provides a parm that
will result in 0 whole fps.

Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
Closes: https://lore.kernel.org/linux-media/f11653a7-bc49-48cd-9cdb-1659147453e4@xs4all.nl/T/#m91cd962ac942834654f94c92206e2f85ff7d97f0
Fixes: 7472c1c69138 ("[media] media: venus: vdec: add video decoder files")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/vdec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 98c22b9f9372..25edd77b9cf9 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -481,7 +481,7 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	us_per_frame = timeperframe->numerator * (u64)USEC_PER_SEC;
 	do_div(us_per_frame, timeperframe->denominator);
 
-	if (!us_per_frame)
+	if (!us_per_frame || us_per_frame > USEC_PER_SEC)
 		return -EINVAL;
 
 	fps = (u64)USEC_PER_SEC;

-- 
2.47.1.613.gc27f4b7a9f-goog


