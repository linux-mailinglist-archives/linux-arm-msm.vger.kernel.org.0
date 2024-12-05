Return-Path: <linux-arm-msm+bounces-40450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8408C9E4F6E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 09:12:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A90E2804A3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 08:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DD791CF5EC;
	Thu,  5 Dec 2024 08:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nXhsRD7u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0605EC0;
	Thu,  5 Dec 2024 08:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733386352; cv=none; b=eAHqFCOuO6I4ivq1Dc+qgMDxmHj03TTMVQa0eUpNucLZkohxVRA8zGXK8AytzoFNpCj0D/xEmRXJDLI++gJcXYIFpdlXswkZqkwYLTHqVWYjqIDGlgmMfQmCEbJT3KYuYwnbHWkfjuUaq2Xf5qjFe7WCceFcssmIU5dECJf4jvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733386352; c=relaxed/simple;
	bh=0SB1Q0op60vhl5EfbizZUhTQUTf9r76GONCXBLsMDfA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=rGNBZ7qD2vJa8W5b62JzHKS4eJ0msMSurEYWmWWNzonHWuhVyFusJ4oNxilmpXDPr79EorXieqB7MuvgUHRnAsDBlhyhyuuSqoCTbveCQuTpQnXLdJxoRa6r+u9TQv55n66q6AtI5cZ4yoDJjvkFScOlN8/P5LQhndTIu3uKsf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nXhsRD7u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54664C4CEDF;
	Thu,  5 Dec 2024 08:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733386351;
	bh=0SB1Q0op60vhl5EfbizZUhTQUTf9r76GONCXBLsMDfA=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=nXhsRD7u//XLpgyG+lRxF/WT4QwNvK4XpF/PpbcDJOZPzMg4oi9edkuXGN1zL1EVJ
	 icPekV7iyMJYVhWbUXuwJwpwyRVk6E1S7f/V44zxO7OfwQCAgFda7o4UXxjnsEhn+B
	 lOFlJXtrZ+D9WX0xohqn1yTRDzn8r49JyO9wQ2yLMdBTxXeLprppJ0xC3PDUPzJOgO
	 0gUJa/60mVkXp4fNVTS9vnmvQk3r50nD08URRBYAGifyJAeWMkEy+tagUMJhjsaNzh
	 akw8DMKYD9UA8gKnS+rnNlVdaSv2VT09GZcEr2NfA1BkG0XlUGhy2DzUN1tGBweKTX
	 i36eGpHNZ0Ztw==
Message-ID: <e6759ca4-bcfb-4817-8a72-d1e9eb5d3d02@kernel.org>
Date: Thu, 5 Dec 2024 09:12:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/2] dt-bindings: mailbox: qcom: Document
 qcom,tmelite-qmp
To: Sricharan R <quic_srichara@quicinc.com>, jassisinghbrar@gmail.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20241205080633.2623142-1-quic_srichara@quicinc.com>
 <20241205080633.2623142-2-quic_srichara@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241205080633.2623142-2-quic_srichara@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/12/2024 09:06, Sricharan R wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> This binding describes the component responsible for communication
> between the TME-L server based subsystems (Q6) and the TME-L client
> (APPSS/BTSS/AUDIOSS), used for security services like secure image
> authentication, enable/disable efuses, crypto services. Each client
> in the   SoC has its own block of message RAM and IRQ for communication
> with the TME-L SS. The protocol used to communicate in the message RAM
> is known as Qualcomm Messaging Protocol (QMP).

This is RFC, so only limited review follows. I will review more once
this is ready for review.

> 
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> ---
>  .../bindings/mailbox/qcom,tmelite-qmp.yaml    | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/qcom,tmelite-qmp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,tmelite-qmp.yaml b/Documentation/devicetree/bindings/mailbox/qcom,tmelite-qmp.yaml
> new file mode 100644
> index 000000000000..1f2b3e02b894
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,tmelite-qmp.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/qcom,tmelite-qmp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm TMELITE IPCC channel
> +
> +maintainers:
> +  - Sricharan Ramabadhran <quic_srichara@quicinc.com>
> +
> +description:
> +  This binding describes the component responsible for communication


Describe the hardware, not the binding.

> +  between the TME-L server based subsystems (Q6) and the TME-L client
> +  (APPSS/BTSS/AUDIOSS), used for security services like secure image
> +  authentication, enable/disable efuses, crypto services. Each client
> +  in the   SoC has its own block of message RAM and IRQ for communication
> +  with the TME-L SS. The protocol used to communicate in the message RAM
> +  is known as Qualcomm Messaging Protocol (QMP).
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - qcom,ipq5424-tmelite-qmp
> +      - const: qcom,tmelite-qmp

Drop generic compatible.


> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      The base address and size of the message RAM for this client's
> +      communication with the TMELITE core

Drop obvious description. Same everywhere else.

> +
> +  interrupts:
> +    maxItems: 1
> +    description:
> +      Should specify the TMELITE message IRQ for this client
> +
> +  mboxes:
> +    maxItems: 1
> +    description:
> +      Reference to the mailbox representing the outgoing doorbell in APCS for
> +      this client, as described in mailbox/mailbox.txt
> +
> +  "#mbox-cells":
> +    const: 2
> +    description:
> +      The first cell is the client-id, and the second cell is the signal-id.

I guess that's the only description not stating obvious.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - mboxes
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    tmel_qmp: qmp@32090000 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


> +           compatible = "qcom,ipq5424-tmelite-qmp", "qcom,tmelite-qmp";

Use 4 spaces for example indentation.

> +           reg = <0x32090000 0x2000>;
> +...


Best regards,
Krzysztof

