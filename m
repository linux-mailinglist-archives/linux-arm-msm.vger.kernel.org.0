Return-Path: <linux-arm-msm+bounces-31295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CCC971860
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 13:40:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3683284462
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 11:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 010FB1B5EA3;
	Mon,  9 Sep 2024 11:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uP3Mdw9x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11041B583E;
	Mon,  9 Sep 2024 11:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725882040; cv=none; b=oqeJeEQno53vjA5CqurpqOtdmCwLMaDOKGwkbdEYNRazNpK5fg62HLBcC9G5IXUWYoQSJAqDplAIHq3snKYaEtdS6yaZf18suFumn/Gc0+txIEkTsjSdCeWyu41GSMh+3VLOB2VxtgfZupPHjkf0bPK2MKfIFZ5oDDfT5H8P3oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725882040; c=relaxed/simple;
	bh=FECvUa62XYAhauGPX0bNJRvN06psBjXU5Mu1nsIE7S4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hPX0DC0HKo47goQo60JyZ5sABuDzbW3Hu62r7sZAhswwg89SrwcLg3S2Yino5YDkRo5SS4aR4F/HF/BlKhxwbQJRYhKDKLic0crqzLOnyhKhEysF3+ZD/apK3h6q0WlnRv4MTjqNUGEqQi+St31ryXZ9eZvczjLDiyRP9VnrsIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uP3Mdw9x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA43AC4CEC5;
	Mon,  9 Sep 2024 11:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725882040;
	bh=FECvUa62XYAhauGPX0bNJRvN06psBjXU5Mu1nsIE7S4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uP3Mdw9xbCJOrYpy52XRlxODeyAu4atg8NQTX01qHHZGqtjf/155APDqsWqB3uEbX
	 b5rtUTC1y/WDL7ksLzmsXvzKOAnwRICxVc2lWNyWbPwo5ZmzMFLLZNBAZmICcJs4Ql
	 OZqnmCDYXp/4/MHpPEzjZ6sS+VNzY8H/ZOAZVugYN/V93X1EfXhoZ/EZfWAj+r0PW0
	 Fgi9kIrtamOqmMGgzxEpIxKSc0R4FUtngtHre3Sf1BCnZ6qQDcrtJLBwUwAI8d4qzC
	 8MEO4EfoZcsWqfxOFC+hlxkso/EHQRJJafFAjd3yPkVFt9miDJs89lGDHirnlcmvrG
	 UDvpuPH10H7tQ==
Message-ID: <be9460a4-0f19-4acb-9b81-5a3d61eeb28f@kernel.org>
Date: Mon, 9 Sep 2024 13:40:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sda660-ifc6560: enable mDSP and
 WiFi devices
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, ath11k@lists.infradead.org,
 Kalle Valo <kvalo@kernel.org>
References: <20240907-sdm660-wifi-v1-0-e316055142f8@linaro.org>
 <20240907-sdm660-wifi-v1-7-e316055142f8@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240907-sdm660-wifi-v1-7-e316055142f8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7.09.2024 8:48 PM, Dmitry Baryshkov wrote:
> Enable the onboard WiFi device present on the Inforce IFC6560 SBC.
> Pretty much like MSM8998 this device also doesn't generate the
> MSA_READY_IND indication.
> 
> For the reference:
> 
> ath10k_snoc 18800000.wifi: qmi chip_id 0x30214 chip_family 0x4001 board_id 0xff soc_id 0x40050000
> ath10k_snoc 18800000.wifi: qmi fw_version 0x101d01da fw_build_timestamp 2018-07-26 21:42 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HL.1.0.1.c2-00474-QCAHLSWMTPLZ-1
> ath10k_snoc 18800000.wifi: qmi not waiting for msa_ready indicator
> ath10k_snoc 18800000.wifi: wcn3990 hw1.0 target 0x00000008 chip_id 0x00000000 sub 0000:0000
> ath10k_snoc 18800000.wifi: kconfig debug 1 debugfs 0 tracing 0 dfs 0 testmode 0
> ath10k_snoc 18800000.wifi: firmware ver  api 5 features wowlan,mgmt-tx-by-reference,non-bmi crc32 b3d4b790
> ath10k_snoc 18800000.wifi: htt-ver 3.54 wmi-op 4 htt-op 3 cal file max-sta 32 raw 0 hwcrypto 1
> ath10k_snoc 18800000.wifi: invalid MAC address; choosing random
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> ---
> Cc: ath11k@lists.infradead.org
> Cc: Kalle Valo <kvalo@kernel.org>
> ---
>  .../arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
> index 09bc010ce56a..7948c8f6ab64 100644
> --- a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
> +++ b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
> @@ -252,6 +252,11 @@ &qusb2phy1 {
>  	vdda-phy-dpdm-supply = <&vreg_l7b_3p125>;
>  };
>  
> +&remoteproc_mss {
> +	firmware-name = "qcom/sda660/mba.mbn", "qcom/sda660/modem.mbn";
> +	status = "okay";
> +};
> +
>  &rpm_requests {
>  	regulators-0 {
>  		compatible = "qcom,rpm-pm660-regulators";
> @@ -291,6 +296,11 @@ vreg_l1a_1p225: l1 {
>  			regulator-allow-set-load;
>  		};
>  
> +		vreg_l5a_0p8: l5 {
> +			regulator-min-microvolt = <848000>;
> +			regulator-max-microvolt = <848000>;
> +		};
> +
>  		vreg_l6a_1p3: l6 {
>  			regulator-min-microvolt = <1304000>;
>  			regulator-max-microvolt = <1368000>;
> @@ -489,3 +499,15 @@ &usb3_qmpphy {
>  	vdda-pll-supply = <&vreg_l10a_1p8>;
>  	status = "okay";
>  };
> +
> +&wifi {
> +	status = "okay";

You placed status last in the addition above but not here :P

with that fixed:



Reviewed-by: Konrad Dybcio <konradybcio@kernel.org>

Konrad

