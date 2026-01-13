Return-Path: <linux-arm-msm+bounces-88794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 629D5D1988B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 15:39:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 172A23024897
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 14:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 652CE2BEC4E;
	Tue, 13 Jan 2026 14:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UXkmz2s/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A928279DC2
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 14:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768314953; cv=none; b=k3JxuaBFIVwwhDiJ1xZalZUGA3WdhwrIpzhdK8z2URwuPH40UdvWpGIrzH9CXIS7xvybTVEV5IQVwolnlO8B1X65qQYQQ/dwqzI40d6YOCIzOOz1y/SiBAYOOmBwyJ/J1RQw9G9SBXX4sZUml4ZtaKRuLn7EL1ffVSxSWTonrgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768314953; c=relaxed/simple;
	bh=C35Q9gEplkEHxqvrleJh01VreoZX5QZKIn5nqUYUGKM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SHbrn3M0fx50x94e6s8IlMDz3ItsYgwW2yGqbNmNidkbYARJdTl8aUizQwzD6yYTKYTmI34CBei2KUp0SAziEsPUrJTe0KB2PDkuBCnY2DZIZa9VaGaT2U71KV+7VjqmjsVqZSH9+/WwwrtxM6+mYrnqKcbXrtBeHPIK1ybxUH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UXkmz2s/; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a0a95200e8so43638055ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 06:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768314950; x=1768919750; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oSG1flMMfh36IrNc9ewR5ZYBFxhDPNDnEZLwNTNKxSw=;
        b=UXkmz2s/tO0oF3w5iJ5Y28xei1BTRHijWobfXaACzsF7glNc7UMa+J1MYKUfmDsGbD
         BxpaDhyL7dmdwisCAP7m0UEHMHTp0KcRUzWJhxWRPmbpnx2/pOBJTLRBifSI7uDK3sRK
         Y1YsACAJ1jbccOoyfyHLqtERiM2uZL0lm9kVl8OKhj+PlVz6BB1QQeeqbsF2rgrSeOyR
         X2z/3mymY3HkasdUBwE5sgUkBi3Jfni70KfasDVKOViNjv0Nv6+aRNr5kXWqDE6Ca+ka
         H/UQIyh455l+pFs3+sNUNTXAKcCMo6Ird4x0GJ5xH+pEb+fYiIOOdpTwhgIfA2D4190C
         MTYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768314950; x=1768919750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oSG1flMMfh36IrNc9ewR5ZYBFxhDPNDnEZLwNTNKxSw=;
        b=w9mfvlcZUzXaSFXzG7P+4I/W9qFxHoYSLMF5THtTdE9uW1cA+BhUXJvToecqrao801
         Yy4CUchjo2q2UN2CJvW66bZo0/Yk2PH5uzmEVWIFuJ1jxELMmnfSwmQW6b+VEbEFlYe+
         1MN2/XdD+k48YfnKuHeZluvid0vBbQuByupG3vrMpD8MGEXkggCsD4AVm0O/eJtPB2AQ
         I90YihBikUGjUkfUgAjMaObSFhGVpBDCxAl/P1WhYULrDrd5GoQ2DvFWhPqBDmE2g8HU
         4fJatQk8+6iI/m2k1jFN+qHB19lvYQjA3Kc9EbCHqlmNKBwVMMVxIidjkWQKkLXcM3mF
         J7Kw==
X-Forwarded-Encrypted: i=1; AJvYcCXzGhVD9tL9EeiufwYIoiN944LSrqTHENlCddOH/BaNTEr3aykWoj8snLomx4ZO5Z9XbkA4/BMV7MJmY7V0@vger.kernel.org
X-Gm-Message-State: AOJu0YwPdCexmz74jZ/hy9MqbTSm5/cwipFEB8lZH5OG1ocdLdlnrSJf
	eF0Vh/eMVKTGWGlAjTqLBDHrkhf/V7UZ9e7UCjrc+8jwLnrJOv56lJtrnqj7I80H4reG5cKGcGs
	W6rqnep6hrqPVMF/+c7Sh5Wi5cjEaU/E=
X-Gm-Gg: AY/fxX6Nbj5MYl4lUzJ3w9k+EwDPczyEGlQJjvTfCKH9xrkBX6XEoX0DFRTGqBXJlcn
	H5/9r8bgzL5Ygp/eb8/4WTc3APUAdy4wYZniOjX5K3eQ1XS1T5y0nZRO4UsskB+VHH5sxFw9s1J
	C0YTNE/0xex7BKrQmEUWJ/dkArhv5sYg8oIyYlKgnDNagy9MG4VOjYMdM90bI7vOuUfTKEIrzYK
	d4fd8CddSQsEATOGKHTX1HVUDdn1a7+bgT1cygOvT8mjTtLanTHC6lq/W/r1guOgJrs
X-Google-Smtp-Source: AGHT+IHT+/65AwG7pbeaD+hwDIeJFQVVT8OcPnsbknIVCNlEW+jBEIRg6vXSDBwDn6VbTK0XAMZHrcwQrDSLxvGIXR4=
X-Received: by 2002:a17:90b:264a:b0:341:3ea2:b625 with SMTP id
 98e67ed59e1d1-34f68b661eamr23258771a91.12.1768314949735; Tue, 13 Jan 2026
 06:35:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113065409.32171-1-xjdeng@buaa.edu.cn> <20260113084352.72itrloj5w7qb5o3@hu-mojha-hyd.qualcomm.com>
In-Reply-To: <20260113084352.72itrloj5w7qb5o3@hu-mojha-hyd.qualcomm.com>
Reply-To: micro6947@gmail.com
From: Xingjing Deng <micro6947@gmail.com>
Date: Tue, 13 Jan 2026 22:35:38 +0800
X-Gm-Features: AZwV_QilNtsaInykWQuPTQNCtpY0ZlBqP2RfpYd9nDByrVVow35WCZNPQxZXsrw
Message-ID: <CAK+ZN9oMpc9nh08vK1j1XDfhs8w=sQngmJ6rPOqa9QZwjTioUQ@mail.gmail.com>
Subject: Re: [PATCH v3] misc: fastrpc: check qcom_scm_assign_mem() return in rpmsg_probe
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de, 
	gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Xingjing Deng <xjdeng@buaa.edu.cn>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

OK, I will do that.
PATCH v4 is released now.

Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B41=E6=9C=88=
13=E6=97=A5=E5=91=A8=E4=BA=8C 16:44=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, Jan 13, 2026 at 02:54:09PM +0800, Xingjing Deng wrote:
> > In the SDSP probe path, qcom_scm_assign_mem() is used to assign the
> > reserved memory to the configured VMIDs, but its return value was not
> > checked.
> >
> > Fail the probe if the SCM call fails to avoid continuing with an
> > unexpected/incorrect memory permission configuration
> >
> > Fixes: c3c0363bc72d4 ("misc: fastrpc: support complete DMA pool access =
to the DSP")
> > Cc: stable@vger.kernel.org # 6.11-rc1
> > Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>
> >
> > ---
> >
> > v3:
> > - Add missing linux-kernel@vger.kernel.org to cc list.
> > - Standarlize changelog placement/format.
> >
> > v2:
> > - Add Fixes: and Cc: stable tags.
> >
> > Link: https://lore.kernel.org/linux-arm-msm/20260113063618.e2ke47gy3hnf=
i67e@hu-mojha-hyd.qualcomm.com/T/#t
> > Link: https://lore.kernel.org/linux-arm-msm/20260113022550.4029635-1-xj=
deng@buaa.edu.cn/T/#u
>
> v3:
>  - ...
>  - ..
>  - Links to v2 : https://lore.kernel.org/linux-arm-msm/20260113063618.e2k=
e47gy3hnfi67e@hu-mojha-hyd.qualcomm.com/T/#m84a16b6d0f58e93c1f786ea04550681=
b23e79df4
>
>
> v2:
>  - ..
>  - ..
>  - Link to v1: ...
>
> You could even use b4..
>
>
> >  drivers/misc/fastrpc.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > index fb3b54e05928..cbb12db110b3 100644
> > --- a/drivers/misc/fastrpc.c
> > +++ b/drivers/misc/fastrpc.c
> > @@ -2338,8 +2338,13 @@ static int fastrpc_rpmsg_probe(struct rpmsg_devi=
ce *rpdev)
> >               if (!err) {
> >                       src_perms =3D BIT(QCOM_SCM_VMID_HLOS);
> >
> > -                     qcom_scm_assign_mem(res.start, resource_size(&res=
), &src_perms,
> > +                     err =3D qcom_scm_assign_mem(res.start, resource_s=
ize(&res), &src_perms,
> >                                   data->vmperms, data->vmcount);
>
> Fix the alignment to previous line '(' like you did for dev_err(), I know=
 this file lacks it,
> but that does not mean we should repeat it.
>
>
> > +                     if (err) {
> > +                             dev_err(rdev, "Failed to assign memory ph=
ys 0x%llx size 0x%llx err %d",
> > +                                     res.start, resource_size(&res), e=
rr);
> > +                             goto err_free_data;
> > +                     }
> >               }
>
> With the above change.
>
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>
> >
> >       }
> > --
> > 2.25.1
> >
>
> --
> -Mukesh Ojha

