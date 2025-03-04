Return-Path: <linux-arm-msm+bounces-50105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7AEA4D29C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 05:36:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A24667A556D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 04:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F30531EF0B7;
	Tue,  4 Mar 2025 04:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KwlkoO7z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DEE1EB9EB;
	Tue,  4 Mar 2025 04:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741062948; cv=none; b=lxihvh09Z8ECZeHLbXGqJuKU+kh9NlBGRT/mMzNy9iF0YjcktHXBrEX7bZMjhW3WrcJyGm7KsGiPpCKtmY7oBzEgmY3l5up1AbeJ3HHaOoFHsP8kr82EmzVUZRSvpQlk+LS1aDhHBMP6ecXuCPGTfGQy6oe5kZDZUN9frisdqFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741062948; c=relaxed/simple;
	bh=wLKCi+34PCFVopTTjtuTSC8bOYg5d08vbk4yE5BTZW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PhEMI37joENbY9dtPp1yGrh65X9nUvP2jp/tkUs+ipdUACubDmiCHrNASIuwLyZZDB+g5M5fQ2K3ebHsg9TlN8yVLbPeBc24xnXHLkxsgkd9vCBkZs9SgLG4kecDRbY9Cy+mdwgJ48Jmy2wS68EUBLi/vftz/7byVHGdGWlEF0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KwlkoO7z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFF89C4CEE5;
	Tue,  4 Mar 2025 04:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741062948;
	bh=wLKCi+34PCFVopTTjtuTSC8bOYg5d08vbk4yE5BTZW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KwlkoO7zry3ZDBAUlJf2W0lYRXR/y175Ag6lnunipGNBs2hZNNm3mCtnFDwER7OEO
	 7B2JuFiDW1pG4blCgsWAyHdFtfedL2ynz37new4yqwYKQHWgvgHOZO/JUb8G6JaVhn
	 yUt8KsBHVCAXrP9ahKgeJWqK/DFUzfOHB3R1LMNo6EHbYWelCHUcICLbEhv462KTkB
	 MwNPJ0SypkTCZF41HfOWEPmrQdJNrpYSYxH9350X3q/ihhJTLL2un5rNSEIJafLkGj
	 MNmLvIl/HOnDdjen2U+cIvDb/g0AAkrjP+f7xNjg8UcsuXn5TNru3ASIlnKma3QxPO
	 hanYt/hMjZ7uA==
Date: Mon, 3 Mar 2025 22:35:46 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com
Subject: Re: [PATCH v1] arm64: dts: qcom: sa8775p: Add default pin
 configurations for QUP SEs
Message-ID: <keszvik5mrobfkdpgdz5rnl5l7tihgbpyd4en3dflmaflyl7io@d4my7wdrtkyg>
References: <20250225154136.3052757-1-quic_vdadhani@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225154136.3052757-1-quic_vdadhani@quicinc.com>

On Tue, Feb 25, 2025 at 09:11:36PM +0530, Viken Dadhaniya wrote:
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
> Additionally, move default pin configurations from target-specific files to
> the SoC device tree file, as all possible pin configurations are now
> comprehensively included in the SoC device tree, similar to other SoCs.
> 
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi |  88 --
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi      | 908 +++++++++++++++++++++
>  2 files changed, 908 insertions(+), 88 deletions(-)
> 
[..]
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
[..]
> +			qup_i2c0_default: qup-i2c0-state {
> +				pins = "gpio20", "gpio21";
> +				function = "qup0_se0";
> +				drive-strength = <2>;
> +				bias-pull-up;

Look at other examples, such as sc7280.dtsi, and you will see that
drive-strength and bias are considered board-specific properties and
should thereby not go in the soc.dtsi file.

Thanks,
Bjorn

