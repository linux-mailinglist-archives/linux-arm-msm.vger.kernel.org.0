Return-Path: <linux-arm-msm+bounces-91946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mC5/AHvChGk45QMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 17:16:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BC0F51CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 17:16:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4CD8C3011F08
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 16:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73EAA34B40C;
	Thu,  5 Feb 2026 16:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YWgi0vdP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517062C0F91;
	Thu,  5 Feb 2026 16:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770308172; cv=none; b=aAzLej6L8Q4Ft6q8HPwW0Npu/mUS/gPpzodLJNxzaLj+VoPCoHed2YT2W6vkJH1Nyz8v75lQ9+A7ioLtlLXkNP2yWP2V4JOqsukkB5f5W+Ex0CfRN6Oc1+vL4yfpbCX++o+sjFr+bNcpGgfQpgLjRSIEzuk5ux6dVVrUisg9wWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770308172; c=relaxed/simple;
	bh=OuU3w73cXMucvzsfiLP6vH5DxTYnTcrsj2hMDAY7cO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j7z/GTdXxi1D/6NKSHWevRKD23eqzJwEIGXYRvkd71LLEnUqbby9lijuNgpoUFbl/GjrSa7hFhv2wV1pWswjERj9GgehYko7GlXcsWkwcoOGSsGFUHhMSMCuZNPS2lLrsbIRB2alNaNmT8ez6P2G4umvo6XdPU7r88GbyMF3CNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YWgi0vdP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBD92C4CEF7;
	Thu,  5 Feb 2026 16:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770308171;
	bh=OuU3w73cXMucvzsfiLP6vH5DxTYnTcrsj2hMDAY7cO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YWgi0vdPZ06CKg6c7LcgQzsMFc8AeWDUNf/avb6NvbPW3XlJHqw3A1PtspdFcYIQX
	 /U0ox+/63AlOe6rAXKoObWaj6q/uT6UxfADewa3nvwXbE32F+ItuDJSAoNMbPOR8Bm
	 +0U9YspLBsZtXMMnVgs4aFaYbDVZEXQWeuPLOLMKsa2r3Jk94F3lFNZ3Y07pMFhfRO
	 TDrUltAIaCTFmmOCAsQJyU//dEEIIcDgHollKpW7sP1C8Kq/wxUwpN53OtfHaFJyQt
	 u2m8U+DRpPppmecRz3SpMjcHT/z5/RJb8ADhEMtz2vRahFwir3auD0m364GtwW8cgz
	 MieJaZej4UMqQ==
Date: Thu, 5 Feb 2026 10:16:08 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v7 2/4] arm64: defconfig: Enable Glymur configs for boot
 to shell
Message-ID: <hegsqmdmf6yey2ubcsyx7i2l77vplwzmthmyrpvmvu2nrpiag7@gxg7bdk7or2o>
References: <20260205-upstream_v3_glymur_introduction-v7-0-849e7a9e6888@oss.qualcomm.com>
 <20260205-upstream_v3_glymur_introduction-v7-2-849e7a9e6888@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205-upstream_v3_glymur_introduction-v7-2-849e7a9e6888@oss.qualcomm.com>
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-91946-lists,linux-arm-msm=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 47BC0F51CE
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 05:50:42PM +0530, Pankaj Patil wrote:
> The serial engine must be properly setup before kernel reaches
> "init", so UART driver and its dependencies needs to be built in.
> Enable its dependency clocks,interconnect and pinctrl as built-in
> to boot Qualcomm's dev platform - Glymur CRD board to UART console with
> rootfs on nvme storage.
> DISPCC enabled as module, used for display.
> 

I'm sorry I missed this earlier, but what are you actually saying in
this commit message?

Subject is lacking "Qualcomm" and "boot to shell" doesn't mean anything.

You're talking about serial engine and init, and how that relates to
UART needs to be built in. So this must be the most important part of
your patch? No, those drivers where enabled in November 2018...

Then follows a problem statement (problem statements are good!), saying
that we're enabling the dependencies of the UART. This is good as it
allow us to reach "init" with a working /dev/console (the reason for
=y).

But your mixing this up with "rootfs on NVMe storage", which might
follow from being able to reach "init" with working UART, but it's not
the same "problem". What I do believe relates to "rootfs on NVMe
storage" is the inclusion of GLYMUR_TCSRCC=m though?

Surely there must be a better way to write "Qualcomm's dev platform -
Glymur CRD board"?

DISPCC is used for display, but should your statement be read to imply
that we now have all drivers enabled for "boot to shell" on the display?
Or did you include it just because it was adjacent?


The content of the patch looks good, but the commit message is
incoherent and lacks answers to someone who doesn't already know why the
options are enabled in the way they are.


For comparison look at Jingyi's patch here:
https://lore.kernel.org/all/20251215-knp-dts-v4-2-1541bebeb89f@oss.qualcomm.com/

Regards,
Bjorn

> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index b67d5b1fc45b..d3ed35d3e6a4 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -647,6 +647,7 @@ CONFIG_PINCTRL_IMX91=y
>  CONFIG_PINCTRL_IMX93=y
>  CONFIG_PINCTRL_IMX_SCMI=y
>  CONFIG_PINCTRL_MSM=y
> +CONFIG_PINCTRL_GLYMUR=y
>  CONFIG_PINCTRL_IPQ5018=y
>  CONFIG_PINCTRL_IPQ5332=y
>  CONFIG_PINCTRL_IPQ5424=y
> @@ -1454,6 +1455,9 @@ CONFIG_COMMON_CLK_MT8192_SCP_ADSP=y
>  CONFIG_COMMON_CLK_MT8192_VDECSYS=y
>  CONFIG_COMMON_CLK_MT8192_VENCSYS=y
>  CONFIG_COMMON_CLK_QCOM=y
> +CONFIG_CLK_GLYMUR_DISPCC=m
> +CONFIG_CLK_GLYMUR_GCC=y
> +CONFIG_CLK_GLYMUR_TCSRCC=m
>  CONFIG_CLK_KAANAPALI_GCC=y
>  CONFIG_CLK_KAANAPALI_TCSRCC=m
>  CONFIG_CLK_X1E80100_CAMCC=m
> @@ -1846,6 +1850,7 @@ CONFIG_INTERCONNECT_IMX8MN=m
>  CONFIG_INTERCONNECT_IMX8MQ=m
>  CONFIG_INTERCONNECT_IMX8MP=y
>  CONFIG_INTERCONNECT_QCOM=y
> +CONFIG_INTERCONNECT_QCOM_GLYMUR=y
>  CONFIG_INTERCONNECT_QCOM_KAANAPALI=y
>  CONFIG_INTERCONNECT_QCOM_MSM8916=m
>  CONFIG_INTERCONNECT_QCOM_MSM8953=y
> 
> -- 
> 2.34.1
> 

