Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B52C5538E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jun 2022 19:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353272AbiFUR3g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jun 2022 13:29:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353768AbiFUR3W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jun 2022 13:29:22 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EF5C175A5
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jun 2022 10:29:20 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id c144so10624615qkg.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jun 2022 10:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qgqrX/bjYQKajbQBs+HRKEwBVVyLFqaz5TXiJl2OIzs=;
        b=PwUi7qkhrcxXbogc7WAmbOFJ/f5vZOUqpCl3ZrLLmEAUwbihiTtZ/uJpu2+o1DrZgH
         4mfOr6Tiuqx9nVTzi4B+cixD/X1ZaRSPYZNGbjzn0Xw+5xBtfwgoK1BEeH1sh5Y2SgVm
         G1antyVMtrEMJitimUlwMjq/wxVf5iSkNIHWtuph45KSlJ1CBAZBEnS9QCimG9eF6sI5
         wC5yubAxn2e0UpZtMCQDf+2n/JabyeHcUtb4GBxey0Gh8FqiXBo1eG72Ldfp3qP9YhhN
         nwPPzAezD6dkxo+Bm+Eo1L5YQ8kZWLQvrZY8ViblkS6HyPhgv6PbTVs1Rs88wZpID0DW
         vOXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qgqrX/bjYQKajbQBs+HRKEwBVVyLFqaz5TXiJl2OIzs=;
        b=tN+Fq7L5hvDcrRwXkOIndwdGa7fPGfVTv0VDp0Jjpn5zEZCsPToch3aZr8RE1LzxFd
         Xr6VsTaExQJLR9mExNpGQQAWsqBpRGbtSAdPp0BT+w4THw5FYaS2+e0JRCsljJaGjPW6
         uYWWobFYWM5XtONwGBzP0m45/MxkPikpmJZ55QlW/iOlF0wR7YHXp0iTI0ck4yB95DJS
         ZYlCO9mq2Aug5ZvWJU9yl2dIHPqQPO2hcsTAQBVAsGjeZzbs5VG8SjKRz58LYeoUPI1L
         EqiHhtK4HPorMKGJ1YVDWtPu7Jm4CxvLDdMH5BF8SxVovBlUlV47DlOt5p8Yy8vB7KPT
         K+Lw==
X-Gm-Message-State: AJIora8Ovs2X39w34tY3icPcxHzr+B1Wy5PzLT/Pvz6tfJxLUxlUiEa0
        bx+g3M0/ypV85mzyP2yVCFgJsC5uDH77xH3Dc+8yzg==
X-Google-Smtp-Source: AGRyM1s4vuUr8aV7hp6dmp16vtyPxTAyTQaNFFWSjd/zY0+AdpHQ/h9f2Gv8heM9cpFZcBjx3ufxaF+qZrSxUiGg7Ys=
X-Received: by 2002:a05:620a:4156:b0:6a6:f8d2:6d9e with SMTP id
 k22-20020a05620a415600b006a6f8d26d9emr21208822qko.30.1655832559702; Tue, 21
 Jun 2022 10:29:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220621112330.448754-1-robimarko@gmail.com>
In-Reply-To: <20220621112330.448754-1-robimarko@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 21 Jun 2022 20:29:08 +0300
Message-ID: <CAA8EJpoPJKVteUdsxOVH5THH_vqwBrdSn=hkbW4oWmpw+Mjdmg@mail.gmail.com>
Subject: Re: [PATCH v2] PCI: qcom: fix IPQ8074 Gen2 support
To:     Robert Marko <robimarko@gmail.com>
Cc:     svarbanov@mm-sol.com, agross@kernel.org,
        bjorn.andersson@linaro.org, lpieralisi@kernel.org, robh@kernel.org,
        kw@linux.com, bhelgaas@google.com, p.zabel@pengutronix.de,
        jingoohan1@gmail.com, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        johan+linaro@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 21 Jun 2022 at 14:23, Robert Marko <robimarko@gmail.com> wrote:
>
> IPQ8074 has one Gen2 and one Gen3 port, currently the Gen2 port will
> cause the system to hang as its using DBI registers in the .init
> and those are only accesible after phy_power_on().
>
> So solve this by splitting the DBI read/writes to .post_init.
>
> Fixes: a0fd361db8e5 ("PCI: dwc: Move "dbi", "dbi2", and "addr_space" resource setup into common code")

Any elaboration for the Fixes tag? I think the follow one is more
logical, isn't it?

Fixes: 5d76117f070d ("PCI: qcom: Add support for IPQ8074 PCIe controller")

> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
> Changes in v2:
> * Rebase onto next-20220621
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 48 +++++++++++++++-----------
>  1 file changed, 28 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 51fed83484af..da6d79d61397 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -1061,9 +1061,7 @@ static int qcom_pcie_init_2_3_3(struct qcom_pcie *pcie)
>         struct qcom_pcie_resources_2_3_3 *res = &pcie->res.v2_3_3;
>         struct dw_pcie *pci = pcie->pci;
>         struct device *dev = pci->dev;
> -       u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
>         int i, ret;
> -       u32 val;
>
>         for (i = 0; i < ARRAY_SIZE(res->rst); i++) {
>                 ret = reset_control_assert(res->rst[i]);
> @@ -1120,6 +1118,33 @@ static int qcom_pcie_init_2_3_3(struct qcom_pcie *pcie)
>                 goto err_clk_aux;
>         }
>
> +       return 0;
> +
> +err_clk_aux:
> +       clk_disable_unprepare(res->ahb_clk);
> +err_clk_ahb:
> +       clk_disable_unprepare(res->axi_s_clk);
> +err_clk_axi_s:
> +       clk_disable_unprepare(res->axi_m_clk);
> +err_clk_axi_m:
> +       clk_disable_unprepare(res->iface);
> +err_clk_iface:
> +       /*
> +        * Not checking for failure, will anyway return
> +        * the original failure in 'ret'.
> +        */
> +       for (i = 0; i < ARRAY_SIZE(res->rst); i++)
> +               reset_control_assert(res->rst[i]);
> +
> +       return ret;
> +}
> +
> +static int qcom_pcie_post_init_2_3_3(struct qcom_pcie *pcie)
> +{
> +       struct dw_pcie *pci = pcie->pci;
> +       u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> +       u32 val;
> +
>         writel(SLV_ADDR_SPACE_SZ,
>                 pcie->parf + PCIE20_v3_PARF_SLV_ADDR_SPACE_SIZE);
>
> @@ -1147,24 +1172,6 @@ static int qcom_pcie_init_2_3_3(struct qcom_pcie *pcie)
>                 PCI_EXP_DEVCTL2);
>
>         return 0;
> -
> -err_clk_aux:
> -       clk_disable_unprepare(res->ahb_clk);
> -err_clk_ahb:
> -       clk_disable_unprepare(res->axi_s_clk);
> -err_clk_axi_s:
> -       clk_disable_unprepare(res->axi_m_clk);
> -err_clk_axi_m:
> -       clk_disable_unprepare(res->iface);
> -err_clk_iface:
> -       /*
> -        * Not checking for failure, will anyway return
> -        * the original failure in 'ret'.
> -        */
> -       for (i = 0; i < ARRAY_SIZE(res->rst); i++)
> -               reset_control_assert(res->rst[i]);
> -
> -       return ret;
>  }
>
>  static int qcom_pcie_get_resources_2_7_0(struct qcom_pcie *pcie)
> @@ -1598,6 +1605,7 @@ static const struct qcom_pcie_ops ops_2_4_0 = {
>  static const struct qcom_pcie_ops ops_2_3_3 = {
>         .get_resources = qcom_pcie_get_resources_2_3_3,
>         .init = qcom_pcie_init_2_3_3,
> +       .post_init = qcom_pcie_post_init_2_3_3,
>         .deinit = qcom_pcie_deinit_2_3_3,
>         .ltssm_enable = qcom_pcie_2_3_2_ltssm_enable,
>  };
> --
> 2.36.1
>


-- 
With best wishes
Dmitry
