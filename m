Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3C913F1292
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Aug 2021 06:37:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229560AbhHSEiB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Aug 2021 00:38:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:51190 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229451AbhHSEiA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Aug 2021 00:38:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0B15561042;
        Thu, 19 Aug 2021 04:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629347845;
        bh=pGZ5omv2oCYRcuBpQ6+cH1mFqh6u3/r87NghQa0XqeQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bCcmq2zDptuL9eg/KaLcY95BKAyJtutlIiZtToFeg93WGU1fNndPprWxkOTZglfGE
         TuXWUuo0V5ZaP450tfq1hl3uwvqzlOXyc+tWI0a8nWM6hWLF2OScc+fS/C9V2JnHql
         7UBUN8y0oKaUMMpUGzsUb6pKtEN/ba5PMZ+ZErAs6dsY9gc5zSp2y81Rx8DwhH7Oyk
         ZHe5f/UkLcxN7NQ9JNET33brXd5DreNMH8acz5QyCzSXYWhD6dKT70hQJ417AwUJfg
         ixsrfWJQJBhzZdj3Vg8oWIymYIlLsNv64zFT6fE2z0PP67WnhIr5Fc4u/b/1Tg1gXO
         Th3opgZk7n3tw==
Date:   Thu, 19 Aug 2021 10:07:20 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org, will@kernel.org,
        saiprakash.ranjan@codeaurora.org, swboyd@chromium.org,
        mka@chromium.org, ohad@wizery.com, agross@kernel.org,
        mathieu.poirier@linaro.org, robin.murphy@arm.com, joro@8bytes.org,
        p.zabel@pengutronix.de, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        evgreen@chromium.org, dianders@chromium.org
Subject: Re: [PATCH v3 06/10] arm64: dts: qcom: sc7280: Update reserved
 memory map
Message-ID: <YR3gAD68xRtNJRhi@matsya>
References: <1629344185-27368-1-git-send-email-sibis@codeaurora.org>
 <1629344185-27368-7-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1629344185-27368-7-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Sibi,

On 19-08-21, 09:06, Sibi Sankar wrote:

> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 5e4f4f3b738a..894106efadfe 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -48,6 +48,16 @@
>  		#size-cells = <2>;
>  		ranges;
>  
> +		hyp_mem: memory@80000000 {
> +			reg = <0x0 0x80000000 0x0 0x600000>;
> +			no-map;

This should conflict with the memory defined in this file:

        memory@80000000 {
                device_type = "memory";
                /* We expect the bootloader to fill in the size */
                reg = <0 0x80000000 0 0>;
        };

I think this should be updated?

-- 
~Vinod
