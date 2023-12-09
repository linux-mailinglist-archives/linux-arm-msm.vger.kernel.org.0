Return-Path: <linux-arm-msm+bounces-4072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E973D80B1D4
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Dec 2023 04:04:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83B0428179C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Dec 2023 03:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D547810;
	Sat,  9 Dec 2023 03:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="euQO/kIO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDA07F
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Dec 2023 03:04:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DFC8C433C7;
	Sat,  9 Dec 2023 03:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702091047;
	bh=3vQltoRukTTkz1lHKqidQXyH2BgK0KFdahQb9p9Gphg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=euQO/kIOq9QJRIEbTN3QKzcG2KrxK7XjTbfxD/08JVC4ltMtWrMiMj5KtaHAQqCbK
	 Awft419GqWojtfhlvVcl784n4M4hq76nuRFzW+Df+ETPv4zGOagqg8LO34U7iH9xSP
	 ZShHcrhDrKMyMMNCeIxX9O5m07CrOfRAByqEMZ7PAS/mw1jxp+7AXYoWsoMZqvClDA
	 CdUlNMyNInmaHXo15pivb07FziAr/zHGBNwUVQe3rib/C3bPjTbKVuDEOietn4QFnj
	 mvCz9BTzHeVThdYYsGFgQ6ctJLz56ZZ2vgUmsOWWcxRkmiyW9Gb3XzwIrJS/4maPDw
	 8Ye/66y3CZzzg==
Date: Fri, 8 Dec 2023 19:08:41 -0800
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Petr Vorel <pvorel@suse.cz>, linux-arm-msm@vger.kernel.org, 
	Petr Vorel <petr.vorel@gmail.com>, Martin Botka <martin.botka@somainline.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Aboothahir U <aboothahirpkd@gmail.com>
Subject: Re: [PATCH v2 1/1] arm64: defconfig: Enable SDM660 Clock Controllers
Message-ID: <xvbvpefm5gwr5yogd6vvnhhxzjktdxlu7dpya3pms35e6b6dcq@gibfakuohmtc>
References: <20231115205318.2536441-1-pvorel@suse.cz>
 <2bferiemkljxua63v6ogifpzhlbj6m2gycxrbitgmc3ybj2a4p@7kfnzcrjj6jr>
 <CAA8EJpoEzTeOSVy5qVCs6eSBTxWKRfDq0UzrEjz1Kx1sG9xkCg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpoEzTeOSVy5qVCs6eSBTxWKRfDq0UzrEjz1Kx1sG9xkCg@mail.gmail.com>

On Thu, Dec 07, 2023 at 08:54:32PM +0200, Dmitry Baryshkov wrote:
> On Thu, 7 Dec 2023 at 18:27, Bjorn Andersson <andersson@kernel.org> wrote:
> >
> > On Wed, Nov 15, 2023 at 09:53:18PM +0100, Petr Vorel wrote:
> > > From: Petr Vorel <petr.vorel@gmail.com>
> > >
> > > Enable support for the multimedia clock controller on SDM660 devices
> > > and graphics clock controller on SDM630/636/660 devices.
> > >
> > > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> > > ---
> > > Changes v1->v2:
> > > * added commit message (not just the subject)
> > >
> > > NOTE motivation for this is that some not yet mainlined DTS already use
> > > both:
> > >
> > > https://github.com/sdm660-mainline/linux/blob/sdm660-next-stable/arch/arm64/boot/dts/qcom/sdm636-asus-x00td.dts
> > >
> > > Kind regards,
> > > Petr
> > >
> > >  arch/arm64/configs/defconfig | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > > index acba803835b9..10a098aa8b1b 100644
> > > --- a/arch/arm64/configs/defconfig
> > > +++ b/arch/arm64/configs/defconfig
> > > @@ -1235,6 +1235,8 @@ CONFIG_SC_GCC_8180X=y
> > >  CONFIG_SC_GCC_8280XP=y
> > >  CONFIG_SC_GPUCC_8280XP=m
> > >  CONFIG_SC_LPASSCC_8280XP=m
> > > +CONFIG_SDM_MMCC_660=m
> > > +CONFIG_SDM_GPUCC_660=y
> >
> > I'd expect the GPU clock controller to be a module, can you please
> > clarify why it needs to be builtin?
> 
> To allow the display to be enabled early enough?
> 

If that's your goal, then it might be less optimal to have MMCC as a
module...

We should keep drivers essential for reaching the ramdisk as builtin
(which pretty much means the stuff necessary to establish /dev/console),
and then the rest as modules.

There are several here which are =y because it used to be that probe
deferral on power-domains didn't work. We should drop those to =m as
well...

Thanks,
Bjorn

> >
> > Regards,
> > Bjorn
> >
> > >  CONFIG_SDM_CAMCC_845=m
> > >  CONFIG_SDM_GPUCC_845=y
> > >  CONFIG_SDM_VIDEOCC_845=y
> > > --
> > > 2.42.0
> > >
> >
> 
> 
> -- 
> With best wishes
> Dmitry

