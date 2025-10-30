Return-Path: <linux-arm-msm+bounces-79734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC295C2179E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 18:25:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6516E1A283AC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 17:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D0853655F3;
	Thu, 30 Oct 2025 17:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gJ4Z2a97"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E0F2D0C76;
	Thu, 30 Oct 2025 17:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761845122; cv=none; b=hk3VdD/hrrkZg8SBtXVe3/sZaCQWb/tBqKIajofVdSL2wdBiJ2DWe/TzKsmDMz71Ea6BZnyPo/Sh9gAQSlVBmEw38GYQcMxr76MY2RkYF5h+QXthP20biPoZu6VlzFMI+MmQ2oETPH0KdJ2PcQE2pObE2sRKT/geMnIWhEHr+yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761845122; c=relaxed/simple;
	bh=WdKAIIhJT2gs5KV8kwsNjtVio9cg6WSq2p99GBETEiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KN7Awa/72HPu8K0ZNSLWf42inNwWV625sLbtBG0DkTnBrRC+q/YcCmuFY34bVrzG12v4uTFWSF49zlywpn+eVGqOd2oKNdT2FLGDPxbhYm0CRkEcj8CZBRDZsZsTUtSPpG3juXRh14co217MFvq3t8fjugm5rRhNQh1E4DnooQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gJ4Z2a97; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 340B9C4CEF1;
	Thu, 30 Oct 2025 17:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761845122;
	bh=WdKAIIhJT2gs5KV8kwsNjtVio9cg6WSq2p99GBETEiU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gJ4Z2a97N4SQmnDYfBTyPyJqIXUTOcjtX4DbvlULHaJjEXBQsrU9LOyjU0uvz/A3o
	 RmMAnZrmvgLLI0YipAkPR1YaKOWKftYVWea+T9jLVQWSrbOByywYVGEX01c8APY/ng
	 Hpdx1FOQWWMi3IrUDXVZcgNNnN+w8p5GHeWG1TEr1NLmnWTHByH5YjV1LXW6nIDpmy
	 XRSdZc9/iHUd726QArS8oukyEGGydDr5fJg4tGbDC2AQ4A0YZxghAesVml0l0ASx/q
	 3uEAfbFj0tkWesItpGdIne16kxfjep/Ivbb8BBeZXcuCnOoe+kwY6iZfn08YgiwYdq
	 99akdTws8dBJA==
Date: Thu, 30 Oct 2025 12:28:31 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] arm64: dts: qcom: sc8180x: create common zap-shader
 node
Message-ID: <weyze7a2pqmt2klt763lbwyvpezqndm5rjnitexalru7hy3xhh@tdqx6xeqp3qu>
References: <20251028-dt-zap-shader-v1-0-7eccb823b986@oss.qualcomm.com>
 <20251028-dt-zap-shader-v1-3-7eccb823b986@oss.qualcomm.com>
 <c90b917e-b3bc-42fb-a127-ab47d5154d0d@oss.qualcomm.com>
 <c62a7f9d-6984-41c0-88c5-1d6c40d411dd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c62a7f9d-6984-41c0-88c5-1d6c40d411dd@oss.qualcomm.com>

On Thu, Oct 30, 2025 at 11:59:00AM +0100, Konrad Dybcio wrote:
> On 10/30/25 11:58 AM, Konrad Dybcio wrote:
> > On 10/28/25 10:00 PM, Dmitry Baryshkov wrote:
> >> In order to reduce duplication, move common GPU memory configuration
> >> from individual board files to sc8180x.dtsi.
> >>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >> ---
> > 
> > [...]
> > 
> >> diff --git a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
> >> index 93de9fe918ebdadf239832db647b84ac9d5a33f6..069953dcad378448800d45e14931efe1fe1a69fc 100644
> >> --- a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
> >> +++ b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
> >> @@ -14,6 +14,8 @@
> >>  #include "sc8180x.dtsi"
> >>  #include "sc8180x-pmics.dtsi"
> >>  
> >> +/delete-node/ &gpu_mem;

I agree with your hmm, seems this line should be dropped(?)

Dmitry, please confirm and I can fix it up as I'm applying the series.

Regards,
Bjorn

> >> +
> >>  / {
> >>  	model = "Qualcomm SC8180x Primus";
> >>  	compatible = "qcom,sc8180x-primus", "qcom,sc8180x";
> >> @@ -444,7 +446,6 @@ &gpu {
> >>  	status = "okay";
> >>  
> >>  	zap-shader {
> >> -		memory-region = <&gpu_mem>;
> > 
> > Hm?
> 
> I "hm"d at the wrong line.. why are we delete-node-ing gpu_mem?
> 
> Konrad

