Return-Path: <linux-arm-msm+bounces-91989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPPDD8CjhWmSEQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 09:18:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FE4FB5F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 09:18:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C6A430214F4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 08:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AE5B346E4F;
	Fri,  6 Feb 2026 08:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cSdLnLKN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E9B329E76;
	Fri,  6 Feb 2026 08:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770365629; cv=none; b=R1ClmRo/4IdV8TGjUukl/DkbNGvN9y31siYLPVFDfYr7yRQfZwN6ZYQppiEXcKcjCdCkgDJgG+COrwJtHKZ6KQ2PvSqQ4ks3/X5smbiUkKiDpgeLoEfi2Z2IOf4Wv0UgaBtLoY9xPlYQSSMvRsUtr8fOc8N4S0znuQyZ+hHv9P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770365629; c=relaxed/simple;
	bh=XNd/ROqNyRqr73VdIsPaszFD6uulu/C2d7UO1LLQVMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B7o3rUK3f8EiYgYJq8COrGbQdj0nMO30Ssp7/YspjpuEloBc+94q2AeJ6p8d2HlhV8juptLtDLCzFN/kCq4evQi/gHN19WqF9iDlYRaWnZ9ySTrlQ5YmH7fC2e2DHWWfWMJdeJBdrtprwpXVSn16gmYJzZlJ9IkakR3rdN9mPPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cSdLnLKN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DD4DC116C6;
	Fri,  6 Feb 2026 08:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770365628;
	bh=XNd/ROqNyRqr73VdIsPaszFD6uulu/C2d7UO1LLQVMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cSdLnLKNFicB/wGv9USjTmGWdswlkUQKYsSxCk59qtANCXuOZW3vTQAcKRQufyB1P
	 sJaTgnpAk/YxC74veb0YNZxPQbz1urocsqDz6PsK3BpQJc0VzzfUC+E0hU5Ab+ktFe
	 C9IlYpkSQV2nYMrdrIVHkMGvWFJBhkiQ5MtGicg/poorHGhVPLH0em9ip9XIwkoGQa
	 5UfkvZgzVGeR7HT1yl+xkcMBVcDvsF7MmYhmS2HXUGfMRkhGg8w3eQFTG9mG8TncYy
	 0RdaqBixwGouflZGkmGuUBiP3nhvuNt892lUJB6HrYgwnk3/2/d7bR3bDRezaur3Os
	 9/BEQ0GAFeXTw==
Date: Fri, 6 Feb 2026 09:13:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	amit.kucheria@oss.qualcomm.com, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>, linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: pm7250b: Enable Qualcomm BCL device
Message-ID: <20260206-tidy-aquamarine-cheetah-2badc0@quoll>
References: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
 <20260206-qcom-bcl-hwmon-v1-3-7b426f0b77a1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260206-qcom-bcl-hwmon-v1-3-7b426f0b77a1@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-91989-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[1d00:email,qualcomm.com:email,c000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree-specification.readthedocs.io:url]
X-Rspamd-Queue-Id: D3FE4FB5F3
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 02:44:07AM +0530, Manaf Meethalavalappu Pallikunhi wrote:
> Enable Qualcomm BCL hardware devicetree binding configuration
> for pm7250b.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/pm7250b.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
> index 0761e6b5fd8d..69ad76831cde 100644
> --- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
> @@ -202,6 +202,16 @@ pm7250b_gpios: gpio@c000 {
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
>  		};
> +
> +		bcl@1d00 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
If you cannot find a name matching your device, please check in kernel
sources for similar cases or you can grow the spec (via pull request to
DT spec repo).

Plus, I doubt this was ever tested. Considering lack of internal review
I do not think this should be posted.

Best regards,
Krzysztof


