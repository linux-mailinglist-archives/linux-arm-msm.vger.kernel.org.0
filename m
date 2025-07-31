Return-Path: <linux-arm-msm+bounces-67269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F4EB1767E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 21:16:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DF5117EF1F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 19:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD7D0225784;
	Thu, 31 Jul 2025 19:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cyT8jEw4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8D7635;
	Thu, 31 Jul 2025 19:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753989363; cv=none; b=gGyS3rZ/aMIW3Rq0nux9sKl9RRPkj5mNDOUFOlLMfE282Mi9K4BC53pfd448C2MC5N+bTdMbklr2zy08SB64DUB8mODXKHGmi1wsKvngnNp8I42cDDZsblSN1STA3d1tVPVHmLJIDi6N5qH/B4IjG9lMb+dMl8HufLp0ipCdPnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753989363; c=relaxed/simple;
	bh=puJY0V0Qv74ZvYGJPZpTNvxwj6/hRQoCyKwZnBrJ7qU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SNGOu4VoeUykJGZAxrwAAYi6nHJBoH9d+IFA6piHWSIggA0RA89+90BNxBOjSR/NJXhGWa7jX//jKvLin/+cC2nkH8rww6jrI1QUjrxM7kJjkhT+LuToX1uSUq7SMLsGle0zCXwCRhi4OvfxvrNulSQCSBpsMYeWKdoDa0vnn2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cyT8jEw4; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-23fef63da72so2213145ad.3;
        Thu, 31 Jul 2025 12:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753989361; x=1754594161; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cn8rhLd+pEEUOUPpSiZavvw/rqdfDh7ZoQlltq8FbbA=;
        b=cyT8jEw4zeMPSecC+h5GgQFEoiBFwDSRpjMPM6aQwTxLN9G8wBxM3H2J0O5gDQ+aB6
         FqGnio2JYLw6prRAG99fRkvCxMwhQsAJdiTY73x58+YMpImAq/Dc4xmLwPuIye3zaw6Z
         DHtRjUd3IBYtHUKmo/n6yx4qSoy64RNBTZbG9inEsxqDdsXPh6M0EsATtMUmofpKstP+
         bOimJJV4wP3dhh5fI3UkBAZ+mogrdoL4JSu8OPzwNUKRbbkpA7DGP9Tgkv3D4uCWzIb1
         mYfK1j/U5A7RZLdKVhQIYYtFbwLgmCJ2Ww+oopLwtRXkDFc21pglYdlJd8aFdlQETKlq
         Y9EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753989361; x=1754594161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cn8rhLd+pEEUOUPpSiZavvw/rqdfDh7ZoQlltq8FbbA=;
        b=NF+rD+aPDVLKntWReD/QU4HxqkdEgPyQJaSEPKWKfJE3LOaulX3ElNABkfY6nNIKne
         CiF5Kx6X4+C8JIN75Qkw1zH3sMCbePk2YYEhGkJ54xRqZ8cVGvQAGMuQNw3W38mFVQ6B
         BjstQbwTMkH7mUXi1kb6txAPFyWkKzPgBT8V3SzeBt8+uEmvy4AeZCAyfzfJBQQ77Zel
         2G8SCTDY0rqnwadWZMFUq45z+vuSOV8igYupI2kGPBXVmfTfvR2yiZP540V/pRVotAOj
         tjoHxgFq32rqnNuuec5QxZyhRN1ZS2VC+hLK4BtLHB3Sr/iwBeVlgqItcvM6vJXuR+6T
         Q0yw==
X-Forwarded-Encrypted: i=1; AJvYcCUAvZHXj+nnxYdFhULeS6Ky/BIe17AI/RmrT1LuWWUMZjeETYlM1lsNkgNJDwMWeodwpVqrdO1fE9wDKkPR@vger.kernel.org, AJvYcCULI69m+/KbTh+mXP0OlBIitMx+RgjLGklnNgKBFt6AQkgHBMFkLZe425oI5XpGGiHFv3Okv8JuLG2scuVS@vger.kernel.org
X-Gm-Message-State: AOJu0Ywui1ZMpqIkFYr1Hs8qWmKuXANSo014He+mI8uYtKwCdXRvRWqs
	17TBjG3PZaBbdJufgke3AYR98gIWsTE/ZzF6cZkgpQXyVskuA/ymn8hg8pTbofZfWrEbXoCPxdr
	HLJU8vvrH8eSRoIvYorinqGnCeidloaY=
X-Gm-Gg: ASbGnctq00FIhaNRfNc32QEtlc/LMLknkAcP9v4kHaGxsqcAe6v2vLmUzyYpNGgvLQn
	YpqhT0s3hRTnU6MabYkg7U4T3QBocMcbRjZpIQ9seF7tVn5uH63wpkJjsyqT7VVjzpNGb5mCRT2
	336f1mhkJUY1zzUa17s9srRGj5ZA7HDFC6CTsnOsYh32lOajElYVKHZvry+2fyiRygDpp4FwBQ/
	AsajkY=
X-Google-Smtp-Source: AGHT+IEu/ADiBuOsnU9STlGTu3rwTdJjPniO2Z9r/r425/pU8HcEQ16Nz5WPbiQltfir7tdUPXbYKhfu5V/X9mtmrKE=
X-Received: by 2002:a17:90b:4d88:b0:313:2f9a:13c0 with SMTP id
 98e67ed59e1d1-31f5dd9ca39mr1287471a91.1.1753989360980; Thu, 31 Jul 2025
 12:16:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250728203412.22573-1-robin.clark@oss.qualcomm.com>
 <20250728203412.22573-2-robin.clark@oss.qualcomm.com> <CACu1E7F=Y2oKfiWtD0VYfmLkL24e7JrZYMt8dmoGW7zrq7bd2g@mail.gmail.com>
 <CACSVV02W28L0MS32J0n1PTpEsaq_6RxEPgb_6y6G=6TryGEPQw@mail.gmail.com> <CACSVV02DLSM2dHUj4MiPpogF3pgjk4ex5=9_P2AKdGmtx4bd=g@mail.gmail.com>
In-Reply-To: <CACSVV02DLSM2dHUj4MiPpogF3pgjk4ex5=9_P2AKdGmtx4bd=g@mail.gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 31 Jul 2025 15:15:49 -0400
X-Gm-Features: Ac12FXxlm9JnMukSNQYaLbB4cXPsAUd9A2TtT5GgTEBC58nIMT1QTbODzdtFojo
Message-ID: <CACu1E7E6QaWgjFy13qP4BS_5mdhJ2vFVsnm9WtnJE3_t7rymPQ@mail.gmail.com>
Subject: Re: [PATCH 1/7] drm/msm: Add missing "location"s to devcoredump
To: rob.clark@oss.qualcomm.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 29, 2025 at 9:40=E2=80=AFAM Rob Clark <rob.clark@oss.qualcomm.c=
om> wrote:
>
> On Mon, Jul 28, 2025 at 3:15=E2=80=AFPM Rob Clark <rob.clark@oss.qualcomm=
.com> wrote:
> >
> > On Mon, Jul 28, 2025 at 2:04=E2=80=AFPM Connor Abbott <cwabbott0@gmail.=
com> wrote:
> > >
> > > On Mon, Jul 28, 2025 at 4:43=E2=80=AFPM Rob Clark <robin.clark@oss.qu=
alcomm.com> wrote:
> > > >
> > > > This is needed to properly interpret some of the sections.
> > > >
> > > > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > > > ---
> > > >  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/=
gpu/drm/msm/adreno/a6xx_gpu_state.c
> > > > index faca2a0243ab..e586577e90de 100644
> > > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> > > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> > > > @@ -1796,6 +1796,7 @@ static void a7xx_show_shader(struct a6xx_gpu_=
state_obj *obj,
> > > >
> > > >         print_name(p, "  - type: ", a7xx_statetype_names[block->sta=
tetype]);
> > > >         print_name(p, "    - pipe: ", a7xx_pipe_names[block->pipeid=
]);
> > > > +       drm_printf(p, "    - location: %d", block->location);
> > >
> > > We should probably at least try to keep it proper YAML by indenting
> > > everything after another level...
> >
> > this made me realize I missed a \n... but otherwise I think the indent
> > is correct?  Or should location not have a leading '-'?
>
> beyond that, even without the added location field, some random online
> yaml checker is telling me that we were already not proper yaml.. so I
> guess, :shrug:?
>
> BR,
> -R

Before this change, it looked like this:

  - pipe: A7XX_PIPE_BR
    - cluster-name: A7XX_CLUSTER_SP_PS
      - context: 3
        - { offset: 0x02a718, value: 0x00000003 }
        ...

Notice that each nested thing (pipe -> cluster -> context) has an
additional level of indentation. Now, it looks like this:

  - pipe: A7XX_PIPE_BR
    - cluster-name: A7XX_CLUSTER_SP_PS
      - context: 3
      - location: 4
        - { offset: 0x02a718, value: 0x00000003 }
        ...

So it looks a bit weird with the context and location not being
nested. Also, I think the correct nesting HW-wise is cluster ->
location -> context, rather than context-> location, so the location
should be first. But ultimately it's up to you.

Connor

