Return-Path: <linux-arm-msm+bounces-21682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A1C8FBF56
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 00:55:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB50F1F23040
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 22:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A9871422C2;
	Tue,  4 Jun 2024 22:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZnApPHaM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558AD199A2
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jun 2024 22:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717541708; cv=none; b=eXpdhP2+nuaB5ciq2Ww6warZRHRYSqYixFfwClbKMbQF9YMhmVManikXhnPaDvqAay0i2YMWIEPsXUDAsQHSIJU9vEmU9uYtMVS0SkEH8/rtqB3lFMbGV8tRsUIka01ZVmrb2VYEUDiu9B5HGiZ+bSZbYmG0KcUSRq3Nw9hB0Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717541708; c=relaxed/simple;
	bh=qs0o9k4xY4qdMbOkLol5o5+aouROcWNGqNIF7tevWvY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rwunLESPUnlm8sJ2sanQAL4wvJmRv4Yde252r8dt2IPZEDQsRcT4I6nFYALctYbVcs80PubGJBa3cNQuLy5ZcNtJbXtsC8nK0TNSLFHa3EIqnL9itHucA2QqRbAPD56etXx4fihXM3BH44U6Ts6s0jB5zhDS1UPofsRYUSN44jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZnApPHaM; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-6bfd4b88608so4553260a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2024 15:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717541705; x=1718146505; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SQevM+iAWilYVFaIm59IJ4p3nypKMOp+UN8VS5oKnP0=;
        b=ZnApPHaMxw6gECHs9FrI7m8oATs0KlL0jjeiG3vTtBbK4zbvlLRny5qwOxk8434kQo
         OBz0MsTgR/l9sZeZUnz5JjjkE6gX9HHBVEY89vwziLMiufGcSNfh13VHLuHKuhob6AdU
         tA2QGWqlF9T9JRNe+SC2lkHK8kep0s8tTwSeoqHl/YqdqUhKpLGuVZZWmViQdgJF4EIQ
         XvBM7rq+vwqzdWRwV1GP2LD7PBxUTmVHwm2vz+V2mnqZq1dRprV/EUFjGs/oOz6EjjXn
         lF+mA2H+MsIq5LagjhhTfIbVEqCkSSlasrnrBIf7rt+viQRp2voUoTXe6FZARXy8sjWP
         xZKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717541705; x=1718146505;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SQevM+iAWilYVFaIm59IJ4p3nypKMOp+UN8VS5oKnP0=;
        b=kifFHXQTvUgoXTMUGxOKro2OmgCBObgw/y7hw0FLzAvdecCFTWAxHyz+ClT4HDGF/M
         yTVRpPHlwtvc8ZNsUWTTHnply1CJ2vQkTXUFyOF9lUF426hncrLhzYm1bcSplJMrvmq7
         vMAiGs5XOtsBuT2jtECPqyUDE2xsbInR1kTlXFtPlKMdo4cN1EuBoZk2j7jDvog48PoS
         B+gna4ugElSL9tRUDXFp3VfBChf5W1KGq6ywG9/G65oUGsI2/qcsMrpyS9ea+XvQhIW4
         KtxyuZl7QUP8d9jK3PBlkBdx40UzE6dFCnVX0dKi3UhtjeJuqmBghEd0feDF3YXJZ/Mp
         7sXw==
X-Forwarded-Encrypted: i=1; AJvYcCVumrNt0DfnSxEjv3tUrvNJotXVPmQ8yLO8+dX2wL/yVnL4IRAjLMdDwz7L93BOVFP0xKa4JVAXaZHZu3j4sSWKVS15VLzI+PYl9FFHMg==
X-Gm-Message-State: AOJu0YzNXMtDhDWC+k1Vv2t+jI7Hg12pdXLGXTm+SaiEnSwYDI9kaSPI
	jUBrK5m/fjP1pl8pej85dw7tJpoAcTzhJhAFVSOJhMNFAl8nSfjuoOXyjOc/fFTkgA9uK/JeIdE
	ONfg/DTquhSJZvgV6OcuAiU+fX0ZODTA0EALaTQ==
X-Google-Smtp-Source: AGHT+IEdxJwvadlhULTZyWilBXhj3SiFyCHIB/1Em0OwEwBh1H9runBVla3t1ChZKYRpSeG0b/daRqpR7likHUus/TA=
X-Received: by 2002:a17:90a:408f:b0:2bd:f439:546b with SMTP id
 98e67ed59e1d1-2c27db0f54amr812983a91.19.1717541705422; Tue, 04 Jun 2024
 15:55:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240604214018.238153-1-pbrobinson@gmail.com> <CAA8EJpr2ZKugjwYzFUq3Rqjdm6DO-PiZEfiuBjxSnJDmRcMRdw@mail.gmail.com>
 <CALeDE9O9QmX2YUvMxbfVNcC+nmNNh2dgQkLvMqNaQNr+3S9Beg@mail.gmail.com>
In-Reply-To: <CALeDE9O9QmX2YUvMxbfVNcC+nmNNh2dgQkLvMqNaQNr+3S9Beg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 5 Jun 2024 01:54:52 +0300
Message-ID: <CAA8EJpomhPJ9o-tWKRmuCzbZDn7CA4qkYMFWYs9qaGWOczq=sg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: Add some missing MODULE_FIRMWARE entries
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Jun 2024 at 01:30, Peter Robinson <pbrobinson@gmail.com> wrote:
>
> On Tue, 4 Jun 2024 at 23:18, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Wed, 5 Jun 2024 at 00:40, Peter Robinson <pbrobinson@gmail.com> wrote:
> > >
> > > Add missing MODULE_FIRMWARE for firmware in linux-firmware,
> > > this is needed for automatically adding firmware to things
> > > like initrds when the drivers are built as modules. This is
> > > useful for devices like the X13s and the RBx devices on
> > > general distros.
> > >
> > > Fixes: 5e7665b5e484b ("drm/msm/adreno: Add Adreno A690 support")
> > > Fixes: 18397519cb622 ("drm/msm/adreno: Add A702 support")
> > > Fixes: 3e7042ba87da ("drm/msm/adreno: Add ZAP firmware name to A635")
> > > Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> > > ---
> > >  drivers/gpu/drm/msm/adreno/adreno_device.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > > index c3703a51287b4..fede5159e7f5b 100644
> > > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > > @@ -609,8 +609,11 @@ MODULE_FIRMWARE("qcom/a650_gmu.bin");
> > >  MODULE_FIRMWARE("qcom/a650_sqe.fw");
> > >  MODULE_FIRMWARE("qcom/a660_gmu.bin");
> > >  MODULE_FIRMWARE("qcom/a660_sqe.fw");
> > > +MODULE_FIRMWARE("qcom/a660_zap.mbn");
> >
> > -ENOSUCHFILE. It should qcom/particular-SoC/a660_zap.mbn
>
> > > +MODULE_FIRMWARE("qcom/a702_sqe.fw");
> > >  MODULE_FIRMWARE("qcom/leia_pfp_470.fw");
> > >  MODULE_FIRMWARE("qcom/leia_pm4_470.fw");
> > > +MODULE_FIRMWARE("qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn");
> >
> > I'm a bit sceptical here. Each device has its own zap MBN file (this
> > one is also a fancy named a690_zap.mbn).  Do we want to list all such
> > files? Consider all the vendors, which are open-source / Linux
> > friendly, like FairPhone, OnePlus, etc.
>
> That's what's in linux-firmware, I would have thought they would be
> SoC specific as opposed to device specific, but that's not what we
> currently have, are we supposed to have devices that selectively work
> based on what firmware they have?

The firmware is signed with the manufacturer's key. End-user devices
verify the signature while loading the firmware and decline firmware
without vendor's signature.

>
> > >  MODULE_FIRMWARE("qcom/yamato_pfp.fw");
> > >  MODULE_FIRMWARE("qcom/yamato_pm4.fw");



-- 
With best wishes
Dmitry

