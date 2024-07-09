Return-Path: <linux-arm-msm+bounces-25724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6FC92C1E8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 19:12:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D6A3B21783
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 17:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A71EC19F460;
	Tue,  9 Jul 2024 16:32:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B784419EEDA;
	Tue,  9 Jul 2024 16:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720542749; cv=none; b=buV9Ehb7mZueAeh3rLqqglQatGItKNtNZsXZHNqPMPStzJc87qf/lpiYosDK1Kdl8uBMqbHUEsqkRDjuiDHx79M9JVKKXjfqiM4nREHNg9N+ZL45yVfWPM/F5VmcEw/AX2luVISM9VdoyNv8syZm+T7sBxFdDBJopRjzN5IUm4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720542749; c=relaxed/simple;
	bh=0maCUCwCVbWIBTpxUFyaBcwbJIyp5geCOHcz68eYpoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c7yAu7kOaS9+ohCQ/+bKgeh85x7AxPkoqy3qhzqU3LIRNSi3A+A+J9/lIiyoqrVz4hYrtErpHHEZDteW9NMClN46diXsai5E/GLs6tNKlE99VIaNhLQRIdxOkF5L4AW19U0diaHujoiFrr+SBw2HqtiP4sib3Fxa7LkuUEIKMvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D891153B;
	Tue,  9 Jul 2024 09:32:51 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D96C93F762;
	Tue,  9 Jul 2024 09:32:22 -0700 (PDT)
Date: Tue, 9 Jul 2024 17:32:09 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, andersson@kernel.org,
	konrad.dybcio@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, quic_rgottimu@quicinc.com,
	quic_kshivnan@quicinc.com, conor+dt@kernel.org
Subject: Re: [RFC V3 1/4] dt-bindings: firmware: Document bindings for ARM
 SCMI QCOM Vendor Protocol
Message-ID: <Zo1lqcjPEDRMXDJm@pluto>
References: <20240702191440.2161623-1-quic_sibis@quicinc.com>
 <20240702191440.2161623-2-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240702191440.2161623-2-quic_sibis@quicinc.com>

On Wed, Jul 03, 2024 at 12:44:37AM +0530, Sibi Sankar wrote:
> Document the various memory buses that can be monitored and scaled by the
> memory latency governor hosted by the ARM SCMI QCOM Vendor protocol v1.0.
> 
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---

Hi Sibi,

this series got a bit neglected...my bad...a few comments down below.

> 
> Adding a reg property in scmi-memlat.yaml seems incorrect/superfluous
> but without it I see the following errors:
> 
> Err Logs:
> protocol@80: 'reg' does not match any of the regexes: '^memory-[0-9]$', 'pinctrl-[0-9]+'
> protocol@80: Unevaluated properties are not allowed ('memory-0', 'memory-1', 'memory-2' were unexpected)
> 
> v2:
> * Drop container dvfs memlat container node. [Rob]
> * Move scmi-memlat.yaml to protocol level given that a lot of vendors might end up
>   using the same protocol number. [Rob]
> * Replace qcom,cpulist with the standard "cpus" property. [Rob]
> * Fix up compute-type/ipm-ceil required. [Rob]
> 

...so there has been a lot of work around Vendor protos recently (as you
have seen) and especially around the way we define the DT bindings to have
multiple vendor protocols coexist with the same overlapping numbers.
(the code-level coexistence is already in place as you've seen...)

I think some sort of agreement on HOW to render this in the bindings
side was reached around a series from NXP...not sure if I am missing something
here but this commit from Peng/NXP (if you have not seen it already):
https://lore.kernel.org/linux-arm-kernel/20240621-imx95-bbm-misc-v2-v5-2-b85a6bf778cb@nxp.com/

...it is a good example of how you can define your vendor specific part in
a vendor specific binding files and then just add a single $ref line in
the core binding Documentation/devicetree/bindings/firmware/arm,scmi.yaml
(and that has been successfully reviewd...)

Moreover, in that same series from Peng/NXP you could have a look at
https://lore.kernel.org/linux-arm-kernel/20240621-imx95-bbm-misc-v2-v5-1-b85a6bf778cb@nxp.com/

that adds the Documentation for their Vendor protocols.
Beside the final location in the tree for such docs, which is a detail
we can settle later on our side too, I think that patch is a good example
of the kind of vendor-protos Documentation Sudeep is expecting.


>  .../bindings/firmware/arm,scmi.yaml           |  15 ++
>  .../bindings/soc/qcom/qcom,scmi-memlat.yaml   | 242 ++++++++++++++++++
>  include/dt-bindings/soc/qcom,scmi-vendor.h    |  22 ++
>  3 files changed, 279 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,scmi-memlat.yaml
>  create mode 100644 include/dt-bindings/soc/qcom,scmi-vendor.h
> 
> diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> index 4d823f3b1f0e..a4022682e5ca 100644
> --- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> +++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> @@ -284,6 +284,21 @@ properties:
>      required:
>        - reg
>  
> +  protocol@80:
> +    type: object
> +    allOf:
> +      - $ref: '#/$defs/protocol-node'
> +      - $ref: /schemas/soc/qcom/qcom,scmi-memlat.yaml#
> +
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        const: 0x80
> +
> +    required:
> +      - reg
> +

..here you should be able to just plant your $ref without redefining the
protocol@80

>  additionalProperties: false
>  
>  $defs:
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,scmi-memlat.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,scmi-memlat.yaml
> new file mode 100644
> index 000000000000..915a6bf5697f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,scmi-memlat.yaml
> @@ -0,0 +1,242 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/qcom/qcom,scmi-memlat.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SCMI Memory Bus nodes
> +
> +maintainers:
> +  - Sibi Sankar <quic_sibis@quicinc.com>
> +
> +description:
> +  This binding describes the various memory buses that can be monitored and scaled
> +  by memory latency governor running on the CPU Control Processor (SCMI controller).
> +

...and instead here you will define your protocols, compliant with the
main protocol-node def and any specific vendor sub-properties that you
should need....

...the above example from NXP is probably more clear than any attempt of mine
to explain this :P

Thanks,
Cristian


