Return-Path: <linux-arm-msm+bounces-44115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B55A03D06
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 11:55:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B7CB3A2336
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 10:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38A531EC017;
	Tue,  7 Jan 2025 10:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mWPAcYSj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F8F1E32D3
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jan 2025 10:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736247278; cv=none; b=bNhB+jkUct6yWDZ7JlruWorpjhAHaTn+LnRfA3Ph8VP5ks9Ib8HRuLICEBvxvmDv0lBjVa+HTgphTdIzbqr1KyjIIYzj5ZbAdzObKq9+9xY8h5pEYWN1Dn8Ee4DEvnJpzVOsnkdtokKEhTV3z9L2ZykJtsJQxw+Mes0Lgqkf7RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736247278; c=relaxed/simple;
	bh=wNqPLVCH3hrYmgRdcOul7vFmT8NC6JPiLWWSYrAMGoA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RdmTZUjpxll8RHNhso1M5JZ4vfhg9bu5PBS9uUJ9Ou30wExknLNnJkSYYOZ0L3j2kRKyg0/K+b1DzJjVjQs9lqeJ0ZRS6y2QFSexQTSDViFnjq65vrcAQ60MpFYBivGpVPqNuaIxbZXp5pZa92HgR3SS4MjeQhxY0UbvjDXaHZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mWPAcYSj; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-46772a0f85bso128425091cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2025 02:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736247273; x=1736852073; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oCQd+Ixr8eKIqoAvIvPqynaVVvGYXfmfSE/3mmNL7HE=;
        b=mWPAcYSjr9grfY3JXlYpA2Sy3GBF4dZ7nxYh0BxR0v/EwB+LHCcBCT/ExMOdapdhgx
         qXgrZOSJb57RU1His2CdnDRybknfFEkK2dG96jPfVYPvK83BSqwHSK/araJ6vqgSpUKX
         YSstVU4HyZlZpqQi4+5zo5K7Zw2m+QYrttPFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736247273; x=1736852073;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oCQd+Ixr8eKIqoAvIvPqynaVVvGYXfmfSE/3mmNL7HE=;
        b=W4swgnImucUqglihxUwSq7Xbs6fkkinG27RzA/NHDP2hR+YCKOk7lgyot4j287Ctaj
         YZf6/1npDWzJ3rmbj/grbOUxXVdLpj2kVA9ILH/6rliZwToLh1Jzy77MoIwKnJXkXwO5
         mqmXhIc/sH3mp5/9+EmPQwpf0K8eTTW7x28HBCeoFAY8j2TIS4t6fqLzcu6RVlSw5L61
         +DU028uRC7JXTjvyGmrF0ZfpYcpChNyNhceKz1sT+WJYGOPSEJ+rz9ttRsw9zruKwQi3
         efjF6c2ysxmZ2rEBJ1mBjfoqWAUxLg6HHE8UKj9kmC6JsBtlh338QT0ZkPaaMzWNFopM
         aU6A==
X-Forwarded-Encrypted: i=1; AJvYcCVD9CW9wxLbjXxKpX8k2LMT86F+ZvjxwN1NZ6hTUfPTaadze3y14IQYtmRM23Z8ZN6BCnPtji6PgBtYrq4P@vger.kernel.org
X-Gm-Message-State: AOJu0YzuD1aJyV6nmnbND5A2uV3LNwF7hdshj7l3VnP7BANehatZR2EE
	ARwEuK8rPig4V0CTOvf27Xgxoq+P4KUZNzqe2XMoY2DeD/3nH2Tz/ihj/xyWeg==
X-Gm-Gg: ASbGncuNlZs2ak0yhxtV5YqIOEbbBu6rRhndUv/p93xr/wq4ZcAStRFiwecd6FAqcKm
	WPKR91lQUYNFbBHzDrvM+2WRo9XX0BWLZeW8dzno5kR7YIN+CNALOOT8Js+PrVDSdTL/OEqfQNJ
	mJhUu21eXoTeYdRc8CjblVPyM27scsuCTaw5GcuoEgR4cwDo7YgPdDXjV0Qc37Mt8eYmXYqzI3X
	qzGkxUqmEzjijMreTqLrdtBVOX2xPXqTM+Lv2lEOmKLKQTX8jLTPR1ebaecrCi0fWJf7yoVJEHF
	VdpSeOPvmL01hWN+CchjtfYziybBjY05C0BJ
X-Google-Smtp-Source: AGHT+IGKeyvvoUZ2svFx+YPGpG6WrV538GXxzvSPHqikjfxzI0msn6hiyTBtp0Rw8fsFZQS4ecDYVw==
X-Received: by 2002:a05:622a:8f:b0:467:5e1c:1ab6 with SMTP id d75a77b69052e-46a4a8ebaedmr1117456131cf.24.1736247272995;
        Tue, 07 Jan 2025 02:54:32 -0800 (PST)
Received: from denia.c.googlers.com (172.174.245.35.bc.googleusercontent.com. [35.245.174.172])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3eb30b97sm185094401cf.86.2025.01.07.02.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 02:54:31 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 07 Jan 2025 10:54:27 +0000
Subject: [PATCH v5 2/6] media: venus: vdec: Clamp parm smaller than 1fps
 and bigger than 240.
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-fix-cocci-v5-2-b26da641f730@chromium.org>
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


