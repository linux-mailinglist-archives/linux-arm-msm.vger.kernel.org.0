Return-Path: <linux-arm-msm+bounces-20153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C058CB41E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 21:19:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0EC501C2279E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 19:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB4311482F1;
	Tue, 21 May 2024 19:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fa959MiU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBE41865C;
	Tue, 21 May 2024 19:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716319169; cv=none; b=QNTRPzV2xoKFNQDZN6krDd2BIc/PqjjS74AXfCYfhgctVX7gHIUa0LL6uUwrs4k1FCjhrmLh9wP4aE0fqN3BjNcs4D9tTV3RseHz9a/U1soByI0xmfPLKbuvX78j+JpYcFjtZmQrzKEXRlFonBVL5VhsQ/6NqFEhezKdlOl8Luw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716319169; c=relaxed/simple;
	bh=9PsPQ+TaFN1BABpNNuyP6KBXDuJrLKvwjB4V1iiMGkA=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=gwxwCVhKQ34eRy4E/q+HtSAAp0lu0V0wFz1oj+uhpxbDzwQ1Ljlyotuf3L9JMnckBi3bKVa5DmJegoKMkhMytJx8JXy5bhhATS1kvw+bPV+3Ej/JfSHnQifK8Fq0Bth955XzLL84Sdo1qfOb2WRMT6Fjlbsap5nH+QnyFsEfWbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fa959MiU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26F07C2BD11;
	Tue, 21 May 2024 19:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716319169;
	bh=9PsPQ+TaFN1BABpNNuyP6KBXDuJrLKvwjB4V1iiMGkA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Fa959MiUa5Yp17axqby15IvXRfTacC4HGcEDjw/svguqJyRKo6wXjbqzsDUDISEN/
	 k/n0nV1zdhApRpzqJAhA5vD2niGOdc7IfWCIA+dgvffWBCmqQ5m/pjO/XjkJxoTUvL
	 VE/7VD/qLmVnVXnWE+UbSr9/dtA4rqfFtsZkpeRbQ71X9QsnIpP940OpHnYFUh3Ihm
	 Nl0HYLKKfUu8gEJv0TQW4NSvadgvin1R4f8e4CSoVMP9DZ2bTUB48s2DDgRphp60YM
	 kt7H5T/a9+Zvu4cGuRmJmr1cglSZzoyQStxmxw0Hii57mjInzfRdpms0fd7C4/6YTl
	 YMRi2atICTAIQ==
Date: Tue, 21 May 2024 14:19:28 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Jon Hunter <jonathanh@nvidia.org>, Bjorn Andersson <andersson@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sumit Garg <sumit.garg@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 linux-arm-msm@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>, 
 linux-arm-kernel@lists.infradead.org, Michal Simek <michal.simek@amd.com>, 
 Andy Gross <agross@kernel.org>, "Humphreys, Jonathan" <j-humphreys@ti.com>, 
 Amrit Anand <quic_amrianan@quicinc.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Simon Glass <sjg@chromium.org>, 
 Frank Rowand <frowand.list@gmail.com>, Julius Werner <jwerner@chromium.org>, 
 Rob Herring <robh+dt@kernel.org>, Doug Anderson <dianders@chromium.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 boot-architecture@lists.linaro.org
In-Reply-To: <20240521-board-ids-v3-2-e6c71d05f4d2@quicinc.com>
References: <20240521-board-ids-v3-0-e6c71d05f4d2@quicinc.com>
 <20240521-board-ids-v3-2-e6c71d05f4d2@quicinc.com>
Message-Id: <171631916715.486483.100250465672260401.robh@kernel.org>
Subject: Re: [PATCH RFC v3 2/9] dt-bindings: board: Introduce board-id


On Tue, 21 May 2024 11:37:59 -0700, Elliot Berman wrote:
> Device manufcturers frequently ship multiple boards or SKUs under a
> single softwre package. These software packages ship multiple devicetree
> blobs and require some mechanims to pick the correct DTB for the boards
> that use the software package. This patch introduces a common language
> for adding board identifiers to devicetrees.
> 
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> ---
>  .../devicetree/bindings/board/board-id.yaml        | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/opp/opp-v2.example.dtb: opp-table-0: opp-1200000000:opp-microvolt-slow:0: [915000, 900000, 925000, 925000, 910000, 935000] is too long
	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/opp/opp-v2.example.dtb: opp-table-0: opp-1200000000:opp-microvolt-fast:0: [975000, 970000, 985000, 965000, 960000, 975000] is too long
	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/opp/opp-v2.example.dtb: opp-table-0: Unevaluated properties are not allowed ('opp-1000000000', 'opp-1200000000', 'opp-shared' were unexpected)
	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
compress: size (5) error for type uint32-matrix
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.example.dtb: uimage@100000: compress: b'lzma\x00' is not of type 'object', 'array', 'boolean', 'null'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
marvell,pad-type: size (11) error for type uint32-matrix
marvell,pad-type: size (3) error for type uint32-matrix
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mmc/marvell,xenon-sdhci.example.dtb: mmc@aa0000: marvell,pad-type: b'fixed-1-8v\x00' is not of type 'array'
	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mmc/marvell,xenon-sdhci.example.dtb: mmc@aa0000: marvell,pad-type: b'fixed-1-8v\x00' is not of type 'array'
	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mmc/marvell,xenon-sdhci.example.dtb: mmc@aa0000: Unevaluated properties are not allowed ('marvell,pad-type' was unexpected)
	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mmc/marvell,xenon-sdhci.example.dtb: mmc@aa0000: marvell,pad-type: b'fixed-1-8v\x00' is not of type 'object', 'array', 'boolean', 'null'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mmc/marvell,xenon-sdhci.example.dtb: mmc@ab0000: marvell,pad-type: b'sd\x00' is not of type 'array'
	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mmc/marvell,xenon-sdhci.example.dtb: mmc@ab0000: marvell,pad-type: b'sd\x00' is not of type 'array'
	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mmc/marvell,xenon-sdhci.example.dtb: mmc@ab0000: Unevaluated properties are not allowed ('marvell,pad-type' was unexpected)
	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mmc/marvell,xenon-sdhci.example.dtb: mmc@ab0000: marvell,pad-type: b'sd\x00' is not of type 'object', 'array', 'boolean', 'null'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/power/supply/sc27xx-fg.example.dtb: battery: ocv-capacity-table-0:0: [4185000, 100, 4113000, 95, 4066000, 90, 4022000, 85, 3983000, 80, 3949000, 75, 3917000, 70, 3889000, 65, 3864000, 60, 3835000, 55, 3805000, 50, 3787000, 45, 3777000, 40, 3773000, 35, 3770000, 30, 3765000, 25, 3752000, 20, 3724000, 15, 3680000, 10, 3605000, 5, 3400000, 0] is too long
	from schema $id: http://devicetree.org/schemas/power/supply/battery.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/power/supply/battery.example.dtb: battery: ocv-capacity-table-0:0: [4185000, 100, 4113000, 95, 4066000, 90] is too long
	from schema $id: http://devicetree.org/schemas/power/supply/battery.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/power/supply/battery.example.dtb: battery: ocv-capacity-table-1:0: [4200000, 100, 4185000, 95, 4113000, 90] is too long
	from schema $id: http://devicetree.org/schemas/power/supply/battery.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/power/supply/battery.example.dtb: battery: ocv-capacity-table-2:0: [4250000, 100, 4200000, 95, 4185000, 90] is too long
	from schema $id: http://devicetree.org/schemas/power/supply/battery.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/power/supply/battery.example.dtb: battery: ocv-capacity-celsius: 'anyOf' conditional failed, one must be fixed:
	[4294967286, 0, 10] is too long
	4294967286 is greater than the maximum of 2147483647
	from schema $id: http://devicetree.org/schemas/property-units.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/power/supply/battery.example.dtb: battery: operating-range-celsius: 'anyOf' conditional failed, one must be fixed:
	[4294967266, 50] is too long
	4294967266 is greater than the maximum of 2147483647
	from schema $id: http://devicetree.org/schemas/property-units.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/power/supply/battery.example.dtb: battery: ambient-celsius: 'anyOf' conditional failed, one must be fixed:
	[4294967291, 50] is too long
	4294967291 is greater than the maximum of 2147483647
	from schema $id: http://devicetree.org/schemas/property-units.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/iio/afe/temperature-transducer.example.dtb: temperature-sensor-0: sense-offset-millicelsius: 'anyOf' conditional failed, one must be fixed:
	4294694146 is greater than the maximum of 2147483647
	from schema $id: http://devicetree.org/schemas/property-units.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/iio/afe/temperature-transducer.example.dtb: temperature-sensor-1: sense-offset-millicelsius: 'anyOf' conditional failed, one must be fixed:
	4294694146 is greater than the maximum of 2147483647
	from schema $id: http://devicetree.org/schemas/property-units.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-tsa.example.dtb: tsa@ae0: tdm@0:fsl,tx-ts-routes:0: [2, 0, 24, 3, 1, 0, 5, 2] is too long
	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,cpm1-tsa.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-tsa.example.dtb: tsa@ae0: tdm@0:fsl,rx-ts-routes:0: [2, 0, 24, 3, 1, 0, 5, 2] is too long
	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,cpm1-tsa.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240521-board-ids-v3-2-e6c71d05f4d2@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


