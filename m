Return-Path: <linux-arm-msm+bounces-74132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 044E1B884E4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 09:59:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCDE7563DE6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 07:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 039EC29ACE5;
	Fri, 19 Sep 2025 07:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U8sgX+OM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328D92FDC5B
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 07:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758268739; cv=none; b=gFF+cR3gcBGPWi25/wvFzUpxtJ4opjHkCpgQc4mqYsxacGWrmnti/uy39YOJM0m+ka0hArU2M52HJeTPKIbigMti1+gzm2V8TzZJ2V8j2dJxeTpLJk+ByF98IKIVRJxATaISQ91uLnsXM2UgsaCdGil+g7r+LTDOj2QNfpvfp4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758268739; c=relaxed/simple;
	bh=O+hzsSvVnJz7MunYFuB149YvUwD55qvPOuK7bklmxF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rgo8BjI4BTBMvvHl+qLJ6vKuX1wQvwSJkFJAvLlZQ46iBssrrrsf/TqNJLI+xFJ/vsirXhnHFjDJtdQAF5HV3h15tASfk/xAW9prdb4TW4deNZhg/FdgoaVIX4XHStXXnhQKIm9HPin3qAmZreykULKekspl5vAboMQLAoi3G3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U8sgX+OM; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-62347d880feso1073411eaf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 00:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758268737; x=1758873537; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AHJ3UbPpS3D5IfXMLoQP0sFO1NEt5wlea5HnZpiaQh0=;
        b=U8sgX+OMvuAMhWAlTzti44Vh98HqEFnUG2ujSwiS4fo7cGSZmErv3+k68VHbPMegHO
         PHFMKM4nYYFJ3D+JwXM+7gaRNA5fCkfCSL3yES2TQ/pBnUy3z0saX/GzcQQAb6taAwlD
         QOQiyhBhPaT4CRkHFTJWIqkoJpqIjMFHknaca3MqRAN7tDvleJLK7Lupl2Zbeh1ilakS
         Ge9eY9UlcjI/abZ8h8i6Z7Oop9r7c6FD87tIZKg3IQdWCB8q4iXzv8UP2qGT9xyCUFWy
         nuCoFuqvGCRyC5OYjvZIsrvWKYRhJysn7KbsoX4QStZumnJunHE6lw+SDaOG7hAmNDiu
         jR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758268737; x=1758873537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AHJ3UbPpS3D5IfXMLoQP0sFO1NEt5wlea5HnZpiaQh0=;
        b=K+j34xWjyN2kJA9NA04dvzUZ5E3m7zoxedaCxgRvKRuTg9+2KkhH1EWSBowrcYcw86
         CZj+8z8ioTKWh5+Hf/kPpnF0Rot1ibtimXjns+EHEYTFxNa68gDPFql1/loUSu932NnL
         eJWQNDbSO0/BBouLNive0JH/kHGZbTHWPSsTB9FOVeaQQjUqhklVCeIWkVEticMvyV+I
         kmR58PB25WDEq0log1HEtTK3bzFUQkzEbOTcr1Y3hXc/Oz/0SDwkRul6YoC4x0fkbt02
         01Nurq/gmSXLNVoVbmg75TXkA2mUNqutitBlbvMeJ7XvkUW26SE5i7PhT2Kccul/ZwkG
         2xQg==
X-Forwarded-Encrypted: i=1; AJvYcCVyksgnv8Vk3RPbaTnp6D4w/rzNZQN08jq+/5+3qWOPPQ4aBi0VeO3YcNfivh1oeEG6Eab9BuOzXMpXznDg@vger.kernel.org
X-Gm-Message-State: AOJu0YxqaGwhi+nHA4X4i9SRg+W3MHc81b8UWhp5RuFjj/dCGdaeFcrd
	0+GYUvFgLZz9uUT3rfTV5/KuYJBws2v0wYKnk9nnO5PNAU6JqXUHDGi5e+TFWW1bDTYt59V3B4j
	E50ieLafr7HQQAYpPXHNPToPdikGTKAf+M3vH5APzJZvHOmwjhMEG3kE=
X-Gm-Gg: ASbGncvlGO2NTO5WR/SuanHD9gFGrnkDFMSle9+HJZIjInn0VPCxSA7Tbi/jXbuvmv6
	xdU8biZLCB4dnQWmiN/FO32gPQUCzeuBTjz2kdq9+Jxdi6DXICu0ZYSgWRjNRqc8/9oQ7k/6N2u
	bHj7kuoV3voGMxsBNwHkgHzf80P+7K0aLGiFC2rr4B6Jhos1LJowSMGih4WZ1oyBIaN+5rotDlw
	eP3UnMW
X-Google-Smtp-Source: AGHT+IFkd+gNrjrot18Zo5hmp077YMeppKIoRCZvWMh3/mqyMghiA3DIyH1IQhZkyQF86NUjQQnEf00dsGPBqTCeBfU=
X-Received: by 2002:a05:6808:6f85:b0:43d:6b7b:2469 with SMTP id
 5614622812f47-43d6c129f19mr966534b6e.4.1758268737218; Fri, 19 Sep 2025
 00:58:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aMvV8WIKnqLN3w6R@stanley.mountain> <aMzodGIvL88HNi0d@sumit-X1>
In-Reply-To: <aMzodGIvL88HNi0d@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 19 Sep 2025 09:58:46 +0200
X-Gm-Features: AS18NWD_RyD3kl7DRtBl_0VNsyLANW3lHRdWn6UrulYuNqtupf3pr3qBMXZkBaU
Message-ID: <CAHUa44HLULAZ3XXimqDzCfG8rc8OzU-ACmv2Gaee7Xbi=w3VEg@mail.gmail.com>
Subject: Re: [PATCH] tee: qcom: return -EFAULT instead of -EINVAL if
 copy_from_user() fails
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, 
	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 19, 2025 at 7:22=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org> =
wrote:
>
> On Thu, Sep 18, 2025 at 12:50:41PM +0300, Dan Carpenter wrote:
> > If copy_from_user() fails, the correct error code is -EFAULT, not
> > -EINVAL.
> >
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/tee/qcomtee/core.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

Applied.

/Jens

>
> -Sumit
>
> >
> > diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
> > index 783acc59cfa9..b6715ada7700 100644
> > --- a/drivers/tee/qcomtee/core.c
> > +++ b/drivers/tee/qcomtee/core.c
> > @@ -424,7 +424,7 @@ static int qcomtee_prepare_msg(struct qcomtee_objec=
t_invoke_ctx *oic,
> >               if (!(u[i].flags & QCOMTEE_ARG_FLAGS_UADDR))
> >                       memcpy(msgptr, u[i].b.addr, u[i].b.size);
> >               else if (copy_from_user(msgptr, u[i].b.uaddr, u[i].b.size=
))
> > -                     return -EINVAL;
> > +                     return -EFAULT;
> >
> >               offset +=3D qcomtee_msg_offset_align(u[i].b.size);
> >               ib++;
> > --
> > 2.51.0
> >

