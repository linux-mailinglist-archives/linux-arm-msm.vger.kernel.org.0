Return-Path: <linux-arm-msm+bounces-41918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3408D9F06F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 09:52:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1C53281738
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 08:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE6F51ABEC7;
	Fri, 13 Dec 2024 08:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S+ypCjP1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222D16BFCA;
	Fri, 13 Dec 2024 08:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734079936; cv=none; b=oGz4Iq1a8r0gbfG74c2E9IcxqaO0lkXmklZIvvUiHqlZxvtAqKxmgpqgFEFQAH+9X2tUbwz4R4TthGw/8G97AxmRNODA3kENJL8B7CclQXjD9+2JauXwkqstW/0D8dHTXG7csr2caAbCVvP46R8/2axiYplsr/QWqQsRr7KVTww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734079936; c=relaxed/simple;
	bh=x+S1D42xfrFTvqeN38XHm9k95uZ3dbG+TC9Z709e18s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sd95sl2fszchmztBz2pzEPJ6EgFhC2Y8I5kla4eCzdCN9uXm+/ZmuXmHY6794T8XO7ezpkH8yINnsIk1LFNIo8aqcdsZBwPs54H20XfLSmATBiKMyVm+iP46t+DTTijweksQJSb88YoLBki2JD/QkaN9dRYAwdxFAoVBPMAOtvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S+ypCjP1; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21644e6140cso13787285ad.1;
        Fri, 13 Dec 2024 00:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734079934; x=1734684734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Di60ANYuQ+OHKdfnQPlL2z3aKZPcVQeaI8rme9wyQpY=;
        b=S+ypCjP1oBvcFbjNDOo5NcMwT4XCGCorwAqtsGd224K3AK+2NXv4IzLvKSs2SdgJUm
         jM3nf5w1D7vGBkET/n19k84WQrSRXDRfxCp7tFmBj1mpBurBix9NFxlfLpBE+e6gMjwJ
         Oq+vUD5ggj69bxIc6ZXuRwYdru17fG5I9pr+9Anj+ilJ3mZOqUG+axDk/9JM8pSl1UvF
         hJP3QFZDlmDFKySKyseGDoMX4coCPTfZpkz/zvvu62jIh8HeuQpeL5/CIBDxUqhQkq0J
         HEtMAZ8/7qFh4PtZSzoP/fBMjEYow6fA9y6S9Qlf+N1DHFEa/mArtPXw63L5MeZYzxsv
         qiDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734079934; x=1734684734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Di60ANYuQ+OHKdfnQPlL2z3aKZPcVQeaI8rme9wyQpY=;
        b=IfcPQWHh7spy3vNpL8E8M7uahWU0PUmncohUCIwph4pAYtfMTGkcnpnTIyHYoGBXnh
         9x0XU04OOCAmkDfoHE7Tdepfg/FlajP8DkQ7mrL/YgqIEVw2FatCzuvXlMkkLM8svzoY
         zRURc/Q8NCDKSKOWTdOyiCqC6JatRTuzrxo59syxo1JYx3bWsslJnSacz9xX1rGfWJVe
         4CtT4xpdL9+QOXMU2njexQ9Bw6zCmPRvLo8jcn1dhy48TudQn55lItb6+i8aov8tpl68
         PXW3YkwGErCq6USsfki6czpq7yejhpX7TijiEIiURwzRG4+jQ++/qkdi2mdD7LpITT8S
         WF8g==
X-Forwarded-Encrypted: i=1; AJvYcCVRI+Ies3plJt64detibMYGZ1W7t2jdiuLARMUPc9/ZF/4wNRJBxomNtjUbiXOd+5yL5M1pDp4rPXJ5@vger.kernel.org, AJvYcCVxH7C1PaoHTanVJeKKcz3dsLR10tivLG6C+p2Ee+y4w4iTcRPDwJkbZ/3Tm6nNkkEzAOUlyB5AIFpWUV3dAw==@vger.kernel.org, AJvYcCXJYIN+AdcBTWonslEbxIyHtF2157211UQF6r9NKk+buzvxoJKlunVnWw1kL1P8w7JOGmnIBEHGe10KGKQF@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0ZKxS48smSVLot55+lkJcJiXazMfk6ZSNzjfWbkzMIqYnqAkJ
	lKLX5h0tOdSKN02MSBzp7ZA+1BbBYVtcaZ458s3o6O7VvJQHD/TJMW+GapzA/uMNFQ==
X-Gm-Gg: ASbGncsM5vBb6cLbRVGWew1c8/a1xaXyuqLxHL7mj5om4Yfa0fcPLMOnT/AUIlJFgmE
	nSfFGifIwCt1jXplEPNE/EUQzPbGN+6guHNGtR63wYJHsqToqk/zT9AKRlkqfO9MJvTNLZcW4Aq
	5kwqlo1vaSswcArbfRevLYWwihAZPWjWoU4EA54c8qCFPsOgW4qi19hoi1IX8KMvsSE13aaTHc/
	G25HHOvq7dfc3iMpOkKgxH/d0VimnXRTngXrMw3doI/owVNJUpBfCw=
X-Google-Smtp-Source: AGHT+IHmkegrGXeRS0WkP296Xw7JLlmqarkJbj6Qa/9UHfGKue1ocBmfh5AA+6lx0PZf+QkdJ5AXrA==
X-Received: by 2002:a17:902:ce8c:b0:216:644f:bc0e with SMTP id d9443c01a7336-21892a45a64mr31101885ad.24.1734079934340;
        Fri, 13 Dec 2024 00:52:14 -0800 (PST)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8f26ff2sm135239135ad.227.2024.12.13.00.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 00:52:13 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org,
	chenxuecong2009@outlook.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	gty0622@gmail.com,
	johan+linaro@kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mitltlatltl@gmail.com,
	robh@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc8280xp: Add Huawei Matebook E Go (sc8280xp)
Date: Fri, 13 Dec 2024 16:50:46 +0800
Message-ID: <20241213085100.564547-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <d5813d64-0cb2-4a87-9d98-cebbfd45a8c0@oss.qualcomm.com>
References: <d5813d64-0cb2-4a87-9d98-cebbfd45a8c0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Oh, I sent it by gamil wrongly(forgot cc to), I resend it by git send-email again

On Fri, Dec 13, 2024 at 1:13 AM Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> On 11.12.2024 4:37 PM, Pengyu Luo wrote:
> > Add an initial devicetree for the Huawei Matebook E Go, which is based on
> > sc8280xp.
> >
> > There are 3 variants, Huawei released first 2 at the same time.
> > Huawei Matebook E Go LTE(sc8180x), codename should be gaokun2.
> > Huawei Matebook E Go(sc8280xp@3.0GHz), codename is gaokun3.
> > Huawei Matebook E Go 2023(sc8280xp@2.69GHz).
> >
> > We add support for the latter two variants.
> >
> > This work started by Tianyu Gao and Xuecong Chen, they made the
> > devicetree based on existing work(i.e. the Lenovo X13s and the
> > Qualcomm CRD), it can boot with framebuffer.
> >
> > Original work:
> https://github.com/matalama80td3l/matebook-e-go-boot-works/blob/main/dts/sc8280xp-huawei-matebook-e-go.dts
> >
> > Later, I got my device, I continue their work.
> >
> > Supported features:
> > - adsp
> > - bluetooth (connect issue)
> > - charge (with a lower power)
> > - framebuffer
> > - gpu
> > - keyboard (via internal USB)
> > - pcie devices (wifi and nvme, no modem)
> > - speakers and microphones
> > - tablet mode switch
> > - touchscreen
> > - usb
> > - volume key and power key
> >
> > Some key features not supported yet:
> > - battery and charger information report (EC driver required)
> > - built-in display (cannot enable backlight yet)
> > - charging thresholds control (EC driver required)
> > - camera
> > - LID switch detection (EC driver required)
> > - USB Type-C altmode (EC driver required)
> > - USB Type-C PD (EC driver required)
>
> Does qcom_battmgr / pmic_glink not work?
>

Unfortunately, different from many sc8280xp devices, device(PMGK) _STA is
Zero,
this device is quiet strange, also, it has no PM8008,
nor PMIC Battery Miniclass(PMBM), etc.

[...]

>
> > I have finished the EC driver, once this series are upstreamed,
> > I will submit a series of patches to enable EC support.
> >
> > Signed-off-by: Tianyu Gao <gty0622@gmail.com>
> > Signed-off-by: Xuecong Chen <chenxuecong2009@outlook.com>
>
> Your commit message suggests Co-developed-by: tags would also be
> fitting here
>

Agree

[...]

> [...]
>
> > +     chosen {
> > +             #address-cells =3D <2>;
> > +             #size-cells =3D <2>;
> > +             ranges;
> > +
> > +             framebuffer0: framebuffer@c6200000 {
> > +                     compatible =3D "simple-framebuffer";
> > +                     reg =3D <0x0 0xC6200000 0x0 0x02400000>;
> > +                     width =3D <1600>;
> > +                     height =3D <2560>;
> > +                     stride =3D <(1600 * 4)>;
> > +                     format =3D "a8r8g8b8";
> > +             };
> > +     };
>
> This should be redundant, as you should have efifb
>

I think no, it won't boot up without it(stuck at EFI stub: Booting Linux
Kernel)

[...]

>
> > +
> > +     wcd938x: audio-codec {
> > +             compatible =3D "qcom,wcd9380-codec";
> > +
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&wcd_default>;
>
> Please follow this order throughout the file:
>
> property-n
> property-names
>

Do you mean I should arragne as following? If so, I actually keep
reference devicetree untouched. x13s and crd are written like this.

pinctrl-0 =3D <&wcd_default>>;
pinctrl-names =3D "default";

[...]

> [...]
>
> > +
> > +             reset-gpios =3D <&tlmm 106 GPIO_ACTIVE_LOW>;
> > +
> > +             vdd-buck-supply =3D <&vreg_s10b>;
> > +             vdd-rxtx-supply =3D <&vreg_s10b>;
> > +             vdd-io-supply =3D <&vreg_s10b>;
> > +             vdd-mic-bias-supply =3D <&vreg_bob>;
> > +
> > +             qcom,micbias1-microvolt =3D <1800000>;
> > +             qcom,micbias2-microvolt =3D <1800000>;
> > +             qcom,micbias3-microvolt =3D <1800000>;
> > +             qcom,micbias4-microvolt =3D <1800000>;
> > +             qcom,mbhc-buttons-vthreshold-microvolt =3D <75000 150000
> 237000 500000 500000 500000 500000 500000>;
> > +             qcom,mbhc-headset-vthreshold-microvolt =3D <1700000>;
> > +             qcom,mbhc-headphone-vthreshold-microvolt =3D <50000>;
> > +             qcom,rx-device =3D <&wcd_rx>;
> > +             qcom,tx-device =3D <&wcd_tx>;
> > +
> > +             #sound-dai-cells =3D <1>;
> > +     };
> > +
> > +     gpio-keys {
> > +             compatible =3D "gpio-keys";
> > +
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&mode_pin_active>, <&vol_up_n>;
> > +
> > +             switch-mode {
> > +                     gpios =3D <&tlmm 26 GPIO_ACTIVE_HIGH>;
>
> This could use a label too - "Tablet Mode Switch", perhaps?
>

This part I follow Lenovo Yoga C630 one (see [1]), it doesn't use it,
and this node is not referenced.

> > +                     linux,input-type =3D <EV_SW>;
> > +                     linux,code =3D <SW_TABLET_MODE>;
> > +                     debounce-interval =3D <10>;
> > +                     wakeup-source;
> > +             };
> > +
> > +             key-vol-up {
>
> Please place this node above the switch-mode one to preserve alphabetical
> ordering (see [1])
> > +                     label =3D "Volume Up";
> > +                     gpios =3D <&pmc8280_1_gpios 6 GPIO_ACTIVE_LOW>;
> > +                     linux,code =3D <KEY_VOLUMEUP>;
> > +                     debounce-interval =3D <15>;
> > +                     linux,can-disable;
> > +                     wakeup-source;
> > +             };
> > +
>
> Stray newline
>
> [...]
>
> > +
> > +             /* s2c, s3c */
>
> Please remove such comments
>
>
Agree

[...]

>
> > +
> > +             /* /lib/firmware/ath11k/WCN6855/hw2.1/board-2.bin
> > +              * there is no calibrate data for huawei,
> > +              * but they have the same subsystem-device id
> > +              */
> > +             qcom,ath11k-calibration-variant =3D "LE_X13S";
>
> Oh, this can be taken care of! See [2], [3].
>

I have a glance, now I know we should extract something or it won't be
there.
Question is how can I extract them? I have a quick search, got no luck.
As for windows drivers, in the folder

bdwlan.e02
bdwlan.e07
bdwlan.e1d
bdwlan.e1e
bdwlan.e23
bdwlan.e26
bdwlan.e32
bdwlan.e47
bdwlan.e81
bdwlan.e84
bdwlan.e85
bdwlan.e8c
bdwlan.e8e
bdwlan.e9f
bdwlan.ea3
bdwlan.eb8
bdwlan.elf
bdwlan.elf.g
bdwlang.e8b
bdwlang.e9f
bdwlang.ea3
bdwlang.eb8
bdwlang.elf
Data20.msc
Data.msc
m320.bin
m3.bin
qcwlan8280.cat
qcwlan8280.inf
qcwlan8280.sys
regdb.bin
wlanfw20.mbn
wlanfw.mbn

[...]

> [...]
> > +
> > +&sound {
> > +     compatible =3D "qcom,sc8280xp-sndcard";
> > +     model =3D "SC8280XP-HUAWEI-MATEBOOKEGO";
> > +     audio-routing =3D
> > +             "SpkrLeft IN", "WSA_SPK1 OUT",
>
> Please remove the line break and
>
> > +             "SpkrRight IN", "WSA_SPK2 OUT",
> > +             "IN1_HPHL", "HPHL_OUT",
> > +             "IN2_HPHR", "HPHR_OUT",
> > +             "AMIC2", "MIC BIAS2",
> > +             "VA DMIC0", "MIC BIAS1",
> > +             "VA DMIC1", "MIC BIAS1",
> > +             "VA DMIC2", "MIC BIAS3",
> > +             "VA DMIC0", "VA MIC BIAS1",
> > +             "VA DMIC1", "VA MIC BIAS1",
> > +             "VA DMIC2", "VA MIC BIAS3",
> > +             "TX SWR_ADC1", "ADC2_OUTPUT";
> > +
> > +     wcd-playback-dai-link {
> > +             link-name =3D "WCD Playback";
> > +             cpu {
>
> Please insert a newline between the last property and subnodes.
>

Agree, but I didn't touch them, they are from x13s and crd (see [2])

> Otherwise looks fairly good!
>
> Konrad
>
> [1] https://docs.kernel.org/devicetree/bindings/dts-coding-style.html
> [2] https://lore.kernel.org/ath11k/ZwR1hu-B0bGe4zG7@localhost.localdomain/
> [3] https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware

Thanks,
Pengyu

[1] https://elixir.bootlin.com/linux/v6.12.4/source/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts#L54
[2] https://elixir.bootlin.com/linux/v6.12.4/source/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts#L1125

