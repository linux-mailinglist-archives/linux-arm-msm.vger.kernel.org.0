Return-Path: <linux-arm-msm+bounces-54099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F91A86CD5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 13:48:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF2B3443A22
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 11:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9D0F1AAA29;
	Sat, 12 Apr 2025 11:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FUKS6y0X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42B87FD;
	Sat, 12 Apr 2025 11:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744458492; cv=none; b=IUHxaHDAQ4Gq5V1H8fPLyDBXwkgNJo+Iorarco98h8ofmux/PH9zYKEAc+SUBXchZ3EhKFBd3bxYGZQmLXNZybIm6jme8SIcqMXXnpGQWqXO12tPaQYvCV1owdGhEjeDkTrsNsvrpV/yQF3BcW5Kh2d7Aj5/0ofFLeYnT2gWUFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744458492; c=relaxed/simple;
	bh=OJgHRXwM7hiYQ4eSnI2MPkpqA+d62q5RHWnPsL3f9Ns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lAn3eGezWv7JtYGRAvcg4oyex36m2iOWD0ovTJ4gWRC08XVPfir71EVILNhQSOrLj1Krihyq7udFt9IDcGUrEa7PDX+ltdceYPLjJLCCnmnvK8zasfHlInRXMy+T5btkIo7skytCN5crnf50d4k9CQDv7blHRXZqoRwAH/zQu6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FUKS6y0X; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso1532191f8f.2;
        Sat, 12 Apr 2025 04:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744458489; x=1745063289; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W+FV7qp4hCrHbBuroVIp784j2SvE9rcCe3b2QofSy8A=;
        b=FUKS6y0X/BUvb948Fnm26rZsRBRd0NMbG4QRwAiHWBF8uZIugWUgUICAoZMk7KYej3
         7oc93mmlKbHgR/D0Kk5ZUdi2br402owYA4T+SESHPm6hdvhBLV95qrHQ9E1LWR41a7i0
         h/cHnoQK3usK8WRAVohq6Dp0HT2wmVEoeuMi8Dl9fMWMBeMR8bKFba2/gz/+YBt74Kd7
         tXaQtzQfoTePuVYcPuQ9YYwFnIIE45o59QeAUWzFlULy9z/sW1NCtD2PDhBmf4p8E3kS
         2J/PQ3bumjtbkSErIfvhe3gVxPy0JY3xgxsE5+XGUqAmJUbkcpjcdQ7srkFPpvvn+YSS
         YXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744458489; x=1745063289;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W+FV7qp4hCrHbBuroVIp784j2SvE9rcCe3b2QofSy8A=;
        b=t9NtVfafCgBVE7zoGRQtWqQwi5h517JZ61YgcvtOmUp1CTNTucTxGu+oIVF+UXgc07
         H+IHw8h0XQ0U/VUIc9y6lwC9t0qYwNhXxrbfB1FpACFEDPLcYTeAtijmfSMCzyyq+etJ
         YjXWp6z0dZr1jLJsrMUoH9p2e1bCnYXD15q86/wuSVw0j8kZc20wjATTBFuV2geUUJfX
         HyFkdGn2jxmaYIoamYkDVBsrDxInVdt6ILU0LsPiCKVHZ1NdNF5z2Sjry0gJztBH+m2T
         OxzfPnuM2zG6ysBXmtlEYtTDCY1lf3nkF7+eW9tSHiNp3bEkHYwM5cDz1hL+DZhxS04g
         a0Eg==
X-Forwarded-Encrypted: i=1; AJvYcCUI7btpDTc+JRpeHfBtQt1haX2lheE++Yxv+aJ4aFYFu4JYkQWySlVWXnffP+S3KKagoENmfp8UoKD4nic5KQ==@vger.kernel.org, AJvYcCVowhyFAMGP3Fs1gwMdu4JdZfHEpgcIwRoERgCYAfRGi1LCXL2PL+uh0M+f/wpteQfSB7hFKoor10wj@vger.kernel.org, AJvYcCXpifYBixzoUy6VnK6+lhsJHOTBtq4kToHSh182ySHtaxAfQ347SU/XDrCVaIFVvpJ5dHBvZY5qB7MH3ABx@vger.kernel.org
X-Gm-Message-State: AOJu0YxtFejFUQ7qIf3GZleUWvAeimUHrxLCSF8klNNKxHXzT9O78M32
	aXqlFWGVr3IBGMhnILevC4meLzWMy+pVeDP9ZNcP5FSetscMNFa7Dq51jrSDSGq9EeI//pZek74
	dBJmlwmKgPZIW9yB/5gyUbr+eGw==
X-Gm-Gg: ASbGnctst13Pvak4+iicyfpSrb1hO877lqTsKX9zhmbWmb3JQEexUqXyZtnwukJM5lp
	+zcvvuH1VGIMyhpUIrW46lGVR5naZMX26Q42szqKAw0D+lsOmiJFj//K5x2ATFQ1Nm1JctcWi91
	NokaZcaIta0YYI8n3Bp2kJas33uiy747aP
X-Google-Smtp-Source: AGHT+IHnQJnAJOQEMSSd/1luuQplj28d/GY8zfQPFU3tXpIWNxgzN+/gz90t45KAP2cvy+Q6w5uF6ZrP1RQlzanoit0=
X-Received: by 2002:a05:6000:2906:b0:399:71d4:a9 with SMTP id
 ffacd0b85a97d-39eaaed5709mr4945107f8f.52.1744458488551; Sat, 12 Apr 2025
 04:48:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402084646.10098-1-alex.vinarskis@gmail.com>
 <20250402084646.10098-4-alex.vinarskis@gmail.com> <2b9128be-1989-4511-995c-103c8ba71af7@oss.qualcomm.com>
In-Reply-To: <2b9128be-1989-4511-995c-103c8ba71af7@oss.qualcomm.com>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Sat, 12 Apr 2025 13:47:57 +0200
X-Gm-Features: ATxdqUEMqtWny3JCTyw-ZcclkJ_xcogEzUXpOJFPwPlDnSQgDmpwIqvKRTeN8kI
Message-ID: <CAMcHhXrBw6a7gSndG2F-JNgnNsYrDN3nTJjM+NjuT=s9FFWZkw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add support for X1-based Asus
 Zenbook A14
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	maud_spierings@hotmail.com, dmitry.baryshkov@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 12 Apr 2025 at 01:36, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/2/25 10:44 AM, Aleksandrs Vinarskis wrote:
> > Initial support for Asus Zenbook A14. Particular moddel exists
> > in X1-26-100, X1P-42-100 (UX3407QA) and X1E-78-100 (UX3407RA).
> >
> > Mostly similar to other X1-based laptops. Notable differences are:
> > * Wifi/Bluetooth combo being Qualcomm FastConnect 6900 on UX3407QA
> >   and Qualcomm FastConnect 7800 on UX3407RA
> > * USB Type-C retimers are Parade PS8833, appear to behave identical
> >   to Parade PS8830
> > * gpio90 is TZ protected
> >
> > Working:
> > * Keyboard
> > * Touchpad
> > * NVME
> > * Lid switch
> > * Camera LED
> > * eDP (FHD OLED, SDC420D) with brightness control
> > * Bluetooth, WiFi (WCN6855)
> > * USB Type-A port
> > * USB Type-C ports in USB2/USB3/DP (both orientations)
> > * aDSP/cDPS firmware loading, battery info
> > * Sleep/suspend, nothing visibly broken on resume
> >
> > Out of scope of this series:
> > * Audio (Speakers/microphones/headphone jack)
> > * Camera (OmniVision OV02C10)
> > * HDMI (Parade PS185HDM)
> > * EC
> >
> > Add dtsi and create two configurations for UX3407QA, UX3407RA.
> > Tested on UX3407QA with X1-26-100.
> >
> > Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> > ---
>
> [...]
>
> > +     /* Left-side display-adjacent port, PS8833 */
> > +     typec-mux@8 {
> > +             compatible = "parade,ps8830";
>
> What Krzysztof referred to with fallback compatible is this:
>
> diff --git a/Documentation/devicetree/bindings/usb/parade,ps8830.yaml b/Documentation/devicetree/bindings/usb/parade,ps8830.yaml
> index 935d57f5d26f..aeb33667818e 100644
> --- a/Documentation/devicetree/bindings/usb/parade,ps8830.yaml
> +++ b/Documentation/devicetree/bindings/usb/parade,ps8830.yaml
> @@ -11,8 +11,11 @@ maintainers:
>
>  properties:
>    compatible:
> -    enum:
> -      - parade,ps8830
> +    oneOf:
> +      - items:
> +          - const: parade,ps8833
> +          - const: parade,ps8830
> +      - const: parade,ps8830
>
>
> so that in case there are any sw changes down the line, people with older
> DT receive the fixes, as if "parade,ps8833" is attributed to a driver, it
> will match (due to being the primary entry) and if it's not (like today),
> it will fall back to matching the next compatible (and the driver currently
> looks for just that)
>

Hi,

Thanks, was not aware of that, found it in the examples now, will update.
As Krzysztof suggested to drop the patch adding compatible from
driver's code, If I understand correctly I also need the following dts
change, could you please confirm:

```
compatible = "parade,ps8833", "parade,ps8830";
```

> [...]
>
> > +     eusb6_repeater: redriver@4f {
> > +             compatible = "nxp,ptn3222";
> > +             reg = <0x4f>;
> > +             #phy-cells = <0>;
> > +
> > +             vdd3v3-supply = <&vreg_l13b_3p0>;
> > +             vdd1v8-supply = <&vreg_l4b_1p8>;
> > +
> > +             reset-gpios = <&tlmm 184 GPIO_ACTIVE_LOW>;
> > +
> > +             pinctrl-0 = <&eusb6_reset_n>;
> > +             pinctrl-names = "default";
> > +     };
> > +
> > +     /* EC */
>
> It's customary to leave the i2c address to make it slightly easier for
> the next tinkerer ;)

I am unsure about the address. There are multiple addresses showing up
when discovering the bus, 0x1d, 0x5b, 0x61, 0x6a. Did a quick SMBUS
analysis, they all have non-zero registers responding... My best guess
right now is its 0x5b, as messing with it enabled backlight and broke
the keyboard. Will add that one.

>
> [...]
>
> > +&uart14 {
> > +     status = "okay";
> > +
> > +     bluetooth {
> > +             compatible = "qcom,wcn7850-bt";
> > +             pinctrl-names = "default";
> > +             pinctrl-0 = <&bt_en_default>;
> > +             enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
> > +             max-speed = <3000000>;
>
> You'll need to provide some supplies, coming out of a pwrseq device, see
> e.g. the QCP
>

I assume you are referring to change like this [1]. There were some
discussions on whether the supplies are modelled correctly as it seems
to be different when using m.2 card, so as I was not sure about this
platform I did not add it. At least in the variant that I have, the
wcn6855 is soldered onboard, so I would assume so is the wcn7850
variant.
It seems that the two use quite different supplies - are the platform
dependent, or only wlan card dependent? Ie. Can I just copy pwrseq for
wcn6855 from a different platform?

For  wcn7850's pwrseq, I can add similarly to other platforms, but
cannot verify it. Should I still add it in this case?

A bit unrelated question: in the meantime I managed to bring-up the
sound on Zenbook as well. Would it be more correct to wait for this
series to land, and then send it separately, or is it okay to add it
in directly on re-spin?

Thank you,
Alex

https://lore.kernel.org/all/20250331204610.526672-2-alex.vinarskis@gmail.com/

> Konrad

