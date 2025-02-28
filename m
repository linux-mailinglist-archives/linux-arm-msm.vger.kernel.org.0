Return-Path: <linux-arm-msm+bounces-49859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9EBA49B9C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 15:14:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D904B1898880
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 14:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22EAC26E17F;
	Fri, 28 Feb 2025 14:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YT9MBL2M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5F1224CC;
	Fri, 28 Feb 2025 14:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740752076; cv=none; b=giktfRMwp60+hRn58/+gzpeCis85wujWqhbAa9Z5w12pQOJm/bM46mWoFQqUFki80pa9do3/pPqXIPOxUZKT82HKMkVrEctQNElgUZGmCG9GCOC5IMTTcxQZrhIoLWq+Giy8ORKYLIkEBpVH8fou5FSFK3w3y0PaEVH79pHCAD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740752076; c=relaxed/simple;
	bh=7xqVB20YEN9HAmI4aiGua+lmnwEgNMq4jxWz8FsO0cA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tYjS892Ne4x3WPch4sZq4v4CDcuJgqwWcj1CpI3hyhhOaRq47NGl2mXjm1lLjv2q1FcmUsJaJvkGdu00VgCPp6b7cSV6gAtFDO7oO6eK96Wy75GGHa9iaubXNdzkgGM4O/3PgDKwbRbdZPI5miJiiCUtrTKDIq5XG0SvW7v2T2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YT9MBL2M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1790C4CED6;
	Fri, 28 Feb 2025 14:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740752075;
	bh=7xqVB20YEN9HAmI4aiGua+lmnwEgNMq4jxWz8FsO0cA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YT9MBL2MQs8HjnJ3HPaCFDHRopXy+1a3sHVKWJeRk1C6GsGRDc96+aB79+B/wZ5Lz
	 ZR/mc0B9keq8R2t55DkrmhuX1lavLQkeWLYVPkhd44D4KSEyDfBuHJPlb7XvLHXq0P
	 sCfF2vMyEXHK4FZPdUeRMOzb9R0WEDb4VufuaZ1Pp0DqLjX1mB50aFhgcdZV9KEd4J
	 1ezOTsprzdF7MVfVFGCZdrkZY0oT8ZP4ChhZYDRzdTM8I/H5uwqHnh9HtLu41gTGAK
	 nbdgWNpQwFstmCk2a5pvBHqxZEbJ+JbNcqxob3Mw5Fzj0mOtPnzisLpStqgb7W5B2g
	 DxT4wE0RZrtrg==
Date: Fri, 28 Feb 2025 08:14:32 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sa8775p: add QCrypto node
Message-ID: <uohwigzosxv2onh7dtgvhqdkdu2jufiukp6ztxrvfbjoihrypx@cq3apkdx2rhw>
References: <20250227180817.3386795-1-quic_yrangana@quicinc.com>
 <2mlmhzllhb5fhcbwtupy2nk74my5hruliayyr3kayrjvmtou25@em5encygrn2i>
 <7b219289-4f3d-4428-a0af-42491acb1cbb@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b219289-4f3d-4428-a0af-42491acb1cbb@quicinc.com>

On Fri, Feb 28, 2025 at 11:01:16AM +0530, Yuvaraj Ranganathan wrote:
> On 2/28/2025 5:56 AM, Bjorn Andersson wrote:
> > On Thu, Feb 27, 2025 at 11:38:16PM +0530, Yuvaraj Ranganathan wrote:
> >> The initial QCE node change is reverted by the following patch 
> > 
> > s/is/was/
> > 
> >> https://lore.kernel.org/all/20250128115333.95021-1-krzysztof.kozlowski@linaro.org/
> >> because of the build warning,
> >>
> >>   sa8775p-ride.dtb: crypto@1dfa000: compatible: 'oneOf' conditional failed, one must be fixed:
> >>     ...
> >>     'qcom,sa8775p-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
> >>
> >> Add the QCE node back that fix the warnings.
> >>
> > 
> > Are you saying that adding this node back will fix the warning?
> > 
> > I'd expect that you would say something like "The changes to the
> > Devicetree binding has accepted, so add the node back".
> > 
> > Regards,
> > Bjorn
> > 
> >> Signed-off-by: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 12 ++++++++++++
> >>  1 file changed, 12 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> >> index 23049cc58896..b0d77b109305 100644
> >> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> >> @@ -2418,6 +2418,18 @@ cryptobam: dma-controller@1dc4000 {
> >>  				 <&apps_smmu 0x481 0x00>;
> >>  		};
> >>  
> >> +		crypto: crypto@1dfa000 {
> >> +			compatible = "qcom,sa8775p-qce", "qcom,sm8150-qce", "qcom,qce";
> >> +			reg = <0x0 0x01dfa000 0x0 0x6000>;
> >> +			dmas = <&cryptobam 4>, <&cryptobam 5>;
> >> +			dma-names = "rx", "tx";
> >> +			iommus = <&apps_smmu 0x480 0x00>,
> >> +				 <&apps_smmu 0x481 0x00>;
> >> +			interconnects = <&aggre2_noc MASTER_CRYPTO_CORE0 0
> >> +					 &mc_virt SLAVE_EBI1 0>;
> >> +			interconnect-names = "memory";
> >> +		};
> >> +
> >>  		stm: stm@4002000 {
> >>  			compatible = "arm,coresight-stm", "arm,primecell";
> >>  			reg = <0x0 0x4002000 0x0 0x1000>,
> >> -- 
> >> 2.34.1
> >>
> 
> DeviceTree bindings were accepted but the comptabile string does not
> properly bind to it. Hence, adding the correct binding string in the
> compatible has resolved the issue.
> 

Please then write that in the commit message.


That said, what did you base this patch on? While I have picked
Krzysztof's two reverts in my local tree, I have not yet published them.
So your patch is not even based on v6.14-rc1, which now is 4 weeks old.

Patches sent upstream should be built and tested on a suitable upstream
branch!

Regards,
Bjorn

