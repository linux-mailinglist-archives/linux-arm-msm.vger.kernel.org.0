Return-Path: <linux-arm-msm+bounces-27424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 998AE94163C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 17:58:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A3A91F2557C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 15:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 713D81BA87B;
	Tue, 30 Jul 2024 15:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yk0D11Qb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51ECD1BB6A9;
	Tue, 30 Jul 2024 15:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722355067; cv=none; b=ipM2horrfACU052MdJoGl8g5WNOOo7ymNMD+YqJ71GOvH3qjroMKaFbqJ0nt5o39bkSwaMbVxnGqubl3NDiYNMERYcktT28yfiw7adRUdZ6oh6Wv/dbYxAySUCC9Y5+rx/d5ex2dsBpiB50LcJ2LI405+Gtaa7p7oSrKGj6nXCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722355067; c=relaxed/simple;
	bh=tn400rVvllJNXhu3yHGfVTbwd98gV9dFnEHtKt4lEKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tzx7gCJRkFFyprlX/3VVD9j61/gfK3NPrr7dhf//tP2y2YfRureYA2tn6qI+vCEgVuXuK8HQhkXYRT7A4Gehy0KicwRkUJvF0gUCqhihkowkkeJMK1NK99Q2Yc5N62qUpclSl4JowIOc8G0YGCvDcUNafipiR0zHJ4cbXRdsnqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yk0D11Qb; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ef2fccca2cso58631521fa.1;
        Tue, 30 Jul 2024 08:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722355062; x=1722959862; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=27/gAqx5lgeC8Os2LV97u4YOEZtWJlnLTdD+mQUAxaU=;
        b=Yk0D11Qb6gfOVsWatJuC46gues9TwNkqkGRqmCW/0apKrzlVfUdpccxUgeByGvUGYi
         LBxNGwP6rlr+leJ/gs+LIhMp96PyP95RT5c+X/GzITBQcqpDy9fBrA4M02hMsST4+vMM
         yqLBb5HAwAf+DYzClwSOdnu5Z98p8jockiWg7I+WdMwpi0pzFRhpqshVXhJ1BDtmQxLI
         g0PKlOVa1JcuEv37Iy3Vjhy2PJ8vU054qeHddqDUh+iSjnY/1MfheQn0KRh9OH3LH1rk
         blElQ0ASF9/LNuIHjojUlDhigPA64yLkHcfYGEIIY79KI11EkOMn//c1u4t87oLDCHFC
         +WUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722355062; x=1722959862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=27/gAqx5lgeC8Os2LV97u4YOEZtWJlnLTdD+mQUAxaU=;
        b=McK3hk05S7MtYwDqPhYTm1vVDt6z+6/OlqGzgZplYwE0WpkbvLACl2gE0Yo1ToMQhl
         n/26b52sd2sc9znFYXzk3YqOUaX5daFDWtjfEQh5rAxpJpuIriTfkkJYe9/yZHP98Hq9
         NdxD1aPtN8oVW9N/PaMMeNtRnb4yQKuRyxgl6KN2unFjoazFpU6DeD3nALPhuOGGh4Ld
         rHYJh/zYIKWvLA1xLrjnWLOiDISQ5eiRQuUYwy0zfUTFFFtnn5Wys+fqgNuLBb19LlKO
         ne+GeZI7R33LXpp3ZoPuPelEvw80WUuyB5vlkaLK8PE8ilZqSmZSnjMtsLgjPOAmkL06
         F8Ag==
X-Forwarded-Encrypted: i=1; AJvYcCXK/bEr1NEwTByfXV+fjlPaO8UwUBS7clAaid3nsedGZbo9tHdrQ62vFQuoi++ysBElvw6JjQVSTDRdhsfo6azyTWaouYOhGSsBMTosmlD4+aELPjdgnB7cNqteeIxSWWaatdji428UKfsXXg==
X-Gm-Message-State: AOJu0Yy7eQuyMI+G2rc9ul5mRa/6jQbahiuyAG22JfLlIfTD5A/C/oAC
	7PcS4OOnffB97rTD2J/STZbafupS+FKPRrr0zb6TigOAFAaYWO0BT4S5+myoOgVxQdp2N3iMf3i
	RnOrNhwGVqxPMAkchFkvLIUxMClM=
X-Google-Smtp-Source: AGHT+IF9SiJw/Eq3Ic3bT8iin39x3OBr3WmKzKTHYF3cEnCHRD8ZJpdkfSIHWO0NCT3VovNiOyKE81Rskxkmlexa+6M=
X-Received: by 2002:a2e:7c07:0:b0:2ec:5c94:3d99 with SMTP id
 38308e7fff4ca-2f12edf8009mr75537151fa.2.1722355061989; Tue, 30 Jul 2024
 08:57:41 -0700 (PDT)
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
 <691ee925-b214-4b68-8d7b-ecb54f865cfc@kernel.org>
In-Reply-To: <691ee925-b214-4b68-8d7b-ecb54f865cfc@kernel.org>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 30 Jul 2024 08:57:29 -0700
Message-ID: <CAF6AEGuPanMBmguk9GRKekPEkdzxb8fOsb0qEVsUVEeedtG3=Q@mail.gmail.com>
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Work around SDM845 Adreno SMMU w/
 16K pages
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 3:12=E2=80=AFAM Konrad Dybcio <konradybcio@kernel.o=
rg> wrote:
>
> On 30.07.2024 10:50 AM, Dmitry Baryshkov wrote:
> > On Tue, 30 Jul 2024 at 11:08, Konrad Dybcio <konradybcio@gmail.com> wro=
te:
> >>
> >> On 29.07.2024 11:21 PM, Dmitry Baryshkov wrote:
> >>> On Tue, 30 Jul 2024 at 00:08, Rob Clark <robdclark@gmail.com> wrote:
> >>>>
> >>>> On Mon, Jul 29, 2024 at 1:14=E2=80=AFPM Dmitry Baryshkov
> >>>> <dmitry.baryshkov@linaro.org> wrote:
> >>>>>
> >>>>> On Mon, Jul 29, 2024 at 10:37:48AM GMT, Konrad Dybcio wrote:
> >>>>>> From: Konrad Dybcio <konrad.dybcio@linaro.org>
> >>>>>>
> >>>>>> SDM845's Adreno SMMU is unique in that it actually advertizes supp=
ort
> >>>>>> for 16K (and 32M) pages, which doesn't hold for newer SoCs.
> >>>>>>
> >>>>>> This however, seems either broken in the hardware implementation, =
the
> >>>>>> hypervisor middleware that abstracts the SMMU, or there's a bug in=
 the
> >>>>>> Linux kernel somewhere down the line that nobody managed to track =
down.
> >>>>>>
> >>>>>> Booting SDM845 with 16K page sizes and drm/msm results in:
> >>>>>>
> >>>>>> *** gpu fault: ttbr0=3D0000000000000000 iova=3D000100000000c000 di=
r=3DREAD
> >>>>>> type=3DTRANSLATION source=3DCP (0,0,0,0)
> >>>>>>
> >>>>>> right after loading the firmware. The GPU then starts spitting out
> >>>>>> illegal intstruction errors, as it's quite obvious that it got a
> >>>>>> bogus pointer.
> >>>>>>
> >>>>>> Hide 16K support on SDM845's Adreno SMMU to work around this.
> >>>>>>
> >>>>>> Reported-by: Sumit Semwal <sumit.semwal@linaro.org>
> >>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >>>>>> ---
> >>>>>> There's a mismatch in sender/committer addresses but that's "fine"=
:
> >>>>>> https://lore.kernel.org/linux-usb/2024072734-scenic-unwilling-71ea=
@gregkh/
> >>>>>> ---
> >>>>>>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 10 ++++++++++
> >>>>>>  1 file changed, 10 insertions(+)
> >>>>>>
> >>>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/=
iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>>>>> index 36c6b36ad4ff..d25825c05817 100644
> >>>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>>>>> @@ -338,6 +338,15 @@ static int qcom_smmu_cfg_probe(struct arm_smm=
u_device *smmu)
> >>>>>>       return 0;
> >>>>>>  }
> >>>>>>
> >>>>>> +static int qcom_adreno_smmuv2_cfg_probe(struct arm_smmu_device *s=
mmu)
> >>>>>> +{
> >>>>>> +     /* SDM845 Adreno SMMU advertizes 16K pages support, but some=
thing is broken */
> >>>>>> +     if (of_device_is_compatible(smmu->dev->of_node, "qcom,sdm845=
-smmu-v2"))
> >>>>>> +             smmu->features &=3D ~ARM_SMMU_FEAT_FMT_AARCH64_16K;
> >>>>>
> >>>>> Shouldn't we hide that uncoditionally as it's likely that none of v=
2
> >>>>> Adreno SMMUs support 16k pages?
> >>>>
> >>>> Hmm, that would be unfortunate to have the GPU not supporting the CP=
U
> >>>> page size.  I guess we could still map 16k pages as multiple 4k page=
s,
> >>>> but that is a bit sad..
> >>>
> >>> For now this might be limited to older platforms (v2 vs -500)
> >>
> >> In the commit message:
> >>
> >>>>>> SDM845's Adreno SMMU is unique in that it actually advertizes supp=
ort
> >>>>>> for 16K (and 32M) pages, which doesn't hold for newer SoCs.
> >
> > My question is about forbidding 16k pages for sdm845 only or for other
> > chips too. I'd assume that it shouldn't also work for other smmu-v2
> > platforms.
>
> I'd say we shouldn't cause trouble unless we know it's an issue

I guess the other direction (gpu only supporting _larger_ pgsize as
cpu) would be more problematic

What is the next larger pg size above 4k which is supported by both gpu and=
 cpu?

BR,
-R

