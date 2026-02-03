Return-Path: <linux-arm-msm+bounces-91714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNy1FfQygmkxQgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 18:40:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 386D7DCEFD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 18:40:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2CFAA306C686
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 17:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB28632693E;
	Tue,  3 Feb 2026 17:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H47cB76l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983212C235D;
	Tue,  3 Feb 2026 17:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770140245; cv=none; b=alP+hYjblcOnxqZDTsNFQiyzwLgvRoIeWBoFng739NLKrlIxmdnLGrxHW3i0Vja6A7cUjnJaDqWxKacfHYeUFCMcYQvKC1T1hmxRw0/rGbe6D/c8+SQr6XTZ8BXQScEofcspkpJUFq9SyFbwORjviYWh5YB7fqP4aDKRCpVdRY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770140245; c=relaxed/simple;
	bh=pvuAZWwicfoMIRfRh7T6PVDleRf+nabIqQLjR4EU0i8=;
	h=From:Date:Content-Type:MIME-Version:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=gIawajghZ2Iojk2teMmtzh+DCfU+T6fMq7hG4Q8vrJKbFeeTbNGuC/BoyMsUY0fuD7kyrquoie1gKdCThIhGh/NTd0axt0x95A1GsEhSiyMHPanDigeaMFmiTz3lZ+0BAi+6aglI84hmExFU0HklOqbKup68If9sHLYZxkKMTcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H47cB76l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23C7DC16AAE;
	Tue,  3 Feb 2026 17:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770140245;
	bh=pvuAZWwicfoMIRfRh7T6PVDleRf+nabIqQLjR4EU0i8=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=H47cB76l/Sg38yx9vK4S1AB+bZuQCtZa81Qlc5X9BOrwa+ya14BH4IdIeGGjYBGQg
	 R+myVA90VbkRakBEBBdSeDLwt+MRtv0HtGnRmfdnZfEqcxpWt20BfgRhWWg5QkrCJ4
	 gPkESU2rMULWqrcrcTeXFI61uFY3SadWEiqsqrw0+a6Z5+/44/VtyNVqzdcRwRLnxG
	 KLcSzK8Ain4Hv4uTe/wYgIvNAPFXfdI4h44tfxhqI2Q7xvp8nLawd8LMmjH24+WOJI
	 QEnyio89YXxFN9FES3MTGmd0JDl8RLohHEyFMa3weRi1GYtfQvszfi0OBAsHriCfRt
	 cANeKmDv55uyg==
From: Rob Herring <robh@kernel.org>
Date: Tue, 03 Feb 2026 11:37:24 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 andersson@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, conor+dt@kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
To: YijieYang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <20260202-purwa-v5-0-1f5a93578802@oss.qualcomm.com>
References: <20260202-purwa-v5-0-1f5a93578802@oss.qualcomm.com>
Message-Id: <177014002716.3173249.7908353000261603377.robh@kernel.org>
Subject: Re: [PATCH v5 0/4] Initial patch set for PURWA-IOT-EVK
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-91714-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 386D7DCEFD
X-Rspamd-Action: no action


On Mon, 02 Feb 2026 15:35:44 +0800, YijieYang wrote:
> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
> 
> Introduce the device tree, DT bindings, and driver updates required to enable
> the bring-up of the PURWA-IOT-EVK evaluation board. Focus is on two key
> hardware components:
> 
> PURWA-IOT-SOM — A compact System-on-Module integrating the SoC, GPIOs, and
> PMICs. Designed for modularity, it can pair with various carrier boards to
> support diverse use cases.
> 
> PURWA-IOT-EVK — A carrier board tailored for IoT scenarios, providing
> essential peripherals such as UART, on-board PMICs, and USB components.
> 
> Together, these components form a flexible and scalable platform. Initial
> functionality is achieved through proper device tree configuration and driver
> support.
> 
> The PURWA-IOT-EVK/SOM shares most of its hardware design with
> HAMOA-IOT-EVK/SOM, differing primarily in the BOM. Consequently, the DTS files
> are largely similar. Both platforms belong to Qualcomm’s IQ-X family. For more
> details on the IQ-X series, see:
> https://www.qualcomm.com/internet-of-things/products/iq-x-series
> 
> Hardware differences between HAMOA-IOT and PURWA-IOT:
> - Display — PURWA uses a different number of clocks and frequency compared to
>   HAMOA.
> - GPU — PURWA integrates a different GPU.
> - USB0 — PURWA uses a PS8833 retimer, while HAMOA employs an FSUSB42 as the
>   SBU switch.
> 
> Features added and enabled:
> - UART
> - On-board regulators
> - Regulators on the SOM
> - PMIC GLINK
> - USB0 through USB6 and their PHYs
> - Embedded USB (eUSB) repeaters
> - USB Type-C mux
> - PCIe3, PCIe4, PCIe5, PCIe6a
> - Reserved memory regions
> - Pinctrl
> - NVMe
> - ADSP, CDSP
> - WLAN, Bluetooth (M.2 interface)
> - USB DisplayPort and eDP
> - Graphics
> - Audio
> - TPM
> 
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> ---
> Changes in v2:
> - Update the GPU firmware path.
> - Update the description in the cover letter.
> - Reorder the patches.
> - Use separate DTS files for Purwa and Hamoa.
> - Update base commit.
> - Link to v1: https://lore.kernel.org/all/20251222-purwa-v1-0-14ab9316e5ff@oss.qualcomm.com/
> 
> Changes in v3:
> - Delete unused PMIC and thermal nodes.
> - Add WiFi node.
> - Add display backlight node.
> - Add connectors and VBUS regulators for USB3 and USB6.
> - Enable PCIe3 and PCIe5; add PCIe ports along with reset and wake-up GPIOs.
> - Link to v2: https://lore.kernel.org/r/20260109-purwa-v2-0-f39ee10684cb@oss.qualcomm.com
> 
> Changes in v4:
> - Enable TPM.
> - Update the descriptions for video and the USB OF graph.
> - Link to v3: https://lore.kernel.org/all/20260113-purwa-v3-0-16eefacbdce9@oss.qualcomm.com/
> 
> Changes in v5:
> - Reorder nodes in purwa-iot-evk.dts.
> - Update base commit.
> - The DT binding change that fixes the DT warning for pcie3_phy is located at: https://lore.kernel.org/linux-arm-msm/20260119-topic-purwa_phy_shutup_warning-v1-1-997a692b31c6@oss.qualcomm.com/T/#u
> - Link to v4: https://lore.kernel.org/r/20260116-purwa-v4-0-89b2adae9f09@oss.qualcomm.com
> 
> ---
> Yijie Yang (4):
>       dt-bindings: arm: qcom: Document PURWA-IOT-EVK board
>       firmware: qcom: scm: Allow QSEECOM on PURWA-IOT-EVK
>       arm64: dts: qcom: Add PURWA-IOT-SOM platform
>       arm64: dts: qcom: Add base PURWA-IOT-EVK board
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml |    6 +
>  arch/arm64/boot/dts/qcom/Makefile               |    1 +
>  arch/arm64/boot/dts/qcom/purwa-iot-evk.dts      | 1549 +++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi     |  685 ++++++++++
>  drivers/firmware/qcom/qcom_scm.c                |    1 +
>  5 files changed, 2242 insertions(+)
> ---
> base-commit: 6267b2da1b2d04847a1a8f441e138bc4a89435ee
> change-id: 20251113-purwa-907ec75b4959
> 
> Best regards,
> --
> Yijie Yang <yijie.yang@oss.qualcomm.com>
> 
> 
> 


My bot found DTB warnings on the .dts/.dtsi files added or changed in
this series.

Some warnings may be existing warnings. Consider fixing existing
warnings before adding new features.

Perhaps the warnings are fixed by another series. If that is the case,
please set the base commit and any dependencies for the series using
"b4".

Ultimately, it is up to the platform maintainer whether these warnings
are acceptable or not.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: 6267b2da1b2d04847a1a8f441e138bc4a89435ee (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20260202-purwa-v5-0-1f5a93578802@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/purwa-iot-evk.dtb: phy@1bd4000 (qcom,x1p42100-qmp-gen4x4-pcie-phy): 'qcom,4ln-config-sel' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml





