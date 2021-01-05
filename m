Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1AD82EAF6F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 16:53:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728008AbhAEPw1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 10:52:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:35676 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726020AbhAEPw1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 10:52:27 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D201722BF5;
        Tue,  5 Jan 2021 15:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609861906;
        bh=+5aIYwgMiQXYrAkz2kxPE8EFLOTc4j7IckpWp0oejrU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kNcoiFxkQk7RnDGQJBmAT0Abz14PolfuJ+j4Z1a6H7dDS34F79i5VgWvqnADaEii8
         hdlzcCL5OlCamotBeL/0JoMoF5GLu7Chp4xVLa17UDrvMekvEiIczS6A9Sw/vt0J6r
         ELrRuNQ8iI3XE4EKWVRIMbOZR2UEoMcNadIfLK24GtwvdCOH38ZFVvCruaJ8KsNOW5
         hcUFHnNChMzScRZ8oTT/yu6d/oZObfJGjLBSC2BATplDzO8ah4W9YobGA62GW58Mly
         EjZNN4N0oJbrHu68IM8PTsEeyZN17eSgZeXr+B1F4Is3eAOXYGnBnwgCjqK5ZW9HuK
         spUij7vSyoN7A==
Date:   Tue, 5 Jan 2021 21:21:43 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 11/18] ARM: dts: qcom: sdx55-mtp: Enable BAM DMA
Message-ID: <20210105155143.GF2771@vkoul-mobl>
References: <20210105122649.13581-1-manivannan.sadhasivam@linaro.org>
 <20210105122649.13581-12-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210105122649.13581-12-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05-01-21, 17:56, Manivannan Sadhasivam wrote:
> Enable BAM DMA on SDX55-MTP board.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  arch/arm/boot/dts/qcom-sdx55-mtp.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-sdx55-mtp.dts b/arch/arm/boot/dts/qcom-sdx55-mtp.dts
> index 262660e6dd11..74ea6f425c77 100644
> --- a/arch/arm/boot/dts/qcom-sdx55-mtp.dts
> +++ b/arch/arm/boot/dts/qcom-sdx55-mtp.dts
> @@ -25,3 +25,7 @@ chosen {
>  &blsp1_uart3 {
>  	status = "ok";
>  };
> +
> +&qpic_bam {
> +	status = "ok";
> +};
> -- 
> 2.25.1

-- 
~Vinod
