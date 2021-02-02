Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81C1E30C23A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Feb 2021 15:45:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234679AbhBBOpK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Feb 2021 09:45:10 -0500
Received: from relay08.th.seeweb.it ([5.144.164.169]:40329 "EHLO
        relay08.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232802AbhBBOnF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Feb 2021 09:43:05 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 2FABE3E9BF;
        Tue,  2 Feb 2021 15:42:21 +0100 (CET)
Subject: Re: [PATCH 1/2] regulator: qcom-labibb: avoid unbalanced IRQ enable
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        mazziesaccount@gmail.com
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <0400d7471571144bfeba27e3a80a24eb17d81f4d.1612249657.git.matti.vaittinen@fi.rohmeurope.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <67c5886a-8cfd-5c1f-0bd1-8a6f259f03fb@somainline.org>
Date:   Tue, 2 Feb 2021 15:42:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <0400d7471571144bfeba27e3a80a24eb17d81f4d.1612249657.git.matti.vaittinen@fi.rohmeurope.com>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il 02/02/21 08:36, Matti Vaittinen ha scritto:
> If a spurious OCP IRQ occurs the isr schedules delayed work
> but does not disable the IRQ. The delayed work assumes IRQ was
> disabled in handler and attempts enabling it again causing
> unbalanced enable.
> 

You break the logic like this. Though, I also see the problem.
It is critical for the recovery worker to be executed whenever we enter
the OCP interrupt routine, as we get in there only something wrong
happened.

Please fix this patch.
P.S.: You can't disable irq before qcom_labibb_check_ocp_status;
       perhaps just after it, or in the if branch before goto?

Thank you!
-- Angelo

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
>   drivers/regulator/qcom-labibb-regulator.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/regulator/qcom-labibb-regulator.c b/drivers/regulator/qcom-labibb-regulator.c
> index dbb4511c3c6d..5ac4566f9b7f 100644
> --- a/drivers/regulator/qcom-labibb-regulator.c
> +++ b/drivers/regulator/qcom-labibb-regulator.c
> @@ -275,7 +275,7 @@ static irqreturn_t qcom_labibb_ocp_isr(int irq, void *chip)
>   	ret = qcom_labibb_check_ocp_status(vreg);
>   	if (ret == 0) {
>   		vreg->ocp_irq_count = 0;
> -		goto end;
> +		return IRQ_NONE;
>   	}
>   	vreg->ocp_irq_count++;
>   
> 
> base-commit: 4288b4ccda966c2a49ec7c67100208378bdb34d2
> 

