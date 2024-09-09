Return-Path: <linux-arm-msm+bounces-31278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AAA971625
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 13:04:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DCBA1F23470
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 11:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F0BF1B790E;
	Mon,  9 Sep 2024 11:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LbRqcZS/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EDF1B7909;
	Mon,  9 Sep 2024 11:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725879788; cv=none; b=NJUwbRqxiurGiG2h9HKAOXMJI691HEsQjut44Y2fWPATn2rwFeFAxgiabQf4NLTs6We0WP16ffOV0dDt8EFd2q55thJ6xA0hk2oXS7sm4ZG/WuLvuynWh5TSJKcS0PYlR1lU5OgHuuV5Aij/mLFlF+lJzuWomDBB9bePVkcXUTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725879788; c=relaxed/simple;
	bh=zsF0vIn3x0rHoU069/VAoTa8W/MZZb7KoYuQdVVkKyA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qcfahx7sX8MsLP9MI53PCsGRUNiJdS/1G2/9Br6INBOrW+zaGq1WTZpapyaJR28gY+LXpSdhDc67QS1X/kB4eYGc80wStHoihMsugkoAoLwvWgiR1Mh3JT6SUgAWtCK8IT7rYYtUJJP7x+btJGmx61iWTBe6LQtliIbGcZjzyBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LbRqcZS/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B00EC4CEC6;
	Mon,  9 Sep 2024 11:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725879787;
	bh=zsF0vIn3x0rHoU069/VAoTa8W/MZZb7KoYuQdVVkKyA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LbRqcZS/RPwPg4kymD1ouV4V+qEdPsTkXQHtsNWbArrII6eO5WTUCMf9TmcOH4VKP
	 UGqd1e68wgX7yyG7x8/FeCXZSmtIHW4D5rfedHF7urXtRjwByn3oU7skZuzTbfndGx
	 TLkQwUbhK+D+ETMR0/vE8SMQK2mFF9SzDd5lBBPB26/6DdbzocmYTpxqnP1kcYrKU0
	 eY3fjvB2HYDg/jkrLj+7TUaGff4V/zXzXCIneaFEKw6mdEIe8AaXhtHVChZIW16SDo
	 +dLWPShw3t5VK4XMit8CoxL8rVHjSCoXEnxwn0kDC6+O9Wl6PG3WyGzEmzmC49RXMB
	 BE2PTsQzIagYA==
Message-ID: <815f1244-ef5c-4384-81ba-8fd75cd31a1c@kernel.org>
Date: Mon, 9 Sep 2024 13:03:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] arm64: dts: qcom: sdm630: add WiFI device node
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240907-sdm660-wifi-v1-0-e316055142f8@linaro.org>
 <20240907-sdm660-wifi-v1-6-e316055142f8@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240907-sdm660-wifi-v1-6-e316055142f8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7.09.2024 8:48 PM, Dmitry Baryshkov wrote:
> Add device node for the WiFi device being a part of the integrated
> SDM660 / SDM630 platforms.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> index dc8bc63bdc70..4536fa45869a 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> @@ -2412,6 +2412,33 @@ intc: interrupt-controller@17a00000 {
>  			redistributor-stride = <0x0 0x20000>;
>  			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
>  		};
> +
> +		wifi: wifi@18800000 {
> +			compatible = "qcom,wcn3990-wifi";
> +			reg = <0x18800000 0x800000>;
> +			reg-names = "membase";
> +			memory-region = <&wlan_msa_mem>;
> +			clocks = <&rpmcc RPM_SMD_RF_CLK1_PIN>;
> +			clock-names = "cxo_ref_clk_pin";
> +			interrupts =
> +				<GIC_SPI 413 IRQ_TYPE_LEVEL_HIGH>,

Please unbreak this line

Konrad

