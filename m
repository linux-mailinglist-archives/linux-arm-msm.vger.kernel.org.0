Return-Path: <linux-arm-msm+bounces-27318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B42FE93FFA8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 22:42:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69330282573
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 20:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B9BE1891B8;
	Mon, 29 Jul 2024 20:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YzS1IyPb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A00770F6;
	Mon, 29 Jul 2024 20:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722285740; cv=none; b=fmUC/jdhrTtSkbRHEJxBnGsS9f5euye+2ODVGD8WvcpSRzjUxeOIkrehRSGe4YMqvm3TxBt2hYSx0CBms8kf1jgzgyE293iFxLAM35GNTbboLmCXRO2sdbNkiSv07A9MG4QvGBsak6psVYsC5fs3sN30sc9zbw7u7hx7bIHzLYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722285740; c=relaxed/simple;
	bh=IQiKkzaTDl7twmBKLWj9YjzgADMmay2FkJMxC7ZbwrQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MJUOYzh9mIBAG2zUWaiOC2RHtwR6NMybT+tfbbGZlnerqSbZ7ABEmM+VFYEUNA2ByrVt0KBd9P3lgKGMFXfwhuIPVRfqHwrayhqWJl3kRREAtpuPURkBvE6rOpcyi/yKDX14/ywrpVnTaT4gxiGkmBw1tGqk69KoSDK2aB7/WXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YzS1IyPb; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-595856e2336so8001053a12.1;
        Mon, 29 Jul 2024 13:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722285737; x=1722890537; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KZpqW1FNzf6K1KcY9MxfqaCZ/LDFNl8Inmwxrmuyygw=;
        b=YzS1IyPbXCyxmUaKntUJSmbICOXoCFxFNBW4seweHEM9ufMM4uMqpaf5qgkqF/cS7A
         NRHiBToBRQlECIPZu0ZfvDwRs2Q87RN4/dYz7yK6kmZyg2gwcG1R/Ab8RGi/o/kOps3L
         2tC9HCioEbrlsyXp15g+V28eU1/69lTFgTqyGIMoKCvGjgPO7P94lpTgU/au0Tv0s9md
         M7sjB95swjzNfcxx2mZ5L6UOieswM0yHfsRGkEKV2/VmkLNcif979VWxTJLqZNFuWwgp
         CNBDqTvJ+o2d7xwqRN5bhP68hiP6Wuqpesxr5k0i2hlrIzKMBqueEvDFYMLo73d+4JqG
         Q6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722285737; x=1722890537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KZpqW1FNzf6K1KcY9MxfqaCZ/LDFNl8Inmwxrmuyygw=;
        b=J1Yp80hL7yUfTEMR7PL1Qtyc89tFV0/bKZ6sExuEoKe6loTEfwaWAP7nqtAMW314c+
         7CqRv6P7xeYDeACo5jDdDQNuuz+6sw3Se2ICwzMvYOY37XgCI1LzjtspukLX3KNzKa/r
         Nh7uCTqhtkNmrdV934zJ+RE8rSUlZZAY5NJFy6boonzqJxs1W6O6KMJE1UcIx26ooNBc
         b/TrdN2n+dhn2C/FlmtJ9hXQLw9PRls0piVQkTJdO4V9uJn6Q0xPKVFsY5rpzUIN1L+R
         fFr62vf/krj9pnPhhPzfYf7JnuST1lteAc2GF7gc+6m6L1I6ADBKcZ9YZ9Swx1/PWSST
         8NCg==
X-Forwarded-Encrypted: i=1; AJvYcCUJV+dANSjio/AuT8/sXQC9O/0Sq1jNw72BaaQxo1FDLpzrtghN9IEgmlAu6hnuhISoDRf+eL+tOoMSRnGM2lVFOZ7/Fm/w90Wxr+O8H0ko5F+rQMj9mjJnG9g9HNqM27wDatNRHiUMzqqiggfHS8fTGNAs9j6yj5ZlwKEeaJ8eKFo43nOMh8g=
X-Gm-Message-State: AOJu0YxiHtE+6sCUWf/nk28qkzKc76JNlMrVFGYRa0eeHCh+oxn+Qf94
	BJeO9eiWirpvA1qrj5FxO5s7eidZHOEGCwvkvcPZi1qjPF6xjrXuIyB+65in8GLIq/4+XmO/O4i
	Ds3DCR9xrgOKrrxmFaYnWcbpNX0o=
X-Google-Smtp-Source: AGHT+IELVmUsxUqYVsUBpaSO4qSLMUdrKZlg0f0o3R5olNU3hsTcYbTRf6kbLbRKSE2iOv0ZVYTu2ALyuE6vHzEW+Ws=
X-Received: by 2002:a50:9984:0:b0:57d:3e48:165d with SMTP id
 4fb4d7f45d1cf-5b016cdaa27mr8243785a12.4.1722285736445; Mon, 29 Jul 2024
 13:42:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240719-topic-t14s_upstream-v1-0-d7d97fdebb28@linaro.org>
 <20240719-topic-t14s_upstream-v1-3-d7d97fdebb28@linaro.org>
 <Zp055OR+OzSgiHhX@linaro.org> <824edc08-f67f-4b2f-b4aa-da5df69b9df4@linaro.org>
 <Zp4vghH5SK/rLEce@linaro.org> <CAF6AEGszzRFiW16VzQQVF21U79uLcTNwwuGsHs98Zp_UGGTEBA@mail.gmail.com>
 <4w4b5pjrrl7jnanx3uodsjxw4cfenc3i6tgmp6kblgn6gavn45@uu2milys4n2z>
 <atjcj5qnetxilrnoom7xisqbl5yhq5ktg3jb7dfnkdnzbqblb5@qbkqupznvrua> <87o76ng5mr.fsf@bloch.sibelius.xs4all.nl>
In-Reply-To: <87o76ng5mr.fsf@bloch.sibelius.xs4all.nl>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 29 Jul 2024 13:42:04 -0700
Message-ID: <CAF6AEGvjkStnnL=51LCVnyqMyupzfUT-HVrgyREXW+uAFWCTgQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add X1E78100 ThinkPad T14s Gen 6
To: Mark Kettenis <mark.kettenis@xs4all.nl>
Cc: Bjorn Andersson <andersson@kernel.org>, dmitry.baryshkov@linaro.org, abel.vesa@linaro.org, 
	konrad.dybcio@linaro.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, marijn.suijten@somainline.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, johan@kernel.org, patrick@openbsd.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 23, 2024 at 2:28=E2=80=AFPM Mark Kettenis <mark.kettenis@xs4all=
.nl> wrote:
>
> > Date: Tue, 23 Jul 2024 13:55:20 -0500
> > From: Bjorn Andersson <andersson@kernel.org>
> >
> > On Mon, Jul 22, 2024 at 07:03:43PM GMT, Dmitry Baryshkov wrote:
> > > On Mon, Jul 22, 2024 at 08:00:19AM GMT, Rob Clark wrote:
> > > > On Mon, Jul 22, 2024 at 3:11=E2=80=AFAM Abel Vesa <abel.vesa@linaro=
.org> wrote:
> > > > >
> > > > > On 24-07-22 10:42:57, Konrad Dybcio wrote:
> > > > > > On 21.07.2024 6:40 PM, Abel Vesa wrote:
> > > > > > > On 24-07-19 22:16:38, Konrad Dybcio wrote:
> > > > > > >> Add support for the aforementioned laptop. That includes:
> > > > > > >>
> > > > > > >> - input methods, incl. lid switch (keyboard needs the pdc
> > > > > > >>   wakeup-parent removal hack..)
> > > > > > >> - NVMe, WiFi
> > > > > > >> - USB-C ports
> > > > > > >> - GPU, display
> > > > > > >> - DSPs
> > > > > > >>
> > > > > > >> Notably, the USB-A ports on the side are depenedent on the U=
SB
> > > > > > >> multiport controller making it upstream.
> > > > > > >>
> > > > > > >> At least one of the eDP panels used (non-touchscreen) identi=
fies as
> > > > > > >> BOE 0x0b66.
> > > > > > >>
> > > > > > >> See below for the hardware description from the OEM.
> > > > > > >>
> > > > > > >> Link: https://www.lenovo.com/us/en/p/laptops/thinkpad/thinkp=
adt/lenovo-thinkpad-t14s-gen-6-(14-inch-snapdragon)/len101t0099
> > > > > > >> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > > > > > >
> > > > > > > Few comments below. Otherwise, LGTM.
> > > > > > >
> > > > > > > Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> > > > > > >
> > > > > > >> ---
> > > > > > >>  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
> > > > > > >>  .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts     | 792 ++=
+++++++++++++++++++
> > > > > > >>  2 files changed, 793 insertions(+)
> > > > > > >>
> > > > > > >> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/=
boot/dts/qcom/Makefile
> > > > > > >> index 0e5c810304fb..734a05e04c4a 100644
> > > > > > >> --- a/arch/arm64/boot/dts/qcom/Makefile
> > > > > > >> +++ b/arch/arm64/boot/dts/qcom/Makefile
> > > > > > >> @@ -261,6 +261,7 @@ dtb-$(CONFIG_ARCH_QCOM)        +=3D sm86=
50-hdk-display-card.dtb
> > > > > > >>  dtb-$(CONFIG_ARCH_QCOM)   +=3D sm8650-hdk.dtb
> > > > > > >>  dtb-$(CONFIG_ARCH_QCOM)   +=3D sm8650-mtp.dtb
> > > > > > >>  dtb-$(CONFIG_ARCH_QCOM)   +=3D sm8650-qrd.dtb
> > > > > > >> +dtb-$(CONFIG_ARCH_QCOM)   +=3D x1e78100-lenovo-thinkpad-t14=
s.dtb
> > > > > > >>  dtb-$(CONFIG_ARCH_QCOM)   +=3D x1e80100-asus-vivobook-s15.d=
tb
> > > > > > >>  dtb-$(CONFIG_ARCH_QCOM)   +=3D x1e80100-crd.dtb
> > > > > > >>  dtb-$(CONFIG_ARCH_QCOM)   +=3D x1e80100-lenovo-yoga-slim7x.=
dtb
> > > > > > >> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkp=
ad-t14s.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
> > > > > > >
> > > > > > > So what happens for SKUs of this model wil have x1e80100 ?
> > > > > > >
> > > > > > > Maybe we should stick to x1e80100 ?
> > > > > >
> > > > > > This one only ships with 78100
> > > > > >
> > > > >
> > > > > Sure, but then in upstream we only have 80100. Plus, it is includ=
ed in
> > > > > this file as well.
> > > > >
> > > > > I don't know what's the right thing to do here. But I think it ke=
eps
> > > > > things more simple if we keep everything under the x1e80100 umbre=
lla.
> > > >
> > > > plus sticking to x1e80100 will avoid angering tab completion :-P
> > >
> > > This is an old argument, with no clear answer. For some devices we
> > > choose to use correct SoC name (sda660-inforce-ifc6560). For other we
> > > didn't (sdm845-db845c, which really is SDA845). However for most of t=
he
> > > devices the goal is to be accurate (think about all the qcs vs qcm
> > > stories). So my 2c. would go to x1e78100.
> > >
> >
> > I agree, x1e78100 follows the naming scheme we have agreed upon - for
> > better or worse.
>
> So should the device trees for the Asus Vivobook S15 and the Lenovo
> Yoga Slim 7x be renamed then?  Since those also (only) ship with
> X1E-78-100 variants of the SoC.
>
> There is supposed to be a variant of the Vivobook with the X1P-64-100
> (I haven't seen it actually for sale yet).  Since that one has only 10
> CPU cores, should that one gets its own device tree?  That may not be
> possible.  I have a strong suspicion that all the variants are just
> binned versions of the same SoC, where the X1P just has two of the
> cores disabled.  If Qualcomm, like Apple, attempts to increase the
> yield by binning SoCs with broken or badly performing cores as X1P it
> might be a lottery which of the 12 cores get disabled.
>
> And for the vendors that do offer models with different X1E variants,
> are there going to multiple device trees, one for each variant?
>
> I'm asking because on OpenBSD we load the device trees in our
> bootloader and map SMBIOS vendor and product names to a device tree
> name.  So a consistent naming scheme for the device trees is
> desirable.

multi-sku laptops are going to make this a mess..  We really should
just reconsider.. or maybe sidestep the issue and call them all
"x1-crd.dts", "x1-lenovo-yoga-7x.dts", etc

BR,
-R

> Thanks,
>
> Mark
>
> > Regards,
> > Bjorn
> >
> > > --
> > > With best wishes
> > > Dmitry
> >

