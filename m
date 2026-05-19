Return-Path: <linux-arm-msm+bounces-108316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kvmrK1PiC2p2QAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 06:08:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC2857721A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 06:08:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 94203302AF04
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 04:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F42A2F0C62;
	Tue, 19 May 2026 04:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ctLjxadB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E873C24E4AF
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 04:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779163728; cv=pass; b=qyipyI9WbNgZfRxf5KCybirPyoa/pAdklBlx2GuOt8gwq8XEnZ23CTa+7RPPYN+PYr9OUMPvU+eVWs3tR06Tz2Q6+zZfLGv8e9KkhA8w2Wc9n1GLlju5rCMvDktkFPFZWAZmqeZIHFoaBmUgF7E572b31AbirSOFaYBPNRz9y68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779163728; c=relaxed/simple;
	bh=t2cMNU2aA1KxvxZx7gAR15pb3MDXwlSILsNYkZLsYZw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U8D87K0bjXby42nPiHuEgFuSMyfCXLW+szK3y8sOtacbz+MkXbLxCc0AJMBonYWtoNOgz/TOXUTj29ohPh2jPEXZHsvYSjta1UjL1FueyFxXFy3as6wTXf4VQdJI33t69ak7R9VyvR+9PlQwl8jZZrKm7U99EN2mwbVL4MSGbC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ctLjxadB; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6587cee8b57so3728180d50.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 21:08:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779163726; cv=none;
        d=google.com; s=arc-20240605;
        b=bmea9RH7VQM5q0XTmv5J8ub6HV+kQsc5YGTUNBXPwz58YR3Akpm8oAs8EGtcihAa2X
         tBP8nhrSAQ2jhlEVRe/4D8LAvGfUazJtzec9Ealtl23M02VaOBVKGq1SG7F+s9mJBq3S
         CZ6uUPcBHGhC+nOTS+rfpDZgzaHwC0yzPuFpTj0VPQdHbxaC7Iyk3c2kuknkdVkK4mTJ
         ebUGwXmtTKzSV35rRHWVv1k+UdRt3wC2VKxd6KgguBAqi8xu9leeqia5Uycy3lBX7Cp+
         1iBaK+WpQpuDN/u0gSYUnXx4UrRtGBB3VB35cXngF8RRLwVZOziIhHD7u8Y4j0hOZ2o7
         guIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7kA2hMel3rxxxc6CCqPFQDCtKlIGXB83OzM5cTPXrbQ=;
        fh=jXGxPf5KfCQe22m8eR/UMjv328dfDuy2jH2Np8dZtsk=;
        b=exwfOTI2nrm/336xoQT3+28DQfMa452jCTQw1pcRn875kptsrVjdMtnRxcdw1iihn3
         +D9mNMtXGmqLX4rL29Gw9oZE6z0M5xuSV6ljwpeD2lWLyg+u2/hvujMFfs+EUYrsijk2
         pjp46IGHLDxzjPxvV5bwowG/wX9+JysSJkuNPSjT5t9Uba55gSkvqpDk0LRJmQOLMQwf
         B1bD2rVvS7+r4xmfoVkPsBwbOalvvXUwWhug5nFWwTnrSSV3YlZIX/1Ha0ES06p2vgF8
         FafzraCkzwpuAWy9kf2uZO83YC/eGcSOrU4O4BbD44JLRA3Gow+j40c5sxOOZmje1G4M
         bi/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779163726; x=1779768526; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7kA2hMel3rxxxc6CCqPFQDCtKlIGXB83OzM5cTPXrbQ=;
        b=ctLjxadBju125+KfH1+ocvwxvruILyh9VtI3nsbuDRjgBQpn+LB63NRdTyhapIFsBL
         hAslfpwPwY3Yzg3Swn2bOTpcif2fjuVWoNMXdAqr5133PB6mVcXvXZIFJDUTjTLljHuP
         gKvlzgeCjWmCiIrzjvqwz1BZZZbxp4ghhseG5UAy6I4jTTpdUEjNaQz8sjgbQ3tFY6XU
         k4B2jDCf5p8+XIuy6kmLqvF0EPWUGVZfqD5+UmBtP4Wwwe41pFV7kyEiX1sxZfUQdhwQ
         2eiNhX/DuCRG4uBfXF2/4dr8TH2rv/Xh//ZFsB9JRf/WhpnjQHJcevR84B6mwBjw1t2W
         R9XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779163726; x=1779768526;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7kA2hMel3rxxxc6CCqPFQDCtKlIGXB83OzM5cTPXrbQ=;
        b=sllAs1BjgxAvZuGVJs91raST1/rMcR9bPyGc5PHFwHG6aYwTQO6OsrO31QN9oHUtwY
         89BLtk2BkjWy908K5L9NciCIGfCeaEyq2GLQUQBvOdzsyYzO6hMQyk7PFZnFaMRNU+/q
         YaXKxGFEIKFTIgmGW2Vlr47iXqG1YJxHMhmkT5//+ih+enRcgEYnUfmJVKC5eqjG3GDK
         v5LDa5Jo2veGWPIfJLqr0CJin0Yo8F5yNkvssMY+1PBuVrAvzGLHwa3lbmIj6Y+a6xj7
         U/qEGgMmLHGDiCUFYd0SAct3isxdwlKhwVDKaaETE3PQUDDXXJibSr7ICH2XnzG+jevV
         djbQ==
X-Forwarded-Encrypted: i=1; AFNElJ8LK/t8/m8//x5Ds5V5fAKUrNkZd6x3HIiHXdpjYrBc5ko/lnqKZlgtrJgO8avm9D9pkjvSfZ2dS9mq0FXX@vger.kernel.org
X-Gm-Message-State: AOJu0YyNKlAGR4mfRiSouOewm83SviNtvSDDejsm89XFF05HyQYsVVyj
	D2lTV5zW1jKTgD8ssWzNiKR4YcqTGpM/imxr/ZJN2Kbk8hiNINdji4heHVAoNKlseG3zv7OcG3g
	24PIH1GE99qHXxe7g4weJCXBrSMgvL0Ied+YaPuCB3Q==
X-Gm-Gg: Acq92OGgl7zokRAkcrzU1nMtsXBgBxuQalN8mrH9p7Z0NVezLnP1sfyzFTNb6bOuUAG
	CLKsxb/5lkb/fm2CcDV8cpQLmGFui9oTgRuHSMmovDWIGQa6Sqi33IkGd9jTSBwZn71qmVLXiS7
	k5AIosTqlEd3jhobgFtUY2/1wYo85t7w0HCsuzftmZ5R9VpN/s5k6oy/qptgUBHNmoTTilSgDw2
	P9RopY1eM7vKpzoNTFlVchS8cyWsQAs8wIyyhcE6H4kMhyi99LjAldaclQQtkTnjoQKnXNy6Zfv
	IqTwkz9m
X-Received: by 2002:a05:690e:4192:b0:651:c642:92a6 with SMTP id
 956f58d0204a3-65e2276af55mr14893597d50.21.1779163726061; Mon, 18 May 2026
 21:08:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518105755.988961-1-lgs201920130244@gmail.com> <voc7mqvhim4gfaar4n6v3b3xkttzij7uaqs7lh7jriatyonoi4@tle3syly3hbi>
In-Reply-To: <voc7mqvhim4gfaar4n6v3b3xkttzij7uaqs7lh7jriatyonoi4@tle3syly3hbi>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 19 May 2026 12:08:33 +0800
X-Gm-Features: AVHnY4Kmevscl33_As9WRlCBA6NKiL2y-AhAuAVokGZCmpYURKETKpE7xfV4szc
Message-ID: <CANUHTR_VrfH44KB6Nng+yeGqLgBst+Xz0AsPp0J0Pap_rOF-OQ@mail.gmail.com>
Subject: Re: [PATCH] media: qcom: iris: avoid double free on video register failure
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	"Bryan O'Donoghue" <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Stefan Schmidt <stefan.schmidt@linaro.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108316-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 1FC2857721A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dmitry,

Thanks for reviewing.

On Tue, 19 May 2026 at 01:12, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Mon, May 18, 2026 at 06:57:55PM +0800, Guangshuo Li wrote:
> > iris_register_video_device() allocates a video_device with
> > video_device_alloc() and releases it from the err_vdev_release error path
> > if video_register_device() fails.
> >
> > This can double free the video_device when __video_register_device()
> > reaches device_register() and that call fails:
> >
> >   video_register_device()
> >     -> __video_register_device()
> >        -> device_register() fails
> >           -> put_device(&vdev->dev)
> >              -> v4l2_device_release()
> >                 -> vdev->release(vdev)
> >                    -> video_device_release(vdev)
> >
> >   iris_register_video_device()
> >     -> err_vdev_release
> >        -> video_device_release(vdev)
> >
> > Use video_device_release_empty() while registering the device so that
> > registration failure paths do not free vdev through vdev->release().
> > iris_register_video_device() then releases vdev exactly once from
> > err_vdev_release. Restore video_device_release() after successful
> > registration so the registered device keeps its normal lifetime handling.
>
> This is definitely not the correct way to handle the issue. Fix the
> error path instead.
>

I had also considered fixing this by changing the error path, but I am
a bit concerned about the interaction with the device_register()
failure path in __video_register_device().

Commit 2a934fdb01db ("media: v4l2-dev: fix error handling in
__video_register_device()") added put_device() after device_register()
fails, because after calling device_register(), the device must be
released with put_device() even if device_register() returns an error.
Otherwise the reference initialized by the driver core is not dropped,
which can cause a memory leak.

On the other hand, if I simply remove video_device_release() from the
video_register_device() failure path in iris_register_video_device(),
then earlier failures in __video_register_device() would leak the
video_device. Those earlier failures happen before device_register()
is called, so put_device() is not used and vdev->release() is not
invoked. In that case, the video_device allocated by
video_device_alloc() is still owned by the caller and still needs to
be released by video_device_release().

So there seem to be two different failure cases:

before device_register(): caller still needs video_device_release()

device_register() failure: __video_register_device() calls
put_device(), which may already invoke vdev->release()

Would you please share any suggestions on how to fix this issue properly?

Best regards,
Guangshuo

