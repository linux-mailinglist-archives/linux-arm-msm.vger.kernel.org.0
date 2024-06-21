Return-Path: <linux-arm-msm+bounces-23624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFB7912AE0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 18:07:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98131B2684A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 16:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAC9215FA8C;
	Fri, 21 Jun 2024 16:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e+xmhos4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8993A839F4
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 16:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718986002; cv=none; b=cmmK8rtI2QeBV4+x7e5KKXiyzU+gBRdDchd6xYXM6c7PhCFuxCyF2wUn18dKnRAqcyy7LESqWGqQdz9cNss2xpixBAi4j68eeM6tbiVSgp/YzrgWEiFtkB36LB5rk/Gyhskd/xCnrk9MXnHC8ffFr6iKtYXsBrRY9jYPEQIm5dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718986002; c=relaxed/simple;
	bh=RKRMpTOKRm1ujovFZqL3WHfrxYQVRqgjDm+JkPgvrLM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eZw0OzAgzGzPn95gppkzK5qpJ0pjBqdgreWyyQEVuxk9L37uRXHN7nO8ul9QYlqIxfhb/FB2HmTfYl3U0+Dk45n1i9IZs35cuaOMGoJiRRp+YYt342eAL0N4htvTwskjlBbbWnhlbGb5oE+MeMb2PeHQbmVUIcbAfaNxYwtQDQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e+xmhos4; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e02a6d4bdbeso2040377276.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 09:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718985999; x=1719590799; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AQp9dlO5pAgdUf8FaDRgU2ZwQcaWQQ47LVCfMxenQGw=;
        b=e+xmhos4DaPy+J4f7NTm0y/W8wtZUkwGcqzN5I3mLBKgX1jgPNRmhOv9Fg14exgvaR
         szbRn/VcXxwc2p6tH7i0u3+rTolUFFPqehj1CH5VDunGpAU7PWL2FQ4sHKolmzvPl56m
         zmX63DMLIC4/7VbOSvc5w6zkbfvv2txej32Fj+YIouAFuXnx9zKm+7uqEF9mGrfZeKkt
         nfh+zcsdh+K5Y4E48kbPfZOg9NtGfXxZwQnwXc7sy+3uPKxYgeIKUscsi3e7I3kfy/cn
         EVa6TKt+ZMdXxZr1AmZvhOQLOm/WJFL9uRbwnKaI/843kxgcwb872f5ibE2Q/WMLEgMC
         x+kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718985999; x=1719590799;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AQp9dlO5pAgdUf8FaDRgU2ZwQcaWQQ47LVCfMxenQGw=;
        b=CPCGy9dkG65jA1AobQaZ/J9mVV+Hh46UQyFyeAvNQSx4QZ9c+BmIkoKYbNriAJtGuL
         5Lrv9WBPTMDKYCi6W/Igs8dRVx4O20fYxWpY2C4Afkki16cgMXhrjmwLmxRK25b0Xjrn
         WqPzy9RyKSDxpanrMmobzBDFdv5X+U/Vgt6XPZVfOs2Dzxi4AS9uPu8q0fCkCN2/yVqT
         UWmKMlxxyylaEy6e7W7rvmM6g0Jmhaas4PMXxDoEzAJbXPeH2oiPzjWVpCfYF32NCkN4
         D39gv6WELPMrcA1ZgNvRU6Cj3DN8Ec/KeSpVFcalsLWCA1V9zvpg64wY4GqW/l2fCFwC
         WVxw==
X-Forwarded-Encrypted: i=1; AJvYcCW/QxOTwBMqiH6tgAvldUkcihR46IL/J3+qYZaI5YQjz7t1ScdzrV1oh0KvpGXAJ2P9Gh6mkmNvhVVqD2eZspR0RmpA1JMiQ10T+UypSw==
X-Gm-Message-State: AOJu0YxtDC1zoZKLdhZX6DXovtF8yvtswIJrm1FJ5rT018w2MfVyNPlY
	Gad/wRcy5hFU+5ZBROn9RlB7L4V6mwR+ZNqbQcwefBIu7533d773U3atE6OeabZ3w3SIqd0yESu
	2T1quQaxE0V+WCVdnUkM/YkTtnlNizaIZcNRT4w==
X-Google-Smtp-Source: AGHT+IFsKhI5/ZpPFPGZgfj7WNLVrLaPZ7KiG2qpvVEJu3dcWK/Nil0xzuhyY4wPN4X4t78JmuDWQRQioq2fNcEPqZk=
X-Received: by 2002:a25:aa04:0:b0:e02:c343:ffa7 with SMTP id
 3f1490d57ef6-e02c344047fmr7674276276.25.1718985999405; Fri, 21 Jun 2024
 09:06:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240617005825.1443206-1-quic_gaurkash@quicinc.com>
 <20240617005825.1443206-5-quic_gaurkash@quicinc.com> <3eehkn3cdhhjfqtzpahxhjxtu5uqwhntpgu22k3hknctrop3g5@f7dhwvdvhr3k>
 <96e2ce4b154a4f918be0bc2a45011e6d@quicinc.com> <CAA8EJppGpv7N_JQQNJZrbngBBdEKZfuqutR9MPnS1R_WqYNTQw@mail.gmail.com>
 <3a15df00a2714b40aba4ebc43011a7b6@quicinc.com> <CAA8EJpoZ0RR035QwzMLguJZvdYb-C6aqudp1BgHgn_DH2ffsoQ@mail.gmail.com>
 <20240621044747.GC4362@sol.localdomain> <CAA8EJppXsbpFCeGJOMGKOQddy0fF4uW3rt4RUuDTQq6mPunBkg@mail.gmail.com>
 <20240621153939.GA2081@sol.localdomain>
In-Reply-To: <20240621153939.GA2081@sol.localdomain>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 21 Jun 2024 19:06:25 +0300
Message-ID: <CAA8EJpqV4CW9kKLVUZgfo+hkSv+tn0t+k0McmHEyXNJUpsZF1w@mail.gmail.com>
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

On Fri, 21 Jun 2024 at 18:39, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Fri, Jun 21, 2024 at 06:16:37PM +0300, Dmitry Baryshkov wrote:
> > On Fri, 21 Jun 2024 at 07:47, Eric Biggers <ebiggers@kernel.org> wrote:
> > >
> > > On Thu, Jun 20, 2024 at 02:57:40PM +0300, Dmitry Baryshkov wrote:
> > > > > > >
> > > > > > > > Is it possible to use both kind of keys when working on standard mode?
> > > > > > > > If not, it should be the user who selects what type of keys to be used.
> > > > > > > > Enforcing this via DT is not a way to go.
> > > > > > > >
> > > > > > >
> > > > > > > Unfortunately, that support is not there yet. When you say user, do
> > > > > > > you mean to have it as a filesystem mount option?
> > > > > >
> > > > > > During cryptsetup time. When running e.g. cryptsetup I, as a user, would like
> > > > > > to be able to use either a hardware-wrapped key or a standard key.
> > > > > >
> > > > >
> > > > > What we are looking for with these patches is for per-file/folder encryption using fscrypt policies.
> > > > > Cryptsetup to my understanding supports only full-disk , and does not support FBE (File-Based)
> > > >
> > > > I must admit, I mostly used dm-crypt beforehand, so I had to look at
> > > > fscrypt now. Some of my previous comments might not be fully
> > > > applicable.
> > > >
> > > > > Hence the idea here is that we mount an unencrypted device (with the inlinecrypt option that indicates inline encryption is supported)
> > > > > And specify policies (links to keys) for different folders.
> > > > >
> > > > > > > The way the UFS/EMMC crypto layer is designed currently is that, this
> > > > > > > information is needed when the modules are loaded.
> > > > > > >
> > > > > > > https://lore.kernel.org/all/20231104211259.17448-2-ebiggers@kernel.org
> > > > > > > /#Z31drivers:ufs:core:ufshcd-crypto.c
> > > > > >
> > > > > > I see that the driver lists capabilities here. E.g. that it supports HW-wrapped
> > > > > > keys. But the line doesn't specify that standard keys are not supported.
> > > > > >
> > > > >
> > > > > Those are capabilities that are read from the storage controller. However, wrapped keys
> > > > > Are not a standard in the ICE JEDEC specification, and in most cases, is a value add coming
> > > > > from the SoC.
> > > > >
> > > > > QCOM SOC and firmware currently does not support both kinds of keys in the HWKM mode.
> > > > > That is something we are internally working on, but not available yet.
> > > >
> > > > I'd say this is a significant obstacle, at least from my point of
> > > > view. I understand that the default might be to use hw-wrapped keys,
> > > > but it should be possible for the user to select non-HW keys if the
> > > > ability to recover the data is considered to be important. Note, I'm
> > > > really pointing to the user here, not to the system integrator. So
> > > > using DT property or specifying kernel arguments to switch between
> > > > these modes is not really an option.
> > > >
> > > > But I'd really love to hear some feedback from linux-security and/or
> > > > linux-fscrypt here.
> > > >
> > > > In my humble opinion the user should be able to specify that the key
> > > > is wrapped using the hardware KMK. Then if the hardware has already
> > > > started using the other kind of keys, it should be able to respond
> > > > with -EINVAL / whatever else. Then the user can evict previously
> > > > programmed key and program a desired one.
> > > >
> > > > > > Also, I'd have expected that hw-wrapped keys are handled using trusted
> > > > > > keys mechanism (see security/keys/trusted-keys/). Could you please point
> > > > > > out why that's not the case?
> > > > > >
> > > > >
> > > > > I will evaluate this.
> > > > > But my initial response is that we currently cannot communicate to our TPM directly from HLOS, but
> > > > > goes through QTEE, and I don't think our qtee currently interfaces with the open source tee
> > > > > driver. The interface is through QCOM SCM driver.
> > > >
> > > > Note, this is just an API interface, see how it is implemented for the
> > > > CAAM hardware.
> > > >
> > >
> > > The problem is that this patchset was sent out without the patches that add the
> > > block and filesystem-level framework for hardware-wrapped inline encryption
> > > keys, which it depends on.  So it's lacking context.  The proposed framework can
> > > be found at
> > > https://lore.kernel.org/linux-block/20231104211259.17448-1-ebiggers@kernel.org/T/#u
> >
> > Thank you. I have quickly skimmed through the patches, but I didn't
> > review them thoroughly. Maybe the patchset already implements the
> > interfaces that I'm thinking about. In such a case please excuse me. I
> > will give it a more thorough look later today.
> >
> > > As for why "trusted keys" aren't used, they just aren't helpful here.  "Trusted
> > > keys" are based around a model where the kernel can request that keys be sealed
> > > and unsealed using a trust source, and the kernel gets access to the raw
> > > unsealed keys.  Hardware-wrapped inline encryption keys use a different model
> > > where the kernel never gets access to the raw keys.  They also have the concept
> > > of ephemeral wrapping which does not exist in "trusted keys".  And they need to
> > > be properly integrated with the inline encryption framework in the block layer.
> >
> > Then what exactly does qcom_scm_derive_sw_secret() do? Does it rewrap
> > the key under some other key?
>
> It derives a secret for functionality such as filenames encryption that can't
> use inline encryption.
>
> > I had the feeling that there are two separate pieces of functionality
> > being stuffed into a single patchset and into a single solution.
> >
> > First one is handling the keys. I keep on thinking that there should
> > be a separate software interface to unseal the key and rewrap it under
> > an ephemeral key.
>
> There is.  That's what the BLKCRYPTOPREPAREKEY ioctl is for.
>
> > Some hardware might permit importing raw keys.
>
> That's what BLKCRYPTOIMPORTKEY is for.
>
> > Other hardware might insist on generating the keys on-chip so that raw keys
> > can never be used.
>
> And that's what BLKCRYPTOGENERATEKEY is for.

Again, this might be answered somewhere, but why can't we use keyctl
for handling the keys and then use a single IOCTL to point the block
device to the key in the keyring?

>
> > Second part is the actual block interface. Gaurav wrote about
> > targeting fscrypt, but there should be no actual difference between
> > crypto targets. FDE or having a single partition encrypted should
> > probably work in the same way. Convert the key into blk_crypto_key
> > (including the cookie for the ephemeral key), program the key into the
> > slot, use the slot to en/decrypt hardware blocks.
> >
> > My main point is that the decision on the key type should be coming
> > from the user.
>
> That's exactly how it works.  There is a block interface for specifying an
> inline encryption key along with each bio.  The submitter of the bio can specify
> either a standard key or a HW-wrapped key.

Not in this patchset. The ICE driver decides whether it can support
HW-wrapped keys or not and then fails to support other type of keys.

>
> Again, take a look at the patchset
> https://lore.kernel.org/linux-block/20231104211259.17448-1-ebiggers@kernel.org/T/#u.
> That's where all this stuff is.

I was mostly looking at the hardware-specific implementation.

-- 
With best wishes
Dmitry

