Return-Path: <linux-arm-msm+bounces-81321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 133A3C4FA5B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 20:51:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78AD63A64BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 19:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CD0B3730DA;
	Tue, 11 Nov 2025 19:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tcEq5p+u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711CE350D6A;
	Tue, 11 Nov 2025 19:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762890678; cv=none; b=TH0l9nkSN56Ku/LZNNIEe63K4R6Igz1MNQGg3VbAOi938XLOcYe399ABqokJAh5gRPDo6AEzlzDVsTFEOlnAubZ1FRcOS5MNsqwXz6ej/4lCUEeiO/xlnV+8x8zlE0k2VLRgSe4GzHR6idqfn1ZNxRI3mguy6ftWJsAsXCtORXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762890678; c=relaxed/simple;
	bh=+TkYWj2WP2rrXzlGB/5wpazuB3fEpfcGkYP/NTndZcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PMonc/klNqFEShzMNMAxhUV6OmnpYsPyPb2ELuortj3D53duHS2rwq13m8cIbAPWEyGqm4KUeJC68fSv7I+U+VmX3aNJNI387yJNUX4EpMEkAYpaqFrtEkZymjvImQzgBMDs/0zvqGcmtkTB4vAO29ze2YcgV/KjoGHMZNR6zQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tcEq5p+u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45944C113D0;
	Tue, 11 Nov 2025 19:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762890678;
	bh=+TkYWj2WP2rrXzlGB/5wpazuB3fEpfcGkYP/NTndZcY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tcEq5p+u6VsePX8Q44km3upZKJ8hxXdTv1IciZS+9UI+bZoSorNsgJ6H1grfIO7TG
	 VPC0qBP8N+sMaq/kAa8Bee0VVqlMuJCIxIV1hE75WZeeY6+OjLJSa51PhcVFvR7bFi
	 80Jq8H+v+6RDVG6x9jyOpCIeVKuaHqzgvHB+fB8iSvn6GqbsP60hJnAs2wccY5wwsw
	 Rl61uFNCswLR+MRBviPWLr2zUGVjJK1Y2fGV0VgFqcVuZuvxxkIOIxyo79zWgGod54
	 c1hX9jMlgvRotmGi1d0cVwFl3FaZvU9jmHj0BTHNo1Mlo9gUNU/9IpffmKmeGi12RF
	 578DvrQ4Hh1Jw==
Date: Tue, 11 Nov 2025 13:55:30 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@linaro.org, 
	mukesh.savaliya@oss.qualcomm.com
Subject: Re: [PATCH 1/1] arm64: dts: qcom: talos: Drop opp-shared from QUP
 OPP table
Message-ID: <ivinuu2ofm2hf7jvnw67gjfwo46bepunconf5g4kzdcaxs4jvm@6dm5btokf2zi>
References: <20251111170350.525832-1-viken.dadhaniya@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111170350.525832-1-viken.dadhaniya@oss.qualcomm.com>

On Tue, Nov 11, 2025 at 10:33:50PM +0530, Viken Dadhaniya wrote:
> QUP devices are currently marked with opp-shared in their OPP table,
> causing the kernel to treat them as part of a shared OPP domain. This
> leads to the qcom_geni_serial driver failing to probe with error
> -EBUSY (-16).
> 
> Remove the opp-shared property to ensure the OPP framework treats the
> QUP OPP table as device-specific, allowing the serial driver to probe
> successfully
> 
> Fixes: f6746dc9e379 ("arm64: dts: qcom: qcs615: Add QUPv3 configuration")

This was merged 11 months ago, and Yu Zhang added bluetooth support 3
months ago. What changed to break the QUP users? I think it's reasonable
to use this "Fixes", but we should document - at least on the mailing
list, where the regression happened.

Regards,
Bjorn

> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
> index eb6f69be4a82..ed89d2d509d5 100644
> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
> @@ -536,7 +536,6 @@ cdsp_smp2p_in: slave-kernel {
>  
>  	qup_opp_table: opp-table-qup {
>  		compatible = "operating-points-v2";
> -		opp-shared;
>  
>  		opp-75000000 {
>  			opp-hz = /bits/ 64 <75000000>;
> -- 
> 2.34.1
> 

