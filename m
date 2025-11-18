Return-Path: <linux-arm-msm+bounces-82361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD8DC6A55C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 16:36:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 906C6350995
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 15:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01366328B5D;
	Tue, 18 Nov 2025 15:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="boQg1LrZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82723115B5;
	Tue, 18 Nov 2025 15:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763480073; cv=none; b=RL64nn1TyeafsWDTtW78pkM090OKBZmGBIFUCEOra6rjWPfRQb5TcXs5E/0AOM5PUVi79Z8e7PxI6TpwklLGrrdm4qzwWy4af9/e036vZTzCdLD1qK0ConzkUWkfr66B5ubijPSMVFx3gMV/jJ1ET0dyQQJJBkkghGOZ03vtGtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763480073; c=relaxed/simple;
	bh=+NULFheWFkpFNqKU4ZzqPvqwgcGiW2kqeXREqYtLTjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E/bWH+8ytYttDA1u0dkCUrGUMRIkm1ycyLtjd0wBSRCypMOFeSWApExi43aLeU+QOi32/UfPxEkXjyFeiNKITq0T5SG95RxXfsdOQyIgUSKYgibEK79AoVft7ElubjyqMDmC+rwiTJ+MEwMW2TfuTl/68twLE1tsiPYVs0ZHqsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=boQg1LrZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0FB9C116B1;
	Tue, 18 Nov 2025 15:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763480073;
	bh=+NULFheWFkpFNqKU4ZzqPvqwgcGiW2kqeXREqYtLTjU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=boQg1LrZyt6GE/WpzH0ZtzEMqE07buySs/bPO6RMRq7PxYUt2L1qe0/0wO7RFuuBy
	 6OiK27DsX9iXcy5jb1MxtBppFzzI5HXtCCN2nIzF5Tc47EFmN5x+VPdPlBMHXPBsRY
	 h5ROgo/kJIoVPsRXnVQEVMLBc9uYNBtsT+TB1T1UbXG/77z/nHWG0iuMhyPo+/y1+B
	 cCx8u/iClsLjygJ6hrODbGuCb1cl0DhCeoo8faQUVtw2rL9oKHZPuzZoGJOGs8h+eY
	 rSHR5uz8e1T0/qSSVvYy0k6+1U/IZFg39gY9VtaP/sj7LCVdVyZk7C1Qe6Q/4gY50I
	 N1kS9vwHJHNVQ==
Date: Tue, 18 Nov 2025 09:39:21 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, ekansh.gupta@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: kodiak: Add memory region for
 audiopd
Message-ID: <mnmfh22usps4xy4hdck4ts2p6rej7iynsifzrqtmlklffnxrwh@f3gn5hz6yemx>
References: <20251114055639.1050-1-jianping.li@oss.qualcomm.com>
 <20251117070819.492-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117070819.492-1-jianping.li@oss.qualcomm.com>

On Mon, Nov 17, 2025 at 03:08:19PM +0800, Jianping Li wrote:

Please don't send new versions as replies to older ones, and please
adopt b4, it will take care of these practicalities for you.

> Add reserved memory region for audio PD dynamic loading and remote
> heap requirement. Also add LPASS and ADSP_HEAP VMIDs.
> 
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---
> Patch v1: https://lore.kernel.org/all/20251114055639.1050-1-jianping.li@oss.qualcomm.com/
> Changes in v2:
>   - Fixed the alignment issue of the qcom,vmids properties, aligning
>     the values in the second row with the first row.
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index 3ef61af2ed8a..7957a9151055 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -190,6 +190,11 @@ rmtfs_mem: rmtfs@9c900000 {
>  			qcom,client-id = <1>;
>  			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
>  		};
> +
> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap@9cb80000 {
> +			reg = <0x0 0x9cb80000 0x0 0x800000>;
> +			no-map;
> +		};

Is the placement of this carveout hard code somewhere in non-HLOS
software? If so, its location and size universal across all Kodiak-based
devices?

Also, the presence of arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
tells me that we have different audio stacks in play on Kodiak. Does all
of them have the same PD loading capabilities/needs?


PS. Others might ask these same questions in the future (I will probably
wonder in 6 months from now...), so let's make sure the git history
carries the answers to why things look the way they do.

Thanks,
Bjorn

>  	};
>  
>  	cpus {
> @@ -4139,6 +4144,9 @@ fastrpc {
>  					qcom,glink-channels = "fastrpcglink-apps-dsp";
>  					label = "adsp";
>  					qcom,non-secure-domain;
> +					memory-region = <&adsp_rpc_remote_heap_mem>;
> +					qcom,vmids = <QCOM_SCM_VMID_LPASS
> +						      QCOM_SCM_VMID_ADSP_HEAP>;
>  					#address-cells = <1>;
>  					#size-cells = <0>;
>  
> -- 
> 2.43.0
> 

