Return-Path: <linux-arm-msm+bounces-86003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 64826CD2AA9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 09:40:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26AAE30102BA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 08:39:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 427622F746D;
	Sat, 20 Dec 2025 08:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XVs5r/Y0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102662E03F5;
	Sat, 20 Dec 2025 08:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766219998; cv=none; b=bevlD1Y144NlBFbedX4VgBK/SJ27mJrVROOg44NZ+9Matedp745E0p3CYXATNhQXJiPbhB5Kx1VJIJQ8cp9+0j7rtFo9XSPX14YNH0WAsKf/YSKH1vh2iVwIPPJRNFUq2PHZvjdc9E+XBa07YW0Q4fkjFqBHj0+TrCIKnLfr6OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766219998; c=relaxed/simple;
	bh=XvsmVs4f1meZGPxhF8DDjwBt/VslBi0sJliAfkGY+ig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qmo0qSof4MHSaEOcROVlJYwn6YqiqNAOhlNx5GXFaLDhxOv2iGgUCKLzRoJD9fGaGNSlWYkV4/ZABY/nBmrvfP/Z/W44Csi2ntz2KJrq1DH48sWPwLwzeslxtBKuWHp6LYGO8OTPzGk4NAPO6DI7OqnGIz/K8BxAW7M5wp5DsS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XVs5r/Y0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A0F0C4CEF5;
	Sat, 20 Dec 2025 08:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766219997;
	bh=XvsmVs4f1meZGPxhF8DDjwBt/VslBi0sJliAfkGY+ig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XVs5r/Y0KL0W9oo+Y+7WOvOL3+gX394NakrRBrulw1KTm/qYx0r3XO8ZLND5V6Upg
	 HamRZ6BlAdrEWpz7vf3I1AJZG52zEPXSes3xnD2eEqEZ7ZOlUrgb5M7wHJ0wIvgtit
	 zP671DJ4uLRPkK0FMM0oLKpne6k5pg+Mn2xXhffqJKFpxf1h6U9ibvi106UbLPt21l
	 zG7iKrhycPHe0BjHxLtNZ1BzV00H4EnILhHkrMqO2Obb7xNnEt0+EeLYKcnoOsuNEN
	 70QRaYSTbpxJIzS4ZffRh1j1w4A8aR6rM7ICo5kGJq83wy/JXyEkTpXuZo+mxRLuxM
	 CMuR1mBSA72rA==
Date: Sat, 20 Dec 2025 09:39:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org, 
	quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>, George Moussalem <george.moussalem@outlook.com>
Subject: Re: [PATCH v8 2/6] dt-bindings: remoteproc: qcom: document hexagon
 based WCSS secure PIL
Message-ID: <20251220-amphibian-nippy-firefly-d4fac0@quoll>
References: <20251219031010.2919875-1-varadarajan.narayanan@oss.qualcomm.com>
 <20251219031010.2919875-3-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251219031010.2919875-3-varadarajan.narayanan@oss.qualcomm.com>

On Fri, Dec 19, 2025 at 08:40:06AM +0530, Varadarajan Narayanan wrote:
> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> 
> Add new binding document for hexagon based WCSS secure PIL remoteproc.
> IPQ5018, IPQ5332 and IPQ9574 follow secure PIL remoteproc.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> [ Dropped ipq5424 support ]
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
> v8: Dropped Krzysztof's 'Reviewed-by' as the bindings file has changed significantly
>     Drop ipq5424 support
>     Update example to ipq9574 instead of ipq5424
>     Change 'mboxes' description

I do not see any "significant" differences in the binding. You ONLY
dropped one compatible (no problem, why would we care?) and renamed one
description in mboxs. No other changes, nothing, so I do not understand
what was the significant difference here.

Dropping reviews at v8 is really unexpected and to me it feels like you
rewrite everything, which should not happen at v8.


> ---
>  .../remoteproc/qcom,wcss-sec-pil.yaml         | 172 ++++++++++++++++++
>  1 file changed, 172 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml
> new file mode 100644
> index 000000000000..0fe04e0a4ca5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml


Well, since you ask for re-review and I really cannot find the
difference, then let's start nitpicking from scratch:

Please use one of the compatibles, e.g. the oldest device, as filename.

> @@ -0,0 +1,172 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/qcom,wcss-sec-pil.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm WCSS Secure Peripheral Image Loader
> +
> +maintainers:
> +  - Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> +
> +description:
> +  Wireless Connectivity Subsystem (WCSS) Secure Peripheral Image Loader loads
> +  firmware and power up QDSP6 remoteproc on the Qualcomm IPQ series SoC.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,ipq5018-wcss-sec-pil
> +      - qcom,ipq5332-wcss-sec-pil
> +      - qcom,ipq9574-wcss-sec-pil
> +
> +  reg:
> +    maxItems: 1
> +
> +  firmware-name:
> +    maxItems: 1
> +    description: Firmware name for the Hexagon core
> +
> +  interrupts:
> +    items:
> +      - description: Watchdog interrupt
> +      - description: Fatal interrupt
> +      - description: Ready interrupt
> +      - description: Handover interrupt
> +      - description: Stop acknowledge interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: wdog
> +      - const: fatal
> +      - const: ready
> +      - const: handover
> +      - const: stop-ack
> +
> +  clocks:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array

What is this? How did it ever appear here? Sorry, but this is not a
syntax present anywhere.

> +
> +  clock-names:
> +    $ref: /schemas/types.yaml#/definitions/string-array

Neither this. Look, I have never reviewed something like this:

https://lore.kernel.org/all/20240829134021.1452711-2-quic_gokulsri@quicinc.com/

NAK, that's not a binding style at all. Please do not invent completely
different style.

What's weird, this change did not happen at v8, so you still kept my
review tag even after inventing this weird code.

> +
> +  mboxes:
> +    items:
> +      - description: TMECom mailbox driver
> +
> +  qcom,smem-states:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: States used by the AP to signal the remote processor
> +    items:
> +      - description: Stop Q6
> +      - description: Shutdown Q6
> +
> +  qcom,smem-state-names:
> +    description:
> +      Names of the states used by the AP to signal the remote processor
> +    items:
> +      - const: stop
> +      - const: shutdown
> +
> +  memory-region:
> +    items:
> +      - description: Q6 reserved region
> +
> +  glink-edge:
> +    $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
> +    description:
> +      Qualcomm G-Link subnode which represents communication edge, channels
> +      and devices related to the Modem.
> +    unevaluatedProperties: false

Best regards,
Krzysztof


