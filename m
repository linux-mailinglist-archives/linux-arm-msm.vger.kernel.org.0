Return-Path: <linux-arm-msm+bounces-26101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5AE930C02
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 00:54:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF55328174F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jul 2024 22:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC8613D88E;
	Sun, 14 Jul 2024 22:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OaazSMqC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDE5130A58
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jul 2024 22:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720997636; cv=none; b=Ejqezwo/w/9YlhzzEwWUfb8OSp035Z0DuIDz6tGx0g9EWR54Vae8/7fQbqdNuIUQSJnwdI3Zz+O/nZwEbyDt3XFuJTbgS5LK65SJcV9QeBmOLu3PKJsdbtayY+ISbT0sXLE/ZbW3gBHfJTxn5RZgGizQRGHhcqE5C/7Dmtunk3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720997636; c=relaxed/simple;
	bh=iYI1KOvw94wnIMS8FI79AwEMjOsLCg7Kzx1l6dqHV1w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uHrKyg5Fe77dpjDishJKb9BNc0w4bGubczAZB1LXnjO/sAYiv/bsss7gdyPoSWzP1KgfKq2wtK0qJe/5nb9gLf0rvHdLfphuJhd34vNhjHohrzsw7CZZU6ZtyRFDwCRsefJgwSx0Nl00Uc1W0vzlf9n4FThHEBTQdp9ipLQLD68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OaazSMqC; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4266f535e82so24684705e9.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jul 2024 15:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720997633; x=1721602433; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MI2MH/h15Gsz7mc65cDWKHx+IlGAYagBQoxwo/Wd/mo=;
        b=OaazSMqCQ3NoXH8qDFtsCOazI24K+V8nKDEv/GnufbXMvp2kv58Yen8Z0scXJXAzsr
         xH4BuFh5on7DXpqXI7tSjgYq20xXd3LksUpvU3HUTKK7k9ob7anVAO2jJlJ6xn5GdEM5
         o3akeyHxPnVEgTZsEugLp0cKIjilsawU80/xSz8yJ0afCAqwddz6HkEbPt+C7h/OYlkz
         bCXh/JsuYFNbKjbyTA4Nvt122ZxGOUWVyg0SAeo40Eq28I/kjqf8pgIwZ5jd2gJ9nqw+
         ZulSH91gmzYN1zfuTt+bBsWyzMfJMNFmZ586PBzE7NYeipJvTUpkv3aeGhf4E54kKQET
         LEQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720997633; x=1721602433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MI2MH/h15Gsz7mc65cDWKHx+IlGAYagBQoxwo/Wd/mo=;
        b=G19QFj9H5gdiL/DViXW8fgQRi0mtae6Uqi2JgRCJj6EPvJ9Zda3P/BOfDOuw3xlgpM
         OcE36ItuJE4s57PWRtgFfeG+Orn5/V5vZG7iqvlHkvk8MXDoyxAt4iwWrQUJcFowLMXw
         bZ1qn6lvTXxrfTlz2cjRrIRJo+iCHB5OiBfNT3Bmdxskqaa2mZ0bYhlAflJj0YQ8ww8W
         5pybRETje07FFl9FnNw5XWt45UDIiBr6UuBJ4C8HGlU7ywgsT243pvDChzMbe3u+TYa/
         fcaXlznHK/PtWx9JrEwKc6A1aMJebuUVm1PAX3cfYBkZRw54I1LEdcEFle/+f9Oed65/
         luXQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4KtxBU9F5hCdCsSDwI6hMIXRUMtrzoYvmupYCVgQP49c0OEaa8kyx9/Pob30/c7Vp1/IEr73AHPOaBBl93rcmFDeZ5i9UzMg6t8HIbg==
X-Gm-Message-State: AOJu0Yz6kEaRzR0x5+Xt9L2bNYL1V+U4t3RoaaEgT3bywgPcvvWAguGz
	yY6tpFoo7eyiijLE5fH21TVQRvTbvF+AyuEzT2LJFlt8XOvf6AP8oxltl0uYUOM=
X-Google-Smtp-Source: AGHT+IEysSdUKxeJskaRsDHM4PnZM/pkXEmRsm6QU3mdlwpWsYGntp5CbVnOrGZjCgS2SX/mqCIDbw==
X-Received: by 2002:a05:600c:1587:b0:426:5e91:3920 with SMTP id 5b1f17b1804b1-426708f1df1mr137832735e9.29.1720997632879;
        Sun, 14 Jul 2024 15:53:52 -0700 (PDT)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279dae34casm40632445e9.0.2024.07.14.15.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 15:53:52 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sun, 14 Jul 2024 23:53:58 +0100
Subject: [PATCH 1/2] media: qcom: camss: Remove use_count guard in
 stop_streaming
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240714-linux-next-24-07-13-camss-fixes-v1-1-8f8954bc8c85@linaro.org>
References: <20240714-linux-next-24-07-13-camss-fixes-v1-0-8f8954bc8c85@linaro.org>
In-Reply-To: <20240714-linux-next-24-07-13-camss-fixes-v1-0-8f8954bc8c85@linaro.org>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hansverk@cisco.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Johan Hovold <johan+linaro@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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
usage of CAMSS for a single stream case.

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


