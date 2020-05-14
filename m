Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65DFF1D3192
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 15:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726037AbgENNn6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 09:43:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:43094 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726011AbgENNn5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 09:43:57 -0400
Received: from localhost (unknown [122.182.193.86])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 73A9720727;
        Thu, 14 May 2020 13:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589463837;
        bh=y4VzPym1d+/Z4xemvKYw47+MBhvwt35MP+RtdYnYgFA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IJbGJe2wq1Li8vFevWYTNVN7S8uiBSoYVpBYDeEzXLwSmfvKnxM1gm3vNqNM9TQf4
         i37jRjCerc0nXX56O21u20NQy1qKhXfcfX6Mv0YIASFHWtF+XhRlR71ByQ4sciqmrH
         A0BnFg5Y08mLSnYDgDnAJH1mTVhdJ9AbtTqudBhg=
Date:   Thu, 14 May 2020 19:13:53 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: db820c: fix audio configuration
Message-ID: <20200514134353.GT14092@vkoul-mobl>
References: <20200417092327.7341-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200417092327.7341-1-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17-04-20, 10:23, Srinivas Kandagatla wrote:
> After patch f864edff110d ("ASoC: qdsp6: q6routing: remove default routing")
> and 9b60441692d9 ("ASoC: qdsp6: q6asm-dai: only enable dais from device tree")
> asm dais and routing needs to be properly specified at device tree level.
> 
> This patch fixes this.

Can we add the Fixes tag here please?

Other than that lgtm:

Reviewed-by: Vinod Koul <vkoul@kernel.org>

> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi | 22 +++++++++++++++++++-
>  arch/arm64/boot/dts/qcom/msm8996.dtsi        |  2 ++
>  2 files changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> index 4692b7ad16b7..cf217b6b2b39 100644
> --- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> +++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> @@ -908,10 +908,30 @@
>  	status = "okay";
>  };
>  
> +&q6asmdai {
> +	dai@0 {
> +		reg = <0>;
> +		direction = <2>;
> +	};
> +
> +	dai@1 {
> +		reg = <1>;
> +		direction = <2>;
> +	};
> +
> +	dai@2 {
> +		reg = <2>;
> +		direction = <1>;
> +	};
> +};
> +
>  &sound {
>  	compatible = "qcom,apq8096-sndcard";
>  	model = "DB820c";
> -	audio-routing =	"RX_BIAS", "MCLK";
> +	audio-routing =	"RX_BIAS", "MCLK",
> +		"MM_DL1",  "MultiMedia1 Playback",
> +		"MM_DL2",  "MultiMedia2 Playback",
> +		"MultiMedia3 Capture", "MM_UL3";
>  
>  	mm1-dai-link {
>  		link-name = "MultiMedia1";
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 14827adebd94..98634d5c4440 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -2066,6 +2066,8 @@
>  						reg = <APR_SVC_ASM>;
>  						q6asmdai: dais {
>  							compatible = "qcom,q6asm-dais";
> +							#address-cells = <1>;
> +							#size-cells = <0>;
>  							#sound-dai-cells = <1>;
>  							iommus = <&lpass_q6_smmu 1>;
>  						};
> -- 
> 2.21.0

-- 
~Vinod
