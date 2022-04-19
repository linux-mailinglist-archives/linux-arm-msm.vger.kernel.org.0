Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B99350770E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Apr 2022 20:07:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356189AbiDSSJ0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Apr 2022 14:09:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347040AbiDSSJZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Apr 2022 14:09:25 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F2CC3CA48
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 11:06:39 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-2eafabbc80aso181107047b3.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 11:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LEwAzLgdo/J0IOG1epW97Y3lbB4M4tnpZ0RnWfy4qe8=;
        b=aU24999xmL9jwFsyEgwMlT40a4Hj8UX0RRYOB9wmdIGrDMThR0Y/Aj4y1r99YzgJto
         69ELrvTHJNUj5OSp5epUXdfPXgXSrW+ZoHZ/+jR3GV4EJSRsM+3obSlQisxNQPljSLxn
         pmmNQzu+pt2ZoMWkRSNsQWGDnLsUcdat4L2Ols9OAWccvA/70g5n7T5dvkgu50R2aTwd
         MR3CuqjK0NFffdchRl77AvWn7KAw16rtSj/AMKPMUVXGJCtxIHDf5r0PL7uzqHa6xviB
         mumlA1Q+QmKRJnV1YVwaYKm5JEy1BVPzjEG5bY9qo+IodXgTjLE1j2pUNJo7fHnt4Ld1
         q48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LEwAzLgdo/J0IOG1epW97Y3lbB4M4tnpZ0RnWfy4qe8=;
        b=hBSub7H6iUiu1I1HQqpYNW6IsSuPwc2GmMLeRD/8/QtvTwpzZAFV+5XjVqpQFfcA4N
         l5rZGVY3VdjoswgUaVW2sgJzHAPM76ofObRULf4K542MQzLVMCvlfhXQaPfp7spHS2hk
         s9yAT6OTuAOh7leKXiz4Ow4TAIfQN+svpN5nFiVpKQsynHVrhJ7HMLfdlwkC/Z+qk7nG
         kVF1i2JFyQ+X++lsSapy+tH19UPpGKdMoeXvqJzp+9Vq377Xolz82gGfqjCwz9CaE2lo
         xTl0HgdcEUoehn5SyaEQKdyvHDmsoLfhld88MwupqFq/40EZu/9uaK+NSOvSB6J2joPx
         jelQ==
X-Gm-Message-State: AOAM5300pO3fTsgsRTD9iYbSm1xobzgV14Q6tR5s3W+t77Co++NhYV+0
        M/8u9QMiSOuzVV42BWCT1lVRQdrHf29gaEKQ0bINnA==
X-Google-Smtp-Source: ABdhPJy2MwoJhfJr2k71xTKAb1/QHb+m9Vt2pB0jt5uPZYsnwfUxO7eQefOdpcrbNS8yXY51GGPpHmeHyGx+tCM29cE=
X-Received: by 2002:a81:324e:0:b0:2f1:d8f4:40df with SMTP id
 y75-20020a81324e000000b002f1d8f440dfmr2846060ywy.289.1650391598774; Tue, 19
 Apr 2022 11:06:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220331013415.592748-1-bjorn.andersson@linaro.org>
In-Reply-To: <20220331013415.592748-1-bjorn.andersson@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 19 Apr 2022 21:06:27 +0300
Message-ID: <CAA8EJpr9TvWHY8uMXzdmQbf8ynbkEJLKq0b4iEpp2Ji5nBXYzQ@mail.gmail.com>
Subject: Re: [PATCH] PCI: qcom: Remove ddrss_sf_tbu clock from sc8180x
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stanimir Varbanov <svarbanov@mm-sol.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Rob Herring <robh@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 31 Mar 2022 at 04:31, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> The Qualcomm SC8180X platform was piggy backing on the SM8250
> qcom_pcie_cfg, but the platform doesn't have the ddrss_sf_tbu clock, so
> it now fails to probe due to the missing clock.
>
> Give SC8180X its own qcom_pcie_cfg, without the ddrss_sf_tbu flag set.
>
> Fixes: 0614f98bbb9f ("PCI: qcom: Add ddrss_sf_tbu flag")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 6ab90891801d..816028c0f6ed 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -1550,6 +1550,11 @@ static const struct qcom_pcie_cfg sc7280_cfg = {
>         .pipe_clk_need_muxing = true,
>  };
>
> +static const struct qcom_pcie_cfg sc8180x_cfg = {
> +       .ops = &ops_1_9_0,
> +       .has_tbu_clk = true,
> +};
> +
>  static const struct dw_pcie_ops dw_pcie_ops = {
>         .link_up = qcom_pcie_link_up,
>         .start_link = qcom_pcie_start_link,
> @@ -1656,7 +1661,7 @@ static const struct of_device_id qcom_pcie_match[] = {
>         { .compatible = "qcom,pcie-qcs404", .data = &ipq4019_cfg },
>         { .compatible = "qcom,pcie-sdm845", .data = &sdm845_cfg },
>         { .compatible = "qcom,pcie-sm8250", .data = &sm8250_cfg },
> -       { .compatible = "qcom,pcie-sc8180x", .data = &sm8250_cfg },
> +       { .compatible = "qcom,pcie-sc8180x", .data = &sc8180x_cfg },
>         { .compatible = "qcom,pcie-sm8450-pcie0", .data = &sm8450_pcie0_cfg },
>         { .compatible = "qcom,pcie-sm8450-pcie1", .data = &sm8450_pcie1_cfg },
>         { .compatible = "qcom,pcie-sc7280", .data = &sc7280_cfg },
> --
> 2.35.1
>


-- 
With best wishes
Dmitry
