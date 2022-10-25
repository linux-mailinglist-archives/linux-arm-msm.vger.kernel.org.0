Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D93F60C3CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Oct 2022 08:26:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbiJYG0V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Oct 2022 02:26:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230187AbiJYG0T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Oct 2022 02:26:19 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ABC3205FA
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 23:26:18 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id 185so2914649ybc.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 23:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ocpruf24vL4bNE7I7YzmUI7glf2/H+CMwlfPd1A8Jk8=;
        b=SvtD0VLRwuYySLdKgVUZcyMtWnmZ3eReDNY5DZvSjtreOjIzEdzCMa9WZu3Pc3gMEU
         fWb3Rig59DAlAx6aawpm6+lBg5hzjJHUEioGc2PZ/MW+WEYU8zJBgFdxJeDPQnJ7Ldb6
         XuD5JxfEcEztjCFIZOxPDgmqhkZDJlAY1085lOKtd1oJ+PSaZPifHovCu3wme/QAuX3v
         jLCEi+jy1vlYJwKq/b4/N7RcTdxM/GI3xRGzh8pMqm3zGY3wpalNuAqT4IjnT950+7qf
         X+ZkxmiO8yVPK8lswFu+7GrC4X8dzLNP23dLeklYea+u8FeEyoo8E5BeYnCrphx4HDrp
         7jCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ocpruf24vL4bNE7I7YzmUI7glf2/H+CMwlfPd1A8Jk8=;
        b=udEm1UhMm78vVBRwSt84saIySZ7lkxKzPYmIk9BetL0JHG2TgMh+WYHkd/DYBO1SWe
         h5cNf88kjyEhm0rFd9km62HD43uopayDqkUQAmLbIWmT+n6SqLqWMLVTK/Hc3VmBBrno
         rZlasW6Z9zcIcP2XFIacwG1Iwrtw9qAMtuWOPxM16BNvyprIrAvEby/zuMLiL8g5ShxK
         njmxGvxCqkML6zzAsKQcNREBojing3CiNM0FcHd/n6Qff61c/i1xwi1PSibcxt7bMe+6
         dhkmBlXhQostpnruOCqjJtB9QZlG6rgm2qjt6FXYJAZT70Z6rC16miDNZqrcpmd7AsOA
         fNiA==
X-Gm-Message-State: ACrzQf14NLd7waHv8bF5Mo96Vg+qyhd7dGVQBQJZr0hcS+9Xme8RpmkA
        HT4NZoqFY8Za8vYUFP7wSbs2qNBrlnGRFVcpuQzO6g==
X-Google-Smtp-Source: AMsMyM491oqeuOyAlg1zGpPqR9KuHYJbO3NM8jmnIsTGacJbEQjh3TDXxmyPs7wFH/Rde21pT3YP+LzvhEkGc78FdIo=
X-Received: by 2002:a05:6902:724:b0:6c0:1784:b6c7 with SMTP id
 l4-20020a056902072400b006c01784b6c7mr32005716ybt.15.1666679157694; Mon, 24
 Oct 2022 23:25:57 -0700 (PDT)
MIME-Version: 1.0
References: <20221025050608.2635173-1-quic_fenglinw@quicinc.com> <20221025050608.2635173-3-quic_fenglinw@quicinc.com>
In-Reply-To: <20221025050608.2635173-3-quic_fenglinw@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 25 Oct 2022 09:25:46 +0300
Message-ID: <CAA8EJprkQ-T9WHtorxAKU--a_3LFBM+6iBKaL5D3xatUnWwK9g@mail.gmail.com>
Subject: Re: [RESEND PATCH v1 2/2] spmi: pmic-arb: make interrupt support optional
To:     Fenglin Wu <quic_fenglinw@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        sboyd@kernel.org, quic_collinsd@quicinc.com,
        quic_subbaram@quicinc.com, David Collins <collinsd@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 25 Oct 2022 at 08:24, Fenglin Wu <quic_fenglinw@quicinc.com> wrote:
>
> From: David Collins <collinsd@codeaurora.org>
>
> Make the support of PMIC peripheral interrupts optional for
> spmi-pmic-arb devices.  This is useful in situations where
> SPMI address mapping is required without the need for IRQ
> support.

When or why would this be needed? Please provide a description of the usecase.

>
> Signed-off-by: David Collins <collinsd@codeaurora.org>
> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
> ---
>  drivers/spmi/spmi-pmic-arb.c | 45 ++++++++++++++++++++++--------------
>  1 file changed, 28 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
> index 1e7f5a9ff4bc..c14cffd8a313 100644
> --- a/drivers/spmi/spmi-pmic-arb.c
> +++ b/drivers/spmi/spmi-pmic-arb.c
> @@ -1490,10 +1490,12 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
>                 goto err_put_ctrl;
>         }
>
> -       pmic_arb->irq = platform_get_irq_byname(pdev, "periph_irq");
> -       if (pmic_arb->irq < 0) {
> -               err = pmic_arb->irq;
> -               goto err_put_ctrl;
> +       if (of_find_property(pdev->dev.of_node, "interrupt-controller", NULL)) {

Ugh. Please use platform_get_irq_byname_optional() instead. It returs
-ENXIO if the irq is not present.

> +               pmic_arb->irq = platform_get_irq_byname(pdev, "periph_irq");
> +               if (pmic_arb->irq < 0) {
> +                       err = pmic_arb->irq;
> +                       goto err_put_ctrl;
> +               }
>         }
>
>         err = of_property_read_u32(pdev->dev.of_node, "qcom,channel", &channel);
> @@ -1553,17 +1555,22 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
>                 }
>         }
>
> -       dev_dbg(&pdev->dev, "adding irq domain\n");
> -       pmic_arb->domain = irq_domain_add_tree(pdev->dev.of_node,
> -                                        &pmic_arb_irq_domain_ops, pmic_arb);
> -       if (!pmic_arb->domain) {
> -               dev_err(&pdev->dev, "unable to create irq_domain\n");
> -               err = -ENOMEM;
> -               goto err_put_ctrl;
> +       if (pmic_arb->irq > 0) {
> +               dev_dbg(&pdev->dev, "adding irq domain\n");
> +               pmic_arb->domain = irq_domain_add_tree(pdev->dev.of_node,
> +                                           &pmic_arb_irq_domain_ops, pmic_arb);
> +               if (!pmic_arb->domain) {
> +                       dev_err(&pdev->dev, "unable to create irq_domain\n");
> +                       err = -ENOMEM;
> +                       goto err_put_ctrl;
> +               }
> +
> +               irq_set_chained_handler_and_data(pmic_arb->irq,
> +                                               pmic_arb_chained_irq, pmic_arb);
> +       } else {
> +               dev_dbg(&pdev->dev, "not supporting PMIC interrupts\n");
>         }
>
> -       irq_set_chained_handler_and_data(pmic_arb->irq, pmic_arb_chained_irq,
> -                                       pmic_arb);
>         err = spmi_controller_add(ctrl);
>         if (err)
>                 goto err_domain_remove;
> @@ -1571,8 +1578,10 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
>         return 0;
>
>  err_domain_remove:
> -       irq_set_chained_handler_and_data(pmic_arb->irq, NULL, NULL);
> -       irq_domain_remove(pmic_arb->domain);
> +       if (pmic_arb->irq > 0) {
> +               irq_set_chained_handler_and_data(pmic_arb->irq, NULL, NULL);
> +               irq_domain_remove(pmic_arb->domain);
> +       }
>  err_put_ctrl:
>         spmi_controller_put(ctrl);
>         return err;
> @@ -1583,8 +1592,10 @@ static int spmi_pmic_arb_remove(struct platform_device *pdev)
>         struct spmi_controller *ctrl = platform_get_drvdata(pdev);
>         struct spmi_pmic_arb *pmic_arb = spmi_controller_get_drvdata(ctrl);
>         spmi_controller_remove(ctrl);
> -       irq_set_chained_handler_and_data(pmic_arb->irq, NULL, NULL);
> -       irq_domain_remove(pmic_arb->domain);
> +       if (pmic_arb->irq > 0) {
> +               irq_set_chained_handler_and_data(pmic_arb->irq, NULL, NULL);
> +               irq_domain_remove(pmic_arb->domain);
> +       }
>         spmi_controller_put(ctrl);
>         return 0;
>  }
> --
> 2.25.1
>


-- 
With best wishes
Dmitry
