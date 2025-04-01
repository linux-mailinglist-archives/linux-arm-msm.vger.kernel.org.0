Return-Path: <linux-arm-msm+bounces-52984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 681FDA781DE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 20:05:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 145FC16BC45
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 18:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4937920F078;
	Tue,  1 Apr 2025 18:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eLM54CXL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBD113AC1;
	Tue,  1 Apr 2025 18:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743530720; cv=none; b=WPni3LOSwMnTpLNuBx/ifd5gGcXO2CkqJnFNzN+yP/5ux/sF7bofS7uIG6FuDLfqn/yuWvZMDhJsqaFmWJCdO9dFZe0+ikyiPufMyK9amByTYu5pQVDxDE3E7fWiYR/SsEf6y9Og3FopA8blhW/oqsRT/g8rN2OnMoult73A7lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743530720; c=relaxed/simple;
	bh=XDpRdAgxRwuqM46f3uVQQuYMPlOEdc3e738FDjjOW9w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fWjQSJX3/Vom6PjY6sPhPinahZi+zbCS3hLXgqoI8GR5HzYhwLb61ZjWKfYVY5t6rufijQmqpW0Np5tfwJ3ezaHFkQ5biwdwo0Ya8SwRAI8XDogM8ecEhbXRmW8KyHipidGajXTN1xh7UkHCAdROa4KiSyZ64HS6FJdUH/u9uFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eLM54CXL; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso3324935f8f.2;
        Tue, 01 Apr 2025 11:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743530716; x=1744135516; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nryfUWPwtMdkFx5KsN4d3gQF17UlPWaIg+fR9d/GUbs=;
        b=eLM54CXLNxiS2mxEAm4eW6q9KMDazR9j7YdYCUtHz2eA8SPWNWU++kgU9oQfe7uMzg
         YH39aCLDrqfOfMDJf8p2WOcwh94Gvo4pOQgB//hJ9KprD/I8ii1f3t85NKxC9XB5ayVL
         BBaFwdDq+IvxnJ2fevAvJMrcwG2vvXeLkF4O48OEjSJD5zgPJA5WzjKr8pCLHx8bCQ1F
         zju52Pvz7F4s+Sr6ctXWVMivojXe+5FW4RZ4dvMqK8jyKbxr+mYdgqf+9VHU18E80AzJ
         Rt47zgbKsQiVGOxwQwH0wXkMx6S4ugyFVHSLJLl38vvDNnDmemehghD/j4rtU6Xi4irB
         HMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743530716; x=1744135516;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nryfUWPwtMdkFx5KsN4d3gQF17UlPWaIg+fR9d/GUbs=;
        b=LX6qK+EtZbTXefH3SMgKGZCXB9l7uX4U9vJkDvKD2w0CXfocv/xSAgB1zEFHBFDEsx
         Qr3Ys37PLVuwjRi2jHl4xTAl3F0gsTxMb8UqdZ9HxqEVrBEWN/RmrpTBh8SVCg+OhvHr
         Y8mYOn7ITdukUPuGM4NUo1x9z9y0Bg15dPWdcS4UUQ79oLo1gZsNSYbVoOkgM6ErGMX7
         9MZMg5lcNC6sqibtouey9v0bHbNCs3QPaErH3GJFDjtPSeQOcageC1EcyNCipIJwNGcN
         9/CyQrT4B+SRXnb3Fss2xLyQT9DCX/wgwOAMt7XK0U+c752OL3upZ/GJ39XSoz3BizZ3
         U8AA==
X-Forwarded-Encrypted: i=1; AJvYcCV2Gx6EwOVqqMTD0GCgSOLncq7UVHWlI9ph8ojgtQTId5qTAop2PeEgz3vkY7Lcmc+gXD5ydLXlz2pV@vger.kernel.org, AJvYcCVlpSR9SOROm+OvkWyyXWz7AOgKh308qKeBWNbeomjYE/wIeuxn8CJothY59RK4S8wSAdI72/FVfTDIWbDG@vger.kernel.org, AJvYcCXhNiUsi1qNRIXnDkANNuL53h5GPOuZfXNshQn5gU1pWgPZRx9YD9K03cUfmQIzaUXFwLOX3zI7DK2T@vger.kernel.org, AJvYcCXl3e5csaMoALnwsVgsTcL2pSic6r5xJo7UiPviLNJFDPgaAS+llaHMnm/ItYEDqM9WwiUq+y/HNPpQ2kYf2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+R+PFF9PS9LtAQ3expxrFEUDzvfFVcmVGnGInIB0cTZCWiov/
	qdvvM1Y4aWy5plzGPIYC3QVOIA67DgBbqjjpHg+BiW6GOPfGEugqXYn78vvWa9RMFwUbxFbTTcn
	uZ/qZrVw3LyA37oDiSRPw2ZXDuA==
X-Gm-Gg: ASbGncslyg6ztH9KBRtlTMMLgClpf8Et0xqGmQoC6m9RCKgfk6ZYF5383XGw48tAsgv
	uJuiAvc0tOWZPQiu+NbPcHqZskBIp7shG1nUDDwwlqK48wPRQegSK/gambjrdflc6g3amUdTFqU
	UmdgleWEUFMC8bwC8E7BdTnqmumA==
X-Google-Smtp-Source: AGHT+IH+QK+V24kJEIVldO9Zr767vV+GPNMIA5c/QiCee+ngvYUMVWmvMhk8SNbKMcOOMcyMGwoQbLw76VeQFb35H9M=
X-Received: by 2002:a05:6000:210d:b0:39c:1257:dbab with SMTP id
 ffacd0b85a97d-39c1257dd00mr8319119f8f.59.1743530715991; Tue, 01 Apr 2025
 11:05:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331215720.19692-1-alex.vinarskis@gmail.com>
 <20250331215720.19692-7-alex.vinarskis@gmail.com> <ef783edb-c966-4ef7-b496-564420c1b852@oss.qualcomm.com>
In-Reply-To: <ef783edb-c966-4ef7-b496-564420c1b852@oss.qualcomm.com>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Tue, 1 Apr 2025 20:05:05 +0200
X-Gm-Features: AQ5f1Jo4ffJQTJBbHce2plaeHSYQtIvqK9UIjt3b6wewix3gePp0cy-0zeYgJGE
Message-ID: <CAMcHhXq8kjsbDGHBn=63JutD1TcD6=KVxCQtPHRoLOwE+FY-sA@mail.gmail.com>
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

On Tue, 1 Apr 2025 at 17:59, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 3/31/25 11:53 PM, Aleksandrs Vinarskis wrote:
> > Initial support for Asus Zenbook A14. Particular moddel exists
> > in X1-26-100, X1P-42-100 (UX3407QA) and X1E-78-100 (UX3407RA).
> >
> > Mostly similar to other X1-based laptops. Notable differences are:
> > * Wifi/Bluetooth combo being Qualcomm FastConnect 6900 on UX3407QA
> >   and Qualcomm FastConnect 7800 on UX3407RA
> > * USB Type-C retimers are Parade PS8833, appear to behave identical
> >   to Parade PS8830
> > * gpio90 is TZ protected
>
> [...]
>
> > +     leds {
> > +             compatible = "gpio-leds";
> > +
> > +             pinctrl-names = "default";
> > +             pinctrl-0 = <&cam_indicator_en>;
>
> property-n
> property-names
>
> please, we're trying to unify such small things even though we know
> it's "wrong" in a lot of places
>

will do.

> > +
> > +&i2c0 {
> > +     clock-frequency = <400000>;
> > +     status = "okay";
> > +
> > +     /* ELAN, 04F3:3315 */
> > +     touchpad@15 {
> > +             compatible = "hid-over-i2c";
> > +             reg = <0x15>;
> > +
> > +             hid-descr-addr = <0x1>;
> > +             interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
> > +
> > +             pinctrl-0 = <&tpad_default>;
> > +             pinctrl-names = "default";
> > +
> > +             wakeup-source;
> > +     };
> > +};
> > +
> > +&i2c3 {
> > +     clock-frequency = <400000>;
> > +     status = "okay";
>
> It's also customary to leave a newline before 'status'

will do.

>
> > +&pm8550_gpios {
> > +     rtmr0_default: rtmr0-reset-n-active-state {
> > +             pins = "gpio10";
> > +             function = "normal";
> > +             power-source = <1>; /* 1.8V */
>
> Drop the 1.8v comments please

will do.

>
> [...]
>
> > +&spi10 {
> > +     status = "disabled";
> > +
> > +     /* Unknown device */
> > +};
>
> Does the device crash if you enable this bus? Keeping it 'okay' would
> make it easier for folks to poke at it

It does boot just fine, but does not initialize:
```
geni_spi a88000.spi: Invalid proto 9
...
qnoc-x1e80100 interconnect-1: sync_state() pending due to a88000.spi
...
```

I only quickly checked that 9 is indeed invalid state, iirc should've
been 2. But haven't looked deeper into it, so left it disabled. So I
thought best to leave it off for now. Unless you prefer to drop it
altogether?

>
> > +
> > +&tlmm {
> > +     gpio-reserved-ranges = <44 4>,  /* SPI11, TZ Protected */
> > +                            <90 1>;  /* Unknown, TZ Protected */
> > +
> > +     bt_en_default: bt-en-sleep {
> > +             pins = "gpio116";
> > +             function = "gpio";
> > +             output-low;
> > +             bias-disable;
> > +             qcom,drive-strength = <16>;
>
> drop "qcom," and please keep the order of:
>
> pins
> function
> drive-strength
> bias
> output/input
>
> as you did below

Will do.

Should I also drop 'qcom,' from the 'misc_3p3_reg_en' and adjust order
the same way, or that one is somehow special?

>
> > +
> > +/ {
> > +     model = "ASUS Zenbook A14 UX3407RA";
>
> There's no strict policy, but variants usually go in braces

Parenthesis I guess, "ASUS Zenbook A14 (UX3407RA)" ?

>
> > +     compatible = "asus,x1e80100-zenbook-a14", "qcom,x1e80100";
> > +};
> > +
> > +&gpu_zap_shader {
> > +     firmware-name = "qcom/x1e80100/ASUSTeK/zenbook-a14/qcdxkmsuc8380.mbn";
> > +};
> > +
> > +&remoteproc_adsp {
> > +     firmware-name = "qcom/x1e80100/ASUSTeK/zenbook-a14/qcadsp8380.mbn",
> > +                     "qcom/x1e80100/ASUSTeK/zenbook-a14/adsp_dtbs.elf";
> > +
> > +     status = "okay";
> > +};
> > +
> > +&remoteproc_cdsp {
> > +     firmware-name = "qcom/x1e80100/ASUSTeK/zenbook-a14/qccdsp8380.mbn",
> > +                     "qcom/x1e80100/ASUSTeK/zenbook-a14/cdsp_dtbs.elf";
> > +
> > +     status = "okay";
> > +};
> > +
> > +&uart14 {
> > +     status = "okay";
> > +
> > +     bluetooth {
> > +             compatible = "qcom,wcn7850-bt";
> > +             pinctrl-names = "default";
> > +             pinctrl-0 = <&bt_en_default>;
> > +             enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
> > +             max-speed = <3000000>;
> > +     };
> > +};
> > diff --git a/arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dts b/arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dts
> > new file mode 100644
> > index 000000000000..b6c9a707090f
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dts
> > @@ -0,0 +1,48 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> > + * Copyright (c) 2025 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "x1p42100.dtsi"
> > +#include "x1-zenbook-a14.dtsi"
> > +
> > +/delete-node/ &pmc8380_6;
> > +/delete-node/ &pmc8380_6_thermal;
> > +
> > +/ {
> > +     model = "ASUS Zenbook A14 UX3407QA";
> > +     compatible = "asus,x1p42100-zenbook-a14", "qcom,x1p42100";
> > +};
> > +
> > +&gpu_zap_shader {
> > +     firmware-name = "qcom/x1p42100/ASUSTeK/zenbook-a14/qcdxkmsuc8380.mbn";
> > +};
>
> This file is not going to work on this SoC, you can drop it

I guess it would need a different firmware name? If yes, can we
already add the new name, such that once x1p42100 gains GPU support it
will get enabled 'automatically'?

Otherwise, I will just drop it.

>
> > +
> > +&remoteproc_adsp {
> > +     firmware-name = "qcom/x1p42100/ASUSTeK/zenbook-a14/qcadsp8380.mbn",
> > +                     "qcom/x1p42100/ASUSTeK/zenbook-a14/adsp_dtbs.elf";
> > +
> > +     status = "okay";
> > +};
> > +
> > +&remoteproc_cdsp {
> > +     firmware-name = "qcom/x1p42100/ASUSTeK/zenbook-a14/qccdsp8380.mbn",
> > +                     "qcom/x1p42100/ASUSTeK/zenbook-a14/cdsp_dtbs.elf";
> > +
> > +     status = "okay";
>
> Are the DSP firmware files actually different between the two?

CDSP is the same. ADSP blobs to my surprise are different, both '.elf'
and '.mbn'. But like I wrote in the cover letter, perhaps Asus just
forgot to update adsp firmware? Though according to changelong on
device pages [2],[4] both have "ADSP Driver : 2.0.4135.0200"

Compared by:
* Downloading UX3407QA's drivers [1], from the device page [2] and
UX3407RA'a drivers [3] from the device page [4]
* Extract and flatten with `7z e filename.exe`
* Compare via `md5sum *dsp*elf *dsp*mbn *dsp*jsn`

Though, even if the blobs would be/will be the same, I think it is
still beneficial to define firmware path per model, as this makes
firmware extraction from driver/Windows partition and placement much
easier. Unfortunately, as it seems so far, most of the devices besides
Lenovos are not having firmware upstreamed, so this is pretty
relevant. Eg. Ubuntu already has 'firmware extracting tool' [5] (draft
MR to include Zenbook as well), I'm guessing other distros have
something similar, though I haven't followed up.

On the other hand, these tools could of course get path from device
tree directly, eg. via `cat
/sys/firmware/devicetree/base/soc@0/remoteproc@32300000/firmware-name`,
then having all the blobs for the device in one location is less
relevant...

Thanks for reviewing,
Alex

[1] https://dlcdnets.asus.com/pub/ASUS/nb/Image/Driver/DriverPackage/42706/SOCPackage_forWebSite_Qualcomm_Z_V1.305.7550.2_42706.exe?model=UX3407QA
[2] https://www.asus.com/ch-en/laptops/for-home/zenbook/asus-zenbook-a14-ux3407/helpdesk_download?model2Name=UX3407QA
[3] https://dlcdnets.asus.com/pub/ASUS/nb/Image/Driver/DriverPackage/42705/SOCPackage_forWebSite_Qualcomm_Z_V1.305.7550.2_42705.exe?model=UX3407RA
[4] https://www.asus.com/ch-en/laptops/for-home/zenbook/asus-zenbook-a14-ux3407/helpdesk_download?model2Name=UX3407RA
[5] https://git.launchpad.net/~alexvinarskis/ubuntu/+source/qcom-firmware-extract/tree/qcom-firmware-extract?h=asus-zenbook-a14

>
> Konrad

