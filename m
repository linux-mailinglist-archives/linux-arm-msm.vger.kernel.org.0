Return-Path: <linux-arm-msm+bounces-96000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDNbDgfIrGlguQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 01:51:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3985822E2DE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 01:51:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3E67D300A65D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Mar 2026 00:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C38F81DF27F;
	Sun,  8 Mar 2026 00:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="YhzfyX5Q";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="6jb9JiV0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BF213959D;
	Sun,  8 Mar 2026 00:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772931071; cv=none; b=Pkbtil9CQnbMMWf0oEG3uSyAxKPs957hWCgCITR+Ta6exq3aC4XHM1oiRn+DvtglS7TD1uyFpd7l2Nurofqcimbed6OBmfKbCJG8DUxt1IWRG2e+5I+XnD4bLgfKXzeMxoYEI1VyUJVpRJP40x8leY5tyWwzZzdV2AedYCP4fBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772931071; c=relaxed/simple;
	bh=beE4ZGZ4MMQidwNf28xa2X+VQTDEeEnbXsFJ11ldVvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qqwKh+NnP9GmT+g1XmQxvE/sMbjyQiGquXtwPotXo0k3WqgPXbIJ5A3gYN6HOKSU68nUmwdipjxqtmf6lGJukQMsrU/XLtW66al3W+FeFmTsoZrhMG5IxpbmJp9jgoEz7w3L6t4DEx2m5ym9IX+awuGLxNw2X/VNTRlq9zAtR50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=YhzfyX5Q; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=6jb9JiV0; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1772931037; bh=bhxp6hPSPyCStY1nuvWc8Wy
	6vYnwRIwNNwC1vc4Uy4U=; b=YhzfyX5QkzcRvWua/T7DYpZ2Vg7jbOurpyREm/5XCw+7nwpk2v
	rd6rLQFNSVU79Ib17bEapImBDukLgSMQ+gupl5cV5iIrqe2QYcZuOUjbYHy0Tun2R2jKo/THXL6
	CX7mz14aIWB+xkBL/MKfSKTLtIJsGUaX18xfUVmrp3keLOgbBAee04pouB43YNDLV9n8XlvShDd
	s0vdOCdYcbOVwqentRn0RYm8BLeQmoU7opkh1bTn/S/cF62bY+/BrYnlkOmo1M9RTFchkZAG51V
	scm9/eSqRDfnlWgkeuuyrSqME3d9VAwi9SkVJAv8FYgx+Uj6Xgzh9pvKv1IGAxDnlqw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1772931038; bh=bhxp6hPSPyCStY1nuvWc8Wy
	6vYnwRIwNNwC1vc4Uy4U=; b=6jb9JiV06POjF1jXODcIwcM8OjXielrItEekySekMApkXo+fS9
	W2v8u1gF3RjWTYy3kqF1dTfCrGnmIiD2u2AA==;
Message-ID: <5db619e1-a4b8-4da5-b54f-af127b3d2225@mainlining.org>
Date: Sun, 8 Mar 2026 01:50:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: clock: qcom: document the Fillmore
 Global Clock Controller
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@mainlining.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20260308-fillmore-clks-v1-0-976d9a6bebe7@mainlining.org>
 <20260308-fillmore-clks-v1-1-976d9a6bebe7@mainlining.org>
Content-Language: en-US
From: Aelin Reidel <aelin@mainlining.org>
In-Reply-To: <20260308-fillmore-clks-v1-1-976d9a6bebe7@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 3985822E2DE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96000-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aelin@mainlining.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	NEURAL_HAM(-0.00)[-0.974];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,devicetree.org:url,0.1.134.160:email,mainlining.org:dkim,mainlining.org:email,mainlining.org:mid]
X-Rspamd-Action: no action

On 3/8/26 1:39 AM, Aelin Reidel wrote:
> Add bindings documentation for the Fillmore (e.g. SM7450) Global Clock
> Controller.
> 
> Signed-off-by: Aelin Reidel <aelin@mainlining.org>
> ---
>  .../bindings/clock/qcom,fillmore-gcc.yaml          |  60 +++++++
>  include/dt-bindings/clock/qcom,fillmore-gcc.h      | 195 +++++++++++++++++++++
>  2 files changed, 255 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,fillmore-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,fillmore-gcc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..0eb12a52968edc7961681f0e965b4d6da0858b9c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,fillmore-gcc.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,fillmore-gcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Global Clock & Reset Controller on Fillmore
> +
> +maintainers:
> +  - Aelin Reidel <aelin@mainlining.org>
> +
> +description: |
> +  Qualcomm global clock control module provides the clocks, resets and power
> +  domains on Fillmore.
> +
> +  See also: include/dt-bindings/clock/qcom,fillmore-gcc.h
> +
> +properties:
> +  compatible:
> +    const: qcom,fillmore-gcc
> +
> +  clocks:
> +    items:
> +      - description: Board XO source
> +      - description: Sleep clock source
> +      - description: PCIE 0 Pipe clock source
> +      - description: UFS Phy Rx symbol 0 clock source
> +      - description: UFS Phy Rx symbol 1 clock source
> +      - description: UFS Phy Tx symbol 0 clock source
> +      - description: USB3 Phy wrapper pipe clock source
> +
> +required:
> +  - compatible
> +  - clocks
> +  - '#power-domain-cells'
> +
> +allOf:
> +  - $ref: qcom,gcc.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    clock-controller@100000 {
> +        compatible = "qcom,fillmore-gcc";
> +        reg = <0x00100000 0x1f4200>;
> +        clocks = <&rpmhcc RPMH_CXO_CLK>,
> +                 <&sleep_clk>,
> +                 <&pcie0_phy>,
> +                 <&ufs_mem_phy 0>,
> +                 <&ufs_mem_phy 1>,
> +                 <&ufs_mem_phy 2>,
> +                 <&usb_1_qmpphy>;
> +        #clock-cells = <1>;
> +        #reset-cells = <1>;
> +        #power-domain-cells = <1>;
> +    };
> +
> +...
> diff --git a/include/dt-bindings/clock/qcom,fillmore-gcc.h b/include/dt-bindings/clock/qcom,fillmore-gcc.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..1e78a429a93ab5e73f2454812cb904e2a9a14fc3
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,fillmore-gcc.h
> @@ -0,0 +1,195 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2025, Aelin Reidel <aelin@mainlining.org>
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_GCC_SM7450_H
> +#define _DT_BINDINGS_CLK_QCOM_GCC_SM7450_H

Ugh, I only noticed now after sending that this leftover is still in here. Consider it fixed in v2.

Best regards,
Aelin

> +
> +/* GCC HW clocks */
> +#define PCIE_0_PIPE_CLK						1
> +#define UFS_PHY_RX_SYMBOL_0_CLK					2
> +#define UFS_PHY_RX_SYMBOL_1_CLK					3
> +#define UFS_PHY_TX_SYMBOL_0_CLK					4
> +#define USB3_PHY_WRAPPER_GCC_USB30_PIPE_CLK			5

<snip>


