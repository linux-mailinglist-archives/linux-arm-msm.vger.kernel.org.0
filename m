Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FA9E9D51B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2019 19:39:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387424AbfHZRjg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Aug 2019 13:39:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:55378 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731986AbfHZRjf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Aug 2019 13:39:35 -0400
Received: from localhost (unknown [122.178.200.231])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 36B4D2080C;
        Mon, 26 Aug 2019 17:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566841175;
        bh=vhvUfinBuSpm31ERs791ilat2rMccKc/GvBF87f6fuM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TJ9aMvddrr4mCu9l3R/JGImtMK12IkD2AcSahL1RwBX/J8vH30u2zbXRbrC7YQrQr
         6LikbONFNnGjjLjsDpgaSqGg+qOg7dLoXZceMYKcbNRxUOoNvYP1PDdDrC+fRKtoUh
         MtYV36bW8phNflGVDgBMeAEZZ95EbXmqL4saCNDA=
Date:   Mon, 26 Aug 2019 23:08:25 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Andy Gross <agross@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8150: Update parent clock for rpmhcc
Message-ID: <20190826173825.GJ2672@vkoul-mobl>
References: <20190822170533.8056-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190822170533.8056-1-vkoul@kernel.org>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22-08-19, 22:35, Vinod Koul wrote:
> Since rphmcc expects the parent clock name as 'xo_board', update the
> parent clock name.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index 379c40b9a52f..f92c590fd3dc 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -650,7 +650,7 @@
>  			rpmhcc: clock-controller {
>  				compatible = "qcom,sm8150-rpmh-clk";
>  				#clock-cells = <1>;
> -				clock-names = "xo";
> +				clock-names = "xo_board";

With the v5 of the rpmh changes we dont need this, so please drop this

>  				clocks = <&xo_board>;
>  			};
>  		};
> -- 
> 2.20.1

-- 
~Vinod
