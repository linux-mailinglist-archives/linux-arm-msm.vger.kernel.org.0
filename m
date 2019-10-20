Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C01DDDEA5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Oct 2019 15:38:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbfJTNiA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Oct 2019 09:38:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:43532 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726296AbfJTNiA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Oct 2019 09:38:00 -0400
Received: from localhost (unknown [106.51.108.167])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7A7B520679;
        Sun, 20 Oct 2019 13:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571578679;
        bh=za7ORQM0o/bZx348xhyzmEOt1K2y/INFWAQjAQLu7Rc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Te3mQI4m1f7FRFpyXfamK1Liz3THwRFnb25zjYUCxTz9hQv7WPh1bpZoEZz2iwksV
         HKrTnxwyfDNOj+RWHCjNYqgPBAiopuG1VbgCLASx2cCbRVTV4u3imx+dzfqfr1kSWG
         FJ+LwZeQ67ODn/CAg+JwdT3YFqj+3ZU7BpWqM/A0=
Date:   Sun, 20 Oct 2019 19:07:55 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm845: Add APSS watchdog node
Message-ID: <20191020133755.GT2654@vkoul-mobl>
References: <20191003041345.20912-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191003041345.20912-1-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02-10-19, 21:13, Bjorn Andersson wrote:
> Add a node describing the watchdog found in the application subsystem.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index f0b2db34ec4a..23915eab4187 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -3488,6 +3488,12 @@
>  			status = "disabled";
>  		};
>  
> +		watchdog@17980000 {
> +			compatible = "qcom,apss-wdt-sdm845", "qcom,kpss-wdt";
> +			reg = <0 0x17980000 0 0x1000>;
> +			clocks = <&sleep_clk>;
> +		};
> +
>  		apss_shared: mailbox@17990000 {
>  			compatible = "qcom,sdm845-apss-shared";
>  			reg = <0 0x17990000 0 0x1000>;
> -- 
> 2.18.0

-- 
~Vinod
