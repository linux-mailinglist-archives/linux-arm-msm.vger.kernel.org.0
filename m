Return-Path: <linux-arm-msm+bounces-35484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADCD9ABA3B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 01:53:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C4A11C2278F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 23:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 201B51CEE8B;
	Tue, 22 Oct 2024 23:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G9WQl2l5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5644126C05;
	Tue, 22 Oct 2024 23:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729641219; cv=none; b=dF95NhJXRwl6rP9ssP9D1yv4rRV9oRqH1zF8J4wQ7JhKDnXip+drjGB7k+MA5SMg6fdME6+eXi+7QqtaA39IoxyU6CGZTtwmt2ZAJlFeaLuCczEi/chFik2r0t/k+NafdXr58kSzlNCNHyFRBIpJL4rY+8b6VdztYHy+AO5w/iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729641219; c=relaxed/simple;
	bh=5NmULnTHpH0X6L9L++6GtR1NlwsTVtrh4tRSutdPLzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XOAfPGfWapsAcv7eWom9iz6S3HX4VYk0ykJaC2AGZs28LK8ydyubaku5P6bcIRkTbEv6N1CgGCb9nCI7O80vFSbygoKgydO8gAwk7wN4J1KgrCSNZaZK6q+Al1RaM2k/9vfIIhXxVU7GLqnDxxdp/MTu/Akgz1g+AiQ5l0JsXPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G9WQl2l5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 647E7C4CEC3;
	Tue, 22 Oct 2024 23:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729641218;
	bh=5NmULnTHpH0X6L9L++6GtR1NlwsTVtrh4tRSutdPLzE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G9WQl2l5aOiIb3dXJn9MBJlzeeDlICfRumkyvWUVkCtBdk75JjqXgMEExozoxnNUF
	 BkK3gmH8mh1jU6QDKFXpU3IN59ngjtXIZC84APmeFO3/LXUd27YbFebF7pW/EXzMVY
	 EY+2lIG1J00bNs8q1+urzET7iUPD7cfjszjzYRa1ePzbkvn1OILULY+2ixT1h+AfqE
	 uYvZp8UBWXo5UOqRw4AqUpn3M3YaW32aKG+qrMX0Ld3L0MtHwOnlrdu1mf++lIadTa
	 cOxa6jpkpiKp8O0uvAZXIXJxq/eTMoLa0eZ3iifXA7YjmpITvzzBoGVr9QvjFtdSFW
	 TVVtL/8Ru2zbA==
Date: Tue, 22 Oct 2024 18:53:35 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Subramanian Ananthanarayanan <quic_skananth@quicinc.com>
Cc: krzk+dt@kernel.org, quic_krichai@quicinc.com, 
	quic_vbadigan@quicinc.com, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: sa8775p: Update iommu-map entry
Message-ID: <g5hs2jq2ugsaxmncxvfa7635ntvjbvfri7mhtle6symp73vbua@3ku36vto6eo3>
References: <20241008121755.1174730-1-quic_skananth@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008121755.1174730-1-quic_skananth@quicinc.com>

On Tue, Oct 08, 2024 at 05:47:54PM GMT, Subramanian Ananthanarayanan wrote:
> SA8775P has only support for SMMU v2, due to this PCIe has limited
> SID entries to enable dynamic IOMMU mapping in the driver, hence
> we are updating static entries.
> 

This might be a problem, but it's not the "problem description" referred
to in https://docs.kernel.org/process/submitting-patches.html#describe-your-changes

> iommu-map entries are added to support more PCIe device like switch
> attach, SRIOV capable devices. These entries are specific to this
> board as topology of PCIe devices can vary based on the end usecase
> connected via PCIe. For other board files, these entries may
> not be directly applicable.
> 

Don't give vague arguments. Clearly state why this show go here and not
in the base dtsi.

In particular, it's impossible for anyone reading this to know that this
is the only sa8775p board with this many devices and for all other
devices defining these iommu-maps would be bad because...well, why would
that be bad?

Regards,
Bjorn

> Signed-off-by: Subramanian Ananthanarayanan <quic_skananth@quicinc.com>
> ---
> Changes in V2:
> 	- Updated commit message.
> ---
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

