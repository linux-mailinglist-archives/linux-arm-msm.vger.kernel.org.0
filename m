Return-Path: <linux-arm-msm+bounces-23629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2AE912B63
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 18:31:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A10C91C211A4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 16:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AA05128812;
	Fri, 21 Jun 2024 16:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P5CMEdUK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C861208C4;
	Fri, 21 Jun 2024 16:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718987490; cv=none; b=oDNS1UOUh45KisFUQVK7CI4VFlEtpsbC+tH18nvVMD1+kwQWj2y03evTtG9rVNY0qE65PJaKyRBSN0OGL1G3ycIaDQVY7Kmy4QAPLVhgDAmMm9NwsLRMQYU/oeI5HrOVAHFCygEPNrHIiZfluajpIwZqVe8xLxvvcQLGomcdBmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718987490; c=relaxed/simple;
	bh=nPphPUeEU2Y1VOGdc8liNZZNuQZI5X8YMgWw9y27L5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K3eKPIMLLeazwQ69/Iwx1/euQJYLEz17xgKK/j3f67Cd703qmqPMfY37WT6b9oBmjmw2F3RFcC1e77URv0xGvqGiby/5Z+T2m8GztHbmg95SvetQ+7e+NFkZ8v59H7jFqpBdhnc26idHeDZpAJPlpEEYaGupkuWKg3LM7bSc9wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P5CMEdUK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DBA0C2BBFC;
	Fri, 21 Jun 2024 16:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718987489;
	bh=nPphPUeEU2Y1VOGdc8liNZZNuQZI5X8YMgWw9y27L5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P5CMEdUK+9O+VtZhP50Xja+3J1Ax0+1spF2JIzICS3tzGelE6VxNXyzlgEDnoOqC+
	 vLSIZo3FSGD1UZfzBm/53edB+bhFy1cQ3qkMDIQQowLlOMuZ3Y1EdL8BLW3EQPb+s3
	 H24KGWVbzLElqdtDDoAfylcQd/MsFmJX4v9Q5iC7u74eZoP7eD6r6y2/V6CzAfSrXY
	 vfjH8TNHeK4QO68xkkjckspLpj0onmxa0DYIKEhauFVgPmfQZyxbB5dTdMbXLbV38z
	 P9QeI2FS8MNa5wuxelTMuBWPNT/wX2vQO07tqNFP6b8YqxEsPlq0zY/DGLaA1mCz15
	 lOj5veLn3CoVw==
Date: Fri, 21 Jun 2024 09:31:27 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: "Gaurav Kashyap (QUIC)" <quic_gaurkash@quicinc.com>,
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
Message-ID: <20240621163127.GC2081@sol.localdomain>
References: <20240617005825.1443206-5-quic_gaurkash@quicinc.com>
 <3eehkn3cdhhjfqtzpahxhjxtu5uqwhntpgu22k3hknctrop3g5@f7dhwvdvhr3k>
 <96e2ce4b154a4f918be0bc2a45011e6d@quicinc.com>
 <CAA8EJppGpv7N_JQQNJZrbngBBdEKZfuqutR9MPnS1R_WqYNTQw@mail.gmail.com>
 <3a15df00a2714b40aba4ebc43011a7b6@quicinc.com>
 <CAA8EJpoZ0RR035QwzMLguJZvdYb-C6aqudp1BgHgn_DH2ffsoQ@mail.gmail.com>
 <20240621044747.GC4362@sol.localdomain>
 <CAA8EJppXsbpFCeGJOMGKOQddy0fF4uW3rt4RUuDTQq6mPunBkg@mail.gmail.com>
 <20240621153939.GA2081@sol.localdomain>
 <CAA8EJpqV4CW9kKLVUZgfo+hkSv+tn0t+k0McmHEyXNJUpsZF1w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpqV4CW9kKLVUZgfo+hkSv+tn0t+k0McmHEyXNJUpsZF1w@mail.gmail.com>

On Fri, Jun 21, 2024 at 07:06:25PM +0300, Dmitry Baryshkov wrote:
> On Fri, 21 Jun 2024 at 18:39, Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > On Fri, Jun 21, 2024 at 06:16:37PM +0300, Dmitry Baryshkov wrote:
> > > On Fri, 21 Jun 2024 at 07:47, Eric Biggers <ebiggers@kernel.org> wrote:
> > > >
> > > > On Thu, Jun 20, 2024 at 02:57:40PM +0300, Dmitry Baryshkov wrote:
> > > > > > > >
> > > > > > > > > Is it possible to use both kind of keys when working on standard mode?
> > > > > > > > > If not, it should be the user who selects what type of keys to be used.
> > > > > > > > > Enforcing this via DT is not a way to go.
> > > > > > > > >
> > > > > > > >
> > > > > > > > Unfortunately, that support is not there yet. When you say user, do
> > > > > > > > you mean to have it as a filesystem mount option?
> > > > > > >
> > > > > > > During cryptsetup time. When running e.g. cryptsetup I, as a user, would like
> > > > > > > to be able to use either a hardware-wrapped key or a standard key.
> > > > > > >
> > > > > >
> > > > > > What we are looking for with these patches is for per-file/folder encryption using fscrypt policies.
> > > > > > Cryptsetup to my understanding supports only full-disk , and does not support FBE (File-Based)
> > > > >
> > > > > I must admit, I mostly used dm-crypt beforehand, so I had to look at
> > > > > fscrypt now. Some of my previous comments might not be fully
> > > > > applicable.
> > > > >
> > > > > > Hence the idea here is that we mount an unencrypted device (with the inlinecrypt option that indicates inline encryption is supported)
> > > > > > And specify policies (links to keys) for different folders.
> > > > > >
> > > > > > > > The way the UFS/EMMC crypto layer is designed currently is that, this
> > > > > > > > information is needed when the modules are loaded.
> > > > > > > >
> > > > > > > > https://lore.kernel.org/all/20231104211259.17448-2-ebiggers@kernel.org
> > > > > > > > /#Z31drivers:ufs:core:ufshcd-crypto.c
> > > > > > >
> > > > > > > I see that the driver lists capabilities here. E.g. that it supports HW-wrapped
> > > > > > > keys. But the line doesn't specify that standard keys are not supported.
> > > > > > >
> > > > > >
> > > > > > Those are capabilities that are read from the storage controller. However, wrapped keys
> > > > > > Are not a standard in the ICE JEDEC specification, and in most cases, is a value add coming
> > > > > > from the SoC.
> > > > > >
> > > > > > QCOM SOC and firmware currently does not support both kinds of keys in the HWKM mode.
> > > > > > That is something we are internally working on, but not available yet.
> > > > >
> > > > > I'd say this is a significant obstacle, at least from my point of
> > > > > view. I understand that the default might be to use hw-wrapped keys,
> > > > > but it should be possible for the user to select non-HW keys if the
> > > > > ability to recover the data is considered to be important. Note, I'm
> > > > > really pointing to the user here, not to the system integrator. So
> > > > > using DT property or specifying kernel arguments to switch between
> > > > > these modes is not really an option.
> > > > >
> > > > > But I'd really love to hear some feedback from linux-security and/or
> > > > > linux-fscrypt here.
> > > > >
> > > > > In my humble opinion the user should be able to specify that the key
> > > > > is wrapped using the hardware KMK. Then if the hardware has already
> > > > > started using the other kind of keys, it should be able to respond
> > > > > with -EINVAL / whatever else. Then the user can evict previously
> > > > > programmed key and program a desired one.
> > > > >
> > > > > > > Also, I'd have expected that hw-wrapped keys are handled using trusted
> > > > > > > keys mechanism (see security/keys/trusted-keys/). Could you please point
> > > > > > > out why that's not the case?
> > > > > > >
> > > > > >
> > > > > > I will evaluate this.
> > > > > > But my initial response is that we currently cannot communicate to our TPM directly from HLOS, but
> > > > > > goes through QTEE, and I don't think our qtee currently interfaces with the open source tee
> > > > > > driver. The interface is through QCOM SCM driver.
> > > > >
> > > > > Note, this is just an API interface, see how it is implemented for the
> > > > > CAAM hardware.
> > > > >
> > > >
> > > > The problem is that this patchset was sent out without the patches that add the
> > > > block and filesystem-level framework for hardware-wrapped inline encryption
> > > > keys, which it depends on.  So it's lacking context.  The proposed framework can
> > > > be found at
> > > > https://lore.kernel.org/linux-block/20231104211259.17448-1-ebiggers@kernel.org/T/#u
> > >
> > > Thank you. I have quickly skimmed through the patches, but I didn't
> > > review them thoroughly. Maybe the patchset already implements the
> > > interfaces that I'm thinking about. In such a case please excuse me. I
> > > will give it a more thorough look later today.
> > >
> > > > As for why "trusted keys" aren't used, they just aren't helpful here.  "Trusted
> > > > keys" are based around a model where the kernel can request that keys be sealed
> > > > and unsealed using a trust source, and the kernel gets access to the raw
> > > > unsealed keys.  Hardware-wrapped inline encryption keys use a different model
> > > > where the kernel never gets access to the raw keys.  They also have the concept
> > > > of ephemeral wrapping which does not exist in "trusted keys".  And they need to
> > > > be properly integrated with the inline encryption framework in the block layer.
> > >
> > > Then what exactly does qcom_scm_derive_sw_secret() do? Does it rewrap
> > > the key under some other key?
> >
> > It derives a secret for functionality such as filenames encryption that can't
> > use inline encryption.
> >
> > > I had the feeling that there are two separate pieces of functionality
> > > being stuffed into a single patchset and into a single solution.
> > >
> > > First one is handling the keys. I keep on thinking that there should
> > > be a separate software interface to unseal the key and rewrap it under
> > > an ephemeral key.
> >
> > There is.  That's what the BLKCRYPTOPREPAREKEY ioctl is for.
> >
> > > Some hardware might permit importing raw keys.
> >
> > That's what BLKCRYPTOIMPORTKEY is for.
> >
> > > Other hardware might insist on generating the keys on-chip so that raw keys
> > > can never be used.
> >
> > And that's what BLKCRYPTOGENERATEKEY is for.
> 
> Again, this might be answered somewhere, but why can't we use keyctl
> for handling the keys and then use a single IOCTL to point the block
> device to the key in the keyring?

All the same functionality would need to be supported, and I think that
shoehorning it into the keyrings service instead of just adding new ioctls would
be more difficult.  The keyrings service was not designed for this use case.
We've already had a lot of problems trying to take advantage of the keyrings
service in fscrypt previously.  The keyrings service is something that sounds
useful but really isn't all that useful.

By "a single IOCTL to point the block device to the key in the keyring", you
seem to be referring to configuring full block device encryption with a single
key.  That's not something that's supported by the upstream kernel yet, and it's
not related to this patchset; currently only fscrypt supports inline encryption.
Support for it will be added at some point, which will likely indeed take the
form of an ioctl to set a key on a block device.  But that would be the case
even without HW-wrapped keys.  And *requiring* the key to be given in a keyring
(instead of just in a byte array passed to the ioctl) isn't very helpful, as it
just makes the API harder to use.  We've learned this from the fscrypt API
already where we actually had to move away from the keyrings service in order to
fix all the issues caused by it (see FS_IOC_ADD_ENCRYPTION_KEY).

> >
> > > Second part is the actual block interface. Gaurav wrote about
> > > targeting fscrypt, but there should be no actual difference between
> > > crypto targets. FDE or having a single partition encrypted should
> > > probably work in the same way. Convert the key into blk_crypto_key
> > > (including the cookie for the ephemeral key), program the key into the
> > > slot, use the slot to en/decrypt hardware blocks.
> > >
> > > My main point is that the decision on the key type should be coming
> > > from the user.
> >
> > That's exactly how it works.  There is a block interface for specifying an
> > inline encryption key along with each bio.  The submitter of the bio can specify
> > either a standard key or a HW-wrapped key.
> 
> Not in this patchset. The ICE driver decides whether it can support
> HW-wrapped keys or not and then fails to support other type of keys.
> 

Sure, that's just a matter of hardware capabilities though, right?  The block
layer provides a way for drivers to declare which inline encryption capabilities
they support.  They can declare they support standard keys, HW-wrapped keys,
both, or neither.  If Qualcomm SoCs can't support both types of keys at the same
time, that's unfortunate, but I'm not sure what your point is.  The user (e.g.
fscrypt) still has control over whether they use the functionality that the
hardware provides.

- Eric

