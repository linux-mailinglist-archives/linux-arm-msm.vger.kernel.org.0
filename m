Return-Path: <linux-arm-msm+bounces-106792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id C4RvCEz7/2lNBQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 05:28:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2B75025F9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 05:28:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85CC330160E5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 03:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8666F2248A0;
	Sun, 10 May 2026 03:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h9OPIIG4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B749175A7C;
	Sun, 10 May 2026 03:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778383686; cv=none; b=KLS07+Ix/mWmc8SRzG2sggQnnhxkJ7hdIq7KzpJ2eXVqYtZr1YtEfS3YP7ftg2hyIzP8uixqqUN82Wx0+Rf9vbiBUeRl5Rgt8S11GTrJa9eMO2BC3N4PfFaDVpGThi5V0vioOsI66PHnahz16DKuuMT8g8hNxaawr/721kKrBM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778383686; c=relaxed/simple;
	bh=YWPSVrJSk9to5+GJb6slS1Gcg11UmRRBr3afpfQuQoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bJ2E1A6XVKoWGzTgK7j0o2bMvignkKk6o/GY4PCyKftRlaRpAWBzkYjsbUacw9poms+/fi6qifuCIiKjd5WK5XUAWsc0N98wtYMIAmFZ1oGE0BEXoBOT7kiRDyzoWWfEduRL7bZV0N622qfhU/KaKVqQ6lHBoBf6zEHyrQumpCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h9OPIIG4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59B55C2BCF5;
	Sun, 10 May 2026 03:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778383685;
	bh=YWPSVrJSk9to5+GJb6slS1Gcg11UmRRBr3afpfQuQoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h9OPIIG4EctLH09eTqvIiPF4HhyGkw4eKml9aBTYtMgNl9g42K4fdxPjYfzH31MZW
	 0qSiYMvbMfP82ZzVIYn51+2K/Hr+8vFdxXGEOfyk9oRyJM7PMVFst5fFZlnIijQP2Y
	 xp3E0BBCgL2vVVp/Uu/S0c6rQDauPhW7UR7kXG+JwhpSr9TmVEa5e1jsXocB8U4JsY
	 N124cTZjD6N/5JxGQ8hUjNCCY+6j1HQ4QEES2I8KTjZ6tSjxiL4X+I7aDREFc0iIGJ
	 dWzAc1BFUUhs5wJAN6g7d+SXX8vcMb3U61ysF0eqISAPjhzIuQsw+AZFQULEfHUMo8
	 XgDb3ae+U0aZA==
Date: Sat, 9 May 2026 22:28:01 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Add psci reboot-mode edl
Message-ID: <af_49utiHCPDlbEd@baldur>
References: <20260505-glymur_reboot_mode-v1-1-59fe3e9a6868@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505-glymur_reboot_mode-v1-1-59fe3e9a6868@oss.qualcomm.com>
X-Rspamd-Queue-Id: 7B2B75025F9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106792-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Tue, May 05, 2026 at 07:07:27PM +0530, Pankaj Patil wrote:
> Add PSCI SYSTEM_RESET2 reboot-modes for glymur to be invoked by the psci

"Glymur"

> reboot-mode driver.

https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
states that you should start your commit message by describing the
"problem" your patch is addressing. This commit message fully assumes
that the reader already knows everything about this topic and why this
should be added.

> 
> The following modes are defined:
> - edl: reboot into emergency download mode for image loading via
> the Firehose protocol.

I presume that would be the Sahara protocol, but you don't need to be
specific about how that implementation works. It's sufficient to say
that "edl" reboots the device into "emergency download mode (EDL)".

> 
> Support for these modes is dependent on the psci firmware

What are the implications of that?

> 
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 6 ++++++
>  arch/arm64/boot/dts/qcom/glymur.dtsi     | 2 +-
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> index 2852d257ac8c..397519e95ca1 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> @@ -560,6 +560,12 @@ &pon_resin {
>  	status = "okay";
>  };
>  
> +&psci {
> +	reboot-mode {
> +		mode-edl = <0x80000000 0x1>;

Does the statement about "psci firmware" somehow relate to the fact that
this is defined in the crd.dtsi?

> +	};
> +};
> +
>  &tlmm {
>  	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
>  			       <10 2>, /* OOB UART */
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index f23cf81ddb77..7f426efe40ab 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -382,7 +382,7 @@ pmu {
>  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
>  	};
>  
> -	psci {
> +	psci: psci {
>  		compatible = "arm,psci-1.0";
>  		method = "smc";
>  
> 
> ---
> base-commit: 9d0d467c3572e93c5faa2e5906a8bbcd70b24efd
> change-id: 20260407-glymur_reboot_mode-4441770e6a8a
> prerequisite-message-id: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>

As far as I can tell from the discussion, that's not settled yet.
Not sure what you want me to do with this patch then...

Regards,
Bjorn

> prerequisite-patch-id: 70829f19896a982ef4ac19fa82bf571b9eb6defa
> prerequisite-patch-id: 600337ba5717c51204c4f426acb28bd6287e56ec
> prerequisite-patch-id: e7a6e85c94e35b71c9813c322e811a270233c854
> prerequisite-patch-id: 7bb3e4b151f32129e8ce5d3c1015150cbd741d13
> prerequisite-patch-id: a61561c5070b9485399a840ff48252842393f01a
> prerequisite-patch-id: c7f5c86cf5f88c6d5dd576565bcce25ee3848b19
> prerequisite-patch-id: e4d851cd0a6dfb96d62e4c9d3ebfa1422b9571a6
> prerequisite-patch-id: e6ffbbec586e6c4b508bd366615e33928a910190
> prerequisite-patch-id: 8ae267aee51f48992d2232f18dc5795b08fd8e54
> prerequisite-patch-id: 10b585e49a96767c3324c9e3c623a4716a641fda
> prerequisite-patch-id: 5abbfae8b6577899e0423b36b4690adf1046cac2
> prerequisite-patch-id: edb89ac23b7a3d5ade9b9cc1e1a77ee4d1a663cf
> prerequisite-patch-id: 555f1b64be3631d6286f2f1e140dc38c6935d646
> 
> Best regards,
> -- 
> Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> 

