Return-Path: <linux-arm-msm+bounces-66830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B28A8B1389C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 12:10:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC3B1189070E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 10:10:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE0912550C7;
	Mon, 28 Jul 2025 10:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hXzG1UzG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629BB22A7E0
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 10:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753697421; cv=none; b=QP6TynW49CSgEGDtyJjxIx6Gm4d/PF7jH7612gwPPGOKWcFQmA/vTEWpr015xPdLGdImqe+bKKER3aCcfPMfKWdX0COSXio/JJ2uypOyFM2cQswBY7aQnBcjkCgBATw/CtM8t62SIF6tNgtd9AWzfkxwoFSc7/yC0YIL1c0Bhnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753697421; c=relaxed/simple;
	bh=AXwb6EcSLTcCD7BukpDax3iziC48YFsRJA6c7pYNZU0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=bgAA/SmR3uSZhl/Iou1BiWtOBsv60B2KsJX/r60jlPOdDtbLEvcBnXF3TtqsKbRhpbUTqCg1CSX+YE65mex1wvvL4Rz1Z0ijOqogsXE+LoP4dZXvsqFYsC5+6YJKl+fw2Pw3hQ0I5b7FrQvAGExJueEf5l7QhLIYWtgVH1ulJZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hXzG1UzG; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45555e3317aso20909555e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 03:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753697417; x=1754302217; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4f1ul7s3KdTjU4SIrTmiy8Q43vS3F/qQcwEa6qTUcuk=;
        b=hXzG1UzGjEKBHNPzVChm+6KnV4cX6PhO2PdpL5qPcQz/wtxhseIGSJZPZZydU3iM2H
         aG7iB0cscxmr6dZPVKfOSx/yrAS/s7pYuSz8DCBuvfB5YjxT8jtHd0/29sAPKclYZ/hW
         DeoP5yJptfx4FMMexA482uY62WLlpw6FNF0o4JPN8m/MqJ/koETWzoQ/g1bUzgaB/Yew
         XdyHgNIVNqTi7FqR09om7bzc2iu2Fn3ptu5rpivXX+gaAF2EfDsof8jcth2mIlWlO6rj
         113TSajdCnRw0tIa8TCXV7jCDXv73xOnqt86CgdYbu+wl27DuNddScMiSw4ash/IXj50
         n2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753697417; x=1754302217;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4f1ul7s3KdTjU4SIrTmiy8Q43vS3F/qQcwEa6qTUcuk=;
        b=sLDPJE+DIMNnfMqLH8IkRJ7L+jcfrCeZL2p3Bo70OnSBeTymwlg7vhpAiAkIIkt0G0
         7yqbgpRn494Ttal8cx/MQKVGzCPv03ROWLYpul3ZP8NsPE5PbUX7ztV99Zla2c8i/duX
         CiEbgBTotY6t7QCmvYN9tXRS8HmLuqMgF2DNWHADnaNpT+0FECSBvZa+ipRPPHrOmYlX
         9sQr3/Kza2rU2BTr9a7oMaijY3447dp0zPnasjtAUC0RciCTD+wyVRtOpXgc5bWH10KF
         s6DhVSV4TifXEk0eqDQvbyI/f6pBD/nsmeqF/rg7OR8+DWPHIWVPI+tM37C8ZQr6IepZ
         olMA==
X-Forwarded-Encrypted: i=1; AJvYcCUEmZvjZliD4NynT2TEwgVeUatnDHwXlmnt7r27Uhxv8IufaoxCUcD4g6WkZXY6ia3/m4avD53zNzsB1LGn@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/SUQ//aF5kREU1LkMFjawWUkywCAf8vUE7FIBVtQFal20bcWt
	jL3rtTo9dJA3hijYSzBfY/vjn9hTNUvLmVzMe9BI9fJ8a2Nn+F+ztlKNRlpZhl9A9g8=
X-Gm-Gg: ASbGncvAGoJrv0Gy9yg3ByD4OBSkMeOwCjkAoMrSv0Y93Lbg/6pMaxZoYuQsDx2ZTYI
	q6nHiMHR2Um3xmDlm3ivG+xs8+WfrYB42llsAvr5P2DGazmHpvW6BO2hcfOA9ghlKSty2oGBEtD
	fzRNiBXdcDAJj88q9cL2TBAADBeCOzYOOnZyQc7h5VE2wzYflrfYEHBbnhkluiOv5SDBXgtlvMB
	gCINO2Ya2mfWhXXA1nybF3g3Jnt5JVjLfBBZd+kJqrDOmyG4+WbUrOui/5Z3lvfENY870+TW5cJ
	lTwHUAPguHTuXrYrsMBnKMJHcSR7Tx7LXVtgnfafWDa2utDuUzmnh6z6j8gDlxKMAtXHle6DcdI
	Vahlf9A8x1ET2oGnSYpkINlXrCjLLgz1Y47UAIen+KCMXSwRGWI8Sop0c5128+wjuelppfry8
X-Google-Smtp-Source: AGHT+IGSQVuKkxLWHdWXzAddh95KPMn9prVrT8vSeVvmjWR1D6rdOuS9FcjhBvCwjdss3qoyKXciBg==
X-Received: by 2002:a05:600d:15a:20b0:439:86fb:7340 with SMTP id 5b1f17b1804b1-45877649344mr59844915e9.30.1753697416493;
        Mon, 28 Jul 2025 03:10:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:cb6f:4c33:aee:566b? ([2a01:e0a:3d9:2080:cb6f:4c33:aee:566b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b778eba0e6sm8409045f8f.25.2025.07.28.03.10.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 03:10:16 -0700 (PDT)
Message-ID: <3b4a4517-fe86-4be0-8b1b-99401fe719c6@linaro.org>
Date: Mon, 28 Jul 2025 12:10:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: sm8650: Sort nodes by unit address
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250727193652.4029-2-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20250727193652.4029-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/07/2025 21:36, Krzysztof Kozlowski wrote:
> Qualcomm DTS uses sorting of MMIO nodes by the unit address, so move
> few nodes in SM8650 DTSI to fix that.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 414 +++++++++++++--------------
>   1 file changed, 207 insertions(+), 207 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index e14d3d778b71..2360d560dc86 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -3490,6 +3490,11 @@ &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
>   			};
>   		};
>   
> +		rng: rng@10c3000 {
> +			compatible = "qcom,sm8650-trng", "qcom,trng";
> +			reg = <0 0x010c3000 0 0x1000>;
> +		};
> +
>   		cnoc_main: interconnect@1500000 {
>   			compatible = "qcom,sm8650-cnoc-main";
>   			reg = <0 0x01500000 0 0x14080>;
> @@ -3561,11 +3566,6 @@ mmss_noc: interconnect@1780000 {
>   			#interconnect-cells = <2>;
>   		};
>   
> -		rng: rng@10c3000 {
> -			compatible = "qcom,sm8650-trng", "qcom,trng";
> -			reg = <0 0x010c3000 0 0x1000>;
> -		};
> -
>   		pcie0: pcie@1c00000 {
>   			device_type = "pci";
>   			compatible = "qcom,pcie-sm8650", "qcom,pcie-sm8550";
> @@ -3926,38 +3926,6 @@ pcie1_phy: phy@1c0e000 {
>   			status = "disabled";
>   		};
>   
> -		cryptobam: dma-controller@1dc4000 {
> -			compatible = "qcom,bam-v1.7.0";
> -			reg = <0 0x01dc4000 0 0x28000>;
> -
> -			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH 0>;
> -
> -			#dma-cells = <1>;
> -
> -			iommus = <&apps_smmu 0x480 0>,
> -				 <&apps_smmu 0x481 0>;
> -
> -			qcom,ee = <0>;
> -			qcom,num-ees = <4>;
> -			num-channels = <20>;
> -			qcom,controlled-remotely;
> -		};
> -
> -		crypto: crypto@1dfa000 {
> -			compatible = "qcom,sm8650-qce", "qcom,sm8150-qce", "qcom,qce";
> -			reg = <0 0x01dfa000 0 0x6000>;
> -
> -			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
> -					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> -			interconnect-names = "memory";
> -
> -			dmas = <&cryptobam 4>, <&cryptobam 5>;
> -			dma-names = "rx", "tx";
> -
> -			iommus = <&apps_smmu 0x480 0>,
> -				 <&apps_smmu 0x481 0>;
> -		};
> -
>   		ufs_mem_phy: phy@1d80000 {
>   			compatible = "qcom,sm8650-qmp-ufs-phy";
>   			reg = <0 0x01d80000 0 0x2000>;
> @@ -4079,6 +4047,38 @@ ice: crypto@1d88000 {
>   			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
>   		};
>   
> +		cryptobam: dma-controller@1dc4000 {
> +			compatible = "qcom,bam-v1.7.0";
> +			reg = <0 0x01dc4000 0 0x28000>;
> +
> +			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH 0>;
> +
> +			#dma-cells = <1>;
> +
> +			iommus = <&apps_smmu 0x480 0>,
> +				 <&apps_smmu 0x481 0>;
> +
> +			qcom,ee = <0>;
> +			qcom,num-ees = <4>;
> +			num-channels = <20>;
> +			qcom,controlled-remotely;
> +		};
> +
> +		crypto: crypto@1dfa000 {
> +			compatible = "qcom,sm8650-qce", "qcom,sm8150-qce", "qcom,qce";
> +			reg = <0 0x01dfa000 0 0x6000>;
> +
> +			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "memory";
> +
> +			dmas = <&cryptobam 4>, <&cryptobam 5>;
> +			dma-names = "rx", "tx";
> +
> +			iommus = <&apps_smmu 0x480 0>,
> +				 <&apps_smmu 0x481 0>;
> +		};
> +
>   		tcsr_mutex: hwlock@1f40000 {
>   			compatible = "qcom,tcsr-mutex";
>   			reg = <0 0x01f40000 0 0x20000>;
> @@ -4962,6 +4962,176 @@ opp-202000000 {
>   			};
>   		};
>   
> +		usb_1_hsphy: phy@88e3000 {
> +			compatible = "qcom,sm8650-snps-eusb2-phy",
> +				     "qcom,sm8550-snps-eusb2-phy";
> +			reg = <0 0x088e3000 0 0x154>;
> +
> +			clocks = <&tcsr TCSR_USB2_CLKREF_EN>;
> +			clock-names = "ref";
> +
> +			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
> +
> +			#phy-cells = <0>;
> +
> +			status = "disabled";
> +		};
> +
> +		usb_dp_qmpphy: phy@88e8000 {
> +			compatible = "qcom,sm8650-qmp-usb3-dp-phy";
> +			reg = <0 0x088e8000 0 0x3000>;
> +
> +			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
> +				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> +			clock-names = "aux",
> +				      "ref",
> +				      "com_aux",
> +				      "usb3_pipe";
> +
> +			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
> +				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
> +			reset-names = "phy",
> +				      "common";
> +
> +			power-domains = <&gcc USB3_PHY_GDSC>;
> +
> +			#clock-cells = <1>;
> +			#phy-cells = <1>;
> +
> +			orientation-switch;
> +
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					usb_dp_qmpphy_out: endpoint {
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					usb_dp_qmpphy_usb_ss_in: endpoint {
> +						remote-endpoint = <&usb_1_dwc3_ss>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					usb_dp_qmpphy_dp_in: endpoint {
> +						remote-endpoint = <&mdss_dp0_out>;
> +					};
> +				};
> +			};
> +		};
> +
> +		usb_1: usb@a6f8800 {
> +			compatible = "qcom,sm8650-dwc3", "qcom,dwc3";
> +			reg = <0 0x0a6f8800 0 0x400>;
> +
> +			interrupts-extended = <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH 0>,
> +					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH 0>,
> +					      <&pdc 14 IRQ_TYPE_EDGE_RISING>,
> +					      <&pdc 15 IRQ_TYPE_EDGE_RISING>,
> +					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "pwr_event",
> +					  "hs_phy_irq",
> +					  "dp_hs_phy_irq",
> +					  "dm_hs_phy_irq",
> +					  "ss_phy_irq";
> +
> +			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
> +				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
> +				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
> +				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
> +				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> +				 <&tcsr TCSR_USB3_CLKREF_EN>;
> +			clock-names = "cfg_noc",
> +				      "core",
> +				      "iface",
> +				      "sleep",
> +				      "mock_utmi",
> +				      "xo";
> +
> +			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> +					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
> +			assigned-clock-rates = <19200000>, <200000000>;
> +
> +			resets = <&gcc GCC_USB30_PRIM_BCR>;
> +
> +			interconnects = <&aggre1_noc MASTER_USB3_0 QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_USB3_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
> +			interconnect-names = "usb-ddr",
> +					     "apps-usb";
> +
> +			power-domains = <&gcc USB30_PRIM_GDSC>;
> +			required-opps = <&rpmhpd_opp_nom>;
> +
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +
> +			status = "disabled";
> +
> +			usb_1_dwc3: usb@a600000 {
> +				compatible = "snps,dwc3";
> +				reg = <0 0x0a600000 0 0xcd00>;
> +
> +				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH 0>;
> +
> +				iommus = <&apps_smmu 0x40 0>;
> +
> +				phys = <&usb_1_hsphy>,
> +				       <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
> +				phy-names = "usb2-phy",
> +					    "usb3-phy";
> +
> +				snps,hird-threshold = /bits/ 8 <0x0>;
> +				snps,usb2-gadget-lpm-disable;
> +				snps,dis_u2_susphy_quirk;
> +				snps,dis_enblslpm_quirk;
> +				snps,dis-u1-entry-quirk;
> +				snps,dis-u2-entry-quirk;
> +				snps,is-utmi-l1-suspend;
> +				snps,usb3_lpm_capable;
> +				snps,usb2-lpm-disable;
> +				snps,has-lpm-erratum;
> +				tx-fifo-resize;
> +
> +				dma-coherent;
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +
> +						usb_1_dwc3_hs: endpoint {
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +
> +						usb_1_dwc3_ss: endpoint {
> +							remote-endpoint = <&usb_dp_qmpphy_usb_ss_in>;
> +						};
> +					};
> +				};
> +			};
> +		};
> +
>   		iris: video-codec@aa00000 {
>   			compatible = "qcom,sm8650-iris";
>   			reg = <0 0x0aa00000 0 0xf0000>;
> @@ -5580,176 +5750,6 @@ dispcc: clock-controller@af00000 {
>   			#power-domain-cells = <1>;
>   		};
>   
> -		usb_1_hsphy: phy@88e3000 {
> -			compatible = "qcom,sm8650-snps-eusb2-phy",
> -				     "qcom,sm8550-snps-eusb2-phy";
> -			reg = <0 0x088e3000 0 0x154>;
> -
> -			clocks = <&tcsr TCSR_USB2_CLKREF_EN>;
> -			clock-names = "ref";
> -
> -			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
> -
> -			#phy-cells = <0>;
> -
> -			status = "disabled";
> -		};
> -
> -		usb_dp_qmpphy: phy@88e8000 {
> -			compatible = "qcom,sm8650-qmp-usb3-dp-phy";
> -			reg = <0 0x088e8000 0 0x3000>;
> -
> -			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
> -				 <&rpmhcc RPMH_CXO_CLK>,
> -				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
> -				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> -			clock-names = "aux",
> -				      "ref",
> -				      "com_aux",
> -				      "usb3_pipe";
> -
> -			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
> -				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
> -			reset-names = "phy",
> -				      "common";
> -
> -			power-domains = <&gcc USB3_PHY_GDSC>;
> -
> -			#clock-cells = <1>;
> -			#phy-cells = <1>;
> -
> -			orientation-switch;
> -
> -			status = "disabled";
> -
> -			ports {
> -				#address-cells = <1>;
> -				#size-cells = <0>;
> -
> -				port@0 {
> -					reg = <0>;
> -
> -					usb_dp_qmpphy_out: endpoint {
> -					};
> -				};
> -
> -				port@1 {
> -					reg = <1>;
> -
> -					usb_dp_qmpphy_usb_ss_in: endpoint {
> -						remote-endpoint = <&usb_1_dwc3_ss>;
> -					};
> -				};
> -
> -				port@2 {
> -					reg = <2>;
> -
> -					usb_dp_qmpphy_dp_in: endpoint {
> -						remote-endpoint = <&mdss_dp0_out>;
> -					};
> -				};
> -			};
> -		};
> -
> -		usb_1: usb@a6f8800 {
> -			compatible = "qcom,sm8650-dwc3", "qcom,dwc3";
> -			reg = <0 0x0a6f8800 0 0x400>;
> -
> -			interrupts-extended = <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH 0>,
> -					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH 0>,
> -					      <&pdc 14 IRQ_TYPE_EDGE_RISING>,
> -					      <&pdc 15 IRQ_TYPE_EDGE_RISING>,
> -					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "pwr_event",
> -					  "hs_phy_irq",
> -					  "dp_hs_phy_irq",
> -					  "dm_hs_phy_irq",
> -					  "ss_phy_irq";
> -
> -			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
> -				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
> -				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
> -				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
> -				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> -				 <&tcsr TCSR_USB3_CLKREF_EN>;
> -			clock-names = "cfg_noc",
> -				      "core",
> -				      "iface",
> -				      "sleep",
> -				      "mock_utmi",
> -				      "xo";
> -
> -			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> -					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
> -			assigned-clock-rates = <19200000>, <200000000>;
> -
> -			resets = <&gcc GCC_USB30_PRIM_BCR>;
> -
> -			interconnects = <&aggre1_noc MASTER_USB3_0 QCOM_ICC_TAG_ALWAYS
> -					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> -					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> -					 &config_noc SLAVE_USB3_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
> -			interconnect-names = "usb-ddr",
> -					     "apps-usb";
> -
> -			power-domains = <&gcc USB30_PRIM_GDSC>;
> -			required-opps = <&rpmhpd_opp_nom>;
> -
> -			#address-cells = <2>;
> -			#size-cells = <2>;
> -			ranges;
> -
> -			status = "disabled";
> -
> -			usb_1_dwc3: usb@a600000 {
> -				compatible = "snps,dwc3";
> -				reg = <0 0x0a600000 0 0xcd00>;
> -
> -				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH 0>;
> -
> -				iommus = <&apps_smmu 0x40 0>;
> -
> -				phys = <&usb_1_hsphy>,
> -				       <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
> -				phy-names = "usb2-phy",
> -					    "usb3-phy";
> -
> -				snps,hird-threshold = /bits/ 8 <0x0>;
> -				snps,usb2-gadget-lpm-disable;
> -				snps,dis_u2_susphy_quirk;
> -				snps,dis_enblslpm_quirk;
> -				snps,dis-u1-entry-quirk;
> -				snps,dis-u2-entry-quirk;
> -				snps,is-utmi-l1-suspend;
> -				snps,usb3_lpm_capable;
> -				snps,usb2-lpm-disable;
> -				snps,has-lpm-erratum;
> -				tx-fifo-resize;
> -
> -				dma-coherent;
> -
> -				ports {
> -					#address-cells = <1>;
> -					#size-cells = <0>;
> -
> -					port@0 {
> -						reg = <0>;
> -
> -						usb_1_dwc3_hs: endpoint {
> -						};
> -					};
> -
> -					port@1 {
> -						reg = <1>;
> -
> -						usb_1_dwc3_ss: endpoint {
> -							remote-endpoint = <&usb_dp_qmpphy_usb_ss_in>;
> -						};
> -					};
> -				};
> -			};
> -		};
> -
>   		pdc: interrupt-controller@b220000 {
>   			compatible = "qcom,sm8650-pdc", "qcom,pdc";
>   			reg = <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

