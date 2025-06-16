Return-Path: <linux-arm-msm+bounces-61471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCD6ADB561
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 17:29:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D35416691C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 15:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D1FB264614;
	Mon, 16 Jun 2025 15:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mEyXLJXk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBC423BCEE
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 15:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750087763; cv=none; b=Z8jDA7Ocfmi4TNYZwAH9UR8IrnTvd1eFjPP98qN4Twg/cvPoLnKdcMw3SnFBSkic3etPikVarYm21OodFQb5RMvhjV1Vzrl7naFxXpNlso7rVGtolwBSr2cSPKyOZK7d2/PGlZou7nszk7ceMj6giKnr+4uoq2PuOfs2UMo1K2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750087763; c=relaxed/simple;
	bh=XsDzSp/r0I19SrtO3s96jhGZF1Jyp04nnayeAGVsMbY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cosmd1wXw15xu6ksEN6XEUJisckan9KdmYub5ThtXjGogrsDLTnoT3krm6I9/wuPlopaGRKwRH6UcCQZ2crQdvT//Roi2oExodGQ7lEPwQjRF27Eh/EhMzykmY8LYb5gYbgbrb8ZO81K6O0XUAyqMeXGX4mBJvOcj/7Sl9dqEc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mEyXLJXk; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-553b51f5218so2928097e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 08:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750087759; x=1750692559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b4qCfe95ovipLi+Q1lPUaWCyEx536UAo0JNdtcLhiHA=;
        b=mEyXLJXkxJZ1zZ9x6jQ0l15CnTWviA/SgpJuxhJzIMQLEKJ+NwRRwfDeUgVv8GG61T
         QfLJDU9XCh7qQctHlMaek/Nwf6L8Qn1RSSgtLqk34weL5FdtP1BYYWo5H0OgbhM37kbz
         n1+nqFWkI4NhZeHY9x1PbhMQAs23vMbIexZsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750087759; x=1750692559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b4qCfe95ovipLi+Q1lPUaWCyEx536UAo0JNdtcLhiHA=;
        b=ZapvvFg7GVz6HAu5kIF/rZtvM8vB5Ej6dl16+0YW9STnRyVeNHZZyJPZHyxMPiUtu0
         P8I0ybMfnUnueEQmBeXHR1VqTlz3fhYcQ0mhN2EnnxEjHp5cBDu5ng4jwPEshA83wdW+
         +munAMgbTJK6jsxbtaTQUGkEOJF3mHPDYKMphadAgF/Gc+Kp7ljPkGwVleCkzMw/X5tB
         nH/GdJBPLbJhRinW1Ws417Wi/RaUwKPCJi6O38d3e15WEeGh5WCnf+JjFtnZdB1lnIiS
         hWHIhfaNjAqWkTf73S6LTVNaqO2OGxtzFvK+lNXxCJkx2/twR8+kRCuGFC7SF28qhzD7
         v3aA==
X-Forwarded-Encrypted: i=1; AJvYcCXtGgO98h5vehRiYBdMgSPA19VCWZQbVqRydqUcwPwwF2K8JJ31/sDzv1M91BC7VjIiXCUoMYy4ZCMvAO4q@vger.kernel.org
X-Gm-Message-State: AOJu0YzWiCSw3hdHPpEW2ElopNIogWg1ONNc7JSSOolMc9FpExZg9Zp7
	Ao2mBfdbtkaamWtzWrIA99Kh9LCwSrfpPnDIDe9Dylmk0SaWctQILa32oQV2Uk0pnQ==
X-Gm-Gg: ASbGncsozK6BMh2p/9IoGH/21xb83m8pIbHD3SbDHgfev4WnzDZUpDCT3v1zY/K+iM+
	Kwmq6biQ/ExfAgHaKxlT5C73CtKEE7nNHE+rJ30B6p6xq7bHKrrkmV9hTtHU5vgK6o6pBW0REqh
	CY6fKrvyMrO50QIML2PSY+x7cUd9WoiRfOMQftuXxkwcJ9jTCOt5ZLy5qCm5k3DHUJLnWVzOFtO
	RPHGY7YPV82OkwPQN1ZQ///PMHrQPlMfhLkRME5MEvph8r4Y47ztOVSxawA3CuuAbwvHeodP2R9
	tZm/4jEl93mxfb5OpHqlp8bAyFgqsoiWhTfyVA25SEmU8uzcFstc48GNnHFycmYk1KDQig201OK
	jLbwHu84wmRT+V7+9FcT/pKAOBCjiURFGFILRQoLoSA==
X-Google-Smtp-Source: AGHT+IF+CjAPPii3DRazMfwspaw/MOGh8nWAr7ANWhS1wRIoncHx/IZg8+IM5oaqRFqxKmrYKpfodQ==
X-Received: by 2002:a05:6512:31c5:b0:54f:bdfe:ece5 with SMTP id 2adb3069b0e04-553b6e8b382mr2595070e87.14.1750087759554;
        Mon, 16 Jun 2025 08:29:19 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac11ff5dsm1568020e87.31.2025.06.16.08.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 08:29:18 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Jun 2025 15:29:15 +0000
Subject: [PATCH v7 2/5] media: venus: venc: Clamp parm smaller than 1fps
 and bigger than 240
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-test-v7-2-b8c0f98494fa@chromium.org>
References: <20250616-test-v7-0-b8c0f98494fa@chromium.org>
In-Reply-To: <20250616-test-v7-0-b8c0f98494fa@chromium.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
X-Mailer: b4 0.14.2

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
index c7f8e37dba9b2218c0988dbfad1f7c04e055bbb0..b9ccee870c3d1238e04cef5e9344bd992d86d737 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -411,11 +411,10 @@ static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	us_per_frame = timeperframe->numerator * (u64)USEC_PER_SEC;
 	do_div(us_per_frame, timeperframe->denominator);
 
-	if (!us_per_frame)
-		return -EINVAL;
-
+	us_per_frame = clamp(us_per_frame, 1, USEC_PER_SEC);
 	fps = (u64)USEC_PER_SEC;
 	do_div(fps, us_per_frame);
+	fps = min(VENUS_MAX_FPS, fps);
 
 	inst->timeperframe = *timeperframe;
 	inst->fps = fps;

-- 
2.50.0.rc1.591.g9c95f17f64-goog


