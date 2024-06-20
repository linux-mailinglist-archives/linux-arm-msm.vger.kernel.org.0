Return-Path: <linux-arm-msm+bounces-23413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7E3910EE5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 19:36:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB5961C21F38
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 17:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F334A1B4C34;
	Thu, 20 Jun 2024 17:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TeNGD9bJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCB61B47A1
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 17:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718904739; cv=none; b=YmUI/dykxjp3l8ZSwVteSRG1dM2UKtKtNpoUByHiKlV9RWkJslWU7lqY/WxyLms7KI9c4fqOJ5wQMagpCnQedT/dtTR+FpqDh7pMprEl21qzJu4epuUpCOJ/X8UaaAXNJemlyZhYJhphbeNtH15jV1Gb6E+XTfdBtUtJ1Mo57e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718904739; c=relaxed/simple;
	bh=1pkJ0SAdRmBLJW8/K7nk1y2Opp04Uw+7e/Ih7p7SKQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S2vGgfvCPYynmqzTty5Sz0byQWOomQCWZPI+rrdRxNgeILhxD0hEtFcNy3FMUzFG94EhCl0ItonvdKTic7XxOu/EtmXcz/0UTl03inF3fBd5LU+4kjv9XwmjdmjLAMu5pSD67bcWekBUAVoxVnaHYLdUxK0YMB70VMOpQD4gxUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TeNGD9bJ; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-44116be80ecso5017121cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 10:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718904737; x=1719509537; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zjqjdKsj/gQuqVLzp1VmXUWD1/JaxzvgTsxrPQZfUt4=;
        b=TeNGD9bJSS0U7ctlnXoeJtP0or/SfN0PvOX5V/5j3JAqkL7MIKDK911DAIkpZUpWB2
         6795iYL3VJPcdJPvFwrEQj09Gh22ktOngWoISYXoMyzRbTX/4HD47ck3TRfC4+DkoMUL
         FuXOq/uJ3YPyK1ohFRMtjgIVUMP/c4SQ8IHEmwQYZkWYuFASs0GTP5JClyP6qS2frugV
         yZ5egWathJpIVkiqQ7X8djt9Gs0MT5xVZJrL7geN1X3bt5JR5m662x2xsAvtcj/crfaf
         UHqxchNZJ5oYFVQkdncJlHaIOshmbc44qiudSEx0u5j1n26aDdcIfVFGLkAqofb2E7dI
         WJig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718904737; x=1719509537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zjqjdKsj/gQuqVLzp1VmXUWD1/JaxzvgTsxrPQZfUt4=;
        b=ICc1nGfmgD7vUSyZ5YuiZWsBRrdyvNAkQUeRtLfkJNQfIe+1mxNKEKDrE1+VFyTZMK
         6MAQpH24wTSEIEQkNxMp6lXuDZbiw8ULV5PhtZWYXziTFAnwitz2BYFPfZROa4z7x9bd
         aNKc3Viel/eMTl9mKzoxFChUsuVcAlPFIVaW7LJkgd5EHGrLw8cC24+P2Nx49abV6o6h
         hel0khtP1yE3iW1B3dQJINDeYcHDEdLzKGy80RyAzYoxE8eqb6YLL+wvZkcfjCxlDRuT
         O9AdYl5DpTvvj8hZu/IEnkiuL/fCErfX/VYnFHxBmeFjG15PpNkZsBG8S4L+GXQ4wyPK
         CRmg==
X-Forwarded-Encrypted: i=1; AJvYcCXyvR+XZyMHh9o+RPUCO6w7DCfYFYFjhMmZlUtBfJTaUZM1T1JgVAFjaMeZNEqWEy1N6KqCSHcUtLtkQjUmkkKLRKRqqzL3XiYctDG+5A==
X-Gm-Message-State: AOJu0YwdTDq4EMUSfxDXLDITdOaS6s403nJLXy3DKFzTL4TeHevmJ5zg
	GTl/GNa5Btx/LLp22LRAEv+3qTh0fejD0SPFC7IrYChTmnE3t18qdPcj871lwwEdg5gwZPqqluY
	V7b2jUfBVgi/dk4MpLoXVZEp6jis=
X-Google-Smtp-Source: AGHT+IGYXxpQRTAXIlfg2cIYukw1X66BafXHZ7WrzLUkjbprXa5hdULcmMNmfQXEjJlL4mxB44nhT/XhdQpCtiyfcVc=
X-Received: by 2002:ac8:588f:0:b0:43e:26c1:1244 with SMTP id
 d75a77b69052e-444a7ac0548mr66151531cf.50.1718904737272; Thu, 20 Jun 2024
 10:32:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <64ec16b9-c680-408c-b547-5debae2f7f87@freebox.fr>
 <dkmtnizbuyswyvocczjfgmhsuedawliabycig4urw42a65hu3j@jglxzumuzamd> <a9e4dba6-2317-4b6f-968f-d607937f5157@freebox.fr>
In-Reply-To: <a9e4dba6-2317-4b6f-968f-d607937f5157@freebox.fr>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 20 Jun 2024 10:32:04 -0700
Message-ID: <CAF6AEGtvHzF-KNyMwmysz7idLYE7XuXhDnBLdQFFhEdgYo6oqQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: log iommu init failure
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	MSM <linux-arm-msm@vger.kernel.org>, freedreno@lists.freedesktop.org, 
	Sean Paul <sean@poorly.run>, Bryan O Donoghue <bryan.odonoghue@linaro.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, Pierre-Hugues Husson <phhusson@freebox.fr>, 
	Arnaud Vrac <avrac@freebox.fr>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 30, 2024 at 2:48=E2=80=AFAM Marc Gonzalez <mgonzalez@freebox.fr=
> wrote:
>
> On 16/05/2024 10:43, Marijn Suijten wrote:
>
> > On 2024-05-15 17:09:02, Marc Gonzalez wrote:
> >
> >> When create_address_space() fails (e.g. when smmu node is disabled)

Note that smmu support is going to become a hard dependency with the
drm_gpuvm/VM_BIND conversion.. which I think means we should never get
far enough to hit this error path..

BR,
-R

> >> msm_gpu_init() silently fails:
> >>
> >> msm_dpu c901000.display-controller: failed to load adreno gpu
> >> msm_dpu c901000.display-controller: failed to bind 5000000.gpu (ops a3=
xx_ops): -19
> >>
> >> Log create_address_space() failure.
> >>
> >> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> >
> > Thanks!
> >
> > Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
> >
> > And, after checking the below:
> >
> > Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> >
> >> ---
> >>  drivers/gpu/drm/msm/msm_gpu.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_g=
pu.c
> >> index 655002b21b0d5..f1e692866cc38 100644
> >> --- a/drivers/gpu/drm/msm/msm_gpu.c
> >> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> >> @@ -941,6 +941,7 @@ int msm_gpu_init(struct drm_device *drm, struct pl=
atform_device *pdev,
> >>              DRM_DEV_INFO(drm->dev, "%s: no IOMMU, fallback to VRAM ca=
rveout!\n", name);
> >>      else if (IS_ERR(gpu->aspace)) {
> >>              ret =3D PTR_ERR(gpu->aspace);
> >> +            DRM_DEV_ERROR(drm->dev, "could not create address space: =
%d\n", ret);
> >
> > Maybe this wasn't done before because this also includes `-EPROBE_DEFER=
`, so you
> > might want to wrap this in
> >
> >       if (ret !=3D -EPROBE_DEFER)
> >               DRM_DEV_ERROR...
> >
> > But then dev_err_probe() was built specifically to be less verbose abou=
t this
> > (and track defer reasons).  While this is an init and not probe functio=
n, it's
> > called from struct component_ops->bind where it should be okay to call =
that,
> > as long as you have access to the component `struct device*` and not it=
s master
> > (IIRC).
>
>
> Hello Marijn,
>
> I have moved on to HDMI.
>
> Feel free to take full ownership of this submission,
> as I won't have the energy to get it accepted.
>
> Regards,
>
> Marc
>

