Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CED052EAF6D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 16:53:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728413AbhAEPwG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 10:52:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:35654 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726749AbhAEPwG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 10:52:06 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5F0CD2229C;
        Tue,  5 Jan 2021 15:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609861886;
        bh=DTFFjaZKHyL45Y+dN3J7QAQworJ94vZ7ZuesPbdKs1g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=A6VW3FCNNJTBEhZzXO3h6/M5FQGVANKq2XLNWaaeg1c1xsWz19xi+5S5Dqh1XU4wi
         4BLFenRaXQ5vi2zWpuA7pxOXd4N0kiC6OnyAB7vsN5lx/CKcZMZY9WO581qvseId0y
         KfvUk9Lzfx71IM3oXhmsKE9JRakpojVnz3Q4eWPRXnG5Y5KtA63ZSsRrXxWsxeuDQ9
         OViURCNumhQYJrZTi0PPvQElmC1+03FxmmsfHBBSAinj2ZadH1UOxS/BHBbSjTH66O
         JWnyyaivTZ82HQZoikB07dkxEujizWAlw+KtXy98H+qlXpKnx6WsYOrAphBWIzJaHb
         El41Xzb52nOsw==
Date:   Tue, 5 Jan 2021 21:21:22 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 12/18] ARM: dts: qcom: sdx55-mtp: Enable QPIC NAND
Message-ID: <20210105155122.GE2771@vkoul-mobl>
References: <20210105122649.13581-1-manivannan.sadhasivam@linaro.org>
 <20210105122649.13581-13-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210105122649.13581-13-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05-01-21, 17:56, Manivannan Sadhasivam wrote:
> Enable QPIC NAND on SDX55-MTP board.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  arch/arm/boot/dts/qcom-sdx55-mtp.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-sdx55-mtp.dts b/arch/arm/boot/dts/qcom-sdx55-mtp.dts
> index 74ea6f425c77..b8d432a4324c 100644
> --- a/arch/arm/boot/dts/qcom-sdx55-mtp.dts
> +++ b/arch/arm/boot/dts/qcom-sdx55-mtp.dts
> @@ -29,3 +29,15 @@ &blsp1_uart3 {
>  &qpic_bam {
>  	status = "ok";
>  };
> +
> +&qpic_nand {
> +	status = "ok";
> +
> +	nand@0 {
> +		reg = <0>;
> +
> +		nand-ecc-strength = <8>;
> +		nand-ecc-step-size = <512>;
> +		nand-bus-width = <8>;
> +	};
> +};
> -- 
> 2.25.1

-- 
~Vinod
