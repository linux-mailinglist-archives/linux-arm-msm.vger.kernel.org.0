Return-Path: <linux-arm-msm+bounces-100899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBBZBfjVymk1AgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 21:58:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E6A360B42
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 21:58:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5DCF9301DB86
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 19:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 001A53BC661;
	Mon, 30 Mar 2026 19:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r4yk2xlZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06243A872A;
	Mon, 30 Mar 2026 19:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774900667; cv=none; b=EqGi49jPPBMBlB0Szwoo9xEvBRK1I9iejtLSXeWyOTppv1qNgkwJwF9uezN55RirSLwZSktWQ7Kmoph+piBumg/6R9SDPW1EaciRlujEUsBv6N2f+oxR/nno0dZ+58SBjxRxHq4/AH9iaqB51gOLoF1yAlXLMilJdqGMnZ5MOME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774900667; c=relaxed/simple;
	bh=c3qtZ+kKZI4i+gpQJZtVZwl68vlayAF2E4m619qBxgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XeYr3AoUDznzm7nvWpHqfhhAJMN5APpm6UMAhxT5Jb+zwMpqzuz+X1dS6W1SBzS8iZpHGbeod5T9Pt6/KogtNO5vvDV/SZ83ruFRBYJz0Nmk11bDL7Mv0iD1vDK0Q3z9m0aTx63rH9pY4voli/SVms/lyrP7cKF+D3K4aJ/IIW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r4yk2xlZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0E5DC4CEF7;
	Mon, 30 Mar 2026 19:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774900667;
	bh=c3qtZ+kKZI4i+gpQJZtVZwl68vlayAF2E4m619qBxgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r4yk2xlZAtlADeoHgNHcU+kzLd42R0+Asa+b4+A1R4WZEFcwb/hgfs4K/3XzpNWKu
	 TTPRNch1QeM8Qd5eUxboM5o+KJsxAWW3lkEOE6tC8Cwwbz/YPk8kZUgAzn2HYDxgB2
	 Uy2J4RDxmQfFf04ufKIvTN74P0ddfNckTnIZ0HI0JMQYMEHN6u08mN7e/hmeNy0J8S
	 nkeH311ovwyVEOsL/OHDRSV6x4W7tZefsBcEbtsFv8sAnRVOL/58/U3dEfaz6F5BZm
	 Ip4kDRGIlNWV1D/Y5TNMr2Bdnc10ZTYVTUVWnN/1Iu6hAh8Pa9elMtrE+jZDOVmwDl
	 9ZfBC8/xatqMg==
Date: Mon, 30 Mar 2026 14:57:44 -0500
From: Rob Herring <robh@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Marek <jonathan@marek.ca>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Alexander Koskovich <akoskovich@pm.me>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/9] dt-bindings: display: msm: document the Milos
 Mobile Display Subsystem
Message-ID: <20260330195744.GA3196688-robh@kernel.org>
References: <20260327-milos-mdss-v2-0-bc586683f5ca@fairphone.com>
 <20260327-milos-mdss-v2-4-bc586683f5ca@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-milos-mdss-v2-4-bc586683f5ca@fairphone.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,marek.ca,quicinc.com,linaro.org,pm.me,lists.sr.ht,vger.kernel.org,lists.freedesktop.org];
	URIBL_MULTI_FAIL(0.00)[fairphone.com:server fail,sto.lore.kernel.org:server fail,devicetree.org:server fail];
	TAGGED_FROM(0.00)[bounces-100899-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A5E6A360B42
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 05:12:23PM +0100, Luca Weiss wrote:
> Document the Mobile Display Subsystem (MDSS) on the Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  .../bindings/display/msm/qcom,milos-mdss.yaml      | 283 +++++++++++++++++++++
>  1 file changed, 283 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.yaml
> new file mode 100644
> index 000000000000..0fb66b4b2742
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.yaml
> @@ -0,0 +1,283 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/qcom,milos-mdss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Milos Display MDSS
> +
> +maintainers:
> +  - Luca Weiss <luca.weiss@fairphone.com>
> +
> +description:
> +  Milos MSM Mobile Display Subsystem(MDSS), which encapsulates sub-blocks like
> +  DPU display controller, DSI and DP interfaces etc.
> +
> +$ref: /schemas/display/msm/mdss-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,milos-mdss
> +
> +  clocks:
> +    items:
> +      - description: Display AHB
> +      - description: Display hf AXI
> +      - description: Display core
> +
> +  iommus:
> +    maxItems: 1
> +
> +  interconnects:
> +    items:
> +      - description: Interconnect path from mdp0 port to the data bus
> +      - description: Interconnect path from CPU to the reg bus
> +
> +  interconnect-names:
> +    items:
> +      - const: mdp0-mem
> +      - const: cpu-cfg
> +
> +patternProperties:
> +  "^display-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +    properties:
> +      compatible:
> +        const: qcom,milos-dpu
> +
> +  "^displayport-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +    properties:
> +      compatible:
> +        const: qcom,milos-dp
> +
> +  "^dsi@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +    properties:
> +      compatible:
> +        items:
> +          - const: qcom,milos-dsi-ctrl
> +          - const: qcom,mdss-dsi-ctrl

Use 'contains' and drop qcom,mdss-dsi-ctrl. Don't need to define the 
exact list of compatibles here. The full schema does that.

Rob

