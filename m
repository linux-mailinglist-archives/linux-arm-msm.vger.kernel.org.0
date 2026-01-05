Return-Path: <linux-arm-msm+bounces-87529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B1DCF4C6D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 17:43:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 80D5D300A92F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 16:43:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38276314D2F;
	Mon,  5 Jan 2026 16:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cQ7FttMI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E395531197E;
	Mon,  5 Jan 2026 16:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767631330; cv=none; b=V2eLnbTY8pyhUPUanHiBnCJY/+5tWJmEjKNXdIvpaXkLjRt5YwO9rpBfpgaWxcZB49W0z+mdI/J6yadX6gmVQbR++0ivIuzGlxUjZqUmckpNAcqxmfavSmglQY0O1fCdI+hwADXJZgBM4mJ8jmYwk0fmyvvR0xrnsjU8GlFYoQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767631330; c=relaxed/simple;
	bh=3hA5vWXhqQhvceJwD8rw9cDDNpUIEZQnkA2sj2DIxMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MooreC6mq0/uKcEnOOKnrsaOmsyDxjovIHBM5cdoawl2ZM7h8pUQWsc2a4OMfwFNmsEkUbk3zrkUSJz4shbB9Vc5m8bsDWEW7SwdDnYReW2uR/OcYnBk6fNU5IrRtoKudVXr9BtDA0xFWcsZYIOAqtl3TQFJOVPzg+4eTMa8Kl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cQ7FttMI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15397C116D0;
	Mon,  5 Jan 2026 16:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767631329;
	bh=3hA5vWXhqQhvceJwD8rw9cDDNpUIEZQnkA2sj2DIxMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cQ7FttMICVV7uL20pGzczfY7cIBEp7NLBF3pPtXAofX8EGFclH90jxaEso8C+bmF/
	 S4HY2E8zj8XIPgERwpXezuDikeFIaiUA2EaC0PisYmDvvyUmjPCjbTAm5d7M/qgQGr
	 y6myJXFdkFCNC3QY9kM/kmSecagGn7aSVXoE/0oZeZIrg8VZAOycHGtGDCE9Ulu1JG
	 b1s9Dib66UTYOTb3iSm/CPqetoTuhI3a7YXFtaEdLE0FDAMyJVoOZ381n0kTxdIkzi
	 GHerqEq/nlxoPZHoLbvPi3ZEAhrTtdYbxA9GhqPwtOEJsLh47DE3/r6OmDeVUDv9HR
	 upgEAs7xx3nxg==
Date: Mon, 5 Jan 2026 10:42:07 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: david@ixit.cz
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-tama: Keep labibb on, so kernel
 can disable it
Message-ID: <gpyodjdhf77czjdln6gotv63rci2pxteto5lhtp4mwn3bxmuyh@65lrkjapg5i2>
References: <20251202-tama-labibb-v1-1-f8f3fda53d1d@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202-tama-labibb-v1-1-f8f3fda53d1d@ixit.cz>

On Tue, Dec 02, 2025 at 12:31:11PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> In case if they were enabled by the bootloader as part of some
> reference/common routine and left hanging. Linux will switch them off if
> they're never used.

"""
It's observed that the bootloader on this device will enable the labibb
and leave them enabled, despite being unsed as these devices come with
OLED screens.

Leave the nodes active in DeviceTree to allow the operating system to
turn them off.
"""

> 
> Discussion about it can be found here:
>   https://lore.kernel.org/all/20251130-oneplus-labibb-v1-1-bb3653e43120@ixit.cz/

I think above captures the discussion, so the link can be omitted?

Regards,
Bjorn

> 
> Fixes: 5dcc6587fde2 ("arm64: dts: qcom: sdm845-tama: Add display nodes")
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dts | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dts b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dts
> index 82e59e4533549..c2b38ecb2e9cf 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dts
> @@ -28,14 +28,6 @@ ts_vddio_supply: ts-vddio-regulator {
>  	};
>  };
>  
> -&ibb {
> -	status = "disabled";
> -};
> -
> -&lab {
> -	status = "disabled";
> -};
> -
>  &panel {
>  	/* Akatsuki uses an OLED panel. */
>  	/delete-property/ backlight;
> 
> ---
> base-commit: 95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a
> change-id: 20251202-tama-labibb-352d0e3b535a
> 
> Best regards,
> -- 
> David Heidelberg <david@ixit.cz>
> 
> 

