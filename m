Return-Path: <linux-arm-msm+bounces-45160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 186EFA12C6A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 21:20:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7071A7A27D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 20:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E8EA1D88CA;
	Wed, 15 Jan 2025 20:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rUqIHHqJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE6C14B959;
	Wed, 15 Jan 2025 20:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736972394; cv=none; b=YMy7C6DTCM7WbGINUiHqUCXxdFG+OHSMpWXLbxo3GvrG5v0xCLBJKc/KY8vPpsKVsfVE9vzYWhmRVgK1/k7Wz2exEtG1PbDeLx7hCOjkUgONc8vVuX/LBTQpoH8KDPwqociBK83C4L+QuXFl7XP5U+haJQ2zH3JlaMUkbnK9530=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736972394; c=relaxed/simple;
	bh=zl/v7yb3HucqSiAoeCcbmQ56UcodTLs5odqPooBQB4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UJGNBN/Bi6ZTi7bqlASZOl7rGPWjU/JvG/498Aeqg4YYPVgn2sMszrPvaWvp2e8tbKQ7taWx7zi77RBR0k6kSBBtepPUlqFJlniOmXYvchJoyN4rivJFfzFUQFxln1CNJ+zrIGAP3SL3KG0ZuKXdZ7SXLA5tahAxr4oSdzuQ2yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rUqIHHqJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8DFAC4CED1;
	Wed, 15 Jan 2025 20:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736972393;
	bh=zl/v7yb3HucqSiAoeCcbmQ56UcodTLs5odqPooBQB4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rUqIHHqJn+gspHQpxlDS/pcBs/eqjUkyW8tsYI0vUt6EVNfsmYM58eMF/oM0qbqLT
	 nbcxPoOAkHkrefSoVRYgXsCT9o3O1mLQ0K4MFVtzQ4HgGz4mWLZPpQXFHgmYRFHjXy
	 wG0+qgauERKgX1LfdSZKr1jUNivihHDmngqHcjqIG6jgyHHgkccixYs3oHFHv4S1GZ
	 TYXlaEtNmnAS43Mc4QyhaI2T8WMNUw61sCHViJ9mYTwiI6iExk45PqBBceExzT7ghy
	 GUSH+tUxT2OEV9IZaLBPZ+D4dLYSRdyhcM/4KtcjE4EUGeXspQZfPkUnwmaimUH2P3
	 ZCRhs+UiieJug==
Date: Wed, 15 Jan 2025 14:19:50 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_srichara@quicinc.com, quic_varada@quicinc.com
Subject: Re: [PATCH] arm64: dts: qcom: ipq9574: enable fast mode for i2c3
Message-ID: <hxbqcfza4vx4yzjgu2su4uckchev6xlglulrzncvdmdvhyawde@4vo7zoigy3kc>
References: <20250115110142.3501140-1-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115110142.3501140-1-quic_mmanikan@quicinc.com>

On Wed, Jan 15, 2025 at 04:31:42PM +0530, Manikanta Mylavarapu wrote:
> Configure the blsp1 i2c3 bus to operate at 400 kHz
> for fast mode.
> 

That is what that line does. But why do you want that - and per
Dmitiry's question, why do you want that for all ipq9574 boards?

Please write a proper commit message, with a problem description.
https://docs.kernel.org/process/submitting-patches.html#describe-your-changes

Thanks,
Bjorn

> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> index 942290028972..b35df590a794 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> @@ -621,6 +621,7 @@ blsp1_i2c3: i2c@78b8000 {
>  			clocks = <&gcc GCC_BLSP1_QUP4_I2C_APPS_CLK>,
>  				 <&gcc GCC_BLSP1_AHB_CLK>;
>  			clock-names = "core", "iface";
> +			clock-frequency = <400000>;
>  			assigned-clocks = <&gcc GCC_BLSP1_QUP4_I2C_APPS_CLK>;
>  			assigned-clock-rates = <50000000>;
>  			dmas = <&blsp_dma 18>, <&blsp_dma 19>;
> -- 
> 2.34.1
> 

