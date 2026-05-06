Return-Path: <linux-arm-msm+bounces-106095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBNACJMO+2mbVQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 11:49:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E364D8E76
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 11:49:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4280530089A1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 09:49:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 405953E3D86;
	Wed,  6 May 2026 09:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BNKEG57w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF7A287503;
	Wed,  6 May 2026 09:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778060943; cv=none; b=Rrh0zts8l56qcFr91IrkuVLPMpFCnV9ZZDdShOXpAzbrC0oWV8sd0u4rcLQmaPTb9uIkJYSEWEFC+rvtO6WqXasyS3FdSkZg2w98bsyKWz19xs3y/WmsK2KLNcReKzGbBBv1EVqNFteAAGt55xC+drJ8dGujTsm3WXEv3PPa5q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778060943; c=relaxed/simple;
	bh=XXKSxp/zS4TYdq5eOGTjJv8B0I2YZNg8KRqSEtv/RYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SBFM5foRkQ/SLg6UeCRYj/fNmU+U87f5ZSGgW4UrXO4K1mqN8uskYLSo+XS6xiWbYoFdHrsEAug6QYoXY+Iv9mmFKopm5sT55DlEVk0ePKPRQW6zkTQxYxfkeWv7qDuZqeXsQp4sXc0A50KwgRkOS77FIUPSh7i16ONq9L6Otqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BNKEG57w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C785C2BCC4;
	Wed,  6 May 2026 09:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778060942;
	bh=XXKSxp/zS4TYdq5eOGTjJv8B0I2YZNg8KRqSEtv/RYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BNKEG57w4a82X1FUPJmzp86eqSXj1U/cBshiraI329C8RZJGloe710+k4CvABzOtx
	 njYOukFyMQRQVR2FfyhVR46FYpQ0yBhyu0YyDT9S8TkdouefLsFXgtRRwUG0+EdYBC
	 X61+MWkqxSbLizlga/sT683uFc3J8IJEFxrCTpSvi6TF94rh5Sa7niH6ezoBv0857M
	 1IEgobknIqgPxidGv3LOLeuIbRg5VUEelsfxOGApB0/SRaIX8E8+ZYO+LdtOjprSgw
	 2BoB2KdOQFTZkHi8+7FI3rBwfJJvU1zD1IJ/h8kUR6LTi6qB0rzJrXkZhgzyQ7n7Nv
	 7dvopyqV3lIUQ==
Date: Wed, 6 May 2026 11:49:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Catherine A. Frederick" <serenity@floorchan.org>
Cc: andersson@kernel.org, sboyd@kernel.org, krzk+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: clock: qcom,rpmcc: Add MSM8920
 compatible
Message-ID: <20260506-frisky-glossy-bee-b33aac@quoll>
References: <20260505203845.192140-1-serenity@floorchan.org>
 <20260505203845.192140-2-serenity@floorchan.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260505203845.192140-2-serenity@floorchan.org>
X-Rspamd-Queue-Id: B4E364D8E76
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106095-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]

On Tue, May 05, 2026 at 04:38:40PM -0400, Catherine A. Frederick wrote:
> Document new qcom,rpmcc-msm8920 compatible with rpmcc changes.
> 
> Signed-off-by: Catherine A. Frederick <serenity@floorchan.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Please organize the patch documenting the compatible (DT bindings)
before the patch using that compatible.
See also: https://elixir.bootlin.com/linux/v6.14-rc6/source/Documentation/devicetree/bindings/submitting-patches.rst#L46

With this fixed:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


