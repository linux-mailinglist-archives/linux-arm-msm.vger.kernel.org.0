Return-Path: <linux-arm-msm+bounces-107724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJWMH3HFBmpdngIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 09:04:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 245F554A490
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 09:04:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58CA9300B459
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 06:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA4973D16F4;
	Fri, 15 May 2026 06:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XYaxhyrt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866CA3D0BFB;
	Fri, 15 May 2026 06:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778828262; cv=none; b=XXbPNAkD4tS1Y2K8txG1TUS4Z7z7XtcZ7aNg7r/gV/sYtw03y6Fp+GuKEdUNaqQMtmCKTTWYEzVzeaQ5xd6WUM8o4mccXZ+6SofWN9bdOl7WbE9B7nPfEWGdH+CTX4yxTyLBo5N6gGwr4xLoPPMDq1MwbB914WEHPKw4EeDXtUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778828262; c=relaxed/simple;
	bh=C/uVgaCk+0ONdBsRi2b2U8nB0CpWBlSZqS0MY5elNMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HXFXtBb56r196q9VR7gVLHj3gvRKKbFgxyMiR/q06s9SS+fsuxxsI3WUINvR9JUXrMZhwmHxlzc9e2JAkiKGLUqoyW5rlbOCYG232AQ81rQyfvAU2IpIoOLKukUVnU0ByrJzn5skhHKijaebzTZ6Hm2RSAL4Po2QaLTDuW6O54g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XYaxhyrt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 796E8C2BCB8;
	Fri, 15 May 2026 06:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778828262;
	bh=C/uVgaCk+0ONdBsRi2b2U8nB0CpWBlSZqS0MY5elNMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XYaxhyrtutBki+BWRIAz8vmoFJe2050IY5jEtXpgygk2avypynphIbMRsAAgVFUk/
	 U9R0DbuEH0HyuJa6tZtKPM4GhkcAo0784LcWDJOLhqMghAneTqTaCCiaiJL6XSuFd5
	 1JDsm5vCIVuPtmwMXkODWIZdNv4pAJygEiuZ/w96j/6vd0trM7vIF1UG5Mt2B9ESH9
	 swnzbFpBm6/UZdXdl+K+Htb7OjjNRdV79TrDtWdDXAcOjo3TqmaXfJieiYxtBstYDh
	 xsWwgNn1ns8nbIkOarlAA1wpVRVK6t3Z7ZQMnRFkGgKF5DWwNIKOaMZh0kJUeZieA2
	 PxLpcYOnwgeTg==
Date: Fri, 15 May 2026 08:57:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
	Rudraksha Gupta <guptarud@gmail.com>
Subject: Re: [PATCH v2 02/10] dt-bindings: mfd: syscon: add
 qcom,msm8960-sps-sic
Message-ID: <20260515-loyal-sassy-eagle-f98195@quoll>
References: <20260514-msm8960-wifi-v2-0-7cbae45dab5e@smankusors.com>
 <20260514-msm8960-wifi-v2-2-7cbae45dab5e@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260514-msm8960-wifi-v2-2-7cbae45dab5e@smankusors.com>
X-Rspamd-Queue-Id: 245F554A490
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107724-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,smankusors.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 09:08:31PM +0700, Antony Kurniawan Soemardi wrote:
> Add compat for Smart Peripheral System (SPS) Interrupt Controller (SIC)
> present on Qualcomm MSM8960 SoC.
> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


