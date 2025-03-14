Return-Path: <linux-arm-msm+bounces-51509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D165A61DAA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 22:09:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3C9518878EC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 21:09:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C59371C54AA;
	Fri, 14 Mar 2025 21:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lvvaG+Id"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AFD1A5B8F;
	Fri, 14 Mar 2025 21:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741986541; cv=none; b=W6egNIBksVsjVhwSywjt2IHoyZgYNym1eeEbTUOagtnpm/PuL/4L3nbYY7s6EBcVQQXB3U/396aSj64TtxepPlI/OKnr3IVz5y4amZc+c04QELGzs2T4KlDGm6kA3EC9a7X48CiT0V3B9NgAoE3o0IWCkVR65+vooCFJaAZi8D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741986541; c=relaxed/simple;
	bh=TLAXK8F0Zg+uOm7YobOgE1LYNRmrAqUPZYhBWDVwNVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H3+zLOOG/SaBVfjvR0YQPb+HHQ2hrGVQX1E56uEWa/xBTguzi94fYLSBPC2/L+fNgDkFmedd/w2EF7mgZNdaWdClY60UgCdsjXrmAt5UzT98MG+2ozOIyPCfpNoqRRDpYgvHDIarKn7vyeKLXI4e56w7gJmPtk2S90apFH29CzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lvvaG+Id; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3d03ac846a7so9264965ab.2;
        Fri, 14 Mar 2025 14:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741986539; x=1742591339; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BkRLpqMUrdRcSP/upvwA3EN8NMAu0/tqM1GHILgEdFw=;
        b=lvvaG+Idedc3D9mkx60cQIKzlIhTUi/r507glVQbxHGAZ7ojFYjysBD8dpzTJ1ERRt
         9iuz3jfOunbm8buw6+xyFPlloH00yPMgxf+FXH8suA1uB4OnDhaVYpDlP5dqL8arOkm8
         ojQs6YjOR0irMpaKziIGXydk1XbRCg3Q+WbTTIKwONbZ36BHmX7iQ9R2yGrPzFET1Wwk
         SnUgKsqjXLSeww2RCDuxWY+2CG/pNtYg3T2vFEcC8GqozUgro9GhLl9/K/T2+UQx+gkL
         GD1X8LlVCk5ORgiH+FwPjTwY6Gpc9zYfvfhWmKmBe3mwtTi15N8mURynujctfWgar/TV
         OADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741986539; x=1742591339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BkRLpqMUrdRcSP/upvwA3EN8NMAu0/tqM1GHILgEdFw=;
        b=eqN3yvowcyWBxQBp0supKPGGPEwFbNXGvjLnw1ke9Y3Sz4GOXgPu+rhznPcO76sGON
         JUWQkUEUtI9OtH0tMYHoWQTZw1KFn8znQlQzfmtIZwikby7bFMjOSy1spUcHTJ38mpiX
         ostClq8BMqF/ZfLvEGmjP2Seu2mlJY+M0mDIqQ5rq/JUYNKOYQXhaWkSx2yBtd4Wigo+
         FPHXpeO5YC+XCF5XspyeDfl/Uc4fUQR9b3z15YCx2Otyy9Ng4bznnUqvSNZtCIBgkijC
         GdAaavYf4L1s3X83HspFESPyAELK2vGfaN5qtdKV1mrvO5Nakl71+JujsTS7alEOWm89
         8KiA==
X-Forwarded-Encrypted: i=1; AJvYcCUvz7yYOq4htDjZyDhvgqUgbZF74orQsz85EJmahCSWQJ0qOuySsghKUYnX8xPSnzmedeSQbJmycx5ZQwHh@vger.kernel.org, AJvYcCVyfM05qnMz/sYx23tlLgCkPZ4PDLv4+TreuWJk4fEEu8hfxPBd/1b53pRaN+IRGaja6nl+FTEWHt8XO7s1@vger.kernel.org
X-Gm-Message-State: AOJu0YyM6Qb9FsXazLi1tgmnb0A8r+Nzl4dq4y4Nch046oY1LgZYX/0N
	hPkhTrfkvbMS02o/6qDCfHb+ulLSg20XqnLe8j1YRGuedJ0eeZL8jVSrMPDnZhX8Ei2m/IKVl/8
	gecziE8iAtDiQo9r+LYHDy+jEcqL8qg==
X-Gm-Gg: ASbGncvlMTcdPEhcToJysMx1WDiphcP46OsxXEyb4ePdhDEIBKGjFU1nvlA+EZUWmYg
	6i7m4gXbbq9DADWDZvNYFx7v5/rAsY6tnLlyTPKEDncelRWPlMR2ZkL1OzGaYfzANesrBiJ0luP
	ZK/1Vi/DPEeZWQLYKuCwdqp1OSn7/+gaXkmOT26Nu3XcQDWZdtQM/s0gyg
X-Google-Smtp-Source: AGHT+IHnRUSdUAiE6xSCF7qK008yqz2CYgd4uPUsSUYmFzhuSr+lKmrz+rNzsxjiPE7EHSpTAr2kzC8PGntP7byzmIU=
X-Received: by 2002:a05:6e02:20c8:b0:3d3:db70:b585 with SMTP id
 e9e14a558f8ab-3d483a803femr39260345ab.21.1741986538694; Fri, 14 Mar 2025
 14:08:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250314183455.120824-1-robdclark@gmail.com> <4525d045-745a-4d8b-987e-45d3fa9917b5@quicinc.com>
In-Reply-To: <4525d045-745a-4d8b-987e-45d3fa9917b5@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 14 Mar 2025 14:08:46 -0700
X-Gm-Features: AQ5f1Joqit6DTlPsGxZi33_LsW2JIVjOxNSfy35r8VHQ4UBkw--tifeiumMS4JI
Message-ID: <CAF6AEGuneF8Yi0ViA4ActvmGL7aOFT75jNBN=YZf37YyoBkCFA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/a6xx+: Don't let IB_SIZE overflow
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>, 
	Connor Abbott <cwabbott0@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jordan Crouse <jordan@cosmicpenguin.net>, Jonathan Marek <jonathan@marek.ca>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 14, 2025 at 1:07=E2=80=AFPM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> On 3/15/2025 12:04 AM, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > IB_SIZE is only b0..b19.  Starting with a6xx gen3, additional fields
> > were added above the IB_SIZE.  Accidentially setting them can cause
> > badness.  Fix this by properly defining the CP_INDIRECT_BUFFER packet
> > and using the generated builder macro to ensure unintended bits are not
> > set.
> >
> > v2: add missing type attribute for IB_BASE
> >
> > Reported-by: Connor Abbott <cwabbott0@gmail.com>
> > Fixes: a83366ef19ea ("drm/msm/a6xx: add A640/A650 to gpulist")
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> > Backport notes, prior to commit ae22a94997b8 ("drm/msm: import A2xx-A4x=
x
> > XML display registers database"), just open code, ie:
> >
> >    OUT_RING(ring, submit->cmd[i].size & 0xfffff);
> >
> > Prior to commit af66706accdf ("drm/msm/a6xx: Add skeleton A7xx
> > support"), a7xx_submit() did not exist so that hunk can be dropped.
> >
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c               | 8 ++++----
> >  drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml | 7 +++++++
> >  2 files changed, 11 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gpu.c
> > index d3978cfa3f20..ea52b7d0b212 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -245,10 +245,10 @@ static void a6xx_submit(struct msm_gpu *gpu, stru=
ct msm_gem_submit *submit)
> >                               break;
> >                       fallthrough;
> >               case MSM_SUBMIT_CMD_BUF:
> > -                     OUT_PKT7(ring, CP_INDIRECT_BUFFER_PFE, 3);
> > +                     OUT_PKT7(ring, CP_INDIRECT_BUFFER, 3);
> >                       OUT_RING(ring, lower_32_bits(submit->cmd[i].iova)=
);
> >                       OUT_RING(ring, upper_32_bits(submit->cmd[i].iova)=
);
> > -                     OUT_RING(ring, submit->cmd[i].size);
> > +                     OUT_RING(ring, A5XX_CP_INDIRECT_BUFFER_3_IB_SIZE(=
submit->cmd[i].size));
> >                       ibs++;
> >                       break;
> >               }
> > @@ -382,10 +382,10 @@ static void a7xx_submit(struct msm_gpu *gpu, stru=
ct msm_gem_submit *submit)
> >                               break;
> >                       fallthrough;
> >               case MSM_SUBMIT_CMD_BUF:
> > -                     OUT_PKT7(ring, CP_INDIRECT_BUFFER_PFE, 3);
> > +                     OUT_PKT7(ring, CP_INDIRECT_BUFFER, 3);
> >                       OUT_RING(ring, lower_32_bits(submit->cmd[i].iova)=
);
> >                       OUT_RING(ring, upper_32_bits(submit->cmd[i].iova)=
);
> > -                     OUT_RING(ring, submit->cmd[i].size);
> > +                     OUT_RING(ring, A5XX_CP_INDIRECT_BUFFER_3_IB_SIZE(=
submit->cmd[i].size));
> >                       ibs++;
> >                       break;
> >               }
> > diff --git a/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml b/driv=
ers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
> > index 55a35182858c..a71bc6f16cbf 100644
> > --- a/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
> > +++ b/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
> > @@ -2259,5 +2259,12 @@ opcode: CP_LOAD_STATE4 (30) (4 dwords)
> >       </reg32>
> >  </domain>
> >
> > +<domain name=3D"CP_INDIRECT_BUFFER" width=3D"32" varset=3D"chip" prefi=
x=3D"chip" variants=3D"A5XX-">
> > +     <reg64 offset=3D"0" name=3D"IB_BASE" type=3D"address"/>
> > +     <reg32 offset=3D"3" name=3D"3">
>
> Why is the offset 3 here? It looks to me that it doesn't match the code
> above.

oh, bad copy/pasta.. it should be 2 (dword offset)

BR,
-R

> -Akhil.
>
> > +             <bitfield name=3D"IB_SIZE" low=3D"0" high=3D"19"/>
> > +     </reg32>
> > +</domain>
> > +
> >  </database>
> >
>

