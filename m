Return-Path: <linux-arm-msm+bounces-109175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SACiODT5D2pDSAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 08:35:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D135AF920
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 08:35:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0E535303AF94
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 06:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87F21382F1E;
	Fri, 22 May 2026 06:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HqbTX5nn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E64344D9B;
	Fri, 22 May 2026 06:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779431705; cv=none; b=TeyJxHqJ+puBP3Fjc2sXwjLlqBEgvPnfpxiV5e2f8rfr3Ap+3/su0yxGrBgRa80eO0JeAHYWkYbf4oVn3rUfA+0+RQ0r8Fj+jmOFDjD6uITrbuEcQgR8n4nfw+O9grD/VKgsH4yxHVe84Si2Nwnv1MBlgMOOj6fI7+mHQnYg5b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779431705; c=relaxed/simple;
	bh=RPu0hsoLKcCmXW4qJ5kOATfjDOxCmWpnvd/o0luxc3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D8YTGBHfSpzgejXCrPFNNkfbhR/HUAPbIspvh/umqQzh3OTJXzURjSs4O6zz7onOT8Hj6sCpuOuxxQWK433euoGQTCaD3uGvPYYhnpYv5u8AePTeVtGsvvICPtaii6IFm0WYO563nB6UzApanqjR1f6mOyan9XK7Be9plYJccrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HqbTX5nn; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D7341F000E9;
	Fri, 22 May 2026 06:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779431704;
	bh=kf+dMDwyNXr6jkRtBvtEaNwwZ1VBJCjnQuZWi4ECY1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HqbTX5nn06W/vJwsXvEJp1L0Sw/K4LYK9tGYncVM9EcEXMY2XVza+e3JZf4R/nM+r
	 OcS2uXFsPG+O68XW47/YvqaI/YVndQCXZCoMQBs9lPkni7RZTxbKtEnGHeB42vBZPp
	 Zr271lBwFQi7gkiMenV435pVR9CzFcJtsfDDveRoVTkQ1Ekq91VIcxdoBTnPmgivBQ
	 BitSieNX/2Xiqv57/in5loFsvM2XNKZMy+TW5VkNqmww+YA9HJqhVRVWaKQgmFjQOk
	 zoWHI8tt3mTdPH50Z/w3XLWjC/AduDNudVeOgesQmiOsomvVnh39ZScRvu4a80oQ3L
	 UXG3jL7y4NwKA==
Date: Fri, 22 May 2026 08:35:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: cpufreq: qcom-hw: Document Shikra
 CPUFREQ Hardware
Message-ID: <20260522-massive-hopping-oxpecker-d9dcca@quoll>
References: <20260521-shikra-cpufreq-scaling-v3-0-883c13d1e514@oss.qualcomm.com>
 <20260521-shikra-cpufreq-scaling-v3-1-883c13d1e514@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260521-shikra-cpufreq-scaling-v3-1-883c13d1e514@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109175-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: 66D135AF920
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 07:36:04PM +0530, Imran Shaik wrote:
> The Qualcomm Shikra cpufreq hardware is functionally identical to EPSS,
> but supports only up to 12 frequency lookup table (LUT) entries. Introduce
> Shikra specific bindings to represent this constrained EPSS variant.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  .../bindings/cpufreq/qcom,shikra-epss.yaml         | 96 ++++++++++++++++++++++
>  1 file changed, 96 insertions(+)

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

There is no "qcom-hw" schema, so no clue from where did you get this
one.

Best regards,
Krzysztof


