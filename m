Return-Path: <linux-arm-msm+bounces-32911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1086798CB1B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 04:18:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4C501C21C52
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 02:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 424DA2107;
	Wed,  2 Oct 2024 02:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VFpd9yfD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157A89454;
	Wed,  2 Oct 2024 02:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727835508; cv=none; b=OtNGjVpyZrdJUdc7nH1Tg75gGfSqCisN47yhndK2j4RzkoGBJKpui3RGGmiuAIzPOJjwsPqJX8f6/J6k84RQORE9eteCEgfZ8fyHWoin3iopuMLhU1IYKJlbgOjw0Pcf90gsdeTz8WomSeEJ4GrGvEPpVF6eCdNhRtz25V2VIDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727835508; c=relaxed/simple;
	bh=D3TjNzj1nNxdyVO/ed5PF2H+V9Wq0ayk16KLDRC/Dyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hhJ1qZpjoIAQUvA1ziU6p+LTPWA/3sSxOuT4jZLebvKz7Zia3OtZKdrBfNOmkELTilv6tNLkjh3otf8N9NSUDbHMz5lWAzCsmZ8cjDAgtwHkxwyqzz+vD8k0YQe9K8HVRLLXyeaxouxz4knTmKWgXLuVS2gqo5d/C4kPDMhS7lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VFpd9yfD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4A6DC4CEC6;
	Wed,  2 Oct 2024 02:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727835507;
	bh=D3TjNzj1nNxdyVO/ed5PF2H+V9Wq0ayk16KLDRC/Dyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VFpd9yfDjC87O+dpShYdEdhwbWkWjAt6C4owBtMXXT9N10hQCiVkFbo2fu6Xte32h
	 x2BhR3o/gXXGzxKcvJpbzeq+sAB6FoHV9u3CzB7tMxmLvbV7RbIObtD6zJCCuHP0YV
	 c7JRTddeoFeBsgndaMSlcfPR3Awxf8sOi+5kw9WP5UvAL5zuU/Hj3GOh4eJoRCiMMz
	 TjUvHqfUV+ZMI79M1+dxsdpH0i8tDXiGZGF3BY/hsGnXki2VT0x9evLKzeVHI/ja9u
	 VojfH+rkDc+AI4XMlBpDuP1VBJuN5zqPfEGXPIe+hjqtcR++iMbM7fFu6P0tztOtDp
	 Gf9S3cYqe/jeQ==
Date: Tue, 1 Oct 2024 21:18:24 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Subramanian Ananthanarayanan <quic_skananth@quicinc.com>
Cc: krzk+dt@kernel.org, quic_krichai@quicinc.com, 
	quic_vbadigan@quicinc.com, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] arm64: dts: qcom: sa8775p: Update iommu-map entry
Message-ID: <zd6hff2oun3dgte75sl4jbtqvkgaohxfdkaei7wgmxbqljzx5u@htzwhxectc6i>
References: <20241001114601.1097618-1-quic_skananth@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001114601.1097618-1-quic_skananth@quicinc.com>

On Tue, Oct 01, 2024 at 05:16:01PM GMT, Subramanian Ananthanarayanan wrote:
> SA8775P has only support for SMMU v2, due to this PCIe has limited
> SID entries to enable dynamic IOMMU mapping in the driver, hence
> we are updating static entries.
> 
> iommu-map entries are added to support more PCIe device like switch
> attach, SRIOV capable devices.
> 

Is there a reason for this to be specific to sa8775p-ride? Will other
boards have different iommu-maps?

Regards,
Bjorn

> Signed-off-by: Subramanian Ananthanarayanan <quic_skananth@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 62 ++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> index 0c1b21def4b6..05c9f572ae42 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> @@ -675,6 +675,37 @@ &pcie0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pcie0_default_state>;
>  
> +	iommu-map = <0x0 &pcie_smmu 0x0000 0x1>,
> +		    <0x100 &pcie_smmu 0x0001 0x1>,
> +		    <0x101 &pcie_smmu 0x0002 0x1>,
> +		    <0x208 &pcie_smmu 0x0003 0x1>,
> +		    <0x210 &pcie_smmu 0x0004 0x1>,
> +		    <0x218 &pcie_smmu 0x0005 0x1>,
> +		    <0x280 &pcie_smmu 0x0006 0x1>,
> +		    <0x281 &pcie_smmu 0x0007 0x1>,
> +		    <0x282 &pcie_smmu 0x0008 0x1>,
> +		    <0x283 &pcie_smmu 0x0009 0x1>,
> +		    <0x284 &pcie_smmu 0x000a 0x1>,
> +		    <0x285 &pcie_smmu 0x000b 0x1>,
> +		    <0x286 &pcie_smmu 0x000c 0x1>,
> +		    <0x287 &pcie_smmu 0x000d 0x1>,
> +		    <0x288 &pcie_smmu 0x000e 0x1>,
> +		    <0x289 &pcie_smmu 0x000f 0x1>,
> +		    <0x28a &pcie_smmu 0x0010 0x1>,
> +		    <0x28b &pcie_smmu 0x0011 0x1>,
> +		    <0x28c &pcie_smmu 0x0012 0x1>,
> +		    <0x28d &pcie_smmu 0x0013 0x1>,
> +		    <0x28e &pcie_smmu 0x0014 0x1>,
> +		    <0x28f &pcie_smmu 0x0015 0x1>,
> +		    <0x290 &pcie_smmu 0x0016 0x1>,
> +		    <0x291 &pcie_smmu 0x0017 0x1>,
> +		    <0x292 &pcie_smmu 0x0018 0x1>,
> +		    <0x293 &pcie_smmu 0x0019 0x1>,
> +		    <0x300 &pcie_smmu 0x001a 0x1>,
> +		    <0x400 &pcie_smmu 0x001b 0x1>,
> +		    <0x500 &pcie_smmu 0x001c 0x1>,
> +		    <0x501 &pcie_smmu 0x001d 0x1>;
> +
>  	status = "okay";
>  };
>  
> @@ -685,6 +716,37 @@ &pcie1 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pcie1_default_state>;
>  
> +	iommu-map = <0x0 &pcie_smmu 0x0080 0x1>,
> +		    <0x100 &pcie_smmu 0x0081 0x1>,
> +		    <0x101 &pcie_smmu 0x0082 0x1>,
> +		    <0x208 &pcie_smmu 0x0083 0x1>,
> +		    <0x210 &pcie_smmu 0x0084 0x1>,
> +		    <0x218 &pcie_smmu 0x0085 0x1>,
> +		    <0x280 &pcie_smmu 0x0086 0x1>,
> +		    <0x281 &pcie_smmu 0x0087 0x1>,
> +		    <0x282 &pcie_smmu 0x0088 0x1>,
> +		    <0x283 &pcie_smmu 0x0089 0x1>,
> +		    <0x284 &pcie_smmu 0x008a 0x1>,
> +		    <0x285 &pcie_smmu 0x008b 0x1>,
> +		    <0x286 &pcie_smmu 0x008c 0x1>,
> +		    <0x287 &pcie_smmu 0x008d 0x1>,
> +		    <0x288 &pcie_smmu 0x008e 0x1>,
> +		    <0x289 &pcie_smmu 0x008f 0x1>,
> +		    <0x28a &pcie_smmu 0x0090 0x1>,
> +		    <0x28b &pcie_smmu 0x0091 0x1>,
> +		    <0x28c &pcie_smmu 0x0092 0x1>,
> +		    <0x28d &pcie_smmu 0x0093 0x1>,
> +		    <0x28e &pcie_smmu 0x0094 0x1>,
> +		    <0x28f &pcie_smmu 0x0095 0x1>,
> +		    <0x290 &pcie_smmu 0x0096 0x1>,
> +		    <0x291 &pcie_smmu 0x0097 0x1>,
> +		    <0x292 &pcie_smmu 0x0098 0x1>,
> +		    <0x29d &pcie_smmu 0x0099 0x1>,
> +		    <0x300 &pcie_smmu 0x009a 0x1>,
> +		    <0x400 &pcie_smmu 0x009b 0x1>,
> +		    <0x500 &pcie_smmu 0x009c 0x1>,
> +		    <0x501 &pcie_smmu 0x009d 0x1>;
> +
>  	status = "okay";
>  };
>  
> -- 
> 2.34.1
> 

