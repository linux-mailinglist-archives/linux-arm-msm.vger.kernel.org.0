Return-Path: <linux-arm-msm+bounces-94717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGbUNA4jpGmMYAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 12:29:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5FE1CF55D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 12:29:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 06D8C301441C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 11:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C958A2EDD7E;
	Sun,  1 Mar 2026 11:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kD8go24S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57832571D7;
	Sun,  1 Mar 2026 11:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772364554; cv=none; b=HCu0/8C+BvFCxXOQHcZ8rhqj+/YW8/zLsovUkdVNDpT6Ez7ZU/PaCd5uCCIftCm44/p5QanPsl4qJoVZK2ddJBbIygLZdbOP55yVriiNxukr6efFcVmrtTvuOxUyoez5u0ALpaF8lYFXbP6JWX86WMG1VAb1yca5Odq//ml+I1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772364554; c=relaxed/simple;
	bh=HzJ/8Ajvyh/GQoW1342yQbsQzt6fV16uQO7eJqYw94k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uhs9AUNQwrkiEdEeUahCLqBRx+akgtbm3/RXA5/bxFGYyUFVjX479hbTAhwNWWER43SyYEp6wGHfZ8Y1bjZ5QBllLtdl0EFn4Ic3DuAy+6Xra/j9hnYldLcs9nzQGqP1XPm4lvS2UCgXQ/UYjsL+1B4CwZ1pKs1rjAwwsQ+B3hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kD8go24S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 854DAC116C6;
	Sun,  1 Mar 2026 11:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772364554;
	bh=HzJ/8Ajvyh/GQoW1342yQbsQzt6fV16uQO7eJqYw94k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kD8go24SqcYYXv4bh49F7pX7s+sFCoI3jpaIPAyRxqhP71lG4bLTvJ+Lgas+bHzDV
	 pdkrz3tNENMJOCA31gHNffzX1fN5/gLzJIsLZ82LoP6y714N5QPf32EhYR/K3uQ9VP
	 C47fd7QWhM+abp4qFmBJ/dHrrKmsI0BE+K/i5zRujsxTsxkjHLzg9Pu9G8cxO1s+5Q
	 GIkrtbCC+tDuRqy8dolPKH/O4kez422fdlUYqV7vDIbc7ou1JbCPEoXYjr4Fj9TRKx
	 VP466jbBitBDjFnHSItdJa6UjXOJeVqCmFkvgm+FwTnqw/yO0aQsRTvIcsf7puiET/
	 xIHIiDxb2q5kQ==
Date: Sun, 1 Mar 2026 12:29:11 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 2/6] arm64: dts: qcom: ipq8074: Add the IMEM node
Message-ID: <20260301-nocturnal-cyber-zebu-90b1fd@quoll>
References: <20260228-imem-v3-0-20fbcc1a9404@oss.qualcomm.com>
 <20260228-imem-v3-2-20fbcc1a9404@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260228-imem-v3-2-20fbcc1a9404@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94717-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.131.57.192:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,79b0000:email]
X-Rspamd-Queue-Id: 4C5FE1CF55D
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 06:38:01PM +0530, Kathiravan Thirumoorthy wrote:
> Add the IMEM node to the device tree to extract debugging information
> like system restart reason, which is populated via IMEM. Define the
> IMEM region to enable this functionality.
> 
> As described, overall IMEM region is 24KB but only initial 4KB is
> accessible by all masters in the SoC.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq8074.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> index 256e12cf6d54417582a8b50e061f40719a4004a1..086b34ba7b09d68e24d2c1da28f303357ce503ea 100644
> --- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> @@ -625,6 +625,17 @@ qpic_nand: nand-controller@79b0000 {
>  			status = "disabled";
>  		};
>  
> +		sram@8600000 {
> +			compatible = "qcom,ipq8074-imem", "mmio-sram";
> +			reg = <0x08600000 0x6000>;
> +			ranges = <0 0x08600000 0x6000>;

Nope.

> +
> +			no-memory-wc;
> +
> +			#address-cells = <1>;
> +			#size-cells = <1>;

Nope. These are completely redundant and not needed. Post complete DTS
so you will see how your DTS and binding DO NOT WORK. Posting half-baked
code gives you opposite impression - that it is working...

Best regards,
Krzysztof


