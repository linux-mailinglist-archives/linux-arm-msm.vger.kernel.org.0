Return-Path: <linux-arm-msm+bounces-29379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BD295D415
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 19:15:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 154791C210A3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 17:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B8B518C929;
	Fri, 23 Aug 2024 17:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WYYbGkWy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE3F18BC0C;
	Fri, 23 Aug 2024 17:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724433317; cv=none; b=V2AhyYZ6RTEXpP/N9wpBdpvyhh/A6jNaNe5f+mn5vghEt3qWyI307mfTZvljDJzxUQ8Afj2rTVdkS830ERD0TFmuzC3EdFlnKydzNphD/5/1Sz3oU16KATZTzEQj+0mkvpPRshecvHpQ8LT6ae+yryr+EfxSYDsI0+qYfM8QBME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724433317; c=relaxed/simple;
	bh=BeQ2C/a6Nik0iT5adRG+M6HWcI94cjAt0cYwTtfYctw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EwnwLVwWTeTk67y01R9K4IsKszC6JctHHeC95wOwc9e+zrqUFcmjO6xfccup8X5NYptb9CEWzRZE+Wm0sI4JhjH+sZS/leRqV4VPaXHu5ZeyqrXFJblBu3Z6/XoQbeHSGGXiLelCCarD4Cx9Jb19TJmq8/69PggWyZwYPql7CFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WYYbGkWy; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5bed05c0a2fso2859080a12.3;
        Fri, 23 Aug 2024 10:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724433314; x=1725038114; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o0bo3lj17iVnA90Gvdqs2ukstbOsPzvxj83rTZR10+A=;
        b=WYYbGkWyE5m3jL+Fu2t6q4OF0mCKF0uGmIxtXqQUZg4sYOc3rPBNe3v0HD8OfhFC8U
         /D2L0Ovj5lWH/eXspvLtws99cXP6FhEKD36w65VqnCaiDTo6jKccVvCvmB/0Y3RB+Sxe
         rg1gWPmHlf4ZbWh+roJqgxyY7K6himm8x3DITiiJUR82DA6C+XZzEteTD1gTiVbiMGQs
         Dv8miH7bv4n4YAzJYKGQyTPSJ0/83AttaG/atSIrWH55rTlGzk64QDLRQ+H2LI18JLL4
         Iv27QJ4DL2LtVlQgDa1aIVBQiPjWG10kUdnYvG32uW1NeWKtivDdBSXU90RUQpFETdD8
         6S2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724433314; x=1725038114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o0bo3lj17iVnA90Gvdqs2ukstbOsPzvxj83rTZR10+A=;
        b=A1VVFxt9EpcPpKXEa41QFVWy8rLmYFpojduzKipmbPnxPmA+kumnU3bu3ALYPBzH32
         tYbF7iY6J3WGrnw/laaS1nGeE4zlX7f6kyxUNY1vnAvLDKl8a6TI69dM03T4D1HTcXG5
         egEAE+DmlLbzVsGtcccNZHWvmH3v4tO73+gQYayDcBH+lLFh2SJugn2tE7x7/eRArEBJ
         +w9Omcp2wqABNEG0CB213ACSSI/jWVGvbB+hsyfO4qFXwyusfGz4AhtsD1zxnzk0IpJ8
         H7SXq5tQYe3NlMxDEqdTpNnOwM/KMRZ9Rd1jNTHlCHMHSGByQvKbjjsd9FQEHHi66ss+
         zj/A==
X-Forwarded-Encrypted: i=1; AJvYcCVhknzzCVPjQ8B5vnIdNg6AjabGDaHKF54IsJo2PA2vQCcUYFAw2YbNaBWx0cN+HKxZdMRxBxXGwpdv1O8G@vger.kernel.org, AJvYcCXxfpgmdmaRbM4OzxWwvg4Ei9Bb+ibV7GrnloRxo4HKjEiq1NVmC+r19KOXDXSTKPtR//Mp7LtxQ2tP3m1T@vger.kernel.org
X-Gm-Message-State: AOJu0YwukBzJK4nBAT7G/gXm0IywA+1EGAl5DvBbVetiul8oRuz3CGPz
	6Ua5KTJbcO3q6EduaFdF47n3Q6xr/SqnFxp2ib6RZCivjUUV9RzPFX2BEaTjLo0UScisZ4BBfYR
	Uc4RwUR0yq5ZNLJvdlePRJLOyvxA=
X-Google-Smtp-Source: AGHT+IE6MvFowzN02CjJzPs0k5dyUkv2PK0G9MOkRAFWX+bbxCEs/JW0C5fXEAC/8Vjdnp4s4/NyulPlrSAm5z/s8jI=
X-Received: by 2002:a05:6402:42c7:b0:5be:e9f8:9bbf with SMTP id
 4fb4d7f45d1cf-5c089164ac8mr2279242a12.9.1724433313417; Fri, 23 Aug 2024
 10:15:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240729-topic-845_gpu_smmu-v1-1-8e372abbde41@kernel.org>
 <osxynb352ubxgcb5tv3u7mskkon23nmm3gxkfiiiqss5zp67jf@fv5d6bob2rgp>
 <CAF6AEGuWULwrJDWW37nQhByTpc-2bBYVv3b_Ac6OCwaJ83Ed9w@mail.gmail.com>
 <CAA8EJpp9zaQSKbis7J9kYTudTt=RFhfbzeayz3b-VbGQENtqeA@mail.gmail.com>
 <3332c732-4555-46bf-af75-aa36ce2d58df@gmail.com> <CAA8EJppZsNTqh_KxD=BWXjmedA1ogeMa74cA=vVbCWAU7A-qgQ@mail.gmail.com>
 <d766e2e8-9f3f-af3a-bb5e-633b11bce941@quicinc.com> <20240823152147.GA396@willie-the-truck>
In-Reply-To: <20240823152147.GA396@willie-the-truck>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 23 Aug 2024 10:15:00 -0700
Message-ID: <CAF6AEGvd6a4a2Wbm_D2mhg+i7bapDadgnaOQZU7m68uA8SS5Jw@mail.gmail.com>
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Work around SDM845 Adreno SMMU w/
 16K pages
To: Will Deacon <will@kernel.org>
Cc: Trilok Soni <quic_tsoni@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Konrad Dybcio <konradybcio@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 8:21=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Tue, Jul 30, 2024 at 10:16:00AM -0700, Trilok Soni wrote:
> > On 7/30/2024 1:50 AM, Dmitry Baryshkov wrote:
> > >>>>>> SDM845's Adreno SMMU is unique in that it actually advertizes su=
pport
> > >>>>>> for 16K (and 32M) pages, which doesn't hold for newer SoCs.
> > > My question is about forbidding 16k pages for sdm845 only or for othe=
r
> > > chips too. I'd assume that it shouldn't also work for other smmu-v2
> > > platforms.
> >
> > Yes, my understanding was that SMMUv2 based IPs doesn't have 16k suppor=
t
> > and it is only starting from SMMUv3.
>
> I'm not sure about that. The architecture doc for SMMUv2 talks about the
> AArch64 translation regime in section 1.5 and bit 13 of SMMU_IDR2 says:
>
>   | PTFSv8_16kB, bit[13]
>   | Support for 16KB translation granule size. The possible values of thi=
s bit are:
>   | 0   The 16KB translation granule is not supported.
>   | 1   The 16KB translation granule is supported.
>   | In SMMUv1, this bit is reserved.
>
> so I think Konrad's patch is about right, but if you want to extend it
> to cover other implementations then that's fine too.
>

Perhaps that should have been "qcom's SMMUv2 based IPs doesn't have
16k support"?

At any rate, 16k sizes don't appear to work on sc7180 as well.  I
don't really have any other data points but it wouldn't really
surprise me if this applied to all qc smmu-v2

BR,
-R

