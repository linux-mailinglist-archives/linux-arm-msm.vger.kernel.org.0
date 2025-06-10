Return-Path: <linux-arm-msm+bounces-60713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 82830AD2E4A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 09:04:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 379E516E869
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 07:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99C3827AC32;
	Tue, 10 Jun 2025 07:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dikWmzdJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6411327A93B;
	Tue, 10 Jun 2025 07:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749539092; cv=none; b=O0BqBv18kAJfDBE65c6pUKF1r639SuOnYtKiOQGBLNzyZhZJyKnMmW3hTX+iqFF8i6GaiG1CFrxZb5GXKcwXVts/N1x3VsHzaVz1ZxU6UuCV7EQdzcFsx23Z3/eXL+9wE8hLMWqa5SItOwUE3CzBCvn0SUdA6g1iC+fo2K9WwEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749539092; c=relaxed/simple;
	bh=EDArvMn23IRQWiGpT6P5zmpMFs5mKcA/S91Me1PLceg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QuiAHlAh9Co/wjAEgi5taadCgRm2Ao5BkZ4el5U4iFL0tjjWBRKzBr63AXmkSeKQlTu5rxYY5m8eT/P2VR5Cb5EjL1kLgmE7lJ+/IITJ7/YJbW2NORV+E37+iMkSzyQleVoG7vMOVQSpYLXEpvTN40Xnbi02E+ggg85x6MgkUFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dikWmzdJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 435C5C4CEEF;
	Tue, 10 Jun 2025 07:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749539091;
	bh=EDArvMn23IRQWiGpT6P5zmpMFs5mKcA/S91Me1PLceg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dikWmzdJyHwZWQIV0whOGGmSzBYYmuTkmLW7e8qRqd4KB/lk2jrhhMpZC/9DGxzRj
	 hrehjdscyXpOD+JVfINFU1pq3sGvgNmHtbjGlZOROcHlYDhXS04DWEHu5fVoB/I3Jm
	 QXXlZLtJ/0QXYffaJ3Ci5IdiVO+WWK6ySWgVhTdeifA2MjF3NbNtcf9R7BSGjZ9BF2
	 R29Sddv4nqvYExGgL8gT1dLHeFS5I+4BUcCOsrCjOdj1ozN/TQU7FM4F6f5Dbm3RHh
	 kq51mMaz8HRIkZhJQEgUGgNqDuUYaAbSxuWLxu/vYQD/HLQUn/dkGZoNruL3gVsO2D
	 7I5JscyDVs1ow==
Date: Tue, 10 Jun 2025 09:04:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Praveen Talari <quic_ptalari@quicinc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, psodagud@quicinc.com, djaggi@quicinc.com, 
	quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com, quic_arandive@quicinc.com, 
	quic_mnaresh@quicinc.com, quic_shazhuss@quicinc.com, Nikunj Kela <quic_nkela@quicinc.com>
Subject: Re: [PATCH v6 1/8] dt-bindings: serial: describe SA8255p
Message-ID: <20250610-tested-lilac-raccoon-6c59c4@kuoka>
References: <20250606172114.6618-1-quic_ptalari@quicinc.com>
 <20250606172114.6618-2-quic_ptalari@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250606172114.6618-2-quic_ptalari@quicinc.com>

On Fri, Jun 06, 2025 at 10:51:07PM GMT, Praveen Talari wrote:
> From: Nikunj Kela <quic_nkela@quicinc.com>
> 
> SA8255p platform abstracts resources such as clocks, interconnect and
> GPIO pins configuration in Firmware. SCMI power and perf protocols are
> used to send request for resource configurations.
> 
> Add DT bindings for the QUP GENI UART controller on sa8255p platform.
> 
> The wakeup interrupt (IRQ) is treated as optional, as not all UART
> instances have a wakeup-capable interrupt routed via the PDC.
> 
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> Co-developed-by: Praveen Talari <quic_ptalari@quicinc.com>
> Signed-off-by: Praveen Talari <quic_ptalari@quicinc.com>
> ---
> v5 -> v6
> - added description for interrupt-names
> - added wakeup irq as optional information in commit text and
>   property description.
> - removed wake irq form example node.
> 
> v4 -> v5
> - added wake irq in example node
> 
> v3 -> v4
> - added version log after ---
> 
> v2 -> v3
> - dropped description for interrupt-names
> - rebased reg property order in required option
> 
> v1 -> v2
> - reorder sequence of tags in commit text
> - moved reg property after compatible field
> - added interrupt-names property
> ---
>  .../serial/qcom,sa8255p-geni-uart.yaml        | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml
> 
> diff --git a/Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml b/Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml
> new file mode 100644
> index 000000000000..c2e11ddcc0f6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/serial/qcom,sa8255p-geni-uart.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Geni based QUP UART interface
> +
> +maintainers:
> +  - Praveen Talari <quic_ptalari@quicinc.com>
> +
> +allOf:
> +  - $ref: /schemas/serial/serial.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sa8255p-geni-uart
> +      - qcom,sa8255p-geni-debug-uart
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 1

Drop, this is not in sync with interrupt-names. You already received
comments on this. We talk about this since v4!

I am not reviewing the rest. Implement complete feedback given to you in
v4 and v5.

Best regards,
Krzysztof


