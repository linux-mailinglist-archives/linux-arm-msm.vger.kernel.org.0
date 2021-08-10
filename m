Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 998623E7D78
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Aug 2021 18:27:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232312AbhHJQ2G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Aug 2021 12:28:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:55054 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229527AbhHJQ2G (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Aug 2021 12:28:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 622D960C3F;
        Tue, 10 Aug 2021 16:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628612863;
        bh=0vuRK1rdXKIGmAoghMbAKyM3vxwhMVyIV9VcRK/rxmY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=R5Ko47VI6mTnkHo3fF8YHh6LClSWxs3K1lLq9bPuL8TQ4DCtCmaJfokaXNyUUSgyP
         hRef33FnHcPuPAOgfN9o/R7hmMiSp/t9QXYvCqpoHxnLLNWaJe7dm8XbMUWq5z5apL
         wKMlqCfklYKnZ3j/t2q39uCTlb8vlvMz6UQWfo8Mr8JR/rC+u2cgfVPel6q9OB3xW+
         9qH9Z6NqYCaYGbp3CUk8iAMhjTeFdtT74Tv0dDPeBrc6v7HGkamOM6H+0HeI9UmCoX
         +wNvIF1vpNqETggu8cQlrTVk8o4uYq0ALJtD8O+q6xtNvV1eoiMVX6SsaXWsgUuTF6
         yCM1B0uM8lQ2g==
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm8350: fix IPA interconnects
To:     Alex Elder <elder@linaro.org>, bjorn.andersson@linaro.org,
        agross@kernel.org
Cc:     robh+dt@kernel.org, elder@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210804210214.1891755-1-elder@linaro.org>
 <20210804210214.1891755-5-elder@linaro.org>
From:   Georgi Djakov <djakov@kernel.org>
Message-ID: <7a199975-d41a-0716-57d1-7a03af2eb6a4@kernel.org>
Date:   Tue, 10 Aug 2021 19:27:39 +0300
MIME-Version: 1.0
In-Reply-To: <20210804210214.1891755-5-elder@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5.08.21 0:02, Alex Elder wrote:
> There should only be two interconnects defined for IPA on the
> QUalcomm SM8350 SoC.  The names should also match those specified by
> the IPA Device Tree binding.
> 
> Signed-off-by: Alex Elder <elder@linaro.org>

Acked-by: Georgi Djakov <djakov@kernel.org>

> ---
>   arch/arm64/boot/dts/qcom/sm8350.dtsi | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> index a631d58166b1c..01f60a3bd1c14 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> @@ -666,12 +666,10 @@ ipa: ipa@1e40000 {
>   			clocks = <&rpmhcc RPMH_IPA_CLK>;
>   			clock-names = "core";
>   
> -			interconnects = <&aggre2_noc MASTER_IPA &gem_noc SLAVE_LLCC>,
> -					<&mc_virt MASTER_LLCC &mc_virt SLAVE_EBI1>,
> +			interconnects = <&aggre2_noc MASTER_IPA &mc_virt SLAVE_EBI1>,
>   					<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_IPA_CFG>;
> -			interconnect-names = "ipa_to_llcc",
> -					     "llcc_to_ebi1",
> -					     "appss_to_ipa";
> +			interconnect-names = "memory",
> +					     "config";
>   
>   			qcom,smem-states = <&ipa_smp2p_out 0>,
>   					   <&ipa_smp2p_out 1>;
> 

