Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DDEF4AE370
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Feb 2022 23:23:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387311AbiBHWWl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Feb 2022 17:22:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386678AbiBHVIV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Feb 2022 16:08:21 -0500
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3572C0612BC
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Feb 2022 13:08:20 -0800 (PST)
Received: by mail-oo1-xc2d.google.com with SMTP id q145-20020a4a3397000000b002e85c7234b1so124632ooq.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Feb 2022 13:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=3e5u0a3XUZipDiH81TDu2p1mqGvTz/Xj7xCNvUYnc48=;
        b=JrdRVJpooTykk1B8KBt18t1IQyUEgTydyV9eupm+jAPxd9SncOnypFGZTtPEngmpZA
         zPF85y6VwXAERScIsGuZxlS3yhf9h4gFYzrWgEW7zFpdpj3qzaZYMFf63Mqlca0KGWbn
         b0H2Hw8AIS3EyZyzwJl5gKblzlgFdsB2NPFlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=3e5u0a3XUZipDiH81TDu2p1mqGvTz/Xj7xCNvUYnc48=;
        b=Hb5v2C/DGHDeJsLA7ojOuJ4jspUaGBI+VBn+7OZ0kibkYu2YNSdutgfRlggqGz+5v9
         E39tbl8q2aTNWyVNI8BnsfxNvZz20QOBMBLRbcmhgIvKHtvqv0H2ZfDjpz9tLjGKnuXd
         lhHWalYU6ojNOLeTcSomFNdtSIEUYgFucRAY5XMpMjJRkC6GK7WevZ+VwxCuH8dxfb2k
         rJq+/QgCA+Hms+BkttDt2EISMrHBRTwNxRvPBlNBxJ7LY2eQTdT9LvC9hL6QwDVSv0mJ
         5Yq+fxXQIzXwFJZv/wDU9J0K5gAEMpEmJmWr9b+sLol0nmkiJf+Wb/j0LX6ECKsCYtu6
         s7ZA==
X-Gm-Message-State: AOAM532Tq9L7FOaLP8kgZlxlia6B8zyEEKQODrcxW4u2S8BHppQ4E3j/
        rnITIEsUYIsTRafL1s+nvuzD1pSUqge/JxN6vAicfQ==
X-Google-Smtp-Source: ABdhPJw5+EvIpVVqz2BaX3AzUdYsZgeCqlaaiTe1hKK5HeI7XFgoTdWGJ4fEXjeS9rfkpxFZJsz75fONZG/PTg/psTU=
X-Received: by 2002:a05:6870:1209:: with SMTP id 9mr982427oan.8.1644354499907;
 Tue, 08 Feb 2022 13:08:19 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Feb 2022 13:08:19 -0800
MIME-Version: 1.0
In-Reply-To: <1644334454-16719-2-git-send-email-quic_srivasam@quicinc.com>
References: <1644334454-16719-1-git-send-email-quic_srivasam@quicinc.com> <1644334454-16719-2-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 8 Feb 2022 13:08:19 -0800
Message-ID: <CAE-0n50PAtGfvHXjNrvQYe6edNEfJvEc1uYZFUeW2KHxn6fsBA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sc7280: Add pinmux for I2S
 speaker and Headset
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, dianders@chromium.org,
        judyhsiao@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org
Cc:     Venkata Prasad Potturu <quic_potturu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2022-02-08 07:34:12)
> Add AMP enable node and pinmux for primary and secondary I2S
> for SC7280 based platforms.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 40 ++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi     | 40 ++++++++++++++++++++++++++++++++
>  2 files changed, 80 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> index d623d71..c7d6c46 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> @@ -436,6 +436,39 @@
>                 qcom,drive-strength = <3>;
>         };
>  };

Newline here

> +&pri_mi2s_data0 {
> +       drive-strength = <6>;
> +};
> +
> +&pri_mi2s_data1 {
> +       drive-strength = <6>;
> +};
> +
> +&pri_mi2s_mclk {
> +       drive-strength = <6>;
> +};
> +
> +&pri_mi2s_sclk {
> +       drive-strength = <6>;
> +};
> +
> +&pri_mi2s_ws {
> +       drive-strength = <6>;
> +};
> +
> +&sec_mi2s_data0 {
> +       drive-strength = <6>;
> +       bias-disable;
> +};
> +
> +&sec_mi2s_sclk {
> +       drive-strength = <6>;
> +       bias-disable;
> +};
> +
> +&sec_mi2s_ws {
> +       drive-strength = <6>;
> +};

Please sort these nodes alphabetically on node name.

>
>  &qspi_cs0 {
>         bias-disable;
> @@ -491,6 +524,13 @@
>  };
>
>  &tlmm {
> +       amp_en: amp-en {
> +               pins = "gpio63";
> +               function = "gpio";
> +               bias-disable;

Is there an external pull?

> +               drive-strength = <2>;
> +       };
> +
>         nvme_pwren: nvme-pwren {
>                 function = "gpio";
>         };
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 937c2e0..76e73e9 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -3461,6 +3461,46 @@
>                                 };
>                         };
>
> +                       pri_mi2s_data0: pri-mi2s-data0 {
> +                               pins = "gpio98";
> +                               function = "mi2s0_data0";
> +                       };
> +
> +                       pri_mi2s_data1: pri-mi2s-data1 {
> +                               pins = "gpio99";
> +                               function = "mi2s0_data1";
> +                       };
> +
> +                       pri_mi2s_mclk: pri-mi2s-mclk {
> +                               pins = "gpio96";
> +                               function = "pri_mi2s";
> +                       };
> +
> +                       pri_mi2s_sclk: pri-mi2s-sclk {
> +                               pins = "gpio97";
> +                               function = "mi2s0_sck";
> +                       };
> +
> +                       pri_mi2s_ws: pri-mi2s-ws {
> +                               pins = "gpio100";
> +                               function = "mi2s0_ws";
> +                       };
> +
> +                       sec_mi2s_data0: sec-mi2s-data0 {
> +                               pins = "gpio107";
> +                               function = "mi2s1_data0";
> +                       };
> +
> +                       sec_mi2s_sclk: sec-mi2s-sclk {
> +                               pins = "gpio106";
> +                               function = "mi2s1_sck";
> +                       };
> +
> +                       sec_mi2s_ws: sec-mi2s-ws {
> +                               pins = "gpio108";
> +                               function = "mi2s1_ws";
> +                       };

Please sort these nodes alphabetically on node name.
