Return-Path: <linux-arm-msm+bounces-91715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGoWAMc0gmmmQgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 18:47:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0666FDD114
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 18:47:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 47D40303CBD5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 17:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9755E350A33;
	Tue,  3 Feb 2026 17:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HV9rsh0P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CDF325738;
	Tue,  3 Feb 2026 17:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770140246; cv=none; b=tpqU4pF9mmD7mzt/lxA3vzIBIBK8+jUAoAo8zKUCdiEvTL7/6ShrnT9JXF4Cj/2B2RBGwTOdrb6cl+ms4Ae8AZyl2WraSSPmiRez1WuS2yWaf+xohegWq2mNz2ysIBLmgZvy76PyMUWm+6+HGSwUjuarokRkwWiYi7yvhJKYl4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770140246; c=relaxed/simple;
	bh=E4M+J8U79oQYdJpLZ4BTO94E5sRAyL427RmIxzIk0uM=;
	h=From:Date:Content-Type:MIME-Version:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=DfYagUVxvXOjYqi/UuW0LNHYQMEArkgkrwpa4ghCbZvFJbPGL/qEMWtWjxyuqdwEbCvtLdEGxt5UVaa5btrOXlyzXluuucyFvCvmTec4SyuAPhbvt72+V9M7BZb59alJ3OQFvrEGEM8GZB2fd+kMp+/on2MCRvp5fp2WuNWeOgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HV9rsh0P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C357C16AAE;
	Tue,  3 Feb 2026 17:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770140246;
	bh=E4M+J8U79oQYdJpLZ4BTO94E5sRAyL427RmIxzIk0uM=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=HV9rsh0PNT62GIqK0sBeyEsojo0HWdQlcRyiAigW+tbc/DDEhKrxlVRESGOXlc8f+
	 lCYiGB2aSwgI6VIn0uc+escV0ut1dCpGbm9GYUqg7kUOpTqyq5El4jyTwo+kQ88HHP
	 zX0SMELGtTucfZqmnlQXpwylndzby1GTilgGq4/AgN2Mo8jRZvny6e6uvW/63Ej4Ug
	 4wDkoEmn42XxkkhnKHXWauRqoEsxa0BhD4+bLL3vm0HG8QTkYaHOydmgJkzrlwNPMz
	 AQEsT9uGDbEcVR3VDfEIL1ZZelhaAPDRlmn9m7ydH4vuLEonyE2+9y/+6+FClZ9SP0
	 +9FS14SfQoDVg==
From: Rob Herring <robh@kernel.org>
Date: Tue, 03 Feb 2026 11:37:25 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
In-Reply-To: <20260203-industrial-mezzanine-pcie-v2-0-8579ed6bf931@oss.qualcomm.com>
References: <20260203-industrial-mezzanine-pcie-v2-0-8579ed6bf931@oss.qualcomm.com>
Message-Id: <177014003005.3173393.12199937137009743823.robh@kernel.org>
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: Add TC9563 PCIe switch nodes
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91715-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.3:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.2:email,qualcomm.com:email,0.0.0.0:email,devicetree.org:url,0.0.0.6:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.0.0.4:email]
X-Rspamd-Queue-Id: 0666FDD114
X-Rspamd-Action: no action


On Tue, 03 Feb 2026 10:01:27 +0530, Sushrut Shree Trivedi wrote:
> Add nodes for the two additional TC9563 PCIe switches present on the
> QCOM RB3Gen2 Industrial Mezzanine platform.
> 
> One of the TC9563 is connected directly to the PCIe0 root-port while
> the second TC9563 switch is connected in cascade fashion to another
> already available TC9563 switch on PCIe1 via the former's downstream
> port (DSP). The final PCIe hierarchy on the Industrial Mezz platform
> would look something like below:
> 
>                    ┌────────────────────────────┐
>                    │                            │
>                    │                            │
>                    │                            │
>                    │            SoC             │
>                    │                            │
>                    │    PCIe0           PCIe1   │
>                    │    ┌───┐           ┌───┐   │
>                    └────└─┬─┘───────────└─┬─┘───┘
>                           │               │
>                           │               │
>                           │               │
>          ┌────────────────┘               └────────────────┐
>          │                                                 │
>          │                                                 │
>          │                                                 │
> ┌────────┴─────────┐                            ┌──────────┴───────┐
> │       USP        │                            │        USP       │
> │                  │                            │                  │
> │      TC9563      │                            │      TC9563      │
> │                  │                            │                  │
> │                  │                            │                  │
> │ DSP1  DSP2  DSP3 │                            │ DSP1  DSP2  DSP3 │
> └──┬──────┬─────┬──┘                            └───┬─────┬─────┬──┘
>    │      │     │                                   │     │     │
>    │      │     │                                   │     │     │
>    │      │     │                                   │     │     │
>    │      │     │                                   │     EP    ETHERNET
>    │      │     │                                   │
>    │      │     │                                   └──────┐
>    EP     EP    ETHERNET                                   │
>                                                            │
>                                                            │
>                                                  ┌─────────┴────────┐
>                                                  │        USP       │
>                                                  │                  │
>                                                  │      TC9563      │
>                                                  │                  │
>                                                  │                  │
>                                                  │ DSP1  DSP2  DSP3 │
>                                                  └──┬──────┬─────┬──┘
>                                                     │      │     │
>                                                     │      │     │
>                                                     │      │     │
>                                                     │      │     │
>                                                     │      │     │
>                                                     EP     EP    ETHERNET
> 
> 
> 
> Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
> ---
> Changes in v2:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.
> - Link to v1: https://lore.kernel.org/r/20260131-industrial-mezzanine-pcie-v1-0-b3c2905dd768@oss.qualcomm.com
> 
> ---
> Sushrut Shree Trivedi (2):
>       arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: Add TC9563 PCIe switch node for PCIe0
>       arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: Add second TC9563 PCIe switch node for PCIe1
> 
>  .../qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso | 234 +++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |  12 +-
>  2 files changed, 240 insertions(+), 6 deletions(-)
> ---
> base-commit: 4f938c7d3b25d87b356af4106c2682caf8c835a2
> change-id: 20260131-industrial-mezzanine-pcie-75dd851f5b04
> 
> Best regards,
> --
> Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
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
 Base: 4f938c7d3b25d87b356af4106c2682caf8c835a2 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20260203-industrial-mezzanine-pcie-v2-0-8579ed6bf931@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso:86.3-35: Warning (reg_format): /fragment@4/__overlay__/pcie@0,0:reg: property has invalid length (20 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso:171.3-35: Warning (reg_format): /fragment@6/__overlay__/pcie@0,0:reg: property has invalid length (20 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso:91.3-10: Warning (ranges_format): /fragment@4/__overlay__/pcie@0,0:ranges: empty "ranges" property but its #address-cells (3) differs from /fragment@4/__overlay__ (2)
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso:91.3-10: Warning (ranges_format): /fragment@4/__overlay__/pcie@0,0:ranges: empty "ranges" property but its #size-cells (2) differs from /fragment@4/__overlay__ (1)
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso:176.3-10: Warning (ranges_format): /fragment@6/__overlay__/pcie@0,0:ranges: empty "ranges" property but its #address-cells (3) differs from /fragment@6/__overlay__ (2)
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso:176.3-10: Warning (ranges_format): /fragment@6/__overlay__/pcie@0,0:ranges: empty "ranges" property but its #size-cells (2) differs from /fragment@6/__overlay__ (1)
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtbo: Warning (pci_device_reg): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtbo: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtbo: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtbo: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso:84.30-146.4: Warning (avoid_default_addr_size): /fragment@4/__overlay__/pcie@0,0: Relying on default #address-cells value
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso:84.30-146.4: Warning (avoid_default_addr_size): /fragment@4/__overlay__/pcie@0,0: Relying on default #size-cells value
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso:169.30-231.4: Warning (avoid_default_addr_size): /fragment@6/__overlay__/pcie@0,0: Relying on default #address-cells value
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso:169.30-231.4: Warning (avoid_default_addr_size): /fragment@6/__overlay__/pcie@0,0: Relying on default #size-cells value
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pmic@2 (qcom,pm8350c): pwm:nvmem: [[390, 391]] is too short
	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pwm (qcom,pm8350c-pwm): nvmem: [[390, 391]] is too short
	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pcie@0,0 (pci1179,0623): pcie@3,0:pci@0,1: 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/pci/toshiba,tc9563.yaml
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pcie@0,0 (pci1179,0623): pcie@3,0:pci@0,0: 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/pci/toshiba,tc9563.yaml
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pcie@0,0 (pci1179,0623): pcie@3,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'device_type', 'pci@0,0', 'pci@0,1', 'ranges', 'reg' were unexpected)
	from schema $id: http://devicetree.org/schemas/pci/toshiba,tc9563.yaml
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pcie@3,0: pci@0,1: 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pcie@3,0: pci@0,0: 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pcie@0,0 (pci1179,0623): pcie@3,0:pci@0,1: 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/pci/toshiba,tc9563.yaml
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pcie@0,0 (pci1179,0623): pcie@3,0:pci@0,0: 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/pci/toshiba,tc9563.yaml
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pcie@0,0 (pci1179,0623): pcie@3,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'device_type', 'pci@0,0', 'pci@0,1', 'ranges', 'reg' were unexpected)
	from schema $id: http://devicetree.org/schemas/pci/toshiba,tc9563.yaml
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pcie@3,0: pci@0,1: 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pcie@3,0: pci@0,0: 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pmic@2 (qcom,pm8350c): pwm:nvmem: [[390, 391]] is too short
	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pwm (qcom,pm8350c-pwm): nvmem: [[390, 391]] is too short
	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: pmic@2 (qcom,pm8350c): pwm:nvmem: [[390, 391]] is too short
	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: pwm (qcom,pm8350c-pwm): nvmem: [[390, 391]] is too short
	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml





