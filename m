Return-Path: <linux-arm-msm+bounces-27260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CA293F5B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 14:43:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 337CF1F22DFD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 12:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB83014EC47;
	Mon, 29 Jul 2024 12:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="njEOiG50"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2661494AC
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 12:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722256940; cv=none; b=C9d6NVsw8QI48LUNB3Sbk0UB0MPiWZhs71Rt2v0ofYbEYGUfJLW6ECak9UIfXE0Bzl4Z1GksKzjstxUkpI3miJ3C90PG/5ITYjnl0uL1oAainkjAltuHlI+fJRRkFxSKYt+x9m/EOvIOeYk3EwTY36gb7ckljx7b6oNDbXeKyAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722256940; c=relaxed/simple;
	bh=Mt1qpwEwH+wt+ZY8OYQdkzU+fJoI85r05BtyNBAs70Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZOEgquqfpAL9jRpO5a1qDeiYeKua1ycz9R4RwYfl7YFl7yTbN3bLpQuzvAYTL7kaT9KlrnLyqzfxIOphyzfeyv5O4J46aph4XpnOs8P5M21jAp7o/agzsZXNRjZwVpAYU+u2xTQT3n/s16Av1mV9AWHh793dpIufYj7oN1W6TgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=njEOiG50; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-367ab76d5e1so858703f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 05:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722256936; x=1722861736; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I88Q8sziaG0l3nKnE0hWxJ2x8+a+rgX5/qNIMnrCJJs=;
        b=njEOiG508KcsguO6/L97ZAtCrmc0TYKysY5j+Ed7Ny2gj/xrGUIcn2cCtApaN1CK/x
         wzw/331+iGGlrmN0tSgus65OsF66dUQDptQAOGqWLp0bfEn7zy1aTT+RkLYwzY0puf7q
         k4thCNtsc9yi21+QB+pvsj70/CNCjqHQ0jIrPi1OpoVH/jp7bsXtOC4Fl2olqvDvm3RH
         qGLtFYf4KVvc4jOw2CP+eMjY88CGT1dhU30qBQHGEeePgDxe8GanGdV9t5ZbIAqYJFef
         4rF7tiHlUgkLKMw7kAzTgh9TN7ywGBXHpF2Q7oK9g3miZTjsqLGO+t3J3/HvspohrzPL
         N+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722256936; x=1722861736;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I88Q8sziaG0l3nKnE0hWxJ2x8+a+rgX5/qNIMnrCJJs=;
        b=omOj8S/LOFRbblaYzW+w0ovFvGAHwNsPR55Z2QMfu511pdSmfFIrVZuQ6w2SIqwZlB
         WiHnb/5WlfYu5uYziVfBYUKTKIc3s/o3kNzvby0Up+4+TNcaQmLmzAOrYXSZzbv+10oH
         Q2iM3qeR7bjyU6y6x44TfxK7QOBhqW2hqhHr6JAhfVDB7UddB1304Tc8E4AImWbsX5tW
         fC3DO4xpiYrKZjI+pTkdTDmyw3hTwRSt6db0Y4ZSx6WK8dVjWY/pz9Fiq3M5h2MdRKJz
         54B1T30PLwFOpip06Z0GeJyEQg4HJYO2+jRdQcWt+Q/ZxA66aAU5i4CNjKF8mQv2oGP+
         txuA==
X-Forwarded-Encrypted: i=1; AJvYcCWv3nJ1ygBc6IIwiDsAHbcyNVxjOuTXBj0nVOFJIneLUJCGPnPKiYbBRNS4a+/zDzagyHdR4mMV2PF+tvV3PR344IjtLEO8MnudkloHQQ==
X-Gm-Message-State: AOJu0Yytd+axYdzy/Hq+2mKykpYHdEz7H3cOAI2jTmIflkrFMddG1gSg
	GixklmzJau7vA7OVXxQNlvQexWrMaJFTEG3ZbyJEoWX6k6nFe54QC8tDG1guq0o=
X-Google-Smtp-Source: AGHT+IHjgYkhEwH+b0aL+nKAjpYbsxmNb3nztzLzMIsrrw/HeyXfmalNOQ9Dbux1MPAVfv89NOGi1A==
X-Received: by 2002:adf:f38f:0:b0:368:4e38:790c with SMTP id ffacd0b85a97d-36b5ceee06emr5091150f8f.14.1722256935742;
        Mon, 29 Jul 2024 05:42:15 -0700 (PDT)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367c092esm12106275f8f.13.2024.07.29.05.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 05:42:15 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 29 Jul 2024 13:42:02 +0100
Subject: [PATCH v3 1/2] media: qcom: camss: Remove use_count guard in
 stop_streaming
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240729-linux-next-24-07-13-camss-fixes-v3-1-38235dc782c7@linaro.org>
References: <20240729-linux-next-24-07-13-camss-fixes-v3-0-38235dc782c7@linaro.org>
In-Reply-To: <20240729-linux-next-24-07-13-camss-fixes-v3-0-38235dc782c7@linaro.org>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hansverk@cisco.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Johan Hovold <johan+linaro@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-13183

The use_count check was introduced so that multiple concurrent Raw Data
Interfaces RDIs could be driven by different virtual channels VCs on the
CSIPHY input driving the video pipeline.

This is an invalid use of use_count though as use_count pertains to the
number of times a video entity has been opened by user-space not the number
of active streams.

If use_count and stream-on count don't agree then stop_streaming() will
break as is currently the case and has become apparent when using CAMSS
with libcamera's released softisp 0.3.

The use of use_count like this is a bit hacky and right now breaks regular
usage of CAMSS for a single stream case. Stopping qcam results in the splat
below, and then it cannot be started again and any attempts to do so fails
with -EBUSY.

[ 1265.509831] WARNING: CPU: 5 PID: 919 at drivers/media/common/videobuf2/videobuf2-core.c:2183 __vb2_queue_cancel+0x230/0x2c8 [videobuf2_common]
...
[ 1265.510630] Call trace:
[ 1265.510636]  __vb2_queue_cancel+0x230/0x2c8 [videobuf2_common]
[ 1265.510648]  vb2_core_streamoff+0x24/0xcc [videobuf2_common]
[ 1265.510660]  vb2_ioctl_streamoff+0x5c/0xa8 [videobuf2_v4l2]
[ 1265.510673]  v4l_streamoff+0x24/0x30 [videodev]
[ 1265.510707]  __video_do_ioctl+0x190/0x3f4 [videodev]
[ 1265.510732]  video_usercopy+0x304/0x8c4 [videodev]
[ 1265.510757]  video_ioctl2+0x18/0x34 [videodev]
[ 1265.510782]  v4l2_ioctl+0x40/0x60 [videodev]
...
[ 1265.510944] videobuf2_common: driver bug: stop_streaming operation is leaving buffer 0 in active state
[ 1265.511175] videobuf2_common: driver bug: stop_streaming operation is leaving buffer 1 in active state
[ 1265.511398] videobuf2_common: driver bug: stop_streaming operation is leaving buffer 2 in active st

One CAMSS specific way to handle multiple VCs on the same RDI might be:

- Reference count each pipeline enable for CSIPHY, CSID, VFE and RDIx.
- The video buffers are already associated with msm_vfeN_rdiX so
  release video buffers when told to do so by stop_streaming.
- Only release the power-domains for the CSIPHY, CSID and VFE when
  their internal refcounts drop.

Either way refusing to release video buffers based on use_count is
erroneous and should be reverted. The silicon enabling code for selecting
VCs is perfectly fine. Its a "known missing feature" that concurrent VCs
won't work with CAMSS right now.

Initial testing with this code didn't show an error but, SoftISP and "real"
usage with Google Hangouts breaks the upstream code pretty quickly, we need
to do a partial revert and take another pass at VCs.

This commit partially reverts commit 89013969e232 ("media: camss: sm8250:
Pipeline starting and stopping for multiple virtual channels")

Fixes: 89013969e232 ("media: camss: sm8250: Pipeline starting and stopping for multiple virtual channels")
Reported-by: Johan Hovold <johan+linaro@kernel.org>
Closes: https://lore.kernel.org/lkml/ZoVNHOTI0PKMNt4_@hovoldconsulting.com/
Tested-by: Johan Hovold <johan+linaro@kernel.org>
Cc: <stable@vger.kernel.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-video.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index cd72feca618c..3b8fc31d957c 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -297,12 +297,6 @@ static void video_stop_streaming(struct vb2_queue *q)
 
 		ret = v4l2_subdev_call(subdev, video, s_stream, 0);
 
-		if (entity->use_count > 1) {
-			/* Don't stop if other instances of the pipeline are still running */
-			dev_dbg(video->camss->dev, "Video pipeline still used, don't stop streaming.\n");
-			return;
-		}
-
 		if (ret) {
 			dev_err(video->camss->dev, "Video pipeline stop failed: %d\n", ret);
 			return;

-- 
2.45.2


