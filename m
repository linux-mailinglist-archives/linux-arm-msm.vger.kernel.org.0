Return-Path: <linux-arm-msm+bounces-103235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMajDS9E32nzRAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 09:54:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 738BC401967
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 09:54:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8AD0630128C9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 07:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF55A3AC0C4;
	Wed, 15 Apr 2026 07:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EsvKsX22"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8920D391856;
	Wed, 15 Apr 2026 07:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776239058; cv=none; b=D5ENLUqREuNWNHkYkAXdG3O57uHtdawYCj0z2uctDJysK0bWCtMf+3gngYvHJMJb/rgSepyUkWCQxqKbMjwJCIZatWTUsYCGHAFr/FZaipmISoQr+lpaVz7AToTrTzRn04+keqn1aU5g1yc1CAtWK75CgszPLfolYAtPa8e5DhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776239058; c=relaxed/simple;
	bh=IpVNfJ9DJKRrgDgRGsPo+kUo+1XlJ8lK8e+SU0EKmxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KYwi+8s4p0bOiHYPKgppJf/4cTQL2NkOskFdvb6LRs7YWNT/Uhh+trXCAcJKfk7HLK+72gr9Yu5ARBV9ia0pWLfriyiQ90UQFzPPnSUNHvmsvOYyqji1XuuqbxH0et0n8NRaVF/g+SqjxyVi5mqeoYV/vMdVwHcrKqW9LlRUD18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EsvKsX22; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A9EEC19424;
	Wed, 15 Apr 2026 07:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776239058;
	bh=IpVNfJ9DJKRrgDgRGsPo+kUo+1XlJ8lK8e+SU0EKmxY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EsvKsX22T4W/rAfDQ7E3wFklFMejdHbKl9PhiB5jzUCfhByHQf1Tz7mj61GB71r5q
	 nRv6D3/WwmobztRnRK5M87XjDt9QwURXH+5FzixW77EfNU8eQE3SlUEtc802VbQS0E
	 6dzeh+F8o3o6FlZ8N0/SdcjNcWfMEKBwsh+6IPHhkB2Tqra+GpE6QV0qmJfwK+z/Ez
	 NhIzHwy6H0PjpkFPkdk+G5TPQ3fLzWJ+1JxvGx6jpYNX2Tj8OMREpShvZMfnrnIMCw
	 4crsLoyWn8jkssAhNHcjdItgYVa53xNJmvuCgZya7QxAlTrAhMXNQhEWY0AKLLgsW+
	 M38Ymz3lbt3XA==
Date: Wed, 15 Apr 2026 09:44:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] arch: arm64: dts: qcom: Add support for PCIe3a
Message-ID: <20260415-pragmatic-termite-of-attraction-3dbab5@quoll>
References: <20260412-glymur_gen5x8_phy_0413-v3-0-affcebc16b8b@oss.qualcomm.com>
 <20260412-glymur_gen5x8_phy_0413-v3-5-affcebc16b8b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260412-glymur_gen5x8_phy_0413-v3-5-affcebc16b8b@oss.qualcomm.com>
X-Spamd-Result: default: False [5.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103235-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[13];
	R_DKIM_ALLOW(0.00)[kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	R_SPF_ALLOW(0.00)[+ip4:172.105.105.114:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	NEURAL_SPAM(0.00)[0.139];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.1.134.160:email]
X-Rspamd-Queue-Id: 738BC401967
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 12, 2026 at 11:26:00PM -0700, Qiang Yu wrote:
> Describe PCIe3a controller and PHY. Also add required system resources
> like regulators, clocks, interrupts and registers configuration for PCIe3a.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

subject: drop arch.

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 316 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 315 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index f23cf81ddb77a4138deeb4e00dd8b316930a2feb..c15f87c37ecbad72076a6c731f4959a1a8bd8425 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -736,7 +736,7 @@ gcc: clock-controller@100000 {
>  				 <0>,				/* USB 2 Phy PCIE PIPEGMUX */
>  				 <0>,				/* USB 2 Phy PIPEGMUX */
>  				 <0>,				/* USB 2 Phy SYS PCIE PIPEGMUX */
> -				 <0>,				/* PCIe 3a */
> +				 <&pcie3a_phy>,			/* PCIe 3a */
>  				 <&pcie3b_phy>,			/* PCIe 3b */
>  				 <&pcie4_phy>,			/* PCIe 4 */
>  				 <&pcie5_phy>,			/* PCIe 5 */
> @@ -3640,6 +3640,320 @@ pcie3b_port0: pcie@0 {
>  			};

...

> > +		pcie3a_phy: phy@f00000 {

Same comment as before.

Best regards,
Krzysztof


