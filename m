Return-Path: <linux-arm-msm+bounces-23638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B460912DD2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 21:24:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15F1B1F24892
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 19:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1620617B4EB;
	Fri, 21 Jun 2024 19:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bGkpEX9E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D984B179949
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 19:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718997862; cv=none; b=InZRRQTCuSSDYmFWXtabQU6FVoW+gE3h2cI3vPi9FatCvx9oacBn3o9gq1kSz/VeoNOe2X5osUjT9N4cv30gWY7QuToG6QgtMlVvr+S4vQ1esAyWK2wcAk1UUx59nzkM5ymjcHwUZzKyU2ua2k2FimxE3vKOX9WJm8Ho3ptUyTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718997862; c=relaxed/simple;
	bh=f/0mdw+gak8aRWs0+54sJCNRpJ6DOHVu4w1+/OzRLAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cdTCKylQ/rDyJDsoCSufbIG0xLX0rzLtm2hHFoxrW3NkXovpBCzSg2bslmxXbU8g0AMA8cuJXS0Ywi2J+WYgBVNmeSKrBuWDw7xyUpjkxhIeP6kzo+6XJNb3qo6zwARF7KEX1M2wo6w5mQLbske+4RXVS6j2Oi0iwPce7dkl3qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bGkpEX9E; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e02bf947545so2316214276.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 12:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718997859; x=1719602659; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MMRkW6HVYaY+ih6EGlax6foMFlmxvxZE0NopDaNbQms=;
        b=bGkpEX9E76AupDo3DGIN8vbbOq84AQd5X6TeKwuvilj3yINvqQmTVwWLckmhyklLLQ
         7XmiLGiIlv1FKoKxxuKKGhdD/4RHjAKjknft4BrEWq1/m7mENPUbWAEVbSXCrUbaP8ew
         oqbc8ypjURV6tMg9zAbtGfrXG6Dw5h8CE6T95L7tX0z/aSHRbUL13db4VT2rVb+Mt8Hg
         l70wKwkBYd2kfot4sDDHEQljDBfxVSNVKX2Fs6dLvecuLArK9bG0QdnIWT6yITbbWmjo
         +R7E78rhOUSEif7+zOzhZmQB9yrSebyNjD1kcs718sMBRQgJG3/KEz8VjapOfmJolwJJ
         jMYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718997859; x=1719602659;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MMRkW6HVYaY+ih6EGlax6foMFlmxvxZE0NopDaNbQms=;
        b=R9JKHsQ3W56mjtmUrR1ZxcXw9ccJPAMIjPguVZhGNXJjPvi4p0TKKRs3VOTlsKg+/Q
         rwivBi5U/Jgh4lXEJxNTi5xN4VID+w6QSNTOdoL0QwaEF87B1F+ToZQ1w+7Y03TYCjP2
         BrfWmiPLhyFSuxaOy9c+DrwUik+H/MtL8xj1GbsWJNuYFvEIUfXOmaY13hnoM8uwzAI5
         bsALCjzAmCbr2t0P9BOz+R8fdiH2MQo0UIJ2Bjyic3aOtr+qhjFQYJWw+pSiS/JCyAUB
         umFc0nOZ7bJpdlC213d5c10EWKFZpgLzoD0Zx/rrvpL84MiCnl/pYdgjPYvLnskOuQh8
         eMpA==
X-Forwarded-Encrypted: i=1; AJvYcCXaL7ts7vTSOM+UF0s6dus6lRt8f2seGiLJbD7/g7pMppc8bXpnzZ3w1Yq0ar5gsN/j9lprJfS9GWRmsnkWw9F3OQ2kCaFm9JfevZ/SYg==
X-Gm-Message-State: AOJu0Yz8VNFU38h9mWgYpQN8sxsw0EsBmszRHoSyQnYTrV7p4YE4WolG
	yJae9yN9DWt0bXUbuafDdIeOC4Qai3gHxtU4j9Adm8UxzIQWimqZr/C9kverwqd8vDtmFh9Snto
	UgCzj4NoKBoF2k5ds3bUhNMktrhnzqM+suB2SGg==
X-Google-Smtp-Source: AGHT+IHfq6nSNPSimxxufcc5BIl8xw+HnqSl3HW48e3ewWnssZE7ccygAMxFQfMP6P+xGldOIvsj8zXf6ThEq4n/KG0=
X-Received: by 2002:a25:c750:0:b0:e02:b989:ac55 with SMTP id
 3f1490d57ef6-e02be1f3761mr8964179276.40.1718997858617; Fri, 21 Jun 2024
 12:24:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <96e2ce4b154a4f918be0bc2a45011e6d@quicinc.com> <CAA8EJppGpv7N_JQQNJZrbngBBdEKZfuqutR9MPnS1R_WqYNTQw@mail.gmail.com>
 <3a15df00a2714b40aba4ebc43011a7b6@quicinc.com> <CAA8EJpoZ0RR035QwzMLguJZvdYb-C6aqudp1BgHgn_DH2ffsoQ@mail.gmail.com>
 <20240621044747.GC4362@sol.localdomain> <CAA8EJppXsbpFCeGJOMGKOQddy0fF4uW3rt4RUuDTQq6mPunBkg@mail.gmail.com>
 <20240621153939.GA2081@sol.localdomain> <CAA8EJpqV4CW9kKLVUZgfo+hkSv+tn0t+k0McmHEyXNJUpsZF1w@mail.gmail.com>
 <20240621163127.GC2081@sol.localdomain> <CAA8EJpqytynwQrCAqqBsmx2XYgV5tsNeV4hpYzT6snqu+r8Wdg@mail.gmail.com>
 <20240621183645.GE2081@sol.localdomain>
In-Reply-To: <20240621183645.GE2081@sol.localdomain>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 21 Jun 2024 22:24:07 +0300
Message-ID: <CAA8EJprydVC6Sp8g9b1TOyxN8Awc33=MxKY8=Upi_zag=kDBHA@mail.gmail.com>
Subject: Re: [PATCH v5 04/15] soc: qcom: ice: add hwkm support in ice
To: Eric Biggers <ebiggers@kernel.org>
Cc: "Gaurav Kashyap (QUIC)" <quic_gaurkash@quicinc.com>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, 
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "andersson@kernel.org" <andersson@kernel.org>, 
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, 
	"srinivas.kandagatla" <srinivas.kandagatla@linaro.org>, 
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, kernel <kernel@quicinc.com>, 
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"Om Prakash Singh (QUIC)" <quic_omprsing@quicinc.com>, 
	"Bao D. Nguyen (QUIC)" <quic_nguyenb@quicinc.com>, 
	"bartosz.golaszewski" <bartosz.golaszewski@linaro.org>, 
	"konrad.dybcio@linaro.org" <konrad.dybcio@linaro.org>, 
	"ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, "jejb@linux.ibm.com" <jejb@linux.ibm.com>, 
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>, "mani@kernel.org" <mani@kernel.org>, 
	"davem@davemloft.net" <davem@davemloft.net>, 
	"herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>, Prasad Sodagudi <psodagud@quicinc.com>, 
	Sonal Gupta <sonalg@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Jun 2024 at 21:36, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Fri, Jun 21, 2024 at 08:49:56PM +0300, Dmitry Baryshkov wrote:
> > On Fri, 21 Jun 2024 at 19:31, Eric Biggers <ebiggers@kernel.org> wrote:
> > >
> > > On Fri, Jun 21, 2024 at 07:06:25PM +0300, Dmitry Baryshkov wrote:
> > > > On Fri, 21 Jun 2024 at 18:39, Eric Biggers <ebiggers@kernel.org> wrote:
> > > > >
> > > > > On Fri, Jun 21, 2024 at 06:16:37PM +0300, Dmitry Baryshkov wrote:
> > > > > > On Fri, 21 Jun 2024 at 07:47, Eric Biggers <ebiggers@kernel.org> wrote:
> > > > > > >
> > > > > > > On Thu, Jun 20, 2024 at 02:57:40PM +0300, Dmitry Baryshkov wrote:
> > > > > > > > > > >
> > > > > > > > > > > > Is it possible to use both kind of keys when working on standard mode?
> > > > > > > > > > > > If not, it should be the user who selects what type of keys to be used.
> > > > > > > > > > > > Enforcing this via DT is not a way to go.
> > > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > Unfortunately, that support is not there yet. When you say user, do
> > > > > > > > > > > you mean to have it as a filesystem mount option?
> > > > > > > > > >
> > > > > > > > > > During cryptsetup time. When running e.g. cryptsetup I, as a user, would like
> > > > > > > > > > to be able to use either a hardware-wrapped key or a standard key.
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > What we are looking for with these patches is for per-file/folder encryption using fscrypt policies.
> > > > > > > > > Cryptsetup to my understanding supports only full-disk , and does not support FBE (File-Based)
> > > > > > > >
> > > > > > > > I must admit, I mostly used dm-crypt beforehand, so I had to look at
> > > > > > > > fscrypt now. Some of my previous comments might not be fully
> > > > > > > > applicable.
> > > > > > > >
> > > > > > > > > Hence the idea here is that we mount an unencrypted device (with the inlinecrypt option that indicates inline encryption is supported)
> > > > > > > > > And specify policies (links to keys) for different folders.
> > > > > > > > >
> > > > > > > > > > > The way the UFS/EMMC crypto layer is designed currently is that, this
> > > > > > > > > > > information is needed when the modules are loaded.
> > > > > > > > > > >
> > > > > > > > > > > https://lore.kernel.org/all/20231104211259.17448-2-ebiggers@kernel.org
> > > > > > > > > > > /#Z31drivers:ufs:core:ufshcd-crypto.c
> > > > > > > > > >
> > > > > > > > > > I see that the driver lists capabilities here. E.g. that it supports HW-wrapped
> > > > > > > > > > keys. But the line doesn't specify that standard keys are not supported.
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > Those are capabilities that are read from the storage controller. However, wrapped keys
> > > > > > > > > Are not a standard in the ICE JEDEC specification, and in most cases, is a value add coming
> > > > > > > > > from the SoC.
> > > > > > > > >
> > > > > > > > > QCOM SOC and firmware currently does not support both kinds of keys in the HWKM mode.
> > > > > > > > > That is something we are internally working on, but not available yet.
> > > > > > > >
> > > > > > > > I'd say this is a significant obstacle, at least from my point of
> > > > > > > > view. I understand that the default might be to use hw-wrapped keys,
> > > > > > > > but it should be possible for the user to select non-HW keys if the
> > > > > > > > ability to recover the data is considered to be important. Note, I'm
> > > > > > > > really pointing to the user here, not to the system integrator. So
> > > > > > > > using DT property or specifying kernel arguments to switch between
> > > > > > > > these modes is not really an option.
> > > > > > > >
> > > > > > > > But I'd really love to hear some feedback from linux-security and/or
> > > > > > > > linux-fscrypt here.
> > > > > > > >
> > > > > > > > In my humble opinion the user should be able to specify that the key
> > > > > > > > is wrapped using the hardware KMK. Then if the hardware has already
> > > > > > > > started using the other kind of keys, it should be able to respond
> > > > > > > > with -EINVAL / whatever else. Then the user can evict previously
> > > > > > > > programmed key and program a desired one.
> > > > > > > >
> > > > > > > > > > Also, I'd have expected that hw-wrapped keys are handled using trusted
> > > > > > > > > > keys mechanism (see security/keys/trusted-keys/). Could you please point
> > > > > > > > > > out why that's not the case?
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > I will evaluate this.
> > > > > > > > > But my initial response is that we currently cannot communicate to our TPM directly from HLOS, but
> > > > > > > > > goes through QTEE, and I don't think our qtee currently interfaces with the open source tee
> > > > > > > > > driver. The interface is through QCOM SCM driver.
> > > > > > > >
> > > > > > > > Note, this is just an API interface, see how it is implemented for the
> > > > > > > > CAAM hardware.
> > > > > > > >
> > > > > > >
> > > > > > > The problem is that this patchset was sent out without the patches that add the
> > > > > > > block and filesystem-level framework for hardware-wrapped inline encryption
> > > > > > > keys, which it depends on.  So it's lacking context.  The proposed framework can
> > > > > > > be found at
> > > > > > > https://lore.kernel.org/linux-block/20231104211259.17448-1-ebiggers@kernel.org/T/#u
> > > > > >
> > > > > > Thank you. I have quickly skimmed through the patches, but I didn't
> > > > > > review them thoroughly. Maybe the patchset already implements the
> > > > > > interfaces that I'm thinking about. In such a case please excuse me. I
> > > > > > will give it a more thorough look later today.
> > > > > >
> > > > > > > As for why "trusted keys" aren't used, they just aren't helpful here.  "Trusted
> > > > > > > keys" are based around a model where the kernel can request that keys be sealed
> > > > > > > and unsealed using a trust source, and the kernel gets access to the raw
> > > > > > > unsealed keys.  Hardware-wrapped inline encryption keys use a different model
> > > > > > > where the kernel never gets access to the raw keys.  They also have the concept
> > > > > > > of ephemeral wrapping which does not exist in "trusted keys".  And they need to
> > > > > > > be properly integrated with the inline encryption framework in the block layer.
> > > > > >
> > > > > > Then what exactly does qcom_scm_derive_sw_secret() do? Does it rewrap
> > > > > > the key under some other key?
> > > > >
> > > > > It derives a secret for functionality such as filenames encryption that can't
> > > > > use inline encryption.
> > > > >
> > > > > > I had the feeling that there are two separate pieces of functionality
> > > > > > being stuffed into a single patchset and into a single solution.
> > > > > >
> > > > > > First one is handling the keys. I keep on thinking that there should
> > > > > > be a separate software interface to unseal the key and rewrap it under
> > > > > > an ephemeral key.
> > > > >
> > > > > There is.  That's what the BLKCRYPTOPREPAREKEY ioctl is for.
> > > > >
> > > > > > Some hardware might permit importing raw keys.
> > > > >
> > > > > That's what BLKCRYPTOIMPORTKEY is for.
> > > > >
> > > > > > Other hardware might insist on generating the keys on-chip so that raw keys
> > > > > > can never be used.
> > > > >
> > > > > And that's what BLKCRYPTOGENERATEKEY is for.
> > > >
> > > > Again, this might be answered somewhere, but why can't we use keyctl
> > > > for handling the keys and then use a single IOCTL to point the block
> > > > device to the key in the keyring?
> > >
> > > All the same functionality would need to be supported, and I think that
> > > shoehorning it into the keyrings service instead of just adding new ioctls would
> > > be more difficult.  The keyrings service was not designed for this use case.
> > > We've already had a lot of problems trying to take advantage of the keyrings
> > > service in fscrypt previously.  The keyrings service is something that sounds
> > > useful but really isn't all that useful.
> >
> > I would be really interested in reading or listening to any kind of
> > summary or parts of the issues.
> > I'm slightly pushy towards keyctl / keyrings, because it already
> > provides support for different kinds of key wrapping and key
> > management. Encrypted keys, trusted keys - those are all kinds of key
> > management, which either will be missing or will have to be
> > reimplemented for block layers.
> >
> > I know that keyrings are clumsy and not that logical, but then their
> > API needs to be improved. Just ignoring the existing mechanisms sounds
> > like a bad idea.
>
> One thing to keep in mind is that keyring service keys can't be used directly
> for storage encryption.  So if a component that manages storage encryption (such
> as fscrypt or dm-crypt) is given a keyring service key, in practice it has to
> extract the payload from the keyring service key, and not use the keyring
> service key any further.  So the keyring service can, at most, serve as a way to
> create and prepare the key, and after that it doesn't serve a purpose.

Yes, this sounds good enough.

>
> (fscrypt used to use the keyring service a bit more: it looked up a key whenever
> a file was opened, and it supported evicting per-file keys by revoking the
> corresponding keyring key.  But this turned out to be totally broken.  E.g., it
> didn't provide the correct semantics for filesystem encryption where the key
> should either be present or absent filesystem-wide.)
>
> We do need the ability to create HW-wrapped keys in long-term wrapped form,
> either via "generate" or "import", return those long-term wrapped keys to
> userspace so that they can be stored on-disk, and convert them into
> ephemerally-wrapped form so they can be used.  It probably would be possible to
> support all of this through the keyrings service, but it would need a couple new
> key types:
>
> - One key type that can be instantiated with a raw key (or NULL to request
>   generation of a key) and that automagically creates a long-term wrapped key
>   and supports userspace reading it back.  This would be vaguely similar to
>   "trusted", but without any support for using the key directly.
>
> - One key type that can be instantiated using a long-term wrapped key which gets
>   automagically converted to an ephemerally-wrapped key.  This would be what is
>   passed to other kernel subsystems.  Functions specific to this key type would
>   need to be provided for users to use.

I think having one key type should be enough. The userspace loads /
generates&reads / wraps and reads back the 'exported' version wrapped
using the platform-specific key. In kernel the key is unsealed and
represented as binary key to be loaded to the hardware + a cookie for
the ephemeral key and device that have been used to wrap it. When
userspace asks the device to program the key, the cookie is verified
to match the device / ephemeral key and then the binary is programmed
to the hardware. Maybe it's enough to use the struct device as a
cookie.

> I think it would be possible, but it feels like a bit of a shoehorned API.  The
> ioctls are a more straightforward solution.

Are we going to have another set of IOCTLs for loading the encrypted
keys? keys sealed by TPM?

> > > By "a single IOCTL to point the block device to the key in the keyring", you
> > > seem to be referring to configuring full block device encryption with a single
> > > key.  That's not something that's supported by the upstream kernel yet, and it's
> > > not related to this patchset; currently only fscrypt supports inline encryption.
> >
> > I see that dm has at least some provisioning and hooks for
> > CONFIG_BLK_INLINE_ENCRYPTION. Thus I thought that it's possible to use
> > inline encryption through DM.
>
> device-mapper supports passing through the inline encryption support of
> underlying devices in certain cases, but it doesn't yet support using it itself.

I see. I was confused by the dm code then. Please excuse me.

>
> >
> > > Support for it will be added at some point, which will likely indeed take the
> > > form of an ioctl to set a key on a block device.  But that would be the case
> > > even without HW-wrapped keys.  And *requiring* the key to be given in a keyring
> > > (instead of just in a byte array passed to the ioctl) isn't very helpful, as it
> > > just makes the API harder to use.  We've learned this from the fscrypt API
> > > already where we actually had to move away from the keyrings service in order to
> > > fix all the issues caused by it (see FS_IOC_ADD_ENCRYPTION_KEY).
> > >
> > > > >
> > > > > > Second part is the actual block interface. Gaurav wrote about
> > > > > > targeting fscrypt, but there should be no actual difference between
> > > > > > crypto targets. FDE or having a single partition encrypted should
> > > > > > probably work in the same way. Convert the key into blk_crypto_key
> > > > > > (including the cookie for the ephemeral key), program the key into the
> > > > > > slot, use the slot to en/decrypt hardware blocks.
> > > > > >
> > > > > > My main point is that the decision on the key type should be coming
> > > > > > from the user.
> > > > >
> > > > > That's exactly how it works.  There is a block interface for specifying an
> > > > > inline encryption key along with each bio.  The submitter of the bio can specify
> > > > > either a standard key or a HW-wrapped key.
> > > >
> > > > Not in this patchset. The ICE driver decides whether it can support
> > > > HW-wrapped keys or not and then fails to support other type of keys.
> > > >
> > >
> > > Sure, that's just a matter of hardware capabilities though, right?  The block
> > > layer provides a way for drivers to declare which inline encryption capabilities
> > > they support.  They can declare they support standard keys, HW-wrapped keys,
> > > both, or neither.  If Qualcomm SoCs can't support both types of keys at the same
> > > time, that's unfortunate, but I'm not sure what your poitnt is.  The user (e.g.
> > > fscrypt) still has control over whether they use the functionality that the
> > > hardware provides.
> >
> > It's a matter of policy. Harware / firmware doesn't support using both
> > kinds of keys concurrently, if I understood Gaurav's explanations
> > correctly. But the user should be able to make a judgement and use
> > non-hw-wrapped keys if it fits their requirements. The driver should
> > not make this kind of judgement. Note, this is not an issue of your
> > original patchset, but it's a driver flaw in this patchset.
>
> If the driver has to make a decision about which type of keys to support (due to
> the hardware and firmware supporting both but not at the same time), I think
> this will need to be done via a module parameter, e.g.
> qcom_ice.hw_wrapped_keys=1 to support HW-wrapped keys instead of standard keys.

No, the user can not set modparams on  e.g. Android device. In my
opinion it should be first-come-first-serve. If the user wants
hw-wrapped keys (and the platform is fine with that), then further
attempts to use raw keys should fail. If the user loads a raw key,
further attempts to set hw-wrapped key should fail (maybe until the
last raw key has been evicted from the hw, if such thing is actually
supported).

-- 
With best wishes
Dmitry

