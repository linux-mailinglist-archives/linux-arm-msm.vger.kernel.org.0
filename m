Return-Path: <linux-arm-msm+bounces-73177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2082B53C2E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 21:19:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B26D75A6524
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 19:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2E8625A322;
	Thu, 11 Sep 2025 19:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uGJFroi+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7627C257437;
	Thu, 11 Sep 2025 19:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757618382; cv=none; b=Xo2klAyGSJ7jTSTYzdxZTJ7/8hhX70td4CaTp5A/swgi+3tI0Jet4Cci446WVpMeu39F7j9wC9nmb24VnMsan7PHyC5e2F4hfhu9xkXRIKJQqYvzevn3gKLhsHAfnv5z4xt9KYwybKowjWsIbhaNyEWYmXTOhpjYFX350+nuh9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757618382; c=relaxed/simple;
	bh=yoLms4BJJ8dwb0l5dNqi3cVT2240JlTbGu0y3gjZuqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QtuGHRDpVFnWO/DwWD8uhTWkHS4Vp4sYjq3EZNE8cTGH8WiFGp2m0qJtFrn5OkKNvI93HNWz6SwlcgABI1k0650F5jSiSsAjIHaOpcJ0CNbmRBFXfysrBpKMQ9GVHKDnidtta7m8F4XersIEvCYwjRHfCwIOcirPlUc1gvqvKvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uGJFroi+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5376FC4CEF0;
	Thu, 11 Sep 2025 19:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757618382;
	bh=yoLms4BJJ8dwb0l5dNqi3cVT2240JlTbGu0y3gjZuqM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uGJFroi+WRT9fNMHfYIgY1tCeeLecECwMzjb1jKbsydWjHgSqCBhnthcOyPL4LFzO
	 htASV+CM4T93E13qknjQUyAvDwENN+Ssrp9GPJ0570jnL8MeNq7egnnbXH+RzjgnSO
	 /WmLtAyevYSIkmQUMdU4yMbaepFkk/m/bSf5uicbvb0if9xM+KZ4KOu5cE0f3D4XTk
	 HFVLuWyVoKUk/HKncO8yfBwcm9S/cPRilPuU/CyxnomiPq5DO4l08soc6JzGoIoto+
	 xfb4RS2g+v0YTMNg7douSem+u/HdXoSBbO+Q/OFH+jlwjm5scgwBWGT94tqzenrmi0
	 dGKu8aLWVtNYw==
Date: Thu, 11 Sep 2025 14:19:39 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: dts: qcom: qcm6490: Introduce Particle Tachyon
Message-ID: <nweaxuma3dkhzcc46ztfhmxxrchgidxjprc2tz5eahle6sxsuy@qvczmexs4qnn>
References: <20250910-tachyon-v1-0-5090bfd133e0@oss.qualcomm.com>
 <2tnzsjw3xy5jct4bcmahcwhjbzlmyxgcx6fzlz5qrzxume2uoy@phpcz6mnydlt>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2tnzsjw3xy5jct4bcmahcwhjbzlmyxgcx6fzlz5qrzxume2uoy@phpcz6mnydlt>

On Thu, Sep 11, 2025 at 03:01:35AM +0300, Dmitry Baryshkov wrote:
> On Wed, Sep 10, 2025 at 06:05:36PM -0500, Bjorn Andersson wrote:
> > Introduce the Particle Tachyon board (https://www.particle.io/tachyon/),
> > a single board compute with 5G connectivity and AI accelerator.
> > 
> > The boards currently ships with the Android Boot Loader, but replacing
> > this with abl2esp allows writing a EFI System Parition and OS partitions
> > to all of LUN0, and a more UEFI boot experience. A prebuilt version of
> > abl2esp is provided at [1], as abl2esp-v6.elf.
> > 
> > With a (very) recent version of QDL, a flash programmer from a Tachyon
> > software release, and a full distro image, this can be achieved with:
> > 
> >   qdl prog_firehose_ddr.elf write abl_a abl2esp-v6.elf write abl_b abl2esp-v6.elf write 0 image.raw
> > 
> > The following firmware files are currently used, on top of what's in
> > linux-firmware already:
> >   qcom/qcm6490/particle/tachyon/a660_zap.mbn
> >   qcom/qcm6490/particle/tachyon/adsp.mbn
> >   qcom/qcm6490/particle/tachyon/cdsp.mbn
> >   qcom/qcm6490/particle/tachyon/ipa_fws.mbn
> >   qcom/qcm6490/particle/tachyon/modem.mbn
> 
> Is it locked?

It doesn't look that way.

> Would it be possible to Particle-signed firmware into linux-firmware?

That is something that would have to be discussed...

Regards,
Bjorn

> 
> > 
> > In addition to bug fixes that has landed in v6.17-rc this depends on
> > [2], which is available in linux-next.
> > 
> > [1] https://github.com/qualcomm/abl2esp/releases/tag/v1.0
> > [2] https://lore.kernel.org/all/20250811-sc7280-mdss-reset-v1-0-83ceff1d48de@oss.qualcomm.com/
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > ---
> > Bjorn Andersson (3):
> >       dt-bindings: vendor-prefixes: Add Particle Industries
> >       dt-bindings: arm: qcom: Add Particle Tachyon
> >       arm64: dts: qcom: qcm6490: Introduce the Particle Tachyon
> > 
> >  Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
> >  .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
> >  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
> >  .../boot/dts/qcom/qcm6490-particle-tachyon.dts     | 877 +++++++++++++++++++++
> >  4 files changed, 881 insertions(+)
> > ---
> > base-commit: 5f540c4aade9f1d58fb7b9490b4b7d5214ec9746
> > change-id: 20250910-tachyon-e3548941397d
> > 
> > Best regards,
> > -- 
> > Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > 
> 
> -- 
> With best wishes
> Dmitry

