Return-Path: <linux-arm-msm+bounces-91980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id tu8oGhCihWlrEQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 09:10:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C17FB489
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 09:10:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45BD7300A60D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 08:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97731313551;
	Fri,  6 Feb 2026 08:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k8ute3ad"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7419718B0A;
	Fri,  6 Feb 2026 08:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770365345; cv=none; b=XVfVsls62r9zE4CcYKfSuFApxnwwQ4ov9RHLjKB1lJrBEabH+s4i5isFIDSjlgddpy9J+W3eZDtLVeK2KNnzkvrHbuHNJR0jwdl//6/4IiB2HxVOTVVZHNdNmPTiiC9tjXWFyG99JDkPhlbi/prtjhqnjPJZadu/gO774vevO/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770365345; c=relaxed/simple;
	bh=PcwT3lXtBIV6a0P2Dxld1TPIWyUNGaZpfrDN01TGU9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZChCQ0pVyNBgToo/nS76IZyDBvBvZ9Ye4bzdsRauKtQklKTMEK77YoYtYMHAy9hhnZKlGP8CaeKu/O/hgQtQdxcojvYeJJ6DR88AV4lQiWfdCk52qqd1NQJ2rEAw2nukO0EKTokgGb11SuPFe/IV1itirtiqjvQGr9EWn/edp/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k8ute3ad; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 419DDC116C6;
	Fri,  6 Feb 2026 08:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770365344;
	bh=PcwT3lXtBIV6a0P2Dxld1TPIWyUNGaZpfrDN01TGU9o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k8ute3adGhsxg+35RrkxHzX2AIaqfEWPhwNSun8/XMBmXDvyhZc5uOf4O1b4NAEAc
	 x92MvfdF5LtI99WG7gb2i67mMY3Fv0YWcFBSQTxbGU1yMVDRMriSTsYbsT4lfbDDQc
	 mNzeopJzYLhxdDfL8Fa31FBzWnf2QEgULbjWCtPpz6ARTrhkS6OtO5uoRoMDDdLTm9
	 h8X8k//J8I21D4phS/gASwYcVTDPolqcR2ziVuRxXPsayaYq/bKndwD5x59bpgyZ/o
	 qqmls+7bvxYzjrQV1H8biBOqAyJiqz2irp2BeKkprM+Q5YRNNQTFAtQr3zKk9GEChM
	 JggcbCBWYsjhw==
Date: Fri, 6 Feb 2026 09:09:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	amit.kucheria@oss.qualcomm.com, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>, linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: hwmon: Add qcom,bcl-hwmon yaml bindings
Message-ID: <20260206-tricky-funky-bison-ffafa3@quoll>
References: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
 <20260206-qcom-bcl-hwmon-v1-1-7b426f0b77a1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260206-qcom-bcl-hwmon-v1-1-7b426f0b77a1@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91980-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 07C17FB489
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 02:44:05AM +0530, Manaf Meethalavalappu Pallikunhi wrote:
> Add devicetree binding documentation for Qualcomm PMIC Battery Current

Subject - You almost hit bingo of what not to do. You miss the third one.
When you hit the bingo, get in touch for a beer.

And before, read the docs, because this was repeated SO MANY TIMES.


> Limiting (BCL) hardware monitor. The BCL hardware provides monitoring
> and alarm functionality for battery overcurrent and battery/system
> under voltage conditions.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/hwmon/qcom,bcl-hwmon.yaml  | 128 +++++++++++++++++++++
>  1 file changed, 128 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/qcom,bcl-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/qcom,bcl-hwmon.yaml
> new file mode 100644
> index 000000000000..a0e8eaf13eec
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/qcom,bcl-hwmon.yaml
> @@ -0,0 +1,128 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/qcom,bcl-hwmon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SPMI PMIC Battery Current Limiting (BCL) Hardware Monitor
> +
> +maintainers:
> +  - Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  SPMI PMIC Battery Current Limiting (BCL) hardware provides monitoring and
> +  alarm functionality for battery overcurrent and battery or system under
> +  voltage conditions. It monitors battery voltage and current, and
> +  can trigger interrupts when configurable thresholds are exceeded.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - description: v1 based BCL
> +        items:
> +          - enum:
> +              - qcom,pm7250b-bcl
> +              - qcom,pm8250b-bcl
> +          - const: qcom,bcl-v1

Drop all bcl fallbacks. Pointless, incorrect and misleading.

> +
> +      - description: v2 based BCL
> +        items:
> +          - enum:
> +              - qcom,pm8350b-bcl
> +              - qcom,pm8350c-bcl
> +          - const: qcom,bcl-v2
> +
> +      - description: v3 bmx based BCL
> +        items:
> +          - enum:
> +              - qcom,pm8550b-bcl
> +              - qcom,pm7550ba-bcl
> +          - const: qcom,bcl-v3-bmx
> +
> +      - description: v3 core based BCL
> +        items:
> +          - enum:
> +              - qcom,pm8550-bc0l
> +              - qcom,pm7550-bcl
> +          - const: qcom,bcl-v3-core
> +
> +      - description: v3 wb based BCL
> +        items:
> +          - enum:
> +              - qcom,pmw5100-bcl
> +          - const: qcom,bcl-v3-wb
> +
> +      - description: v4 bmx based BCL
> +        items:
> +          - enum:
> +              - qcom,pmih010-bcl
> +          - const: qcom,bcl-v4-bmx
> +
> +      - description: v4 bmx with different scale based BCL
> +        items:
> +          - enum:
> +              - qcom,pmv010-bcl
> +          - const: qcom,bcl-v4-pmv010
> +
> +      - description: v4 core based BCL
> +        items:
> +          - enum:
> +              - qcom,pmh010-bcl
> +          - const: qcom,bcl-v4-core
> +
> +      - description: v4 wb based BCL
> +        items:
> +          - enum:
> +              - qcom,pmw6100-bcl
> +          - const: qcom,bcl-v4-wb

I really do not get what you are expressing here but all this is wrong.

> +
> +  reg:
> +    maxItems: 1
> +    description: BCL base address in the SPMI PMIC register map

Bus defines it. Drop descrip=tion.

> +
> +  interrupts:
> +    minItems: 2

Drop.

> +    maxItems: 2
> +    description:
> +      BCL alarm interrupts for different threshold levels

Drop

> +
> +  interrupt-names:
> +    items:
> +      - const: bcl-max-min
> +      - const: bcl-critical

Drop bcl

> +
> +  overcurrent-thresholds-milliamp:
> +    description:
> +      Current thresholds in milliamperes for the two configurable current
> +      alarm levels (max and critical). These values are used to override
> +      default thresholds if a platform has different battery ocp specification.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array

No, please read basic guides or presentations about DT bindings. The
suffix already defines this.

> +    minItems: 2
> +    maxItems: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +
> +unevaluatedProperties: false

You did not bother to read the docs prior to posting this.

You are supposed to do internal review first. Did it happen? I checked
and cannot find anything. It's not acceptable to use the community
instead of your internal review.

NAK

> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    pmic {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        bcl@1d00 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
If you cannot find a name matching your device, please check in kernel
sources for similar cases or you can grow the spec (via pull request to
DT spec repo).

Best regards,
Krzysztof


