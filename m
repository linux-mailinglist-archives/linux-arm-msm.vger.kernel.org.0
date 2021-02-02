Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A80F730C22C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Feb 2021 15:45:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234695AbhBBOmb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Feb 2021 09:42:31 -0500
Received: from relay06.th.seeweb.it ([5.144.164.167]:54565 "EHLO
        relay06.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234441AbhBBOhC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Feb 2021 09:37:02 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id B9EFE3EEC7;
        Tue,  2 Feb 2021 15:36:17 +0100 (CET)
Subject: Re: [PATCH 2/2] regulator: qcom-labibb: Use disable_irq_nosync from
 isr
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        mazziesaccount@gmail.com
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <0400d7471571144bfeba27e3a80a24eb17d81f4d.1612249657.git.matti.vaittinen@fi.rohmeurope.com>
 <f2c4c88d90bf7473e1b84b8a99b7b33d7a081764.1612249657.git.matti.vaittinen@fi.rohmeurope.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <1d37a36c-f82b-726a-6edb-866b087aeef8@somainline.org>
Date:   Tue, 2 Feb 2021 15:36:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <f2c4c88d90bf7473e1b84b8a99b7b33d7a081764.1612249657.git.matti.vaittinen@fi.rohmeurope.com>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il 02/02/21 08:37, Matti Vaittinen ha scritto:
> Calling the disable_irq() from irq handler might be a bad idea as
> disable_irq() should wait for handlers to run. I don't see why
> this wouldn't deadlock in wait_event waiting for the threaded
> handler to complete.
> 
> Use disable_irq_nosync() instead.
> 

It didn't deadlock, but looking at it again -- oh my, I agree with you.

Reviewed-by: AngeloGioacchino Del Regno 
<angelogioacchino.delregno@somainline.org>

> Fixes: 390af53e04114 ("regulator: qcom-labibb: Implement short-circuit and over-current IRQs")
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
> This fix is done purely based on code reading. No testing is done.
> 
> I don't have the HW (and even if I did I might have hard time producing
> these errors) I have not tested this and I am unsure if my code-reading
> is correct => I would _really_ appreciate second opinion and/or testing
> 
>   drivers/regulator/qcom-labibb-regulator.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/regulator/qcom-labibb-regulator.c b/drivers/regulator/qcom-labibb-regulator.c
> index 5ac4566f9b7f..40e92670e307 100644
> --- a/drivers/regulator/qcom-labibb-regulator.c
> +++ b/drivers/regulator/qcom-labibb-regulator.c
> @@ -283,7 +283,7 @@ static irqreturn_t qcom_labibb_ocp_isr(int irq, void *chip)
>   	 * Disable the interrupt temporarily, or it will fire continuously;
>   	 * we will re-enable it in the recovery worker function.
>   	 */
> -	disable_irq(irq);
> +	disable_irq_nosync(irq);
>   
>   	/* Warn the user for overcurrent */
>   	dev_warn(vreg->dev, "Over-Current interrupt fired!\n");
> @@ -536,7 +536,7 @@ static irqreturn_t qcom_labibb_sc_isr(int irq, void *chip)
>   	 * Disable the interrupt temporarily, or it will fire continuously;
>   	 * we will re-enable it in the recovery worker function.
>   	 */
> -	disable_irq(irq);
> +	disable_irq_nosync(irq);
>   
>   	/* Signal out of regulation event to drivers */
>   	regulator_notifier_call_chain(vreg->rdev,
> 

