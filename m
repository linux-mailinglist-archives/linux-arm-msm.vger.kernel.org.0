Return-Path: <linux-arm-msm+bounces-95431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFjoCRqAqGmYvAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 19:55:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A017206AF4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 19:55:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB52D303D2C8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 18:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 518303D6CC6;
	Wed,  4 Mar 2026 18:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QJWkbwba"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291853D34AA;
	Wed,  4 Mar 2026 18:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772650339; cv=none; b=O+isid8uTPdYtvO/fqSkQNOEQD2jo9J6GBepMZM2dXfu8QxmxUMiOrJBg+Vkc5zMQ8Gp5Yjk/nOE24ZKWBtY5UdPYUI5kCi1L0ITJOmZuae6AWl1A3VYVtRf5PuCuuulxgqruTX/gS4PqlvgMEhxk6Rzy5w31CJN/Ci2WB5Rg20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772650339; c=relaxed/simple;
	bh=DDFFy501pyxspfWhkdcUxEKpUA/8TVxM3OGvXEIiwRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o7pqeNBggfHX/Z0589+a+8XymWSc+6/QcPrGNIeZSwsrthNCxMZKIg6J5imGUhUS/NnXxZmgv7/Sed/WbG84BsSg0wcHTkDgBJH1TM5muaOYJD98WPK7mpF1WYDuhgHWu53YeJNH5sVtMU/nf6pXLg9SmwLYLy+Cc8J25Ggwl48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QJWkbwba; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A829BC4CEF7;
	Wed,  4 Mar 2026 18:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772650338;
	bh=DDFFy501pyxspfWhkdcUxEKpUA/8TVxM3OGvXEIiwRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QJWkbwbacfYJo+IuwGLW6H5IhxxBfJC1lZTnSzdl1LXiWUZLlRdB4RIK47OyWVY3C
	 UZ9YjjTC7VZgSNQejFfJzVjhqqOl5KpYM0hSTGCaZ7MZ0VdLgZba3dhh/eX4wT4zLC
	 epTOMbEQOKHwcWKhbP01s9o1O2kJpEq6ja0aGC3rrUaYzILV2eGTgucK8vR4PFyGFJ
	 +ZlVGry/WP8a2dTlk+PiB2AbhWPczTyqyrdvT6FGxXuMZHW/o3uDsGCc8+jsd4P42W
	 NoPWys8q72nbXXNcaeE7aq+uy5wQ5l2nHpSZR6YRTJpPHgRPnJmZljA9G1RIEJUTDk
	 VyiUoWcDgdwIA==
Date: Wed, 4 Mar 2026 12:51:54 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Gabriel Gonzales <semfault@disroot.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, Biswapriyo Nath <nathbappai@gmail.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Correct
 reserved memory ranges
Message-ID: <xgcv6gcaw6xxelkafo23waz4sbw2cycas45qhzxkfhbeuukzbe@wwssuc44mp7y>
References: <20260126-xiaomi-willow-v3-0-aad7b106c311@mainlining.org>
 <20260126-xiaomi-willow-v3-2-aad7b106c311@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260126-xiaomi-willow-v3-2-aad7b106c311@mainlining.org>
X-Rspamd-Queue-Id: 7A017206AF4
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
	TAGGED_FROM(0.00)[bounces-95431-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,disroot.org,intel.com,igalia.com,gmail.com,vger.kernel.org,lists.sr.ht,mainlining.org,oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 05:34:52PM +0100, Barnabás Czémán wrote:
> The device was crashing on high memory load because the reserved memory
> ranges was wrongly defined. Correct the ranges for avoid the crashes.
> Change the ramoops memory range to match with the values from the recovery
> to be able to get the results from the device.
> 

FYI. If you add "memtest=1" to your kernel command line the kernel will
sweep all memory at boot, which tends to flush out most such issues.
Then you don't need to rely on "high memory load" for testing for such
issues.

Regards,
Bjorn

> Fixes: 9b1a6c925c88 ("arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts | 41 ++++++++++++++++-------
>  1 file changed, 29 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
> index bf03226a6f85..d5e5abdb3b2f 100644
> --- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
> @@ -13,6 +13,12 @@
>  #include "sm6125.dtsi"
>  #include "pm6125.dtsi"
>  
> +/delete-node/ &adsp_pil_mem;
> +/delete-node/ &cont_splash_mem;
> +/delete-node/ &gpu_mem;
> +/delete-node/ &ipa_fw_mem;
> +/delete-node/ &ipa_gsi_mem;
> +
>  / {
>  	model = "Xiaomi Redmi Note 8";
>  	compatible = "xiaomi,ginkgo", "qcom,sm6125";
> @@ -36,28 +42,39 @@ framebuffer0: framebuffer@5c000000 {
>  	};
>  
>  	reserved-memory {
> -		debug_mem: debug@ffb00000 {
> -			reg = <0x0 0xffb00000 0x0 0xc0000>;
> +		adsp_pil_mem: adsp_pil_mem@55300000 {
> +			reg = <0x0 0x55300000 0x0 0x2200000>;
>  			no-map;
>  		};
>  
> -		last_log_mem: lastlog@ffbc0000 {
> -			reg = <0x0 0xffbc0000 0x0 0x80000>;
> +		ipa_fw_mem: ipa_fw_mem@57500000 {
> +			reg = <0x0 0x57500000 0x0 0x10000>;
>  			no-map;
>  		};
>  
> -		pstore_mem: ramoops@ffc00000 {
> -			compatible = "ramoops";
> -			reg = <0x0 0xffc40000 0x0 0xc0000>;
> -			record-size = <0x1000>;
> -			console-size = <0x40000>;
> -			pmsg-size = <0x20000>;
> +		ipa_gsi_mem: ipa_gsi_mem@57510000 {
> +			reg = <0x0 0x57510000 0x0 0x5000>;
> +			no-map;
>  		};
>  
> -		cmdline_mem: memory@ffd00000 {
> -			reg = <0x0 0xffd40000 0x0 0x1000>;
> +		gpu_mem: gpu_mem@57515000 {
> +			reg = <0x0 0x57515000 0x0 0x2000>;
>  			no-map;
>  		};
> +
> +		framebuffer@5c000000 {
> +			reg = <0x0 0x5c000000 0x0 (2340 * 1080 * 4)>;
> +			no-map;
> +		};
> +
> +		/* Matching with recovery values to be able to get the results. */
> +		ramoops@61600000 {
> +			compatible = "ramoops";
> +			reg = <0x0 0x61600000 0x0 0x400000>;
> +			record-size = <0x80000>;
> +			pmsg-size = <0x200000>;
> +			console-size = <0x100000>;
> +		};
>  	};
>  
>  	extcon_usb: extcon-usb {
> 
> -- 
> 2.52.0
> 

