Return-Path: <linux-arm-msm+bounces-56302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EBFAA4F74
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 17:03:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24C104C3851
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 15:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 880B9266EEA;
	Wed, 30 Apr 2025 15:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OtFp+EoT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B86B2609FE
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 15:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746025203; cv=none; b=PARbiY4bshzj/orahsQ9p3SkJOEAc/MDa8uEJoS6Yjw++sKGarbdpP09AJSic6uIJRy6OK8Hw6v5ms7CKRgVBGiTGmoSTT5P+tFp/Z/AptAFkiwRoUET0+k3bfd/e4Kh9mfA2c04+lzz2H/EDgdMQQCZDKzn3i9znvXDS7lFRJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746025203; c=relaxed/simple;
	bh=rcWl+QmYf007ChLfgmF/lkXGahRIqtD3l2zvf4hd2JU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IubFs1ugerOtSEehtvXK5L7f/3Ehu5gwQWavGDAgLHHUqWb9CmOTAonySjUzBbgmTiCb6yQi9GVCh62HQoHQ5PhuZ58bJ8nEhaPcKoPjY714arZ8xH4dJcQkwlbyC7m3VDiflFMI8YiLNVo6tlzcxhd9stBJU4g9jgM/XH3S8iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OtFp+EoT; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-acacb8743a7so186888066b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 08:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746025199; x=1746629999; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s/GOiooi2lf2dyrYlf9XubY7rFtvSk864Rz3PS2UrNA=;
        b=OtFp+EoTW0CCcauVbYQV/EHRhph2Z7RWjC6gbB8hjYTphL6xy3Mg2tonCGUj9Anj1W
         pt4HGju1ntUichM7CWD08IbPAw/K0VkW5nC3pKNB5sRo9mQwMTJ0eGj/icIpG86TQq1e
         P+g0DAgM3qakkfHyJjbOeNuXQWjIlu+QVH/N0MTDzsmh2ojhgRdylbk/Mk2NKVOGO3Eb
         y4RMQilc4kppSuaMrYYGADu65XIlwVRkFp89h92eTN9uMMcJt2UvF55mJIEyfV+HyhbH
         gmlF+3raqr7bm0kTfn334kj+f8D7d05wOI7Pd5768Uf2Gpu852tymQCne9GdUYpRKi6+
         Yvfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746025199; x=1746629999;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s/GOiooi2lf2dyrYlf9XubY7rFtvSk864Rz3PS2UrNA=;
        b=VvNZRtMVd5RhdROEKbGkkHQgl+wrEIYtp/v0E8IHwnXBqfk+wJLwGYr4g/K6fEt5S0
         fh71HbytDnIDbWonoS7GrTNhF24ThBM+oi3nF+7grVwvj7GD/4kQmEjqDNKK7z76SHC6
         4Q51qsa/tAGF8Irtey5JMtwv8VDVJdZYY/G2fcNTeZGorUaZLYgcM3jFgx1xAA5RTnlo
         k6j65UPv3LjBEAG1r1WAuq/DpNFgekmOwR7FVmwD+hV909mL1zTBuQejzfMUlJfL2Jcp
         BZbk4UpaeqFWPI45y7CqhY/IN6TGBs6Jr0thw3Xu8oyTSm8BPINEh0qCh2WPx9IgoI6s
         Hgbw==
X-Forwarded-Encrypted: i=1; AJvYcCXdTDPlqXEG61zB8ecY1Ue2HQ3cnzOQU9fbYt7mD1LOelpxy6AMymVauXJWC2injlP8r+BiZve8Fe8bLSOg@vger.kernel.org
X-Gm-Message-State: AOJu0YzcD49W7gKiKdAiMhBak3v6Nz5DCQyNlDdreZf0rnu1zjOpeelC
	ix1uWPlqk6GFBCP0a0Qcd0tn+MWFbIKe9LKQ1w6/n7qBgrgQwuchTA32PhbCkigM8BynURlO8aq
	O9wf8W9dLK24C2rp0YBLuh49EExzFHwA8ih71iA==
X-Gm-Gg: ASbGncvQxh3nNWlvztQFpOff/MbZKy2keKkZ1xUOjYu4z6umAr8xKFON87uQkEevcRP
	RC836SToAJWs8CxhAlrd7JJWeuwsQTxkIA1cZd7XSQdVgIncxm857P6Vw9Yw4zfDQ9kuBG1L85V
	kWH+RpdV4qEhwUBG0TT8YhmFKQUk6KDJqZX34K1m243USBLFz7SpJcYAcJ
X-Google-Smtp-Source: AGHT+IEuPe3FvOa41k60hnkwtbcvwue35KXfaVRFILnxHi2Xr6Nw0g2Wl1TPRvOhPCaTVHuhJu3g6QUGmtnCWiSixUk=
X-Received: by 2002:a17:906:6a07:b0:ace:bee8:ae0f with SMTP id
 a640c23a62f3a-acedf65b2f8mr255011966b.1.1746025198691; Wed, 30 Apr 2025
 07:59:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429104543.66927-2-thorsten.blum@linux.dev>
In-Reply-To: <20250429104543.66927-2-thorsten.blum@linux.dev>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 30 Apr 2025 08:59:46 -0600
X-Gm-Features: ATxdqUHj7Y9iIyVfGpSZ6xZiHXxko6yaKFvQ3VxEGVgKRHWDbymrU0RIpwfEGLI
Message-ID: <CANLsYkxBxt-fE-kV3yS7WDQuF4o7OSL045fMmXrTvfx3P=A+1A@mail.gmail.com>
Subject: Re: [RESEND PATCH] rpmsg: Use strscpy() instead of strscpy_pad()
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Apr 2025 at 04:46, Thorsten Blum <thorsten.blum@linux.dev> wrote:
>
> kzalloc() already zero-initializes the destination buffer, making
> strscpy() sufficient for safely copying the name. The additional NUL-
> padding performed by strscpy_pad() is unnecessary.
>
> The size parameter is optional, and strscpy() automatically determines
> the size of the destination buffer using sizeof() when the argument is
> omitted. RPMSG_NAME_SIZE is equal to sizeof(rpdev->id.name) and can be
> removed - remove it.
>
> No functional changes intended.
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/rpmsg/qcom_glink_native.c | 2 +-
>  drivers/rpmsg/qcom_smd.c          | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)


I will let Bjorn take care of this one.

Thanks,
Mathieu

>
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index a2f9d85c7156..820a6ca5b1d7 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -1663,7 +1663,7 @@ static int qcom_glink_rx_open(struct qcom_glink *glink, unsigned int rcid,
>                 }
>
>                 rpdev->ept = &channel->ept;
> -               strscpy_pad(rpdev->id.name, name, RPMSG_NAME_SIZE);
> +               strscpy(rpdev->id.name, name);
>                 rpdev->src = RPMSG_ADDR_ANY;
>                 rpdev->dst = RPMSG_ADDR_ANY;
>                 rpdev->ops = &glink_device_ops;
> diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
> index 40d386809d6b..3c86c5553de6 100644
> --- a/drivers/rpmsg/qcom_smd.c
> +++ b/drivers/rpmsg/qcom_smd.c
> @@ -1089,7 +1089,7 @@ static int qcom_smd_create_device(struct qcom_smd_channel *channel)
>
>         /* Assign public information to the rpmsg_device */
>         rpdev = &qsdev->rpdev;
> -       strscpy_pad(rpdev->id.name, channel->name, RPMSG_NAME_SIZE);
> +       strscpy(rpdev->id.name, channel->name);
>         rpdev->src = RPMSG_ADDR_ANY;
>         rpdev->dst = RPMSG_ADDR_ANY;
>
> --
> 2.49.0
>

