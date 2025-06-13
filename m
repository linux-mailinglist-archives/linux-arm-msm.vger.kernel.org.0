Return-Path: <linux-arm-msm+bounces-61206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD60AD876D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 11:14:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DFAD47A66D7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 09:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17A1A291C27;
	Fri, 13 Jun 2025 09:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f7wccNY/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94F6279DBC
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 09:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749806030; cv=none; b=CPwPcywS25CFUOgGDdwIcI9SdKiudQvFA0CR+hl9VeaJHsHK7C29/54OzzzOFDu9KN+LGM4l4y1Loh9MJTbT7FnsXGMXndkKLDOLAKJ2N+ndbaVQMoSf4zg7LYQxtsbyeRjZBrKJILMUIxQzPqJxjh22bdoNuWFLDncELaegIho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749806030; c=relaxed/simple;
	bh=W3o3VkA9R41ABqUB6EM0CchrljGSzF20t0WFgGKvOZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nUD6u32zfC7vnJEJTbMowb8MnULMmRgjz+hHctRcsgLn03VNZt6a/qj1d7IzE3sGN/KkAmJsRMqwmGQaqPfp+xDdobIs4CQ447dI75l7wOV/PBvEVunWzh5IO3ZseIeJKiezGuewpALCYDTMzjN0bmez2BlXECfvlAwOgYLnYmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f7wccNY/; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-55325956c93so219520e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 02:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749806025; x=1750410825; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=23wQo7liyOIk9856bf2K4MBM9HMhUL1JUtFemuTkldE=;
        b=f7wccNY/mo1VdqoAsmNrgQuBuolRb+ZV6GmiFXxMPaEleWGRrN0xA9mIniAf50vMC0
         C1cOktm6IMowLci264aokHBCQrC3e7D9khdItZG9uu6YLwK83j84wkL0a8n44QdF9sna
         wahI+7af3VkU1Hv/60f9rYT1kITzxkLylwj1gGETB9lSxV1b8FYLYDQ0AFjKL0aTWBbC
         Kzhlkb0B4Wd2D8Wp5bBzwqBKaBKi5ruJ+iO8T5aBEajN3SQ3NCJAXZ1+uOZfBLYe7zDu
         dw7StTTLLNuM1GHp4TH059yK8roSXaeNZ9iwx5BR32KQFB/ErqpPlK3x8nn0c2/K9Olo
         QS/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749806025; x=1750410825;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=23wQo7liyOIk9856bf2K4MBM9HMhUL1JUtFemuTkldE=;
        b=UGm463KXr9+t/BXn8zlvRd1twlPkuT+/pLxesbW5GdBGH7tBk0yv6e4V7/BDMWSclh
         B37SCMw4AI2spMoc8jzWGc5ifPhFmI4gS0mdDNSmUGKjJLRec4oYc1lqU1uwxzsVJfJq
         M9XkjnzCYV79R21mh+l+6Y5k/hiGDdq4UtQUfBDJBorAwHhmUWc8oGOWDBvURcpTKwGG
         1ZhXHM27QT+XDIm5Zy8Ob0+IqSjgH5sfQS4EEA8kWq92tzPTOyuWRN/ItZTiGP5XCOor
         5dkV53FjGhJumOauI3xG5O5Wm0inH40im36mkZdab2RR9zb1evJ7wrcPbJh/qygg0KZn
         efIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaJqOLR+cu0SzsWGmRAhoXXuUN5lhz1gnfj6Fo+eBlRjE+2tnAk5g4xt2QYr0tvm/mzQ6rui6Q2lUygXtD@vger.kernel.org
X-Gm-Message-State: AOJu0YzsCNt/LQ+FxgngFE5c78h2MufBGqO2JIOYz+V7lnj7/GBGiSlW
	IEDJhMEg0L6LPm6irFHWUjf+LdTQhs3v5SOyGDI+mw7mu5bFI6Mmxg9j1gIOLU9eSo8=
X-Gm-Gg: ASbGnctCm6EVaI5tFyu8eEInMErOqqVF6FUyerl4AQkIqT9IxxQKtGA49A9tiHij7To
	CSWAPb6+ZoWecU9koTxbC3k23cvWAQJ+MZnjfM4X427JArZj5HmaSUwu5Q94ylgibxeGwqzy6Ui
	dSBGz6Ban95cxRcowclC9aBEcXjBsZ3hKdlGV3Bl2IIuC0yZe1IErhHjm1mx0qrr5G48w0EZBtK
	8ilN4lpwgKhH++vqaELsELGIwOOacc1uJuFFq8kaCwhZeMHqTb0x7IoEYGdyRH0KPt78v0Z0ckE
	dV37ft3V8qayF3KOeVXdvAOutaOlMsE0PVbQwlqkkBvJ9JSc3ZgEYJWCUeooU/K3VKo4uyurcZH
	mI/6DPwqrppO/lGfwlP6kF0E6bdfHp2KFf+F+wLF/
X-Google-Smtp-Source: AGHT+IHcu1Xw3nrbZ4W7GCdPuwlEWi04dXVVEXHb+OxqkAVhnop5YBhtxDz/mVa/t2mU+QwfzqVgnw==
X-Received: by 2002:a05:6512:1591:b0:550:d534:4673 with SMTP id 2adb3069b0e04-553af9b48edmr153841e87.14.1749806024805;
        Fri, 13 Jun 2025 02:13:44 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ae234437sm267196e87.53.2025.06.13.02.13.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 02:13:44 -0700 (PDT)
Message-ID: <c90a5fd3-f52e-4103-a979-7f155733bb59@linaro.org>
Date: Fri, 13 Jun 2025 12:13:42 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: qcom: camss: vfe: Fix registration sequencing
 bug
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Depeng Shao <quic_depengs@quicinc.com>,
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Johan Hovold <johan+linaro@kernel.org>
References: <20250612-linux-next-25-05-30-daily-reviews-v1-0-88ba033a9a03@linaro.org>
 <20250612-linux-next-25-05-30-daily-reviews-v1-2-88ba033a9a03@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250612-linux-next-25-05-30-daily-reviews-v1-2-88ba033a9a03@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bryan.

On 6/12/25 11:07, Bryan O'Donoghue wrote:
> msm_vfe_register_entities loops through each Raw Data Interface input line.
> For each loop we add video device with its associated pads.
> 
> Once a single /dev/video0 node has been populated it is possible for

Here is a typo, /dev/video0 should be replaced by something like /dev/videoX.

> camss_find_sensor_pad to run. This routine scans through a list of media
> entities taking a pointer pad = media_entity->pad[0] and assuming that
> pointer is always valid.
> 
> It is possible for both the enumeration loop in msm_vfe_register_entities()
> and a call from user-space to run concurrently.

Here comes my insufficient understanding, please explain further.

Per se this concurrent execution shall not lead to the encountered bug,
both an initialization of media entity pads by media_entity_pads_init()
and a registration of a v4l2 devnode inside msm_video_register() are
done under in a proper sequence, aren't they?

 From what I read there is no bug stated.

> Adding some deliberate sleep code into the loop in
> msm_vfe_register_entities() and constructing a user-space program to open
> every /dev/videoX node in a tight continuous loop, quickly shows the
> following error.
> 
> [  691.074558] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000030
> [  691.074933] Call trace:
> [  691.074935]  camss_find_sensor_pad+0x74/0x114 [qcom_camss] (P)
> [  691.074946]  camss_get_pixel_clock+0x18/0x64 [qcom_camss]
> [  691.074956]  vfe_get+0xc0/0x54c [qcom_camss]
> [  691.074968]  vfe_set_power+0x58/0xf4c [qcom_camss]
> [  691.074978]  pipeline_pm_power_one+0x124/0x140 [videodev]
> [  691.074986]  pipeline_pm_power+0x70/0x100 [videodev]
> [  691.074992]  v4l2_pipeline_pm_use+0x54/0x90 [videodev]
> [  691.074998]  v4l2_pipeline_pm_get+0x14/0x20 [videodev]
> [  691.075005]  video_open+0x74/0xe0 [qcom_camss]
> [  691.075014]  v4l2_open+0xa8/0x124 [videodev]
> [  691.075021]  chrdev_open+0xb0/0x21c
> [  691.075031]  do_dentry_open+0x138/0x4c4
> [  691.075040]  vfs_open+0x2c/0xe8
> [  691.075044]  path_openat+0x6f0/0x10a0
> [  691.075050]  do_filp_open+0xa8/0x164
> [  691.075054]  do_sys_openat2+0x94/0x104
> [  691.075058]  __arm64_sys_openat+0x64/0xc0
> [  691.075061]  invoke_syscall+0x48/0x104
> [  691.075069]  el0_svc_common.constprop.0+0x40/0xe0
> [  691.075075]  do_el0_svc+0x1c/0x28
> [  691.075080]  el0_svc+0x30/0xcc
> [  691.075085]  el0t_64_sync_handler+0x10c/0x138
> [  691.075088]  el0t_64_sync+0x198/0x19c
> 
> Taking the vfe->power_lock is not possible since
> v4l2_device_register_subdev takes the mdev->graph_lock. Later on fops->open
> takes the mdev->graph_lock followed by vfe_get() -> taking vfe->power_lock.

It's unclear what is the connection between the issue and a call to
v4l2_device_register_subdev(), the latter is related to /dev/v4l-subdevX
devnodes, but all way above the talk was about /dev/videoX devnodes, no?

> Introduce a simple enumeration_complete bool which is false initially and
> only set true once in our init routine after we complete enumeration.

It might be a fix (what is the bug actually? it's still left unexplained)
at the price of the machine state complification, a much better fix would
be not to create and expose a non-ready /dev/videoX devnode by calling
video_register_device() too early.

> 
> If user-space tries to interact with the VFE before complete enumeration it
> will receive -EAGAIN.

It sounds like a critical change in the kernel to userspace ABI of open(2)
syscall for CAMSS V4L2 devnodes, unfortunately... EAGAIN could be received,
if open() is called with O_NONBLOCK flag, otherwise the syscall shall be
blocked.

I believe a completion of media device entities/pads registration before
creating a devnode should solve all the issues in a proper way.

> Cc: stable@vger.kernel.org
> Fixes: 4c98a5f57f90 ("media: camss: Add VFE files")
> Reported-by: Johan Hovold <johan+linaro@kernel.org>
> Closes: https://lore.kernel.org/all/Zwjw6XfVWcufMlqM@hovoldconsulting.com
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

--
Best wishes,
Vladimir

