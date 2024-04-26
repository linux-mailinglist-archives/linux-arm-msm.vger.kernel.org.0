Return-Path: <linux-arm-msm+bounces-18671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD6C8B3871
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Apr 2024 15:29:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C154CB22146
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Apr 2024 13:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8023B146D62;
	Fri, 26 Apr 2024 13:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NGUvacyR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41B513E88A
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Apr 2024 13:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714138146; cv=none; b=l88UxwMMaUi4uGzL6JQZEWX+xDtgi2k1FH35Esjn9ytqoiF4V4EU/atEzoa3IsnTJ7WzSt6AM1dESk0idy1afkCPWwzH5nkLH6r+slDZFpXwMH6V+EtKLqkDp9kWcyTOANK7Z8rLcRDq1+5N8O9DYHjFijTy8KSI4wemDUL2Irg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714138146; c=relaxed/simple;
	bh=7i4oE0jRa8Nu5UzIA87lVE1ZH/g86IgGAs7xSlrmK7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h1QaXGy6L6GoTawlH2m24akVZBIdor59h2BdIGe3BtASsuaxmwcS1zdeFQSJYg1a8ZTWZUorl4vSF9/yIvh+mBlBkklJTen6ynGkAvgNADOz/uaRtxsBrWw78+eI1F0ovTO/tzbJEwET+FGuAydr/rxp+Eo8AwRRbLCam4KiNRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NGUvacyR; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-de462979e00so2278192276.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Apr 2024 06:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714138144; x=1714742944; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N0CMZ7aXE460m+kKz/vg4ifubFL7ylhjlQ8n5GX0OcQ=;
        b=NGUvacyR05tJOnjlqnBg/NSv5AXsO/dWdxJaUh5dtPAcEXYvw+eMMIHNRTI9ni9/6J
         MB5JA1fnkcqeDKwFR1hc/eDbvK6d1EzF5t9xx4JrtYaKzYpVfrEL2qm7gbYMDAmkWgvf
         YH1dE6vMqyvMg5CU6P4n3H5YRpiTgAhFjBOn41oAbCtpwg1iCz0aDu9cQQyJeyX9/MOg
         g2zopZbuO74d3tlR2opTznZhsEffRxItusTmKE7KXPEnqv/gtKKXuPtnxfewD346CsnS
         O5lFf6C8UpeG3su5emdjfGioOfw2S0i1QxIYAidheM+/oXjmlYv894chZIqQhhXFnk54
         UYqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714138144; x=1714742944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N0CMZ7aXE460m+kKz/vg4ifubFL7ylhjlQ8n5GX0OcQ=;
        b=vw7EXdQI4zdUfOZ4kE5E2O985G8iurTkV/80kOJJyOQ2GLf8osbJHzYH+iAah6Z/EU
         R7QpX2gnOk8UZcPDWHtUIYlyVq3i1C9Z4z+afEdUQ9eq5z5NGnSXSZHpcnrW7hN6mDSj
         93y+1gJJF8MrHKKuB5HhLzbZYST2ojPu7M/+TEMSFyst7aeDn38Zxul0C6BsEYnLeVLn
         a38FQfFJkNx9l20Wi5VmkLASLjFx3iZPQSLRjaW04z4d6+2+3q5tErAn9+w++Zecnx1J
         3EEKb6x+RMWFRWBTI0+sOjxLmdswqJbwxFrkK8bpGrzfwbjrpQ7tc/WW4B9rM/X5hPVO
         sjFA==
X-Forwarded-Encrypted: i=1; AJvYcCWKq42eSzP/y/cvI8BDwccMqBAEKvsDoiaBEghkvDWc5VTs6ALSE05fsGh9hAzVfqq3K4tsrxcu8o74g7J081ukhf40duSHRd61pe33Ew==
X-Gm-Message-State: AOJu0YxHwmodcnrTS57TXYj3Moxq3TnrHyc/QoFw480iLJCHrn+KVd/p
	EvtAD57m3Ah/XU1GTx6FdejcM4vu5AHqtAfICjJVWqRtLUhIDLN2j2EQKh6P+ioo25SyzgFPQET
	75g8vO3sFUFCxUhtKWeISHW8vPwP8BHVYYO8a/w==
X-Google-Smtp-Source: AGHT+IGW/Gvy4yOANGsynKrpwA7LLg/Jq9vYRjYyTxAX6TkntO1ankWq4yVEswu+Tsv7O0Fks+gbkMDSCT0Ha3QBREU=
X-Received: by 2002:a25:8591:0:b0:de5:416a:f9ab with SMTP id
 x17-20020a258591000000b00de5416af9abmr2481798ybk.25.1714138143967; Fri, 26
 Apr 2024 06:29:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240425134354.1233862-1-cwabbott0@gmail.com> <20240425134354.1233862-5-cwabbott0@gmail.com>
 <CAA8EJpp-OVceLDK4TuqQERY53O-mU+AhEyjNUOnNc9PUhcUm0A@mail.gmail.com> <CAF6AEGu-sXnz1A_abzTByQHJMEZOJtLAn7iH=VaVwqJ21DZqWg@mail.gmail.com>
In-Reply-To: <CAF6AEGu-sXnz1A_abzTByQHJMEZOJtLAn7iH=VaVwqJ21DZqWg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Apr 2024 16:28:52 +0300
Message-ID: <CAA8EJposs8yC45oFR9gHrue8yq=d8HTqYb=8G96Nhj_12EjQLQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/msm/a7xx: Initialize a750 "software fuse"
To: Rob Clark <robdclark@gmail.com>
Cc: Connor Abbott <cwabbott0@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 26 Apr 2024 at 15:46, Rob Clark <robdclark@gmail.com> wrote:
>
> On Thu, Apr 25, 2024 at 4:02=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Thu, 25 Apr 2024 at 16:44, Connor Abbott <cwabbott0@gmail.com> wrote=
:
> > >
> > > On all Qualcomm platforms with a7xx GPUs, qcom_scm provides a method =
to
> > > initialize cx_mem. Copy this from downstream (minus BCL which we
> > > currently don't support). On a750, this includes a new "fuse" registe=
r
> > > which can be used by qcom_scm to fuse off certain features like
> > > raytracing in software. The fuse is default off, and is initialized b=
y
> > > calling the method. Afterwards we have to read it to find out which
> > > features were enabled.
> > >
> > > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > > ---
> > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 89 +++++++++++++++++++++++=
+-
> > >  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 +
> > >  2 files changed, 90 insertions(+), 1 deletion(-)
> > >

[...]

> > > +               gpu_req |=3D QCOM_SCM_GPU_TSENSE_EN_REQ;
> > > +
> > > +       ret =3D qcom_scm_gpu_init_regs(gpu_req);
> > > +       if (ret)
> > > +               return ret;
> > > +
> > > +       /* On a750 raytracing may be disabled by the firmware, find o=
ut whether
> > > +        * that's the case. The scm call above sets the fuse register=
.
> > > +        */
> > > +       if (adreno_is_a750(adreno_gpu)) {
> > > +               fuse_val =3D a6xx_llc_read(a6xx_gpu, REG_A7XX_CX_MISC=
_SW_FUSE_VALUE);
> >
> > This register isn't accessible with the current sm8650.dtsi. Since DT
> > and driver are going through different trees, please add safety guards
> > here, so that the driver doesn't crash if used with older dtsi
> > (not to mention that dts is considered to be an ABI and newer kernels
> > are supposed not to break with older DT files).
>
> I'd be happy if older kernels consistently worked with newer dtb, the
> other direction is too much to ask.

Well, we guarantee that newer kernels work with older dts.

>  If necessary we can ask for ack
> to land the dts fix thru msm-next somehow, but since the gpu is newly
> enabled device landing in the same merge window I think that is not
> necessary.

This might work too.

--=20
With best wishes
Dmitry

