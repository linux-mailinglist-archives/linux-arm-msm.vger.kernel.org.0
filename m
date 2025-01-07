Return-Path: <linux-arm-msm+bounces-44195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0FEA04714
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 17:50:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E9E73A19BB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 16:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF9671E22FC;
	Tue,  7 Jan 2025 16:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fKvqd+Mr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A133F1DFDBB;
	Tue,  7 Jan 2025 16:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736268614; cv=none; b=TL2IBH4IPKjhTE84l8JVfmBpb7AXuHHHgQ14Tok1pmxp3jTe/ng5m1ahHE4rOzNedMhIR+ozyJ4+sJIoLIwvaGOKceTyTV6Rj+rnV6la9XsisxrhPTptDFhQnq828hy3mRl4HVl8hmx53D6BOfHOvONxgDOVe96wHIrUztJL/Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736268614; c=relaxed/simple;
	bh=v5jdD6ErV5qxO5T+JQT3RzqPB+M3tR00VNCxvdtiVJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fiqtl5cySU8aHH5rMfk9NhPt+w9/MLO4vEbse8cwKAvxvIVx3HcmQsAA9GRnGYKW1oda6SvNez5pIedi/OtXP4pI+fURZFkslZdHxh3RcaXuyoXI06Xx57YnE/vTLmks62/n2sg+L+IR48Xu3EkN9nNP0CWfdcGP2pUl9DnK8W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fKvqd+Mr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78173C4CED6;
	Tue,  7 Jan 2025 16:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736268613;
	bh=v5jdD6ErV5qxO5T+JQT3RzqPB+M3tR00VNCxvdtiVJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fKvqd+MrzpShp81M8sV4OPTg7A92AQloQlcUJqojizts44vSW6j5IG8Xe3mNeMTJm
	 bn9jpQI5ffyWyIeVPVTUhZvG0o41LkUG/dQ5QGKnY9h3Fuf3OhNKl9S0x35zMAyz/e
	 zgTQitij4S+wUTVKNK2/E60TJL6UeudwA0GYCvbsoDGjb8ypeOgMYfXSVrD29Q/6Zb
	 trRUf8oHVEZjRfivdjGMuMFLlQ5xXhA0828p3xt7aJkkFtqup31FtVzRUX1rCQB49L
	 25WsRqXaCAfsM4i/t4NOw8Mb6IXw2wCS3NTwA5bAM7g19FjYmM5jErkQORinevM26n
	 DAqPFQs06+ZEA==
Date: Tue, 7 Jan 2025 10:50:10 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, kernel@quicinc.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] arm64: dts: qcom: Add coresight node for SM8650
Message-ID: <vmowuewd3kjod54vve3a3asagqig7irlsk3dkgtpmaxjfsc6i4@ubp4lmt6wc6i>
References: <20250107-sm8650-cs-dt-v4-1-2113b18754ea@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107-sm8650-cs-dt-v4-1-2113b18754ea@quicinc.com>

On Tue, Jan 07, 2025 at 04:48:26PM +0800, Yuanfang Zhang wrote:
> Add coresight components: Funnel, ETE and ETF for SM8650.
> 

Please adopt the expected subject style of:
"arm64: dts: qcom: <platform>[-board]: Subject"

Run "git log --oneline -- <file>" if you're uncertain how it should
look.

I'm correcting this one while applying it, no need to resend.

Thanks,
Bjorn

> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
> ---
> Changes in v4:
> - Re-sort these nodes by address.
> - Link to v3: https://lore.kernel.org/r/20250103-sm8650-cs-dt-v3-1-759a3f6a3cc8@quicinc.com
> 
> Changes in v3:
> - Move ete0 and funnel-ete to /.
> - Update coding style.
> - Link to v2: https://lore.kernel.org/r/20241210-sm8650-cs-dt-v2-1-cf24c6c9bddc@quicinc.com
> 
> Changes in v2:
> - Update compatible for funnel and etf.
> - remove unnecessary property: reg-names and arm,primecell-periphid.
> - Link to v1: https://lore.kernel.org/r/20241210-sm8650-cs-dt-v1-1-269693451584@quicinc.com
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 166 +++++++++++++++++++++++++++++++++++
>  1 file changed, 166 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 25e47505adcb790d09f1d2726386438487255824..49d6567fbd2e68b66b517d8d9180c7443f8bf611 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -365,6 +365,40 @@ cluster_sleep_1: cluster-sleep-1 {
>  		};
>  	};
>  
> +	ete0 {
> +		compatible = "arm,embedded-trace-extension";
> +
> +		cpu = <&cpu0>;
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
> +	funnel-ete {
> +		compatible = "arm,coresight-static-funnel";
> +
> +		in-ports {
> +			port {
> +				funnel_ete_in_ete0: endpoint {
> +					remote-endpoint = <&ete0_out_funnel_ete>;
> +				};
> +			};
> +		};
> +
> +		out-ports {
> +			port {
> +				funnel_ete_out_funnel_apss: endpoint {
> +					remote-endpoint = <&funnel_apss_in_funnel_ete>;
> +				};
> +			};
> +		};
> +	};
> +
>  	firmware {
>  		scm: scm {
>  			compatible = "qcom,scm-sm8650", "qcom,scm";
> @@ -4854,6 +4888,138 @@ data-pins {
>  			};
>  		};
>  
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
> +
> +					funnel_in1_in_funnel_apss: endpoint {
> +						remote-endpoint = <&funnel_apss_out_funnel_in1>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					funnel_in1_out_funnel_qdss: endpoint {
> +						remote-endpoint = <&funnel_qdss_in_funnel_in1>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@10045000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +
> +			reg = <0x0 0x10045000 0x0 0x1000>;
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
> +					funnel_qdss_in_funnel_in1: endpoint {
> +						remote-endpoint = <&funnel_in1_out_funnel_qdss>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					funnel_qdss_out_funnel_aoss: endpoint {
> +						remote-endpoint = <&funnel_aoss_in_funnel_qdss>;
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
> +				port@7 {
> +					reg = <7>;
> +
> +					funnel_aoss_in_funnel_qdss: endpoint {
> +						remote-endpoint = <&funnel_qdss_out_funnel_aoss>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					funnel_aoss_out_tmc_etf: endpoint {
> +						remote-endpoint = <&tmc_etf_in_funnel_aoss>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tmc@10b05000 {
> +			compatible = "arm,coresight-tmc", "arm,primecell";
> +
> +			reg = <0x0 0x10b05000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					tmc_etf_in_funnel_aoss: endpoint {
> +						remote-endpoint = <&funnel_aoss_out_tmc_etf>;
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
> +				port {
> +					funnel_apss_in_funnel_ete: endpoint {
> +						remote-endpoint = <&funnel_ete_out_funnel_apss>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					funnel_apss_out_funnel_in1: endpoint {
> +						remote-endpoint = <&funnel_in1_in_funnel_apss>;
> +					};
> +				};
> +			};
> +		};
> +
>  		apps_smmu: iommu@15000000 {
>  			compatible = "qcom,sm8650-smmu-500", "qcom,smmu-500", "arm,mmu-500";
>  			reg = <0 0x15000000 0 0x100000>;
> 
> ---
> base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
> change-id: 20241209-sm8650-cs-dt-ad649dcfa5e8
> 
> Best regards,
> -- 
> Yuanfang Zhang <quic_yuanfang@quicinc.com>
> 

