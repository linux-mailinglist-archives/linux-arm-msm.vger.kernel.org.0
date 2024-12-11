Return-Path: <linux-arm-msm+bounces-41580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAA19ED9B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 23:28:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10D7216307F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 22:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C2341D88D0;
	Wed, 11 Dec 2024 22:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="g25QaZNV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFC71F0E57
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 22:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733956060; cv=none; b=a9r1UAxZxY3cgLXDCb0RaOf+EAKhIEyl93dQcmFOfsxrF+0m+3+edjIq2Lfee13XUmirTeLKvAbjblMrQmtg6iweMHIM9rQWq81urFX/4mtpNGdq8h/I2tIn3Yi0eRgnFYInX6bWDCCs4WNji06j1T0DcdmbJ3s0e/HxMzDWMQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733956060; c=relaxed/simple;
	bh=CxczlAVJ2KXIHFoak56IOVnj4UTzCb1FwfYB8pYAXj4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JzTwHWm0iK1u3AxAMDrj/gT8Tw2+CH9IUgISyrCvFbVERs8UWkCuBBkptZGM+51Yx0WtqxcZ9kfBKL/oKyqifat/IRPS2g9nkAxaeqevueYJW4XJKehjxtTVCAn/PjJ/Bm1zZdNdV9anROL4YnWtycd/HJkOHI3g+p56tx8N5Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=g25QaZNV; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-540254357c8so2591702e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 14:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733956056; x=1734560856; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OP5yTlQX9Qcr5Sy7oqm3jVaqriEDKIPmmSAXtfhzrP8=;
        b=g25QaZNVdLsi49hDDiQ8E7JV55EgTicKHuTYYH6lkrZFKd2ce8yPqbz+i/6yNX6QJd
         2xc3ubIZzfMdQ3qXza9FJbFo9XKQ2NISV20jH5RR5TZ/sMfU2zxHvHwRAiTtHViIYhmw
         j041ffngNuD+E15ZcolLVvr4QKNCF/sSkUStk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733956056; x=1734560856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OP5yTlQX9Qcr5Sy7oqm3jVaqriEDKIPmmSAXtfhzrP8=;
        b=X7XRMzyGdgT+/aY7q6zP9IXrmci3o1Mw2OcddzzWlO1Z6Qq7cyF0QusFeh4PDAilCK
         7eOA3b1k+i0Q9/4fHJ3b5bX0hawajjVUT5p150loKr2gsRK0G/UIgFV4C3OL6pRnup8G
         KJLD4Ra7nnM8vLpGv6wwGo9XafyX7BYH4Q+nkR8aN46CUj2XJpl/4hn4qdELTHC7twDV
         bSVqVBUBT6n0Z429VoNeDi0O2gHjBVcL4bKY3COGbMsyO1VdQZMhXOqNCYYMn57vtJXq
         yIKnUHEZCxJv4OzhZtSd6h17hs2fKkrC7AajmflFKmxb2OzuODZKWm2JNUKdtZgwxGC3
         v1ZA==
X-Forwarded-Encrypted: i=1; AJvYcCXaXm1giIEm+PSkOI/EnZMFwILbueceVBUuoGRBtJSib9GE/oehxD/q0znLHOoVLZzO2h5vHTDvxghCU36v@vger.kernel.org
X-Gm-Message-State: AOJu0YyWIBDKGHnOM6bktiSG53kroOJPiZmokqfm6AzUpQnIWsnNoR7t
	JcROafvn+pL47tW1rwxrisFgXNwqZ2Zs0gYEfTmz+wxftMN8I9S9fqzSwBcwB+JXMMGW/QOGHXi
	JKA==
X-Gm-Gg: ASbGnculA7CxWGg/L4WXxsGJqTbe04lcYcW0x2ytuq6lB1IoYZICA7A3Q96ksbtORS4
	QOUCKxlfLtZg61bg9q4ZSUtqT/2kh35DdIIPz80YxF/Mv860tS65m984Ps0sJzmGFlZfGhX3+V0
	7lPZnYjL+pfqr0gEEljVmJnmligkEAsvdTyMCpdvMiFgo4gkEFlmmYKSx/+A4S30AoUjmOH1BjM
	s1FrKI7PwzQ4ToNPySUJqWmI96brsDmMsgaedhY5Tc91l8KlCzTIESN+skBNiAX/8adqNctBBRn
	2gCqa4istiNB1iqZSev37Q==
X-Google-Smtp-Source: AGHT+IHngwMbhXAz9xaGxjVl7GFWlBMPgWjYk72Mbr/l4OfpV60tkTQ4NbEPh/ZTSXBntjfmVsR3mg==
X-Received: by 2002:a05:6512:1246:b0:53e:3aaa:5c7c with SMTP id 2adb3069b0e04-5402a609949mr1698882e87.51.1733956055627;
        Wed, 11 Dec 2024 14:27:35 -0800 (PST)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5401cacc70fsm1205603e87.5.2024.12.11.14.27.34
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 14:27:35 -0800 (PST)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-300392cc4caso49797801fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 14:27:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVynD0vG/Y/YymwFdD5DWdbW5ja7iNJN7cIuYz6OlD3FF8LUX+CAo5+I3ooavYKbzD11MYq/87jUSeDLz4i@vger.kernel.org
X-Received: by 2002:a05:651c:210c:b0:300:3a15:8f2a with SMTP id
 38308e7fff4ca-30249e00c59mr4195391fa.2.1733956053624; Wed, 11 Dec 2024
 14:27:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241204150326.1470749-1-quic_vdadhani@quicinc.com>
 <20241204150326.1470749-2-quic_vdadhani@quicinc.com> <CAD=FV=XF+9wxZ5xNtO3Uy8QW9UY4tb+KR46jkondvBeQuVLsrA@mail.gmail.com>
 <6736db20-127b-45c3-ac90-3e3e359c343b@quicinc.com> <CAD=FV=VReNQ3nw+wfZizL7JjxEX9z=GwDEJAFzheNkW7rSrB5Q@mail.gmail.com>
 <65ded632-963a-4bfd-906c-1b09e916b5e0@quicinc.com>
In-Reply-To: <65ded632-963a-4bfd-906c-1b09e916b5e0@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 11 Dec 2024 14:27:22 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WrXegUW7n0e5Lp6AMN9u492Rn1yFXCOzGRbs36VeKrMA@mail.gmail.com>
X-Gm-Features: AZHOrDnd4yPKzZ7z0r-DDC60k0pmk_2L5RUUePsjv7ZkRWOmo6qWozIHPBzjPco
Message-ID: <CAD=FV=WrXegUW7n0e5Lp6AMN9u492Rn1yFXCOzGRbs36VeKrMA@mail.gmail.com>
Subject: Re: [PATCH v1 1/7] dt-bindings: i2c: qcom,i2c-geni: Document DT
 properties for QUP firmware loading
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	broonie@kernel.or, andersson@kernel.org, konradybcio@kernel.org, 
	johan+linaro@kernel.org, agross@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-spi@vger.kernel.org, quic_anupkulk@quicinc.com, 
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 10, 2024 at 9:27=E2=80=AFPM Viken Dadhaniya
<quic_vdadhani@quicinc.com> wrote:
>
> On 12/10/2024 11:12 PM, Doug Anderson wrote:
> > Hi,
> >
> > On Mon, Dec 9, 2024 at 9:28=E2=80=AFPM Viken Dadhaniya
> > <quic_vdadhani@quicinc.com> wrote:
> >>
> >> On 12/4/2024 10:55 PM, Doug Anderson wrote:
> >>> Hi,
> >>>
> >>> On Wed, Dec 4, 2024 at 7:03=E2=80=AFAM Viken Dadhaniya
> >>> <quic_vdadhani@quicinc.com> wrote:
> >>>>
> >>>> Document the 'qcom,load-firmware' and 'qcom,xfer-mode' properties to
> >>>> support SE(Serial Engine) firmware loading from the protocol driver =
and to
> >>>> select the data transfer mode, either GPI DMA (Generic Packet Interf=
ace)
> >>>> or non-GPI mode (PIO/CPU DMA).
> >>>>
> >>>> I2C controller can operate in one of two modes based on the
> >>>> 'qcom,xfer-mode' property, and the firmware is loaded accordingly.
> >>>>
> >>>> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> >>>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> >>>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> >>>> ---
> >>>>    .../devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml   | 11 ++++++=
+++++
> >>>>    1 file changed, 11 insertions(+)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qco=
m.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> >>>> index 9f66a3bb1f80..a26f34fce1bb 100644
> >>>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> >>>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> >>>> @@ -66,6 +66,15 @@ properties:
> >>>>      required-opps:
> >>>>        maxItems: 1
> >>>>
> >>>> +  qcom,load-firmware:
> >>>> +    type: boolean
> >>>> +    description: Optional property to load SE (serial engine) Firmw=
are from protocol driver.
> >>>> +
> >>>> +  qcom,xfer-mode:
> >>>> +    description: Value 1,2 and 3 represents FIFO, CPU DMA and GSI D=
MA mode respectively.
> >>>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>>> +    enum: [1, 2, 3]
> >>>
> >>> I'm a little confused about this. I'll admit I haven't fully analyzed
> >>> your patch with actual code in it, but in the past "CPU DMA" mode and
> >>> "FIFO" mode were compatible with each other and then it was up to the
> >>> driver to decide which of the two modes made sense in any given
> >>> situation. For instance, last I looked at the i2c driver it tried to
> >>> use DMA for large transfers and FIFO for small transfers. The SPI
> >>> driver also has some cases where it will use DMA mode and then
> >>> fallback to FIFO mode.
> >>>
> >>> ...so what exactly is the point of differentiating between "FIFO" and
> >>> "CPU DMA" mode here?
> >>
> >> Yes, correct, Will update in V2.
> >> I plan to add 2 modes, GSI and non-GSI(PIO or DMA based on length).
> >>
> >>>
> >>> Then when it comes to "GSI DMA" mode, my understanding is that the
> >>> firmware for "GSI DMA" mode is always loaded by Trustzone because the
> >>> whole point is that the GSI mode arbitrates between multiple clients.
> >>> Presumably if the firmware already loaded the GSI firmware then the
> >>> code would just detect that case. ...so there shouldn't need to be an=
y
> >>> reason to specify GSI mode here either, right?
> >>>
> >>> -Doug
> >>
> >> GSI firmware is loaded from TZ per QUP, but to use GSI mode,
> >> we need to configure the SE to use GSI mode by writing into SE registe=
r
> >> QUPV3_SE_GENI_DMA_MODE_EN and SE_GSI_EVENT_EN. This register is
> >> used to configure data transfer mode for Serial Engine.
> >
> > Can't you detect it's in GSI mode without any device tree property
> > like the code does today?
> >
> > -Doug
>
> No, we can't detect GSI mode in the current design. The GSI firmware is
> loaded from the TZ side, while mode selection occurs on the APPS side
> based on the Device Tree property.

Presumably you can check to see if the geni firmware has already been
loaded before the kernel started, right? In the case that it's already
loaded, can't you fall back to the way that existing code detects GSI
mode? From reading `drivers/spi/spi-geni-qcom.c` I see that if the
FIFO is disabled then it assumes we must be in GSI mode...
Specifically, it checks:

readl(se->base + GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;

The i2c code today (`drivers/i2c/busses/i2c-qcom-geni.c`) does the same.

So, essentially:

* If geni firmware has already been loaded, then check
FIFO_IF_DISABLE. If the FIFO is disabled it's GSI. If not then both
"CPU DMA" and "FIFO" are allowed.

* If geni firmware hasn't already been loaded then it's impossible to
be in GSI mode since GSI only makes sense if the geni firmware was
loaded before the kernel started. Thus we're in "CPU DMA" / "FIFO"
mode.

In both cases you don't need an attribute telling you whether to use
GSI mode or not, right?

-Doug

