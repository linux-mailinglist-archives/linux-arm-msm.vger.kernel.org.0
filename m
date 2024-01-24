Return-Path: <linux-arm-msm+bounces-8045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1A6839E5F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 02:44:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67A3D1C23297
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 01:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E71951396;
	Wed, 24 Jan 2024 01:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oiMFEWuC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026FE1381
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 01:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706060653; cv=none; b=X/WJtDgq4SlaPQl3KMG668f4um/MkxKi7iAmfoOw87CXAhBv+UEY/ulyuXEeatV48ay6CdRh0nTeqW4cg0qwY+5Gp8moipXXjy2EYPc5KNz1cub39sdWgUcH65fYs2ZmlY0A0OFHTX5IRKcSLMWbCMK7nyeSfrREH/VzRO10u6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706060653; c=relaxed/simple;
	bh=iL/UCl34gXV8cPmzN0AbfQqu0mpwcIfNM3iDwH9Z8BU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cOu5ptPEdpiRdXE2TVjGoECffY0dGEVlQ7xM3n0lwZ82ucamFPR26FrMWjVuoouOcDnuKoQ1FcdnHMN5mCSGkkbph3gJ3m4AzNpb92OSiptDir0PSbPzumN8jLWmENkXJcXqTOF6sYEn0iu7eUCLGgcFSdRVnYJdg+9ZpnkxmEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oiMFEWuC; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dbe344a6cf4so4411670276.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 17:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706060651; x=1706665451; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+EJ9ZUznar9sJ684CFkqKMAG0mvXQb80PSMhKIErrW0=;
        b=oiMFEWuCjTX9SEjYRz6xIG2F3tWd0ksb4rWPS+CbNY36xvRCkj4SP3/vxy41qgrqRj
         TPgxCQzssLWFNCZIJKEgUMGBmqmpRW/QvjdJlV0QN758PynW//LI3DiINhHQZL6ql1Xb
         OYuSKVuFvhRUhONPa5ld+SbRqHvLqQKndKv9muIXo2DCvfoZuuGi5E1zDBcAwA2x8819
         7B9/6/oBTt3iMkzBZsR3zJq8yoi/MyAhiJHUVIvMaPRnlqJ+4st2j+5SpjrhICn3s0bw
         5NW8otymBqLgVbG8x1vL2epvsxRaoDDswHoFO3XYID4IzuVdU7djTbsBuNUd6+A16ot3
         zM/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706060651; x=1706665451;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+EJ9ZUznar9sJ684CFkqKMAG0mvXQb80PSMhKIErrW0=;
        b=KZJg01M6Um5j7bpP4GCaR1MOZ1zJNXzyAbSGfqjk1RULrBfGRAdnLDUj5o5dE58xqo
         OxEWrTHsDFwaLkNM3z+EeTIAN3BJtA2DhXT3ueJnh+YeIUrjw0Ybon5n7vnWK0W0yBOF
         9zRp70zchTcr8SMolG1WW3TIvx1u0yNvu96q03kPj4LyJhQGNIKS+7aOW+iT5oZ6hi/F
         1VQrmGxwPqCkt232WtbOpde6HuOW7YKTvRNxIw763IxXVFJNkJyHHJP3vD5c/NvCE5ZU
         4yUiaQ59YMIOaDQ4ns9OFh1J5ZxrR68RKU9cLteuU7EpHrhnCZkMvmTZl+i6P+kiryTt
         F8cg==
X-Gm-Message-State: AOJu0YwnH58dCRFagduxtBW8z2Y9LL0ipecRQFaIDrV8vXXeym//rR8X
	CkxrUmLJ6Vra2La3iZGmcvozSACbewPu8+kHvG4Eft4KjGpoFPlPzQWm2isUDDF7r96jwG883/q
	zujMMq/C3hnJp5vRLbF/EpJqdvZgqg/Xwx+LjTA==
X-Google-Smtp-Source: AGHT+IFdFd9XSV1qb3fXFDQRWsSosCJLwTufWRBJrP7gZM8W3AYbECne9ER587NBXf7shK6NbzG7fh2hdunuhmE/fRg=
X-Received: by 2002:a25:ac03:0:b0:dc2:3d03:bce8 with SMTP id
 w3-20020a25ac03000000b00dc23d03bce8mr86878ybi.127.1706060650705; Tue, 23 Jan
 2024 17:44:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org> <CYMDMMXUICGY.21UIRWVXMLART@fairphone.com>
In-Reply-To: <CYMDMMXUICGY.21UIRWVXMLART@fairphone.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 24 Jan 2024 03:43:59 +0200
Message-ID: <CAA8EJpq3ex7m1ZdV9DeRC+jN9=+RCZ4D_ue3C6ijwdkT9r433g@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] usb: typec: qcom-pmic-typec: enable support for
 PMI632 PMIC
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Jan 2024 at 22:43, Luca Weiss <luca.weiss@fairphone.com> wrote:
>
> On Sat Jan 13, 2024 at 9:55 PM CET, Dmitry Baryshkov wrote:
> > The Qualcomm PMI632 PMIC (found on Qualcomm Robotics RB2 platform)
> > doesn't support USB Power Delivery. However this PMIC still supports
> > handling of the Type-C port (orientation detection, etc). Reuse exiting
> > qcom-pmic-typec driver to support Type-C related functionality of this
> > PMIC. Use this to enable USB-C connector support on the RB2 platform.
>
> Hi Dmitry,
>
> I'm happy to report that testing this series on v6.8-rc1 kernel on
> sdm632-fairphone-fp3 shows that USB role switching is working with this!
>
> It's not extensive testing but plugging in a USB stick and USB headphone
> jack dongle in both directions show up in dmesg as expected, and
> afterwards also USB networking gadget still works to ssh into the
> device.
>
> My .dts part is a bit different to your RB2 dts since
> sdm632-fairphone-fp3 doesn't support USB 3.0, only USB 2.0, but
> otherwise looks pretty similar. I'll send a patch for that once your
> series has landed.
>
> Not sure on which patches it makes sense, but have my:
>
> Tested-by: Luca Weiss <luca.weiss@fairphone.com> # sdm632-fairphone-fp3

Probably this makes sense on pmi632 patches, as you definitely tested
only those and not RB2 ones.

>
> And for reference:
>
> Only thing I've noticed here is "Host supports USB 3.0 SuperSpeed" which
> is half true, to my knowledge SDM632 does support USB 3.0 but it's not
> hooked up (for some reason) on most MSM8953/SDM632-based devices.

I suppose it is the same story as SDM660. The SoC supports USB 3.0,
but device manufacturers at that time didn't care for the sake of
making them cheaper. So development kits had USB 3.0 (e.g. IFC6560),
but the actual phones didn't.

>
> [   22.986096] xhci-hcd xhci-hcd.1.auto: xHCI Host Controller
> [   22.986273] xhci-hcd xhci-hcd.1.auto: new USB bus registered, assigned bus number 1
> [   22.990847] xhci-hcd xhci-hcd.1.auto: hcc params 0x0230f665 hci version 0x100 quirks 0x0000000002000010
> [   22.998260] xhci-hcd xhci-hcd.1.auto: irq 57, io mem 0x07000000
> [   23.007684] xhci-hcd xhci-hcd.1.auto: xHCI Host Controller
> [   23.013435] xhci-hcd xhci-hcd.1.auto: new USB bus registered, assigned bus number 2
> [   23.019029] xhci-hcd xhci-hcd.1.auto: Host supports USB 3.0 SuperSpeed
> [   23.027696] hub 1-0:1.0: USB hub found
> [   23.033167] hub 1-0:1.0: 1 port detected
> [   23.037538] usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
> [   23.041853] hub 2-0:1.0: USB hub found
> [   23.049034] hub 2-0:1.0: 1 port detected
> [   23.120301] qcom,pmic-typec 200f000.spmi:pmic@2:typec@1500: vbus vsafe5v fail
> [   23.845537] usb 1-1: new high-speed USB device number 2 using xhci-hcd
> [   23.995466] usb-storage 1-1:1.0: USB Mass Storage device detected
> [   23.996166] scsi host0: usb-storage 1-1:1.0
> [   25.022547] scsi 0:0:0:0: Direct-Access     SanDisk  Ultra            1.00 PQ: 0 ANSI: 6
> [   25.023926] sd 0:0:0:0: [sda] 60062500 512-byte logical blocks: (30.8 GB/28.6 GiB)
> [   25.030873] sd 0:0:0:0: [sda] Write Protect is off
> [   25.037204] sd 0:0:0:0: [sda] Mode Sense: 43 00 00 00
> [   25.042395] sd 0:0:0:0: [sda] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
> [   25.070314]  sda: sda1 sda2 sda3
> [   25.071050] sd 0:0:0:0: [sda] Attached SCSI removable disk
>
>
> [   31.347094] usb 1-1: USB disconnect, device number 2
> [   31.364973] xhci-hcd xhci-hcd.1.auto: remove, state 4
> [   31.365149] usb usb2: USB disconnect, device number 1
> [   31.370427] xhci-hcd xhci-hcd.1.auto: USB bus 2 deregistered
> [   31.374236] xhci-hcd xhci-hcd.1.auto: remove, state 1
> [   31.379906] usb usb1: USB disconnect, device number 1
> [   31.475790] xhci-hcd xhci-hcd.1.auto: USB bus 1 deregistered
>
> Regards
> Luca
>
>
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Changes in v2:
> > - Split qcom_pmic_typec_pdphy_set_roles() changes to separate patch
> >   (Konrad)
> > - Simplified devm_kzalloc / sizeof() argument (Konrad)
> > - Made start / stop callbacks mandatory (Bryan)
> > - Reworked Type-C port handling into a backend similar to PD PHY (Bryan)
> > - Made more qcom-pmic-typec data static const (Bryan)
> > - Squashed usbc PHY single-lane removal patch (Konrad)
> > - Further usbc PHY cleanup (Konrad)
> > - Fixed order of DT properties in pmi632.dtsi (Konrad)
> > - Instead of specifying bogus PDOs for the port, specify pd-disable and
> >   typec-power-opmode properties for the connector
> > - Moved orientation-switch / usb-dual-role properties to sm6115.dtsi
> >   (Konrad)
> > - Linked usb_dwc3_ss and usb_qmpphy_usb_ss_in
> > - Link to v1: https://lore.kernel.org/r/20240113-pmi632-typec-v1-0-de7dfd459353@linaro.org
> >
> > ---
> > Dmitry Baryshkov (14):
> >       dt-bindings: regulator: qcom,usb-vbus-regulator: add support for PMI632
> >       dt-bindings: usb: qcom,pmic-typec: add support for the PMI632 block
> >       dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: split from sc8280xp PHY schema
> >       dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: support USB-C data
> >       usb: typec: tcpm: fix the PD disabled case
> >       usb: typec: qcom-pmic-typec: fix arguments of qcom_pmic_typec_pdphy_set_roles
> >       usb: typec: qcom-pmic-typec: allow different implementations for the PD PHY
> >       usb: typec: qcom-pmic-typec: allow different implementations for the port backend
> >       usb: typec: qcom-pmic-typec: add support for PMI632 PMIC
> >       phy: qcom: qmp-usb: split USB-C PHY driver
> >       phy: qcom: qmp-usb: drop dual-lane handling
> >       phy: qcom: qmp-usbc: add support for the Type-C handling
> >       arm64: dts: qcom: pmi632: define USB-C related blocks
> >       arm64: dts: qcom: qrb4210-rb2: enable USB-C port handling
> >
> > Vladimir Zapolskiy (1):
> >       arm64: dts: qcom: sm6115: drop pipe clock selection
> >
> >  .../bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml    |  171 +++
> >  .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml        |   22 -
> >  .../regulator/qcom,usb-vbus-regulator.yaml         |    9 +-
> >  .../devicetree/bindings/usb/qcom,pmic-typec.yaml   |   28 +-
> >  arch/arm64/boot/dts/qcom/pmi632.dtsi               |   30 +
> >  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts           |   50 +-
> >  arch/arm64/boot/dts/qcom/sm6115.dtsi               |   44 +-
> >  drivers/phy/qualcomm/Makefile                      |    2 +-
> >  drivers/phy/qualcomm/phy-qcom-qmp-usb.c            |  323 +-----
> >  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c           | 1169 ++++++++++++++++++++
> >  drivers/usb/typec/tcpm/qcom/Makefile               |    3 +-
> >  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c      |  254 +----
> >  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.h      |   27 +
> >  .../usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c    |  157 ++-
> >  .../usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.h    |   94 +-
> >  .../typec/tcpm/qcom/qcom_pmic_typec_pdphy_stub.c   |   80 ++
> >  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c |  290 ++++-
> >  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.h |  172 +--
> >  drivers/usb/typec/tcpm/tcpm.c                      |    3 +-
> >  19 files changed, 2058 insertions(+), 870 deletions(-)
> > ---
> > base-commit: 9e21984d62c56a0f6d1fc6f76b646212cfd7fe88
> > change-id: 20240112-pmi632-typec-4c7533092387
> >
> > Best regards,
>


-- 
With best wishes
Dmitry

