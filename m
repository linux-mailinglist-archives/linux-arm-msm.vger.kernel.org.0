Return-Path: <linux-arm-msm+bounces-96146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMhbDmp5rmmPFAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 08:40:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EF4234E2D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 08:40:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 41D43303A118
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 07:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CCC4366DD6;
	Mon,  9 Mar 2026 07:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A+RjrOxr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E01364926;
	Mon,  9 Mar 2026 07:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773041937; cv=none; b=J1XCo1TSnuTxdldtP1/2ZxlOLtauywyBw7yKRa6R2LUjcEobML9qVS5uiMAJ+2s7OCiezeMIIFn2twpdN90XUwIiiL44JPfdbOkpBlCrALf05Aa6eNNmjZrq3A5OXPShBXI1K49RQkXDYslneeB3Yv6hCy9ZzVhO/HfUzByuKBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773041937; c=relaxed/simple;
	bh=/6q+MChbRb+7dC7KWa0xw1Pg+Ojy5G+IcYU3x0F3ahU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S0WYQziaP8SNs1Y7st6dzeK3OpvWcaT3vMMMLVe/Z1ia/7jvN0kAj9AxxUyHlOwliaFC/MDvvYjv456YpM5k3sg8ImMKdbFc3M1kYM/4EhCrvBN2fgGLZXiq/ripCSXPsNURWQ+MGuIGbL5pvJo2cFSCOkxWGLaJHdppAVOmucQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A+RjrOxr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C980C4CEF7;
	Mon,  9 Mar 2026 07:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773041937;
	bh=/6q+MChbRb+7dC7KWa0xw1Pg+Ojy5G+IcYU3x0F3ahU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A+RjrOxrREyCbCknoG08Pkef9Gwa06CP8bHNsHsi1JbYxUIq7Suml2ASO/wgp1ATI
	 Y6vVcbm6pQRNb0DtJ+XryQKaCgmr8xEY1xy/WVTJj4jDrgr62FmBmtP393vimTfuMN
	 RdTf6aK7/+MBoRUSuEFkI+ZJt2z53M58QF84nVfyD00WoFGvwNkVqi7Jy8fBjOSERl
	 amg0h023uOzOkiXBuZnnK9uEYEcNARFAfU05G/tCdW/7hYKxKpMTaT3STVY45eBc3m
	 ueeYCP+Eh0QNY2ObIP2qgWMPieUdCNbbivxUOo4DWl94wlM0X/0NlZNNTmdEPNvR05
	 5oQgxwbtcQznw==
Date: Mon, 9 Mar 2026 08:38:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aelin Reidel <aelin@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux@mainlining.org, 
	phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 1/4] dt-bindings: clock: qcom: document the Fillmore
 Global Clock Controller
Message-ID: <20260309-quirky-heavy-armadillo-9f92bc@quoll>
References: <20260308-fillmore-clks-v1-0-976d9a6bebe7@mainlining.org>
 <20260308-fillmore-clks-v1-1-976d9a6bebe7@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260308-fillmore-clks-v1-1-976d9a6bebe7@mainlining.org>
X-Rspamd-Queue-Id: B4EF4234E2D
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
	TAGGED_FROM(0.00)[bounces-96146-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.970];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,devicetree.org:url,mainlining.org:email]
X-Rspamd-Action: no action

On Sun, Mar 08, 2026 at 01:39:27AM +0100, Aelin Reidel wrote:
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

Aer you sure there is no PCIE 1? Because I would be dissapointed if it
is being added later. With PCIE 1 clock this would be basically Milos
GCC.

Best regards,
Krzysztof


