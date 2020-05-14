Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62FBB1D2831
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 08:53:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725967AbgENGxQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 02:53:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725909AbgENGxN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 02:53:13 -0400
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com [IPv6:2607:f8b0:4864:20::a42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3F73C061A0C
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2020 23:53:13 -0700 (PDT)
Received: by mail-vk1-xa42.google.com with SMTP id j28so496811vkn.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2020 23:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=verdurent-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AD73/gyPw537Xp1vDJOYvLHr7JMtBDUrFsijP0WuRks=;
        b=RdSLSskx2Wvw3alRl86UnDw5dnN1+ZHo+jEuOiDqNYvb3EfRrfuQ1fjHd8pEofVcmx
         OSOsg5Ki+jgXdahzTq8BYmydYLkEp/D/1CWEiD9WIoLB/oyMT0/XdOe73UgI9Xo/PX8Z
         vAsKTrb1XOhLWFCweUDfv5clUyY9/Ct0OqoS4jylDHfwnX2dZaBf96hPr9UjJyc9qJ54
         LfhUMigof8LCnYdiDSe3krEkaZ0cdi5WNh7X76KkQjTeQbosgpRBGY0UM/FYTbyUC8gZ
         fAmJrAfp1zGCiCU5/M/YWEfBTBFrgSdaXqABtBbjTfwTGLLBBjxmcCGYThD0EubKLklL
         Y/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AD73/gyPw537Xp1vDJOYvLHr7JMtBDUrFsijP0WuRks=;
        b=cfa7tWJAd1dc6tbrf7oeeK/PpE1sIinb9s8fkhen3ocrcvMNPxFN5oJQj6A3VP5AdU
         VnaTvsi8mPnRNz9pcQcAkP3WseNLTsQcQgJlqGBI3QBDK1c+Wy051dG/vRMb9xfc8Vu5
         mglK3Z5utGmKS2mxkyWWzcKlWPfP4WFhGlg/AtvAoCqXTU2bI0c0PvD/rg3j3+LnCjRK
         GoRQajpx0xFVPjG6wiaOFBO3fUjEUgH6q3UQDawZsniDaBljQPBxm4hKBWo+luC1OtxJ
         g5fwK5VCh5lWKb86jufMqT/y+1y7TlWHmJ/w05bDLLwqhyIMh3PtDjhXMp/mmffuzuvr
         27FQ==
X-Gm-Message-State: AOAM533uF7iU1yV6nfPa5p/VeqPBlRPwORkMXGV4rjJ0V9Yj22HzK2D3
        d0InGHP0m8hTHVJrNH2TqpojlNnk1qlVQig6jzsElw==
X-Google-Smtp-Source: ABdhPJwqOdHWX9G/Vc1PEWvZMXQ69dsTzV+tAJwC+UvjMCX5pJg7UnTD2qxWptjx7wEK5anGtRzdU/mrdZoXOnfLCtw=
X-Received: by 2002:a1f:a786:: with SMTP id q128mr2448341vke.86.1589439192297;
 Wed, 13 May 2020 23:53:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200514062836.190194-1-vkoul@kernel.org>
In-Reply-To: <20200514062836.190194-1-vkoul@kernel.org>
From:   Amit Kucheria <amit.kucheria@verdurent.com>
Date:   Thu, 14 May 2020 12:22:33 +0530
Message-ID: <CAHLCerN_pxkqJojJLL5ztbYCeFZ9Mco6oM-=0mdmh5iSydxrUg@mail.gmail.com>
Subject: Re: [PATCH] net: stmmac: fix num_por initialization
To:     Vinod Koul <vkoul@kernel.org>
Cc:     "David S. Miller" <davem@davemloft.net>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        lakml <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Rahul Ankushrao Kawadgave <rahulak@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 14, 2020 at 11:59 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> Driver missed initializing num_por which is por values that driver

Nit: s/is/is one of the/ ?

> configures to hardware. In order to get this values, add a new structure

Nit: s/this/these

> ethqos_emac_driver_data which holds por and num_por values and populate
> that in driver probe.
>
> Fixes: a7c30e62d4b8 ("net: stmmac: Add driver for Qualcomm ethqos")
> Reported-by: Rahul Ankushrao Kawadgave <rahulak@qti.qualcomm.com>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Otherwise,

Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>

> ---
>  .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index e0a5fe83d8e0..bfc4a92f1d92 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -75,6 +75,11 @@ struct ethqos_emac_por {
>         unsigned int value;
>  };
>
> +struct ethqos_emac_driver_data {
> +       const struct ethqos_emac_por *por;
> +       unsigned int num_por;
> +};
> +
>  struct qcom_ethqos {
>         struct platform_device *pdev;
>         void __iomem *rgmii_base;
> @@ -171,6 +176,11 @@ static const struct ethqos_emac_por emac_v2_3_0_por[] = {
>         { .offset = RGMII_IO_MACRO_CONFIG2,     .value = 0x00002060 },
>  };
>
> +static const struct ethqos_emac_driver_data emac_v2_3_0_data = {
> +       .por = emac_v2_3_0_por,
> +       .num_por = ARRAY_SIZE(emac_v2_3_0_por),
> +};
> +
>  static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
>  {
>         unsigned int val;
> @@ -442,6 +452,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>         struct device_node *np = pdev->dev.of_node;
>         struct plat_stmmacenet_data *plat_dat;
>         struct stmmac_resources stmmac_res;
> +       const struct ethqos_emac_driver_data *data;
>         struct qcom_ethqos *ethqos;
>         struct resource *res;
>         int ret;
> @@ -471,7 +482,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>                 goto err_mem;
>         }
>
> -       ethqos->por = of_device_get_match_data(&pdev->dev);
> +       data = of_device_get_match_data(&pdev->dev);
> +       ethqos->por = data->por;
> +       ethqos->num_por = data->num_por;
>
>         ethqos->rgmii_clk = devm_clk_get(&pdev->dev, "rgmii");
>         if (IS_ERR(ethqos->rgmii_clk)) {
> @@ -526,7 +539,7 @@ static int qcom_ethqos_remove(struct platform_device *pdev)
>  }
>
>  static const struct of_device_id qcom_ethqos_match[] = {
> -       { .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_por},
> +       { .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
>         { }
>  };
>  MODULE_DEVICE_TABLE(of, qcom_ethqos_match);
> --
> 2.25.4
>
