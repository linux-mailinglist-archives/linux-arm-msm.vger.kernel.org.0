Return-Path: <linux-arm-msm+bounces-43731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2838F9FEDFB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 09:32:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF1F2162380
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 08:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93514188714;
	Tue, 31 Dec 2024 08:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PsDYhYvX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6802D7BF;
	Tue, 31 Dec 2024 08:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735633948; cv=none; b=MFA80K35joiqP9lVeojHvODpZxbj5siV510PlQ0q2jcbzAewyDAQFQZ03QJWj5zV/nL5LlMzi5f8KcTokckvr/MLTLpfCCflHzsxiL7F1+OM1Pkx6iUdlfzwYXrgys6KSGaFT4DcbN/HGCPTS//tFRHeoEBy/S43ikeW9ObeyDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735633948; c=relaxed/simple;
	bh=f8BYHSihW21/k8W6SrqH9PIwRTNiaOLgefXaPWjoJjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tUIOWnRN8kI24r+L4sTQ3wSObeIkWAGvTJ3xqqVrB1YWFduq+carsBMK5ZTI/+vAbZqQ8X/ef/VHbue/GvjmZoO5qDjklbbE1H0vWGsrS2TjO0jfbsY5XwimZ2b8uGgf/T9CMw8asxyiy/HyK8hfl0gtTUU1atn8SkiKjL+tI+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PsDYhYvX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB5FDC4CED6;
	Tue, 31 Dec 2024 08:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735633945;
	bh=f8BYHSihW21/k8W6SrqH9PIwRTNiaOLgefXaPWjoJjI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PsDYhYvX1/Ddo5WJLYYgSbj8vY+Oya58+Lgaz6+h7zUEUudAcx3znCDZV5mRbewF2
	 mck7pOkUU/TY73/Z4Nlqn9nYiL9+fnaE/84ohIY3ziIRcAz369eGwomc4s+vzH/rng
	 sgssMMJ7FweeNS6IPKZ3kXsYB9WwDSLF4FdgeP2l4ddwF5A39CUtxFe+dgdmrPBQ3O
	 EPpJcZrlWoyegT9Ld6PISVVE1YpoBVSEDxT3D9prao80OHanVd3Vlo9BQeYoFVtTdO
	 hl7FMVT5ew+GwQoEz8+C+O4BvQ+WkuZDhRKM/+a0sSnjNsvW+E3LhtyXOjfWZiHjKW
	 UEqeZj90RQovg==
Date: Tue, 31 Dec 2024 09:32:22 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sricharan R <quic_srichara@quicinc.com>
Cc: jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, andersson@kernel.org, konradybcio@kernel.org, 
	manivannan.sadhasivam@linaro.org, dmitry.baryshkov@linaro.org
Subject: Re: [PATCH V2 1/2] dt-bindings: mailbox: Document qcom,tmel-qmp
Message-ID: <kwtzvcoyayml3tgicnp5a75r65hqpicm7hivtk25ohp6rt34qf@sgunxjxfe33r>
References: <20241231054900.2144961-1-quic_srichara@quicinc.com>
 <20241231054900.2144961-2-quic_srichara@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241231054900.2144961-2-quic_srichara@quicinc.com>

On Tue, Dec 31, 2024 at 11:18:59AM +0530, Sricharan R wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> TMEL SS provides different kinds of services like secureboot, remote image
> authentication, key management, crypto, OEM provisioning etc. This patch adds
> support for remote image authentication. Support for rest of the services can
> be added.
> 
> The QMP mailbox is the primary means of communication between TMEL SS and other
> subsystem on the SoC. A dedicated pair of inbound and outbound mailboxes is
> implemented for each subsystem/external execution environment which needs to
> communicate with TMEL for security services. The inbound mailboxes are used to
> send IPC requests to TMEL, which are then processed by TMEL firmware and
> accordingly the responses are sent to the requestor via outbound mailboxes.
> 
> It is an IPC transport protocol which is light weight and supports a subset of
> API's. It handles link initialization, negotiation, establishment and
> communication across client(APPSS/BTSS/AUDIOSS) and server(TMEL SS).


You already got comment about wrapping, so implement it.

...


> This binding describes the component responsible for communication between the
> TMEL server based subsystems (Q6) and the TMEL client (APPSS/BTSS/AUDIOSS),

APPSS? Applications Safe Software? Avoid using qcom terminology. Common
name is "CPU" for example. Or explain qcom terminology...


> used for security services like secure image authentication, enable/disable
> efuses, crypto services. Each client in the   SoC has its own block of message

No need for double space "  ".

> RAM and IRQ for communication with the TMEL SS.
> 
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> ---
>   [V2]  Added HW description as per comments.
>         Removed the fallback compatible.
>         Fixed naming convention to TME-L in all places.
>         Fixed indendation for example.
>         Removed the 'description' for some items.
> 
>  .../bindings/mailbox/qcom,tmel-qmp.yaml       | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/qcom,tmel-qmp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,tmel-qmp.yaml b/Documentation/devicetree/bindings/mailbox/qcom,tmel-qmp.yaml
> new file mode 100644
> index 000000000000..a434359e0a2c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,tmel-qmp.yaml

No, use compatible as filename.

> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/qcom,tmel-qmp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm TMEL IPCC channel
> +
> +maintainers:
> +  - Sricharan Ramabadhran <quic_srichara@quicinc.com>
> +
> +description:
> +  TMEL SS provides different kinds of services like secureboot, remote image
> +  authentication, key management, crypto, OEM provisioning etc. This patch adds
> +  support for remote image authentication. Support for rest of the services can
> +  be added.
> +
> +  The QMP mailbox is the primary means of communication between TMEL SS and
> +  other subsystem on the SoC. A dedicated pair of inbound and outbound mailboxes
> +  is implemented for each subsystem/external execution environment which needs to
> +  communicate with TMEL for security services. The inbound mailboxes are used to
> +  send IPC requests to TMEL, which are then processed by TMEL firmware and
> +  accordingly the responses are sent to the requestor via outbound mailboxes.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - qcom,ipq5424-tmel-qmp


Why qmp? Can TMEL on IPQ5424 be anything else? Can TMEL be SMEM or using
any other remoteproc?

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  mboxes:
> +    maxItems: 1
> +
> +  "#mbox-cells":
> +    const: 2
> +    description:
> +      The first cell is the client-id, and the second cell is the signal-id.
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
> +    tmel_qmp: mailbox@32090000 {

Drop unused label.


Best regards,
Krzysztof


