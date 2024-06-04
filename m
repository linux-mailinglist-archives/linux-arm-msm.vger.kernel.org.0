Return-Path: <linux-arm-msm+bounces-21663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A77FE8FBAE0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 19:47:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA9081C24ADA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 17:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 101BC149E03;
	Tue,  4 Jun 2024 17:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DvlyPngi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90ACF14A622;
	Tue,  4 Jun 2024 17:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717523156; cv=none; b=t2WmXg5nkfuxYJHvrcOqWipBthB8TRZilUAKFOk09RHeW0lcRBqrstcY7FOVx6v+B70KjX95sByKeYlLUZ3HTFZov23nXzYTZ+8jJMcIGIwF8aaOms7yd1aCQ/I9KxicAbYto1Xz7irWOhS+L1iiU1kCyRtYxitUawB0TfnvyyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717523156; c=relaxed/simple;
	bh=mY9B1uaFHC1uBb6M8qKUIpIxpKwXBMGQK2wfXWjLLHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aCt8gwpC0xgkUZvABINxaakbtTMlMQoJgK6vKWTT87Sne9cCRqjSouzWQLrLK+7nZ9Y/pUxU4fgmdmRtK+kq4YybTZmw4wMnmHcZ5K0ziKITuxeE6k2iyPRbzutoHOt03AF8p1wsi58izrs2/u3KBMeSVWKzq2QMUEXUY8OOK1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DvlyPngi; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-6c7df306e86so2512318a12.2;
        Tue, 04 Jun 2024 10:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717523154; x=1718127954; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xan6JHlbzoN/Cx1uze2aPQDqzU0Q2XkBrsIeaRmv2Pk=;
        b=DvlyPngi1Eg17DuoxaaGn5v1+ce9ufOrNLywWHuNzJWNno0UL9I8JWKTVd94xOfTY9
         5DyoiH8VCnS430AloCLfWrPqgSkk30GG4pDKeTVMxVdLYIkFPbN+webFhd+SyDIGG37q
         hZ4Z2oWwttVoukVz4oHfnutitSQpoE29L/GC8G0RCCl45jU9PI8YZ9PHG1cz0UEF2I8L
         A+hVtlMuKo3wB2QRIokyzsMImWnFh46RCmkiWq+2Ocb3qwh/gmp/TwYbXW+qT1zUSNke
         lKZVdDNJwkok32dA22KhHQ7InLdfURpz/To/+U5Z5mKZK3K6oqgVOdsi9YUbjOXH6q6q
         S00A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717523154; x=1718127954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xan6JHlbzoN/Cx1uze2aPQDqzU0Q2XkBrsIeaRmv2Pk=;
        b=QYWqq/cPox7APCSNArdo2LAK9WB1MOf+yzQObWfAaC6yalUhvSZ9N1IuEP+V6aSBym
         FmTDFJ5Y8gZ8+09QbzTlYwaGOZLXH1fQIwwk4bRKG7sb7pJKdaWGV/MD0BmFqf6EkPCJ
         KgcteDUlGV331D6be5w2bRP2UsrPnBLtX5XYxJ3PqEbkwCQGpq0666GUe5Yoak73gKF+
         /IaO3IGPSNdHzqXQvLZqvK5b4h6+Xez30hWxwp016A8BP6FERg6KIBZl997R1P1MNrya
         y40aXq0scunXG0X2VLREtMKfpumtxODohH4bcw2V1pkdBpK8aZPJL9fz1nTu20y4an3p
         57DA==
X-Forwarded-Encrypted: i=1; AJvYcCV1yiyTKUgirxNoITxGCY4fojxkObeCHvP57ZUVhIMXpXaJFjp7vxqjBSFLpE9gqA1ELlVCaKkbwKj2uXyMVxKq/7BOxtyeqN9mD38gXrD/nbOQ/i8hzgKLJpwJ2g55rU3F0H7Msmhid0Qbrg==
X-Gm-Message-State: AOJu0YwPYQhL3QjFEwQud/WFoBxAd8xQbBSltKIVMLsUcmaHed4+voDq
	yFLC6E4bdDXEpIs0zWdd4fHLMXRrbLMO8vQfF85A1b6bu+9OWg7NGyNXNhWQcsHxU55x8ykYiVr
	fbrxENkHTv64PfpPAJp6zwWGiqvk=
X-Google-Smtp-Source: AGHT+IF4SDAMREgP/6f9usTqurOcEnWyWau/glbHaaRqYBypCPYcFQHO0oQhL/xmMhu68goaifs8OIpZRozunJtrC6A=
X-Received: by 2002:a17:90b:f8c:b0:2bd:fa34:a613 with SMTP id
 98e67ed59e1d1-2c27db02ca2mr149430a91.4.1717523153741; Tue, 04 Jun 2024
 10:45:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240604-a505-v1-1-82ee1c04d200@gmail.com> <49fe3b01-4f00-4ffc-80cf-2a0add1ebaad@linaro.org>
 <CAGsSOWV=i2JHsYNvi5EC6q=NoD8v7SiTjbVQhTDLNw35+irTCQ@mail.gmail.com>
 <CAGsSOWV9SRK1VUJiQfavEM1hL0PapxUBG6CNeD+Q=0qPT5ZnSA@mail.gmail.com>
 <37b0404d-bba5-4a77-ad86-62c6dd308d37@linaro.org> <CAGsSOWUNN-PRvojvJR-i7wBDz8QRNnaTt19-6G41g7Hdt6RyTQ@mail.gmail.com>
 <d7cf1848-d39b-43f1-bcd5-b917e0289fcf@linaro.org>
In-Reply-To: <d7cf1848-d39b-43f1-bcd5-b917e0289fcf@linaro.org>
From: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>
Date: Tue, 4 Jun 2024 19:45:42 +0200
Message-ID: <CAGsSOWVoO2JTcWNR0GH=OeyH8EzqOr64Bv=FZTrbSu6ZbD-=Eg@mail.gmail.com>
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

On Tue, Jun 4, 2024 at 7:38=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linaro.=
org> wrote:
>
>
>
> On 6/4/24 19:33, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wrote:
> > On Tue, Jun 4, 2024 at 7:06=E2=80=AFPM Konrad Dybcio <konrad.dybcio@lin=
aro.org> wrote:
> >>
> >>
> >>
> >> On 6/4/24 18:45, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wrote:
> >>> On Tue, Jun 4, 2024 at 2:27=E2=80=AFPM Barnab=C3=A1s Cz=C3=A9m=C3=A1n=
 <trabarni@gmail.com> wrote:
> >>>>
> >>>> On Tue, Jun 4, 2024 at 1:55=E2=80=AFPM Konrad Dybcio <konrad.dybcio@=
linaro.org> wrote:
> >>>>>
> >>>>>
> >>>>>
> >>>>> On 6/4/24 02:20, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wrote:
> >>>>>> From: Daniil Titov <daniilt971@gmail.com>
> >>>>>>
> >>>>>> This GPU is found on SoCs such as MSM8937 (450 MHz), MSM8940 (475 =
MHz),
> >>>>>> SDM439 (650 MHz).
> >>>>>>
> >>>>>> Signed-off-by: Daniil Titov <daniilt971@gmail.com>
> >>>>>> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <trabarni@gmail.com>
> >>>>>> ---
> >>>>>
> >>>>> This all looks very good, just a nit
> >>>>>
> >>>>> [...]
> >>>>>
> >>>>>> +             /*
> >>>>>> +              * Increase inactive period to 250 to avoid bouncing
> >>>>>> +              * the GDSC which appears to make it grumpy
> >>>>>> +              */
> >>>>>> +             .inactive_period =3D 250,
> >>>>>
> >>>>> Are you sure this is actually necessary?
> >>>> Every A5XX GPU is using the same value, but i have never tried with
> >>>> DRM_MSM_INACTIVE_PERIOD.
> >>> This was the original patch
> >>> https://lore.kernel.org/all/20180507224750.9383-1-jcrouse@codeaurora.=
org/
> >>> where the inactive period was increased for a530. I cannot test
> >>> suspend on msm8937 yet.
> >>
> >> The suspend here refers to device suspend, not system suspend. Adreno
> >> goes into device suspend every time you stop using it, i.e. after the
> >> rendering is done and there's no more work to do.
> >>
> >> I suppose a good test scenario here would be to keep running and closi=
ng
> >> kmscube in a rapid fashion and checking if the GPU starts crashing for
> >> unknown reasons (the dmesg would denote that)
> >>
> > I have checked on a505 and a506 with this small script
> > while true; do kmscube; kill kmscube; done
> > none of them crashing, so i am going to change it.
>
> Hmm.. not sure if it actually idled when tested in a tight loop.. If you'=
re
> running bash, try "while true; do kmscube &; sleep 0.08; pkill -f kmscube=
; sleep 0.08;done"
>
I see no crash
> Konrad

