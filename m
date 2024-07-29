Return-Path: <linux-arm-msm+bounces-27323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8A3940045
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 23:21:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 698562811ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 21:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B236D18C347;
	Mon, 29 Jul 2024 21:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="txlYNX4q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BAE186E29
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 21:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722288114; cv=none; b=SLRxRg/oe+E7F0MvIz7CmE4OKgJHjr+GnNNDhn5rK32nJK/otpIMaj+sQPbRsFSK46JT0v73BctI/2JF157Fj2Jr710bELVdXLkNytxlcRDFyo69nMoW5UsjPYfo2DVVx5BuVKqwdmaPxO9MyUY5Dzti+VTeIEOnWXV0qe9wBVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722288114; c=relaxed/simple;
	bh=FOPJpCCVvRzic3VhjHCz4bKGJ8FCW9kdO0eNxU+oU8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BCNFM9p+D2PyUwA56HbSCHSBhqDXf3VIBT55Ilg5qIo/w/YSWt/naepkM2byGtapYuaA9l5Qc6MbS5mdnFEZKMXR7Q6LPldyVDuCGVS+uYWr/7vzRzNW5uo9pw9uPRlbLXPGyaq6iICXpSOezjznICo1aD3BMZZ9fJMTjyKKCYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=txlYNX4q; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-65f880c56b1so23961407b3.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 14:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722288112; x=1722892912; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mSJIQs4p1v6js6HxMlrzFwmBxSaDPhvaDzcJ1AzWsxM=;
        b=txlYNX4qw7fil06fCwGrJLYk0UuCs7XAF9+oGAcypiET+lgE94KXEcK2Vx8CZEUDIA
         XXNA/SUBlQOS7uZkRjma1+kVtcvdgX3uk7sfZUY8oSTzoY/cHV5QrLiR7lxCQmFk3256
         GSigQeKlx6TUi1Jq+lO4aVTOIQBvLyAF/blIKOTgmKV+tnlb3VEDL1rjQh8fcUVwbzVS
         VSeXY1oyMTsvE9OVXm4jo5rbSnpaRik4z2SGP3QvLlrmjf6HroRtSpgPApcJ0Br4FyJi
         7L0Vc2Ora4jJa0mlL6uskv+d6Ed94w/YqGgbBE88xnukjPBwhbPBB8xFPVy0Qs2s7eHH
         V3hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722288112; x=1722892912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mSJIQs4p1v6js6HxMlrzFwmBxSaDPhvaDzcJ1AzWsxM=;
        b=ZdW2OUtxwjubrw4zX8WbeObJORioSxrIcciJrFrmVAlE8Xur24MwOcf7EK6ibDdbSi
         06enLHMUJy2oSmp9jYh60dQUgNDrvoyD0V+QvQGq7bUjMAumNKDpcJxaBR/XKm305UX4
         Mw8Ed8R2WFdEteeZgjso+LPoyh3B3llOSASLbjRIZiMS5pxP/IKZusWGhth7V7cUf4r+
         1JqvrDPXsxEyvoBaPQjCXISaGVN2+aY6UjHkxJeqInfuPHAUMvIE0j+3/fQbjBsJDjwA
         b2DgKlzL1pS209o+YgTB0tmgkdQeK6SIDsMV+MlW3113uKCi0md1HKMe7PuLJ8tc6NHT
         AsNA==
X-Forwarded-Encrypted: i=1; AJvYcCUy7HpKV/794fORZlIQucgQMqbtMBBVIl00OGBzmgTknDvQLAr15lT5bVYGe0CUQUgn1O2AmYSpKW4jx+MhipLRaZKTWqkSf3D/Sm9ZXw==
X-Gm-Message-State: AOJu0Yzqb2YHlhXmdcXPf0xuLcaaJXveUbFv/9Go3UZgP/qIzFvvKUws
	ZeZJKIrhZ63+C6DSOj5rqALOIoWkSS4NO7dtc/Dw7340noOz/gGFHT37zCmHdIOILrjc1vOEwjI
	JZ7q5YWlIwf8xfZlyL69aQDJhvzFcgY3PsXgt2Q==
X-Google-Smtp-Source: AGHT+IGVTP16x1+1AFRfHTyRsYutxYWUA/dm8T1RSvz5yKK09CoN1EMgi1pPRWOmlWmM3YfXDmH3NmwPCUMuWs1VeXM=
X-Received: by 2002:a05:6902:1103:b0:e0b:3363:597e with SMTP id
 3f1490d57ef6-e0b54401efcmr9996230276.9.1722288111932; Mon, 29 Jul 2024
 14:21:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240729-topic-845_gpu_smmu-v1-1-8e372abbde41@kernel.org>
 <osxynb352ubxgcb5tv3u7mskkon23nmm3gxkfiiiqss5zp67jf@fv5d6bob2rgp> <CAF6AEGuWULwrJDWW37nQhByTpc-2bBYVv3b_Ac6OCwaJ83Ed9w@mail.gmail.com>
In-Reply-To: <CAF6AEGuWULwrJDWW37nQhByTpc-2bBYVv3b_Ac6OCwaJ83Ed9w@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 30 Jul 2024 00:21:40 +0300
Message-ID: <CAA8EJpp9zaQSKbis7J9kYTudTt=RFhfbzeayz3b-VbGQENtqeA@mail.gmail.com>
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Work around SDM845 Adreno SMMU w/
 16K pages
To: Rob Clark <robdclark@gmail.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 30 Jul 2024 at 00:08, Rob Clark <robdclark@gmail.com> wrote:
>
> On Mon, Jul 29, 2024 at 1:14=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Mon, Jul 29, 2024 at 10:37:48AM GMT, Konrad Dybcio wrote:
> > > From: Konrad Dybcio <konrad.dybcio@linaro.org>
> > >
> > > SDM845's Adreno SMMU is unique in that it actually advertizes support
> > > for 16K (and 32M) pages, which doesn't hold for newer SoCs.
> > >
> > > This however, seems either broken in the hardware implementation, the
> > > hypervisor middleware that abstracts the SMMU, or there's a bug in th=
e
> > > Linux kernel somewhere down the line that nobody managed to track dow=
n.
> > >
> > > Booting SDM845 with 16K page sizes and drm/msm results in:
> > >
> > > *** gpu fault: ttbr0=3D0000000000000000 iova=3D000100000000c000 dir=
=3DREAD
> > > type=3DTRANSLATION source=3DCP (0,0,0,0)
> > >
> > > right after loading the firmware. The GPU then starts spitting out
> > > illegal intstruction errors, as it's quite obvious that it got a
> > > bogus pointer.
> > >
> > > Hide 16K support on SDM845's Adreno SMMU to work around this.
> > >
> > > Reported-by: Sumit Semwal <sumit.semwal@linaro.org>
> > > Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > > ---
> > > There's a mismatch in sender/committer addresses but that's "fine":
> > > https://lore.kernel.org/linux-usb/2024072734-scenic-unwilling-71ea@gr=
egkh/
> > > ---
> > >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > >
> > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iom=
mu/arm/arm-smmu/arm-smmu-qcom.c
> > > index 36c6b36ad4ff..d25825c05817 100644
> > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > > @@ -338,6 +338,15 @@ static int qcom_smmu_cfg_probe(struct arm_smmu_d=
evice *smmu)
> > >       return 0;
> > >  }
> > >
> > > +static int qcom_adreno_smmuv2_cfg_probe(struct arm_smmu_device *smmu=
)
> > > +{
> > > +     /* SDM845 Adreno SMMU advertizes 16K pages support, but somethi=
ng is broken */
> > > +     if (of_device_is_compatible(smmu->dev->of_node, "qcom,sdm845-sm=
mu-v2"))
> > > +             smmu->features &=3D ~ARM_SMMU_FEAT_FMT_AARCH64_16K;
> >
> > Shouldn't we hide that uncoditionally as it's likely that none of v2
> > Adreno SMMUs support 16k pages?
>
> Hmm, that would be unfortunate to have the GPU not supporting the CPU
> page size.  I guess we could still map 16k pages as multiple 4k pages,
> but that is a bit sad..

For now this might be limited to older platforms (v2 vs -500)

>
> BR,
> -R
>
> >
> > > +
> > > +     return 0;
> > > +}
> > > +
> > >  static void qcom_smmu_write_s2cr(struct arm_smmu_device *smmu, int i=
dx)
> > >  {
> > >       struct arm_smmu_s2cr *s2cr =3D smmu->s2crs + idx;
> > > @@ -436,6 +445,7 @@ static const struct arm_smmu_impl sdm845_smmu_500=
_impl =3D {
> > >
> > >  static const struct arm_smmu_impl qcom_adreno_smmu_v2_impl =3D {
> > >       .init_context =3D qcom_adreno_smmu_init_context,
> > > +     .cfg_probe =3D qcom_adreno_smmuv2_cfg_probe,
> > >       .def_domain_type =3D qcom_smmu_def_domain_type,
> > >       .alloc_context_bank =3D qcom_adreno_smmu_alloc_context_bank,
> > >       .write_sctlr =3D qcom_adreno_smmu_write_sctlr,
> > >
> > > ---
> > > base-commit: 931a3b3bccc96e7708c82b30b2b5fa82dfd04890
> > > change-id: 20240726-topic-845_gpu_smmu-ab738f7a013c
> > >
> > > Best regards,
> > > --
> > > Konrad Dybcio <konradybcio@kernel.org>
> > >
> >
> > --
> > With best wishes
> > Dmitry



--=20
With best wishes
Dmitry

