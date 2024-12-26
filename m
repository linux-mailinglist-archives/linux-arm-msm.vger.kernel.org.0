Return-Path: <linux-arm-msm+bounces-43341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 163F69FC895
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 06:26:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 994C716269B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 05:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB612149C4A;
	Thu, 26 Dec 2024 05:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lY8CYCQU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD6917591;
	Thu, 26 Dec 2024 05:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735190798; cv=none; b=P1mQtAIXkF+yBrNJ/sfsSVJqfXlHxqsZloPOhAGTwaGyXh2I1xWYxNo83EjnzHjOY02kIIWGqlw2/tYhImPH0dBPWnKZ5Uc5H2acFeSFVbE+n3QoCAmcXEfNe7/rhO/2vFR0fCD+43dZJKeqha8G5uzLQe1j4DOUaFNsfh32ANs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735190798; c=relaxed/simple;
	bh=5nciksXbY6I+wpamqPIm9wIAZ1D2dLP0lJ5ZcWwMWZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MUsNQAl0qczwMgw26wblxX7u4JyiKWDolN+i862wI41r/leLw4TQ2iwQVDhG+q4+OwM3g5iVy7zsj1ENPu7wrIe7Cf6e4U9DWapCLeTJ8zXLwfRPRoVwvQlAzgBiTUehxltymfToXN1E8PaPYy9amPBhRYhKalQOjZ535t905N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lY8CYCQU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DAFBC4CED3;
	Thu, 26 Dec 2024 05:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735190798;
	bh=5nciksXbY6I+wpamqPIm9wIAZ1D2dLP0lJ5ZcWwMWZM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lY8CYCQUVY0lOEuhBHwrYr2HD43OfHPiulIlQJI4Mo+ikX2vSRxeTUjZSBNFbrs85
	 poI6d1c7eEoVaVBeTEsqM2ummgohUxQj2oZYl9/AvcMfkG+T4U7IoNtpWIwfwqT+zC
	 V7skJPPJnXKKhFD1bn1dm22LYU7FrZ+mqK4F5nVLPNq3zweCD8fLjXG4pBIZMPuGwq
	 wBAWJeB+HXtJK8uJckKcfs8CDhMDKxYGtBGYafdNskkox6KD+J0RK31Q7iz8AjMaTA
	 Vi5fa97n/jItdFoVtHBaACzJqOQ8w6kH81PjWkMMZF9GIH/ksLy+62PXwJuf0g92Kp
	 omMdnOJowqQ/w==
Date: Wed, 25 Dec 2024 23:26:35 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: sm8450: Add coresight nodes
Message-ID: <5nrjgp4drxgrqqu5e4yfnvnnnr34ffj4ielytmw2bvr5ewy7qe@bquvoxvxqmxg>
References: <20240927095413.15278-1-quic_jinlmao@quicinc.com>
 <20240927095413.15278-3-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927095413.15278-3-quic_jinlmao@quicinc.com>

On Fri, Sep 27, 2024 at 02:54:11AM -0700, Mao Jinlong wrote:
> Add coresight components on Qualcomm SM8450 Soc. The components include
> TMC ETF/ETR, ETE, STM, TPDM, CTI.
> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>

Please rebase to fix the &CPUn vs &cpun issue, and please fix the
dtbs_check errors.

Thanks,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 726 +++++++++++++++++++++++++++
>  1 file changed, 726 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 9bafb3b350ff..6d90d6045628 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -287,6 +287,192 @@ CLUSTER_SLEEP_1: cluster-sleep-1 {
>  		};
>  	};
>  
> +	ete-0 {
> +		compatible = "arm,embedded-trace-extension";
> +		cpu = <&CPU0>;
> +
> +		out-ports {
> +			port {
> +				ete0_out_funnel_ete: endpoint {
> +					remote-endpoint = <&funnel_ete_in_ete0>;
> +				};
> +			};
> +		};
> +	};
> +
> +	ete-1 {
> +		compatible = "arm,embedded-trace-extension";
> +		cpu = <&CPU1>;
> +
> +		out-ports {
> +			port {
> +				ete1_out_funnel_ete: endpoint {
> +					remote-endpoint = <&funnel_ete_in_ete1>;
> +				};
> +			};
> +		};
> +	};
> +
> +	ete-2 {
> +		compatible = "arm,embedded-trace-extension";
> +		cpu = <&CPU2>;
> +
> +		out-ports {
> +			port {
> +				ete2_out_funnel_ete: endpoint {
> +					remote-endpoint = <&funnel_ete_in_ete2>;
> +				};
> +			};
> +		};
> +	};
> +
> +	ete-3 {
> +		compatible = "arm,embedded-trace-extension";
> +		cpu = <&CPU3>;
> +
> +		out-ports {
> +			port {
> +				ete3_out_funnel_ete: endpoint {
> +					remote-endpoint = <&funnel_ete_in_ete3>;
> +				};
> +			};
> +		};
> +	};
> +
> +	ete-4 {
> +		compatible = "arm,embedded-trace-extension";
> +		cpu = <&CPU4>;
> +
> +		out-ports {
> +			port {
> +				ete4_out_funnel_ete: endpoint {
> +					remote-endpoint = <&funnel_ete_in_ete4>;
> +				};
> +			};
> +		};
> +	};
> +
> +	ete-5 {
> +		compatible = "arm,embedded-trace-extension";
> +		cpu = <&CPU5>;
> +
> +		out-ports {
> +			port {
> +				ete5_out_funnel_ete: endpoint {
> +					remote-endpoint = <&funnel_ete_in_ete5>;
> +				};
> +			};
> +		};
> +	};
> +
> +	ete-6 {
> +		compatible = "arm,embedded-trace-extension";
> +		cpu = <&CPU6>;
> +
> +		out-ports {
> +			port {
> +				ete6_out_funnel_ete: endpoint {
> +					remote-endpoint = <&funnel_ete_in_ete6>;
> +				};
> +			};
> +		};
> +	};
> +
> +	ete-7 {
> +		compatible = "arm,embedded-trace-extension";
> +		cpu = <&CPU7>;
> +
> +		out-ports {
> +			port {
> +				ete7_out_funnel_ete: endpoint {
> +					remote-endpoint = <&funnel_ete_in_ete7>;
> +				};
> +			};
> +		};
> +	};
> +
> +	funnel-ete {
> +		compatible = "arm,coresight-static-funnel";
> +
> +		out-ports {
> +			port {
> +				funnel_ete_out_funnel_apss: endpoint {
> +					remote-endpoint =
> +						<&funnel_apss_in_funnel_ete>;
> +				};
> +			};
> +		};
> +
> +		in-ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				funnel_ete_in_ete0: endpoint {
> +					remote-endpoint =
> +						<&ete0_out_funnel_ete>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				funnel_ete_in_ete1: endpoint {
> +					remote-endpoint =
> +						<&ete1_out_funnel_ete>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +				funnel_ete_in_ete2: endpoint {
> +					remote-endpoint =
> +						<&ete2_out_funnel_ete>;
> +				};
> +			};
> +
> +			port@3 {
> +				reg = <3>;
> +				funnel_ete_in_ete3: endpoint {
> +					remote-endpoint =
> +						<&ete3_out_funnel_ete>;
> +				};
> +			};
> +
> +			port@4 {
> +				reg = <4>;
> +				funnel_ete_in_ete4: endpoint {
> +					remote-endpoint =
> +						<&ete4_out_funnel_ete>;
> +				};
> +			};
> +
> +			port@5 {
> +				reg = <5>;
> +				funnel_ete_in_ete5: endpoint {
> +					remote-endpoint =
> +						<&ete5_out_funnel_ete>;
> +				};
> +			};
> +
> +			port@6 {
> +				reg = <6>;
> +				funnel_ete_in_ete6: endpoint {
> +					remote-endpoint =
> +						<&ete6_out_funnel_ete>;
> +				};
> +			};
> +
> +			port@7 {
> +				reg = <7>;
> +				funnel_ete_in_ete7: endpoint {
> +					remote-endpoint =
> +						<&ete7_out_funnel_ete>;
> +				};
> +			};
> +		};
> +	};
> +
>  	firmware {
>  		scm: scm {
>  			compatible = "qcom,scm-sm8450", "qcom,scm";
> @@ -4141,6 +4327,546 @@ data-pins {
>  			};
>  		};
>  
> +		stm@10002000 {
> +			compatible = "arm,coresight-stm", "arm,primecell";
> +			reg = <0x0 0x10002000 0x0 0x1000>,
> +				<0x0 0x16280000 0x0 0x180000>;
> +			reg-names = "stm-base", "stm-stimulus-base";
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			out-ports {
> +				port {
> +					stm_out_funnel_in0: endpoint {
> +						remote-endpoint =
> +							<&funnel_in0_in_stm>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@10041000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x10041000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@7 {
> +					reg = <7>;
> +					funnel_in0_in_stm: endpoint {
> +						remote-endpoint =
> +							<&stm_out_funnel_in0>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					funnel_in0_out_funnel_qdss: endpoint {
> +						remote-endpoint =
> +							<&funnel_qdss_in_funnel_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@10042000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +
> +			reg = <0x0 0x10042000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@4 {
> +					reg = <4>;
> +					funnel_in1_in_funnel_apss: endpoint {
> +						remote-endpoint =
> +							<&funnel_apss_out_funnel_in1>;
> +					};
> +				};
> +
> +				port@6 {
> +					reg = <6>;
> +					funnel_in1_in_funnel_dl_center: endpoint {
> +						remote-endpoint =
> +							<&funnel_dl_center_out_funnel_in1>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					funnel_in1_out_funnel_qdss: endpoint {
> +						remote-endpoint =
> +							<&funnel_qdss_in_funnel_in1>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@10045000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x10045000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					funnel_qdss_in_funnel_in0: endpoint {
> +						remote-endpoint =
> +							<&funnel_in0_out_funnel_qdss>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					funnel_qdss_in_funnel_in1: endpoint {
> +						remote-endpoint =
> +							<&funnel_in1_out_funnel_qdss>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					funnel_qdss_out_funnel_aoss: endpoint {
> +						remote-endpoint =
> +							<&funnel_aoss_in_funnel_qdss>;
> +					};
> +				};
> +			};
> +		};
> +
> +		replicator@10046000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x10046000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					replicator_qdss_in_replicator_swao: endpoint {
> +						remote-endpoint =
> +							<&replicator_swao_out_replicator_qdss>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +
> +				port {
> +					replicator_qdss_out_replicator_etr: endpoint {
> +						remote-endpoint =
> +							<&replicator_etr_in_replicator_qdss>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tmc_etr: tmc@10048000 {
> +			compatible = "arm,coresight-tmc", "arm,primecell";
> +			reg = <0x0 0x10048000 0x0 0x1000>;
> +
> +			iommus = <&apps_smmu 0x0600 0>;
> +			arm,buffer-size = <0x10000>;
> +
> +			arm,scatter-gather;
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					tmc_etr_in_replicator_etr: endpoint {
> +						remote-endpoint =
> +							<&replicator_etr_out_tmc_etr>;
> +					};
> +				};
> +			};
> +		};
> +
> +		replicator@1004e000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x1004e000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					replicator_etr_in_replicator_qdss: endpoint {
> +						remote-endpoint =
> +							<&replicator_qdss_out_replicator_etr>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +
> +				port {
> +
> +					replicator_etr_out_tmc_etr: endpoint {
> +						remote-endpoint =
> +							<&tmc_etr_in_replicator_etr>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@10b04000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +
> +			reg = <0x0 0x10b04000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@6 {
> +					reg = <6>;
> +					funnel_aoss_in_tpda_aoss: endpoint {
> +						remote-endpoint =
> +							<&tpda_aoss_out_funnel_aoss>;
> +					};
> +				};
> +
> +				port@7 {
> +					reg = <7>;
> +					funnel_aoss_in_funnel_qdss: endpoint {
> +						remote-endpoint =
> +							<&funnel_qdss_out_funnel_aoss>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					funnel_aoss_out_tmc_etf: endpoint {
> +						remote-endpoint =
> +							<&tmc_etf_in_funnel_aoss>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tmc@10b05000 {
> +			compatible = "arm,coresight-tmc", "arm,primecell";
> +			reg = <0x0 0x10b05000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					tmc_etf_in_funnel_aoss: endpoint {
> +						remote-endpoint =
> +							<&funnel_aoss_out_tmc_etf>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					tmc_etf_out_replicator_swao: endpoint {
> +						remote-endpoint =
> +							<&replicator_swao_in_tmc_etf>;
> +					};
> +				};
> +			};
> +		};
> +
> +		replicator@10b06000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x10b06000 0x0 0x1000>;
> +
> +			qcom,replicator-loses-context;
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					replicator_swao_in_tmc_etf: endpoint {
> +						remote-endpoint =
> +							<&tmc_etf_out_replicator_swao>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +
> +				port {
> +					replicator_swao_out_replicator_qdss: endpoint {
> +						remote-endpoint =
> +							<&replicator_qdss_in_replicator_swao>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpda@10b08000 {
> +			compatible = "qcom,coresight-tpda", "arm,primecell";
> +
> +			reg = <0x0 0x10b08000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					tpda_aoss_in_tpdm_swao_prio_0: endpoint {
> +						remote-endpoint =
> +							<&tpdm_swao_prio_0_out_tpda_aoss>;
> +					};
> +				};
> +
> +				port@4 {
> +					reg = <4>;
> +					tpda_aoss_in_tpdm_swao: endpoint {
> +						remote-endpoint =
> +							<&tpdm_swao_out_tpda_aoss>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +
> +				port {
> +					tpda_aoss_out_funnel_aoss: endpoint {
> +						remote-endpoint =
> +							<&funnel_aoss_in_tpda_aoss>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@10b09000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x10b09000 0x0 0x1000>;
> +
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			out-ports {
> +				port {
> +					tpdm_swao_prio_0_out_tpda_aoss: endpoint {
> +						remote-endpoint =
> +							<&tpda_aoss_in_tpdm_swao_prio_0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@10b0d000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x10b0d000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			out-ports {
> +				port {
> +					tpdm_swao_out_tpda_aoss: endpoint {
> +						remote-endpoint =
> +							<&tpda_aoss_in_tpdm_swao>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@10c28000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x10c28000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			out-ports {
> +				port {
> +					tpdm_dlct_out_tpda_dl_center_26: endpoint {
> +						remote-endpoint =
> +							<&tpda_dl_center_26_in_tpdm_dlct>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@10c29000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x10c29000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			out-ports {
> +				port {
> +					tpdm_ipcc_out_tpda_dl_center_27: endpoint {
> +						remote-endpoint =
> +							<&tpda_dl_center_27_in_tpdm_ipcc>;
> +					};
> +				};
> +			};
> +		};
> +
> +		cti@10c2a000 {
> +			compatible = "arm,coresight-cti", "arm,primecell";
> +			reg = <0x0 0x10c2a000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +		};
> +
> +		cti@10c2b000 {
> +			compatible = "arm,coresight-cti", "arm,primecell";
> +			reg = <0x0 0x10c2b000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +		};
> +
> +		tpda@10c2e000 {
> +			compatible = "qcom,coresight-tpda", "arm,primecell";
> +			reg = <0x0 0x10c2e000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@1a {
> +					reg = <26>;
> +					tpda_dl_center_26_in_tpdm_dlct: endpoint {
> +						remote-endpoint =
> +							<&tpdm_dlct_out_tpda_dl_center_26>;
> +					};
> +				};
> +
> +				port@1b {
> +					reg = <27>;
> +					tpda_dl_center_27_in_tpdm_ipcc: endpoint {
> +						remote-endpoint =
> +							<&tpdm_ipcc_out_tpda_dl_center_27>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +
> +				port {
> +					tpda_dl_center_out_funnel_dl_center: endpoint {
> +						remote-endpoint =
> +							<&funnel_dl_center_in_tpda_dl_center>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@10c2f000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x10c2f000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +
> +				port {
> +					funnel_dl_center_in_tpda_dl_center: endpoint {
> +						remote-endpoint =
> +							<&tpda_dl_center_out_funnel_dl_center>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					funnel_dl_center_out_funnel_in1: endpoint {
> +						remote-endpoint =
> +							<&funnel_in1_in_funnel_dl_center>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@13810000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +
> +			reg = <0x0 0x13810000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +
> +				port {
> +					funnel_apss_in_funnel_ete: endpoint {
> +						remote-endpoint =
> +							<&funnel_ete_out_funnel_apss>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					funnel_apss_out_funnel_in1: endpoint {
> +						remote-endpoint =
> +							<&funnel_in1_in_funnel_apss>;
> +					};
> +				};
> +			};
> +		};
> +
> +		cti@138e0000 {
> +			compatible = "arm,coresight-cti", "arm,primecell";
> +			reg = <0x0 0x138e0000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +		};
> +
> +		cti@138f0000 {
> +			compatible = "arm,coresight-cti", "arm,primecell";
> +			reg = <0x0 0x138f0000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +		};
> +
> +		cti@13900000 {
> +			compatible = "arm,coresight-cti", "arm,primecell";
> +			reg = <0x0 0x13900000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +		};
> +
>  		sram@146aa000 {
>  			compatible = "qcom,sm8450-imem", "syscon", "simple-mfd";
>  			reg = <0 0x146aa000 0 0x1000>;
> -- 
> 2.46.0
> 

