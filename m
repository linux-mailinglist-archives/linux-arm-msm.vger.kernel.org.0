Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 719DE1B1F6B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2020 09:02:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727070AbgDUHCc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Apr 2020 03:02:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:58498 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725926AbgDUHCc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Apr 2020 03:02:32 -0400
Received: from localhost (unknown [106.51.105.242])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B1CA92087E;
        Tue, 21 Apr 2020 07:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587452551;
        bh=SefUlbt3qGHfn6YQKmn5agcjbImsOYkE3084h7LU2Gw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wnzOppAjScernL62L6WM7PpcossVcK1U8Jq2hn03K+m47fAeBghXcIi/3VdhC1TAR
         RVphA9wtZEzojdxBic9znqJ9gbAcTskD/sCAqwhnO4SR5B7DzDpBhEmbI643eiOr2J
         ThEol07eyCQmyjl6qyEJB9RZ4ECpQ1fdQPLofByk=
Date:   Tue, 21 Apr 2020 12:32:27 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8250: Fix PDC compatible and reg
Message-ID: <20200421070227.GD72691@vkoul-mobl>
References: <20200415054703.739507-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200415054703.739507-1-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14-04-20, 22:47, Bjorn Andersson wrote:
> The pdc node suffers from both too narrow compatible and insufficient
> cells in the reg, fix these.

Reviewed-by: Vinod Koul <vkoul@kernel.org>
Tested-by: Vinod Koul <vkoul@kernel.org>

> Fixes: 60378f1a171e ("arm64: dts: qcom: sm8250: Add sm8250 dts file")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 891d83b2afea..2a7eaefd221d 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -314,8 +314,8 @@ intc: interrupt-controller@17a00000 {
>  		};
>  
>  		pdc: interrupt-controller@b220000 {
> -			compatible = "qcom,sm8250-pdc";
> -			reg = <0x0b220000 0x30000>, <0x17c000f0 0x60>;
> +			compatible = "qcom,sm8250-pdc", "qcom,pdc";
> +			reg = <0 0x0b220000 0 0x30000>, <0 0x17c000f0 0 0x60>;
>  			qcom,pdc-ranges = <0 480 94>, <94 609 31>,
>  					  <125 63 1>, <126 716 12>;
>  			#interrupt-cells = <2>;
> -- 
> 2.24.0

-- 
~Vinod
