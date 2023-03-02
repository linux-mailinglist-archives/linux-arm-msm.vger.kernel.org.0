Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8149D6A864F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Mar 2023 17:25:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbjCBQZL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Mar 2023 11:25:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229840AbjCBQZK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Mar 2023 11:25:10 -0500
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BA4F474F5
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Mar 2023 08:25:03 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-536af432ee5so438432107b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Mar 2023 08:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=95kXsbImCUylIF+16am1BkTDL53tv2I3oCaAH9/VSv0=;
        b=WIJB2kkSBt9817cj+lD5I32y72NkCXnMm64mwTgeKnk5eA8yYJSkSQTRYoiYj/SDNa
         v1ECclvAZl7rnMO9QjQe41D5kQrIVZovTL8+JRr91bhXlKB0z62X2sBMjpSEaNt1uIHf
         DtXDHK4y1ZpTubWLo56aThQlOsJWGc27CZH7WU1YGE86MK1xTFFyVKLlA5r9TY4gpIep
         AZKJFPPRgivgMXmobwhK/r882rDeM9CJPM8xVPnJU+5OoNDJhoECkjVD4cbux2PGFbR/
         zHDcY5P/j8rSc04he/C9aw9/mtEE4/SR+Vkszm2Oz4cD3b7IjtUDZGdkft07qJj6jmOv
         NchA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=95kXsbImCUylIF+16am1BkTDL53tv2I3oCaAH9/VSv0=;
        b=MQmE3H1czi6aTJ0P5flrlh9Zxrzi8Tvetd+NIY9cPIeI3txAG3ftQcNpy329KY31aK
         yR6fDOfIn1c34FUHWLcT7/vPH9tVszUWcJQUp1XuA1z1NzoKTs4uQvelJ0L3dS1Onb1W
         UZhXfF24bPu0rQKec6qmkfzEiqrIaTomyt5aMYdHde8QzEM8JcI8nIWtp9wzS3BfijFg
         KtFAgpjjquF9+CpGGcuhx3rLir8S3n+jX6MaIztfiBzgb0Zdx8vmYdy+W4n9i3yNxu/i
         FGsmvLxYCn1gWI6S6gko3BvEzQX4ymcxTUz0OtJnVuzLUigSnJx8QP/I2/cw1kLYHk4K
         m/Rg==
X-Gm-Message-State: AO0yUKVhNyY71xhFWr087E4/hktITlS7vhSE/ceT+R9AD45pZSN/Hd6U
        nO+3Gqm8gTRci+WmB4ZO7OzFajP+yN2j3OY6TNTMgw==
X-Google-Smtp-Source: AK7set99MlhrauH4ycn0PekzbRiYnxYmAgoI/3h5gI5swCDKuKmUDV1yidAWw/EI1UWpMlC1kcQ7+HxbX5RyTOA5UZk=
X-Received: by 2002:a81:ae56:0:b0:52a:9eac:92b with SMTP id
 g22-20020a81ae56000000b0052a9eac092bmr1692059ywk.4.1677774302442; Thu, 02 Mar
 2023 08:25:02 -0800 (PST)
MIME-Version: 1.0
References: <cover.1677749625.git.quic_varada@quicinc.com> <07ea204c6488e7e78956bca09f59bf9c49353780.1677749625.git.quic_varada@quicinc.com>
In-Reply-To: <07ea204c6488e7e78956bca09f59bf9c49353780.1677749625.git.quic_varada@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 2 Mar 2023 18:24:46 +0200
Message-ID: <CAA8EJpoyKB3AqvA6R06L9K_dYc97+JK3SwY5TKR1FiC30w8=Yw@mail.gmail.com>
Subject: Re: [PATCH 4/8] clk: qcom: gcc-ipq9574: Add USB related clocks
To:     Varadarajan Narayanan <quic_varada@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
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

On Thu, 2 Mar 2023 at 11:56, Varadarajan Narayanan
<quic_varada@quicinc.com> wrote:
>
> Add the clocks needed for enabling USB in IPQ9574
>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  drivers/clk/qcom/gcc-ipq9574.c               | 35 ++++++++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,ipq9574-gcc.h |  2 ++
>  2 files changed, 37 insertions(+)
>
> diff --git a/drivers/clk/qcom/gcc-ipq9574.c b/drivers/clk/qcom/gcc-ipq9574.c
> index 1bf33d5..85cc6a5 100644
> --- a/drivers/clk/qcom/gcc-ipq9574.c
> +++ b/drivers/clk/qcom/gcc-ipq9574.c
> @@ -2041,6 +2041,39 @@ static struct clk_regmap_mux usb0_pipe_clk_src = {
>         },
>  };
>
> +static struct clk_branch gcc_usb0_pipe_clk = {
> +       .halt_reg = 0x2c054,
> +       .halt_check = BRANCH_HALT_DELAY,
> +       .clkr = {
> +               .enable_reg = 0x2c054,
> +               .enable_mask = BIT(0),
> +               .hw.init = &(struct clk_init_data){
> +                       .name = "gcc_usb0_pipe_clk",
> +                       .parent_hws = (const struct clk_hw *[]){
> +                               &usb0_pipe_clk_src.clkr.hw },

Please move the closing bracket to the next line.

> +                       .num_parents = 1,
> +                       .flags = CLK_SET_RATE_PARENT,
> +                       .ops = &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch gcc_usb0_sleep_clk = {
> +       .halt_reg = 0x2c058,
> +       .clkr = {
> +               .enable_reg = 0x2c058,
> +               .enable_mask = BIT(0),
> +               .hw.init = &(struct clk_init_data){
> +                       .name = "gcc_usb0_sleep_clk",
> +                       .parent_hws = (const struct clk_hw *[]){
> +                               &gcc_sleep_clk_src.clkr.hw },
> +                       .num_parents = 1,
> +                       .flags = CLK_SET_RATE_PARENT,
> +                       .ops = &clk_branch2_ops,
> +               },
> +       },
> +};
> +
>  static const struct freq_tbl ftbl_sdcc_apps_clk_src[] = {
>         F(144000, P_XO, 16, 12, 125),
>         F(400000, P_XO, 12, 1, 5),
> @@ -4008,6 +4041,8 @@ static struct clk_regmap *gcc_ipq9574_clks[] = {
>         [GCC_USB0_MOCK_UTMI_CLK] = &gcc_usb0_mock_utmi_clk.clkr,
>         [USB0_PIPE_CLK_SRC] = &usb0_pipe_clk_src.clkr,
>         [GCC_USB0_PHY_CFG_AHB_CLK] = &gcc_usb0_phy_cfg_ahb_clk.clkr,
> +       [GCC_USB0_PIPE_CLK] = &gcc_usb0_pipe_clk.clkr,
> +       [GCC_USB0_SLEEP_CLK] = &gcc_usb0_sleep_clk.clkr,
>         [SDCC1_APPS_CLK_SRC] = &sdcc1_apps_clk_src.clkr,
>         [GCC_SDCC1_APPS_CLK] = &gcc_sdcc1_apps_clk.clkr,
>         [SDCC1_ICE_CORE_CLK_SRC] = &sdcc1_ice_core_clk_src.clkr,
> diff --git a/include/dt-bindings/clock/qcom,ipq9574-gcc.h b/include/dt-bindings/clock/qcom,ipq9574-gcc.h
> index c89e96d..96b7c0b 100644
> --- a/include/dt-bindings/clock/qcom,ipq9574-gcc.h
> +++ b/include/dt-bindings/clock/qcom,ipq9574-gcc.h
> @@ -214,4 +214,6 @@
>  #define GCC_SNOC_PCIE1_1LANE_S_CLK                     205
>  #define GCC_SNOC_PCIE2_2LANE_S_CLK                     206
>  #define GCC_SNOC_PCIE3_2LANE_S_CLK                     207
> +#define GCC_USB0_PIPE_CLK                              208
> +#define GCC_USB0_SLEEP_CLK                             209
>  #endif
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
