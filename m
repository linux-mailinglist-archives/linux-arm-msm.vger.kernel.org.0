Return-Path: <linux-arm-msm+bounces-87988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F7ED01171
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 06:30:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52348306026D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 05:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 808642E1747;
	Thu,  8 Jan 2026 05:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BTG6592D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D2B2DA77F;
	Thu,  8 Jan 2026 05:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767849960; cv=none; b=nuBj/v6eM/0S1nx/W8Eq4evDn45PqgeUTXiBcW4vCwPGzXvG6wvDnEu8UTGrT4h5g8FyBpTUJf38/1t92j3kvJ1Na/a2zBjUo04WFMlmDmaZ5A3jnrKENKiMRW98hv03I3mWD8qEtTN5XiMaHxHe51/5ahg8mdk4CtS0X01eHDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767849960; c=relaxed/simple;
	bh=8LVRptukR+PpACKCN4cRnyQ4lwp2cVIdpaJmp3sdxTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D0mHBd1h76Ufan19CVfiL/AuzoSly3WdP01EMKoMEIDj5mUEYrueKUMHgk77dCR+mVjrNl93JL0u5H5ELbuSVN8QT3P5ElE6KlgSBqN7qPiiKnh3Iu0tUTUQ+MBfOXjaKltaEJYeJqPFMrU0IPl46TUmKiN2URMvZiuskAlcuzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BTG6592D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47F50C116C6;
	Thu,  8 Jan 2026 05:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767849957;
	bh=8LVRptukR+PpACKCN4cRnyQ4lwp2cVIdpaJmp3sdxTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BTG6592DCIMQuDAHCJR0R+q2l0EhBz+e+4FgZ3vs7krISMIIW1WqyCWDt7J3nWL/j
	 qqeivw9vSkl6im6GR7E5KaKVdX6DA4HX9bpqD4eE3hSbuFzAFV0iWho97nbBPFhAKQ
	 eQx3V78pPiUsAQPQ7t9wqnm722ewZzzzuqfRRKHGUUPZFbbtF4Be6wdkfPZZnXdp4N
	 kAUW7FfZuVoS0VbnSb3IN1qEa3+CuEnSxqEBc9Mk9U67wHExAdVOJJsi/FILiFAgGE
	 +jbfHMjVCv93RQVpK9MwVTC1GHTfqcTfcXJRq88EK3FAgMHzRbZ+U5BR6LnFC35YhS
	 W3UXRqdqVdw4w==
Date: Thu, 8 Jan 2026 10:55:48 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, martin.petersen@oracle.com, 
	andersson@kernel.org, konradybcio@kernel.org, taniya.das@oss.qualcomm.com, 
	dmitry.baryshkov@oss.qualcomm.com, manivannan.sadhasivam@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH V4 4/4] arm64: dts: qcom: hamoa-iot-evk: Enable UFS
Message-ID: <xmhyuq37jbh5chovbdqhci36j24pzmleu2mo2msax5j4vs5ol6@65r57zt4cvqb>
References: <20260106154207.1871487-1-pradeep.pragallapati@oss.qualcomm.com>
 <20260106154207.1871487-5-pradeep.pragallapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260106154207.1871487-5-pradeep.pragallapati@oss.qualcomm.com>

On Tue, Jan 06, 2026 at 09:12:07PM +0530, Pradeep P V K wrote:
> Enable UFS for HAMOA-IOT-EVK board.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> index 88e3e7bed998..23cd913b05f5 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> @@ -1253,6 +1253,24 @@ &uart21 {
>  	status = "okay";
>  };
>  
> +&ufs_mem_phy {
> +	vdda-phy-supply = <&vreg_l3i_0p8>;
> +	vdda-pll-supply = <&vreg_l3e_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&ufs_mem_hc {
> +	reset-gpios = <&tlmm 238 GPIO_ACTIVE_LOW>;
> +
> +	vcc-supply = <&vreg_l17b_2p5>;
> +	vcc-max-microamp = <1300000>;
> +	vccq-supply = <&vreg_l2i_1p2>;
> +	vccq-max-microamp = <1200000>;
> +
> +	status = "okay";
> +};
> +
>  &usb_1_ss0_dwc3_hs {
>  	remote-endpoint = <&pmic_glink_ss0_hs_in>;
>  };
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

