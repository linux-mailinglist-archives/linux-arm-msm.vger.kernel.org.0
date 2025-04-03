Return-Path: <linux-arm-msm+bounces-53112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A335FA7A551
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 16:38:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9526D17029D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 14:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B750724EF99;
	Thu,  3 Apr 2025 14:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KHwouBpo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866C924EF94;
	Thu,  3 Apr 2025 14:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743690934; cv=none; b=FMbkDgVy+Rfl8ukRIGAMqIvPDY1Ke1oNnPaq/scGOfCJgSg1luo9SdcdQEtiv1OYTKHHR0926pNOTGM9+4vmx0UAaBEyICOJal+BPONY1RhrMftH9YUCV1Jd2PDWdoAhbMrZWjgwyBPvG1gGggUDhQnb70g+5Cy7y3MGmHCL8jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743690934; c=relaxed/simple;
	bh=bXBZ3LlzT157HJoLCGhNjsSojxP5CNEkwZ+Gsw6CeR0=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=NHPnhzVzBFHvFy89FNLOzC3RT27tSrvGmR5OoFShgowGid3p0EKRz8igAxjPeKBKR4en+NehONLOMrpild0htTGdCd0y9DuqeXVnb748qE6wQGjehQKThieK7oGNQdGXBuV8H1Dv7iFBet+vshK6Zu4D8b0q4+H4Pu5lXRFl+zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KHwouBpo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42BEEC4CEE7;
	Thu,  3 Apr 2025 14:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743690934;
	bh=bXBZ3LlzT157HJoLCGhNjsSojxP5CNEkwZ+Gsw6CeR0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=KHwouBpop795WXWe2ubx4fvNoFIcFqVWQUU1NokdNIHKykmord0jUf0jsvFtkXdCb
	 qsXUaSPcvqGCDmNQbHIdxT8/fTPWMDKfS1M9U8fV/BXPW0/0Z6eOwvJb/KEArioAX9
	 KEhHXaU868eQ83Ug34Mo1CCMghgASv8DDH/WZhrN/FGzxS3kKjkTn4vum8Utc35q0B
	 whPzpblId3/sdMXzX7FID3gBRgYnsar/A6OaYPjoMU1TxeF+UBApHnPYl7+hXcvG4b
	 om1DQFyogOhZJ8JPKVOpaQo7TzV+W7zqUnElKnxhGa9HT9UXVCaCd/WgKKJD1d4Dqy
	 PmtUnXUnfKTmA==
Date: Thu, 03 Apr 2025 09:35:33 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, andersson@kernel.org, quic_mmanikan@quicinc.com, 
 linux-remoteproc@vger.kernel.org, konradybcio@kernel.org, 
 vignesh.viswanathan@oss.qualcomm.com, conor+dt@kernel.org, 
 devicetree@vger.kernel.org, quic_srichara@quicinc.com, 
 mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org
To: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
In-Reply-To: <20250403120304.2345677-1-gokul.sriram.p@oss.qualcomm.com>
References: <20250403120304.2345677-1-gokul.sriram.p@oss.qualcomm.com>
Message-Id: <174369066420.2789636.4339899555614264729.robh@kernel.org>
Subject: Re: [PATCH V4 0/8] Add new driver for WCSS secure PIL loading


On Thu, 03 Apr 2025 17:32:56 +0530, Gokul Sriram Palanisamy wrote:
> This series depends on Sricharan's tmel-qmp mailbox driver series v4 [1].
> 
> - Secure PIL is signed, split firmware images which only TrustZone (TZ)
>   can authenticate and load. Linux kernel will send a request to TZ to
>   authenticate and load the PIL images.
> 
> - When secure PIL support was added to the existing wcss PIL driver
>   earlier in [2], Bjorn suggested not to overload the existing WCSS
>   rproc driver, instead post a new driver for PAS based IPQ WCSS driver.
>   This series adds a new secure PIL driver for the same.
> 
> - Also adds changes to scm to pass metadata size as required for IPQ5332,
>   reposted from [3].
> 
> [1]
> https://patchwork.kernel.org/project/linux-arm-msm/cover/20250327181750.3733881-1-quic_srichara@quicinc.com/
> 
> [2]
> https://patchwork.kernel.org/project/linux-arm-msm/patch/1611984013-10201-3-git-send-email-gokulsri@codeaurora.org/
> 
> [3]
> https://patchwork.kernel.org/project/linux-arm-msm/patch/20240820055618.267554-6-quic_gokulsri@quicinc.com/
> 
> changes in v4:
>         - changed q6 firmware image format from .mdt to .mbn
>         - corrected arrangement of variable assignemnts as per comments
>           in qcom_scm.c
>         - added scm call to get board machid
>         - added support for q6 dtb loading with support for additional
>           reserved memory for q6 dtb in .mbn format
>         - updated dt-bindings to include new dts entry qcom,q6-dtb-info
>           and additional item in memory-region for q6 dtb region.
>         - removed unnecessary dependency for QCOM_Q6V5_WCSS_SEC in
>           Kconfig
>         - removed unwanted header files in qcom_q6v5_wcss_sec.c
>         - removed repeated dtb parsing during runtime in qcom_q6v5_wcss_sec.c
>         - added required check for using tmelcom, if available. Enabled
>           fallback to scm based authentication, if tmelcom is unavailable.
>         - added necessary padding for 8digt hex address in dts
> 
> 	Following tests were done:
> 	- checkpatch
> 	- kernel-doc
> 	- dt_binding_check and dtbs_check
> 
> changes in v3:
>         - fixed copyright years and markings based on Jeff's comments.
>         - replaced devm_ioremap_wc() with ioremap_wc() in
>           wcss_sec_copy_segment().
>         - replaced rproc_alloc() and rproc_add() with their devres
>           counterparts.
>         - added mailbox call to tmelcom for secure image authentication
>           as required for IPQ5424. Added ipq5424 APCS comatible required.
>         - added changes to scm call to pass metadata size as equired for
>           IPQ5332.
> 
> changes in v2:
>         - Removed dependency of this series to q6 clock removal series
>           as recommended by Krzysztof
> 
> Gokul Sriram Palanisamy (3):
>   soc: qcom: smem: introduce qcom_smem_get_machid()
>   remoteproc: qcom: add support for Q6 device-tree loading
>   arm64: dts: qcom: ipq5424: add nodes to bring up q6
> 
> Manikanta Mylavarapu (4):
>   firmware: qcom_scm: ipq5332: add support to pass metadata size
>   dt-bindings: remoteproc: qcom: document hexagon based WCSS secure PIL
>   arm64: dts: qcom: ipq5332: add nodes to bringup q6
>   arm64: dts: qcom: ipq9574: add nodes to bring up q6
> 
> Vignesh Viswanathan (1):
>   remoteproc: qcom: add hexagon based WCSS secure PIL driver
> 
>  .../remoteproc/qcom,wcss-sec-pil.yaml         | 146 +++++
>  arch/arm64/boot/dts/qcom/ipq5332.dtsi         |  71 ++-
>  arch/arm64/boot/dts/qcom/ipq5424.dtsi         |  87 ++-
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi         |  61 +-
>  drivers/firmware/qcom/qcom_scm.c              |  17 +-
>  drivers/firmware/qcom/qcom_scm.h              |   1 +
>  drivers/remoteproc/Kconfig                    |  19 +
>  drivers/remoteproc/Makefile                   |   1 +
>  drivers/remoteproc/qcom_q6v5_wcss_sec.c       | 526 ++++++++++++++++++
>  drivers/soc/qcom/smem.c                       |  26 +
>  include/linux/remoteproc.h                    |   2 +
>  include/linux/soc/qcom/smem.h                 |   1 +
>  12 files changed, 951 insertions(+), 7 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml
>  create mode 100644 drivers/remoteproc/qcom_q6v5_wcss_sec.c
> 
> --
> 2.34.1
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/next-20250403 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250403120304.2345677-1-gokul.sriram.p@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/ipq9574.dtsi:1484.4-30: Warning (reg_format): /thermal-zones/remoteproc@cd00000:reg: property has invalid length (8 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/qcom/ipq9574.dtsi:1482.33-1510.5: Warning (avoid_default_addr_size): /thermal-zones/remoteproc@cd00000: Relying on default #address-cells value
arch/arm64/boot/dts/qcom/ipq9574.dtsi:1482.33-1510.5: Warning (avoid_default_addr_size): /thermal-zones/remoteproc@cd00000: Relying on default #size-cells value
arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: thermal-zones: 'remoteproc@cd00000' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
arch/arm64/boot/dts/qcom/ipq5424-rdp466.dtb: /soc@0/qmp@32090000: failed to match any schema with compatible: ['qcom,ipq5424-tmel']
arch/arm64/boot/dts/qcom/ipq9574.dtsi:1484.4-30: Warning (reg_format): /thermal-zones/remoteproc@cd00000:reg: property has invalid length (8 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/qcom/ipq9574.dtsi:1482.33-1510.5: Warning (avoid_default_addr_size): /thermal-zones/remoteproc@cd00000: Relying on default #address-cells value
arch/arm64/boot/dts/qcom/ipq9574.dtsi:1482.33-1510.5: Warning (avoid_default_addr_size): /thermal-zones/remoteproc@cd00000: Relying on default #size-cells value
arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: thermal-zones: 'remoteproc@cd00000' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
arch/arm64/boot/dts/qcom/ipq9574.dtsi:1484.4-30: Warning (reg_format): /thermal-zones/remoteproc@cd00000:reg: property has invalid length (8 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/qcom/ipq9574.dtsi:1482.33-1510.5: Warning (avoid_default_addr_size): /thermal-zones/remoteproc@cd00000: Relying on default #address-cells value
arch/arm64/boot/dts/qcom/ipq9574.dtsi:1482.33-1510.5: Warning (avoid_default_addr_size): /thermal-zones/remoteproc@cd00000: Relying on default #size-cells value
arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: thermal-zones: 'remoteproc@cd00000' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
arch/arm64/boot/dts/qcom/ipq9574.dtsi:1484.4-30: Warning (reg_format): /thermal-zones/remoteproc@cd00000:reg: property has invalid length (8 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/qcom/ipq9574.dtsi:1482.33-1510.5: Warning (avoid_default_addr_size): /thermal-zones/remoteproc@cd00000: Relying on default #address-cells value
arch/arm64/boot/dts/qcom/ipq9574.dtsi:1482.33-1510.5: Warning (avoid_default_addr_size): /thermal-zones/remoteproc@cd00000: Relying on default #size-cells value
arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: thermal-zones: 'remoteproc@cd00000' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
arch/arm64/boot/dts/qcom/ipq9574.dtsi:1484.4-30: Warning (reg_format): /thermal-zones/remoteproc@cd00000:reg: property has invalid length (8 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/qcom/ipq9574.dtsi:1482.33-1510.5: Warning (avoid_default_addr_size): /thermal-zones/remoteproc@cd00000: Relying on default #address-cells value
arch/arm64/boot/dts/qcom/ipq9574.dtsi:1482.33-1510.5: Warning (avoid_default_addr_size): /thermal-zones/remoteproc@cd00000: Relying on default #size-cells value
arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: thermal-zones: 'remoteproc@cd00000' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#






