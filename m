Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA0A163B74E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Nov 2022 02:36:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235102AbiK2BgC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Nov 2022 20:36:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234915AbiK2BgB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Nov 2022 20:36:01 -0500
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B7F743840
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 17:36:00 -0800 (PST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-3704852322fso124614287b3.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 17:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2WljVq8KNtlyND7hwSOZLCyiVKARAfWgBIBuD1N1DxM=;
        b=ikhNrKX9h3XrA0yg7nsy2qv3ZOAz2W9rFhIgzt1Q/QFn7Gh/VCcXZ2r2B9mqFVe4HJ
         EFxXL022jxpMKGgLbNFDolILWvQ9nugsb12noykri0zK0zIrv26pEzIQh4Jsq4P0pIPo
         FuhsEgIEE88Y6RO5Rc5l/NtkgIFfPDOQE4GdkNLoks1AIJHhP+owC5hjkLXOKFsm5MmA
         g9dDLAa6zx3px4o7/OjVkkOLtjC/voVzIkFvfg+GFME6j1cEn5BvdEYMbym+hHw8Z2/B
         cSSTznBEosg83VXjn1tjO6+knFBUHibIqTD78BnsprIPXqLUlrDoJpivYc+kK/vcu3AP
         yMnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2WljVq8KNtlyND7hwSOZLCyiVKARAfWgBIBuD1N1DxM=;
        b=DO4f8qLD6CCxeFcGYVNcnjswPT2F637F/2+hWxmb2wSEttVmiJX97eRDDMr8YlaLgL
         qQu68uQtULdMrp8y4IgEc1EvzZZU82u6WBHO0OUHq577praXnDLbgqtDticKk4Ed55Zk
         8yks743UXaIRHMI/84ChdoLxIj+/wfMeYpmF5bvxcK0S0KbYpT7NNQ3AnRlIfTMcWYNj
         20zWDNrT1/y/3CL3Az+G2ZJdZMLlFYl6TJLX/sp71quOS/DLgBVRxft7UiN2GOSxwM15
         ETCmVjMiWI9fgAmNVkONqOMMji347NZB4krG6Wz9OVbQGqaMhMjjkhCVgbgRANddG6Xj
         UTRw==
X-Gm-Message-State: ANoB5pnTtW4Di/QFxDnpTPNU17AgUti0X+MB2fdoE9ZOEELzUedClnoa
        Qagd3pMD+nwxlX3GG8hpOqA93JNX584AqEyWMFAs0Q==
X-Google-Smtp-Source: AA0mqf7/RaaIHbDws1tixAGGbM9kOir+VmAr2Fd+Vwr50iUKdvvz9PHmu/YLVwjE99UJV6RwsLZYrTpos0r18E6z0F8=
X-Received: by 2002:a0d:d103:0:b0:370:4c23:eacc with SMTP id
 t3-20020a0dd103000000b003704c23eaccmr52461243ywd.127.1669685759351; Mon, 28
 Nov 2022 17:35:59 -0800 (PST)
MIME-Version: 1.0
References: <20221129000047.697089-1-elder@linaro.org>
In-Reply-To: <20221129000047.697089-1-elder@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 29 Nov 2022 03:35:48 +0200
Message-ID: <CAA8EJpqcQaamPn=6Z0GRKVDvFu8BGQ190EYJH34dApBcC3nzdA@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: rpmh: add support for SM6350 rpmh IPA clock
To:     Alex Elder <elder@linaro.org>
Cc:     sboyd@kernel.org, mturquette@baylibre.com, andersson@kernel.org,
        konrad.dybcio@linaro.org, agross@kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 29 Nov 2022 at 02:00, Alex Elder <elder@linaro.org> wrote:
>
> From: Luca Weiss <luca.weiss@fairphone.com>
>
> The IPA core clock is required for SM6350.  Define it.
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index 0471bab824642..6a5887aae21a4 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -603,6 +603,7 @@ static const struct clk_rpmh_desc clk_rpmh_sc7280 = {
>  DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk2, ln_bb_clk2_ao, "lnbclkg2", 4);
>  DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk3, ln_bb_clk3_ao, "lnbclkg3", 4);
>  DEFINE_CLK_RPMH_ARC(sm6350, qlink, qlink_ao, "qphy.lvl", 0x1, 4);
> +DEFINE_CLK_RPMH_BCM(sm6350, ipa, "IP0");
>
>  static struct clk_hw *sm6350_rpmh_clocks[] = {
>         [RPMH_CXO_CLK]          = &sc7280_bi_tcxo.hw,
> @@ -613,6 +614,7 @@ static struct clk_hw *sm6350_rpmh_clocks[] = {
>         [RPMH_LN_BB_CLK3_A]     = &sm6350_ln_bb_clk3_ao.hw,
>         [RPMH_QLINK_CLK]        = &sm6350_qlink.hw,
>         [RPMH_QLINK_CLK_A]      = &sm6350_qlink_ao.hw,
> +       [RPMH_IPA_CLK]          = &sm6350_ipa.hw,

This can use sdm845_ipa.hw instead of defining new clocks.

>  };
>
>  static const struct clk_rpmh_desc clk_rpmh_sm6350 = {
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
