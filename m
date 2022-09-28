Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0469C5ED844
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 10:54:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233070AbiI1IyO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 04:54:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230185AbiI1IyM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 04:54:12 -0400
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [IPv6:2001:4b7a:2000:18::162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 622B1E28
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 01:54:11 -0700 (PDT)
Received: from SoMainline.org (D57D4C6E.static.ziggozakelijk.nl [213.125.76.110])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id ADAE21F9C3;
        Wed, 28 Sep 2022 10:54:08 +0200 (CEST)
Date:   Wed, 28 Sep 2022 10:54:06 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     myungjoo.ham@samsung.com, cw00.choi@samsung.com, agross@kernel.org,
        bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        gurus@codeaurora.org, aghayal@codeaurora.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/2 RESEND] extcon: qcom-spmi: Switch to
 platform_get_irq_byname_optional
Message-ID: <20220928085313.6fscjxuxto4kdz6s@SoMainline.org>
References: <20220926113143.40768-1-bryan.odonoghue@linaro.org>
 <20220926113143.40768-3-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220926113143.40768-3-bryan.odonoghue@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2022-09-26 12:31:43, Bryan O'Donoghue wrote:
> Valid configurations for the extcon interrupt declarations are
> 
> - usb_id
> - usb_vbus
> - (usb_id | usb_vbus)
> 
> In the case of a standalone usb_id or usb_vbus failure to find one of the
> interrupts shouldn't generate a warning message. A warning is already in
> place if both IRQs are missing.
> 
> Switch to using platform_get_irq_byname_optional() in order to facilitate
> this behaviour.
> 
> Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Feel free to carry my review from [1] even after addressing the
commit-message nit - thanks for doing so by the way!

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

[1]: https://lore.kernel.org/linux-arm-msm/20220704214444.p5oqik2cqo6h7723@SoMainline.org/

- Marijn

> ---
>  drivers/extcon/extcon-qcom-spmi-misc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/extcon/extcon-qcom-spmi-misc.c b/drivers/extcon/extcon-qcom-spmi-misc.c
> index eb02cb962b5e1..f72e90ceca53d 100644
> --- a/drivers/extcon/extcon-qcom-spmi-misc.c
> +++ b/drivers/extcon/extcon-qcom-spmi-misc.c
> @@ -123,7 +123,7 @@ static int qcom_usb_extcon_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	info->id_irq = platform_get_irq_byname(pdev, "usb_id");
> +	info->id_irq = platform_get_irq_byname_optional(pdev, "usb_id");
>  	if (info->id_irq > 0) {
>  		ret = devm_request_threaded_irq(dev, info->id_irq, NULL,
>  					qcom_usb_irq_handler,
> @@ -136,7 +136,7 @@ static int qcom_usb_extcon_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	info->vbus_irq = platform_get_irq_byname(pdev, "usb_vbus");
> +	info->vbus_irq = platform_get_irq_byname_optional(pdev, "usb_vbus");
>  	if (info->vbus_irq > 0) {
>  		ret = devm_request_threaded_irq(dev, info->vbus_irq, NULL,
>  					qcom_usb_irq_handler,
> -- 
> 2.36.1
> 
