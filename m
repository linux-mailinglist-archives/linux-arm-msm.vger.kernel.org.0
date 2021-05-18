Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DE203877EE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 May 2021 13:43:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242822AbhERLoX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 May 2021 07:44:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:50378 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231655AbhERLoV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 May 2021 07:44:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2B16560BD3;
        Tue, 18 May 2021 11:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621338184;
        bh=XIzw+7OS/V1zUzWXN8higtcu24gjwfGY3HOOQ6GgKwo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eHVpQ/pP/mDVLHU7rqDTrLRoI2M44s1EbX2EQFODh5nm3tn1iDQrei0lCPi48Vqci
         OHO8QFnaph1z8AEl+sL6YO2s31U/6FS0m+vi2tpm/vB4YzRugk4zHwiX7VHqWNxRGA
         ttVNVlVwPxV0C/AzqdJuzlbo+yS1UMDL9YcLDOY2ZlXgR/Gsd7ql5sePcKn2Rr7B59
         fp7upzQTM9YYday43YIPUdY0raybJ/2N0YSWeRjoPkE3YyJGnGFMoIsSstMeBgKjBb
         senkfXtMhEzpbC/JtnbN10qFeJ4NfA4CsOujWASP6jCJVqmxRp2IHLrEC7/BPxWEBn
         qtE5dHGn4+qRQ==
Date:   Tue, 18 May 2021 17:13:00 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, mka@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [RESEND PATCH V4 1/8] arm64: dts: qcom: sm8350: Add label for
 thermal-zones node
Message-ID: <YKOoRPDiTnOQG+4l@vkoul-mobl.Dlink>
References: <1621318822-29332-1-git-send-email-skakit@codeaurora.org>
 <1621318822-29332-2-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621318822-29332-2-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18-05-21, 11:50, satya priya wrote:
> Add label "thermal_zones" for thermal-zones node.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> Changes in RESEND V4:
>  - No Changes.
> 
>  arch/arm64/boot/dts/qcom/sm8350.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> index ed0b51b..47c6c0b 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> @@ -1317,7 +1317,7 @@
>  		};
>  	};
>  
> -	thermal-zones {
> +	thermal_zones: thermal-zones {

is this label used anywhere in this series? If not lets drop it

>  		cpu0-thermal {
>  			polling-delay-passive = <250>;
>  			polling-delay = <1000>;
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
> of Code Aurora Forum, hosted by The Linux Foundation

-- 
~Vinod
