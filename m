Return-Path: <linux-arm-msm+bounces-80236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E5446C2F9A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 08:26:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AAE53B29A2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 07:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FEDD305E1F;
	Tue,  4 Nov 2025 07:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ocUtsvgi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFE0250BEC;
	Tue,  4 Nov 2025 07:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762241199; cv=none; b=H8MjiWG1+ZJTdrEEs5JyjFZgC5eAu4WrO1rwJShyb2zPy9kDXr57hNN73uEUCYuhmXUYP/G/CFTouJIakt9ftSSsifgc651RUJHP93LqdhL06XRzK5TKK5H6DNYvbhSt/7RLxOMxdqC4Gl23Xha2xex9+eLy0V3677Zx8JBRNe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762241199; c=relaxed/simple;
	bh=MvZdqULSUCGLP8ovilMo+2Y9CF6GT0CNbj4qpZBqCBg=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=KI+DjNWMfe9JiqKJaVA4b8b9TWbgztR4PvyslZyMh0QqCL2uxysBynb+4Ei9L9Peqd3Xt8see3jBzGzw3V2MPDeijwUSzBtCNzKTNFSrPloVWelpsgu7guEKJwMVN75d/GjrabC1Knh63T72bBjgBxGAtgObSNBSX6vjQX0srpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ocUtsvgi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D116C4CEF8;
	Tue,  4 Nov 2025 07:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762241198;
	bh=MvZdqULSUCGLP8ovilMo+2Y9CF6GT0CNbj4qpZBqCBg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ocUtsvgigHh1WTV64zCJgoyY9AV1f5sjHE1zfO4Pr1kUYDvcz1Oy3Oh7MWqHsVs/8
	 SwnSOeKKS+4Ehfl2n2Xu92Q9C+LXFoh+KfcyRBd7juCuvNb0M2WidqnECsH8ZvdyFr
	 X2uagGve0J3a6dgmBiB+O1XHk4KLQk6wEY+P9AG9CnsZokUSOLhfN6jXZ6l0FWFfdS
	 Rs8mGZD2YRJL7TpF2ozw4YhnAeQe/YG/ATVyYZR/M7jj/KKHMKEpICiayBJNuLI/Hm
	 F9f4cZzvTm/U16Bc0/7aSvWLHfD51sjpw/nLZhOM/HuyPTp736ZwegNHP+yS47bclb
	 zKD74v4nhtFwQ==
Date: Tue, 04 Nov 2025 01:26:36 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: suzuki.poulose@arm.com, coresight@lists.linaro.org, 
 devicetree@vger.kernel.org, andersson@kernel.org, kernel@oss.qualcomm.com, 
 linux-arm-kernel@lists.infradead.org, alexander.shishkin@linux.intel.com, 
 mike.leach@linaro.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
To: Songwei Chai <songwei.chai@oss.qualcomm.com>
In-Reply-To: <20251104064043.88972-2-songwei.chai@oss.qualcomm.com>
References: <20251104064043.88972-1-songwei.chai@oss.qualcomm.com>
 <20251104064043.88972-2-songwei.chai@oss.qualcomm.com>
Message-Id: <176224119672.1155158.6728004468428794735.robh@kernel.org>
Subject: Re: [PATCH v7 1/7] dt-bindings: arm: Add support for Qualcomm TGU
 trace


On Mon, 03 Nov 2025 22:40:37 -0800, Songwei Chai wrote:
> The Trigger Generation Unit (TGU) is designed to detect patterns or
> sequences within a specific region of the System on Chip (SoC). Once
> configured and activated, it monitors sense inputs and can detect a
> pre-programmed state or sequence across clock cycles, subsequently
> producing a trigger.
> 
>    TGU configuration space
>         offset table
>  x-------------------------x
>  |                         |
>  |                         |
>  |                         |                           Step configuration
>  |                         |                             space layout
>  |   coresight management  |                           x-------------x
>  |        registers        |                     |---> |             |
>  |                         |                     |     |  reserve    |
>  |                         |                     |     |             |
>  |-------------------------|                     |     |-------------|
>  |                         |                     |     | priority[3] |
>  |         step[7]         |<--                  |     |-------------|
>  |-------------------------|   |                 |     | priority[2] |
>  |                         |   |                 |     |-------------|
>  |           ...           |   |Steps region     |     | priority[1] |
>  |                         |   |                 |     |-------------|
>  |-------------------------|   |                 |     | priority[0] |
>  |                         |<--                  |     |-------------|
>  |         step[0]         |-------------------->      |             |
>  |-------------------------|                           |  condition  |
>  |                         |                           |             |
>  |     control and status  |                           x-------------x
>  |           space         |                           |             |
>  x-------------------------x                           |Timer/Counter|
>                                                        |             |
> 						       x-------------x
> TGU Configuration in Hardware
> 
> The TGU provides a step region for user configuration, similar
> to a flow chart. Each step region consists of three register clusters:
> 
> 1.Priority Region: Sets the required signals with priority.
> 2.Condition Region: Defines specific requirements (e.g., signal A
> reaches three times) and the subsequent action once the requirement is
> met.
> 3.Timer/Counter (Optional): Provides timing or counting functionality.
> 
> Add a new tgu.yaml file to describe the bindings required to
> define the TGU in the device trees.
> 
> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/arm/qcom,tgu.yaml     | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/qcom,tgu.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Warning: Duplicate compatible "arm,primecell" found in schemas matching "$id":
	http://devicetree.org/schemas/arm/primecell.yaml
	http://devicetree.org/schemas/arm/qcom,tgu.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/arm,coresight-tmc.example.dtb: etr@20070000 (arm,coresight-tmc): 'memory-region', 'memory-region-names', 'out-ports' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/arm,coresight-tmc.example.dtb: etr@20070000 (arm,coresight-tmc): compatible:0: 'qcom,tgu' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.example.dtb: tpda@6004000 (qcom,coresight-tpda): 'out-ports' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.example.dtb: tpda@6004000 (qcom,coresight-tpda): compatible:0: 'qcom,tgu' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.example.dtb: tpda@6004000 (qcom,coresight-tpda): in-ports: '#address-cells', '#size-cells', 'port@0' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/sp810.example.dtb: sysctl@20000 (arm,sp810): '#clock-cells', 'clock-output-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/sp810.example.dtb: sysctl@20000 (arm,sp810): clock-names:0: 'apb_pclk' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/sp810.example.dtb: sysctl@20000 (arm,sp810): clock-names: ['refclk', 'timclk', 'apb_pclk'] is too long
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/sp810.example.dtb: sysctl@20000 (arm,sp810): clocks: [[4294967295], [4294967295], [4294967295]] is too long
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/sp810.example.dtb: sysctl@20000 (arm,sp810): compatible:0: 'qcom,tgu' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.example.dtb: funnel@20040000 (arm,coresight-dynamic-funnel): 'out-ports' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.example.dtb: funnel@20040000 (arm,coresight-dynamic-funnel): compatible:0: 'qcom,tgu' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.example.dtb: funnel@20040000 (arm,coresight-dynamic-funnel): in-ports: '#address-cells', '#size-cells', 'port@0', 'port@1', 'port@2' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.example.dtb: tpiu@e3c05000 (arm,coresight-tpiu): compatible:0: 'qcom,tgu' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/arm,coresight-etm.example.dtb: ptm@2201c000 (arm,coresight-etm3x): 'cpu', 'out-ports' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/arm,coresight-etm.example.dtb: ptm@2201c000 (arm,coresight-etm3x): compatible:0: 'qcom,tgu' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/arm,coresight-etm.example.dtb: ptm@2201d000 (arm,coresight-etm3x): 'cpu', 'out-ports' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/arm,coresight-etm.example.dtb: ptm@2201d000 (arm,coresight-etm3x): compatible:0: 'qcom,tgu' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/arm,coresight-etb10.example.dtb: etb@20010000 (arm,coresight-etb10): compatible:0: 'qcom,tgu' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/arm,coresight-cti.example.dtb: cti@20020000 (arm,coresight-cti): compatible:0: 'qcom,tgu' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/arm,coresight-cti.example.dtb: cti@859000 (arm,coresight-cti-v8-arch): 'arm,cs-dev-assoc', 'cpu' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/arm,coresight-cti.example.dtb: cti@859000 (arm,coresight-cti-v8-arch): compatible:0: 'qcom,tgu' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/arm,coresight-cti.example.dtb: cti@859000 (arm,coresight-cti-v8-arch): compatible:1: 'arm,primecell' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/arm,coresight-cti.example.dtb: cti@859000 (arm,coresight-cti-v8-arch): compatible: ['arm,coresight-cti-v8-arch', 'arm,coresight-cti', 'arm,primecell'] is too long
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/arm,coresight-cti.example.dtb: cti@858000 (arm,coresight-cti): '#address-cells', '#size-cells', 'arm,cti-ctm-id', 'trig-conns@0', 'trig-conns@1' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/arm,coresight-cti.example.dtb: cti@858000 (arm,coresight-cti): compatible:0: 'qcom,tgu' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/arm,coresight-cti.example.dtb: cti@20110000 (arm,coresight-cti): '#address-cells', '#size-cells', 'trig-conns@0', 'trig-conns@1', 'trig-conns@2' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/arm,coresight-cti.example.dtb: cti@20110000 (arm,coresight-cti): compatible:0: 'qcom,tgu' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.example.dtb: tpdm@684c000 (qcom,coresight-tpdm): 'out-ports', 'qcom,dsb-element-bits', 'qcom,dsb-msrs-num' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.example.dtb: tpdm@684c000 (qcom,coresight-tpdm): compatible:0: 'qcom,tgu' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.example.dtb: tpdm@6c29000 (qcom,coresight-tpdm): 'out-ports', 'qcom,cmb-element-bits', 'qcom,cmb-msrs-num' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.example.dtb: tpdm@6c29000 (qcom,coresight-tpdm): compatible:0: 'qcom,tgu' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/arm,coresight-cpu-debug.example.dtb: debug@f6590000 (arm,coresight-cpu-debug): 'cpu' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/arm,coresight-cpu-debug.example.dtb: debug@f6590000 (arm,coresight-cpu-debug): compatible:0: 'qcom,tgu' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/arm,coresight-stm.example.dtb: stm@20100000 (arm,coresight-stm): 'out-ports', 'reg-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/arm,coresight-stm.example.dtb: stm@20100000 (arm,coresight-stm): compatible:0: 'qcom,tgu' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/arm,coresight-stm.example.dtb: stm@20100000 (arm,coresight-stm): reg: [[537919488, 4096], [671088640, 1572864]] is too long
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.example.dtb: tn@109ab000 (qcom,coresight-tnoc): 'out-ports' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.example.dtb: tn@109ab000 (qcom,coresight-tnoc): compatible:0: 'qcom,tgu' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.example.dtb: tn@109ab000 (qcom,coresight-tnoc): in-ports: '#address-cells', '#size-cells', 'port@0' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/arm,coresight-catu.example.dtb: catu@207e0000 (arm,coresight-catu): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/arm,coresight-catu.example.dtb: catu@207e0000 (arm,coresight-catu): compatible:0: 'qcom,tgu' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-replicator.example.dtb: replicator@20120000 (arm,coresight-dynamic-replicator): 'out-ports' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-replicator.example.dtb: replicator@20120000 (arm,coresight-dynamic-replicator): compatible:0: 'qcom,tgu' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/watchdog/arm,sp805.example.dtb: watchdog@66090000 (arm,sp805): 'interrupts', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/watchdog/arm,sp805.example.dtb: watchdog@66090000 (arm,sp805): clock-names:0: 'apb_pclk' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/watchdog/arm,sp805.example.dtb: watchdog@66090000 (arm,sp805): clock-names: ['wdog_clk', 'apb_pclk'] is too long
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/watchdog/arm,sp805.example.dtb: watchdog@66090000 (arm,sp805): clocks: [[4294967295], [4294967295]] is too long
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/watchdog/arm,sp805.example.dtb: watchdog@66090000 (arm,sp805): compatible:0: 'qcom,tgu' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/memory-controllers/arm,pl172.example.dtb: memory-controller@40005000 (arm,pl172): '#address-cells', '#size-cells', 'cs0', 'ranges' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/memory-controllers/arm,pl172.example.dtb: memory-controller@40005000 (arm,pl172): clock-names:0: 'apb_pclk' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/memory-controllers/arm,pl172.example.dtb: memory-controller@40005000 (arm,pl172): clock-names: ['mpmcclk', 'apb_pclk'] is too long
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/memory-controllers/arm,pl172.example.dtb: memory-controller@40005000 (arm,pl172): clocks: [[4294967295, 1144], [4294967295, 1072]] is too long
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/memory-controllers/arm,pl172.example.dtb: memory-controller@40005000 (arm,pl172): compatible:0: 'qcom,tgu' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/memory-controllers/arm,pl35x-smc.example.dtb: memory-controller@e000e000 (arm,pl353-smc-r2p1): '#address-cells', '#size-cells', 'nand-controller@0,0', 'ranges' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/memory-controllers/arm,pl35x-smc.example.dtb: memory-controller@e000e000 (arm,pl353-smc-r2p1): clock-names:0: 'apb_pclk' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/memory-controllers/arm,pl35x-smc.example.dtb: memory-controller@e000e000 (arm,pl353-smc-r2p1): clock-names: ['memclk', 'apb_pclk'] is too long
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/memory-controllers/arm,pl35x-smc.example.dtb: memory-controller@e000e000 (arm,pl353-smc-r2p1): clocks: [[4294967295, 11], [4294967295, 44]] is too long
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/memory-controllers/arm,pl35x-smc.example.dtb: memory-controller@e000e000 (arm,pl353-smc-r2p1): compatible:0: 'qcom,tgu' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/serio/arm,pl050.example.dtb: serio@70000 (arm,pl050): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/serio/arm,pl050.example.dtb: serio@70000 (arm,pl050): clock-names:0: 'apb_pclk' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/serio/arm,pl050.example.dtb: serio@70000 (arm,pl050): clock-names: ['KMIREFCLK', 'apb_pclk'] is too long
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/serio/arm,pl050.example.dtb: serio@70000 (arm,pl050): clocks: [[4294967295], [4294967295]] is too long
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/serio/arm,pl050.example.dtb: serio@70000 (arm,pl050): compatible:0: 'qcom,tgu' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mailbox/arm,mhu.example.dtb: mailbox@2b1f0000 (arm,mhu): '#mbox-cells', 'interrupts' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mailbox/arm,mhu.example.dtb: mailbox@2b1f0000 (arm,mhu): compatible:0: 'qcom,tgu' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mailbox/arm,mhu.example.dtb: mailbox@2b2f0000 (arm,mhu-doorbell): '#mbox-cells', 'interrupts' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mailbox/arm,mhu.example.dtb: mailbox@2b2f0000 (arm,mhu-doorbell): compatible:0: 'qcom,tgu' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mailbox/arm,mhuv2.example.dtb: mailbox@2b1f0000 (arm,mhuv2-tx): '#mbox-cells', 'arm,mhuv2-protocols', 'interrupts' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mailbox/arm,mhuv2.example.dtb: mailbox@2b1f0000 (arm,mhuv2-tx): compatible:0: 'qcom,tgu' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mailbox/arm,mhuv2.example.dtb: mailbox@2b1f1000 (arm,mhuv2-rx): '#mbox-cells', 'arm,mhuv2-protocols', 'interrupts' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mailbox/arm,mhuv2.example.dtb: mailbox@2b1f1000 (arm,mhuv2-rx): compatible:0: 'qcom,tgu' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/samsung,exynos5433-lpass.example.dtb: dma-controller@11420000 (arm,pl330): '#dma-cells', 'dma-channels', 'dma-requests', 'interrupts', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/samsung,exynos5433-lpass.example.dtb: dma-controller@11420000 (arm,pl330): compatible:0: 'qcom,tgu' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/timer/arm,sp804.example.dtb: timer@fc800000 (arm,sp804): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/timer/arm,sp804.example.dtb: timer@fc800000 (arm,sp804): clock-names:0: 'apb_pclk' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/timer/arm,sp804.example.dtb: timer@fc800000 (arm,sp804): clock-names: ['timer1', 'timer2', 'apb_pclk'] is too long
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/timer/arm,sp804.example.dtb: timer@fc800000 (arm,sp804): clocks: [[4294967295], [4294967295], [4294967295]] is too long
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/timer/arm,sp804.example.dtb: timer@fc800000 (arm,sp804): compatible:0: 'qcom,tgu' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dma/arm,pl330.example.dtb: dma-controller@12680000 (arm,pl330): '#dma-cells', 'interrupts' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dma/arm,pl330.example.dtb: dma-controller@12680000 (arm,pl330): compatible:0: 'qcom,tgu' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dma/arm,pl330.example.dtb: dma-controller@12680000 (arm,pl330): 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dma/arm,pl330.example.dtb: dma-controller@12680000 (arm,pl330): 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dma/arm-pl08x.example.dtb: dma-controller@10130000 (arm,pl080): '#dma-cells', 'interrupts', 'lli-bus-interface-ahb1', 'lli-bus-interface-ahb2', 'mem-bus-interface-ahb2', 'memcpy-burst-size', 'memcpy-bus-width' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dma/arm-pl08x.example.dtb: dma-controller@10130000 (arm,pl080): compatible:0: 'qcom,tgu' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dma/arm-pl08x.example.dtb: dma-controller@67000000 (faraday,ftdma020): '#dma-cells', 'arm,primecell-periphid', 'interrupts', 'lli-bus-interface-ahb2', 'mem-bus-interface-ahb2', 'memcpy-burst-size', 'memcpy-bus-width', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dma/arm-pl08x.example.dtb: dma-controller@67000000 (faraday,ftdma020): compatible:0: 'qcom,tgu' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dma/arm-pl08x.example.dtb: dma-controller@67000000 (faraday,ftdma020): compatible:1: 'arm,primecell' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dma/arm-pl08x.example.dtb: dma-controller@67000000 (faraday,ftdma020): compatible: ['faraday,ftdma020', 'arm,pl080', 'arm,primecell'] is too long
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dtb: mmc@5000 (arm,pl180): 'interrupts-extended' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dtb: mmc@5000 (arm,pl180): clock-names:0: 'apb_pclk' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dtb: mmc@5000 (arm,pl180): clock-names: ['mclk', 'apb_pclk'] is too long
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dtb: mmc@5000 (arm,pl180): clocks: [[4294967295], [4294967295]] is too long
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dtb: mmc@5000 (arm,pl180): compatible:0: 'qcom,tgu' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dtb: mmc@80126000 (arm,pl18x): 'bus-width', 'cap-mmc-highspeed', 'cap-sd-highspeed', 'cd-gpios', 'dma-names', 'dmas', 'interrupts', 'max-frequency', 'st,sig-dir-cmd', 'st,sig-dir-dat0', 'st,sig-dir-dat2', 'st,sig-pin-fbclk', 'vmmc-supply', 'vqmmc-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dtb: mmc@80126000 (arm,pl18x): clock-names:0: 'apb_pclk' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dtb: mmc@80126000 (arm,pl18x): clock-names: ['sdi', 'apb_pclk'] is too long
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dtb: mmc@80126000 (arm,pl18x): clocks: [[4294967295, 1, 5], [4294967295, 1, 5]] is too long
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dtb: mmc@80126000 (arm,pl18x): compatible:0: 'qcom,tgu' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dtb: mmc@101f6000 (arm,pl18x): 'bus-width', 'cap-mmc-highspeed', 'cap-sd-highspeed', 'full-pwr-cycle', 'interrupts', 'max-frequency', 'st,sig-dir-cmd', 'st,sig-dir-dat0', 'st,sig-dir-dat2', 'st,sig-dir-dat31', 'st,sig-pin-fbclk', 'vmmc-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dtb: mmc@101f6000 (arm,pl18x): clock-names:0: 'apb_pclk' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dtb: mmc@101f6000 (arm,pl18x): clock-names: ['mclk', 'apb_pclk'] is too long
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dtb: mmc@101f6000 (arm,pl18x): clocks: [[4294967295], [4294967295]] is too long
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dtb: mmc@101f6000 (arm,pl18x): compatible:0: 'qcom,tgu' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dtb: mmc@52007000 (arm,pl18x): 'arm,primecell-periphid', 'cap-mmc-highspeed', 'cap-sd-highspeed', 'interrupts', 'max-frequency', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mmc/arm,pl18x.example.dtb: mmc@52007000 (arm,pl18x): compatible:0: 'qcom,tgu' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/serial/pl011.example.dtb: serial@80120000 (arm,pl011): 'dma-names', 'dmas', 'interrupts' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/serial/pl011.example.dtb: serial@80120000 (arm,pl011): clock-names:0: 'apb_pclk' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/serial/pl011.example.dtb: serial@80120000 (arm,pl011): clock-names: ['uartclk', 'apb_pclk'] is too long
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/serial/pl011.example.dtb: serial@80120000 (arm,pl011): clocks: [[4294967295], [4294967295]] is too long
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/serial/pl011.example.dtb: serial@80120000 (arm,pl011): compatible:0: 'qcom,tgu' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/spi/spi-pl022.example.dtb: spi@e0100000 (arm,pl022): '#address-cells', '#size-cells', 'dma-names', 'dmas', 'flash@1', 'interrupts' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/spi/spi-pl022.example.dtb: spi@e0100000 (arm,pl022): compatible:0: 'qcom,tgu' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/spi/spi-pl022.example.dtb: spi@e0100000 (arm,pl022): 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/spi/spi-pl022.example.dtb: spi@e0100000 (arm,pl022): 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/arm,pl041.example.dtb: audio-controller@40000 (arm,pl041): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/arm,pl041.example.dtb: audio-controller@40000 (arm,pl041): compatible:0: 'qcom,tgu' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.example.dtb: i2c@80004000 (stericsson,db8500-i2c): '#address-cells', '#size-cells', 'clock-frequency', 'interrupts', 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.example.dtb: i2c@80004000 (stericsson,db8500-i2c): clock-names:0: 'apb_pclk' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.example.dtb: i2c@80004000 (stericsson,db8500-i2c): clock-names: ['i2cclk', 'apb_pclk'] is too long
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.example.dtb: i2c@80004000 (stericsson,db8500-i2c): clocks: [[4294967295, 3, 3], [4294967295, 3, 3]] is too long
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.example.dtb: i2c@80004000 (stericsson,db8500-i2c): compatible:0: 'qcom,tgu' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.example.dtb: i2c@80004000 (stericsson,db8500-i2c): compatible:1: 'arm,primecell' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.example.dtb: i2c@80004000 (stericsson,db8500-i2c): compatible: ['stericsson,db8500-i2c', 'st,nomadik-i2c', 'arm,primecell'] is too long
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.example.dtb: i2c@101f8000 (st,nomadik-i2c): '#address-cells', '#size-cells', 'clock-frequency', 'interrupts' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.example.dtb: i2c@101f8000 (st,nomadik-i2c): clock-names:0: 'apb_pclk' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.example.dtb: i2c@101f8000 (st,nomadik-i2c): clock-names: ['mclk', 'apb_pclk'] is too long
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.example.dtb: i2c@101f8000 (st,nomadik-i2c): clocks: [[4294967295], [4294967295]] is too long
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.example.dtb: i2c@101f8000 (st,nomadik-i2c): compatible:0: 'qcom,tgu' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.example.dtb: i2c@300000 (mobileye,eyeq5-i2c): '#address-cells', '#size-cells', 'clock-frequency', 'interrupts', 'mobileye,olb' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.example.dtb: i2c@300000 (mobileye,eyeq5-i2c): clock-names:0: 'apb_pclk' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.example.dtb: i2c@300000 (mobileye,eyeq5-i2c): clock-names: ['i2cclk', 'apb_pclk'] is too long
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.example.dtb: i2c@300000 (mobileye,eyeq5-i2c): clocks: [[4294967295], [4294967295]] is too long
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.example.dtb: i2c@300000 (mobileye,eyeq5-i2c): compatible:0: 'qcom,tgu' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.example.dtb: mmc@80118000 (arm,pl18x): '#address-cells', '#size-cells', 'bus-width', 'interrupts', 'non-removable', 'vmmc-supply', 'wifi@1' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.example.dtb: mmc@80118000 (arm,pl18x): clock-names:0: 'apb_pclk' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.example.dtb: mmc@80118000 (arm,pl18x): clock-names: ['mclk', 'apb_pclk'] is too long
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.example.dtb: mmc@80118000 (arm,pl18x): clocks: [[4294967295, 0], [4294967295, 1]] is too long
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.example.dtb: mmc@80118000 (arm,pl18x): compatible:0: 'qcom,tgu' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.example.dtb: memory-controller@e000e000 (arm,pl353-smc-r2p1): '#address-cells', '#size-cells', 'nand-controller@0,0', 'ranges' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.example.dtb: memory-controller@e000e000 (arm,pl353-smc-r2p1): clock-names:0: 'apb_pclk' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.example.dtb: memory-controller@e000e000 (arm,pl353-smc-r2p1): clock-names: ['memclk', 'apb_pclk'] is too long
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.example.dtb: memory-controller@e000e000 (arm,pl353-smc-r2p1): clocks: [[4294967295, 11], [4294967295, 44]] is too long
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.example.dtb: memory-controller@e000e000 (arm,pl353-smc-r2p1): compatible:0: 'qcom,tgu' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bus/arm,integrator-ap-lm.example.dtb: serial@100000 (arm,pl011): 'interrupts-extended' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bus/arm,integrator-ap-lm.example.dtb: serial@100000 (arm,pl011): compatible:0: 'qcom,tgu' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bus/arm,integrator-ap-lm.example.dtb: serial@100000 (arm,pl011): 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bus/arm,integrator-ap-lm.example.dtb: serial@100000 (arm,pl011): 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/rtc/arm,pl031.example.dtb: rtc@10017000 (arm,pl031): compatible:0: 'qcom,tgu' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/arm,pl11x.example.dtb: clcd@10020000 (arm,pl111): 'interrupt-names', 'interrupts', 'max-memory-bandwidth', 'port' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/arm,pl11x.example.dtb: clcd@10020000 (arm,pl111): clock-names:0: 'apb_pclk' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/arm,pl11x.example.dtb: clcd@10020000 (arm,pl111): clock-names: ['clcdclk', 'apb_pclk'] is too long
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/arm,pl11x.example.dtb: clcd@10020000 (arm,pl111): clocks: [[4294967295], [4294967295]] is too long
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/arm,pl11x.example.dtb: clcd@10020000 (arm,pl111): compatible:0: 'qcom,tgu' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom,tgu.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251104064043.88972-2-songwei.chai@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


