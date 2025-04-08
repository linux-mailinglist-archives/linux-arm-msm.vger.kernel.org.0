Return-Path: <linux-arm-msm+bounces-53597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAEEA81828
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 00:00:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A276A1888D88
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 22:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53DBA2550C8;
	Tue,  8 Apr 2025 22:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nDg++kvC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237F62550A1;
	Tue,  8 Apr 2025 22:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744149623; cv=none; b=UPAS5yKyBjq4a7YnVABDNx5iAjm7AShIO13omDVkcmZf7Tiz6TotQvxQlmLOvX+Aeo/pnYaIf+8/J4LeL+L6RpCHCcV8qOMpFSmSRDofs1KZhF4U/LY5sP/PWD7jjChGMQmRTVe2sHJuHmwTUFpTWrGQjXys7KBpf/rpkxa7bV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744149623; c=relaxed/simple;
	bh=0NeZF5gEJfaNTfbHJm9/EDEebiWO448avrsO1Q1dT2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LxsDc4Vo29+cHw6RlFtonmY8csTOlGJU5KI4NJnXUZoAzFqNJ3gXmILc3oPXskrWvhGW9k6c4NfS3tmRqPFpPyNe7dYJ66hgw4HCkzDSOTrzkfcF/yep/T1JfwvWtDZwej1ntwvDYaihsf8EzBW7cZJD/ju48pqzRuLA+e3Lfgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nDg++kvC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0527C4CEE5;
	Tue,  8 Apr 2025 22:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744149622;
	bh=0NeZF5gEJfaNTfbHJm9/EDEebiWO448avrsO1Q1dT2E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nDg++kvCsnJf9hgHzins+SZ7ibYFgGw+/nb9SCmPNXksKGIEpzvwW11L5x5/agvDd
	 FEbYXP+hALBFSwUV8MqPpw4lb11OTCfBMFzJonbgwtvpZSqVKanBC7p7mgBUBNFvzN
	 g8OflrQmikxUmwyRXhqyQMPpQD22vSSvO54v+K5kmlLrJhLVwEnKeaV9dRj/weumNn
	 ldwaIFPK1a30Yn2bzdlpbW3rgorDkGv1DWNDcSWQIgp2BJ3gQpPwZEUJ3mACUIRczd
	 CpyC0ioUEeV3XACO4xOYj8rCtpapG7Bkl/22J11f2m/mfrVaApxKGdn+zxbagOg5cL
	 90NVAJKcDzqlA==
Date: Tue, 8 Apr 2025 17:00:19 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: neil.armstrong@linaro.org
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dikshita Agarwal <quic_dikshita@quicinc.com>
Subject: Re: [PATCH] arm64: dts: qcom: sm8550: add iris DT node
Message-ID: <jpf7vqlmzlaykgm77brsfcqh4mqxau6pcahd6s3e3e7u3umnyn@vukqip26nqrw>
References: <20250407-topic-sm8x50-upstream-iris-8550-dt-v1-1-1f7ab3083f49@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-topic-sm8x50-upstream-iris-8550-dt-v1-1-1f7ab3083f49@linaro.org>

On Mon, Apr 07, 2025 at 03:03:33PM +0200, neil.armstrong@linaro.org wrote:
> From: Dikshita Agarwal <quic_dikshita@quicinc.com>
> 
> Add DT entries for the sm8550 iris decoder.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 69 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index f78d5292c5dd5ec88c8deb0ca6e5078511ac52b7..ab49329a435d87107a4ff20cb7b9eeacbaf63247 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -3220,6 +3220,75 @@ opp-202000000 {
>  			};
>  		};
>  
> +		iris: video-codec@aa00000 {
> +			compatible = "qcom,sm8550-iris";
> +
> +			reg = <0 0x0aa00000 0 0xf0000>;
> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
> +					<&videocc VIDEO_CC_MVS0_GDSC>,
> +					<&rpmhpd RPMHPD_MXC>,
> +					<&rpmhpd RPMHPD_MMCX>;
> +			power-domain-names = "venus", "vcodec0", "mxc", "mmcx";
> +			operating-points-v2 = <&iris_opp_table>;
> +
> +			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> +				 <&videocc VIDEO_CC_MVS0C_CLK>,
> +				 <&videocc VIDEO_CC_MVS0_CLK>;
> +			clock-names = "iface", "core", "vcodec0_core";
> +
> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "cpu-cfg", "video-mem";
> +
> +			/* FW load region */
> +			memory-region = <&video_mem>;
> +
> +			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
> +			reset-names = "bus";
> +
> +			iommus = <&apps_smmu 0x1940 0x0000>,
> +				 <&apps_smmu 0x1947 0x0000>;
> +			dma-coherent;

Given that this node depends on vendor-signed firmware and without
firmware we're prevented from hitting sync_state, wouldn't it make sense
to leave it status = "disabled" here, and only enable it in those cases
where firmware is available and firmware-name specified?

> +
> +			iris_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-240000000 {
> +					opp-hz = /bits/ 64 <240000000>;
> +					required-opps = <&rpmhpd_opp_svs>,
> +							<&rpmhpd_opp_low_svs>;
> +				};
> +
> +				opp-338000000 {
> +					opp-hz = /bits/ 64 <338000000>;
> +					required-opps = <&rpmhpd_opp_svs>,
> +							<&rpmhpd_opp_svs>;
> +				};
> +
> +				opp-366000000 {
> +					opp-hz = /bits/ 64 <366000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_svs_l1>;
> +				};
> +
> +				opp-444000000 {
> +					opp-hz = /bits/ 64 <444000000>;
> +					required-opps = <&rpmhpd_opp_turbo>,
> +							<&rpmhpd_opp_turbo>;
> +				};
> +
> +				opp-533333334 {
> +					opp-hz = /bits/ 64 <533333334>;
> +					required-opps = <&rpmhpd_opp_turbo_l1>,
> +							<&rpmhpd_opp_turbo_l1>;
> +				};
> +			};
> +		};
> +
>  		videocc: clock-controller@aaf0000 {
>  			compatible = "qcom,sm8550-videocc";
>  			reg = <0 0x0aaf0000 0 0x10000>;
> 
> ---
> base-commit: 2bdde620f7f2bff2ff1cb7dc166859eaa0c78a7c
> change-id: 20250407-topic-sm8x50-upstream-iris-8550-dt-2846b493e652
> 
> Best regards,
> -- 
> Neil Armstrong <neil.armstrong@linaro.org>
> 

