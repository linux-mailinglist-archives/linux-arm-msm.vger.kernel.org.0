Return-Path: <linux-arm-msm+bounces-36767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 825699B94E5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 17:05:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12F311F22200
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 16:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38FED1BB6B3;
	Fri,  1 Nov 2024 16:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mDrsVhLf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1658181ACA;
	Fri,  1 Nov 2024 16:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730477123; cv=none; b=muvny47GlmuyiXtYdy3d8UwhyxGinAx1XB0JDSJlNbG2SkF9Q2Xdv3hk3DOksevwncIGmkNzsBXYJr88uixNvnxQwsU3o+wy5QL6+O1kIgvCuwcLALwRSgwrsExTyBmjkfASN96+bymCFI2eV3BqBRyxnQZLlZSQDrfn/yULDoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730477123; c=relaxed/simple;
	bh=Uu4MQlnjm2E1L/aU+HDZPVxnrRXgoclKUmjZt66t2L8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BgR/N61VW7yDD8GT+jVmKa6BCeQp5BzJE/Lrue9LAuRe01EqhFfHN/p9HVql9dJOkhPPrj/FUFL1uBmIhNUff02iOEYhfwXspMCZFlulYIsex9S8gQqK0FTxyCGuHobKNl4ZD3Ba8qyN5GPAFtO6j7snlVOsl9zXxq/Ym1ClDSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mDrsVhLf; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-83ac05206f6so79593539f.2;
        Fri, 01 Nov 2024 09:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730477119; x=1731081919; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kuGYsDq/8KVBVCrawJNRaHmxsjuDcoTms3F6ILMG2Nc=;
        b=mDrsVhLf73MVbFsomloow6WiARQGNgy4xV2Dx9Tbwrh0gaU205XYHeKb/mZ4zOORq9
         e6M0P901ft9yp/Tr+QVb9GwayB9boBpF0N/ZzxaRZkoLKCK/DcCrnnzXFbnSAA3pvSfz
         vck4alBSX/FLgMEE6js+4FdeIsM8BkTWY6yMBS3MlkkIVrU+FjZIczD6Er10il11o4Bj
         BOE5Iy6tkFvvvcmmCDghhkgUNAaZj811Pfja/2pkXwhxWXJDb0i/Uqo+fY/kCnaZFi57
         lvP8vRvt2DwZImi9gDB43p29C05HJpd1+WGQCfnoKhObK4pQdubb+uKqJzQ6P5us6/Kj
         t5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730477119; x=1731081919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kuGYsDq/8KVBVCrawJNRaHmxsjuDcoTms3F6ILMG2Nc=;
        b=PxRVtaFmRp6Ic5RvwWoOv11xotL0teF5nBxslOHYMGGuN++FNg23PF26rn8y6v1jai
         X3dXC7gA61Uq7znlckOtkwWY8Sdo4cVD6TVmeS8DS/ElB3Od+9f3fOOLrKvxMgV9keJP
         nVtTwQDPNoNu0+8eDEh83loFCNskwPnCXxbvOcHCDkmJUKA3fNfOk3CchgQi9pG+FTjk
         o7BlTig+M3YZRitNmmKFeG+qyzqo/potyRJMqKy83tRZZTHt47bgkPi0OvbxdlHqUCc7
         ieEwJcZaX6+hiTtjno9i2KwoAX18YNPgNrCQTJesS6E4nS0DnPrBcAOJxJo4QLWWEYZJ
         2zHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHKpwdmGPXgTmg/nV4GjPYwQYmOXcmSUHGIJc9ue7LtnH5BfmtWrju2tDekRhpAH6Q9GYAj0dUmxsLcHEc@vger.kernel.org, AJvYcCV9j2UKMngL4xpPKqlLpeiA9dCOFzFG7cvFb9IkAlpkHX1gtyccSvWvw7o5tE1cKedK5mjb61+ZjC41RBs1Cg==@vger.kernel.org, AJvYcCVMpaK2NAtJohRC6Zaa8pX53pa03CvMp3bJMaW0SFzv+/HtAuE0EpHLFF6Q7X2IfTiRksUQ3O+e5KWJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxulpxtwfWASBbgm+WHzZTqDv6VvTCWntVWEFwSL+V/j1GyJIwO
	8TyqkP0P+7U/XaW2t+9sghE1uNcbRctoF0K+8ZYHfeq1Qv5OWqJZlVW2ZYnooGvpLuVb+Na9WGI
	+KiJXaaDZ5drnGkMRnQmy0zsDpjo=
X-Google-Smtp-Source: AGHT+IHONrdDV4LzejxnIZF3enutVxBdz/iPFoAD8iZdgn5tMyF+owzTrNCgAzQzlf79XfKrpVjQbV7QD4AiQKQyJQk=
X-Received: by 2002:a05:6e02:1645:b0:3a5:e250:bba1 with SMTP id
 e9e14a558f8ab-3a61752ae86mr81367985ab.18.1730477118991; Fri, 01 Nov 2024
 09:05:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241025-b4-linux-next-24-10-25-camss-dts-fixups-v1-0-cdff2f1a5792@linaro.org>
 <20241025-b4-linux-next-24-10-25-camss-dts-fixups-v1-6-cdff2f1a5792@linaro.org>
 <CAF6AEGu_qJYV3TnprJsqsWV_GoLhiBFQ8LNwfYDjczDparvZCA@mail.gmail.com> <173047431366.2974136.175546053701391124@ping.linuxembedded.co.uk>
In-Reply-To: <173047431366.2974136.175546053701391124@ping.linuxembedded.co.uk>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 1 Nov 2024 09:05:04 -0700
Message-ID: <CAF6AEGu_vmR1N9C=1BQ21kk4w-tz6n3j-Sv14RoqbkxAeNUsvw@mail.gmail.com>
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sdm845-db845c-navigation-mezzanine:
 Add cma heap for libcamera softisp support
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Depeng Shao <quic_depengs@quicinc.com>, Vikram Sharma <quic_vikramsa@quicinc.com>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 1, 2024 at 8:18=E2=80=AFAM Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
>
> +Cc Laurent
>
> Quoting Rob Clark (2024-11-01 12:33:44)
> > On Fri, Oct 25, 2024 at 8:49=E2=80=AFAM Bryan O'Donoghue
> > <bryan.odonoghue@linaro.org> wrote:
> > >
> > > libcamera softisp requires a linux,cma heap export in order to suppor=
t
> > > user-space debayering, 3a and export to other system components such =
as
> > > pipewire, Firefox/Chromium - Hangouts, Zoom etc.
> >
> > AFAIU libcamera could use udmabuf, etc, and there is no hw requirement
> > for CMA.  So it doesn't seem we should be adding this to dt.  And I'd
> > really prefer that we not be using CMA just for lolz.
>
> I agree here. Otherwise this theoretically locks this memory to the pool
> 'forever'. It's not something we should define in device tree.
>
> udmabuf provides a means to get memfd allocated memory which is not
> physically contiguous - but /is/ managed by a dmabuf handle.
>
> Presently with SoftISP being CPU only - physically contiguous memory is
> not required.
>
> Bryan, will this still be true when you have a GPU based ISP ? Will that
> require physically contiguous memory ? Or will the mapping into the GPU
> handle any required translations?

GPU does not require phys contiguous.  OTOH it may/will impose some
layout constraints.

I'm kinda leaning towards teaching gbm to allocate YUV plus add a
GBO_BO_USE_CPU usage bit if softisp also needs CPU access.  (Modern
adreno can do cached-coherent buffers, at some small performance cost,
so that CPU access doesn't have to fall off a cliff.)  But that
doesn't exist yet.

BR,
-R

>
> --
> Kieran
>
>
> >
> > BR,
> > -R
> >
> > > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > > ---
> > >  .../boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso     | 11 +=
++++++++++
> > >  1 file changed, 11 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzan=
ine.dtso b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
> > > index d62a20f018e7a7e1c7e77f0c927c2d9fe7ae8509..c8507afcd1e0d1f9b14b6=
e4edcbc646032e7b6c9 100644
> > > --- a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts=
o
> > > +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts=
o
> > > @@ -9,6 +9,17 @@
> > >  #include <dt-bindings/clock/qcom,camcc-sdm845.h>
> > >  #include <dt-bindings/gpio/gpio.h>
> > >
> > > +/ {
> > > +       reserved-memory {
> > > +               linux,cma {
> > > +                       compatible =3D "shared-dma-pool";
> > > +                       size =3D <0x0 0x8000000>;
> > > +                       reusable;
> > > +                       linux,cma-default;
> > > +               };
> > > +       };
> > > +};
> > > +
> > >  &camss {
> > >         vdda-phy-supply =3D <&vreg_l1a_0p875>;
> > >         vdda-pll-supply =3D <&vreg_l26a_1p2>;
> > >
> > > --
> > > 2.47.0
> > >
> > >

