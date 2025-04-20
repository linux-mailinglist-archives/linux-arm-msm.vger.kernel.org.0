Return-Path: <linux-arm-msm+bounces-54826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F05AA94868
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Apr 2025 19:10:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B8E8170872
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Apr 2025 17:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB19520B800;
	Sun, 20 Apr 2025 17:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OHVDyoFp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3131339A4;
	Sun, 20 Apr 2025 17:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745169035; cv=none; b=moBgfN6HC8S9CFMvyq3TUi3EkK5yFby2QV/eeD7y1AbTk4FRLHZZ2MGDZ7QJTEdKjnQ2Iyy+/6OPgIFqPRt0FaZ6YlITuuZ7+PVCAmrNAJo0KWlbrKwAu/b72cFdqsNoku5n9qfeZWCgpC3uPiXOv7ephZreyqqw5yLqDN9j1Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745169035; c=relaxed/simple;
	bh=9XyY3EnmaZMfqyd+mLghDRVGrSJicEaTtjqS1e1R0c8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pdbKnhLcwL3/9t/ukWynT7W5x3+SP2eak+dfg049x6c0prxoTV0CgYbN6EIvM8fVt3TM0Ze7KuluUueu1BbxxTKiQJE1kCKgLxf0xRJKGv0I3Kl8e3XauKwUbmxG9sAef4QI1JRV9SPvKhdmUgRIAJLnkL4C1LecM347duKX6xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OHVDyoFp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDDC4C4CEE2;
	Sun, 20 Apr 2025 17:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745169034;
	bh=9XyY3EnmaZMfqyd+mLghDRVGrSJicEaTtjqS1e1R0c8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OHVDyoFpjJJsuuxshO50p9jhckRpCEJau/n8nT/NPMVh42GmWTOOAZdKytV6siu39
	 CeKcbERvTjmXOL1/XFg0ZAnCDGX7D6zsrHE032JUjjSyWYQWqZWRHKlzA+jT4fnIoU
	 0TRmgUIpwHWhYA+eIbuqdzqre6WAfWBM/9v5tx4daynDBfRX4lLR/WM3wTp8VInKnY
	 +R8TcqP1ZV2rBjQbzCNF08xFVDR/WHIjiUg4kufWX/3aX22aMvrs4ZQr03UuDWqeQY
	 4xfu09AbFckiNBN4PDq6vZT8O7SHKDt1vJxI9LHxUI8iaTM/IqjFhUueO+rDcem3Y1
	 1QzmMc1dCfXYw==
Date: Sun, 20 Apr 2025 12:10:31 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com
Subject: Re: [PATCH v2 RESEND] arm64: dts: qcom: sa8775p: Add default pin
 configurations for QUP SEs
Message-ID: <pxywhhhtraaykx32z7aifyd63gxydwrf4byuanv4zbfeqhk2fx@h6lyn7btyrtz>
References: <20250416101411.1444248-1-quic_vdadhani@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416101411.1444248-1-quic_vdadhani@quicinc.com>

On Wed, Apr 16, 2025 at 03:44:11PM +0530, Viken Dadhaniya wrote:
> Default pinctrl configurations for all QUP (Qualcomm Universal Peripheral)
> Serial Engines (SEs) are missing in the SoC device tree. These
> configurations are required by client teams when enabling any SEs as I2C,
> SPI, or Serial protocols.
> 
> Add default pin configurations for Serial Engines (SEs) for all supported
> protocols, including I2C, SPI, and UART, to the sa8775p device tree.  This
> change facilitates slave device driver clients to enable usecase with
> minimal modifications.
> 
> Remove duplicate pin configurations from target-specific file as same pin
> configuration is included in the SoC device tree.
> 
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> ---
> v1 -> v2:
> 
> - Drop drive-strength and bias property from soc dtsi.
> - Update commit log.
> 
> v1 Link: https://lore.kernel.org/lkml/20250225154136.3052757-1-quic_vdadhani@quicinc.com/
> ---
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi |   7 -
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi      | 750 +++++++++++++++++++++
>  2 files changed, 750 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> index 967913169539..17c3f662d14b 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> @@ -712,11 +712,6 @@ ethernet0_mdio: ethernet0-mdio-pins {
>  		};
>  	};
>  
> -	qup_uart10_default: qup-uart10-state {
> -		pins = "gpio46", "gpio47";
> -		function = "qup1_se3";
> -	};
> -
>  	qup_spi16_default: qup-spi16-state {
>  		pins = "gpio86", "gpio87", "gpio88", "gpio89";
>  		function = "qup2_se2";
> @@ -917,8 +912,6 @@ &remoteproc_gpdsp1 {
>  
>  &uart10 {
>  	compatible = "qcom,geni-debug-uart";
> -	pinctrl-0 = <&qup_uart10_default>;
> -	pinctrl-names = "default";
>  	status = "okay";
>  };
>  
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
[..]
> +			qup_spi16_default: qup-spi16-state {
> +				pins = "gpio86", "gpio87", "gpio88", "gpio89";
> +				function = "qup2_se2";
> +			};

Now we have qup_spi16_default in both sa8775p-ride.dtsi and sa8775p.dtsi

I presume you forgot to clean that up?


PS. I don't know why the word "RESEND" is present in $subject. Why was
this resent?

Regards,
Bjorn

