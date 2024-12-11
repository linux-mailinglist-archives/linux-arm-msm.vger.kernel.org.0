Return-Path: <linux-arm-msm+bounces-41529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4909ED07B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 16:54:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC2FE161EF6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 15:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2D3D1D934B;
	Wed, 11 Dec 2024 15:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C9zmu5P3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F7B1D90BE;
	Wed, 11 Dec 2024 15:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733932484; cv=none; b=rDhglPfALyt9xMrMFE2m4TPhfvhZw4tVBeYXMGKUsA/7Eo+RbAWdljmDF5HwCiT5nMm5SsBBayhaiUiZrpYtWaoXiDda7keEf54y7l5DeAdJxIKJOZqnaVZY84W/dX332zW6oVoaK7bFHLQ/vDPZZiQOEscW4J2QM9JXX+DNRvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733932484; c=relaxed/simple;
	bh=v/DcyveB11fw5qcYWD8enqaiqYJO/XngtDn0iydnhxg=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=KlfHCWOpD4y2O1Rs59yheT+XR6WwNekppTHaJ7WBv6EtzO8B5dK6n+hgnxl6YmLhKFSqjfQBZsengjoCpT9mZArtWhDXjxZpZfJdz8uXgfOgXwX+3CE0G5O4ydghOUnGNvXz2eyQD8X+S9gJs8D9bNg1kajMQqbyvnmdhbJUOns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C9zmu5P3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2669C4CED2;
	Wed, 11 Dec 2024 15:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733932483;
	bh=v/DcyveB11fw5qcYWD8enqaiqYJO/XngtDn0iydnhxg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=C9zmu5P38EYxAXwMrW4WrhACHpaGBnAPZDKKSq7wJz+gkIoH7LgSkgkr6vms/xyZf
	 V5AXnZ+NfBHNQwwQEIrcSjI+l+edVTvyIpUKY2UKb9khnoHDsNbe742I6N7dDZFBCx
	 xI/KyWzV9gM8cnOI8jVm+TNqL+QQzdPy+AeYyzj1VUmA5dIpmAHvtuhIkKAicztXDc
	 EXs8JEZAaFP8rj/SPLV4EnjqCHqZIoTWOeIy266NYsl4M2MYOLW+EaCvnF2SQaOtJU
	 TrCms1tWoxg3AJJuyXDJ4USLPrxK2oxAW9ad+EfrBC7oYDH7Brd6M3BbKiMLNzFmXc
	 jNmWNfXTkjOJA==
Date: Wed, 11 Dec 2024 09:54:41 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 tingweiz@qti.qualcomm.com, fenglinw@qti.qualcomm.com, 
 devicetree@vger.kernel.org, kernel@quicinc.com, 
 Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Tingguo Cheng <quic_tingguoc@quicinc.com>
In-Reply-To: <20241211-bug-fix-qcs615-ride-dts-lpm-power-issue-v1-1-a08d12c415f0@quicinc.com>
References: <20241211-bug-fix-qcs615-ride-dts-lpm-power-issue-v1-1-a08d12c415f0@quicinc.com>
Message-Id: <173393224448.3091083.12048612703550946062.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: qcs615-ride: Fixing power issue in
 LPM


On Wed, 11 Dec 2024 17:16:15 +0800, Tingguo Cheng wrote:
> Change all LPM to HPM for regulators init-mode and disallowed setting
> mode. LPM mode provides at most 10/30mA current for consumers such as
> UFS,eMMC,PCIe. That caused problems because consumers take much more
> than that. At the same time, a lot of drivers didn't set load in code
> that makes it impossible for regulator framework to know exaclty when
> to switch mode.
> 
> Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
> ---
> At the beginning, The QCS615-ride device gets some power issues when
> enabling peripherals on the board as well as in the SoC. After figuring
> out the root cause which pointed to that drivers should tell the regula
> tor framework the required current the devices need separately, so the
> regulator framework can get to know when to switch modes to satisfy the
> requirment. But a lot of drivers did not set load for peripherals. Some
> did setting and some did not, which sometimes caused problem when LPM
> of regulators is allowed. E.g. LDO12 supplies UFS and USB. UFS sets the
> load of AmA(HPM), while USB PHY does not set any(0mA LPM). In this case,
> USB can encounter insufficient power supply when UFS's going to sleep.
> 
> There is some discussion about this:
> https://lore.kernel.org/all/5tbevb5wv2s43pccytv4qol4yhq4s7iw2mmqp23vt3ujqd6xev@hkioqmwoitbd/
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 52 +++++---------------------------
>  1 file changed, 8 insertions(+), 44 deletions(-)
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


New warnings running 'make CHECK_DTBS=y qcom/qcs615-ride.dtb' for 20241211-bug-fix-qcs615-ride-dts-lpm-power-issue-v1-1-a08d12c415f0@quicinc.com:

arch/arm64/boot/dts/qcom/qcs615-ride.dtb: clock-controller@100000: 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/clock/qcom,qcs615-gcc.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: efuse@780000: compatible:0: 'qcom,qcs615-qfprom' is not one of ['qcom,apq8064-qfprom', 'qcom,apq8084-qfprom', 'qcom,ipq5332-qfprom', 'qcom,ipq6018-qfprom', 'qcom,ipq8064-qfprom', 'qcom,ipq8074-qfprom', 'qcom,ipq9574-qfprom', 'qcom,msm8226-qfprom', 'qcom,msm8916-qfprom', 'qcom,msm8974-qfprom', 'qcom,msm8976-qfprom', 'qcom,msm8996-qfprom', 'qcom,msm8998-qfprom', 'qcom,qcm2290-qfprom', 'qcom,qcs404-qfprom', 'qcom,sc7180-qfprom', 'qcom,sc7280-qfprom', 'qcom,sc8280xp-qfprom', 'qcom,sdm630-qfprom', 'qcom,sdm670-qfprom', 'qcom,sdm845-qfprom', 'qcom,sm6115-qfprom', 'qcom,sm6350-qfprom', 'qcom,sm6375-qfprom', 'qcom,sm8150-qfprom', 'qcom,sm8250-qfprom', 'qcom,sm8450-qfprom', 'qcom,sm8550-qfprom', 'qcom,sm8650-qfprom']
	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: efuse@780000: Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/efuse@780000: failed to match any schema with compatible: ['qcom,qcs615-qfprom', 'qcom,qfprom']
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: interrupt-controller@b220000: compatible:0: 'qcom,qcs615-pdc' is not one of ['qcom,qdu1000-pdc', 'qcom,sa8255p-pdc', 'qcom,sa8775p-pdc', 'qcom,sar2130p-pdc', 'qcom,sc7180-pdc', 'qcom,sc7280-pdc', 'qcom,sc8180x-pdc', 'qcom,sc8280xp-pdc', 'qcom,sdm670-pdc', 'qcom,sdm845-pdc', 'qcom,sdx55-pdc', 'qcom,sdx65-pdc', 'qcom,sdx75-pdc', 'qcom,sm4450-pdc', 'qcom,sm6350-pdc', 'qcom,sm8150-pdc', 'qcom,sm8250-pdc', 'qcom,sm8350-pdc', 'qcom,sm8450-pdc', 'qcom,sm8550-pdc', 'qcom,sm8650-pdc', 'qcom,x1e80100-pdc']
	from schema $id: http://devicetree.org/schemas/interrupt-controller/qcom,pdc.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/interrupt-controller@b220000: failed to match any schema with compatible: ['qcom,qcs615-pdc', 'qcom,pdc']
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: power-controller@c300000: '#power-domain-cells' does not match any of the regexes: '^(cx|mx|ebi)$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,aoss-qmp.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: mailbox@17c00000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,qcs615-apss-shared', 'qcom,sdm845-apss-shared'] is too short
	['qcom,qcs615-apss-shared', 'qcom,sdm845-apss-shared'] is too long
	'qcom,qcs615-apss-shared' is not one of ['qcom,ipq5018-apcs-apps-global', 'qcom,ipq5332-apcs-apps-global', 'qcom,ipq8074-apcs-apps-global', 'qcom,ipq9574-apcs-apps-global']
	'qcom,qcs615-apss-shared' is not one of ['qcom,qcs404-apcs-apps-global']
	'qcom,qcs615-apss-shared' is not one of ['qcom,msm8974-apcs-kpss-global', 'qcom,msm8976-apcs-kpss-global']
	'qcom,qcs615-apss-shared' is not one of ['qcom,msm8998-apcs-hmss-global', 'qcom,sdm660-apcs-hmss-global', 'qcom,sm4250-apcs-hmss-global', 'qcom,sm6115-apcs-hmss-global', 'qcom,sm6125-apcs-hmss-global']
	'qcom,qcs615-apss-shared' is not one of ['qcom,sc7180-apss-shared', 'qcom,sc8180x-apss-shared', 'qcom,sm8150-apss-shared']
	'qcom,qcs615-apss-shared' is not one of ['qcom,msm8916-apcs-kpss-global', 'qcom,msm8939-apcs-kpss-global', 'qcom,msm8953-apcs-kpss-global', 'qcom,msm8994-apcs-kpss-global', 'qcom,sdx55-apcs-gcc']
	'qcom,qcs615-apss-shared' is not one of ['qcom,ipq6018-apcs-apps-global', 'qcom,msm8996-apcs-hmss-global', 'qcom,qcm2290-apcs-hmss-global', 'qcom,sdm845-apss-shared']
	'qcom,ipq6018-apcs-apps-global' was expected
	'qcom,msm8916-apcs-kpss-global' was expected
	'qcom,msm8994-apcs-kpss-global' was expected
	'syscon' was expected
	from schema $id: http://devicetree.org/schemas/mailbox/qcom,apcs-kpss-global.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/mailbox@17c00000: failed to match any schema with compatible: ['qcom,qcs615-apss-shared', 'qcom,sdm845-apss-shared']
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: rsc@18200000: clock-controller:compatible:0: 'qcom,qcs615-rpmh-clk' is not one of ['qcom,qdu1000-rpmh-clk', 'qcom,sa8775p-rpmh-clk', 'qcom,sar2130p-rpmh-clk', 'qcom,sc7180-rpmh-clk', 'qcom,sc7280-rpmh-clk', 'qcom,sc8180x-rpmh-clk', 'qcom,sc8280xp-rpmh-clk', 'qcom,sdm670-rpmh-clk', 'qcom,sdm845-rpmh-clk', 'qcom,sdx55-rpmh-clk', 'qcom,sdx65-rpmh-clk', 'qcom,sdx75-rpmh-clk', 'qcom,sm4450-rpmh-clk', 'qcom,sm6350-rpmh-clk', 'qcom,sm8150-rpmh-clk', 'qcom,sm8250-rpmh-clk', 'qcom,sm8350-rpmh-clk', 'qcom,sm8450-rpmh-clk', 'qcom,sm8550-rpmh-clk', 'qcom,sm8650-rpmh-clk', 'qcom,x1e80100-rpmh-clk']
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/rsc@18200000/clock-controller: failed to match any schema with compatible: ['qcom,qcs615-rpmh-clk']
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: usb@a6f8800: compatible:0: 'qcom,qcs615-dwc3' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq5018-dwc3', 'qcom,ipq5332-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,qcs8300-dwc3', 'qcom,qdu1000-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sar2130p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8180x-dwc3', 'qcom,sc8180x-dwc3-mp', 'qcom,sc8280xp-dwc3', 'qcom,sc8280xp-dwc3-mp', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sdx75-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc3', 'qcom,sm8550-dwc3', 'qcom,sm8650-dwc3', 'qcom,x1e80100-dwc3', 'qcom,x1e80100-dwc3-mp']
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/usb@a6f8800: failed to match any schema with compatible: ['qcom,qcs615-dwc3', 'qcom,dwc3']






