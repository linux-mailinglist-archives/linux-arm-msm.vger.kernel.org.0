Return-Path: <linux-arm-msm+bounces-93738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBgeGqmCnGkKIwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 17:39:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C39179F12
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 17:39:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85D9D31AA128
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 16:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05486314A67;
	Mon, 23 Feb 2026 16:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tU+tAIO3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55EB311C1D;
	Mon, 23 Feb 2026 16:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771864311; cv=none; b=s7bq5lHszo2kV1Z0QswbEcm/NohiGGjGtjR715V0UAUx2HhvAo6MlIHSz1sbBiwnPOK2l3Ts6IlhgkTvaYv0HAtXwMQZo0+D5PunznvArygQhZmDllqb2YEh+Bu7HmiM/M8blnyXXrk6+n3Jub/POzmwt1lkBm2SNw2lxuIsIvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771864311; c=relaxed/simple;
	bh=mkZX9bthwOnmlihIsb3M3krfMhzFMjXTFrQo7kXeUwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XCVnuM1dw2Bqq/v1lFPYUiP6BTbc9HeKoALt1v3cieYy908MDR6Q4JaxOiuumtAipA1KAM5p6y3aBS8BVxN7JS2urPHeTKaDClohm/9TZWbEeQ6f23jzflb3S1RW+Wr4qOBgNtP0keC1GVGFq/LcwbZRBr32m7TuOYLrPcRA0KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tU+tAIO3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26DA3C116C6;
	Mon, 23 Feb 2026 16:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771864311;
	bh=mkZX9bthwOnmlihIsb3M3krfMhzFMjXTFrQo7kXeUwI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tU+tAIO3YmZseIcWYuwlghq1OcEArNepaNoS2z0/h/FS9nGusNkqA8YNmYNZdqqVC
	 XuKpMP8LASjAkHdfUbWQo8GRefrnJkkWTCjJrMdMmSOm/J8LtFo9kBXNOa+6dUeYni
	 u/wsewa6ns7ZkvkCSzef5AAKt86NGjD6KCWa+rU/XDqjBv6rhQcU0U1LI9G5dM4SNm
	 YYMKqTAy9dBABTqQzJwwrAbqZeIf5ipx3zdelOMZiowIT8e0AtNAqM9WIyHmLEFmbD
	 G6o1OR5/bxOWVBllLtS+vBw3COvs/1btKKRmFYlOVywA9uD3JRjU89Hgtxy8JAUlqp
	 z4pY4kqkQP4xg==
Date: Mon, 23 Feb 2026 10:31:48 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com, 
	krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org, 
	mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH V3 3/5] dt-bindings: misc: qcom,fastrpc: Add compatible
 for Glymur
Message-ID: <siuuvqcxcfw2be72hh2pu6csmw6qxy26ixnxppbfy7gtpzxxzd@vuucoicoj4h2>
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
 <20260129001358.770053-4-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129001358.770053-4-sibi.sankar@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-93738-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: B2C39179F12
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 05:43:56AM +0530, Sibi Sankar wrote:
> Document compatible for Qualcomm Glymur fastrpc which is fully compatible
> with Qualcomm Kaanapali fastrpc.
> 

I assume this means that you have successfully called at least one
FastRPC function on Glymur - with the WP firmware?

Regards,
Bjorn

> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/misc/qcom,fastrpc.yaml        | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> index d8e47db677cc..ca830dd06de2 100644
> --- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> +++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> @@ -18,9 +18,14 @@ description: |
>  
>  properties:
>    compatible:
> -    enum:
> -      - qcom,kaanapali-fastrpc
> -      - qcom,fastrpc
> +    oneOf:
> +      - enum:
> +          - qcom,kaanapali-fastrpc
> +          - qcom,fastrpc
> +      - items:
> +          - enum:
> +              - qcom,glymur-fastrpc
> +          - const: qcom,kaanapali-fastrpc
>  
>    label:
>      enum:
> -- 
> 2.34.1
> 

