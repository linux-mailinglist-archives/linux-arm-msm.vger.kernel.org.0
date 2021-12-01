Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F582464A06
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Dec 2021 09:42:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236824AbhLAIqI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Dec 2021 03:46:08 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.160]:34830 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232256AbhLAIqI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Dec 2021 03:46:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1638348167;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=weXKgw4iwBoVH890jJwopyMorOvqZZBQX0hK5OUbKsk=;
    b=Z1vsLqtG+1eLLFGWVyBwADS+N/VCK7e3P2KiFufQUd+Ki9aYsfqfhbeIFMYVoY2knS
    r/7uulLi/XdBiaA5/voaE9YTtCxvbLFakPLmF8g4g8dTbjKsKCGl5xPt7ytngs6zJRTO
    2g2qYyE1WYAHR6k/7WiDCVyPkIKCTpU3or2jkO8UD29+uymUA7ceWKn4nIOclJb1NtYD
    fJZsuZ1EAcaraeGMiyZTUL1qu0h/4KR4jxUt1b9NF1b/OGnbMF76OniTxJtXRR8Jxe4m
    T8NvOexnb9jUGjOU4xjs7domMjXaJm94aM8UbXpkLLrotjl7qO1Y+CQvXg8hXw4EPlfS
    EKVg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267FZF9PwpcNKLUrK85/aY="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.34.10 AUTH)
    with ESMTPSA id j03bcbxB18gkeSR
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Wed, 1 Dec 2021 09:42:46 +0100 (CET)
Date:   Wed, 1 Dec 2021 09:42:41 +0100
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: msm8916: fix MMC controller aliases
Message-ID: <Yac1gYXpwnBZDcuT@gerhold.net>
References: <20211201020559.1611890-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211201020559.1611890-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Dec 01, 2021 at 05:05:59AM +0300, Dmitry Baryshkov wrote:
> Change sdhcN aliases to mmcN to make them actually work. Currently the
> board uses non-standard aliases sdhcN, which do not work, resulting in
> mmc0 and mmc1 hosts randomly changing indices between boots.
> 
> Fixes: c4da5a561627 ("arm64: dts: qcom: Add msm8916 sdhci configuration nodes")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I've been meaning to fix this for quite some time, but whenever I tried
I wasn't actually able to reproduce the random numbering. They were
always numbered correctly but that was probably lucky coincidence. :)
Thanks for sending this!

Reviewed-by: Stephan Gerhold <stephan@gerhold.net>

> ---
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index c1c42f26b61e..8be601275e9b 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -19,8 +19,8 @@ / {
>  	#size-cells = <2>;
>  
>  	aliases {
> -		sdhc1 = &sdhc_1; /* SDC1 eMMC slot */
> -		sdhc2 = &sdhc_2; /* SDC2 SD card slot */
> +		mmc0 = &sdhc_1; /* SDC1 eMMC slot */
> +		mmc1 = &sdhc_2; /* SDC2 SD card slot */
>  	};
>  
>  	chosen { };
> -- 
> 2.33.0
> 
