Return-Path: <linux-arm-msm+bounces-83582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F56C8E0CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 12:30:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8B6A634EF2E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 11:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C593432C329;
	Thu, 27 Nov 2025 11:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J5Evt9o+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D2E32BF24;
	Thu, 27 Nov 2025 11:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764242992; cv=none; b=g7kSNRvUcPbTcbkk8BulAJG+QGosEjn1x3aTbr0zsGcE1O67BR+XivAACdHtMMqPEEVj5qWSicb/JnPGganFDoWled6+fACp5l0mvbUQj9EYxuePwRmHFQuL1P7cyh2lkit//Tc6xuPPfo7q0HlbLYt5X5vnpJT4VbOp0UoMWtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764242992; c=relaxed/simple;
	bh=CQgoFBd79VcsQ4RZAJQcFjQ439SnTQyomNvXL8kZETQ=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=lMC4ItQj31/hsypuho6/vvtM5rY5xvtqos2F3G1DiO2r6qdNb/FvU50SKSMXCb2oGNJ9hdvEyU1KwkSIsTiGR7nOvNoOIx5BgCpsx/e3EW8Q9ibMIDa+lo6BxAjllH0NKnEMadaXjU3wzJ5gLnkIqgZa/aosm3St/ZlbtKY1wdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J5Evt9o+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD929C4CEF8;
	Thu, 27 Nov 2025 11:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764242992;
	bh=CQgoFBd79VcsQ4RZAJQcFjQ439SnTQyomNvXL8kZETQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=J5Evt9o+U9srFc6Jzfb8in4lXjd4vFmP6GfTCOc8sqYg9la5nlDeAPCpzknXod8GL
	 eotC959ferZV9gQqy/Y7g7PP+ZONm2U9Fnd/vq5NhTBWn1AS76mxhIZEvhm7SCF9pi
	 HcTQ0l1LV1afGx2XXYIaeV0KsPq7q1lfOgmoZEqsCwmWX3zDZ/lgG+zkOX8m+39QJj
	 yL2jvLJR4rVk2FPcH8SScaIq7OEafl+nELueJZJrPDg6aIkPB0xbjT4L2wYet451X3
	 fZEkT7elK4vLEVQws7qVYB+oVKAIw1QHmPrqurGygFHUpD2zwnUzrYYIcQoE3sEMNW
	 9r6szCqx5WNPQ==
Date: Thu, 27 Nov 2025 05:29:50 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krishna.kurapati@oss.qualcomm.com, faisal.hassan@oss.qualcomm.com, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, 
 jack.pham@oss.qualcomm.com, Konrad Dybcio <konradybcio@kernel.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, linux-usb@vger.kernel.org, 
 andersson@kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Sriram Dash <sriram.dash@oss.qualcomm.com>
In-Reply-To: <20251127-controller_scmi_upstream-v1-1-38bcca513c28@oss.qualcomm.com>
References: <20251127-controller_scmi_upstream-v1-0-38bcca513c28@oss.qualcomm.com>
 <20251127-controller_scmi_upstream-v1-1-38bcca513c28@oss.qualcomm.com>
Message-Id: <176424299042.3819969.16561802248968376640.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: usb: qcom,snps-dwc3: Add support for
 firmware-managed resources


On Thu, 27 Nov 2025 16:01:44 +0530, Sriram Dash wrote:
> On Qualcomm automotive SoC sa8255p, platform resources like clocks,
> interconnect, resets, regulators and GDSC are configured remotely by
> firmware.
> 
> PM OPP is used to abstract these resources in firmware and SCMI perf
> protocol is used to request resource operations by using runtime PM
> framework APIs such as pm_runtime_get/put_sync to signal firmware
> for managing resources accordingly for respective perf levels.
> 
> "qcom,snps-dwc3-fw-managed" compatible helps determine if
> the device's resources are managed by firmware.
> Additionally, it makes the power-domains property mandatory
> and excludes the clocks property for the controller.
> 
> Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    | 173 +++++++++++++--------
>  1 file changed, 111 insertions(+), 62 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/qcom,dwc3.example.dtb: usb@a6f8800 (qcom,sdm845-dwc3): #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/qcom,dwc3.example.dtb: usb@a6f8800 (qcom,sdm845-dwc3): #size-cells: 0 was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/qcom,dwc3.example.dtb: usb@a6f8800 (qcom,sdm845-dwc3): interrupt-names:0: 'dwc_usb3' was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/qcom,dwc3.example.dtb: usb@a6f8800 (qcom,sdm845-dwc3): interrupt-names:1: 'pwr_event' was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/qcom,dwc3.example.dtb: usb@a6f8800 (qcom,sdm845-dwc3): interrupt-names:2: 'hs_phy_irq' was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/qcom,dwc3.example.dtb: usb@a6f8800 (qcom,sdm845-dwc3): interrupt-names:3: 'dp_hs_phy_irq' was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/qcom,dwc3.example.dtb: usb@a6f8800 (qcom,sdm845-dwc3): interrupt-names:4: 'dm_hs_phy_irq' was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/qcom,dwc3.example.dtb: usb@a6f8800 (qcom,sdm845-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
	'qcom,sdm845-dwc3' is not one of ['qcom,sa8255p-dwc3']
	'qcom,snps-dwc3' was expected
	'qcom,snps-dwc3-fw-managed' was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/qcom,dwc3.example.dtb: usb@a6f8800 (qcom,sdm845-dwc3): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'ranges', 'usb@a600000' were unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251127-controller_scmi_upstream-v1-1-38bcca513c28@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


