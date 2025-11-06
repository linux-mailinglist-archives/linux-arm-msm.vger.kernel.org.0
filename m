Return-Path: <linux-arm-msm+bounces-80609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DED4C3B3C6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 14:34:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D633421F30
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 13:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C88A2321434;
	Thu,  6 Nov 2025 13:23:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CB8530C344;
	Thu,  6 Nov 2025 13:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762435403; cv=none; b=jG6++QeiyF/l6byR0oDcn9WJgY0CCK1pXQY+Eqq/iWhr9AY4sW1UqetRv96/loI+RfiaY2HjgSYljXIhIGMB9KHQJnaOvapWRUiOuxb5eQR4gM409iLhbmV2logpswilremC8MZT73eL+aD2T/js+0Gg8sPnqif6uREcouFxDuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762435403; c=relaxed/simple;
	bh=gm6ETa1MFak2IPXxhLkc/M+ABYTgdxIVaSywEBIoVG0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JBdjZxoYOXKGMc2e3sFwZIDdt45Tw5Kl3Z6zAlr90HTjs9tuF0A+pMDP82u45Gg3FF77+bIJaiZlA2JmS19ZTMNbd4xKuPreoohYi181Fmj7cUZblQp1vtCg4aQdKLrM2e7mJtm1R1Z3Nd/I1iGAEcYB34tmBcWAh9e86F9QUKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14B9E1596;
	Thu,  6 Nov 2025 05:23:13 -0800 (PST)
Received: from [10.1.38.47] (Suzukis-MBP.cambridge.arm.com [10.1.38.47])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 12F7C3F694;
	Thu,  6 Nov 2025 05:23:17 -0800 (PST)
Message-ID: <e8f2f3b2-9a87-4c2a-909e-fc771fe37e8c@arm.com>
Date: Thu, 6 Nov 2025 13:23:16 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: lemans: enable static TPDM
Content-Language: en-GB
To: Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
 Tao Zhang <tao.zhang@oss.qualcomm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20251028-add_static_tpdm_support-v4-0-84e21b98e727@oss.qualcomm.com>
 <20251028-add_static_tpdm_support-v4-3-84e21b98e727@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20251028-add_static_tpdm_support-v4-3-84e21b98e727@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/10/2025 10:11, Jie Gan wrote:
> Enable static TPDM device for lemans.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

Assuming this goes via some other tree:

Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>


> ---
>   arch/arm64/boot/dts/qcom/lemans.dtsi | 105 +++++++++++++++++++++++++++++++++++
>   1 file changed, 105 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index 0b154d57ba24..8a93b353d11c 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -2961,6 +2961,14 @@ funnel1_in4: endpoint {
>   						<&apss_funnel1_out>;
>   					};
>   				};
> +
> +				port@5 {
> +					reg = <5>;
> +
> +					funnel1_in5: endpoint {
> +						remote-endpoint = <&dlct0_funnel_out>;
> +					};
> +				};
>   			};
>   		};
>   
> @@ -3118,6 +3126,60 @@ etr1_out: endpoint {
>   			};
>   		};
>   
> +		tpda@4ad3000 {
> +			compatible = "qcom,coresight-tpda", "arm,primecell";
> +			reg = <0x0 0x4ad3000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@10 {
> +					reg = <16>;
> +					dlct0_tpda_in16: endpoint {
> +						remote-endpoint = <&turing0_funnel_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					dlct0_tpda_out: endpoint {
> +						remote-endpoint =
> +						<&dlct0_funnel_in0>;
> +					};
> +				};
> +			};
> +
> +		};
> +
> +		funnel@4ad4000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x4ad4000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					dlct0_funnel_in0: endpoint {
> +						remote-endpoint = <&dlct0_tpda_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					dlct0_funnel_out: endpoint {
> +						remote-endpoint = <&funnel1_in5>;
> +					};
> +				};
> +			};
> +		};
> +
>   		funnel@4b04000 {
>   			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
>   			reg = <0x0 0x4b04000 0x0 0x1000>;
> @@ -3390,6 +3452,35 @@ aoss_cti: cti@4b13000 {
>   			clock-names = "apb_pclk";
>   		};
>   
> +		funnel@4b83000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x4b83000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					turing0_funnel_in1: endpoint {
> +						remote-endpoint = <&turing_llm_tpdm_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					turing0_funnel_out: endpoint {
> +						remote-endpoint = <&dlct0_tpda_in16>;
> +					};
> +				};
> +			};
> +		};
> +
>   		etm@6040000 {
>   			compatible = "arm,primecell";
>   			reg = <0x0 0x6040000 0x0 0x1000>;
> @@ -8269,6 +8360,20 @@ arch_timer: timer {
>   			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
>   	};
>   
> +	turing-llm-tpdm {
> +		compatible = "qcom,coresight-static-tpdm";
> +
> +		qcom,cmb-element-bits = <32>;
> +
> +		out-ports {
> +			port {
> +				turing_llm_tpdm_out: endpoint {
> +					remote-endpoint = <&turing0_funnel_in1>;
> +				};
> +			};
> +		};
> +	};
> +
>   	pcie0: pcie@1c00000 {
>   		compatible = "qcom,pcie-sa8775p";
>   		reg = <0x0 0x01c00000 0x0 0x3000>,
> 


