Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88978565F28
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jul 2022 23:44:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230058AbiGDVov (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jul 2022 17:44:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbiGDVou (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jul 2022 17:44:50 -0400
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4C2C5FDA
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jul 2022 14:44:48 -0700 (PDT)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 1FBC53F65F;
        Mon,  4 Jul 2022 23:44:45 +0200 (CEST)
Date:   Mon, 4 Jul 2022 23:44:44 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        myungjoo.ham@samsung.com, cw00.choi@samsung.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        stephan@gerhold.net, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/2] extcon: qcom-spmi: Switch to
 platform_get_irq_byname_optional
Message-ID: <20220704214444.p5oqik2cqo6h7723@SoMainline.org>
References: <20220704010659.223596-1-bryan.odonoghue@linaro.org>
 <20220704010659.223596-3-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220704010659.223596-3-bryan.odonoghue@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2022-07-04 02:06:59, Bryan O'Donoghue wrote:
> Valid configurations for the extcon interrupt declarations are
> 
> - usb_id
> - usb_vbus
> - (usb_id | usb_vbus)
> 
> In the case of a standalone usb_id or usb_vbus failure to find one of the
> interrupts shouldn't generate a warning message.
> 
> Switch to using platform_get_irq_byname_optional() in order to facilitate
> this behaviour.
> 
> Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Thanks for cleaning this up!  Not sure if it is useful to mention in the
patch description that a warning is already in place if _both_ IRQs
happened to be missing, but that's a nit for a completely unrealistic
case where v4 is required for other reasons.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

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
