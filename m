Return-Path: <linux-arm-msm+bounces-56156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FD0AA1107
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 17:55:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C42931897476
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 15:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7880121B19D;
	Tue, 29 Apr 2025 15:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LAk7NAxW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6CB23E32B
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 15:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745942103; cv=none; b=W3+EJfFV16giErSWIvuko/75TgarChA1fxHGNq1XFC9oQ69//0FE3G/LuR8m7e7TjeEMP/weP7eo9ryMjCjDrVzpsN+pXDWbCsAR+lcT+Ktp7UbgNcyvhOLauNeGFTGbltrhgBpz5iBdz8kr8Bt8Yp5c+xpfM85sZrpFE3J7jik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745942103; c=relaxed/simple;
	bh=C2yit2/4ph5Fuf8jW69Kb4trJBdX2LSCMXtWurKfb00=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fgm1B+QFl7BphuLidaRu5n8o264pEM3IgGia82oPBTvQ4boXeddFF9bBaqAiS+UAd93gtFwDk0Kl7m1F7jpYMvsm1d9pORvtqELYrrbGOR4Y96TKeDwAd4a2ukMj+8waqIz5U+mtIUSTaczPtMnCjt1Eabh7sWcD7KdJLd5FSJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LAk7NAxW; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb2so5662522a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 08:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745942101; x=1746546901; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yw4dRegYXEd+wmbXYe4jM8oKmljBSa+e8EyYUljkOc0=;
        b=LAk7NAxWSvuT9r7GIb/8CW6vz9zx/jDzGOmuWHCQ6Y6iCcvYsbqYq9zxBCbQVtXTiw
         rU69AsBnj/ocG4bavpi0WwyVqpEbonT6VMWu4BMtfHFgj2b2XzG5bhXoE3cG+yH006a7
         dkFcilZGpidifxilwNmwAX4PyP+kQ4Uof779s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745942101; x=1746546901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yw4dRegYXEd+wmbXYe4jM8oKmljBSa+e8EyYUljkOc0=;
        b=FzvKed2GH3BXomec30dHmBDx6edX71hel0Xk0lbixF0rBx471aJI5UOnZnlcMVmj3D
         IdUHC6FVtgyEpE+1K/kao2at+wI1J9Z9tjKWWpVHy54705AGZPxzWg30SlwSiZ+cLcQV
         sKdrsoL3M0OEZahJDQfl13OSrNl0zir3HzRv82tuvKrxU7Lg0AFBIUH7y4EKIayl3Um5
         jvkZvejQNuSGgHqmEAyzGK0Dx+6JKwAULD7aj8zQ0riyqv41voIV4ARAZUI59v3Ng4Y0
         1VeDs0jnVyeT67x3zODQP+dckS4+wa9GLqXiyGmSODLJ17AUuMIiGXcC3bxq5Kuew7nC
         2+7g==
X-Forwarded-Encrypted: i=1; AJvYcCUGUr18UBnJhUR96ZTNaeQspD59iUlmt1ktPUEJktCq2SS67387WjHWG+sd7XwArEG72v1zYvEgoo8PPEUQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8MHvH3n5/GVNsg0yasALx8E+pKgWc9xljJo/hPv2z//IChPx2
	PPQKH+2mgOy6JwesgJxn8GTH3IA8t5E1VpEJW0VedoXYdsIjwz/mmso8A6UkteW7xCPUikZYeFw
	=
X-Gm-Gg: ASbGncsp0kbglMXqlGa9OOUL2I5dDbVy5Qrw8BYL2hnpS3BjmQawUJhER1Ktks/zvjg
	0TaNFcsX1qAtV9LYBr1z9MCGqJPRUi+JRwgsyhZOSH5nVs63qoYd2McRea1yLeYnTfqnnqPCbdX
	3L/vqVy/M84O+2drNkCuUCLztUUkNhtJIJo9+BmX4kouirKnaS0VFyU31yMP1d3glRPHNWD/NC6
	TARxlgqIlh6SmEmBgmQdoQ7xuP0eQgLZU9sQhHuTR/vKJWZ8WTu3PxW/+nrENWwGU/HAkUaIxXt
	A4g73KVEd+VQrExieOMnGehA2uZ13i9ROnQjFiG2iSf0Tfi3mokVIj5NlwwultxY3GaE33oecF5
	YrZjh
X-Google-Smtp-Source: AGHT+IHsTJa5TtM0ECTuRMftgxkiX+ea7mdIBnS7Tdz03by47ARf9wQ+g0AtGs2bT/+qjnHIhzmWMA==
X-Received: by 2002:a17:90b:5344:b0:2fe:b937:2a51 with SMTP id 98e67ed59e1d1-30a215ad353mr6033166a91.33.1745942101149;
        Tue, 29 Apr 2025 08:55:01 -0700 (PDT)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com. [209.85.216.42])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef03b96fsm11297386a91.4.2025.04.29.08.55.00
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 08:55:00 -0700 (PDT)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb2so5662504a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 08:55:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWGHxlVfch19/G5ucXVlroGybtjy/xkLYd489RbDa7Tn9cHaVvo9Q3wFKGWCsCirRzOHSBF/nn2AddyEuo7@vger.kernel.org
X-Received: by 2002:a17:90b:55d0:b0:2ee:c2b5:97a0 with SMTP id
 98e67ed59e1d1-30a21593a3emr5985847a91.25.1745942100102; Tue, 29 Apr 2025
 08:55:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-drm-msm-gpu-hot-devfreq-boot-v1-1-8aa9c5f266b4@linaro.org>
In-Reply-To: <20250429-drm-msm-gpu-hot-devfreq-boot-v1-1-8aa9c5f266b4@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 29 Apr 2025 08:54:47 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UjtkFY=1V5mFpoyfe3yvxUaRLaqXy1cFfeXE_Ka9W1iQ@mail.gmail.com>
X-Gm-Features: ATxdqUGCzdY0LXwBhAEJ2CeDRyHbock5i9Oan9LqNpeHcunKB9U1sJnJz2v4j0U
Message-ID: <CAD=FV=UjtkFY=1V5mFpoyfe3yvxUaRLaqXy1cFfeXE_Ka9W1iQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/gpu: Fix crash when throttling GPU immediately
 during boot
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Apr 29, 2025 at 1:34=E2=80=AFAM Stephan Gerhold
<stephan.gerhold@linaro.org> wrote:
>
> There is a small chance that the GPU is already hot during boot. In that
> case, the call to of_devfreq_cooling_register() will immediately try to
> apply devfreq cooling, as seen in the following crash:
>
>   Unable to handle kernel paging request at virtual address 0000000000014=
110
>   pc : a6xx_gpu_busy+0x1c/0x58 [msm]
>   lr : msm_devfreq_get_dev_status+0xbc/0x140 [msm]
>   Call trace:
>    a6xx_gpu_busy+0x1c/0x58 [msm] (P)
>    devfreq_simple_ondemand_func+0x3c/0x150
>    devfreq_update_target+0x44/0xd8
>    qos_max_notifier_call+0x30/0x84
>    blocking_notifier_call_chain+0x6c/0xa0
>    pm_qos_update_target+0xd0/0x110
>    freq_qos_apply+0x3c/0x74
>    apply_constraint+0x88/0x148
>    __dev_pm_qos_update_request+0x7c/0xcc
>    dev_pm_qos_update_request+0x38/0x5c
>    devfreq_cooling_set_cur_state+0x98/0xf0
>    __thermal_cdev_update+0x64/0xb4
>    thermal_cdev_update+0x4c/0x58
>    step_wise_manage+0x1f0/0x318
>    __thermal_zone_device_update+0x278/0x424
>    __thermal_cooling_device_register+0x2bc/0x308
>    thermal_of_cooling_device_register+0x10/0x1c
>    of_devfreq_cooling_register_power+0x240/0x2bc
>    of_devfreq_cooling_register+0x14/0x20
>    msm_devfreq_init+0xc4/0x1a0 [msm]
>    msm_gpu_init+0x304/0x574 [msm]
>    adreno_gpu_init+0x1c4/0x2e0 [msm]
>    a6xx_gpu_init+0x5c8/0x9c8 [msm]
>    adreno_bind+0x2a8/0x33c [msm]
>    ...
>
> At this point we haven't initialized the GMU at all yet, so we cannot rea=
d
> the GMU registers inside a6xx_gpu_busy(). A similar issue was fixed befor=
e
> in commit 6694482a70e9 ("drm/msm: Avoid unclocked GMU register access in
> 6xx gpu_busy"): msm_devfreq_init() does call devfreq_suspend_device(), bu=
t
> unlike msm_devfreq_suspend(), it doesn't set the df->suspended flag
> accordingly. This means the df->suspended flag does not match the actual
> devfreq state after initialization and msm_devfreq_get_dev_status() will
> end up accessing GMU registers, causing the crash.
>
> Fix this by setting df->suspended correctly during initialization.
>
> Cc: stable@vger.kernel.org
> Fixes: 6694482a70e9 ("drm/msm: Avoid unclocked GMU register access in 6xx=
 gpu_busy")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  drivers/gpu/drm/msm/msm_gpu_devfreq.c | 1 +
>  1 file changed, 1 insertion(+)

Thanks!

Reviewed-by: Douglas Anderson <dianders@chromium.org>

