Return-Path: <linux-arm-msm+bounces-87910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E95FDCFE26A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 15:06:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B3E2A308248D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 14:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38F2832F740;
	Wed,  7 Jan 2026 13:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U2P/RfYr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A8932D0C2
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 13:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767794017; cv=none; b=dyWIO5+Qc6TjyR+JrjQfNfjbwwbCwZ+JWp4gcFDgdHNEIYMAUXrqZHyEkU0UwArG2YqaOJ9y2hbuaE0ggeC7H+bgMHOQzyVZhbvyGzkOCi2es+qEXlXWdoksRg8lPLEDtg9KhSbb5NOIl0gMJfscUKIqumVEhwLNXs3O9z2wIco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767794017; c=relaxed/simple;
	bh=QDC8fAkpuLJNm2CjBuxTCKz5by93qeEHT4fCaNyzUbw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=KXBXegNNrnvrTGHgxq3JyeZTJLLT/jsUk/kpsxbjrE9GAdZ5zVu1i/2Hf9hqbyN0QCyDgzHitgus0swhr+z+er07RupIMLEUnIlrtjWaDz+LT7DpaJKnD/PJ1/kKGaxEcaZs8FPpfYmbm+Rrn1/E+CtnFO6oyE7uJxTLE4Xf1Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U2P/RfYr; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4775895d69cso10389055e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 05:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767794014; x=1768398814; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2PPmOlHHmb/B+RyLKIMZJ6qeJLZRe+/pRm6RubVwI5k=;
        b=U2P/RfYryQwYRq1wuZGa25ky58pj1z/w4pVTW5+H2ho4kITzgYXWOn0a3j96dQFned
         vWIKe5+B+XQEGDEqVldbmMVp9f1IweqgOa4x4a/OX6MGworfpStKpXW093Hfsf1uJ8wD
         UYpMtX/5wQEcFjn4+kmCZrTQoOsHIZq74R4STKvKB9cfHsc/gqtf1TIm3wCfC1o1Jxrw
         EoktVo2WdjekH5l9DleY9OqrtYODxS+6XlwOya6VrMI6XnH8/YE32tJLS6U0BKeyF4Oe
         rYUDl4vPLLtf+bhbW4w2d9lO4imp4B5W6iIvzanSBrs/5RNGZq4xA2wAgtaYOXeuLtqT
         7swg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767794014; x=1768398814;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2PPmOlHHmb/B+RyLKIMZJ6qeJLZRe+/pRm6RubVwI5k=;
        b=CmewKnuPjwj5hkRNybzMyBHB+BYybhmLkp1h/0ENHmBy/wvcw/tJ33A9sj7sWkUmRF
         dzVCfWCPlVEKbx65zhgLg/kJJ//Jv75Yhq+pHT5OPXhLEFxhzLTOPMXf0StchY1V54w8
         3m9lB83Rt+JA7PnAW59J75sdZh8r05SpYiXfKu1MC1opSsc02siMoahihG+K/cp9Lj6a
         4A2Hcvz9g/yXs/gYvhj/pd4CAcexLUbM/HL2adO7NL1aI4VnE8emRPrlAzbQy2CwhZR/
         KBzmetqYpnA3D7126+Gs1v7iEspKwdrs5l7yjzNu+oAztYcDGImvCUBfHewW0ejl1FHX
         mO5g==
X-Forwarded-Encrypted: i=1; AJvYcCW52yN4DhdKjDXBfpPE+2bUzunJdHixabwpUtlBsN3hVuFUi4hbY4eM3Efe+ZGIJcShWOKEDIjkBNAN4l5y@vger.kernel.org
X-Gm-Message-State: AOJu0Yx92MH8W4RPnQo+sQVeHxZlOWff6hTeSYi/tX9faphPDSqnDe6n
	HtNmGOw29okvlQCxix/Lv34RPrplpI0eBj/T5LwSIWt/IqXY/IbtQ+Ice+41VN9sjBQ=
X-Gm-Gg: AY/fxX4lG2Vircvb650gh6vKalbpgJl7jOndvdE5cWSPq9DybioT82PTMJSn8KQspG1
	WWXoRGHPZO/l4Jo4jXcmS1zRDYpVpjBhTbZwUYv2/Y0xzCthgJWSwkgMRKiLCyop8/htbHsy65w
	zAQI0axQP5ko/puEpSXiy0KhvRwtUwYUtdUBQDYxq9QB2iPtgIGN35UxJ8LudmWRYny7559IE+U
	9NMf+pvog6A1vac4685MoD+tqA/wPiJfv3o4e5uzduxdMcP3edVpU9SRcayErMBAJunQjjghLHU
	bxcn/ubmoTzb88KxC4eSI2NXF80f9l/gHt7R0indlT4GQtBi12oY+wbnYqa1xosYxMfaYm2yq6D
	ozooWSjBsit8RwDGkZZJdAgVfPArjsHDGfTt2SOUPP7wbPiqxiIAN1CG1Nni6Y3dSJ5ROtw+Ngj
	TiLZ/YMn13K9F5vh0qj+oc3LCdNpKc1dQMnUdnTVsnwJ4A0WNktwSBOI92PCFDLRs=
X-Google-Smtp-Source: AGHT+IFUA5vh7AafgOW//OBUIb/fgC/LgcjIFr0sUp94lRbcr5Desv09dz0w5OtTNI6i8HI4JrREVQ==
X-Received: by 2002:a05:600c:1f8c:b0:477:7d94:5d0e with SMTP id 5b1f17b1804b1-47d84b40955mr30210945e9.27.1767794013703;
        Wed, 07 Jan 2026 05:53:33 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:2542:a09c:d0d8:7a1f? ([2a01:e0a:3d9:2080:2542:a09c:d0d8:7a1f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d86637b90sm15127055e9.2.2026.01.07.05.53.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 05:53:33 -0800 (PST)
Message-ID: <2486dc4b-71f3-4cd9-8139-b397407d7e4d@linaro.org>
Date: Wed, 7 Jan 2026 14:53:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 5/6] arm64: dts: qcom: milos: Add UFS nodes
To: Luca Weiss <luca.weiss@fairphone.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Bart Van Assche <bvanassche@acm.org>, Vinod Koul <vkoul@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org
References: <20260107-milos-ufs-v1-0-6982ab20d0ac@fairphone.com>
 <20260107-milos-ufs-v1-5-6982ab20d0ac@fairphone.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260107-milos-ufs-v1-5-6982ab20d0ac@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 1/7/26 09:05, Luca Weiss wrote:
> Add the nodes for the UFS PHY and UFS host controller, along with the
> ICE used for UFS.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   arch/arm64/boot/dts/qcom/milos.dtsi | 127 +++++++++++++++++++++++++++++++++++-
>   1 file changed, 124 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
> index e1a51d43943f..0f69deabb60c 100644
> --- a/arch/arm64/boot/dts/qcom/milos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
> @@ -797,9 +797,9 @@ gcc: clock-controller@100000 {
>   				 <&sleep_clk>,
>   				 <0>, /* pcie_0_pipe_clk */
>   				 <0>, /* pcie_1_pipe_clk */
> -				 <0>, /* ufs_phy_rx_symbol_0_clk */
> -				 <0>, /* ufs_phy_rx_symbol_1_clk */
> -				 <0>, /* ufs_phy_tx_symbol_0_clk */
> +				 <&ufs_mem_phy 0>,
> +				 <&ufs_mem_phy 1>,
> +				 <&ufs_mem_phy 2>,
>   				 <0>; /* usb3_phy_wrapper_gcc_usb30_pipe_clk */
>   
>   			#clock-cells = <1>;
> @@ -1151,6 +1151,127 @@ aggre2_noc: interconnect@1700000 {
>   			qcom,bcm-voters = <&apps_bcm_voter>;
>   		};
>   
> +		ufs_mem_phy: phy@1d80000 {
> +			compatible = "qcom,milos-qmp-ufs-phy";
> +			reg = <0x0 0x01d80000 0x0 0x2000>;
> +
> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
> +				 <&tcsr TCSR_UFS_CLKREF_EN>;
> +			clock-names = "ref",
> +				      "ref_aux",
> +				      "qref";
> +
> +			resets = <&ufs_mem_hc 0>;
> +			reset-names = "ufsphy";
> +
> +			power-domains = <&gcc UFS_MEM_PHY_GDSC>;
> +
> +			#clock-cells = <1>;
> +			#phy-cells = <0>;
> +
> +			status = "disabled";
> +		};
> +
> +		ufs_mem_hc: ufshc@1d84000 {
> +			compatible = "qcom,milos-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
> +			reg = <0x0 0x01d84000 0x0 0x3000>;
> +
> +			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH 0>;
> +
> +			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
> +				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
> +				 <&gcc GCC_UFS_PHY_AHB_CLK>,
> +				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
> +				 <&tcsr TCSR_UFS_PAD_CLKREF_EN>,
> +				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
> +				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
> +				 <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
> +			clock-names = "core_clk",
> +				      "bus_aggr_clk",
> +				      "iface_clk",
> +				      "core_clk_unipro",
> +				      "ref_clk",
> +				      "tx_lane0_sync_clk",
> +				      "rx_lane0_sync_clk",
> +				      "rx_lane1_sync_clk";
> +
> +			resets = <&gcc GCC_UFS_PHY_BCR>;
> +			reset-names = "rst";
> +
> +			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &cnoc_cfg SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
> +			interconnect-names = "ufs-ddr",
> +					     "cpu-ufs";
> +
> +			power-domains = <&gcc UFS_PHY_GDSC>;
> +			required-opps = <&rpmhpd_opp_nom>;
> +
> +			operating-points-v2 = <&ufs_opp_table>;
> +
> +			iommus = <&apps_smmu 0x60 0>;

dma-coherent ?

and no MCQ support ?

<snip>

Thanks,
Neil

