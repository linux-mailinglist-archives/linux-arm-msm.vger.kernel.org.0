Return-Path: <linux-arm-msm+bounces-52989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D17A7842A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 23:51:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 303FB3A7219
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 21:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D74F51EE7DD;
	Tue,  1 Apr 2025 21:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dtcXzen6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF59B1EE034;
	Tue,  1 Apr 2025 21:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743544257; cv=none; b=jjhITPYvxUb4J50cEwS4XgFlef4wF1DZGRv9awEONy7ttIMfgADV2vUbLjRwxODhjYgHrIwObTt7/Q7EQxR/LIt0L3QVY3XUKPpvGFomDSkvv9ZPZgSkzQre92ZVt9SC2bE7o7y6hUTH4mHnTYsDocsqHZmkiKu2mmasSioHSYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743544257; c=relaxed/simple;
	bh=gmcrgRP4fA6+lKBgGEJyMoZHH6u64n1CPOLGacIyvps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HVXP7S9CJ/mUih6scfprJ++eAGdPUD/UQk536aeD9xZxi5Fq5iZMmtbmcqmTGAhmLX71D3ByuHCJgoUjDbpjduxyFOmBzyWX/85j8RJqa6ber4ge4Q3WVvjp2W1YY+Iw9dj6aHU9zsnSYbHq5UdgJqHnizYylY4arg1he7oaIe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dtcXzen6; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38f2f391864so3638438f8f.3;
        Tue, 01 Apr 2025 14:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743544254; x=1744149054; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bj1Qrbt7flnOfY4sCj4gZ44wqy0H0z7fYnmzu+9/yJs=;
        b=dtcXzen6cVf0TKY/zFHV+w+B6W5PAo0kiSRrM90PiQ+rwieeksTU0U25ZvCSKyinBi
         0ONROyUOlG7fuY/8IOw01ljqsKS5QKwfQPLRRRYv1gEK22aVpqrd5i8mj2R+KOLd3ODx
         +FVKuHrO0wpXhbllNXyBG4YStlRxVQSwbby3a4ZQnecilR4tcBEkWmT4tjxgmCzpx2YH
         az8SaZG4zCITlQs6Hb49fNHvyoRAusVXAYNtSkP++xjKzFFaLMiYdsmgdtIrZn4+sjuy
         Zb+2kvQf6ANQCtvSMt5hIJ3/4sHa+uwN1bnRUq310GQ3ho3nmmE6Ei4QbWypFk2YHLpS
         Mz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743544254; x=1744149054;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bj1Qrbt7flnOfY4sCj4gZ44wqy0H0z7fYnmzu+9/yJs=;
        b=oLzg5ztnGGFuGPM7fG4Jnue/pG+F7GaVGE9fWdylRA3fiRJX18Dqixn+S/m63YSLf2
         VoliM9SSbziSPyKALQDTFfyI+MQogu4r0b0DXTyc7loYV4YYfBR/d9Psd2whNw5lr3Au
         iMBOdB7UT307JK1EhlvkKQDre62wzdMPdCYqgjTdxdv+9Mkho2acvCUgSuBG9TbIF2wN
         NqGYICILPEKxF5GQiX7LWkZbkx8NXhFmeyawm8aauTXWt3RAF4EdRFwlVRcwUEaleex/
         BvdKdb3RBf8v791mo9lFHEptRz5NOhtnnGe47FIfupc6FK9w3DdtpdT2LWYiT238rwGK
         /FVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIIDBcyPiWvMZwwP4BYQxdIPpwOLKPw7DolemY2/uUq6vTOGM/FssR8VkFmeOvB7G9mhUKfgQC2Z5h8NXFdA==@vger.kernel.org, AJvYcCVP8fVsZJqK4OVqb4GeaXvFqcMfYZ0pYbLyIJ4yDoNSqM5ivdJd+fJREVwRdqu5Zf/xNYHeJTbGoi5n@vger.kernel.org, AJvYcCVZaFM1RnzUY1FV3fRK/HWeu6u4zMcabs2VEPMEL6odZv0MKJ6wbZrZDb5WtN21o5TNLo3rXqbbPCrO@vger.kernel.org, AJvYcCWrzP5SAO5Rznvo1UYwKeCNxY6DNAfeyKJbuz1XYDOjorzuzFUxpxoQlErWbwctM0VsCbl28rYIpzGR2wED@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/C/Z30k6R68dAu1UZll/z72yrwPJn7Rg0d+izhtNc29ygG4Vk
	4Tget743iqYfHMv1RxaRz5Lx3R/e4xBwvZ6kfbqLJZjxBqK3OEiUHkskX4oNhJF7VcB3jMdNHVc
	UlhhQuNT8RWlYZ7PhxlG+pYMOcQ==
X-Gm-Gg: ASbGncso8YeHeHuZoH1hjeEP9i9vyp58YIn6QG552gNgPIfABHvXrcaNjlYziwzZt7O
	WhjbgcNc1b81iQJ294FUlRIGpyCcQgAdSEybB+aWItIVi6NB130cnxMBEWlXGM3Jq2u6Svbs59l
	Yf9llceFCfvmnLsr+9c42p7tAKdQ==
X-Google-Smtp-Source: AGHT+IH+nE3yYY238SmLUlr5Tf6eAoBkJh1OEpYZbPxT6Fmyg5IdupbyKe8C8Et2YT7E9ZscBJPT6cw5hsyNbp0w8VY=
X-Received: by 2002:a5d:6d8a:0:b0:39c:dcc:f589 with SMTP id
 ffacd0b85a97d-39c120dd036mr13002419f8f.20.1743544253818; Tue, 01 Apr 2025
 14:50:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331215720.19692-1-alex.vinarskis@gmail.com>
 <20250331215720.19692-7-alex.vinarskis@gmail.com> <ef783edb-c966-4ef7-b496-564420c1b852@oss.qualcomm.com>
 <CAMcHhXq8kjsbDGHBn=63JutD1TcD6=KVxCQtPHRoLOwE+FY-sA@mail.gmail.com> <93f916d1-83b9-41c0-bb05-a785fb730088@oss.qualcomm.com>
In-Reply-To: <93f916d1-83b9-41c0-bb05-a785fb730088@oss.qualcomm.com>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Tue, 1 Apr 2025 23:50:42 +0200
X-Gm-Features: AQ5f1JrU_u_uQLps4ycNd1PU0smu4anSzKOXyBaWJwfxWAxm7Svz7wvxve828dc
Message-ID: <CAMcHhXqbQ-6SLotNfQDStr5B0KAMxFRuSiLnjdg+UrtqA1phXw@mail.gmail.com>
Subject: Re: [PATCH v1 6/6] arm64: dts: qcom: Add support for X1-based Asus
 Zenbook A14
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Abel Vesa <abel.vesa@linaro.org>, 
	Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Apr 2025 at 23:15, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/1/25 8:05 PM, Aleksandrs Vinarskis wrote:
> > On Tue, 1 Apr 2025 at 17:59, Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 3/31/25 11:53 PM, Aleksandrs Vinarskis wrote:
> >>> Initial support for Asus Zenbook A14. Particular moddel exists
> >>> in X1-26-100, X1P-42-100 (UX3407QA) and X1E-78-100 (UX3407RA).
> >>>
> >>> Mostly similar to other X1-based laptops. Notable differences are:
> >>> * Wifi/Bluetooth combo being Qualcomm FastConnect 6900 on UX3407QA
> >>>   and Qualcomm FastConnect 7800 on UX3407RA
> >>> * USB Type-C retimers are Parade PS8833, appear to behave identical
> >>>   to Parade PS8830
> >>> * gpio90 is TZ protected
> >>
>
> [...]
>
> >>
> >>> +&spi10 {
> >>> +     status = "disabled";
> >>> +
> >>> +     /* Unknown device */
> >>> +};
> >>
> >> Does the device crash if you enable this bus? Keeping it 'okay' would
> >> make it easier for folks to poke at it
> >
> > It does boot just fine, but does not initialize:
> > ```
> > geni_spi a88000.spi: Invalid proto 9
> > ...
> > qnoc-x1e80100 interconnect-1: sync_state() pending due to a88000.spi
> > ...
> > ```
> >
> > I only quickly checked that 9 is indeed invalid state, iirc should've
> > been 2. But haven't looked deeper into it, so left it disabled. So I
> > thought best to leave it off for now. Unless you prefer to drop it
> > altogether?
>
> That means this QUP is configured to work as a QSPI host, which is not yet
> supported upstream. I looked at the DSDT you submitted to aa64-laptops, but
> there doesn't seem to be anything connected there, perhaps it's loaded at
> runtime. Since your keyboard and touchpad work, maybe it's a touchscreen?
>

Indeed it is just defined without anything attached. I am suspecting
it also may be just leftover, won't be the first one...
No, this particular laptop doesn't have a touchscreen in any of the
three screen configurations announced.

It also does not have a fingerprint reader, nor hardware TPM2.0 (yet
SPI11 typically used for it is still TZ protected :). EC seems to be
over i2c5. Asus's touchpad supports some fancy gesture controls, but
there is in fact another 'extra' hidraw device 'hdtl', I assume that's
the one. No sdcard reader.
Only other still unsupported features are audio (i guess unlikely that
they used different smart amp?), camera (ov02c01, pm8010, so also no)
and DP-HDMI bridge PS185HDM, which from what I can guesstimate is i2c.

So I am a bit out of ideas of what it could be...only thing that comes
to my mind is headphone jack smart amp, ifff they did not use qcom amp
one there as well?

>
> >
> >>
> >>> +
> >>> +&tlmm {
> >>> +     gpio-reserved-ranges = <44 4>,  /* SPI11, TZ Protected */
> >>> +                            <90 1>;  /* Unknown, TZ Protected */
> >>> +
> >>> +     bt_en_default: bt-en-sleep {
> >>> +             pins = "gpio116";
> >>> +             function = "gpio";
> >>> +             output-low;
> >>> +             bias-disable;
> >>> +             qcom,drive-strength = <16>;
> >>
> >> drop "qcom," and please keep the order of:
> >>
> >> pins
> >> function
> >> drive-strength
> >> bias
> >> output/input
> >>
> >> as you did below
> >
> > Will do.
> >
> > Should I also drop 'qcom,' from the 'misc_3p3_reg_en' and adjust order
> > the same way, or that one is somehow special?
>
> Sort of. &tlmm and &pm8xxx_gpios use two different drivers, each one
> of which has slightly different expectations about their subnodes.

Ah I see. Okay, will fix the order, but will leave `qcom,` as is.

>  >
> >>
> >>> +
> >>> +/ {
> >>> +     model = "ASUS Zenbook A14 UX3407RA";
> >>
> >> There's no strict policy, but variants usually go in braces
> >
> > Parenthesis I guess, "ASUS Zenbook A14 (UX3407RA)" ?
>
> Ugh, yes!

Sounds reasonable and looks a bit better, will update.

>
> [...]
>
> >>> +
> >>> +&gpu_zap_shader {
> >>> +     firmware-name = "qcom/x1p42100/ASUSTeK/zenbook-a14/qcdxkmsuc8380.mbn";
> >>> +};
> >>
> >> This file is not going to work on this SoC, you can drop it
> >
> > I guess it would need a different firmware name? If yes, can we
> > already add the new name, such that once x1p42100 gains GPU support it
> > will get enabled 'automatically'?
>
> The filename is different indeed. You can add it, as currently this
> property is not yet consumed by anything, anyway.

Just checked, should be the `qcdxkmsucpurwa.mbn` then. Will update it,
thanks for confirmation.

>
> [...]
>
> >>
> >>> +
> >>> +&remoteproc_adsp {
> >>> +     firmware-name = "qcom/x1p42100/ASUSTeK/zenbook-a14/qcadsp8380.mbn",
> >>> +                     "qcom/x1p42100/ASUSTeK/zenbook-a14/adsp_dtbs.elf";
> >>> +
> >>> +     status = "okay";
> >>> +};
> >>> +
> >>> +&remoteproc_cdsp {
> >>> +     firmware-name = "qcom/x1p42100/ASUSTeK/zenbook-a14/qccdsp8380.mbn",
> >>> +                     "qcom/x1p42100/ASUSTeK/zenbook-a14/cdsp_dtbs.elf";
> >>> +
> >>> +     status = "okay";
> >>
> >> Are the DSP firmware files actually different between the two?
> >
> > CDSP is the same. ADSP blobs to my surprise are different, both '.elf'
> > and '.mbn'. But like I wrote in the cover letter, perhaps Asus just
> > forgot to update adsp firmware? Though according to changelong on
> > device pages [2],[4] both have "ADSP Driver : 2.0.4135.0200"
> >
> > Compared by:
> > * Downloading UX3407QA's drivers [1], from the device page [2] and
> > UX3407RA'a drivers [3] from the device page [4]
> > * Extract and flatten with `7z e filename.exe`
> > * Compare via `md5sum *dsp*elf *dsp*mbn *dsp*jsn`
> >
> > Though, even if the blobs would be/will be the same, I think it is
> > still beneficial to define firmware path per model, as this makes
> > firmware extraction from driver/Windows partition and placement much
> > easier. Unfortunately, as it seems so far, most of the devices besides
> > Lenovos are not having firmware upstreamed, so this is pretty
> > relevant. Eg. Ubuntu already has 'firmware extracting tool' [5] (draft
> > MR to include Zenbook as well), I'm guessing other distros have
> > something similar, though I haven't followed up.
> >
> > On the other hand, these tools could of course get path from device
> > tree directly, eg. via `cat
> > /sys/firmware/devicetree/base/soc@0/remoteproc@32300000/firmware-name`,
> > then having all the blobs for the device in one location is less
> > relevant...
>
> More importantly, different blobs may (but don't necessarily have to) include
> different, hardcoded expectations about the board (or platform) they run on.
> So let's keep them separate.

Ah okay. Perfect, keeping as is.

Thanks,
Alex

>
> Konrad

