Return-Path: <linux-arm-msm+bounces-111258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HASsH8rNIWrpOAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 21:11:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9ED7642D02
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 21:11:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=FdUkE6JJ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111258-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111258-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 08A0B30AD61A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 19:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AF063A759C;
	Thu,  4 Jun 2026 19:08:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D152E2F0E;
	Thu,  4 Jun 2026 19:08:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780600108; cv=none; b=t8mGtK01qKvp01nzk/RNiqeZNwW8lkw/967NpUp9t1sww8bSVHVXfo6CLMvX/jBkpg4/EfR4a5nwLz+7nJxs9N8QdPtuLVz7UOKJKL4+7TGYjgVchv+qRxtnqvAHtG+rvwfR8dH9i7vDCQp8rmDfjynNKWRBo0d5LJCtmEYoFmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780600108; c=relaxed/simple;
	bh=3839TWDSUe1P7pOKL9JfzoW8I/Nn5f4LylCDPI4dY8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dif2h4gjlY6rM3lHNfuAB+UerVCt8YhvUFg4WSrGolkoikksvD5dH5G0TVNxkDKLxM3c0R3RI4SaAQ4mpsq6uQy/KJ2Ql+kBUmGY+na6+OwvUzYxprMSKBE5Ut3byku0uz1TEsqGXTbwhEAYrcU49VzSe2ac4BzXWrZH934Uqkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FdUkE6JJ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DDC11F00893;
	Thu,  4 Jun 2026 19:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780600106;
	bh=QziTJtSzI9d2Wug3PhNrMSYttkC98VQHP4HWNoHk/ng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FdUkE6JJMAFKlfzbTkkqPO2+i4oPfQ3RzD34sQCfkyK9opJIqcEtUXH1RHQsRY2tc
	 limHJ7NSCkbr128mi4mYQQ296aLUHU7OoMBaoLf+rzVmKbrLeZjeEYSeSjswytdQks
	 HApooDfds1zkMoBjXHCjXB8kLTOBCsVaJZHSiGZ5pv4G65R4WcK25Z12KPX1VFKp3y
	 5fWlIei5GzASQ0P45K2OFZW0/glN0bAjJMYtITL7qi1VO0mdbMem+Q6YP7grDP40Pk
	 hau/FByfdCDtJ91usmQjlcW7I9UAdJ9vKe1Si2hbZuTh2eRqSnLfUbTGMjsMeAVsbj
	 Tr51WycYcnQ7A==
Date: Thu, 4 Jun 2026 14:08:25 -0500
From: Rob Herring <robh@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: clock: qcom: Add EVA clock and reset
 controller for Glymur SoC
Message-ID: <20260604190825.GA1030648-robh@kernel.org>
References: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
 <20260526-evacc_glymur-v1-2-b61c7755c403@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526-evacc_glymur-v1-2-b61c7755c403@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111258-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:taniya.das@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,devicetree.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C9ED7642D02

On Tue, May 26, 2026 at 10:59:45AM +0530, Taniya Das wrote:
> Add the device tree bindings for the enhanced video analytics(EVA) clock
> controller which is required on Qualcomm Glymur SoC. The controller
> provides clocks, resets and power domains for the EVA subsystem.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,glymur-evacc.yaml          | 76 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,glymur-evacc.h      | 38 +++++++++++
>  2 files changed, 114 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-evacc.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-evacc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..8315e3ce82ecfefb5413ce1c42843adb0bce50d7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,glymur-evacc.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,glymur-evacc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm EVA Clock & Reset Controller on Glymur SoC
> +
> +maintainers:
> +  - Taniya Das <taniya.das@oss.qualcomm.com>
> +
> +description: |
> +  Qualcomm EVA clock control module which supports the clocks, resets and
> +  power domains for the EVA instances on Glymur SoC.
> +
> +  See also:
> +  - include/dt-bindings/clock/qcom,glymur-evacc.h
> +
> +properties:
> +  compatible:
> +    const: qcom,glymur-evacc
> +
> +  clocks:
> +    items:
> +      - description: Interface clock from GCC
> +      - description: Board XO source
> +      - description: Board XO_A source
> +      - description: Sleep clock source
> +
> +  power-domains:
> +    description:
> +      Power domains required for the clock controller to operate

Drop. That's any power domain...

With that,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

