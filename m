Return-Path: <linux-arm-msm+bounces-21819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 143C78FD9A3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 00:13:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4573C1F22FEE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 22:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 057C815F3EC;
	Wed,  5 Jun 2024 22:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PqDndSX5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8824962B;
	Wed,  5 Jun 2024 22:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717625612; cv=none; b=lPzjexl4/3VYXzoRw2fRAOPhcPbKd7rsyuj1chPPnQxn5vPEebbJol9Q9tmkPOsrJx6HeRjzbu0rT9I9axtIHKLjQtmake9/UX81Dl/sHjsiz7De6lOk+srtPNDrXXBEOOhzALWdiWQp/M8bGMWt3n+2/gFXYiRzfLrBqlwKRBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717625612; c=relaxed/simple;
	bh=Wngwnckn1Tj6rLC1+C7OloqUpd6c6W/4eYy7n0SkEio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GyxC4/gR3yRQlrT2v6/o9IChLfxIy2VTx1n1uUHYjivo3oKoIawWQw366J+0dhiELSPmr9R+g6YwHBvTAuPy+Y/zlyKXj2tL1snR5b1aQqVVG6yObcDS58tiaW1HDnOwVV+rLm5r9Lh3hzFs7uqI8bPI+SapRzwkioSGCx6lWRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PqDndSX5; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2eaa794eb9fso3445271fa.2;
        Wed, 05 Jun 2024 15:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717625609; x=1718230409; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cZ1uh3K4QtfBF8VEkq9yAiwApUG8fEgQZJ7CBc4fjQs=;
        b=PqDndSX5IX/42dXE+ZsgOEAMDGiQIxbpOsdfRrwW3x2y8N8JrgWemAOKv/Fqu92US3
         +JwMzTgnFyyMY97KjEosg97pQ4WojCaroctI264psC208ljc9TJqh81HrPFa53PngLgQ
         tONMFzzqwHda7ipbUOFPitK1NW09uzTc21WyDZPFHhyHCE5feuk41JSOJTeRmKmXLint
         KwFBonYhFSodtWM85YeuGjAuWVJDmgdG7YXtRdePeM1QXzrX3vlKtAWQdMkmBvJn/iQ/
         gcF9/bTGFp419MYCfHcbmdJt5rWXxFKzgDShWBZn6qOJhLbNRpJSeKYEEB1mQsvV8nBF
         86Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717625609; x=1718230409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cZ1uh3K4QtfBF8VEkq9yAiwApUG8fEgQZJ7CBc4fjQs=;
        b=BQjgfn2xXiyAKz2c1PcqLeNtytFQ53knUZUaYPwVPN4zZid5xU0WSGIe77rG9C2+6o
         /8IfH7HVVNwYMmmINkX3zEy9DloY388mnu8DzM5d93O0tlFAiBdgKvyrEHHyslz8QPUu
         8ZReKeLVGIBwjqjrqUAgMY04HF7gF0VZgdEmIJD3s4wJr6tUEexn9peEjkqIrCHyIxe/
         qrtOeREcs5qbcaIHOUU6kMNspyKho7+0ZaIduWg8c7NujOFa+cRkpHg8EskczgLbu1JX
         hyLUZbRm9DLuyMvpkuS3xPM/tMmn5kzrzsbEA2OAQRtbdrnS1z4hgQ7EcVCKaZcRzd7V
         V3ig==
X-Forwarded-Encrypted: i=1; AJvYcCW14oy6vGw4eCuWSpGomCCAVKDaEcnbyI+u4wO7ARKLp0dG9bW/vv0pcKhqEGJmbf783d2YNoHL50h6VL7zanl14bDip5AG7z2shH4Y4Jq5LINXwBBVSQoMThcaM66xW+iJnfD88XDvs3z/1A==
X-Gm-Message-State: AOJu0Yye0nI8AEJs4/WqheMz41CJAdZ6eaMCQ+zte9ttWeMTxHxDmAyT
	Tv6HN3e/mTwVixDdkEhG9kwl0KrtuIw86pNvMW42mLJHwuK9RY1obvoVza+BjgVOK5tP2qfYBaV
	HVN0N6Eya1UbTRp3JepOUGjhoabXaeQ==
X-Google-Smtp-Source: AGHT+IH6GbJhFgI/2EiVzuYAXcC+X8efqfLIYsN3X0TTXB9HePklJOwEaCHlGkROjKzAmeidQuASNMAWimonjYzcZio=
X-Received: by 2002:a05:651c:2224:b0:2ea:8188:5bdf with SMTP id
 38308e7fff4ca-2eac7a52b99mr26482021fa.36.1717625608682; Wed, 05 Jun 2024
 15:13:28 -0700 (PDT)
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
 <omswcicgc2kqd6gp4bebd43sklfs2wqyaorhfyb2wumoeo6v74@gaay3p5m46xi>
 <CAF6AEGub2b5SRw7kDUGfKQQ35VSsMkQ9LNExSkyHHczdFa2T4Q@mail.gmail.com>
 <9992067e-51c5-4a55-8d66-55a102a001b6@quicinc.com> <CAF6AEGsxKwzX6it4vipggOdGqNVzPbwMj6a0h871a=GfwUp0Cg@mail.gmail.com>
 <afb0698e-68a1-47b8-ba37-c9e413ca3ee3@quicinc.com>
In-Reply-To: <afb0698e-68a1-47b8-ba37-c9e413ca3ee3@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 5 Jun 2024 15:13:16 -0700
Message-ID: <CAF6AEGsNSH4ZccWFN5F3o1uaFUqjpNQROON0QM2n6QnDT0Lq9A@mail.gmail.com>
Subject: Re: [PATCH v9 3/5] iommu/arm-smmu: introduction of ACTLR for custom
 prefetcher settings
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jsnitsel@redhat.com, 
	quic_bjorande@quicinc.com, mani@kernel.org, quic_eberman@quicinc.com, 
	robdclark@chromium.org, u.kleine-koenig@pengutronix.de, robh@kernel.org, 
	vladimir.oltean@nxp.com, quic_pkondeti@quicinc.com, quic_molvera@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 5, 2024 at 3:52=E2=80=AFAM Bibek Kumar Patro
<quic_bibekkum@quicinc.com> wrote:
>
> On 6/5/2024 12:19 AM, Rob Clark wrote:
> > On Thu, May 30, 2024 at 2:22=E2=80=AFAM Bibek Kumar Patro
> > <quic_bibekkum@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 5/28/2024 9:38 PM, Rob Clark wrote:
> >>> On Tue, May 28, 2024 at 6:06=E2=80=AFAM Dmitry Baryshkov
> >>> <dmitry.baryshkov@linaro.org> wrote:
> >>>>
> >>>> On Tue, May 28, 2024 at 02:59:51PM +0200, Konrad Dybcio wrote:
> >>>>>
> >>>>>
> >>>>> On 5/15/24 15:59, Bibek Kumar Patro wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 5/10/2024 6:32 PM, Konrad Dybcio wrote:
> >>>>>>> On 10.05.2024 2:52 PM, Bibek Kumar Patro wrote:
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> On 5/1/2024 12:30 AM, Rob Clark wrote:
> >>>>>>>>> On Tue, Jan 23, 2024 at 7:00=E2=80=AFAM Bibek Kumar Patro
> >>>>>>>>> <quic_bibekkum@quicinc.com> wrote:
> >>>>>>>>>>
> >>>>>>>>>> Currently in Qualcomm  SoCs the default prefetch is set to 1 w=
hich allows
> >>>>>>>>>> the TLB to fetch just the next page table. MMU-500 features AC=
TLR
> >>>>>>>>>> register which is implementation defined and is used for Qualc=
omm SoCs
> >>>>>>>>>> to have a custom prefetch setting enabling TLB to prefetch the=
 next set
> >>>>>>>>>> of page tables accordingly allowing for faster translations.
> >>>>>>>>>>
> >>>>>>>>>> ACTLR value is unique for each SMR (Stream matching register) =
and stored
> >>>>>>>>>> in a pre-populated table. This value is set to the register du=
ring
> >>>>>>>>>> context bank initialisation.
> >>>>>>>>>>
> >>>>>>>>>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> >>>>>>>>>> ---
> >>>>>>>
> >>>>>>> [...]
> >>>>>>>
> >>>>>>>>>> +
> >>>>>>>>>> +               for_each_cfg_sme(cfg, fwspec, j, idx) {
> >>>>>>>>>> +                       smr =3D &smmu->smrs[idx];
> >>>>>>>>>> +                       if (smr_is_subset(smr, id, mask)) {
> >>>>>>>>>> +                               arm_smmu_cb_write(smmu, cbndx,=
 ARM_SMMU_CB_ACTLR,
> >>>>>>>>>> +                                               actlrcfg[i].ac=
tlr);
> >>>>>>>>>
> >>>>>>>>> So, this makes ACTLR look like kind of a FIFO.  But I'm looking=
 at
> >>>>>>>>> downstream kgsl's PRR thing (which we'll need to implement vulk=
an
> >>>>>>>>> sparse residency), and it appears to be wanting to set BIT(5) i=
n ACTLR
> >>>>>>>>> to enable PRR.
> >>>>>>>>>
> >>>>>>>>>             val =3D KGSL_IOMMU_GET_CTX_REG(ctx, KGSL_IOMMU_CTX_=
ACTLR);
> >>>>>>>>>             val |=3D FIELD_PREP(KGSL_IOMMU_ACTLR_PRR_ENABLE, 1)=
;
> >>>>>>>>>             KGSL_IOMMU_SET_CTX_REG(ctx, KGSL_IOMMU_CTX_ACTLR, v=
al);
> >>>>>>>>>
> >>>>>>>>> Any idea how this works?  And does it need to be done before or=
 after
> >>>>>>>>> the ACTLR programming done in this patch?
> >>>>>>>>>
> >>>>>>>>> BR,
> >>>>>>>>> -R
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>> Hi Rob,
> >>>>>>>>
> >>>>>>>> Can you please help provide some more clarification on the FIFO =
part? By FIFO are you referring to the storing of ACTLR data in the table?
> >>>>>>>>
> >>>>>>>> Thanks for pointing to the downstream implementation of kgsl dri=
ver for
> >>>>>>>> the PRR bit. Since kgsl driver is already handling this PRR bit'=
s
> >>>>>>>> setting, this makes setting the PRR BIT(5) by SMMU driver redund=
ant.
> >>>>>>>
> >>>>>>> The kgsl driver is not present upstream.
> >>>>>>>
> >>>>>>
> >>>>>> Right kgsl is not present upstream, it would be better to avoid co=
nfiguring the PRR bit and can be handled by kgsl directly in downstream.
> >>>>>
> >>>>> No! Upstream is not a dumping ground to reduce your technical debt.
> >>>>>
> >>>>> There is no kgsl driver upstream, so this ought to be handled here,=
 in
> >>>>> the iommu driver (as poking at hardware A from driver B is usually =
not good
> >>>>> practice).
> >>>>
> >>>> I'd second the request here. If another driver has to control the
> >>>> behaviour of another driver, please add corresponding API for that.
> >>>
> >>> We have adreno_smmu_priv for this purpose ;-)
> >>>
> >>
> >> Thanks Rob for pointing to this private interface structure between sm=
mu
> >> and gpu. I think it's similar to what you're trying to implement here
> >> https://lore.kernel.org/all/CAF6AEGtm-KweFdMFvahH1pWmpOq7dW_p0Xe_13aHG=
Wt0jSbg8w@mail.gmail.com/#t
> >> I can add an api "set_actlr_prr()" with smmu_domain cookie, page point=
er
> >> as two parameters. This api then can be used by drm/msm driver to carr=
y
> >> out the prr implementation by simply calling this.
> >> Would this be okay Rob,Konrad,Dmitry?
> >> Let me know if any other suggestions you have in mind as well regardin=
g
> >> parameters and placement.
> >
> > Hey Bibek, quick question.. is ACTLR preserved across a suspend/resume
> > cycle?  Or does it need to be reprogrammed on resume?  And same
> > question for these two PRR related regs:
> >
> >    /* Global SMMU register offsets */
> >    #define KGSL_IOMMU_PRR_CFG_LADDR        0x6008
> >    #define KGSL_IOMMU_PRR_CFG_UADDR        0x600c
> >
> > (ie. high/low 32b of the PRR page)
> >
>
> Hey Rob, In suspend/resume, the register space power rails are not in
> disabled state, so it won't go back to reset values and should retain
> it's value. Only in hibernation cycle the registers' value would get rese=
t.
>
> So the hi/low address bit register for PRR page would also retain it's
> value along with the ACTLR registers.
>
> > I was starting to type up a patch to add PRR configuration, but
> > depending on whether it interacts with suspend/resume, it might be
> > better form arm-smmu-qcom.c to just always enable and configure PRR
> > (including allocating a page to have an address to program into
> > PRR_CFG_LADDR/UADDR), and instead add an interface to return the PRR
> > page?  I think there is no harm in unconditionally configuring PRR for
> > gpu smmu.
>
> Sounds okay though since this would not interact with suspend/resume path=
.
> But I think, suppose in-case this page would have some other references
> as well before configuring the address to the registers for PRR
> configuration, then  GPU would be dependent on arm-smmu-qcom for this pag=
e.
> So Instead an endpoint api in arm-smmu-qcom.c can recieve the just the
> page-address, and bit set status from drm/msm driver and can set/reset
> the bit along with any page-address they want ?
> It would mean the interface will be smmu's , but the choice of
> configuration data to the registers' will be still with gpu.
>
> I wrote up a small patch with this implementation, would you like to
> review that?
> Will send it in this v11 series as new patch.

I think if there is no suspend/resume interaction, we should go back
to the original idea of page allocation in drm/msm.

Basically, I think the pros and cons are:

allocate in arm-smmu
  pro: easy to sequence programming with suspend/resume
  con: there isn't a convenient place to free the page on driver unload

allocate in drm/msm:
  pro: easy place to free the page in teardown
  con: harder to sequence with s/r

But if ACTLR and PRR_CFG_LADDR/UADDR are retained, then the con isn't
actually an issue ;-)

Anyways, I can type that patch..  the rest of drm/msm and userspace
changes (vm_bind + sparse) to get to the point where I can use PRR are
a somewhat bigger task so it will take me a while to get the point
where I can test any smmu patches.

BR,
-R


> Thanks & regards,
> Bibek
>
> >
> > BR,
> > -R
> >
> >> Thanks & regards,
> >> Bibek
> >>
> >>> BR,
> >>> -R
> >>>
> >>>>>
> >>>>>>
> >>>>>>>> Thanks for bringing up this point.
> >>>>>>>> I will send v10 patch series removing this BIT(5) setting from t=
he ACTLR
> >>>>>>>> table.
> >>>>>>>
> >>>>>>> I think it's generally saner to configure the SMMU from the SMMU =
driver..
> >>>>>>
> >>>>>> Yes, agree on this. But since PRR bit is not directly related to S=
MMU
> >>>>>> configuration so I think it would be better to remove this PRR bit
> >>>>>> setting from SMMU driver based on my understanding.
> >>>>>
> >>>>> Why is it not related? We still don't know what it does.
> >>>>>
> >>>>> Konrad
> >>>>
> >>>> --
> >>>> With best wishes
> >>>> Dmitry

