Return-Path: <linux-arm-msm+bounces-43332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B009FC7EC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 05:21:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B215162C09
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 04:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FC142AEE0;
	Thu, 26 Dec 2024 04:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k84WrAVL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59E217C77;
	Thu, 26 Dec 2024 04:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735186880; cv=none; b=Nv4ejjIFDZevClKpN6tQ0Zj12tcHtd+Xc9anV6J344xslAOZewHyHm4O636KlGYjWDfxDoxKOe+e6cyRCyn0+3sLteZUXULfyTM9YJkYT8daAJgmZ0P5ml0lnjEBttejoRQPcefcgwPdMBgpRwePiFG8msUhMBR/KWGYzxNJkJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735186880; c=relaxed/simple;
	bh=tv7VQib+6hirWADA40pM0m7YCvmdrSDTntkl1jNYWHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n6J4mER8h/3r2uPfhGWWQoBPv1QNjqYwoCmOEbJ3TpRLURyM7BsIp6Xbs55jNPkw0OyxUh0x6axvSirJJDCadRlavgL8EzmbobWGyPgtG3x3bb/VEUNawlt2de1DDb5glfiBOfy/jQ/8MYtpTE8jrsM9Pcv3FMvlADkLwB2/+s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k84WrAVL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38358C4CED1;
	Thu, 26 Dec 2024 04:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735186879;
	bh=tv7VQib+6hirWADA40pM0m7YCvmdrSDTntkl1jNYWHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k84WrAVL0N/4xV0g0V+TKrscVjoUtQLgqJqP0aCpFl/38MhaYvlIlfwz6wBVS1mt0
	 vYGZyEXl36WLGqC+qVJN+7tFweRmz3uBfgxScqDwI3ahDL2yZ0gNhO/YMkcu6+lk3l
	 EK1qNFZW+WwYV0OdhRDTRRCCftITs7DkTz+8iJ+UTJk7fOUiID5kOFrSjAp4Gs1hKg
	 sbao0gfmnMz+cLn+6mFc5VJul8fD8qJrr+KX2QbRIGKLSK7Ik0IJhPtJ0oUxXZNzTj
	 FWsz6KUtP9gjFrXbPlOlTZeL5U1wjT3+ZzjEcFrkEG8ZxbeX/TVpPhAhefS6sbFZUi
	 cbzks5rKwe/3w==
Date: Wed, 25 Dec 2024 22:21:16 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Jie Gan <quic_jiegan@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Tingwei Zhang <quic_tingweiz@quicinc.com>, Jinlong Mao <quic_jinlmao@quicinc.com>, 
	Tao Zhang <quic_taozha@quicinc.com>, Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
	Song Chai <quic_songchai@quicinc.com>, Yushan Li <quic_yushli@quicinc.com>
Subject: Re: [PATCH v4 1/1] arm64: dts: qcom: Add coresight nodes for x1e80100
Message-ID: <nhwnzk6vnoyi5uhya74tv2dkgilhd52csxhsgzbdlgxvr5owlr@h7kusgyi2tyu>
References: <20240911012254.2198067-1-quic_jiegan@quicinc.com>
 <20240911012254.2198067-2-quic_jiegan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911012254.2198067-2-quic_jiegan@quicinc.com>

On Wed, Sep 11, 2024 at 09:22:54AM +0800, Jie Gan wrote:
> Add following coresight components for x1e80100 platform.
> It includes CTI, dummy sink, dynamic Funnel, Replicator, STM,
> TPDM, TPDA and TMC ETF.
> 

Sorry, this got sitting in my inbox waiting for input from anyone.
Trying to apply the patch failing with a message that the patch is
"malformated". Did you somehow modify the patch?

Please rebase and resubmit the patch.

Regards,
Bjorn

> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> Tested-by: Yushan Li <quic_yushli@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 1456 ++++++++++++++++++++++++
>  1 file changed, 1456 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 74b694e74705..fd63ddfd9db0 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -305,6 +305,18 @@ CLUSTER_CL5: cluster-sleep-1 {
>  		};
>  	};
>  
> +	dummy-sink {
> +		compatible = "arm,coresight-dummy-sink";
> +
> +		in-ports {
> +			port {
> +				eud_in: endpoint {
> +					remote-endpoint = <&swao_rep_out1>;
> +				};
> +			};
> +		};
> +	};
> +
>  	firmware {
>  		scm: scm {
>  			compatible = "qcom,scm-x1e80100", "qcom,scm";
> @@ -5398,6 +5410,1450 @@ qup_uart21_default: qup-uart21-default-state {
>  			};
>  		};
>  
> +		stm@10002000 {
> +			compatible = "arm,coresight-stm", "arm,primecell";
> +			reg = <0x0 0x10002000 0x0 0x1000>,
> +			      <0x0 0x16280000 0x0 0x180000>;
> +			reg-names = "stm-base", "stm-stimulus-base";
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			out-ports {
> +				port {
> +					stm_out: endpoint {
> +						remote-endpoint = <&funnel0_in7>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@10003000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x10003000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +			status = "disabled";
> +
> +			out-ports {
> +				port {
> +					dcc_tpdm_out: endpoint {
> +						remote-endpoint = <&qdss_tpda_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpda@10004000 {
> +			compatible = "qcom,coresight-tpda", "arm,primecell";
> +			reg = <0x0 0x10004000 0x0 0x1000>;
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
> +
> +					qdss_tpda_in0: endpoint {
> +						remote-endpoint = <&dcc_tpdm_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					qdss_tpda_in1: endpoint {
> +						remote-endpoint = <&qdss_tpdm_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					qdss_tpda_out: endpoint {
> +						remote-endpoint = <&funnel0_in6>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@1000f000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x1000f000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					qdss_tpdm_out: endpoint {
> +						remote-endpoint = <&qdss_tpda_in1>;
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
> +				port@6 {
> +					reg = <6>;
> +
> +					funnel0_in6: endpoint {
> +						remote-endpoint = <&qdss_tpda_out>;
> +					};
> +				};
> +
> +				port@7 {
> +					reg = <7>;
> +
> +					funnel0_in7: endpoint {
> +						remote-endpoint = <&stm_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					funnel0_out: endpoint {
> +						remote-endpoint = <&qdss_funnel_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@10042000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x10042000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					funnel1_in2: endpoint {
> +						remote-endpoint = <&tmess_funnel_out>;
> +					};
> +				};
> +
> +				port@5 {
> +					reg = <5>;
> +
> +					funnel1_in5: endpoint {
> +						remote-endpoint = <&dlst_funnel_out>;
> +					};
> +				};
> +
> +				port@6 {
> +					reg = <6>;
> +
> +					funnel1_in6: endpoint {
> +						remote-endpoint = <&dlct1_funnel_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					funnel1_out: endpoint {
> +						remote-endpoint = <&qdss_funnel_in1>;
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
> +
> +					qdss_funnel_in0: endpoint {
> +						remote-endpoint =
> +						<&funnel0_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					qdss_funnel_in1: endpoint {
> +						remote-endpoint =
> +						<&funnel1_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					qdss_funnel_out: endpoint {
> +						remote-endpoint = <&aoss_funnel_in7>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@10800000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x10800000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					mxa_tpdm_out: endpoint {
> +						remote-endpoint = <&dlct2_tpda_in15>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@1082c000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x1082c000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					gcc_tpdm_out: endpoint {
> +						remote-endpoint = <&dlct1_tpda_in21>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@10841000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x10841000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					prng_tpdm_out: endpoint {
> +						remote-endpoint = <&dlct1_tpda_in19>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@10844000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x10844000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					lpass_cx_tpdm_out: endpoint {
> +						remote-endpoint = <&lpass_cx_funnel_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@10846000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x10846000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					lpass_cx_funnel_in0: endpoint {
> +						remote-endpoint = <&lpass_cx_tpdm_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					lpass_cx_funnel_out: endpoint {
> +						remote-endpoint = <&dlct1_tpda_in4>;
> +					};
> +				};
> +			};
> +		};
> +
> +		cti@1098b000 {
> +			compatible = "arm,coresight-cti", "arm,primecell";
> +			reg = <0x0 0x1098b000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +		};
> +
> +		tpdm@109d0000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x109d0000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +			status = "disabled";
> +
> +			out-ports {
> +				port {
> +					qm_tpdm_out: endpoint {
> +						remote-endpoint = <&dlct1_tpda_in20>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@10ac0000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x10ac0000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +			status = "disabled";
> +
> +			out-ports {
> +				port {
> +					dlst_tpdm0_out: endpoint {
> +						remote-endpoint = <&dlst_tpda_in8>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@10ac1000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x10ac1000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					dlst_tpdm1_out: endpoint {
> +						remote-endpoint = <&dlst_tpda_in9>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpda@10ac4000 {
> +			compatible = "qcom,coresight-tpda", "arm,primecell";
> +			reg = <0x0 0x10ac4000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@8 {
> +					reg = <8>;
> +
> +					dlst_tpda_in8: endpoint {
> +						remote-endpoint = <&dlst_tpdm0_out>;
> +					};
> +				};
> +
> +				port@9 {
> +					reg = <9>;
> +
> +					dlst_tpda_in9: endpoint {
> +						remote-endpoint = <&dlst_tpdm1_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					dlst_tpda_out: endpoint {
> +						remote-endpoint = <&dlst_funnel_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@10ac5000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x10ac5000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					dlst_funnel_in0: endpoint {
> +						remote-endpoint = <&dlst_tpda_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					dlst_funnel_out: endpoint {
> +						remote-endpoint = <&funnel1_in5>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@10b04000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x10b04000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@3 {
> +					reg = <3>;
> +
> +					aoss_funnel_in3: endpoint {
> +						remote-endpoint = <&ddr_lpi_funnel_out>;
> +					};
> +				};
> +
> +				port@6 {
> +					reg = <6>;
> +
> +					aoss_funnel_in6: endpoint {
> +						remote-endpoint = <&aoss_tpda_out>;
> +					};
> +				};
> +
> +				port@7 {
> +					reg = <7>;
> +
> +					aoss_funnel_in7: endpoint {
> +						remote-endpoint = <&qdss_funnel_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					aoss_funnel_out: endpoint {
> +						remote-endpoint =
> +						<&etf0_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		etf0: tmc@10b05000 {
> +			compatible = "arm,coresight-tmc", "arm,primecell";
> +			reg = <0x0 0x10b05000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					etf0_in: endpoint {
> +						remote-endpoint = <&aoss_funnel_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					etf0_out: endpoint {
> +						remote-endpoint = <&swao_rep_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		replicator@10b06000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x10b06000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					swao_rep_in: endpoint {
> +						remote-endpoint = <&etf0_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					swao_rep_out1: endpoint {
> +						remote-endpoint = <&eud_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpda@10b08000 {
> +			compatible = "qcom,coresight-tpda", "arm,primecell";
> +			reg = <0x0 0x10b08000 0x0 0x1000>;
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
> +
> +					aoss_tpda_in0: endpoint {
> +						remote-endpoint = <&aoss_tpdm0_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					aoss_tpda_in1: endpoint {
> +						remote-endpoint = <&aoss_tpdm1_out>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					aoss_tpda_in2: endpoint {
> +						remote-endpoint = <&aoss_tpdm2_out>;
> +					};
> +				};
> +
> +				port@3 {
> +					reg = <3>;
> +
> +					aoss_tpda_in3: endpoint {
> +						remote-endpoint = <&aoss_tpdm3_out>;
> +					};
> +				};
> +
> +				port@4 {
> +					reg = <4>;
> +
> +					aoss_tpda_in4: endpoint {
> +						remote-endpoint = <&aoss_tpdm4_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					aoss_tpda_out: endpoint {
> +						remote-endpoint = <&aoss_funnel_in6>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@10b09000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x10b09000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					aoss_tpdm0_out: endpoint {
> +						remote-endpoint = <&aoss_tpda_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@10b0a000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x10b0a000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					aoss_tpdm1_out: endpoint {
> +						remote-endpoint = <&aoss_tpda_in1>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@10b0b000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x10b0b000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					aoss_tpdm2_out: endpoint {
> +						remote-endpoint = <&aoss_tpda_in2>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@10b0c000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x10b0c000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					aoss_tpdm3_out: endpoint {
> +						remote-endpoint = <&aoss_tpda_in3>;
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
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					aoss_tpdm4_out: endpoint {
> +						remote-endpoint = <&aoss_tpda_in4>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@10b20000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x10b20000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +			status = "disabled";
> +
> +			out-ports {
> +				port {
> +					lpicc_tpdm_out: endpoint {
> +						remote-endpoint = <&ddr_lpi_tpda_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpda@10b23000 {
> +			compatible = "qcom,coresight-tpda", "arm,primecell";
> +			reg = <0x0 0x10b23000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			status = "disabled";
> +
> +			in-ports {
> +				port {
> +					ddr_lpi_tpda_in: endpoint {
> +						remote-endpoint = <&lpicc_tpdm_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ddr_lpi_tpda_out: endpoint {
> +						remote-endpoint = <&ddr_lpi_funnel_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@10b24000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x10b24000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			status = "disabled";
> +
> +			in-ports {
> +				port {
> +					ddr_lpi_funnel_in0: endpoint {
> +						remote-endpoint = <&ddr_lpi_tpda_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ddr_lpi_funnel_out: endpoint {
> +						remote-endpoint = <&aoss_funnel_in3>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@10c08000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x10c08000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					mm_tpdm_out: endpoint {
> +						remote-endpoint = <&mm_funnel_in4>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@10c0b000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x10c0b000 0x0 0x1000>;
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
> +
> +					mm_funnel_in4: endpoint {
> +						remote-endpoint = <&mm_tpdm_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					mm_funnel_out: endpoint {
> +						remote-endpoint = <&dlct2_tpda_in4>;
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
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					dlct1_tpdm_out: endpoint {
> +						remote-endpoint = <&dlct1_tpda_in26>;
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
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					ipcc_tpdm_out: endpoint {
> +						remote-endpoint = <&dlct1_tpda_in27>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpda@10c2b000 {
> +			compatible = "qcom,coresight-tpda", "arm,primecell";
> +			reg = <0x0 0x10c2b000 0x0 0x1000>;
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
> +
> +					dlct1_tpda_in4: endpoint {
> +						remote-endpoint = <&lpass_cx_funnel_out>;
> +					};
> +				};
> +
> +				port@13 {
> +					reg = <19>;
> +
> +					dlct1_tpda_in19: endpoint {
> +						remote-endpoint = <&prng_tpdm_out>;
> +					};
> +				};
> +
> +				port@14 {
> +					reg = <20>;
> +
> +					dlct1_tpda_in20: endpoint {
> +						remote-endpoint = <&qm_tpdm_out>;
> +					};
> +				};
> +
> +				port@15 {
> +					reg = <21>;
> +
> +					dlct1_tpda_in21: endpoint {
> +						remote-endpoint = <&gcc_tpdm_out>;
> +					};
> +				};
> +
> +				port@1a {
> +					reg = <26>;
> +
> +					dlct1_tpda_in26: endpoint {
> +						remote-endpoint = <&dlct1_tpdm_out>;
> +					};
> +				};
> +
> +				port@1b {
> +					reg = <27>;
> +
> +					dlct1_tpda_in27: endpoint {
> +						remote-endpoint = <&ipcc_tpdm_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					dlct1_tpda_out: endpoint {
> +						remote-endpoint = <&dlct1_funnel_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@10c2c000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x10c2c000 0x0 0x1000>;
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
> +
> +					dlct1_funnel_in0: endpoint {
> +						remote-endpoint = <&dlct1_tpda_out>;
> +					};
> +				};
> +
> +				port@4 {
> +					reg = <4>;
> +
> +					dlct1_funnel_in4: endpoint {
> +						remote-endpoint = <&dlct2_funnel_out>;
> +					};
> +				};
> +
> +				port@5 {
> +					reg = <5>;
> +
> +					dlct1_funnel_in5: endpoint {
> +						remote-endpoint = <&ddr_funnel0_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					dlct1_funnel_out: endpoint {
> +						remote-endpoint = <&funnel1_in6>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@10c38000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x10c38000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					dlct2_tpdm0_out: endpoint {
> +						remote-endpoint = <&dlct2_tpda_in16>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@10c39000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x10c39000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					dlct2_tpdm1_out: endpoint {
> +						remote-endpoint = <&dlct2_tpda_in17>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpda@10c3c000 {
> +			compatible = "qcom,coresight-tpda", "arm,primecell";
> +			reg = <0x0 0x10c3c000 0x0 0x1000>;
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
> +
> +					dlct2_tpda_in4: endpoint {
> +						remote-endpoint = <&mm_funnel_out>;
> +					};
> +				};
> +
> +				port@f {
> +					reg = <15>;
> +
> +					dlct2_tpda_in15: endpoint {
> +						remote-endpoint = <&mxa_tpdm_out>;
> +					};
> +				};
> +
> +				port@10 {
> +					reg = <16>;
> +
> +					dlct2_tpda_in16: endpoint {
> +						remote-endpoint = <&dlct2_tpdm0_out>;
> +					};
> +				};
> +
> +				port@11 {
> +					reg = <17>;
> +
> +					dlct2_tpda_in17: endpoint {
> +						remote-endpoint = <&dlct2_tpdm1_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					dlct2_tpda_out: endpoint {
> +						remote-endpoint = <&dlct2_funnel_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@10c3d000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x10c3d000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					dlct2_funnel_in0: endpoint {
> +						remote-endpoint = <&dlct2_tpda_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					dlct2_funnel_out: endpoint {
> +						remote-endpoint = <&dlct1_funnel_in4>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@10cc1000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x10cc1000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +			status = "disabled";
> +
> +			out-ports {
> +				port {
> +					tmess_tpdm1_out: endpoint {
> +						remote-endpoint = <&tmess_tpda_in2>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpda@10cc4000 {
> +			compatible = "qcom,coresight-tpda", "arm,primecell";
> +			reg = <0x0 0x10cc4000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					tmess_tpda_in2: endpoint {
> +						remote-endpoint = <&tmess_tpdm1_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					tmess_tpda_out: endpoint {
> +						remote-endpoint = <&tmess_funnel_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@10cc5000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x10cc5000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					tmess_funnel_in0: endpoint {
> +						remote-endpoint = <&tmess_tpda_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					tmess_funnel_out: endpoint {
> +						remote-endpoint = <&funnel1_in2>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@10d04000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x10d04000 0x0 0x1000>;
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
> +
> +					ddr_funnel0_in6: endpoint {
> +						remote-endpoint = <&ddr_funnel1_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ddr_funnel0_out: endpoint {
> +						remote-endpoint = <&dlct1_funnel_in5>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@10d08000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x10d08000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					llcc0_tpdm_out: endpoint {
> +						remote-endpoint = <&llcc_tpda_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@10d09000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x10d09000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					llcc1_tpdm_out: endpoint {
> +						remote-endpoint = <&llcc_tpda_in1>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@10d0a000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x10d0a000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					llcc2_tpdm_out: endpoint {
> +						remote-endpoint = <&llcc_tpda_in2>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@10d0b000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x10d0b000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					llcc3_tpdm_out: endpoint {
> +						remote-endpoint = <&llcc_tpda_in3>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@10d0c000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x10d0c000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					llcc4_tpdm_out: endpoint {
> +						remote-endpoint = <&llcc_tpda_in4>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@10d0d000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x10d0d000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					llcc5_tpdm_out: endpoint {
> +						remote-endpoint = <&llcc_tpda_in5>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@10d0e000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x10d0e000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					llcc6_tpdm_out: endpoint {
> +						remote-endpoint = <&llcc_tpda_in6>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@10d0f000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x10d0f000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					llcc7_tpdm_out: endpoint {
> +						remote-endpoint = <&llcc_tpda_in7>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpda@10d12000 {
> +			compatible = "qcom,coresight-tpda", "arm,primecell";
> +			reg = <0x0 0x10d12000 0x0 0x1000>;
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
> +
> +					llcc_tpda_in0: endpoint {
> +						remote-endpoint = <&llcc0_tpdm_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					llcc_tpda_in1: endpoint {
> +						remote-endpoint = <&llcc1_tpdm_out>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					llcc_tpda_in2: endpoint {
> +						remote-endpoint = <&llcc2_tpdm_out>;
> +					};
> +				};
> +
> +				port@3 {
> +					reg = <3>;
> +
> +					llcc_tpda_in3: endpoint {
> +						remote-endpoint = <&llcc3_tpdm_out>;
> +					};
> +				};
> +
> +				port@4 {
> +					reg = <4>;
> +
> +					llcc_tpda_in4: endpoint {
> +						remote-endpoint = <&llcc4_tpdm_out>;
> +					};
> +				};
> +
> +				port@5 {
> +					reg = <5>;
> +
> +					llcc_tpda_in5: endpoint {
> +						remote-endpoint = <&llcc5_tpdm_out>;
> +					};
> +				};
> +
> +				port@6 {
> +					reg = <6>;
> +
> +					llcc_tpda_in6: endpoint {
> +						remote-endpoint = <&llcc6_tpdm_out>;
> +					};
> +				};
> +
> +				port@7 {
> +					reg = <7>;
> +
> +					llcc_tpda_in7: endpoint {
> +						remote-endpoint = <&llcc7_tpdm_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					llcc_tpda_out: endpoint {
> +						remote-endpoint = <&ddr_funnel1_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@10d13000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x10d13000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					ddr_funnel1_in0: endpoint {
> +						remote-endpoint = <&llcc_tpda_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ddr_funnel1_out: endpoint {
> +						remote-endpoint = <&ddr_funnel0_in6>;
> +					};
> +				};
> +			};
> +		};
> +
>  		apps_smmu: iommu@15000000 {
>  			compatible = "qcom,x1e80100-smmu-500", "qcom,smmu-500", "arm,mmu-500";
>  			reg = <0 0x15000000 0 0x100000>;
> -- 
> 2.34.1
> 

