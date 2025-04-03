Return-Path: <linux-arm-msm+bounces-53067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 85449A79935
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 02:07:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7307B188D260
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 00:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22DDB2E337E;
	Thu,  3 Apr 2025 00:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eb05JHwT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13484D26D;
	Thu,  3 Apr 2025 00:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743638806; cv=none; b=EktLb/2alElJ/ANDJ9yKUbZoXxi+lgL6M3B0P0DgHytdcSxbRslyKXW1LWkJ516xJRNoysCIO4cCwAGwL066IG/KxGf6BjNY8hG0u/5/UAi7Gj3+y0hXlUbWq6xjM6Bx2hWR6O9cEulPLRqYxGeBdRiAbNr08exvoZpJqhW+P0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743638806; c=relaxed/simple;
	bh=q0oeBg4kkjHukNevSdAXAXG57vFGbGkVFCKLMccHnWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IfPtc69T1DLraapCbKjLYvVmq5TSJib/bTbvl7MuQbe3r7NB6TobNKmynqxXlNJjYeEY91cMVvWId/y5ZVhCf7YmGL2rnqdhatlBKThpke3brsGuEmuGCsvd7Pmyr54wZfBfhY+Ya5oX/RZC05d8bvn0JKeo/u+yXX3x8QrqVmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eb05JHwT; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so2430755e9.1;
        Wed, 02 Apr 2025 17:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743638802; x=1744243602; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=THqZB3gc9ZiqXUYns3lMT7gLqog0AJdSzQ22r6kIxIg=;
        b=eb05JHwTcsOcMq5VFNt78u6jEbs/NAfwNmBxcLQvXJ3oO2yT3cwSTN9d0eoYqzR6Rg
         70bLPYn9Iw+WLxNsEEP+/n07nA/sQfZS5lu47pZ5F2nOZWjrB+cLCMheKfGa2Tik1oxe
         +C5NF54cWRbf3KySzXa+eUD7yI1nMOdBCK6FgPwbBQsDKMDbRL8MD400B6FkvjAfrTCC
         8y+wgKmRB2EKgBi0RxtuOt+gTOQmub/Lg0SFpKHU+pFF8jlA99P+ILgE1aNZLXXHh7RP
         72bSuEQ3sy/7xt2JY+Ls9PAksv180el2uoxg7mB6vh5zQS8j1kGaImNZ4ohFh3kIUAQ3
         TVcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743638802; x=1744243602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=THqZB3gc9ZiqXUYns3lMT7gLqog0AJdSzQ22r6kIxIg=;
        b=bW1uJPzrFs4o0Xn1qkeli/E1xhXgr628qMMVPit+97N+DVmxdtgtTgQu317scTmYL/
         2k/cGHJaEjKKqFt1cZPgs1QFo8LCDoY8q8U0x/udcuma3diIjFJqRD/DZMBxNA/C6dQb
         92zffP+vgaIm31LXTDbs0U3RHDt6hsn6Jkhlf0GbsdgfW6ecIP3ZT8vmMZzC/Zbv6pOJ
         yB57dkkgjCF+CgjIHb9cwn4DIrdIrnhd+uX2kBP4VAw+s3Ok8CYwJ5zG955Ss3HMAD5U
         dkuoRsRUg1jLj1EN07ZhvooHtcZvIjFcTilj00Rl4oFRTgN5SoLwpMPnt2sxh1apPD88
         OMDw==
X-Forwarded-Encrypted: i=1; AJvYcCU1y1EksQvDo/EE+ffg/BGzMhzKGlU8AunP71EFoQafPAk5qKft3ET53yZucRAl2QTFXIK63nreKICg@vger.kernel.org, AJvYcCUkwC7fNmNlzKObuLAWSDsKcikRdqPk152Vj3PiCLFrKaizzTOBluTC9ArJ4EzI/KDrIRo8HtSNiJlQ@vger.kernel.org, AJvYcCW3ZuB6Awv4WK0wR8rW4HDu6XuOVvpGy9fsq22pmscaP0jVvl2B7aTVNzoGr4rSy1H4HsdXClHV12C0OHR5@vger.kernel.org, AJvYcCWhDvXy+LQ+J2FV6+1a6ufHcUY0AivBiutfcn8Uga8HQbUNqG7E+SYCh+iqX5qyy+NL9HYJftOTZAOJxdgGBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMADUh+DecK8DFwYOx0x632Qx89HW5EelcKigAcFdvOahoJTUk
	FtY3eyTIxegvo75g9zu+Vzbhysz3+IC+dcicKw+3w4EBu0hGNHDJlxk3ye7UZlDw6Vk+DpzYRUb
	PV9L85+J5zhef61uZ4YC0PbBBJA==
X-Gm-Gg: ASbGncumnHWJBaFW4oe+JYbhC+amBaeGF/MTs9py+Dm3DlVJ+X6hH8Ypyf4KuCns5Bz
	nNhdpoZDEivK+7TI3HKPq4NP5xHew9D4c4XIDGBaaZ5SnI4royxU22MQ55PpwFgMPT7igNwuoiz
	O7dJ5mS4r6GXzKLzAhDDRjDgfoOg==
X-Google-Smtp-Source: AGHT+IEvyEQkupDmAf3qVozR5BlueIdVIfTL0esTsJxUP8sWVaCCP1GT6K2TX6UE6Phhe+TxzenmCuBGyJp2uE4+9O0=
X-Received: by 2002:a05:6000:2585:b0:39c:2688:4ebf with SMTP id
 ffacd0b85a97d-39c29737e0dmr3794378f8f.6.1743638801887; Wed, 02 Apr 2025
 17:06:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMcHhXqbQ-6SLotNfQDStr5B0KAMxFRuSiLnjdg+UrtqA1phXw@mail.gmail.com>
 <AM7P189MB100945E7C0850C7469739C81E3AF2@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
 <CAMcHhXrcvsKtZnHC5gKFh3nc_XKQKaLdBbnQA6J_rBdUxxP27w@mail.gmail.com>
In-Reply-To: <CAMcHhXrcvsKtZnHC5gKFh3nc_XKQKaLdBbnQA6J_rBdUxxP27w@mail.gmail.com>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Thu, 3 Apr 2025 02:06:30 +0200
X-Gm-Features: ATxdqUHEo8FZvVy5ygBezdSIUAGGICKKb_RWUaWMTv_G9s3WUL90wafr3AxtuqI
Message-ID: <CAMcHhXpPpQ175jiX3KbEVY7ATLghEzGU9EeQjx+zHkMs8vovzA@mail.gmail.com>
Subject: Re: [PATCH v1 6/6] arm64: dts: qcom: Add support for X1-based Asus
 Zenbook A14
To: Maud Spierings <maud_spierings@hotmail.com>
Cc: abel.vesa@linaro.org, andersson@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, gregkh@linuxfoundation.org, 
	heikki.krogerus@linux.intel.com, johan+linaro@kernel.org, 
	konrad.dybcio@oss.qualcomm.com, konradybcio@kernel.org, krzk+dt@kernel.org, 
	krzysztof.kozlowski@linaro.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, lumag@kernel.org, 
	robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2 Apr 2025 at 10:36, Aleksandrs Vinarskis
<alex.vinarskis@gmail.com> wrote:
>
> On Wed, 2 Apr 2025 at 08:30, Maud Spierings <maud_spierings@hotmail.com> =
wrote:
> >
> > > On Tue, 1 Apr 2025 at 23:15, Konrad Dybcio
> > > <konrad.dybcio@oss.qualcomm.com> wrote:
> > >>
> > >> On 4/1/25 8:05 PM, Aleksandrs Vinarskis wrote:
> > >> > On Tue, 1 Apr 2025 at 17:59, Konrad Dybcio
> > >> > <konrad.dybcio@oss.qualcomm.com> wrote:
> > >> >>
> > >> >> On 3/31/25 11:53 PM, Aleksandrs Vinarskis wrote:
> > >> >>> Initial support for Asus Zenbook A14. Particular moddel exists
> > >> >>> in X1-26-100, X1P-42-100 (UX3407QA) and X1E-78-100 (UX3407RA).
> > >> >>>
> > >> >>> Mostly similar to other X1-based laptops. Notable differences ar=
e:
> > >> >>> * Wifi/Bluetooth combo being Qualcomm FastConnect 6900 on UX3407=
QA
> > >> >>>   and Qualcomm FastConnect 7800 on UX3407RA
> > >> >>> * USB Type-C retimers are Parade PS8833, appear to behave identi=
cal
> > >> >>>   to Parade PS8830
> > >> >>> * gpio90 is TZ protected
> > >> >>
> > >>
> > >> [...]
> > >>
> > >> >>
> > >> >>> +&spi10 {
> > >> >>> +     status =3D "disabled";
> > >> >>> +
> > >> >>> +     /* Unknown device */
> > >> >>> +};
> > >> >>
> > >> >> Does the device crash if you enable this bus? Keeping it 'okay' w=
ould
> > >> >> make it easier for folks to poke at it
> > >> >
> > >> > It does boot just fine, but does not initialize:
> > >> > ```
> > >> > geni_spi a88000.spi: Invalid proto 9
> > >> > ...
> > >> > qnoc-x1e80100 interconnect-1: sync_state() pending due to a88000.s=
pi
> > >> > ...
> > >> > ```
> > >> >
> > >> > I only quickly checked that 9 is indeed invalid state, iirc should=
've
> > >> > been 2. But haven't looked deeper into it, so left it disabled. So=
 I
> > >> > thought best to leave it off for now. Unless you prefer to drop it
> > >> > altogether?
> > >>
> > >> That means this QUP is configured to work as a QSPI host, which is n=
ot yet
> > >> supported upstream. I looked at the DSDT you submitted to aa64-lapto=
ps, but
> > >> there doesn't seem to be anything connected there, perhaps it's load=
ed at
> > >> runtime. Since your keyboard and touchpad work, maybe it's a touchsc=
reen?
> > >>
> > >
> > > Indeed it is just defined without anything attached. I am suspecting
> > > it also may be just leftover, won't be the first one...
> > > No, this particular laptop doesn't have a touchscreen in any of the
> > > three screen configurations announced.
> > >
> > > It also does not have a fingerprint reader, nor hardware TPM2.0 (yet
> > > SPI11 typically used for it is still TZ protected :). EC seems to be
> > > over i2c5. Asus's touchpad supports some fancy gesture controls, but
> > > there is in fact another 'extra' hidraw device 'hdtl', I assume that'=
s
> > > the one. No sdcard reader.
> > > Only other still unsupported features are audio (i guess unlikely tha=
t
> > > they used different smart amp?), camera (ov02c01, pm8010, so also no)
> > > and DP-HDMI bridge PS185HDM, which from what I can guesstimate is i2c=
.
> >
> > I actually managed to contact someone about the ps185hdm as it is also
> > used in my asus vivobook s15. But from what they told me it is a dumb
> > bridge that does not require any further configuration. I have tried
> > getting it to work but I've had no luck yet. I did find a hpd gpio at
> > tlmm 126.
> >
> > I currently have just tried ignoring its existence and describing a non
> > existent dp-connector with the hpd gpio hooked up to mdss_dp2_out but n=
o
> > luck. I get a timeout on the aux bus communication I think, so somethin=
g
> > is blocking that still.
>
> I think it was your messages that I saw on IRC of aarch64-laptops
> then. Can confirm both HPD on tlmm, and lack of any i2c devices on
> newly created virtual bus.
>
> >
> > I think it may just be some regulator or something required to actually
> > power up the ps185hdm
>
> That was my conclusion as well. Would you mind following up with them,
> if they could disclose the amount of voltage supplies the IC is
> expecting? if it's 1 or 2, it's rather easy to bruteforce all unused
> pin combinations. If it's more than that, it's only reasonable to
> enable all unused GPIOs to high at once, which I wouldn't do tbh :)
>
> The weird thing is that according to a rather simplified publically
> available diagram, HPD is actually propagated through the PS185,
> implying that bridge is on. It could be that IC requires multiple
> supplies, hence Aux bus is not working, but in my experience these
> devices typically don't start until all of the required supplies are
> up.
>
> >
> > from my correspondence:
> > `
> > Hi Maud,
> >
> > There is no =E2=80=9Cenable pin=E2=80=9D on the PS185 but there are sev=
eral GPIO=E2=80=99s. The
> > FW associated with the device is programmable so the manufacturer of th=
e
> > motherboard you are using may have requested a special feature (such as
> > an enable pin on one of the GPIO) to be added by Parade. If that=E2=80=
=99s the
> > case then you would need to contact the motherboard manufacturer to fin=
d
> > out more details.
> >
> > Hot plug events are normally routed through the DP_HPD pin but, as note=
d
> > above, it=E2=80=99s possible that the motherboard manufacturer asked fo=
r this to
> > be replicated on the GPIO pin.
> > `
> >
> > some messing around of me in the dts can be found here: [1]
>
> I think, you would also need to enable usb_1_ss2 combo phy, afaik only
> mdss3 (for eDP) has a dedicated DP phy, for the rest it's a combo
> qmpphy. Konrad could probably confirm?
> Once i2c/aux works, maybe we would also need a small driver to set phy
> to DP mode, as afaik pmic-glink handles these. Just hypothesis though.
> I have tried adding a dummy "dp-connector" like you did, but as a
> child node to pmic-glink, hoping that it would handle the alt mode,
> but it is probably not that easy :)
>
> Would be happy to cooperate on debugging this offline.
>
> Alex

Small update,

Following initial work from Maud, I hacked around a bit and got HDMI
working _most of the times_ on cold boot. Far from complete, but this
proves the IC is indeed working as dumb bridge. At least non Zenbook
DP routed to qmphy, like hinted by DSDT.
I am guessing the HPD event comes too early, before AUX is ready for
EDID readout to be the cause of the hotplug almost never working,
since I can always readout EDID manually just fine. Will need to
investigate it a bit more.

Initial (dirty) change for Asus Zenbook A14 [1].

[1] https://github.com/alexVinarskis/linux-x1e80100-zenbook-a14/commit/9046=
6cd004c3df5d717295ae7dcd5ed183701de0

>
>
>
> >
> > [...]
> >
> > [1]:
> > https://github.com/SpieringsAE/linux/blob/wip/x1e80100-6.14/arch/arm64/=
boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
> >
> > kind regards,
> > Maud

