Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50D1852C1E4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 May 2022 20:09:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241272AbiERSAA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 May 2022 14:00:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241251AbiERR77 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 May 2022 13:59:59 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 856C91AB79C
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 May 2022 10:59:58 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id l16so3595310oil.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 May 2022 10:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=HnlbhjTQlWUwiaBWH2fhZy2qtVSLr1TOupjaOq9l7S0=;
        b=BV2JRzFMHT26aktiMpfso2qpN/KnG7cSTVfOfODihsAMWSLI2ThPXQyZBheytuyw82
         1B22PZukuWbMtm+uXCJkP38+VrQzowAuDLmXxlCnh83UMDsx6dGfCIbaP/yUQ7TMJbHq
         3i8SoMgBwVbq1Fa1H6SgU5a7S10W1Y8bfQlXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=HnlbhjTQlWUwiaBWH2fhZy2qtVSLr1TOupjaOq9l7S0=;
        b=5WVmjb3Y+OiArWFSGgYDJG72PcpgbTvDejwsR/ZaJtOOlHKOv8OV0MfAtIeIu2KGY3
         T9JXdQ/p2B73oaMArQgY0s55piCI1c3JSDtaWkOkEBTLUYwjYKUcpJDWRexj5cvO91LO
         C27FilkEsk9CK/YTtwgnZlTeaoqVcg6P6s+GZFiCh73zijk4ugxRoigAQwzJTwjBkb6z
         9/2VpUpoJaNMk4wpTb6b3cyTLn8PyXCgInAczep2aQ7gkrKIDPghJ1YC0DXGVtHFduNx
         DeF/bySm/xKsO/oY0WCr/5hzj4pIEOW+vV1t1ZyynXidBC4YNhrsTVIEDSaNbFsp9aC4
         O5ZQ==
X-Gm-Message-State: AOAM531guYkwAOy2FLbCMsAVHys0rXrp6YaNzMLF1fs2uhD350owJN1I
        9wKBy+EhYwbsDyWIx3HKhrKtIjOCA7ZFt5UyFQ1Xzw==
X-Google-Smtp-Source: ABdhPJyimNy9Vc3apdHN1CK9ruWmftlW8J6xrak22ZUuJNUZnal89f3ywnmcoQuOGGWv0+Z3jauvZsdwdx+soYzMsxA=
X-Received: by 2002:a05:6808:23c3:b0:326:bd8d:7993 with SMTP id
 bq3-20020a05680823c300b00326bd8d7993mr491686oib.63.1652896797845; Wed, 18 May
 2022 10:59:57 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 18 May 2022 10:59:56 -0700
MIME-Version: 1.0
In-Reply-To: <20220513175339.2981959-4-dmitry.baryshkov@linaro.org>
References: <20220513175339.2981959-1-dmitry.baryshkov@linaro.org> <20220513175339.2981959-4-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 18 May 2022 10:59:56 -0700
Message-ID: <CAE-0n53wjtJpUeMswrkQq1mAQEEfXiUhuvq4W4t=7gMpkbsiNQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] clk: qcom: gcc-sm8450: use new clk_regmap_pipe_src_ops
 for PCIe pipe clocks
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>
Cc:     Prasad Malisetty <quic_pmaliset@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-05-13 10:53:37)
> diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
> index 593a195467ff..a140a89b73b4 100644
> --- a/drivers/clk/qcom/gcc-sm8450.c
> +++ b/drivers/clk/qcom/gcc-sm8450.c
> @@ -239,17 +218,21 @@ static const struct clk_parent_data gcc_parent_data_11[] = {
>         { .fw_name = "bi_tcxo" },
>  };
>
> -static struct clk_regmap_mux gcc_pcie_0_pipe_clk_src = {
> +static struct clk_regmap_phy_mux gcc_pcie_0_pipe_clk_src = {
>         .reg = 0x7b060,
>         .shift = 0,
>         .width = 2,
> -       .parent_map = gcc_parent_map_4,
> +       .phy_src_val = 0, /* pipe_clk */

Make a define? PCIE0_PIPE_CLK_SRC_VAL and drop the comment?

> +       .ref_src_val = 2, /* bi_tcxo */
>         .clkr = {
>                 .hw.init = &(struct clk_init_data){
>                         .name = "gcc_pcie_0_pipe_clk_src",
> -                       .parent_data = gcc_parent_data_4,
> -                       .num_parents = ARRAY_SIZE(gcc_parent_data_4),
> -                       .ops = &clk_regmap_mux_closest_ops,
> +                       .parent_data = &(const struct clk_parent_data){
> +                               .fw_name = "pcie_0_pipe_clk",
> +                       },
> +                       .num_parents = 1,
> +                       .flags = CLK_SET_RATE_PARENT,
> +                       .ops = &clk_regmap_phy_mux_ops,
>                 },
>         },
>  };
