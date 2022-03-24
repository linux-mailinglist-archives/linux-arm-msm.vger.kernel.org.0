Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A717E4E612C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Mar 2022 10:38:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242607AbiCXJjy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Mar 2022 05:39:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231397AbiCXJjx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Mar 2022 05:39:53 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DE9D25E87
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Mar 2022 02:38:20 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-d4164acd34so4403375fac.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Mar 2022 02:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y7FIzF9vShJDyNSTAI9Bl+NsBsiiQpO5BNc3AiMxftk=;
        b=ySe6RJRCAPeeLMB9SnC6/a97PstVNOtFinmQGKjn4YHaVL5NF/NRb1UE0H5QkUUNvC
         0I4WCRX0oOxH9jch86Tf3ubEmYnn8Ogc5SVYD8hp0IBZ4AVOXnNZdjEXADL4uTErQS8Z
         hJIs38kB4wWnvCaRW2cNFiIa1GLWSUdlQNA2A7zJkUDRlVgcvEgckZ//dyLusfEbRDEK
         MzMiCFGieWDb974RyoZxZsC/zMu4JfHhA06g5iGNywzu+Ufqn5L3lgCBe5xaT9hWhtdI
         YRkdcexVpMd2wAN5ml3iEKn8lC9hd8ABjp9X4RKVsG6XT7ueMz6uJTsHF5iBikpCHu2j
         qiSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y7FIzF9vShJDyNSTAI9Bl+NsBsiiQpO5BNc3AiMxftk=;
        b=KXEegE4GUJRZz7MLWkFB8Sy+JbCFcnWeug9c6TRM0XO+rrOfubtN1j8OLS8asaPfLO
         tSktt3M5HRM2/weHT9BodpfrMzAKKBOcXJ3cTjw5Bd2Rs6t2vuRjiFsdu4DfnO6K82YC
         RrgCMpbv9JetIhtev+lxamjn8HSQkg0XGFfbGK+3I7che5Kt6E334GJ2lOGoKmUDhRHh
         z2lDo8XefbO8rOz00iPSfBaWFLBds+BBdugQBbBd7UUCMPrt+UrrtUI5kWWnsUoGoku2
         Rxc+rXnPaaYsaQSc7VblSjC2wzjZXqoE1y2OumR2nrjoQ2SrlQirPSxnzOFewW6z18a+
         8wng==
X-Gm-Message-State: AOAM531IVukKUZZQJy0yNG+SugLb4T44Eajjxhjdyg4DzFGdRx/jyt79
        pcPWpkYZOhmCG9w+eTs+c3cHDhrfvawCxBkQvx6P3w==
X-Google-Smtp-Source: ABdhPJx9d8KNFjQ1KjbzrfhhF8oZEjO5RdYVRlSeAkVF4UbZuvbD20l0AoemyJKpQ/mIycuE738SW9E4BfAPPRXeC1o=
X-Received: by 2002:a05:6870:3323:b0:de:282:34f0 with SMTP id
 x35-20020a056870332300b000de028234f0mr1941298oae.147.1648114699587; Thu, 24
 Mar 2022 02:38:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220323033255.2282930-1-bjorn.andersson@linaro.org>
In-Reply-To: <20220323033255.2282930-1-bjorn.andersson@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Thu, 24 Mar 2022 15:08:08 +0530
Message-ID: <CAH=2NtyChidtrBVBL=RNjPaYYmtTuN0N4fbMx4DRBD6hXxHguQ@mail.gmail.com>
Subject: Re: [PATCH] net: stmmac: dwmac-qcom-ethqos: Enable RGMII functional
 clock on resume
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable <stable@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

+Cc: stable tree as I think this is an important fix for stmmac
dwmac-qcom-ethernet driver and affects ethernet functionality on QCOM
boards which use this driver.

More below..

On Wed, 23 Mar 2022 at 09:01, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> When the Qualcomm ethqos driver is properly described in its associated
> GDSC power-domain, the hardware will be powered down and loose its state
> between qcom_ethqos_probe() and stmmac_init_dma_engine().
>
> The result of this is that the functional clock from the RGMII IO macro
> is no longer provides and the DMA software reset in dwmac4_dma_reset()
> will time out, due to lacking clock signal.
>
> Re-enable the functional clock, as part of the Qualcomm specific clock
> enablement sequence to avoid this problem.
>
> The final clock configuration will be adjusted by ethqos_fix_mac_speed()
> once the link is being brought up.
>
> Fixes: a7c30e62d4b8 ("net: stmmac: Add driver for Qualcomm ethqos")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 0cc28c79cc61..835caa15d55f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -487,6 +487,13 @@ static int ethqos_clks_config(void *priv, bool enabled)
>                         dev_err(&ethqos->pdev->dev, "rgmii_clk enable failed\n");
>                         return ret;
>                 }
> +
> +               /* Enable functional clock to prevent DMA reset to timeout due
> +                * to lacking PHY clock after the hardware block has been power
> +                * cycled. The actual configuration will be adjusted once
> +                * ethqos_fix_mac_speed() is invoked.
> +                */
> +               ethqos_set_func_clk_en(ethqos);
>         } else {
>                 clk_disable_unprepare(ethqos->rgmii_clk);
>         }
> --
> 2.33.1

Thanks for the catch, Bjorn. I tested this on the SA8155p-ADP board
and the eth interface can be moved from 'on' to 'off' state and
vice-versa properly after this change and we no longer need the EMAC
GDSC quirk, so:

Tested-and-Reviewed-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>

Regards.
