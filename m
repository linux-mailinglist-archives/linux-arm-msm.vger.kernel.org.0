Return-Path: <linux-arm-msm+bounces-53005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 103E6A78A0D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 10:36:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 315D71881E33
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 08:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFBA423536E;
	Wed,  2 Apr 2025 08:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQbcbF9b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB32F23373E;
	Wed,  2 Apr 2025 08:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743582994; cv=none; b=FKUFOBe6GSvwM+GbQbISAWCbvBDFLh4eo4+i5Rd1zh+yGgh2f32Swshxl/U3JNNLbF6IPMDDXeacDVzfpqS345mT/uH5kB39iihMdTtg6Jwk2dzFERuv5Y4mw/9Jz9XE0Pa6XPbWlXtLtJu7px3WrfALL4oMhLobHJQ4n6TkCPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743582994; c=relaxed/simple;
	bh=AyyCyeCC6HTMSrmCOpxWLpEDt09qKkeCxKxbHNgJBaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QE1AOqE30Q1ZqNWoJu1WfCCdx0fjU6RsEW9A/zlwVALyiJhIhWHrIAOgSp4RD287AgFAeq8B6CqR2doXClf0hT8mWtZqKrPGE/Ubfo4LoCjlSAg19JMBMggw2YodNUqJW6mC70zM/GULB9CWWN5//2EyzOwiAaoQq5QESxOxaKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OQbcbF9b; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39c1efc457bso1514684f8f.2;
        Wed, 02 Apr 2025 01:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743582991; x=1744187791; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2EMTGaIsY/RcPcOzrKRAsG9l4ts4LsJ5saPQvAd/7tY=;
        b=OQbcbF9bAXxNeNKIVeYjF1QOz5cqoSBBh1NnZJvLDY2PPC91fCbWcLi5d0HTf3rCO0
         PvmB5/Cz04k3s28xQQVtjDl0A4v0+mqCHbG4vp8qhNJoXmTSjJAd5DqAUwfxGvzO5c+h
         C/XbTf3V/NoSx3sziEUYH0dUVtWVkPG1vooPcKWMWS1hPaSWPDESQQ1EP7LWXvn6XS1N
         tp5LplunwVrP/SFTOCt3vcb8vaZeGSmvVqF7KWIWIl0YbK/dDHmDC9pY1pqHkoo3Xi05
         xtHWaiS48k/1T2u5qyul0OFPKoi5Vc3KsM/rN2GpTC3k8ksspm8NAbBezp1UzQAeUAVf
         CekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743582991; x=1744187791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2EMTGaIsY/RcPcOzrKRAsG9l4ts4LsJ5saPQvAd/7tY=;
        b=RwxBUSdI309wTEdpcW1J19aaqWnBS0zUYSKsA0tquG5Tq/ob9A8v2TiAZ9SWUcW8/Y
         toj1qVU8BLtcNIpz1ljentPX+9tACpIoj/EZ1U2U/cBCVjqqw5P+3t6cFYiifoKcvS4b
         1mtdqWUkE0f3DfOISp/lEY7zm2neySuqckSwSgEPNicODd+b9lDl1PKVxj2cgOj/J8lW
         ssU+tzNaXi4CxkB+M9Py+ASrrPm6+0Z1CHNA0XUDEwcmloKlJS7N7+vvVYrZw1Ce22C9
         ARCEqHVB0/burNPJSQIwY6JERSyh4+dS+zqt1G4AtZzdxqhIPGw7B83Ylnlwm4tttWbX
         7sBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnKgqeLTztQE/xZtM0Ug8Vydc6kC8/Lql495m7jTrQBhn+gtuekGIpsyqMtxyBHUzmp2rKoeOy/7atH4ui@vger.kernel.org, AJvYcCUqv3RhIGvqooRpqzOzjlInSROxrhnKBCvxL6Nl+7WW2gPxISmuZjbIIR8kGSGZBXI4E1KN1KMG7Gcim3FrPg==@vger.kernel.org, AJvYcCWe6wJ61QxKEeCRIKXoZhAxSGuCFR/tKuzRiB4IPCp7AmRDszSoxprhJIb/9yn+9JAZSjAiKlYQpch8@vger.kernel.org, AJvYcCXMjpERC12wUltYTv7LstBSH2irzGMr3EBvGp7p3Qy6IMsmtpS3oDjVa/X2lpmowdUcsGbYniRf9e/W@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/w7nFEMFxCbcqfYqSC668QL3EbMt600qNivK8pkbDDRre/Cz6
	HoOQDu/AT6hRavUklP/LybPEoKpBLjP4OXGmBY6LZ9eMp9G0gb0/VmA6apI9+8YUk1m98nN6f/b
	VEC8aNzZOPBdG0S5Ur+AkenC37A==
X-Gm-Gg: ASbGncuxjgIywgkR9K5r35HoMhcJpZKzssHw0HO8qCBtQzxUbtyKULqNp96FWMPAYy3
	Ti5/ZbFmq1tqe5K05n6pkaoEl2feSROMJJa3p6lwzsINffhDLNCNW86UL4ir7AoxUEhl17t8kwM
	RZEHaNChxR5DU3o+moNmpLJyQ2TksBYAV9JMWI
X-Google-Smtp-Source: AGHT+IEoDkIDBHz9S6bLwFs1kZs0BZOVBKd1EdIOtatIJJjYIc6MqmeMx2MRbSB/U/BhnI/6zpYXXWbdtrlStac6ZMw=
X-Received: by 2002:a05:6000:2d0d:b0:391:9b2:f48d with SMTP id
 ffacd0b85a97d-39c120e3d1amr8451669f8f.33.1743582990697; Wed, 02 Apr 2025
 01:36:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMcHhXqbQ-6SLotNfQDStr5B0KAMxFRuSiLnjdg+UrtqA1phXw@mail.gmail.com>
 <AM7P189MB100945E7C0850C7469739C81E3AF2@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
In-Reply-To: <AM7P189MB100945E7C0850C7469739C81E3AF2@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Wed, 2 Apr 2025 10:36:19 +0200
X-Gm-Features: AQ5f1JoXZPC3Q6MNzKbM8CIKupalRPf1YZ_oTLyyI6zk5gt61P8ErGvKdRcMrhE
Message-ID: <CAMcHhXrcvsKtZnHC5gKFh3nc_XKQKaLdBbnQA6J_rBdUxxP27w@mail.gmail.com>
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

On Wed, 2 Apr 2025 at 08:30, Maud Spierings <maud_spierings@hotmail.com> wr=
ote:
>
> > On Tue, 1 Apr 2025 at 23:15, Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 4/1/25 8:05 PM, Aleksandrs Vinarskis wrote:
> >> > On Tue, 1 Apr 2025 at 17:59, Konrad Dybcio
> >> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >> >>
> >> >> On 3/31/25 11:53 PM, Aleksandrs Vinarskis wrote:
> >> >>> Initial support for Asus Zenbook A14. Particular moddel exists
> >> >>> in X1-26-100, X1P-42-100 (UX3407QA) and X1E-78-100 (UX3407RA).
> >> >>>
> >> >>> Mostly similar to other X1-based laptops. Notable differences are:
> >> >>> * Wifi/Bluetooth combo being Qualcomm FastConnect 6900 on UX3407QA
> >> >>>   and Qualcomm FastConnect 7800 on UX3407RA
> >> >>> * USB Type-C retimers are Parade PS8833, appear to behave identica=
l
> >> >>>   to Parade PS8830
> >> >>> * gpio90 is TZ protected
> >> >>
> >>
> >> [...]
> >>
> >> >>
> >> >>> +&spi10 {
> >> >>> +     status =3D "disabled";
> >> >>> +
> >> >>> +     /* Unknown device */
> >> >>> +};
> >> >>
> >> >> Does the device crash if you enable this bus? Keeping it 'okay' wou=
ld
> >> >> make it easier for folks to poke at it
> >> >
> >> > It does boot just fine, but does not initialize:
> >> > ```
> >> > geni_spi a88000.spi: Invalid proto 9
> >> > ...
> >> > qnoc-x1e80100 interconnect-1: sync_state() pending due to a88000.spi
> >> > ...
> >> > ```
> >> >
> >> > I only quickly checked that 9 is indeed invalid state, iirc should'v=
e
> >> > been 2. But haven't looked deeper into it, so left it disabled. So I
> >> > thought best to leave it off for now. Unless you prefer to drop it
> >> > altogether?
> >>
> >> That means this QUP is configured to work as a QSPI host, which is not=
 yet
> >> supported upstream. I looked at the DSDT you submitted to aa64-laptops=
, but
> >> there doesn't seem to be anything connected there, perhaps it's loaded=
 at
> >> runtime. Since your keyboard and touchpad work, maybe it's a touchscre=
en?
> >>
> >
> > Indeed it is just defined without anything attached. I am suspecting
> > it also may be just leftover, won't be the first one...
> > No, this particular laptop doesn't have a touchscreen in any of the
> > three screen configurations announced.
> >
> > It also does not have a fingerprint reader, nor hardware TPM2.0 (yet
> > SPI11 typically used for it is still TZ protected :). EC seems to be
> > over i2c5. Asus's touchpad supports some fancy gesture controls, but
> > there is in fact another 'extra' hidraw device 'hdtl', I assume that's
> > the one. No sdcard reader.
> > Only other still unsupported features are audio (i guess unlikely that
> > they used different smart amp?), camera (ov02c01, pm8010, so also no)
> > and DP-HDMI bridge PS185HDM, which from what I can guesstimate is i2c.
>
> I actually managed to contact someone about the ps185hdm as it is also
> used in my asus vivobook s15. But from what they told me it is a dumb
> bridge that does not require any further configuration. I have tried
> getting it to work but I've had no luck yet. I did find a hpd gpio at
> tlmm 126.
>
> I currently have just tried ignoring its existence and describing a non
> existent dp-connector with the hpd gpio hooked up to mdss_dp2_out but no
> luck. I get a timeout on the aux bus communication I think, so something
> is blocking that still.

I think it was your messages that I saw on IRC of aarch64-laptops
then. Can confirm both HPD on tlmm, and lack of any i2c devices on
newly created virtual bus.

>
> I think it may just be some regulator or something required to actually
> power up the ps185hdm

That was my conclusion as well. Would you mind following up with them,
if they could disclose the amount of voltage supplies the IC is
expecting? if it's 1 or 2, it's rather easy to bruteforce all unused
pin combinations. If it's more than that, it's only reasonable to
enable all unused GPIOs to high at once, which I wouldn't do tbh :)

The weird thing is that according to a rather simplified publically
available diagram, HPD is actually propagated through the PS185,
implying that bridge is on. It could be that IC requires multiple
supplies, hence Aux bus is not working, but in my experience these
devices typically don't start until all of the required supplies are
up.

>
> from my correspondence:
> `
> Hi Maud,
>
> There is no =E2=80=9Cenable pin=E2=80=9D on the PS185 but there are sever=
al GPIO=E2=80=99s. The
> FW associated with the device is programmable so the manufacturer of the
> motherboard you are using may have requested a special feature (such as
> an enable pin on one of the GPIO) to be added by Parade. If that=E2=80=99=
s the
> case then you would need to contact the motherboard manufacturer to find
> out more details.
>
> Hot plug events are normally routed through the DP_HPD pin but, as noted
> above, it=E2=80=99s possible that the motherboard manufacturer asked for =
this to
> be replicated on the GPIO pin.
> `
>
> some messing around of me in the dts can be found here: [1]

I think, you would also need to enable usb_1_ss2 combo phy, afaik only
mdss3 (for eDP) has a dedicated DP phy, for the rest it's a combo
qmpphy. Konrad could probably confirm?
Once i2c/aux works, maybe we would also need a small driver to set phy
to DP mode, as afaik pmic-glink handles these. Just hypothesis though.
I have tried adding a dummy "dp-connector" like you did, but as a
child node to pmic-glink, hoping that it would handle the alt mode,
but it is probably not that easy :)

Would be happy to cooperate on debugging this offline.

Alex



>
> [...]
>
> [1]:
> https://github.com/SpieringsAE/linux/blob/wip/x1e80100-6.14/arch/arm64/bo=
ot/dts/qcom/x1e80100-asus-vivobook-s15.dts
>
> kind regards,
> Maud

