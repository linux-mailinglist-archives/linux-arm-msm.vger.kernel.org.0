Return-Path: <linux-arm-msm+bounces-51039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B29A5CE53
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 19:58:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20E321796CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 18:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCD9A2638BD;
	Tue, 11 Mar 2025 18:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jSIpiGJk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B8C149C55;
	Tue, 11 Mar 2025 18:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741719483; cv=none; b=ZF+a9xbq5+1pMEQpRPZ4vnrEVg0m2caP4EEfn9Hh5EwMWOe+vbEKA3hGVooL0VVFLiNC+Dh2HxOJc/GjiX2wdInCWIHPKIREfEyh3TLO7sR/afjTGCqzBRIv/FirW20PAaCqxFv9D3/DrGw9JpcR1EE0kI3BxTpPG90mm2K+B1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741719483; c=relaxed/simple;
	bh=H0YUnZgn3kS4q5aJPaCCPyYjqRuXp8gJMQR2aHdY/es=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=txe9EZDKtXenBkD25zM7FJlLUuHYRU5ZZE8WErGs6SwZ82lPLnOmCp9ylihFk2hBMd3geFqicUTls0AiRYL92P9z2g4tfU2LxvzMLGkY9gYHzU91+DcHtfcz7kkpP4v0LbYYvrIcITw2Q926FTaikYKozz2SORO1YbJD6OKIbTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jSIpiGJk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28BB7C4CEE9;
	Tue, 11 Mar 2025 18:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741719483;
	bh=H0YUnZgn3kS4q5aJPaCCPyYjqRuXp8gJMQR2aHdY/es=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jSIpiGJkXaaT1eLewPodBpgE2myV2gEwryf8sM0z2NCOPmK4ybjEWcSaDurh8eXCq
	 BVlp7eJ2pU7YvrR981J/CW/c47J3RaqWLGL6gnKRpmpf4l1/sfPoVk8perJZMRKeOB
	 6wken0eVXJkeAShl07IPP1/WFlr1bwURwRC5GaDG62LvdgMlxicExbouMvQ4xc6rTW
	 4nA5iDzt3MFYyR8ysNuNlSLVj8KwkItxudg5jw+8P5WKRa285/q2hiAFbBzkYMWih4
	 TUHKibEfBKwIqbH3vBPkSk2COFw21jsMhBPVPbTk3FhEivtGw9VW1qmJKWwyLcGCmn
	 JX+aHhgXnXiZA==
Date: Tue, 11 Mar 2025 20:57:58 +0200
From: Dmitry Baryshkov <lumag@kernel.org>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm interconnects as
 built-in
Message-ID: <uljqxwfgl26txrfqvkvzzpj6qurgmwcbuot7gu2u6rwjaqgncb@jeuyi4mexjff>
References: <20250311-wip-obbardc-qcom-defconfig-interconnects-builtin-v1-1-675b6bc57176@linaro.org>
 <CACr-zFC=mPNeeHMp9XnSby+cMQaPWt_3s8iUiCN+EnVPeGad8Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACr-zFC=mPNeeHMp9XnSby+cMQaPWt_3s8iUiCN+EnVPeGad8Q@mail.gmail.com>

On Tue, Mar 11, 2025 at 07:10:06PM +0100, Christopher Obbard wrote:
> I sent this patch to start the discussion, some things I found:
> 
> 1) Some interconnects are missing from arm defconfig. Should they be =y too ?

No, unless those are required for the UART console.

> $ grep CONFIG_INTERCONNECT_QCOM arch/arm/configs/qcom_defconfig
> CONFIG_INTERCONNECT_QCOM=y
> CONFIG_INTERCONNECT_QCOM_MSM8974=m
> CONFIG_INTERCONNECT_QCOM_SDX55=m
> 
> 2) Some interconnects are missing from arm64 defconfig (which should
> probably be in there) (I have included just two examples):

I think `git log -S CONFIG_INTERCONNECT_QCOM
arch/arm64/configs/defconfig` will answer this question. The drivers are
enabled on the premises of being required for a particular device, not
because they exist in the Linux kernel.

> $ grep CONFIG_INTERCONNECT drivers/interconnect/qcom/Makefile
> obj-$(CONFIG_INTERCONNECT_QCOM_QCS615) += qnoc-qcs615.o
> obj-$(CONFIG_INTERCONNECT_QCOM_SM7150) += qnoc-sm7150.o
> 
> I can handle these in follow-up or v2 of the patchset as follow-up
> commits, please let me know what you'd prefer.
> 
> On Tue, 11 Mar 2025 at 19:03, Christopher Obbard
> <christopher.obbard@linaro.org> wrote:
> >
> > Currently some Qualcomm interconnect drivers are enabled
> > as modules which isn't overly useful since the interconnects
> > are required to be loaded during early boot.
> >
> > Loading the interconnects late (e.g. in initrd or as module)
> > can cause boot issues, such as slowdown or even not booting
> > at all (since the interconnect would be required for storage
> > devices).
> >
> > Be consistent and enable all of the Qualcomm interconnect
> > drivers as built-in to the kernel image.
> >
> > Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> > ---
> >  arch/arm64/configs/defconfig | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > index 219ef05ee5a757c43a37ec9f8571ce9976354830..6582baee2ab02ecb2ff442c6e73aa6a23fee8d7f 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -1656,11 +1656,11 @@ CONFIG_INTERCONNECT_IMX8MN=m
> >  CONFIG_INTERCONNECT_IMX8MQ=m
> >  CONFIG_INTERCONNECT_IMX8MP=y
> >  CONFIG_INTERCONNECT_QCOM=y
> > -CONFIG_INTERCONNECT_QCOM_MSM8916=m
> > +CONFIG_INTERCONNECT_QCOM_MSM8916=y
> >  CONFIG_INTERCONNECT_QCOM_MSM8996=y
> > -CONFIG_INTERCONNECT_QCOM_OSM_L3=m
> > +CONFIG_INTERCONNECT_QCOM_OSM_L3=y
> >  CONFIG_INTERCONNECT_QCOM_QCM2290=y
> > -CONFIG_INTERCONNECT_QCOM_QCS404=m
> > +CONFIG_INTERCONNECT_QCOM_QCS404=y
> >  CONFIG_INTERCONNECT_QCOM_QCS615=y
> >  CONFIG_INTERCONNECT_QCOM_QCS8300=y
> >  CONFIG_INTERCONNECT_QCOM_QDU1000=y
> >
> > ---
> > base-commit: b098bcd8278b89cb3eb73fdb6e06dc49af75ad37
> > change-id: 20250311-wip-obbardc-qcom-defconfig-interconnects-builtin-258fcc961b11
> >
> > Best regards,
> > --
> > Christopher Obbard <christopher.obbard@linaro.org>
> >

-- 
With best wishes
Dmitry

