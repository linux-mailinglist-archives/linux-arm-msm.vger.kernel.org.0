Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E833FD8A9D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2019 10:14:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389542AbfJPIOK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Oct 2019 04:14:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:54956 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727050AbfJPIOK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Oct 2019 04:14:10 -0400
Received: from localhost (unknown [171.76.123.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8CFAD2064B;
        Wed, 16 Oct 2019 08:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571213649;
        bh=e94qyOW697j6Brhk1x91YtKXnJ2xd1o6sJyUcSKS//Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Z97qQvbgnu8PYacVWHANHonUj8ddq5C7zHqQa80FkkFfSEkvw66E5b7Ghf5rZVQjQ
         sReLGNAMwosk+b+dOZGNykmUgDT+fcr/N8iXKlnLXPH21WvogC+IaO4n0Ev1BzdO8y
         Kj7/dWaJlT97a4c1xlLOaQsfFBzkv0OzFqC79B8k=
Date:   Wed, 16 Oct 2019 13:44:01 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Niklas Cassel <niklas.cassel@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs404-evb: Set vdd_apc regulator in
 high power mode
Message-ID: <20191016081401.GI2654@vkoul-mobl>
References: <20191014120920.12691-1-niklas.cassel@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191014120920.12691-1-niklas.cassel@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14-10-19, 14:09, Niklas Cassel wrote:
> vdd_apc is the regulator that supplies the main CPU cluster.
> 
> At sudden CPU load changes, we have noticed invalid page faults on
> addresses with all bits shifted, as well as on addresses with individual
> bits flipped.
> 
> By putting the vdd_apc regulator in high power mode, the voltage drops
> during sudden load changes will be less severe, and we have not been able
> to reproduce the invalid page faults with the regulator in this mode.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

This seems a good bug fix, maybe CC stable?

> 
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
> index 501a7330dbc8..522d3ef72df5 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
> @@ -73,6 +73,7 @@
>  		regulator-always-on;
>  		regulator-boot-on;
>  		regulator-name = "vdd_apc";
> +		regulator-initial-mode = <1>;
>  		regulator-min-microvolt = <1048000>;
>  		regulator-max-microvolt = <1384000>;
>  	};
> -- 
> 2.21.0

-- 
~Vinod
