Return-Path: <linux-arm-msm+bounces-96143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKxuLoJ1rmn3EwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 08:23:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3ED234C24
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 08:23:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5088A3018D6F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 07:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84F5936492F;
	Mon,  9 Mar 2026 07:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sG5sL5Hk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601633624D1;
	Mon,  9 Mar 2026 07:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773041022; cv=none; b=oth/eeZyhpXK7mKuodOfHwvD3Meh22/6nzSaZ40bQ4Kk5ClgObEOhTXHZ5kLP8kz7v2UB+M+HxG+vhSyrjtzt9GAPpiLJsTuRkYsmvF8tM/0a4LptuAbVmmIyjY1mnlQ5rUnIf8BNRzvxg1CUezgbJYIkZK1LtXOFOt1Mrcgb1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773041022; c=relaxed/simple;
	bh=jYr39AqxXGS2PX9PwV8hJJx6uf5JoHJxfgtpa6RP9CI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lJni/A/1lG1t4/Zf56PN6X8rb5DkOgzmiw7PQ2vRMd6J+9+US43KoemYQJOZ3a2ZbBqfydfL3fdVfYa9dZyJURTPYDohgMLbD9i7nBb8xvghy53TSefeaVt0eXFNimV04JBjYerYQ/C3gS29nHAweoG6dF1pK49PBlkOdOKwr7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sG5sL5Hk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69DC2C4CEF7;
	Mon,  9 Mar 2026 07:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773041021;
	bh=jYr39AqxXGS2PX9PwV8hJJx6uf5JoHJxfgtpa6RP9CI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sG5sL5HkcvMKdNh5ciQ11p/uHoitIVIax9ApWw3cKe8G7GwDVreUYxSeZ0ISQa6jB
	 wgrm7sLvOxWEWznMCS+iYKuzuyqoA6lhWNfQMjHvJAaXtJSwQNHGsW68u6BIRAeq1x
	 jMKZx0FCbrU4Y9rbuTABqFrcFWXsHg1GGyuvWOqHuddoHiUNx2MV+LiTHqkQ8v3Hdx
	 op//u7ldnS1I6T7oK43JXRLzPdGV2kRU9WHNIJwXPAgcti5A7d7rp0vteF0CnHXxAV
	 Wi1Af8GOMj69JibxArL8zQubb6SGAgpyshR+seSEMfyzSKMvYocFjoI7g0Px3H0GIQ
	 PiCfErKVxhNZw==
Date: Mon, 9 Mar 2026 08:23:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org, 
	konradybcio@kernel.org, bryan.odonoghue@linaro.org, ilpo.jarvinen@linux.intel.com, 
	hansg@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH V3 1/5] dt-bindings: embedded-controller: Add EC bindings
 for Qualcomm reference devices
Message-ID: <20260309-amorphous-archetypal-impala-8a0e1d@quoll>
References: <20260308233646.2318676-1-sibi.sankar@oss.qualcomm.com>
 <20260308233646.2318676-2-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260308233646.2318676-2-sibi.sankar@oss.qualcomm.com>
X-Rspamd-Queue-Id: 0B3ED234C24
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96143-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.970];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 05:06:42AM +0530, Sibi Sankar wrote:
> From: Maya Matuszczyk <maccraft123mc@gmail.com>
> 
> Add bindings for the EC firmware running on Hamoa/Purwa and Glymur
> reference devices, which run on IT8987 and Nuvoton MCUs respectively.
> 
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> ---
>  .../embedded-controller/qcom,hamoa-ec.yaml    | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-ec.yaml
> 
> diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-ec.yaml
> new file mode 100644
> index 000000000000..ea093b71d269
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-ec.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/embedded-controller/qcom,hamoa-ec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Hamoa Embedded Controller.

Please implement the feedback from v2.

> +
> +maintainers:
> +  - Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> +
> +description:
> +  Qualcomm Snapdragon based Hamoa/Purwa and Glymur reference devices have an
> +  EC running on IT8987 and Nuvoton MCU chips respectively. The EC handles things
> +  like fan control, temperature sensors, access to EC internal state changes.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - qcom,glymur-nuvoton-ec

nuvoton is name of the company, so it's too generic to describe a
component. It's like calling it "qcom,glymur-qcom-ec". How many EC do
you have there?

> +          - qcom,hamoa-it8987-ec

I don't understand this compatible. You already have hamoa.

> +      - const: qcom,hamoa-ec

So which EC is this?

Best regards,
Krzysztof


