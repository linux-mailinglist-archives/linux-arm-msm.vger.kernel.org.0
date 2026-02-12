Return-Path: <linux-arm-msm+bounces-92730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMOOIAMyjmkxAwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 21:03:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C19B130D67
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 21:03:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E2422300C579
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 20:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D7E623C4E9;
	Thu, 12 Feb 2026 20:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bca4zLBj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7719B41760;
	Thu, 12 Feb 2026 20:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770926590; cv=none; b=ChniKo1RjgjL21slG/4RRtVvC1rbIqwoVyJaporwn24vkK4DFyk6idCj58Q2UmLq21WoK3cyr1n9FC1uGjk0kg9yILU6dOF7cDyJxCuKvqnZnxkCHwVBj5PK9zPnTi3garMNnmpJ4HaVpz0bhKH1OO0WHOv8IF5p5u7LzJV1rMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770926590; c=relaxed/simple;
	bh=GPEUQGmmj3bv2i7mHANvX5AamGNwb839uTXselHOQ70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oCYEmsTte4jgagLiRDMQ5Q/pMfF9gjh5Ltfcbn+uXfFZXmdynvjmcOdoAmQp6496hWmWw9aR3EGQruXnP737q9kNqu1GpvZ9hieNLsmQzqtfxe826u05WLBsvbdn+s6ggHMnVMT+SnXo+X+5I4mq7Fv9el/hW2kVWPilj16PheE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bca4zLBj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D56B0C4CEF7;
	Thu, 12 Feb 2026 20:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770926590;
	bh=GPEUQGmmj3bv2i7mHANvX5AamGNwb839uTXselHOQ70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bca4zLBj9KCAuftboa7BeYhac4SQvVGWo+Cki4klGZvdXdMefG2C6U3pBbUW7e8q3
	 EdYsL+xoEmLWdto55zN+LrxAGuAMj2TNewxQOF+5KVzLppAS770j5xZFmh+8knODPr
	 ZSxI2occsh9RaQoLk1U8BoJarb6h8cXRUszTftDiNfwoSYDmXbFUC1f3gTvevUaiDq
	 1S8V+l4bCgGu2kFM1coBMPXCy4ORPSi90XHD9+NWZ5XMlZgQPJxg05hhjaCOegNyXM
	 txlgV5oc2zNuoeYSErzIiZLirq3U9ICz2dJmwrfe8eWRq0qkpxxdRbYbztHnlIYLdn
	 d/W8QhN/YShcg==
Date: Thu, 12 Feb 2026 14:03:06 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, richardcochran@gmail.com, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mohd.anwar@oss.qualcomm.com, 
	krishna.chundru@oss.qualcomm.com, monish.chunara@oss.qualcomm.com
Subject: Re: [PATCH 1/1] arm64: dts: qcom: monaco-evk: Add Mezzanine
Message-ID: <z7y7gpfhrxgsxsqlsxmkwyr3zemvwpnpfuegv43ne56g5rsfl4@pehu3vloqjsy>
References: <20260210103821.4169-1-umang.chheda@oss.qualcomm.com>
 <20260210103821.4169-2-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210103821.4169-2-umang.chheda@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92730-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.52:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9C19B130D67
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 04:08:21PM +0530, Umang Chheda wrote:
> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-mezzanine.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-mezzanine.dtso
[..]
> +&i2c15 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;

Do we need to repeat this? It's in the top-level i2c15 definition
already?

> +
> +	status = "okay";

I presume this overlay is used on top of monaco-evk.dtb, which already
says that status is okay.


That said, I don't see a "clock-frequency" in either node, so I presume
you have an error/warning in your kernel log about this. But unless you
have reason to change that in your overlay, I think that's a unrelated
patch on the monaco-evk.dts - which I would like you to send, separately.

> +
> +	eeprom1: eeprom@52 {
> +		compatible = "giantec,gt24c256c", "atmel,24c256";
> +		reg = <0x52>;
> +		pagesize = <64>;
> +
> +		nvmem-layout {
> +			compatible = "fixed-layout";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +		};
> +	};
> +};
> +
[..]
> +&tlmm {
> +	tc9563_resx_n: tc9563-resx-state {
> +		pins = "gpio124";
> +		function = "gpio";
> +
> +		bias-disable;
> +		input-disable;
> +		output-enable;
> +		power-source = <0>;

Does these properties really match the TLMM binding? Please double
check.

Regards,
Bjorn

> +	};
> +};
> --
> 2.34.1
> 

