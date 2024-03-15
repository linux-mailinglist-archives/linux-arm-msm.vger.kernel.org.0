Return-Path: <linux-arm-msm+bounces-14270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7793687D29A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Mar 2024 18:20:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2FC71F23C32
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Mar 2024 17:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 634EB524D8;
	Fri, 15 Mar 2024 17:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="3qQlQlja"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF124DA0E
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Mar 2024 17:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710523193; cv=none; b=nN+uU/U+duzmSo3Z85CSyx2yEMZwCxi6LaiV1d5PT0+bpkesHArmp6cIieZ90paI/uRG2K9XH2N3noT/yhXDZzHmrT0nPzvz5wpxDf9ur9AXM/jeNcl8wULe99Wn5YBRsUYnawhzzsgmtz8DdsEtiyUfVx3q0PfttozVCKlH22c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710523193; c=relaxed/simple;
	bh=EJm1tj78grl4lxO2PY3/8pk4uT+i0Do4tX6BTnNm71o=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=YOg2d12SpKTy5uhfNRqMHPez5RHVvgb8LZhsQKrYCRbfx4TP7bPiKiz2qkeMibr2qkkdCgGFZp/wuo1mfSZYLmGBOCrxWguMxWkFVzSw+A1K6rlJxj5t2Eo1ewbncmAg3vHXuD4NVxH13WBijX5JXLVu77XZ7KwfXK+vEOmHA7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=3qQlQlja; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5684073ab38so4419922a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Mar 2024 10:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1710523189; x=1711127989; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WqOLIAmZ2SnT8ACFOblj+3Ee/qV/FF8prcByeKgP5T4=;
        b=3qQlQljagrfibL+X69LyZlDTR7yiQRseUfpECO4mcjZovX4/D/oZ+tzgvw/hybLW97
         sSTGDruXqaozsEBUslbU/iKruH5wZCEnxuSx7vN8I7TjUMENv7oYL6mEsYzCVLOnAmco
         mb+t0Vkrx8JQODHM7YB2WOuZrQuKPnAQ5YJoqNPsqyYNayj39KT7yKsVbLg1+cp/9X64
         +ga0v+p6c+0dLT3V73GpD/O7zcl+5bGCdw+xm2aM45SqJjA2pWYBWskI+ynC4Ixzmw2g
         7497PVQ/fv3aAhM1KEiMu0V27PfbKBxL4cAA7io59ttVz9i2aH/JjQP0Ih07+YPnUd80
         KCCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710523189; x=1711127989;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WqOLIAmZ2SnT8ACFOblj+3Ee/qV/FF8prcByeKgP5T4=;
        b=dUV6uZuI4F1Y2HRRJy4PgHN5rSNL/cKUR2PUY4eye5z4wBnTtQ0AYIFO8Aellmyxr5
         sZG1lyqz/lZWyzdCQetpyC4AFyIEr/Y9yHSZZh5SeZJdOx/wnuy6NJc0DJ9CaQcZa8wy
         h5MQsvY9TGMe8C3XCnmncynENy3JtWmjHIW58MaN0aWdk3g6DHIYyKOrxKWqhrDYhLoT
         8o5RwN0hO8DBdQbAVkvvu4lwulA0TiWCLSNSF/iGEi+126X34ZkTKdqqHt0e82wekqnN
         YiTWgniYljETnJVTIGw6jZF1gh2usv5N5ZONKnfx5leyEu5aK8zwVSRjcaWcnGxkIWwl
         zWhQ==
X-Gm-Message-State: AOJu0Yy5I2aYVSXSrZKVxHEG8DSMQ7qOybhZGXINJBEvQSntXWb5jPm5
	JBrnddsxGU/bpNtHcs4bC6u71WO1ug3LMSPPJTbGLwgdT9ZfBJo0wrmWI3zA67g=
X-Google-Smtp-Source: AGHT+IFEhCN0cf5efgrLVSYL2bdUxWGcIBmf3uLofQZXBEbujHqW9BJaOfNx1VebPC24zOOmZ4ygZA==
X-Received: by 2002:a05:6402:500f:b0:567:f475:6c6b with SMTP id p15-20020a056402500f00b00567f4756c6bmr6157295eda.8.1710523188830;
        Fri, 15 Mar 2024 10:19:48 -0700 (PDT)
Received: from localhost (213142096067.public.telering.at. [213.142.96.67])
        by smtp.gmail.com with ESMTPSA id v17-20020a056402175100b005651ae4ac91sm1827004edx.41.2024.03.15.10.19.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Mar 2024 10:19:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 15 Mar 2024 18:19:47 +0100
Message-Id: <CZUHV429NTF7.1GW9TN9NXB4J1@fairphone.com>
Cc: <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFT 0/7] arm64: qcom: allow up to 4 lanes for the Type-C
 DisplayPort Altmode
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Neil Armstrong" <neil.armstrong@linaro.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konrad.dybcio@linaro.org>, "Vinod
 Koul" <vkoul@kernel.org>, "Kishon Vijay Abraham I" <kishon@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.15.2
References: <20240229-topic-sm8x50-upstream-phy-combo-typec-mux-v1-0-07e24a231840@linaro.org>
In-Reply-To: <20240229-topic-sm8x50-upstream-phy-combo-typec-mux-v1-0-07e24a231840@linaro.org>

On Thu Feb 29, 2024 at 2:07 PM CET, Neil Armstrong wrote:
> Register a typec mux in order to change the PHY mode on the Type-C
> mux events depending on the mode and the svid when in Altmode setup.
>
> The DisplayPort phy should be left enabled if is still powered on
> by the DRM DisplayPort controller, so bail out until the DisplayPort
> PHY is not powered off.
>
> The Type-C Mode/SVID only changes on plug/unplug, and USB SAFE states
> will be set in between of USB-Only, Combo and DisplayPort Only so
> this will leave enough time to the DRM DisplayPort controller to
> turn of the DisplayPort PHY.
>
> The patchset also includes bindings changes and DT changes.
>
> This has been successfully tested on an SM8550 board, but the
> Thinkpad X13s deserved testing between non-PD USB, non-PD DisplayPort,
> PD USB Hubs and PD Altmode Dongles to make sure the switch works
> as expected.
>
> The DisplayPort 4 lanes setup can be check with:
> $ cat /sys/kernel/debug/dri/ae01000.display-controller/DP-1/dp_debug
> 	name =3D msm_dp
> 	drm_dp_link
> 		rate =3D 540000
> 		num_lanes =3D 4

Hi Neil,

I tried this on QCM6490/SC7280 which should also support 4-lane DP but I
haven't had any success so far.

On top of your patches I added the following for my device:

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm6=
4/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index f5bd51806819..e7be17844da1 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -712,7 +712,7 @@ &mdss_dp {
 };
=20
 &mdss_dp_out {
-	data-lanes =3D <0 1>;
+	data-lanes =3D <0 1 2 3>;
 	remote-endpoint =3D <&usb_dp_qmpphy_dp_in>;
 };
=20
@@ -1344,6 +1344,7 @@ &usb_1_qmpphy {
 	vdda-phy-supply =3D <&vreg_l6b>;
 	vdda-pll-supply =3D <&vreg_l1b>;
=20
+	mode-switch;
 	orientation-switch;
=20
 	status =3D "okay";


The output of the dp_debug file shows it's trying to use 4 lanes:

        name =3D msm_dp
        drm_dp_link
                rate =3D 540000
                num_lanes =3D 4
                capabilities =3D 1
        dp_panel_info:
                active =3D 0x0
                back_porch =3D 0x0
                front_porch =3D 0x0
                sync_width =3D 0x0
                active_low =3D 0x0
                h_skew =3D 0
                refresh rate =3D 0
                pixel clock khz =3D 0
                bpp =3D 0
        dp_link:
                test_requested =3D 128
                num_lanes =3D 4
                bw_code =3D 20
                lclk =3D 540000000
                v_level =3D 2
                p_level =3D 0

But the monitor stays black and the following appears in dmesg:
(starts with plugging in a dongle, ends with unplugging it again)

[ 1773.538161] xhci-hcd xhci-hcd.2.auto: xHCI Host Controller
[ 1773.538197] xhci-hcd xhci-hcd.2.auto: new USB bus registered, assigned b=
us number 1
[ 1773.540215] xhci-hcd xhci-hcd.2.auto: hcc params 0x0230fe65 hci version =
0x110 quirks 0x0000008000000010
[ 1773.540260] xhci-hcd xhci-hcd.2.auto: irq 185, io mem 0x0a600000
[ 1773.540372] xhci-hcd xhci-hcd.2.auto: xHCI Host Controller
[ 1773.540384] xhci-hcd xhci-hcd.2.auto: new USB bus registered, assigned b=
us number 2
[ 1773.540396] xhci-hcd xhci-hcd.2.auto: Host supports USB 3.0 SuperSpeed
[ 1773.540524] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.08
[ 1773.540534] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[ 1773.540541] usb usb1: Product: xHCI Host Controller
[ 1773.540547] usb usb1: Manufacturer: Linux 6.8.0-00058-g113103fa3b95 xhci=
-hcd
[ 1773.540554] usb usb1: SerialNumber: xhci-hcd.2.auto
[ 1773.540999] hub 1-0:1.0: USB hub found
[ 1773.541028] hub 1-0:1.0: 1 port detected
[ 1773.542010] usb usb2: We don't know the algorithms for LPM for this host=
, disabling LPM.
[ 1773.542146] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.08
[ 1773.542162] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[ 1773.542174] usb usb2: Product: xHCI Host Controller
[ 1773.542183] usb usb2: Manufacturer: Linux 6.8.0-00058-g113103fa3b95 xhci=
-hcd
[ 1773.542193] usb usb2: SerialNumber: xhci-hcd.2.auto
[ 1773.543241] hub 2-0:1.0: USB hub found
[ 1773.543282] hub 2-0:1.0: 1 port detected
[ 1775.563969] [drm:dp_ctrl_link_train] *ERROR* max v_level reached
[ 1775.564031] [drm:dp_ctrl_link_train] *ERROR* link training #1 failed. re=
t=3D-11
[ 1775.597965] [drm:dp_display_process_hpd_high] *ERROR* failed to complete=
 DP link training
[ 1775.598149] [drm:dp_aux_isr] *ERROR* Unexpected DP AUX IRQ 0x01000000 wh=
en not busy
[ 1776.632081] [drm:dp_ctrl_link_train] *ERROR* max v_level reached
[ 1776.632145] [drm:dp_ctrl_link_train] *ERROR* link training #1 failed. re=
t=3D-11
[ 1776.662978] [drm:dp_display_process_hpd_high] *ERROR* failed to complete=
 DP link training
[ 1776.663039] [drm:dp_aux_isr] *ERROR* Unexpected DP AUX IRQ 0x01000000 wh=
en not busy
[ 1777.717501] [drm:dp_ctrl_link_train] *ERROR* max v_level reached
[ 1777.717524] [drm:dp_ctrl_link_train] *ERROR* link training #1 failed. re=
t=3D-11
[ 1777.751427] [drm:dp_display_process_hpd_high] *ERROR* failed to complete=
 DP link training
[ 1777.751518] [drm:dp_aux_isr] *ERROR* Unexpected DP AUX IRQ 0x01000000 wh=
en not busy
[ 1778.793550] [drm:dp_ctrl_link_train] *ERROR* max v_level reached
[ 1778.793617] [drm:dp_ctrl_link_train] *ERROR* link training #1 failed. re=
t=3D-11
[ 1778.827260] [drm:dp_aux_isr] *ERROR* Unexpected DP AUX IRQ 0x01000000 wh=
en not busy
[ 1778.827334] [drm:dp_display_process_hpd_high] *ERROR* failed to complete=
 DP link training
[ 1779.279889] xhci-hcd xhci-hcd.2.auto: remove, state 1
[ 1779.279942] usb usb2: USB disconnect, device number 1
[ 1779.311920] xhci-hcd xhci-hcd.2.auto: USB bus 2 deregistered
[ 1779.311987] xhci-hcd xhci-hcd.2.auto: remove, state 4
[ 1779.312019] usb usb1: USB disconnect, device number 1
[ 1779.317772] xhci-hcd xhci-hcd.2.auto: USB bus 1 deregistered

Regards
Luca


> ...
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Neil Armstrong (7):
>       dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp: Add mode-switch
>       phy: qcom: qmp-combo: store DP phy power state
>       phy: qcom: qmp-combo: introduce QPHY_MODE
>       phy: qcom: qmp-combo: register a typec mux to change the QPHY_MODE
>       arm64: dts: qcom-sm8550: allow 4 lanes for DisplayPort and enable Q=
MP PHY mode-switch
>       arm64: dts: qcom-sm8650: allow 4 lanes for DisplayPort and enable Q=
MP PHY mode-switch
>       arm64: dts: qcom-mode-switch: allow 4 lanes for DisplayPort and ena=
ble QMP PHY mode-switch
>
>  .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         |   5 +
>  .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |   6 +-
>  arch/arm64/boot/dts/qcom/sm8550-hdk.dts            |   3 +-
>  arch/arm64/boot/dts/qcom/sm8550-qrd.dts            |   3 +-
>  arch/arm64/boot/dts/qcom/sm8650-qrd.dts            |   3 +-
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 168 +++++++++++++++=
++++--
>  6 files changed, 173 insertions(+), 15 deletions(-)
> ---
> base-commit: b321c0e8ca754d8cd9f23ceba958e3ea93c6519e
> change-id: 20240229-topic-sm8x50-upstream-phy-combo-typec-mux-31b5252513c=
9
>
> Best regards,


