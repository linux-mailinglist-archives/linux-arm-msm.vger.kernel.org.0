Return-Path: <linux-arm-msm+bounces-21659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A5D8FBA82
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 19:33:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E66128879B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 17:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6918F149C70;
	Tue,  4 Jun 2024 17:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nj4UnR5c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41D612CD98;
	Tue,  4 Jun 2024 17:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717522401; cv=none; b=uX5FRfCuD6VboTDkFUJvd1G7ndc3zPdPzTUe2TlnLP1UKdjaSI7yQj0iHdHHjCq9rmiz5kRvVT5gJsiJsaN40eG4zD6GIUQzVZRE7KtRqfw2ZtK/gOaFDWAYjGu/I5dmXpd8vB4wivKqaW9FE7UzulvNGqiWnJQMfI+PPaKMWiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717522401; c=relaxed/simple;
	bh=YuGOADg4czSzgm002ZqSN9+p7jih/VzRmBx506gij2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tilOWNWwkXbjM01xXeSRVnmntc2VDOQhZOYi8qS/rkg80qOwY2ZBufvhAyqbfWjUE3iCjwwgcCKabDcNMDrmTLFjvcxxcFOjH63m6rtWajES6lBSr0N29xbpmnXLrha0qPuAlXKTQZIpZ6qXzG9UeVuMj2Zh8f2FlNP78Oe9xYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nj4UnR5c; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-6cc3e134f88so1082119a12.0;
        Tue, 04 Jun 2024 10:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717522399; x=1718127199; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63v6j8hzC+Le93kyoeflCRDkGNVRCCu2mfp5KUaAnVQ=;
        b=nj4UnR5cn/o4ZbnYkfR6aeZ7RPQwU9j3FmyzY/Kkicm5MevTrtbohq+r1HIuNT4vfS
         FfcXf276FhvhZvw6Pw7k/wobqupIqv5p5p+c2Hfziz3T1kVFJS6OlZ7v5GcR/1SoMUL5
         qBMNfjsZ3SxHC+En2erUJnv8cO4ysdjEAJAo5CYwoo32m7AhHl5dzSurok/A9MPIdPr6
         69QLlKRwnI0mOjqmOGJaADs+ehPBIQZIuWyTfdr7XAcNGqI25ZBqRsvHk1c1IL23Hbwv
         hcjwNcGeNm6iaIrxtT8LUVWYvNKJfgXOTALPIudFc14xCVMGAI+J57cIejCIdULi5G3o
         /blg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717522399; x=1718127199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=63v6j8hzC+Le93kyoeflCRDkGNVRCCu2mfp5KUaAnVQ=;
        b=CWyuaxgKTbM6+ut8EXUiqETYK4rdcyqTdqWREUnDM30OX0BWAsFVBYXLl4XuL4mtbw
         15GidBxsgdqf+m5KuvzijQDoIapAH2DGNFU7J84DKi2KP4QIznldqEB8bO4aJIGInmGc
         ISX3dMsyU4qMmofr3RWd/X4cA39jV2hpNi9/Sp81CU8ZPrhXaLcuT9UILzvU4AZ94ypW
         RCXHImN+zSWhUWC0LuJYG9DZG7rJgMi2/FN5FBNMCuw+fOBr5jyBSvdcTibLwapzQLuB
         sJg3j05dvTUi8v03FmQDjr41AE7T2c15RcPql+xQaKNsjb0Q99RB28xP0PRtzaGVWsW9
         KObA==
X-Forwarded-Encrypted: i=1; AJvYcCXZIHTu9CCmDkM5f84vRILfVPPF66mOl97s1RMElltBA/XltAaFgFjEXMavSox/1CWKcN9Ov3cc9a4ZZ8G3mCasEhjy7wZmoXXbVa86TuSG4/nTQFJKB68hPPgNvHrMvb87xKw4bj0//FLb/g==
X-Gm-Message-State: AOJu0YzEt3VjS/5N75fESGsL2AKRLZ09GPy4u+9TWYyWp8j9Rjnjk0xu
	N8oiW+r82ixKMBe/Ukn1f1rVTuP8ac08N8UBA+xHI3qSTT5iBsMZfaEQHJBNY9g1i6Ygzh7Or3+
	IO/NhbdOy96DTOaAu2ZzhBFwxNgx4z4srtwg=
X-Google-Smtp-Source: AGHT+IFL6LnqJEew7ANnyer/NGZs2s8PRUmbYPraWgW0HaR3LUPGwf4aoQwHd/mVUBYU0r0nM3dM2yMs2IsqmijKfOY=
X-Received: by 2002:a17:90b:20d:b0:2bf:6b68:5219 with SMTP id
 98e67ed59e1d1-2c27db63af1mr114715a91.41.1717522399093; Tue, 04 Jun 2024
 10:33:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240604-a505-v1-1-82ee1c04d200@gmail.com> <49fe3b01-4f00-4ffc-80cf-2a0add1ebaad@linaro.org>
 <CAGsSOWV=i2JHsYNvi5EC6q=NoD8v7SiTjbVQhTDLNw35+irTCQ@mail.gmail.com>
 <CAGsSOWV9SRK1VUJiQfavEM1hL0PapxUBG6CNeD+Q=0qPT5ZnSA@mail.gmail.com> <37b0404d-bba5-4a77-ad86-62c6dd308d37@linaro.org>
In-Reply-To: <37b0404d-bba5-4a77-ad86-62c6dd308d37@linaro.org>
From: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>
Date: Tue, 4 Jun 2024 19:33:07 +0200
Message-ID: <CAGsSOWUNN-PRvojvJR-i7wBDz8QRNnaTt19-6G41g7Hdt6RyTQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: Add support for Adreno 505 GPU
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Daniil Titov <daniilt971@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 4, 2024 at 7:06=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linaro.=
org> wrote:
>
>
>
> On 6/4/24 18:45, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wrote:
> > On Tue, Jun 4, 2024 at 2:27=E2=80=AFPM Barnab=C3=A1s Cz=C3=A9m=C3=A1n <=
trabarni@gmail.com> wrote:
> >>
> >> On Tue, Jun 4, 2024 at 1:55=E2=80=AFPM Konrad Dybcio <konrad.dybcio@li=
naro.org> wrote:
> >>>
> >>>
> >>>
> >>> On 6/4/24 02:20, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wrote:
> >>>> From: Daniil Titov <daniilt971@gmail.com>
> >>>>
> >>>> This GPU is found on SoCs such as MSM8937 (450 MHz), MSM8940 (475 MH=
z),
> >>>> SDM439 (650 MHz).
> >>>>
> >>>> Signed-off-by: Daniil Titov <daniilt971@gmail.com>
> >>>> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <trabarni@gmail.com>
> >>>> ---
> >>>
> >>> This all looks very good, just a nit
> >>>
> >>> [...]
> >>>
> >>>> +             /*
> >>>> +              * Increase inactive period to 250 to avoid bouncing
> >>>> +              * the GDSC which appears to make it grumpy
> >>>> +              */
> >>>> +             .inactive_period =3D 250,
> >>>
> >>> Are you sure this is actually necessary?
> >> Every A5XX GPU is using the same value, but i have never tried with
> >> DRM_MSM_INACTIVE_PERIOD.
> > This was the original patch
> > https://lore.kernel.org/all/20180507224750.9383-1-jcrouse@codeaurora.or=
g/
> > where the inactive period was increased for a530. I cannot test
> > suspend on msm8937 yet.
>
> The suspend here refers to device suspend, not system suspend. Adreno
> goes into device suspend every time you stop using it, i.e. after the
> rendering is done and there's no more work to do.
>
> I suppose a good test scenario here would be to keep running and closing
> kmscube in a rapid fashion and checking if the GPU starts crashing for
> unknown reasons (the dmesg would denote that)
>
I have checked on a505 and a506 with this small script
while true; do kmscube; kill kmscube; done
none of them crashing, so i am going to change it.
> > I can check on msm8953 with a506 maybe if a506 works fine with
> > DRM_MSM_INACTIVE_PERIOD
> > then a505 would be fine with it also.
>
> The more testing the merrier :)
>
> Konrad

