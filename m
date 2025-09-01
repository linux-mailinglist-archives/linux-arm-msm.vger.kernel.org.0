Return-Path: <linux-arm-msm+bounces-71426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8CCB3EC6E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 18:41:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C033C1B2038C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 16:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ED6C30E839;
	Mon,  1 Sep 2025 16:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DjkkWupj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BE31C5D7D;
	Mon,  1 Sep 2025 16:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756744856; cv=none; b=C7yTZsesfO8Yus4LTFCskejXG6Dy+SikJE/Rq3SxNvL5HOXuzJpE8509G/pyLGYNgbQu+lyY8MFIWOfG3BwHUR3hp/8WjZuvfK6WhOu+r08byED/KJifMyc+9O+5rTJ9otMS3WV6cEt+MQgHeEqqNs5/uYLqc50dhk5jMCK9xN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756744856; c=relaxed/simple;
	bh=iJeiMi9VRSfUO8RM1XIwm8HC63zzuJMuJ5giNeAnYAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tkrCDltYfssDCtHrZnLxg/R4NMa4QENiSoM6/yxjruzwF1SgkPu+WfJggt1CK8PHdDT5Kr3sJe7RPv6+x3lcWvjXCViYr8DsJszWI0Qf3QUGY7EEuNqPyofiO5enn86mt6RbaF8phfWnG62UMMYPjLrRkWd667Xur2J8icoVEuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DjkkWupj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2B96C4CEF0;
	Mon,  1 Sep 2025 16:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756744855;
	bh=iJeiMi9VRSfUO8RM1XIwm8HC63zzuJMuJ5giNeAnYAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DjkkWupjeUDajgy5fDD14Mz+uiylr8E5YZeTV5U3B9EgyVqccxSwHBmlNUuXSBOzU
	 ADT1gjzI3a9sBDmiaGOf0ZYFca/5J0ppZVNGLGnvbF6qwl7c1g/YNzRMD/obVTg4+6
	 sZT1ridrtk5aEW6NvrPu9qV+2psAeY1TybkJ/nuMhyZ9hCEI5uXnVJ6OdozHPRklU3
	 eQerOuAEgqweZFHl8c4W2rLzeZwC67T2DLpHASel4zXgDDuJKzSbVzbUOpDzBPbVAK
	 8jzAxDAfpytN+9gPYvCv/jFxKHukBeIL2XLkHwPnusVfneFKH0OvKNfVUB3C8WZls2
	 pPn2kpOIi3org==
Date: Mon, 1 Sep 2025 11:40:53 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Sai Prakash Ranjan <quic_saipraka@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 04/10] arm64: dts: qcom: sc7180: Explicitly describe the
 IPA IMEM slice
Message-ID: <6eqsy3vo7p6pszkyqorpe3gxlk66q2kpeadqdchqfyqerym35p@7rrfea5tgnnt>
References: <20250523-topic-ipa_mem_dts-v1-0-f7aa94fac1ab@oss.qualcomm.com>
 <20250523-topic-ipa_mem_dts-v1-4-f7aa94fac1ab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523-topic-ipa_mem_dts-v1-4-f7aa94fac1ab@oss.qualcomm.com>

On Fri, May 23, 2025 at 01:18:19AM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> As part of stepping away from crazy hardcoding in the driver, move
> define the slice explicitly and pass it to the IPA node.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 3afb69921be363bd35a996bc1d6f70ff007c6af8..84b032dc09d36e56eeaf182125cceb44e7333765 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1640,6 +1640,8 @@ ipa: ipa@1e40000 {
>  			qcom,smem-state-names = "ipa-clock-enabled-valid",
>  						"ipa-clock-enabled";
>  
> +			sram = <&ipa_modem_tables>;

Please resubmit the second half of this series, once sram is an accepted
property.

Thanks,
Bjorn

> +
>  			status = "disabled";
>  		};
>  
> @@ -3535,6 +3537,10 @@ sram@14680000 {
>  
>  			ranges = <0 0 0x14680000 0x2e000>;
>  
> +			ipa_modem_tables: modem-tables@28000 {
> +				reg = <0x28000 0x2000>;
> +			};
> +
>  			pil-reloc@2a94c {
>  				compatible = "qcom,pil-reloc-info";
>  				reg = <0x2a94c 0xc8>;
> 
> -- 
> 2.49.0
> 

