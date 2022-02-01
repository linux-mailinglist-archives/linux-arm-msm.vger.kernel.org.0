Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CC824A5404
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 01:26:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230364AbiBAA0F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jan 2022 19:26:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbiBAA0F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jan 2022 19:26:05 -0500
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CF5AC061714
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 16:26:05 -0800 (PST)
Received: by mail-il1-x12f.google.com with SMTP id s1so12915869ilj.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 16:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H3VxRYbGvbQmOkoOvdDDUnMRfNKUl+fKq9ZDlxS97Ok=;
        b=DhSjWhhfrOxlRlaFxeRFZmLiGI2hLkWhe4j92lj9v3XYbXVBK2Aa7rfg/Qw4ji0G2p
         u4G0yHtzbcJac2yoRp5NEe7bT/x0pnm+gmYuytH34YBvFWK8oPtVG3fB768kQimVTtBP
         AqRWnF7iUjG2PccI/RzVh1iLKU9EwFQmUg/7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H3VxRYbGvbQmOkoOvdDDUnMRfNKUl+fKq9ZDlxS97Ok=;
        b=kn8nuM2uHxtM/33fU42cO0X8unyy3sshuwIbcchztlYvWktYcYOERsXpoAbYCJ0t56
         6sCLqLAurP6dDTbH2iwH68MsaAvijfzZR6cCw+ZeyCm/CNl41BspPUsvYmwguHpGZ7eq
         znSO7j4B9B2uDE/oHxpxFH9K/Pu7xPHlIieojOdoi4QVI1fpyGSnrIN1b4fLf/u37qeu
         /2nsBMvZp9L+j0h1RyLIvfflR6J2+xpnUdZFPplcs+XqjZTtgZqrZWqokCYksfrkqLFT
         DKPJEH5Pz61DpsmCnC81mbq0cRpAt1bGtEfFkwKptyF+9lOLb1rB76W8lXxn7mQce3on
         Hlog==
X-Gm-Message-State: AOAM531UihHDlM7bGkevLoz87VO0jq5GRlVVrQC0MtNttuqEJzjfmb3d
        jtWyZiQWefbi3FVQcn0SLH4R0aBJcXa4Gg==
X-Google-Smtp-Source: ABdhPJyrebKCzQ7weWQKB22G1lGxN3NCUUhltpPth/9lYEVxa7H2rH68c+wC0cDCppey79DqHIbzvA==
X-Received: by 2002:a92:1901:: with SMTP id 1mr12972794ilz.70.1643675164499;
        Mon, 31 Jan 2022 16:26:04 -0800 (PST)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com. [209.85.166.48])
        by smtp.gmail.com with ESMTPSA id f13sm18134749ion.18.2022.01.31.16.26.04
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jan 2022 16:26:04 -0800 (PST)
Received: by mail-io1-f48.google.com with SMTP id q204so19158933iod.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 16:26:04 -0800 (PST)
X-Received: by 2002:a6b:7908:: with SMTP id i8mr12340835iop.168.1643675163670;
 Mon, 31 Jan 2022 16:26:03 -0800 (PST)
MIME-Version: 1.0
References: <20220201001042.3724523-1-dianders@chromium.org> <20220131161034.4.I79baad7f52351aafb470f8b21a9fa79d7031ad6a@changeid>
In-Reply-To: <20220131161034.4.I79baad7f52351aafb470f8b21a9fa79d7031ad6a@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 31 Jan 2022 16:25:52 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U4oma5qeoboczmKf6Qx7hpuwFbU-wi51p=owaKgZCQtg@mail.gmail.com>
Message-ID: <CAD=FV=U4oma5qeoboczmKf6Qx7hpuwFbU-wi51p=owaKgZCQtg@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: qcom: sc7280: Clean up sdc1 / sdc2 pinctrl
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Shaik Sajida Bhanu <sbhanu@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Jan 31, 2022 at 4:11 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 40cb414bc377..dc98a87e2871 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -616,6 +616,9 @@ qfprom: efuse@784000 {
>
>                 sdhc_1: sdhci@7c4000 {
>                         compatible = "qcom,sc7280-sdhci", "qcom,sdhci-msm-v5";
> +                       pinctrl-names = "default", "sleep";
> +                       pinctrl-0 = <&sdc1_clk>, <&sdc1_cmd>, <&sdc1_data>, <&sdc1_rclk>;
> +                       pinctrl-1 = <&sdc1_clk_sleep>, <&sdc1_cmd_sleep>, <&sdc1_data_sleep>, <&sdc1_rclk_sleep>;
>                         status = "disabled";
>
>                         reg = <0 0x007c4000 0 0x1000>,
> @@ -2425,6 +2428,9 @@ apss_merge_funnel_in: endpoint {
>
>                 sdhc_2: sdhci@8804000 {
>                         compatible = "qcom,sc7280-sdhci", "qcom,sdhci-msm-v5";
> +                       pinctrl-names = "default", "sleep";
> +                       pinctrl-0 = <&sdc2_clk>, <&sdc2_cmd>, <&sdc2_data>;
> +                       pinctrl-1 = <&sdc2_clk_sleep>, <&sdc2_cmd_sleep>, <&sdc2_data_sleep>;
>                         status = "disabled";
>
>                         reg = <0 0x08804000 0 0x1000>;
> @@ -3943,81 +3949,76 @@ qup_uart15_rx: qup-uart15-rx {
>                                 function = "qup17";
>                         };
>
> -                       sdc1_on: sdc1-on {
> -                               clk {
> -                                       pins = "sdc1_clk";
> -                               };
>
> -                               cmd {
> -                                       pins = "sdc1_cmd";
> -                               };
>
> -                               data {
> -                                       pins = "sdc1_data";
> -                               };
> +                       sdc1_clk: sdc1-clk {

Ugh. I just noticed that there are way too many blank lines here in
the output. Happy to have this fixed when applying or I can post a v2.

-Doug
