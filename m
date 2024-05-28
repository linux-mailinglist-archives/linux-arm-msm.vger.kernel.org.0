Return-Path: <linux-arm-msm+bounces-20788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B698D214F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 18:09:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 050D41C23603
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 16:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D69D17334F;
	Tue, 28 May 2024 16:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jL/fEJCA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D93317333B
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 16:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716912560; cv=none; b=uaIh21DSHYG+3L7kNGzu2alijn8+W69I/iC0lCR14jk4No2K3kg7KFpC2JLahSdQIW6R62/i7tFyrG4KtlkadEI0S/EYERb8y0z5ko6PFdh+SEzAOliyI4GhGaCupIrn+5q/47Mte6SodtWCxdbksCE73qp34tZApqvS8vwWQoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716912560; c=relaxed/simple;
	bh=bDYuIgQuv3MhFs8SVJuTlfnd4RnjBYwOgR5EG+5wd58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eAHnoSGHqZAuEOQVoebMFVHERI1T3mwoq/jGXxWN8ExR0C5b68IgcMGlRYlppuALwL8Js9LYIceYK/gUH9Vv1FgQGMNF0jzZhOR2WCmFVAQpfulcmrRP+B55Aqv/7/ievNcocaHo4ONh0u1xi2EwGAtYineEm/uTDmFK6eVE+Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jL/fEJCA; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6f966840af7so860963b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 09:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716912558; x=1717517358; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/T5d6c9CKWOo6KiywfsZr/KUsXoqKTqM2ZtZzV03hwQ=;
        b=jL/fEJCA9y8QwuXezhaL74vC091dluSPFmMW/wyC0E+2wzrIwYvkiIKbbQ+gMawnIZ
         R6cfLCjSRIprHl/9r2NSlb8w3ltsGZ5wMuEqNKrnobiWWd1KwB5FSXZLTVKmbzIJpKo/
         1JgNjBND4NL/DMSvfXcd9J4g+46LZN6qJpkj9dh077aWhBjHndYclw0Ac3VhiEwxNZdu
         k+NXy70usydnvOUSSKWGrAC7Iw6RFd6vrKe0NwNfdPq94dbabL12p1/oEGMQxtPBbYJs
         kZInVWTzj88Ix5VUq22QQWJvUhzjEH9D7URGED2ex+2iwNKLKvotWoYd4xPDrR6aOvGL
         IEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716912558; x=1717517358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/T5d6c9CKWOo6KiywfsZr/KUsXoqKTqM2ZtZzV03hwQ=;
        b=qhPXya1E/jZmnv8uRXDLhgiuJD/R/Dmq7yTaZ266JNVv5Onep4icTIR8rIjzqO0ubM
         Ky86A6uSakLDU273x2Z/YrxD9tsokaCaQBrVKj/XNLdacPA82CeDWDMtlHOJjvcqPJRL
         haw/vPFMgbj08eptoResL/6LQVmI5fhaaBnfsCgvgLvYcZe29ay1/usDD6LMc0w8fR9V
         0w9rFSjNKPdyl4IUlM4VcH1447bJ1WOw0sOSgyWaYO2E8AFUkPEDoiXVuR5TT/dv+SsI
         N5ILGGHZIUkdb2xibGDRJmcVaHHUbuSnolPvUhzLPgUwLFs3zzmJ9a1TBab0QxF1CtxO
         9p1g==
X-Forwarded-Encrypted: i=1; AJvYcCXO+l9qMxSgRuEN45+Kt7eFSNH2mlXxtOJQnyfYr5yxMHDHRaG+6oLQkjqsYe+6e9MeVKlmcY5Z/fL6pfkuiyljazq6ttev1SUmZu9vCQ==
X-Gm-Message-State: AOJu0YySwRe6xAdqIffgHG2AdDac1hzt3g3IN3xDTtiaDF94KZBJcvo9
	c/vIChwngdpFnmI218Cjitvc+nCPBA0xoAztRqipwnE5l0ilqo8PX/w9iwaJe6K3ERcvcy0SDX7
	9XKsY88Vqzeg9rOOZsLrJ16bvRkuyECY5xMQC0g==
X-Google-Smtp-Source: AGHT+IF7Y4UTjK7B9c7gQCgmKZJrzKmO7YzaO50rJedO1tvD04WxzrFxX+TEhHVj+99gHywgOVea6bGHRNcMFkS6QhE=
X-Received: by 2002:a17:902:d492:b0:1f4:a057:f927 with SMTP id
 d9443c01a7336-1f4a058014cmr62152365ad.45.1716912557839; Tue, 28 May 2024
 09:09:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240123144543.9405-1-quic_bibekkum@quicinc.com>
 <20240123144543.9405-4-quic_bibekkum@quicinc.com> <CAF6AEGs3_wBNo58EbGicFoQuq8--fDohTGv1JSFgoViygLS5Lg@mail.gmail.com>
 <f2222714-1e00-424e-946d-c314d55541b8@quicinc.com> <51b2bd40-888d-4ee4-956f-c5239c5be9e9@linaro.org>
 <0a867cd1-8d99-495e-ae7e-a097fc9c00e9@quicinc.com> <7140cdb8-eda4-4dcd-b5e3-c4acdd01befb@linaro.org>
 <omswcicgc2kqd6gp4bebd43sklfs2wqyaorhfyb2wumoeo6v74@gaay3p5m46xi> <CAF6AEGub2b5SRw7kDUGfKQQ35VSsMkQ9LNExSkyHHczdFa2T4Q@mail.gmail.com>
In-Reply-To: <CAF6AEGub2b5SRw7kDUGfKQQ35VSsMkQ9LNExSkyHHczdFa2T4Q@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 28 May 2024 19:09:04 +0300
Message-ID: <CAA8EJprW8fTf0tWDWq+aVVauJnK0NqBke-JNELm_GMPvoWa7vA@mail.gmail.com>
Subject: Re: [PATCH v9 3/5] iommu/arm-smmu: introduction of ACTLR for custom
 prefetcher settings
To: Rob Clark <robdclark@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Bibek Kumar Patro <quic_bibekkum@quicinc.com>, will@kernel.org, 
	robin.murphy@arm.com, joro@8bytes.org, jsnitsel@redhat.com, 
	quic_bjorande@quicinc.com, mani@kernel.org, quic_eberman@quicinc.com, 
	robdclark@chromium.org, u.kleine-koenig@pengutronix.de, robh@kernel.org, 
	vladimir.oltean@nxp.com, quic_pkondeti@quicinc.com, quic_molvera@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 28 May 2024 at 19:08, Rob Clark <robdclark@gmail.com> wrote:
>
> On Tue, May 28, 2024 at 6:06=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Tue, May 28, 2024 at 02:59:51PM +0200, Konrad Dybcio wrote:
> > >
> > >
> > > On 5/15/24 15:59, Bibek Kumar Patro wrote:
> > > >
> > > >
> > > > On 5/10/2024 6:32 PM, Konrad Dybcio wrote:
> > > > > On 10.05.2024 2:52 PM, Bibek Kumar Patro wrote:
> > > > > >
> > > > > >
> > > > > > On 5/1/2024 12:30 AM, Rob Clark wrote:
> > > > > > > On Tue, Jan 23, 2024 at 7:00=E2=80=AFAM Bibek Kumar Patro
> > > > > > > <quic_bibekkum@quicinc.com> wrote:
> > > > > > > >
> > > > > > > > Currently in Qualcomm  SoCs the default prefetch is set to =
1 which allows
> > > > > > > > the TLB to fetch just the next page table. MMU-500 features=
 ACTLR
> > > > > > > > register which is implementation defined and is used for Qu=
alcomm SoCs
> > > > > > > > to have a custom prefetch setting enabling TLB to prefetch =
the next set
> > > > > > > > of page tables accordingly allowing for faster translations=
.
> > > > > > > >
> > > > > > > > ACTLR value is unique for each SMR (Stream matching registe=
r) and stored
> > > > > > > > in a pre-populated table. This value is set to the register=
 during
> > > > > > > > context bank initialisation.
> > > > > > > >
> > > > > > > > Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com=
>
> > > > > > > > ---
> > > > >
> > > > > [...]
> > > > >
> > > > > > > > +
> > > > > > > > +               for_each_cfg_sme(cfg, fwspec, j, idx) {
> > > > > > > > +                       smr =3D &smmu->smrs[idx];
> > > > > > > > +                       if (smr_is_subset(smr, id, mask)) {
> > > > > > > > +                               arm_smmu_cb_write(smmu, cbn=
dx, ARM_SMMU_CB_ACTLR,
> > > > > > > > +                                               actlrcfg[i]=
.actlr);
> > > > > > >
> > > > > > > So, this makes ACTLR look like kind of a FIFO.  But I'm looki=
ng at
> > > > > > > downstream kgsl's PRR thing (which we'll need to implement vu=
lkan
> > > > > > > sparse residency), and it appears to be wanting to set BIT(5)=
 in ACTLR
> > > > > > > to enable PRR.
> > > > > > >
> > > > > > >           val =3D KGSL_IOMMU_GET_CTX_REG(ctx, KGSL_IOMMU_CTX_=
ACTLR);
> > > > > > >           val |=3D FIELD_PREP(KGSL_IOMMU_ACTLR_PRR_ENABLE, 1)=
;
> > > > > > >           KGSL_IOMMU_SET_CTX_REG(ctx, KGSL_IOMMU_CTX_ACTLR, v=
al);
> > > > > > >
> > > > > > > Any idea how this works?  And does it need to be done before =
or after
> > > > > > > the ACTLR programming done in this patch?
> > > > > > >
> > > > > > > BR,
> > > > > > > -R
> > > > > > >
> > > > > >
> > > > > > Hi Rob,
> > > > > >
> > > > > > Can you please help provide some more clarification on the FIFO=
 part? By FIFO are you referring to the storing of ACTLR data in the table?
> > > > > >
> > > > > > Thanks for pointing to the downstream implementation of kgsl dr=
iver for
> > > > > > the PRR bit. Since kgsl driver is already handling this PRR bit=
's
> > > > > > setting, this makes setting the PRR BIT(5) by SMMU driver redun=
dant.
> > > > >
> > > > > The kgsl driver is not present upstream.
> > > > >
> > > >
> > > > Right kgsl is not present upstream, it would be better to avoid con=
figuring the PRR bit and can be handled by kgsl directly in downstream.
> > >
> > > No! Upstream is not a dumping ground to reduce your technical debt.
> > >
> > > There is no kgsl driver upstream, so this ought to be handled here, i=
n
> > > the iommu driver (as poking at hardware A from driver B is usually no=
t good
> > > practice).
> >
> > I'd second the request here. If another driver has to control the
> > behaviour of another driver, please add corresponding API for that.
>
> We have adreno_smmu_priv for this purpose ;-)

Exactly

>
> BR,
> -R
>
> > >
> > > >
> > > > > > Thanks for bringing up this point.
> > > > > > I will send v10 patch series removing this BIT(5) setting from =
the ACTLR
> > > > > > table.
> > > > >
> > > > > I think it's generally saner to configure the SMMU from the SMMU =
driver..
> > > >
> > > > Yes, agree on this. But since PRR bit is not directly related to SM=
MU
> > > > configuration so I think it would be better to remove this PRR bit
> > > > setting from SMMU driver based on my understanding.
> > >
> > > Why is it not related? We still don't know what it does.
> > >
> > > Konrad
> >
> > --
> > With best wishes
> > Dmitry



--=20
With best wishes
Dmitry

