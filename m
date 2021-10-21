Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4346F436A11
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Oct 2021 20:06:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231635AbhJUSJL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Oct 2021 14:09:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230267AbhJUSJK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Oct 2021 14:09:10 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EE84C0613B9
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Oct 2021 11:06:54 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id b4-20020a9d7544000000b00552ab826e3aso1441790otl.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Oct 2021 11:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to;
        bh=TsLxcYrVGzv2bNbIlrKzjrjVENJvOk/fhrJ4w/U92ao=;
        b=M28mUW0hACZY0hgixz6nV5cT95gbMzVM7myHXhBJURHlMszsRVbAeXB4Mm4iqcgRKD
         SCUzuCoOeZHK4h6EGaARJ5b7cjSbaJMFZZHnTXo70aqsHpDS+gZcxUIEwzIzyGpNlfDO
         PNtOP+ipZYBQ+sS9tF2JVvw/BjUyJ8aOXNEPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to;
        bh=TsLxcYrVGzv2bNbIlrKzjrjVENJvOk/fhrJ4w/U92ao=;
        b=M/pW7J7wjFvn2GT7ngwOorOWjigPHUUb5LFORjz6RwkPtYDKc67jUo3hFGC5wfpir8
         AAzXEYwZPie24WfSgJJk1tubA0vhvssHEZy3srz8lOasKeDOVmgGeUJtOOZebiXsJs1Y
         8QAG+ZRX4scE8xsEqgxhWiFq0vJWRxfuU7+mjGZJ/G9ghtYWpYFR0uARQiJDdiqkkHQk
         Sv6NVusKqmWr3tCbx9Nf3vgUjeE+i+YLGyZI0xmYN9bSy9cdTcBhQtkCoj8w1qeIHXuj
         9WzW2MiCcx04O00JAehs92uI3Y5Lwp9kDv+8bueQurysbEuiwMBDWmlveQ8j0JFSVDK0
         nT/A==
X-Gm-Message-State: AOAM532cnnI39HZSK8YhvUX0D2KJUgtmxQoCQB17iCyzvT8KrDlGg7Yn
        jbFiz50sUVkd4aUVusul71kkCr46CMNOhaAYARmD93i0lSU=
X-Google-Smtp-Source: ABdhPJzylvcnEbJeIadhM/rNF9uTiWh44FT2oXv2KycTaSkPHc9aKwkpTA6Y5O975e21ioZ7dor1wkY5eUjF+aL1UUo=
X-Received: by 2002:a9d:12f4:: with SMTP id g107mr5841884otg.77.1634839613971;
 Thu, 21 Oct 2021 11:06:53 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 Oct 2021 11:06:53 -0700
MIME-Version: 1.0
In-Reply-To: <1634234784-5359-1-git-send-email-pmaliset@codeaurora.org>
References: <1634234784-5359-1-git-send-email-pmaliset@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 21 Oct 2021 11:06:53 -0700
Message-ID: <CAE-0n51PGVQ6GT7RMTQajEM54NLOUZBGPkVKmVaG1JV7Fgv9Ag@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: Add pcie clock support
To:     Prasad Malisetty <pmaliset@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        manivannan.sadhasivam@linaro.org, robh+dt@kernel.org,
        sanm@codeaurora.org, vbadigan@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Prasad Malisetty (2021-10-14 11:06:24)
> Add pcie clock phandle for sc7280 SoC and correct
> The pcie_1_pipe-clk clock name as same as binding.
>
> fix: ab7772de8 ("arm64: dts: qcom: SC7280: Add rpmhcc clock controller node")

This is wrong. Should be

Fixes: ab7772de8612 ("arm64: dts: qcom: SC7280: Add rpmhcc clock
controller node")

> Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
> Reported-by: kernel test robot <lkp@intel.com>
>
> ---
> This change is depends on the below patch series.
> https://lkml.org/lkml/2021/10/7/841

Why doesn't that patch update this clock cell then?

> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 39635da..78694c1 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -569,9 +569,10 @@
>                         reg = <0 0x00100000 0 0x1f0000>;
>                         clocks = <&rpmhcc RPMH_CXO_CLK>,
>                                  <&rpmhcc RPMH_CXO_CLK_A>, <&sleep_clk>,
> -                                <0>, <0>, <0>, <0>, <0>, <0>;
> +                                <0>, <&pcie1_lane 0>,
> +                                <0>, <0>, <0>, <0>;
>                         clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk",
> -                                     "pcie_0_pipe_clk", "pcie_1_pipe-clk",
> +                                     "pcie_0_pipe_clk", "pcie_1_pipe_clk",

This can be split from the patch to fix just the name in one patch and
then add the pcie1_lane phandle in the next patch. That way new features
aren't being mixed together with the string fix.

>                                       "ufs_phy_rx_symbol_0_clk", "ufs_phy_rx_symbol_1_clk",
>                                       "ufs_phy_tx_symbol_0_clk",
>                                       "usb3_phy_wrapper_gcc_usb30_pipe_clk";
