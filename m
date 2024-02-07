Return-Path: <linux-arm-msm+bounces-10030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD0D84C1E5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Feb 2024 02:32:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BC561F240F1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Feb 2024 01:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB69BDDA3;
	Wed,  7 Feb 2024 01:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OLwcyKEi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB331D267
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Feb 2024 01:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707269536; cv=none; b=jFdgG/AjFx/qN7xHEdIB9EwHpSKc9efNIOb3uwbomO+Y5GsMBAprMNRY8K+CssAjIXDp9G9sUVquyaZ0T0Dzgi8DY3MICr4Zcp0yvALmktK3+rXlFCMwjCvyltY4x1XWwgakqQaM7B+pCJFvDr0oAtd9fBy3U8BFilPHE9/S+n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707269536; c=relaxed/simple;
	bh=kTyLhTinDOUD2dILnzoYkknmbWfY6CzsPssz5k9zVgc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R8ZdiPlwOjaZ8SxywJD1VOxKe+icpzBDRXorSL0dnHPYNpY/XhxRxglpq8aGzvU5/ixsTxMeXc9mYlxc4gDlBBrBeBs5AuER0aHAZnKi+2KB7ukPdReTbVAlyZNTgyKqF8fjqD84B9Gs00vu9Wh0OWdGp2w/F2ZWDSoCrTthQbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OLwcyKEi; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-60484b96cd7so1039947b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Feb 2024 17:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707269534; x=1707874334; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UR5w5w3nYNrMr4t2252rxJ6poSbTDfrSVSynZ45Rb38=;
        b=OLwcyKEiUNBZZE52AOMT5StOIXxyZRIZnl0PmR08K2+1wZzuuchgCCiI8mJW8NvnFW
         XZGmAqh8oPJu17Xm41UNvYYR5Kpjn+kEs4H3oeRbHn2f+UmHuaoOu/KbRo+6DZpVmn1h
         e/uWjFPR8h2eaeDUW58gE9zXKC3S3HyMRJy67RmzN2kbkcHIlBf4fvQ8P3D93Y1D2B2f
         cob1Zwi5mrLkecjJ4N2od1Eakw/51qveFI2zjj6ftggQ6RnIn7xQte9XSmHRTJay81UE
         ESyd0el46yN2ddJp4eeSdX8r0nnHQg/lxDVDvonAI8v6CeYofMUiDBa6+VNRJp3hUlwq
         OI3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707269534; x=1707874334;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UR5w5w3nYNrMr4t2252rxJ6poSbTDfrSVSynZ45Rb38=;
        b=i06bY26gHU2kT7/ffUHbUQZvOHlWZaZbFmF0U2OjsPbTlceWqqNyHwfPhPOJsy5xxT
         /vosKiHshCkUJaoten2XinGuZ8k/D7GeYgz1mDm+c/VCqHDSIAvecaYMLpKvC+F1R9Lh
         U7JD8WoWMl2iS/d2kz859RwGl9k76bE7Uy1BB+V3vJxQ8L1af7cGnstx6u97nCWOhcNR
         CnYcufsxMcuVNTdj9mbVjOZnR6qbNof02sA8N/Vh0U9tzRxA6Vx/Xp232YDjC9CCDWvt
         Fla6Bqp9I628NPPquhAQzMwhjZD/VXZ7x+bN+58yVO5S2f1WCNy72mYY6R9NEaiOfEQ8
         rV3w==
X-Forwarded-Encrypted: i=1; AJvYcCXcee8mhdOyc1I1nvDMTOxDuedEQ6EhHVA0dORM0Gv29TX+IIOCF5buapD7Ddm/sJLMrNZhW4wDkV1Cz+unGhSi5Aw4MvOECL23ZqnzVQ==
X-Gm-Message-State: AOJu0YxJvrnv6SyFA38OzCR/OYpfaZSzfqBtQxp5ZC+05at1D9JV7Dkc
	jKSkBbdj6u73xm0uj2E2E2CNDNAkNb5LdaStQvkb7c0w8/xFMIr3s65LNT0bz/nnA3Tq6CW05LT
	vmOrv3ekwMouarxZy++Y0PMqbKvB7fw7uv2CLFQ==
X-Google-Smtp-Source: AGHT+IE6HJChHEBK7iL2zfT9AySXYjwDAtbcfV2QOrHxvxPI3SzOJrJMh8q1Ex5CYOpYBW9Bgsv+IarM+lEcpeNr/wM=
X-Received: by 2002:a81:a193:0:b0:5ff:6028:99f5 with SMTP id
 y141-20020a81a193000000b005ff602899f5mr3377783ywg.41.1707269533799; Tue, 06
 Feb 2024 17:32:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240206114745.1388491-1-quic_kriskura@quicinc.com>
 <20240206114745.1388491-4-quic_kriskura@quicinc.com> <23824242-1b37-4544-ae9a-0a5a0582580e@linaro.org>
 <CAA8EJpqbXvKMQktGsxMFJnR+fXoOz8hFmm+E3ROPTjjiD0QLvg@mail.gmail.com> <6q2ocvrujbli42rjddflyol74xianr7j47jwcgdnnmwjanv25d@uw2da7zulqqd>
In-Reply-To: <6q2ocvrujbli42rjddflyol74xianr7j47jwcgdnnmwjanv25d@uw2da7zulqqd>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 7 Feb 2024 03:32:03 +0200
Message-ID: <CAA8EJpr6k8c5C54S9xxQgZvd9NYFoxi5qQrOTz2AMrp0xeZZpw@mail.gmail.com>
Subject: Re: Re: [PATCH 3/3] arm64: dts: qcom: sa8540-ride: Enable first port
 of tertiary usb controller
To: Andrew Halaney <ahalaney@redhat.com>
Cc: neil.armstrong@linaro.org, Krishna Kurapati <quic_kriskura@quicinc.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	quic_ppratap@quicinc.com, quic_jackp@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 Feb 2024 at 02:10, Andrew Halaney <ahalaney@redhat.com> wrote:
>
> On Tue, Feb 06, 2024 at 03:30:32PM +0200, Dmitry Baryshkov wrote:
> > On Tue, 6 Feb 2024 at 15:28, <neil.armstrong@linaro.org> wrote:
> > >
> > > On 06/02/2024 12:47, Krishna Kurapati wrote:
> > > > From: Andrew Halaney <ahalaney@redhat.com>
> > > >
> > > > There is now support for the multiport USB controller this uses so
> > > > enable it.
> > > >
> > > > The board only has a single port hooked up (despite it being wired up to
> > > > the multiport IP on the SoC). There's also a USB 2.0 mux hooked up,
> > > > which by default on boot is selected to mux properly. Grab the gpio
> > > > controlling that and ensure it stays in the right position so USB 2.0
> > > > continues to be routed from the external port to the SoC.
> >
> > What is connected to the other port of the MUX?
>
> /me blows off the dust on the schematic
>
> It's a 1:2 mux, and one option is the out the board, the other
> is a test point I believe if I'm reading things right, although its not
> labeled so I'm not sure anyone would actually find it on the board.

Ack, this definitely looks like a static configuration.

>
> >
> > > >
> > > > Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> > > > Co-developed-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> > > > Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> > > > ---
> > > >   arch/arm64/boot/dts/qcom/sa8540p-ride.dts | 21 +++++++++++++++++++++
> > > >   1 file changed, 21 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> > > > index b04f72ec097c..eed1ddc29bc1 100644
> > > > --- a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> > > > +++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> > > > @@ -503,6 +503,18 @@ &usb_2_qmpphy0 {
> > > >       status = "okay";
> > > >   };
> > > >
> > > > +&usb_2 {
> > > > +     pinctrl-0 = <&usb2_en>;
> > > > +     pinctrl-names = "default";
> > > > +
> > > > +     status = "okay";
> > > > +};
> > > > +
> > > > +&usb_2_dwc3 {
> > > > +     phy-names = "usb2-port0", "usb3-port0";
> > > > +     phys = <&usb_2_hsphy0>, <&usb_2_qmpphy0>;
> > > > +};
> > > > +
> > > >   &xo_board_clk {
> > > >       clock-frequency = <38400000>;
> > > >   };
> > > > @@ -655,4 +667,13 @@ wake-pins {
> > > >                       bias-pull-up;
> > > >               };
> > > >       };
> > > > +
> > > > +     usb2_en: usb2-en-state {
> > > > +             /* TS3USB221A USB2.0 mux select */
> > > > +             pins = "gpio24";
> > > > +             function = "gpio";
> > > > +             drive-strength = <2>;
> > > > +             bias-disable;
> > > > +             output-low;
> > > > +     };
> > > >   };
> > >
> > > Isn't gpio-hog the preferred way to describe that ?
> >
> > That depends. As this pinctrl describes board configuration, I'd agree
> > with Neil.
>
> I unfortunately don't have the experience with gpio-hog to weigh in
> here, but wouldn't be opposed to Krishna switching it if that's what's
> recommended for this type of thing.

Quoting gpio.txt:

The GPIO chip may contain GPIO hog definitions. GPIO hogging is a mechanism
providing automatic GPIO request and configuration as part of the
gpio-controller's driver probe function.

See sdm845-pinctrl.yaml for an example of the gpio-hog node.

>
> >
> >
> > --
> > With best wishes
> > Dmitry
> >
>


-- 
With best wishes
Dmitry

