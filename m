Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 279B014A891
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2020 18:05:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726481AbgA0RFC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jan 2020 12:05:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:54928 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725845AbgA0RFC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jan 2020 12:05:02 -0500
Received: from localhost (unknown [122.181.201.159])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EE8B6214AF;
        Mon, 27 Jan 2020 17:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580144701;
        bh=Ya/WRnQH2u3rLockj93TPKOSkCdFP07bsj3EgPDYbHE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wXEesJl+Vy0HGnw/LDcKNUbWVJh1JS7CrjMWazZYB+Ux9ikTAmZBbBl3GyFJJnUwK
         IbdOVcf3VQNaUWdWUbNaqYKuOX3a/vr1yp85xj/T1Lrs4eZufdqCaPiWxpKxuDD0Uj
         wCp8xcn7kGIxEKAfgmM0aBID+fahQibKwKJ0FFEQ=
Date:   Mon, 27 Jan 2020 22:34:57 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <andy.gross@linaro.org>, mka@chromium.org,
        vbadigan@codeaurora.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] arm64: dts: qcom: qcs404: Fix sdhci compat string
Message-ID: <20200127170457.GK2841@vkoul-mobl>
References: <20200127082331.1.I402470e4a162d69fde47ee2ea708b15bde9751f9@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200127082331.1.I402470e4a162d69fde47ee2ea708b15bde9751f9@changeid>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27-01-20, 08:23, Douglas Anderson wrote:
> As per the bindings, the SDHCI controller should have a SoC-specific
> compatible string in addition to the generic version-based one.  Add
> it.

Thanks for spotting it Doug, Btw did some script catch it or manual
inspection?


Reviewed-by: Vinod Koul <vkoul@kernel.org>

> Fixes: 7241ab944da3 ("arm64: dts: qcom: qcs404: Add sdcc1 node")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  arch/arm64/boot/dts/qcom/qcs404.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> index 4ee1e3d5f123..1eea06435779 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> @@ -685,7 +685,7 @@ pcie_phy: phy@7786000 {
>  		};
>  
>  		sdcc1: sdcc@7804000 {
> -			compatible = "qcom,sdhci-msm-v5";
> +			compatible = "qcom,qcs404-sdhci", "qcom,sdhci-msm-v5";
>  			reg = <0x07804000 0x1000>, <0x7805000 0x1000>;
>  			reg-names = "hc_mem", "cmdq_mem";
>  
> -- 
> 2.25.0.341.g760bfbb309-goog

-- 
~Vinod
