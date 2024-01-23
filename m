Return-Path: <linux-arm-msm+bounces-8037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC63839A72
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 21:43:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FA7D1C279C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 20:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6261346B3;
	Tue, 23 Jan 2024 20:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="BerJpIr9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620A4610E
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 20:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706042607; cv=none; b=Ix1Yb0DM5P+R6wSQ3KNIpmqORoVQyCFFJskV3Rh0iAuw3niytVLDsafB94g8YDyY/j7iA6+At3ufQdHxzmW0QlwDw2Dxnx1lriea5TBiccw8YfoLGGUC7xCXbbXYWy1tqyTTw0RKTfOs50NYURXbofGU9woy77iE6REK/4cuhFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706042607; c=relaxed/simple;
	bh=8zLb3neS6Jp/AkbUTNX1TpH766GVQBf7lcwO9rCjoBc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=WyG21ckmtSCkGmPHPh5Jj4BwutSxLsmQhie8SBrmZUUcPFEI7XEnG5P3ugMOkjF5yRaw1yTmkcGhMhqlZ310j3PNRw1xcmtTsvE8oWzVWznR4FOZjlOrpo9WSeT7qrbfNDdOmpqfHhsM3qE08kWj54IgdQv51hEBtlboLJ56zuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=BerJpIr9; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50e7abe4be4so6490041e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 12:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1706042603; x=1706647403; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NMSor2++UrWhWLE+cIF0EC+iv6dUmbHHRQ/GWZRHrpE=;
        b=BerJpIr921pS77kpFdigTv24vAL9gpNUefKRSOEo7u8kZVjudXVrSX1rfZFrExDJtH
         5u82bp/ReLPKVK/1cFpbQx8StMmzrcLq8b8HbEDKjv0ykjgr0tbj6FsTPcxKr0gEKfT9
         MA8YJuT7R6GbUo66EIa0sMFDgTTyauOmwjvIMa4xxX5XY2VQVlby6EvGAIJU//xhsPQ9
         8t9jYUMz+8cZ86nDHmoc2cYbbeUhzzczB9hZ7qA41yqtd5vAsq+iPAXIuEIOY2PIs97t
         HQrsnGEQhooFMVvWfGAH+w7VU0vuPzRAajuPn25WM7IbRzpl6H4o6XraFYov47Dli/BW
         q4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706042603; x=1706647403;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NMSor2++UrWhWLE+cIF0EC+iv6dUmbHHRQ/GWZRHrpE=;
        b=Jd+jnpAQGADW1i79SlUMAW/p/R4BGozp6J/C/yIQCRD+s8ICCqGTQBIz/JwpPi3HLB
         0XG9tHr8471Cfhkw05p6sjlU5adiKCTlNrW5L5/Vpy0T0uwjH3jVZWWWqglnkWkheoW7
         QEKQdsGnnqAFO7QzaIB17++mtVkCS59JajVyQ9xYa4PRzhPnrQpqapMs+HQ927QmSwGc
         4/MxhBl8DS7lS2h2Xyljo67gOo9kSx90Pgit3UGMd0WI6j1VzGao7NWh9ySD37nlLoRY
         +me8+xSc/3P01l/X0VT7mZBtfU9ZYEePfLQrNYCzOTH5/EnG+qSv+UlbM1ZIeqb/asxb
         Etfw==
X-Gm-Message-State: AOJu0Yx0X6eirJ4baUl/vcqUnREutGwbjx5yFcv/c2LbGtm6vpj7oAS9
	99OJJSHx/o6Pmis0kTrKy7+3bzLugdM1TUNdSi2vDNtsR1HhfdXKmnjf/9FNejI=
X-Google-Smtp-Source: AGHT+IEynibo4PgeAij/DM9j4I9iRxSq3WbKkq9FXriiAtlBZCHQna1z27SSGVHIa03u7+oQUhY0FA==
X-Received: by 2002:a05:6512:12d5:b0:50f:1c90:d3d5 with SMTP id p21-20020a05651212d500b0050f1c90d3d5mr3882137lfg.24.1706042603327;
        Tue, 23 Jan 2024 12:43:23 -0800 (PST)
Received: from localhost (mobiledyn-62-240-134-198.mrsn.at. [62.240.134.198])
        by smtp.gmail.com with ESMTPSA id vg10-20020a170907d30a00b00a3109a492d4sm115755ejc.20.2024.01.23.12.43.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 12:43:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Jan 2024 21:43:20 +0100
Message-Id: <CYMDMMXUICGY.21UIRWVXMLART@fairphone.com>
Subject: Re: [PATCH v2 00/15] usb: typec: qcom-pmic-typec: enable support
 for PMI632 PMIC
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konrad.dybcio@linaro.org>, "Liam
 Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Wesley Cheng" <quic_wcheng@quicinc.com>, "Bryan O'Donoghue"
 <bryan.odonoghue@linaro.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Vinod Koul" <vkoul@kernel.org>, "Kishon
 Vijay Abraham I" <kishon@kernel.org>, "Guenter Roeck" <linux@roeck-us.net>,
 "Heikki Krogerus" <heikki.krogerus@linux.intel.com>, "Philipp Zabel"
 <p.zabel@pengutronix.de>
Cc: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-usb@vger.kernel.org>, <linux-phy@lists.infradead.org>, "Vladimir
 Zapolskiy" <vladimir.zapolskiy@linaro.org>
X-Mailer: aerc 0.15.2
References: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
In-Reply-To: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>

On Sat Jan 13, 2024 at 9:55 PM CET, Dmitry Baryshkov wrote:
> The Qualcomm PMI632 PMIC (found on Qualcomm Robotics RB2 platform)
> doesn't support USB Power Delivery. However this PMIC still supports
> handling of the Type-C port (orientation detection, etc). Reuse exiting
> qcom-pmic-typec driver to support Type-C related functionality of this
> PMIC. Use this to enable USB-C connector support on the RB2 platform.

Hi Dmitry,

I'm happy to report that testing this series on v6.8-rc1 kernel on
sdm632-fairphone-fp3 shows that USB role switching is working with this!

It's not extensive testing but plugging in a USB stick and USB headphone
jack dongle in both directions show up in dmesg as expected, and
afterwards also USB networking gadget still works to ssh into the
device.

My .dts part is a bit different to your RB2 dts since
sdm632-fairphone-fp3 doesn't support USB 3.0, only USB 2.0, but
otherwise looks pretty similar. I'll send a patch for that once your
series has landed.

Not sure on which patches it makes sense, but have my:

Tested-by: Luca Weiss <luca.weiss@fairphone.com> # sdm632-fairphone-fp3

And for reference:

Only thing I've noticed here is "Host supports USB 3.0 SuperSpeed" which
is half true, to my knowledge SDM632 does support USB 3.0 but it's not
hooked up (for some reason) on most MSM8953/SDM632-based devices.

[   22.986096] xhci-hcd xhci-hcd.1.auto: xHCI Host Controller
[   22.986273] xhci-hcd xhci-hcd.1.auto: new USB bus registered, assigned b=
us number 1
[   22.990847] xhci-hcd xhci-hcd.1.auto: hcc params 0x0230f665 hci version =
0x100 quirks 0x0000000002000010
[   22.998260] xhci-hcd xhci-hcd.1.auto: irq 57, io mem 0x07000000
[   23.007684] xhci-hcd xhci-hcd.1.auto: xHCI Host Controller
[   23.013435] xhci-hcd xhci-hcd.1.auto: new USB bus registered, assigned b=
us number 2
[   23.019029] xhci-hcd xhci-hcd.1.auto: Host supports USB 3.0 SuperSpeed
[   23.027696] hub 1-0:1.0: USB hub found
[   23.033167] hub 1-0:1.0: 1 port detected
[   23.037538] usb usb2: We don't know the algorithms for LPM for this host=
, disabling LPM.
[   23.041853] hub 2-0:1.0: USB hub found
[   23.049034] hub 2-0:1.0: 1 port detected
[   23.120301] qcom,pmic-typec 200f000.spmi:pmic@2:typec@1500: vbus vsafe5v=
 fail
[   23.845537] usb 1-1: new high-speed USB device number 2 using xhci-hcd
[   23.995466] usb-storage 1-1:1.0: USB Mass Storage device detected
[   23.996166] scsi host0: usb-storage 1-1:1.0
[   25.022547] scsi 0:0:0:0: Direct-Access     SanDisk  Ultra            1.=
00 PQ: 0 ANSI: 6
[   25.023926] sd 0:0:0:0: [sda] 60062500 512-byte logical blocks: (30.8 GB=
/28.6 GiB)
[   25.030873] sd 0:0:0:0: [sda] Write Protect is off
[   25.037204] sd 0:0:0:0: [sda] Mode Sense: 43 00 00 00
[   25.042395] sd 0:0:0:0: [sda] Write cache: disabled, read cache: enabled=
, doesn't support DPO or FUA
[   25.070314]  sda: sda1 sda2 sda3
[   25.071050] sd 0:0:0:0: [sda] Attached SCSI removable disk


[   31.347094] usb 1-1: USB disconnect, device number 2
[   31.364973] xhci-hcd xhci-hcd.1.auto: remove, state 4
[   31.365149] usb usb2: USB disconnect, device number 1
[   31.370427] xhci-hcd xhci-hcd.1.auto: USB bus 2 deregistered
[   31.374236] xhci-hcd xhci-hcd.1.auto: remove, state 1
[   31.379906] usb usb1: USB disconnect, device number 1
[   31.475790] xhci-hcd xhci-hcd.1.auto: USB bus 1 deregistered

Regards
Luca


>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v2:
> - Split qcom_pmic_typec_pdphy_set_roles() changes to separate patch
>   (Konrad)
> - Simplified devm_kzalloc / sizeof() argument (Konrad)
> - Made start / stop callbacks mandatory (Bryan)
> - Reworked Type-C port handling into a backend similar to PD PHY (Bryan)
> - Made more qcom-pmic-typec data static const (Bryan)
> - Squashed usbc PHY single-lane removal patch (Konrad)
> - Further usbc PHY cleanup (Konrad)
> - Fixed order of DT properties in pmi632.dtsi (Konrad)
> - Instead of specifying bogus PDOs for the port, specify pd-disable and
>   typec-power-opmode properties for the connector
> - Moved orientation-switch / usb-dual-role properties to sm6115.dtsi
>   (Konrad)
> - Linked usb_dwc3_ss and usb_qmpphy_usb_ss_in
> - Link to v1: https://lore.kernel.org/r/20240113-pmi632-typec-v1-0-de7dfd=
459353@linaro.org
>
> ---
> Dmitry Baryshkov (14):
>       dt-bindings: regulator: qcom,usb-vbus-regulator: add support for PM=
I632
>       dt-bindings: usb: qcom,pmic-typec: add support for the PMI632 block
>       dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: split from sc8280xp PH=
Y schema
>       dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: support USB-C data
>       usb: typec: tcpm: fix the PD disabled case
>       usb: typec: qcom-pmic-typec: fix arguments of qcom_pmic_typec_pdphy=
_set_roles
>       usb: typec: qcom-pmic-typec: allow different implementations for th=
e PD PHY
>       usb: typec: qcom-pmic-typec: allow different implementations for th=
e port backend
>       usb: typec: qcom-pmic-typec: add support for PMI632 PMIC
>       phy: qcom: qmp-usb: split USB-C PHY driver
>       phy: qcom: qmp-usb: drop dual-lane handling
>       phy: qcom: qmp-usbc: add support for the Type-C handling
>       arm64: dts: qcom: pmi632: define USB-C related blocks
>       arm64: dts: qcom: qrb4210-rb2: enable USB-C port handling
>
> Vladimir Zapolskiy (1):
>       arm64: dts: qcom: sm6115: drop pipe clock selection
>
>  .../bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml    |  171 +++
>  .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml        |   22 -
>  .../regulator/qcom,usb-vbus-regulator.yaml         |    9 +-
>  .../devicetree/bindings/usb/qcom,pmic-typec.yaml   |   28 +-
>  arch/arm64/boot/dts/qcom/pmi632.dtsi               |   30 +
>  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts           |   50 +-
>  arch/arm64/boot/dts/qcom/sm6115.dtsi               |   44 +-
>  drivers/phy/qualcomm/Makefile                      |    2 +-
>  drivers/phy/qualcomm/phy-qcom-qmp-usb.c            |  323 +-----
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c           | 1169 ++++++++++++++=
++++++
>  drivers/usb/typec/tcpm/qcom/Makefile               |    3 +-
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c      |  254 +----
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.h      |   27 +
>  .../usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c    |  157 ++-
>  .../usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.h    |   94 +-
>  .../typec/tcpm/qcom/qcom_pmic_typec_pdphy_stub.c   |   80 ++
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c |  290 ++++-
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.h |  172 +--
>  drivers/usb/typec/tcpm/tcpm.c                      |    3 +-
>  19 files changed, 2058 insertions(+), 870 deletions(-)
> ---
> base-commit: 9e21984d62c56a0f6d1fc6f76b646212cfd7fe88
> change-id: 20240112-pmi632-typec-4c7533092387
>
> Best regards,


