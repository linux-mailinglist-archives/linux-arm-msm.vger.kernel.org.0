Return-Path: <linux-arm-msm+bounces-67816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CB4B1BDDD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 02:26:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F1DC18C013F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 00:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B31805464F;
	Wed,  6 Aug 2025 00:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IjM4uejl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8547B2E36EC;
	Wed,  6 Aug 2025 00:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754439958; cv=none; b=r6RkiHUkOdBNDJZN00+8wwqC5cjynwz/g9T/klpPvF2SzOdIN9N+kVLGIzWgiJoCvy97SPOkdS4GL756MGb1r2vTtN9WWxS93lQ7qxG2sBRjxGaPDhSr/ZpZIkizR37H7Zbj9IRpbPtRaPhtpIpR7QUDbtAsOmj4QfwHKVqt8yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754439958; c=relaxed/simple;
	bh=BZWVK6HRJ5+01HiPDOE1XEhAursR2L9D85LdW4mMBS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=koYDYYO7HqROm8db7iBOEOXqxNE9RxwrDui58n7+iHD9VhCz1Lo1cDSRY9zNt8x4l2C/SdE7UtNt8qKafNitZX8wDaQUbWv+wDySRz6DsmRmHpvdhg4S/BhT4pjQt94IsN0m3RimytqTnUy5nVQ6sMgOD4YozmxjDWbDuEolAjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IjM4uejl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E509C4CEF0;
	Wed,  6 Aug 2025 00:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754439958;
	bh=BZWVK6HRJ5+01HiPDOE1XEhAursR2L9D85LdW4mMBS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IjM4uejlYOmFN+tNzGvXanK9a6PGNv4CRB9KjYQ75Ur6sW0ci6w9wMeDDvbzrqESd
	 rjNGcSzdWN81NEyfYNZ01jllaIK5aneglY5SwQ50WuqJrRosUX3jlQh4tAW5rgrctH
	 7+QTrXXPqObsISepzXzy4rLUKjx4sw919LDEZMZ2/lnuEgxpkEU7yTswTjUygKDoP5
	 jEYLogHrOUHL63yr14EgwJHjFgeVokLqLo8H6w53H6gL5NDizA8CULb8fSKWcv3EOx
	 b2vumnVpKNiPqHPtA0lZE2zn73c0u+fZpfrp+50mPUv+iFez5Qtn+av6jiGa6orQQN
	 rYnjldakL1RoA==
Date: Tue, 5 Aug 2025 17:25:55 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: konradybcio@kernel.org, linux-arm-msm@vger.kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, srini@kernel.org, quic_ekangupt@quicinc.com, 
	krzysztof.kozlowski@linaro.org, dmitry.baryshkov@oss.qualcomm.com
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8750: Add adsp fastrpc
 nodes/support
Message-ID: <ovlwlyuwj3q2g4eudesq7qtc3q6omylvnnriagd2nfsrbkbldk@zwdw2yovumeh>
References: <20250805162041.47412-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805162041.47412-1-alexey.klimov@linaro.org>

On Tue, Aug 05, 2025 at 05:20:41PM +0100, Alexey Klimov wrote:
> While at this, also add required memory region for adsp fastrpc.

Please https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
rather than lazily continue the subject.

Also, the way you wrote this makes me believe adsp_rpc_remote_heap_mem
is optional, and as I don't know what it's for I don't understand why
that would be part of this patch.

> 
> Tested on sm8750-mtp device with adsprpdcd.

Just adsprpdcd? Is that sufficient to say that fastrpc is functional? Or
at least that the information here is sufficiently tested?

Regards,
Bjorn

> 
> Cc: Ekansh Gupta <quic_ekangupt@quicinc.com>
> Cc: Srinivas Kandagatla <srini@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
> 
> v2:
> - removed qcom,non-secure-domain flag as requested by Srini.
> 
> Prev version: https://lore.kernel.org/linux-arm-msm/20250502011539.739937-1-alexey.klimov@linaro.org/
> 
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 69 ++++++++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> index 4643705021c6..cc74fb2e27de 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/clock/qcom,sm8750-gcc.h>
>  #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
>  #include <dt-bindings/dma/qcom-gpi.h>
> +#include <dt-bindings/firmware/qcom,scm.h>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interconnect/qcom,icc.h>
>  #include <dt-bindings/interconnect/qcom,sm8750-rpmh.h>
> @@ -523,6 +524,14 @@ llcc_lpi_mem: llcc-lpi@ff800000 {
>  			reg = <0x0 0xff800000 0x0 0x800000>;
>  			no-map;
>  		};
> +
> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
> +			compatible = "shared-dma-pool";
> +			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
> +			alignment = <0x0 0x400000>;
> +			size = <0x0 0xc00000>;
> +			reusable;
> +		};
>  	};
>  
>  	smp2p-adsp {
> @@ -2234,6 +2243,66 @@ q6prmcc: clock-controller {
>  						};
>  					};
>  				};
> +
> +				fastrpc {
> +					compatible = "qcom,fastrpc";
> +					qcom,glink-channels = "fastrpcglink-apps-dsp";
> +					label = "adsp";
> +					memory-region = <&adsp_rpc_remote_heap_mem>;
> +					qcom,vmids = <QCOM_SCM_VMID_LPASS
> +						      QCOM_SCM_VMID_ADSP_HEAP>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					compute-cb@3 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <3>;
> +						iommus = <&apps_smmu 0x1003 0x80>,
> +							 <&apps_smmu 0x1043 0x20>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@4 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <4>;
> +						iommus = <&apps_smmu 0x1004 0x80>,
> +							 <&apps_smmu 0x1044 0x20>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@5 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <5>;
> +						iommus = <&apps_smmu 0x1005 0x80>,
> +							 <&apps_smmu 0x1045 0x20>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@6 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <6>;
> +						iommus = <&apps_smmu 0x1006 0x80>,
> +							 <&apps_smmu 0x1046 0x20>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@7 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <7>;
> +						iommus = <&apps_smmu 0x1007 0x40>,
> +							 <&apps_smmu 0x1067 0x0>,
> +							 <&apps_smmu 0x1087 0x0>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@8 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <8>;
> +						iommus = <&apps_smmu 0x1008 0x80>,
> +							 <&apps_smmu 0x1048 0x20>;
> +						dma-coherent;
> +					};
> +				};
>  			};
>  		};
>  
> -- 
> 2.47.2
> 

