Return-Path: <linux-arm-msm+bounces-23623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6C5912ACE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 18:03:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BABF5B253A4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 16:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8D7715FA8E;
	Fri, 21 Jun 2024 16:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e3Kx0nfV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B236215FA80;
	Fri, 21 Jun 2024 16:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718985707; cv=none; b=DqTTOM37t2/1mlOukZKaM4hSPSlVSO68FnHhybcjONsWEivGoFRjFwqV/5WVVZOoX7sZdcKDOG3aa4BFjWEB2YmJk8DuEoiMT2sk/u4H3pHNcEVMy11cO88vlEAuTHbdmcjdTCbu+ZE9d5bf+tyNoPrbcOKKpCRzoQLAuR0E8ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718985707; c=relaxed/simple;
	bh=8v/eEGyFKY5gIZxnTxHoa5Tk339bix4846v13RAQ1fU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q0O03+x7uLOjH2MtX2GYpqFplAjcID23IhIQb9735tNeC2fn4Fg9Qpb+rcWMfoy9Reba5HtSP06Dpl5rfrY4fxlE0a2qrRrnBPqIcofyJMjA0kk/niQYGCA1dXpcaFWFDTpVYQKN8jIkOAfAdYVYyBEJaazbxs7t+GGPkpGpYl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e3Kx0nfV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74EDEC2BBFC;
	Fri, 21 Jun 2024 16:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718985707;
	bh=8v/eEGyFKY5gIZxnTxHoa5Tk339bix4846v13RAQ1fU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e3Kx0nfVNTQdGiS+EXiNuS8Ff9ugwc/B9NUkC0TH+vzENHZ4xwj8vql3R3uFeY6wz
	 K4k4NsKJ+54dLDGjyYdiDsZNGSeE2eSi8nny45lw3cPVjVYm1/vl9LePRAV/hF15Z1
	 C9mBsXCgN5JQi/72ufehpDqtVl3Bji9Yv1vNJ/vTzWSx0F3tYm8+J98pKXnUkj/PBL
	 9Y4UwN5zguSJkKfNWZisLZl/14Y6O89kvnyeL2efq/S5CyxUmIVS32nbLBUKhzaOly
	 mW1aLqaDbhiyI32S30aPL6C9dOaGJcHi3hGab/I97tGVOWoUKKCZ6JyY3kJmdj/dXK
	 yITUPP3efhCWQ==
Date: Fri, 21 Jun 2024 09:01:44 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Gaurav Kashyap <gaurkash@qti.qualcomm.com>
Cc: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
	"Gaurav Kashyap (QUIC)" <quic_gaurkash@quicinc.com>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"andersson@kernel.org" <andersson@kernel.org>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"srinivas.kandagatla" <srinivas.kandagatla@linaro.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	kernel <kernel@quicinc.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"Om Prakash Singh (QUIC)" <quic_omprsing@quicinc.com>,
	"Bao D. Nguyen (QUIC)" <quic_nguyenb@quicinc.com>,
	"bartosz.golaszewski" <bartosz.golaszewski@linaro.org>,
	"konrad.dybcio@linaro.org" <konrad.dybcio@linaro.org>,
	"ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
	"jejb@linux.ibm.com" <jejb@linux.ibm.com>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>,
	"mani@kernel.org" <mani@kernel.org>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
	Prasad Sodagudi <psodagud@quicinc.com>,
	Sonal Gupta <sonalg@quicinc.com>
Subject: Re: [PATCH v5 04/15] soc: qcom: ice: add hwkm support in ice
Message-ID: <20240621160144.GB2081@sol.localdomain>
References: <20240617005825.1443206-1-quic_gaurkash@quicinc.com>
 <20240617005825.1443206-5-quic_gaurkash@quicinc.com>
 <3eehkn3cdhhjfqtzpahxhjxtu5uqwhntpgu22k3hknctrop3g5@f7dhwvdvhr3k>
 <96e2ce4b154a4f918be0bc2a45011e6d@quicinc.com>
 <CAA8EJppGpv7N_JQQNJZrbngBBdEKZfuqutR9MPnS1R_WqYNTQw@mail.gmail.com>
 <3a15df00a2714b40aba4ebc43011a7b6@quicinc.com>
 <CAA8EJpoZ0RR035QwzMLguJZvdYb-C6aqudp1BgHgn_DH2ffsoQ@mail.gmail.com>
 <20240621044747.GC4362@sol.localdomain>
 <CY8PR02MB9502E314820C659AF080DB93E2C92@CY8PR02MB9502.namprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CY8PR02MB9502E314820C659AF080DB93E2C92@CY8PR02MB9502.namprd02.prod.outlook.com>

On Fri, Jun 21, 2024 at 03:35:40PM +0000, Gaurav Kashyap wrote:
> Hello Eric
> 
> On 06/20/2024, 9:48 PM PDT, Eric Biggers wrote:
> > On Thu, Jun 20, 2024 at 02:57:40PM +0300, Dmitry Baryshkov wrote:
> > > > > >
> > > > > > > Is it possible to use both kind of keys when working on standard
> > mode?
> > > > > > > If not, it should be the user who selects what type of keys to be
> > used.
> > > > > > > Enforcing this via DT is not a way to go.
> > > > > > >
> > > > > >
> > > > > > Unfortunately, that support is not there yet. When you say user,
> > > > > > do you mean to have it as a filesystem mount option?
> > > > >
> > > > > During cryptsetup time. When running e.g. cryptsetup I, as a user,
> > > > > would like to be able to use either a hardware-wrapped key or a
> > standard key.
> > > > >
> > > >
> > > > What we are looking for with these patches is for per-file/folder
> > encryption using fscrypt policies.
> > > > Cryptsetup to my understanding supports only full-disk , and does
> > > > not support FBE (File-Based)
> > >
> > > I must admit, I mostly used dm-crypt beforehand, so I had to look at
> > > fscrypt now. Some of my previous comments might not be fully
> > > applicable.
> > >
> > > > Hence the idea here is that we mount an unencrypted device (with the
> > > > inlinecrypt option that indicates inline encryption is supported) And
> > specify policies (links to keys) for different folders.
> > > >
> > > > > > The way the UFS/EMMC crypto layer is designed currently is that,
> > > > > > this information is needed when the modules are loaded.
> > > > > >
> > > > > > https://lore.kernel.org/all/20231104211259.17448-2-ebiggers@kern
> > > > > > el.org /#Z31drivers:ufs:core:ufshcd-crypto.c
> > > > >
> > > > > I see that the driver lists capabilities here. E.g. that it
> > > > > supports HW-wrapped keys. But the line doesn't specify that standard
> > keys are not supported.
> > > > >
> > > >
> > > > Those are capabilities that are read from the storage controller.
> > > > However, wrapped keys Are not a standard in the ICE JEDEC
> > > > specification, and in most cases, is a value add coming from the SoC.
> > > >
> > > > QCOM SOC and firmware currently does not support both kinds of keys in
> > the HWKM mode.
> > > > That is something we are internally working on, but not available yet.
> > >
> > > I'd say this is a significant obstacle, at least from my point of
> > > view. I understand that the default might be to use hw-wrapped keys,
> > > but it should be possible for the user to select non-HW keys if the
> > > ability to recover the data is considered to be important. Note, I'm
> > > really pointing to the user here, not to the system integrator. So
> > > using DT property or specifying kernel arguments to switch between
> > > these modes is not really an option.
> > >
> > > But I'd really love to hear some feedback from linux-security and/or
> > > linux-fscrypt here.
> > >
> > > In my humble opinion the user should be able to specify that the key
> > > is wrapped using the hardware KMK. Then if the hardware has already
> > > started using the other kind of keys, it should be able to respond
> > > with -EINVAL / whatever else. Then the user can evict previously
> > > programmed key and program a desired one.
> > >
> > > > > Also, I'd have expected that hw-wrapped keys are handled using
> > > > > trusted keys mechanism (see security/keys/trusted-keys/). Could
> > > > > you please point out why that's not the case?
> > > > >
> > > >
> > > > I will evaluate this.
> > > > But my initial response is that we currently cannot communicate to
> > > > our TPM directly from HLOS, but goes through QTEE, and I don't think
> > > > our qtee currently interfaces with the open source tee driver. The
> > interface is through QCOM SCM driver.
> > >
> > > Note, this is just an API interface, see how it is implemented for the
> > > CAAM hardware.
> > >
> > 
> > The problem is that this patchset was sent out without the patches that add
> > the block and filesystem-level framework for hardware-wrapped inline
> > encryption keys, which it depends on.  So it's lacking context.  The proposed
> > framework can be found at https://lore.kernel.org/linux-
> > block/20231104211259.17448-1-ebiggers@kernel.org/T/#u
> > 
> 
> I have only been adding the fscryp patch link as part of the cover letter - as a dependency.
> https://lore.kernel.org/all/20240617005825.1443206-1-quic_gaurkash@quicinc.com/
> If you would like me to include it in the patch series itself, I can do that as well.
> 

I think including all prerequisite patches would be helpful for reviewers.

Thanks for continuing to work on this!

I still need to get ahold of a sm8650 based device and test this out.  Is the
SM8650 HDK the only option, or is there a sm8650 based phone with upstream
support yet?

- Eric

