Return-Path: <linux-arm-msm+bounces-75637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94467BAF70E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 09:37:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4484617ED21
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 07:37:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A67127380A;
	Wed,  1 Oct 2025 07:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="XQE4jqwS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACBA2737F2
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 07:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759304272; cv=none; b=c6PInH0I07hsCF1vd4ec5RmSYAqw81ALKgWa8SSXJw9VfTxnzOr3a6xZ9mny9YAa3Y170ixKWmHxBqsQ8z+S/dyjE+p+mtnQ7TQ7oCmKV029zO2FUkLRRMAK5kgARrD2/c8GQdhayTTMLKatZs6PfpbJyGaZPxQznaMK6YcISw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759304272; c=relaxed/simple;
	bh=8sVJAQeo624gIrwB6ZweWT3OdhdEAaFu0YNUW/knCkQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=Z8glxRddD879f7mF7e8hZ3pVMxEyb5EzfbQGxrFsPBmOTlkBWS/j6uwYdszDlEsSovTKfPKcPpvD0k2390fOKfOgCX6FXRnSdCHTrI63hnh75yZnwnxQXQDsi7ViyUGbZjcIlNK3hYFHsMOr1BlMgcriunOQsPQV6jigpOr8R2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=XQE4jqwS; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b3dbf11fa9eso552018266b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 00:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1759304269; x=1759909069; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CCBC31964+c7FoQA1HUfYfeEbUaDgsaFIT9ZaWC1avo=;
        b=XQE4jqwScTaNH9Z+ttjP/0XpepbidtXiXhGVB5nObH1B5Q2jGSt+beSCz5d46zSYtd
         2VhV8L04HDW37iCo9PoXnpYhpYmuvtvLO5oNIOrSVzgxg3bnzhrmjp5anqc0kCsxnZwV
         6exBcrynOyUQy6dBw2RTWtIMwfyBiWoDXIPvLX6DqOet4Cx5+F+bIkHf7Fs7ac0HDSXA
         v58kUrlnDAMoDwpCtwG1LfiQ1qUKPkVqviLj4CiPRHpX8JthbP9mdugo1xVdUXBnfuZ7
         wByt24823R9/vSTYHJ80+fgwD5ZVgyLy3/ABzAPux9lvUkmiEvBduMqJ+/35fOQtZzfA
         vL0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759304269; x=1759909069;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CCBC31964+c7FoQA1HUfYfeEbUaDgsaFIT9ZaWC1avo=;
        b=YMFY5iNjw0wxC7mY6MwakN59DFbSbF7qhCjnOK4YmhMnD6mr7Mbb+Yi1G4G9g2KXvT
         tl4f1Alf9UljRziX+TM5eLDOBP8FCQkJBE6fACiLyrNNp4jy0vTWzBhH6uIqVi1Eq1n1
         6X3mOaVEdGgv1xx+H3j6FN35x/DfhmlIjypvLA/rDxHqr43lsSHGsrSgvDXftmIOhrbQ
         q7rtMCOwbmJswGtw6OtvF61rSg5EC4TuUtWcxo9HKXCvlaYlhP7jC8a+Vriw/7sDXDsk
         Io51BLUNGLRILV9MqLv0TfNVUOs1pYdbbH4oZKNKik2E6q2v2+hzklZLWtpmvo78ge4F
         +YSw==
X-Forwarded-Encrypted: i=1; AJvYcCU5P/31cXR2i+P5NJ3890xqKNTDdzc9/Tk09qE7IqaVHeqC/ZWfVMhq5ZgQFSDWj4hb3N1Mv+tjOOmnQAhh@vger.kernel.org
X-Gm-Message-State: AOJu0Ywin3PPky8jc9vXfJMIptiAaNb36M9YvifcE5djDubggOsj9NNu
	d4jCh2WIgwtqTybr2vxwAQzPkOQepgF1wkOw+5NaY/tWSaVFd4pu+VFxLYADV992uw4=
X-Gm-Gg: ASbGnctdE4Egz+Qvh8wW6xcIhpwWaRdEYteYxCzpZa7ejJz/dl2KzbUtMGwo+9iHX0T
	001j4JV0YSB5MvSj0+jH4HHULUg+jcN+LzUpwDiwtb1TyCnbBvzvRh+NrqMRhLElLrzmQAwQfVD
	Ckt6XyEu7IyxLv7p+igK+fNiTp5StiOxUYnbXNwtoKwB0xOVtFYKLD/5DU74qwoZmfH9HkD0hIa
	06QMCJo/QUWIVMKO5A7xbnGsUYU6yFR0ahrJ0ru2nBCopGY99Sqg+S2XXOAvKQXk89NLGbvRk0Y
	vdc8VzNvS7PlY+T68tvA2DkQZpzgiBsgYI6MYCA1fHfaEjor1K1Z1cnjUCmX9QsPTEU7sVXe3zz
	N4AaASGY4lEIpFdMvsZguwdiHlrSfCoJia0kgkvDfNQkfhze6Uvt8/uiqbHVGHlhZxOgOcfn1Rl
	pS6gDLwsljXlF3a2vD
X-Google-Smtp-Source: AGHT+IECncxzo44p2ti1eqVfThffaFqPYdNBkWZ/Tki6amN33j9mO0FxuVRZFb9kMJ5ZWSnhCBIzXQ==
X-Received: by 2002:a17:907:3cc8:b0:b3e:c7d5:4cb5 with SMTP id a640c23a62f3a-b46e632f76emr337033566b.31.1759304269133;
        Wed, 01 Oct 2025 00:37:49 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3d27759835sm693220566b.13.2025.10.01.00.37.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 00:37:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Oct 2025 09:37:47 +0200
Message-Id: <DD6TBB5CSRII.3SEI8QL9N1ATT@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Rob Clark" <robin.clark@oss.qualcomm.com>,
 <dri-devel@lists.freedesktop.org>
Cc: <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 "Stephan Gerhold" <stephan.gerhold@linaro.org>, "Dmitry Baryshkov"
 <lumag@kernel.org>, "Abhinav Kumar" <abhinav.kumar@linux.dev>, "Jessica
 Zhang" <jessica.zhang@oss.qualcomm.com>, "Sean Paul" <sean@poorly.run>,
 "Marijn Suijten" <marijn.suijten@somainline.org>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "open list"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm: Fix GEM free for imported dma-bufs
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250923140441.746081-1-robin.clark@oss.qualcomm.com>
In-Reply-To: <20250923140441.746081-1-robin.clark@oss.qualcomm.com>

On Tue Sep 23, 2025 at 4:04 PM CEST, Rob Clark wrote:
> Imported dma-bufs also have obj->resv !=3D &obj->_resv.  So we should
> check both this condition in addition to flags for handling the
> _NO_SHARE case.
>
> Fixes this splat that was reported with IRIS video playback:
>
>     ------------[ cut here ]------------
>     WARNING: CPU: 3 PID: 2040 at drivers/gpu/drm/msm/msm_gem.c:1127 msm_g=
em_free_object+0x1f8/0x264 [msm]
>     CPU: 3 UID: 1000 PID: 2040 Comm: .gnome-shell-wr Not tainted 6.17.0-r=
c7 #1 PREEMPT
>     pstate: 81400005 (Nzcv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=3D--)
>     pc : msm_gem_free_object+0x1f8/0x264 [msm]
>     lr : msm_gem_free_object+0x138/0x264 [msm]
>     sp : ffff800092a1bb30
>     x29: ffff800092a1bb80 x28: ffff800092a1bce8 x27: ffffbc702dbdbe08
>     x26: 0000000000000008 x25: 0000000000000009 x24: 00000000000000a6
>     x23: ffff00083c72f850 x22: ffff00083c72f868 x21: ffff00087e69f200
>     x20: ffff00087e69f330 x19: ffff00084d157ae0 x18: 0000000000000000
>     x17: 0000000000000000 x16: ffffbc704bd46b80 x15: 0000ffffd0959540
>     x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
>     x11: ffffbc702e6cdb48 x10: 0000000000000000 x9 : 000000000000003f
>     x8 : ffff800092a1ba90 x7 : 0000000000000000 x6 : 0000000000000020
>     x5 : ffffbc704bd46c40 x4 : fffffdffe102cf60 x3 : 0000000000400032
>     x2 : 0000000000020000 x1 : ffff00087e6978e8 x0 : ffff00087e6977e8
>     Call trace:
>      msm_gem_free_object+0x1f8/0x264 [msm] (P)
>      drm_gem_object_free+0x1c/0x30 [drm]
>      drm_gem_object_handle_put_unlocked+0x138/0x150 [drm]
>      drm_gem_object_release_handle+0x5c/0xcc [drm]
>      drm_gem_handle_delete+0x68/0xbc [drm]
>      drm_gem_close_ioctl+0x34/0x40 [drm]
>      drm_ioctl_kernel+0xc0/0x130 [drm]
>      drm_ioctl+0x360/0x4e0 [drm]
>      __arm64_sys_ioctl+0xac/0x104
>      invoke_syscall+0x48/0x104
>      el0_svc_common.constprop.0+0x40/0xe0
>      do_el0_svc+0x1c/0x28
>      el0_svc+0x34/0xec
>      el0t_64_sync_handler+0xa0/0xe4
>      el0t_64_sync+0x198/0x19c
>     ---[ end trace 0000000000000000 ]---
>     ------------[ cut here ]------------

Also fixes log spam when opening GNOME Camera on Fairphone 5.

Tested-by: Luca Weiss <luca.weiss@fairphone.com>

Regards
Luca

>
> Reported-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> Fixes: de651b6e040b ("drm/msm: Fix refcnt underflow in error path")
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_gem.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.=
c
> index 9f0f5b77f1bd..3aea9b493375 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -1121,12 +1121,16 @@ static void msm_gem_free_object(struct drm_gem_ob=
ject *obj)
>  		put_pages(obj);
>  	}
> =20
> -	if (obj->resv !=3D &obj->_resv) {
> +	/*
> +	 * In error paths, we could end up here before msm_gem_new_handle()
> +	 * has changed obj->resv to point to the shared resv.  In this case,
> +	 * we don't want to drop a ref to the shared r_obj that we haven't
> +	 * taken yet.
> +	 */
> +	if ((msm_obj->flags & MSM_BO_NO_SHARE) && (obj->resv !=3D &obj->_resv))=
 {
>  		struct drm_gem_object *r_obj =3D
>  			container_of(obj->resv, struct drm_gem_object, _resv);
> =20
> -		WARN_ON(!(msm_obj->flags & MSM_BO_NO_SHARE));
> -
>  		/* Drop reference we hold to shared resv obj: */
>  		drm_gem_object_put(r_obj);
>  	}


