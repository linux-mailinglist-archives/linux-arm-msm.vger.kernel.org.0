Return-Path: <linux-arm-msm+bounces-20278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E691A8CCA5C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 03:23:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CCD91F21C07
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 01:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1769C17CD;
	Thu, 23 May 2024 01:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a9UI8cjc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7937EC7;
	Thu, 23 May 2024 01:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716427432; cv=none; b=TfBpoNchCM6A95Q3gJneBJZYTi+6TGrGZB69hZ7MvWZ5oV2BIup/yShvVziTH9Hn5P6D+zZsS2+mAtNf8m+Jo7C2mMek3000wEkyQQMaoM8wpTA6btES1LvnpbDQL/b2NCsBXHXdjcZS7RIuXwd2+X3oU2/fGmGPSoUmmdUdzP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716427432; c=relaxed/simple;
	bh=lrYPyou6GmUkuNkg168NThhIN99DFmu/CkC/pcafMpU=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=kbbNLmdbjHJdULOu7t1ZH/zUOxSezFloLfbYHUywDVtsSVTDFPAwzOVf3RiP1wm1/sjAPJrLUDw2tPbaGFVcaXDAtI/qua97EEdF5Ja4ejgia59BvTPTdSx9T8Lpy388kRNv9m/jBAN/Al9arAez9u085V++xe+i1o4l8PcDVEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a9UI8cjc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23063C2BBFC;
	Thu, 23 May 2024 01:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716427431;
	bh=lrYPyou6GmUkuNkg168NThhIN99DFmu/CkC/pcafMpU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=a9UI8cjcr7yBXmgK3G3Iq3Fi1CuTXmpqVjQlWE/hXy+AnwKIZ/6UKJVeQ7dHNQ/Np
	 awRHaA8gGqkEB3yZlQ21/Has3Mfo9Qq6PYa99qWXoP5NA3INKL3aioSAWdANfVBn9V
	 KKhi3nV5/N4bRaO6aJgrru2rc0AaG/TL897o+vplLedYCWudHufTm6hdfCgcHfhp5f
	 SCpl5xb1t8mYlklON6iwsiN91Z94OIvudHz013EtuuqkJB5wDca9PR9CMAdZjNOzQR
	 ZLUKVf9j3eQNqZravRHhnF2TsP/zO//NHr4wxOFVuqCJ1Ey2FmGWOfi+x+rG919vrx
	 aWQ1dpudOUJEA==
Date: Wed, 22 May 2024 20:23:50 -0500
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
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Amrit Anand <quic_amrianan@quicinc.com>, Simon Glass <sjg@chromium.org>, 
 Julius Werner <jwerner@chromium.org>, Frank Rowand <frowand.list@gmail.com>, 
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
 Michal Simek <michal.simek@amd.com>, Conor Dooley <conor@kernel.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 "Humphreys, Jonathan" <j-humphreys@ti.com>, 
 Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
 Andy Gross <agross@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Sumit Garg <sumit.garg@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, boot-architecture@lists.linaro.org, 
 linux-arm-msm@vger.kernel.org, Doug Anderson <dianders@chromium.org>
In-Reply-To: <20240522-board-ids-v4-2-a173277987f5@quicinc.com>
References: <20240522162545887-0700.eberman@hu-eberman-lv.qualcomm.com>
 <20240522-board-ids-v4-2-a173277987f5@quicinc.com>
Message-Id: <171642742999.680723.11765315495034693179.robh@kernel.org>
Subject: Re: [PATCH RFC v3 2/9] dt-bindings: board: Introduce board-id


On Wed, 22 May 2024 16:54:23 -0700, Elliot Berman wrote:
> Device manufcturers frequently ship multiple boards or SKUs under a
> single softwre package. These software packages ship multiple devicetree
> blobs and require some mechanims to pick the correct DTB for the boards
> that use the software package. This patch introduces a common language
> for adding board identifiers to devicetrees.
> 
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> ---
>  .../devicetree/bindings/board/board-id.yaml        | 71 ++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
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
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/board/board-id.example.dtb: /: 'model' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml#
Documentation/devicetree/bindings/board/board-id.example.dtb: /: failed to match any schema with compatible: ['example']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240522-board-ids-v4-2-a173277987f5@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


