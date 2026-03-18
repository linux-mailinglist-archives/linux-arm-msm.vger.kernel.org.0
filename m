Return-Path: <linux-arm-msm+bounces-98464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LnfBOSrumn9aQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:43:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B7D2BC3D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:42:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F3CDE30AAE4A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 13:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B00AD3D8132;
	Wed, 18 Mar 2026 13:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fms4/vDl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E6D3D6674;
	Wed, 18 Mar 2026 13:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841347; cv=none; b=azI8uNa3ecO0GIJCDlJlL/7nAeNSTZdtxMsTslIL+TJIgFkkzUHfpriSZekmxr+QVvQjZq8baHiswZ2pR3o1T2leJ6H5vAjEttBDQLtfyzZAwFUya4kZx4w0isLJFDTkiZOVxaILDnXhPzedkcJrGc1zi0R1xOB9k6MZ7Ro7WE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841347; c=relaxed/simple;
	bh=+E2Rot07NbcgB7zSsv56vz0z9u43QAN6vdk3enX4pBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fkcxCNyv99lNpkcd/QVQy1BED3hv4Awgpm5MtM4Yv41UZNKspPlQoCTk0cJkBvuBYjR/xgnyVviYItX7wcthV64L5nnEkndkmESwRXNnT9ee/MxQiy/mwiM06GdfbqJoD4v170tgNYOeANy1u538Xl23L+FcPuJ3skJdWr8eYgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fms4/vDl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05C41C19421;
	Wed, 18 Mar 2026 13:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773841347;
	bh=+E2Rot07NbcgB7zSsv56vz0z9u43QAN6vdk3enX4pBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fms4/vDlN03vWoEms+p0AJN80vDgcXrAIMy6UV7pUNwX7G9W485He2/OklYtX7bWY
	 dBGSvi1kowKe2k8TRLpg0VfzEle9TatY0p4KXtgLDWVlPMt9POQ9BI9l71nq+zx59T
	 o/cUL8ImhZ7KFFX4lc4so4yqIVeFR6kqD3ZRjq4jboBEGJkdW30JAStwOh24uUJxu9
	 QQAXFy9nRbMnViWWU22uwIOxpvEqbxWbr7xaud4OQ6lE5UWbKiMCv16NYmNWYXAyBe
	 iGXzvGHvAQMnIyx8K2WylPrFe1kIugBnbzObkWcsy3utIHO4OQFGLGsT1mWlCUMWRq
	 ClUSZUcPdj9xw==
Date: Wed, 18 Mar 2026 08:42:24 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Xin Liu <xin.liu@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com, 
	jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v2] arm64: dts: qcom: hamoa: Add PSCI SYSTEM_RESET2 types
Message-ID: <abqrLY8mLiAGugPK@baldur>
References: <20260226054113.4156874-1-xin.liu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226054113.4156874-1-xin.liu@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98464-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 69B7D2BC3D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Feb 25, 2026 at 09:41:13PM -0800, Xin Liu wrote:
> Add support for SYSTEM_RESET2 vendor-specific resets as
> reboot-modes in the psci node.  Describe the resets: "bootloader"
> will cause device to reboot and stop in the bootloader's fastboot
> mode.  "edl" will cause device to reboot into "emergency download
> mode", which permits loading images via the Firehose protocol.
> 
> Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>

How did you test this? I tried to apply this, but I'm getting 52 counts
of:

xyz.dtb: psci (arm,psci-1.0) 'reboot-mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'

Am I doing something wrong?

Regards,
Bjorn

> ---
> Changes in v2:
> - Fix mode-bootloader and mode-edl reset_type
> - Link to v1 : https://lore.kernel.org/all/20260209042700.1186392-1-xin.liu@oss.qualcomm.com/
> 
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index db65c392e618..a1bd8c3e4061 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -450,6 +450,11 @@ system_pd: power-domain-system {
>  			#power-domain-cells = <0>;
>  			/* TODO: system-wide idle states */
>  		};
> +
> +		reboot-mode {
> +			mode-bootloader = <0x80010001 0x2>;
> +			mode-edl = <0x80000000 0x1>;
> +		};
>  	};
>  
>  	reserved-memory {
> -- 
> 2.43.0
> 

