Return-Path: <linux-arm-msm+bounces-23616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 176A3912936
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 17:16:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 867321F22EE3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 15:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C29C481A7;
	Fri, 21 Jun 2024 15:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DvMZ1yde"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C7D39FE5
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 15:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718983011; cv=none; b=Rjw7Pc5G64QV6HriyB6nszOj4Gq1pSZuq1wumE6reeobPglBPdLaKTBrs5IpALzOUXMQtyAAZQnb89WS0yTn5IOwO6MK4Hpupogxfc19rMZKFKgTsB6ZGVdJZIYWno+QFuJo5W3+4QTm7WEK1qmQ6urW4AfK9JcKuVs8wADAGsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718983011; c=relaxed/simple;
	bh=zFuk48cbhB5z7snlfIaQJo8NiN5IXQRvgXqdLrDRlUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ivPUQ9lGqbdktBCmYsaUes210rwMxcHn+4Jif2FevWensExRqLPMHNGLojTBcLSVSdusvZK+91AQ119g9qqmCe+5gyzGJr5glKo14beqadjAZLwFKre5L3Fv9k1lLwVnTGRhcOqxHjkmBz66LMiD7Kk20THbAWVAkgK69PUefFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DvMZ1yde; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-62a08092c4dso21666267b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 08:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718983008; x=1719587808; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=INvmFR+mG8MdGOooEtB857cvAaTXvZhVkdY0DiHUQtU=;
        b=DvMZ1ydejbqS2cT5pBUfd4o7FeQaofVq0edEItDyz2IjfrqGkSNngtjxyiGiwyi4Yq
         9CcXbcbiwp+60LEUUiGoU6tEHIeXmuLImaenYvOrT4jKPlScxXXfxlyVyGdy3wHXW67x
         s/c+7pKKBBJ/l/o2XwUJkIZfTT9aLVo4/p2B4aBRWNsQyM8qj/nK+ls1ElIRfZXFsUHz
         4HERoCbSvDjL/XsVbovWJEjdPzdNgFOVgAQC1BzdsHG4qYyyYeYGuIipjDXmAeY7UQVK
         RWqHudZUaL6X4oV7xyL5yoC/tD58werLUIYW+x3kCuNfPa/Lf2vYrmqpN34g83yViQK8
         4g+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718983008; x=1719587808;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=INvmFR+mG8MdGOooEtB857cvAaTXvZhVkdY0DiHUQtU=;
        b=E0TauhkC1f6K8WIIsP/X3JslqjHjgKHFdrjHu/tMnZ0vrMrvTK4Qmu6M1YYKCkHHkr
         GDaCEYQZYYhQUGgUJFwGQPF6jzZWdmBgMkVifQMwbbf99zEyo1XowaoZkRhSe56d5gZ+
         ypJ/wWuztQ3XYqFwLSC5EJ8sxJKNC2NIUl4igO13FD1GQ/DeeCWfslANKvoDoha2hKdo
         tTVvnIq3JKPUGgPlonOKkW3pFflga3lR+rP3xceaSOvQ73F7TsgUFiRrlbexRhEiaHHf
         floc1PmGweRWRoqPt6a34VPO9EchY6KzrDSdZ3tjkoIERdPPQvBjsC/7mGfnOilIkJjZ
         JqzA==
X-Forwarded-Encrypted: i=1; AJvYcCXWaAY4bLnvVbDXgAQ2Ylb99TumHdqYhBA2yzm1v0tqWvW3R8EmV1x+Idat29fIGBmVMaMOlqx4JYvlKSYJlI1nuD67lvVeLGfXRDShgQ==
X-Gm-Message-State: AOJu0YyTBHS1EbuZBAzyEQ6whbr/P+7hg9GP6jzG5vOLAq5alWphsdgi
	7Mewg2VjNhlB+XNqCLdyK6vsHmyRCFRTZoqRww6pwg4/kTmZDLkdlxdZV2lzcANFz2JbdPipF2/
	0i/UfEo7tV2AwoPwOtOkQSDCMYdoUqX60TBmyVw==
X-Google-Smtp-Source: AGHT+IG9fIZtqKAlVbm475u7hjzHmZxu5O5csfSpdA3s/BA65IHQtgPjc9HdU685v/rRzRccM4YLnKwk8VBa0Bz9ESQ=
X-Received: by 2002:a81:8742:0:b0:630:fe1d:99cc with SMTP id
 00721157ae682-63a8faf37b2mr77928047b3.52.1718983008204; Fri, 21 Jun 2024
 08:16:48 -0700 (PDT)
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
 <20240621044747.GC4362@sol.localdomain>
In-Reply-To: <20240621044747.GC4362@sol.localdomain>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 21 Jun 2024 18:16:37 +0300
Message-ID: <CAA8EJppXsbpFCeGJOMGKOQddy0fF4uW3rt4RUuDTQq6mPunBkg@mail.gmail.com>
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

On Fri, 21 Jun 2024 at 07:47, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Thu, Jun 20, 2024 at 02:57:40PM +0300, Dmitry Baryshkov wrote:
> > > > >
> > > > > > Is it possible to use both kind of keys when working on standard mode?
> > > > > > If not, it should be the user who selects what type of keys to be used.
> > > > > > Enforcing this via DT is not a way to go.
> > > > > >
> > > > >
> > > > > Unfortunately, that support is not there yet. When you say user, do
> > > > > you mean to have it as a filesystem mount option?
> > > >
> > > > During cryptsetup time. When running e.g. cryptsetup I, as a user, would like
> > > > to be able to use either a hardware-wrapped key or a standard key.
> > > >
> > >
> > > What we are looking for with these patches is for per-file/folder encryption using fscrypt policies.
> > > Cryptsetup to my understanding supports only full-disk , and does not support FBE (File-Based)
> >
> > I must admit, I mostly used dm-crypt beforehand, so I had to look at
> > fscrypt now. Some of my previous comments might not be fully
> > applicable.
> >
> > > Hence the idea here is that we mount an unencrypted device (with the inlinecrypt option that indicates inline encryption is supported)
> > > And specify policies (links to keys) for different folders.
> > >
> > > > > The way the UFS/EMMC crypto layer is designed currently is that, this
> > > > > information is needed when the modules are loaded.
> > > > >
> > > > > https://lore.kernel.org/all/20231104211259.17448-2-ebiggers@kernel.org
> > > > > /#Z31drivers:ufs:core:ufshcd-crypto.c
> > > >
> > > > I see that the driver lists capabilities here. E.g. that it supports HW-wrapped
> > > > keys. But the line doesn't specify that standard keys are not supported.
> > > >
> > >
> > > Those are capabilities that are read from the storage controller. However, wrapped keys
> > > Are not a standard in the ICE JEDEC specification, and in most cases, is a value add coming
> > > from the SoC.
> > >
> > > QCOM SOC and firmware currently does not support both kinds of keys in the HWKM mode.
> > > That is something we are internally working on, but not available yet.
> >
> > I'd say this is a significant obstacle, at least from my point of
> > view. I understand that the default might be to use hw-wrapped keys,
> > but it should be possible for the user to select non-HW keys if the
> > ability to recover the data is considered to be important. Note, I'm
> > really pointing to the user here, not to the system integrator. So
> > using DT property or specifying kernel arguments to switch between
> > these modes is not really an option.
> >
> > But I'd really love to hear some feedback from linux-security and/or
> > linux-fscrypt here.
> >
> > In my humble opinion the user should be able to specify that the key
> > is wrapped using the hardware KMK. Then if the hardware has already
> > started using the other kind of keys, it should be able to respond
> > with -EINVAL / whatever else. Then the user can evict previously
> > programmed key and program a desired one.
> >
> > > > Also, I'd have expected that hw-wrapped keys are handled using trusted
> > > > keys mechanism (see security/keys/trusted-keys/). Could you please point
> > > > out why that's not the case?
> > > >
> > >
> > > I will evaluate this.
> > > But my initial response is that we currently cannot communicate to our TPM directly from HLOS, but
> > > goes through QTEE, and I don't think our qtee currently interfaces with the open source tee
> > > driver. The interface is through QCOM SCM driver.
> >
> > Note, this is just an API interface, see how it is implemented for the
> > CAAM hardware.
> >
>
> The problem is that this patchset was sent out without the patches that add the
> block and filesystem-level framework for hardware-wrapped inline encryption
> keys, which it depends on.  So it's lacking context.  The proposed framework can
> be found at
> https://lore.kernel.org/linux-block/20231104211259.17448-1-ebiggers@kernel.org/T/#u

Thank you. I have quickly skimmed through the patches, but I didn't
review them thoroughly. Maybe the patchset already implements the
interfaces that I'm thinking about. In such a case please excuse me. I
will give it a more thorough look later today.

> As for why "trusted keys" aren't used, they just aren't helpful here.  "Trusted
> keys" are based around a model where the kernel can request that keys be sealed
> and unsealed using a trust source, and the kernel gets access to the raw
> unsealed keys.  Hardware-wrapped inline encryption keys use a different model
> where the kernel never gets access to the raw keys.  They also have the concept
> of ephemeral wrapping which does not exist in "trusted keys".  And they need to
> be properly integrated with the inline encryption framework in the block layer.

Then what exactly does qcom_scm_derive_sw_secret() do? Does it rewrap
the key under some other key?
I had the feeling that there are two separate pieces of functionality
being stuffed into a single patchset and into a single solution.

First one is handling the keys. I keep on thinking that there should
be a separate software interface to unseal the key and rewrap it under
an ephemeral key. Some hardware might permit importing raw keys. Other
hardware might insist on generating the keys on-chip so that raw keys
can never be used. Anyway, the net result is the binary blob + cookie
for the ephemeral key.

Second part is the actual block interface. Gaurav wrote about
targeting fscrypt, but there should be no actual difference between
crypto targets. FDE or having a single partition encrypted should
probably work in the same way. Convert the key into blk_crypto_key
(including the cookie for the ephemeral key), program the key into the
slot, use the slot to en/decrypt hardware blocks.

My main point is that the decision on the key type should be coming
from the user. I can easily imagine a user, which wants to use
password / raw key for documents storage so that it is possible to
recover the data, hw-wrapped long-term key for app & data storage and
generated one-time random key for the swap, so that memory contents
can never be recovered after reboot / device capture.

-- 
With best wishes
Dmitry

