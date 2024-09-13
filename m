Return-Path: <linux-arm-msm+bounces-31731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D94B97827C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 16:24:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48F8C1C2222E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 14:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D360BFC12;
	Fri, 13 Sep 2024 14:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="meSZYwll"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A807D15E90;
	Fri, 13 Sep 2024 14:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726237467; cv=none; b=WpcXcwx+04wpUpA58cUvrQFHg6ax52r97ZrPBBpQB0VhwDuDnFLJCWsguRAhuQfSEbqypSQvZ4bUjwfZu/HR9dSb0jCNMdvtmCBhFGBrmQXNIGnK5nPK073UGwbEgnC4/fX7DA7AlREJFm5dbL85co9STz8y9lj/aZzhaayYpno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726237467; c=relaxed/simple;
	bh=6gImHD4TLppDz/pP9duxVYbJ8qiVvoa8rrFv+qH3Ijg=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=r+Ujbkoc1cwwCwSeqVLM8r4au4CtHdRKhl9keLFMWiJ2sOcMV2iv1khUVIH1XenKIHTzt15C0AuwVxKB8rWmIX4UGNQkHvZAsAtyW9l3WKFrmK2DRVfz/3ev14M3S9RK6UcRSVr3B0P9nv1g2M2nsZ/gXTDs4yodrUypzpSXYtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=meSZYwll; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07090C4CECC;
	Fri, 13 Sep 2024 14:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726237467;
	bh=6gImHD4TLppDz/pP9duxVYbJ8qiVvoa8rrFv+qH3Ijg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=meSZYwll/3peYROyCCJwMvnkpm7Zbt5FqN+WRmuMhdTomvvQ00RuF9ZnY7pw46M8P
	 sSEEUn/CrrTiGCjrRDKIJ6/qcwRItEwOZ8ARgJAWtvgAPJM6qnopWfH6+D0HzBmc7l
	 OMGcKFH++/jdi0lwO48DH48j6uHyzBy8wLGWn01RYsspurJ7crxNXgXo1nzsAKe3QT
	 4KSwWRi+/pVGaV/cswfQiCIyw/D4/p1795b53bimKJqVn7EdyxuxWzllwtmY94vksW
	 jIgHNblzda6Ill4j5GkTBGTGeK6Z1JZzGzkIJcK6bPpWEywEjpFrwTSXVmd/jkpDWW
	 onPu9Sc8aCGUg==
Date: Fri, 13 Sep 2024 09:24:26 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lijuan Gao <quic_lijuang@quicinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 devicetree@vger.kernel.org, kernel@quicinc.com, 
 Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
In-Reply-To: <20240913-add_initial_support_for_qcs615-v2-0-9236223e7dab@quicinc.com>
References: <20240913-add_initial_support_for_qcs615-v2-0-9236223e7dab@quicinc.com>
Message-Id: <172623730756.4076334.1076664597052385217.robh@kernel.org>
Subject: Re: [PATCH v2 0/6] Add initial support for QCS615 SoC and QCS615
 RIDE board


On Fri, 13 Sep 2024 19:55:22 +0800, Lijuan Gao wrote:
> This introduces the Device Tree for the QCS615 platform.
> 
> Features added and enabled:
> - CPUs with PSCI idle states
> - Interrupt-controller with PDC wakeup support
> - Timers, TCSR Clock Controllers
> - Reserved Shared memory
> - QFPROM
> - TLMM
> - Watchdog
> - RPMH controller
> - Sleep stats driver
> 
> This series are splited into three parts:
> - 1-3: Binding files for QCS615 SoC and PDC (Reviewed)
> - 4  : Soc table entry (Reviewed)
> - 5-6: Initial DTSI and RIDE board device tree
> 
> Bindings Dependencies:
> watchdog: https://lore.kernel.org/all/20240912-add_watchdog_compatible_for_qcs615-v1-1-ec22b5ad9891@quicinc.com/
> qfprom: https://lore.kernel.org/all/20240912-add_qfprom_compatible_for_qcs615-v1-1-9ef2e26c14ee@quicinc.com/
> tcsr: https://lore.kernel.org/all/20240912-add_tcsr_compatible_for_qcs615-v1-1-5b85dd4d42ad@quicinc.com/
> 
> Build Dependencies:
> tlmm: https://lore.kernel.org/all/20240910-add_qcs615_pinctrl_driver-v1-0-36f4c0d527d8@quicinc.com/
> 
> Patch made the following verifications:
> - Successfully pass dt_binding_check with DT_CHECKER_FLAGS=-m for earch binding file
> - Successfully pass dtbs_check with W=1 for dts
> - Verified CPU Hotplug and online CPUs on QCS615 ride board
> - Checked pinctrl-maps path
> - Verified Watchdog functional with "echo 1 > /dev/watchdog", can trigger
>   a watchdog bark and later bite
> - Verified functional with DCC console function on QCS615 ride board
> - RPMH controller driver probed successfully
> - Sleep stats driver probed successfully and checked qcom_stats
>   node on QCS615 ride board
> 
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---
> Changes in v2:
> - Collected reviewed-bys
> - Removed extra blank line
> - Removed redundant function
> - Renamed xo-board to xo-board-clk and move it and sleep-clk to board dts
> - Renamed system-sleep to cluster_sleep_2
> - Removed cluster1
> - Added entry-method for idle-states
> - Added DTS chassis type
> - Added TCSR Clock Controllers
> - Added Reserved Shared memory
> - Added QFPROM
> - Added TLMM
> - Added Watchdog
> - Added RPMH controller
> - Added Sleep stats driver
> - Link to v1: https://lore.kernel.org/r/20240828-add_initial_support_for_qcs615-v1-0-5599869ea10f@quicinc.com
> 
> ---
> Lijuan Gao (6):
>       dt-bindings: arm: qcom: document QCS615 and the reference board
>       dt-bindings: arm: qcom,ids: add SoC ID for QCS615
>       dt-bindings: qcom,pdc: document QCS615 Power Domain Controller
>       soc: qcom: socinfo: Add QCS615 SoC ID table entry
>       arm64: dts: qcom: add initial support for QCS615 DTSI
>       arm64: dts: qcom: add base QCS615 RIDE dts
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml    |   6 +
>  .../bindings/interrupt-controller/qcom,pdc.yaml    |   1 +
>  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts           |  34 ++
>  arch/arm64/boot/dts/qcom/qcs615.dtsi               | 511 +++++++++++++++++++++
>  drivers/soc/qcom/socinfo.c                         |   1 +
>  include/dt-bindings/arm/qcom,ids.h                 |   1 +
>  7 files changed, 555 insertions(+)
> ---
> base-commit: 100cc857359b5d731407d1038f7e76cd0e871d94
> change-id: 20240910-add_initial_support_for_qcs615-1a96c3469728
> 
> Best regards,
> --
> Lijuan Gao <quic_lijuang@quicinc.com>
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


New warnings running 'make CHECK_DTBS=y qcom/qcs615-ride.dtb' for 20240913-add_initial_support_for_qcs615-v2-0-9236223e7dab@quicinc.com:

arch/arm64/boot/dts/qcom/qcs615-ride.dtb: efuse@780000: compatible:0: 'qcom,qcs615-qfprom' is not one of ['qcom,apq8064-qfprom', 'qcom,apq8084-qfprom', 'qcom,ipq5332-qfprom', 'qcom,ipq6018-qfprom', 'qcom,ipq8064-qfprom', 'qcom,ipq8074-qfprom', 'qcom,ipq9574-qfprom', 'qcom,msm8226-qfprom', 'qcom,msm8916-qfprom', 'qcom,msm8974-qfprom', 'qcom,msm8976-qfprom', 'qcom,msm8996-qfprom', 'qcom,msm8998-qfprom', 'qcom,qcm2290-qfprom', 'qcom,qcs404-qfprom', 'qcom,sc7180-qfprom', 'qcom,sc7280-qfprom', 'qcom,sc8280xp-qfprom', 'qcom,sdm630-qfprom', 'qcom,sdm670-qfprom', 'qcom,sdm845-qfprom', 'qcom,sm6115-qfprom', 'qcom,sm6350-qfprom', 'qcom,sm6375-qfprom', 'qcom,sm8150-qfprom', 'qcom,sm8250-qfprom', 'qcom,sm8450-qfprom', 'qcom,sm8550-qfprom', 'qcom,sm8650-qfprom']
	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: efuse@780000: Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/efuse@780000: failed to match any schema with compatible: ['qcom,qcs615-qfprom', 'qcom,qfprom']
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/syscon@1fc0000: failed to match any schema with compatible: ['qcom,qcs615-tcsr', 'syscon']
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/pinctrl@3100000: failed to match any schema with compatible: ['qcom,qcs615-tlmm']
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: watchdog@17c10000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,apss-wdt-qcs615', 'qcom,kpss-wdt'] is too long
	['qcom,apss-wdt-qcs615', 'qcom,kpss-wdt'] is too short
	'qcom,apss-wdt-qcs615' is not one of ['qcom,kpss-wdt-ipq4019', 'qcom,apss-wdt-ipq5018', 'qcom,apss-wdt-ipq5332', 'qcom,apss-wdt-ipq9574', 'qcom,apss-wdt-msm8226', 'qcom,apss-wdt-msm8974', 'qcom,apss-wdt-msm8994', 'qcom,apss-wdt-qcm2290', 'qcom,apss-wdt-qcs404', 'qcom,apss-wdt-sa8255p', 'qcom,apss-wdt-sa8775p', 'qcom,apss-wdt-sc7180', 'qcom,apss-wdt-sc7280', 'qcom,apss-wdt-sc8180x', 'qcom,apss-wdt-sc8280xp', 'qcom,apss-wdt-sdm845', 'qcom,apss-wdt-sdx55', 'qcom,apss-wdt-sdx65', 'qcom,apss-wdt-sm6115', 'qcom,apss-wdt-sm6350', 'qcom,apss-wdt-sm8150', 'qcom,apss-wdt-sm8250']
	'qcom,kpss-wdt' was expected
	'qcom,scss-timer' was expected
	'qcom,apss-wdt-qcs615' is not one of ['qcom,kpss-wdt-apq8064', 'qcom,kpss-wdt-ipq8064', 'qcom,kpss-wdt-mdm9615', 'qcom,kpss-wdt-msm8960']
	'qcom,msm-timer' was expected
	'qcom,kpss-timer' was expected
	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/watchdog@17c10000: failed to match any schema with compatible: ['qcom,apss-wdt-qcs615', 'qcom,kpss-wdt']






