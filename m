Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97E02436C7B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Oct 2021 23:12:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232070AbhJUVOX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Oct 2021 17:14:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:52210 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230272AbhJUVOW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Oct 2021 17:14:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 30603608FE;
        Thu, 21 Oct 2021 21:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634850726;
        bh=ZP9iEXx5WLvma9hJFwVIZE4q2XCeEw2KAGb/t5rrBJg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=DymmzPBtlZV5i4kQ/ZQgU9tgwsEGlxZnC5zCox8SmmOs+72abZo11DfueJJmN/PoG
         HzLG2H4glyZpY/F0mIZNhAs716hCkhiH+2Ho/L4lioVcEkI6QyItN07uuDSDy+EsMB
         xqRVJDds1KCiUHRpEyX5MWNwZKcZp9IuWEGu6uEPS1wukIdKJArFknJJaB/k7YsTXw
         Z3WnwygdeO7oen1iqgAFK56qTQAyBeaok8Ns8PTQvmgf/mABuc7FIxY5ag8Pl4HOo4
         tVM8AvL7vk5pTatgnDrIFrZy1edcByOT2lRUqSNay09eybcM+VETrStK2JSvcDzFbk
         5diCgfavXTYTg==
Received: by mail-ed1-f54.google.com with SMTP id w14so6105718edv.11;
        Thu, 21 Oct 2021 14:12:06 -0700 (PDT)
X-Gm-Message-State: AOAM532QwtnHWdHseXiwU8P6WRbfqEpTgQnQABabzbsBQlX/oywyfrhb
        2ZmZDdWzn0IoPRW1jeSyaZj7DX+ipupcZvU/nA==
X-Google-Smtp-Source: ABdhPJyd9DgKuGaJtccu3R8WDxdvJU1K8eSz9ykib/Dr6Ub5jXdLb2A7Fts8YIXsAHNe09YrRnHLESpYagsdxpX17fk=
X-Received: by 2002:a17:906:5a47:: with SMTP id my7mr9784145ejc.128.1634850724700;
 Thu, 21 Oct 2021 14:12:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210928192210.1842377-1-robh@kernel.org>
In-Reply-To: <20210928192210.1842377-1-robh@kernel.org>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 21 Oct 2021 16:11:53 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLxojde1Pr4ObCbfWh+D=bopZrb0x6eoXXvjBwTENgNGw@mail.gmail.com>
Message-ID: <CAL_JsqLxojde1Pr4ObCbfWh+D=bopZrb0x6eoXXvjBwTENgNGw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: Fix 'interrupt-map' parent address cells
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 28, 2021 at 2:22 PM Rob Herring <robh@kernel.org> wrote:
>
> The 'interrupt-map' in several QCom SoCs is malformed. The '#address-cells'
> size of the parent interrupt controller (the GIC) is not accounted for.
>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8998.dtsi |  8 ++++----
>  arch/arm64/boot/dts/qcom/sdm845.dtsi  | 16 ++++++++--------
>  2 files changed, 12 insertions(+), 12 deletions(-)

Ping!

>
> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> index 34039b5c8017..5a04a0427d08 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> @@ -954,10 +954,10 @@ pcie0: pci@1c00000 {
>                         interrupts = <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>;
>                         interrupt-names = "msi";
>                         interrupt-map-mask = <0 0 0 0x7>;
> -                       interrupt-map = <0 0 0 1 &intc 0 135 IRQ_TYPE_LEVEL_HIGH>,
> -                                       <0 0 0 2 &intc 0 136 IRQ_TYPE_LEVEL_HIGH>,
> -                                       <0 0 0 3 &intc 0 138 IRQ_TYPE_LEVEL_HIGH>,
> -                                       <0 0 0 4 &intc 0 139 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-map = <0 0 0 1 &intc 0 0 135 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <0 0 0 2 &intc 0 0 136 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <0 0 0 3 &intc 0 0 138 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <0 0 0 4 &intc 0 0 139 IRQ_TYPE_LEVEL_HIGH>;
>
>                         clocks = <&gcc GCC_PCIE_0_PIPE_CLK>,
>                                  <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 6d7172e6f4c3..287c12666a3a 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -1990,10 +1990,10 @@ pcie0: pci@1c00000 {
>                         interrupt-names = "msi";
>                         #interrupt-cells = <1>;
>                         interrupt-map-mask = <0 0 0 0x7>;
> -                       interrupt-map = <0 0 0 1 &intc 0 149 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
> -                                       <0 0 0 2 &intc 0 150 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
> -                                       <0 0 0 3 &intc 0 151 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
> -                                       <0 0 0 4 &intc 0 152 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
> +                       interrupt-map = <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
> +                                       <0 0 0 2 &intc 0 0 0 150 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
> +                                       <0 0 0 3 &intc 0 0 0 151 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
> +                                       <0 0 0 4 &intc 0 0 0 152 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
>
>                         clocks = <&gcc GCC_PCIE_0_PIPE_CLK>,
>                                  <&gcc GCC_PCIE_0_AUX_CLK>,
> @@ -2095,10 +2095,10 @@ pcie1: pci@1c08000 {
>                         interrupt-names = "msi";
>                         #interrupt-cells = <1>;
>                         interrupt-map-mask = <0 0 0 0x7>;
> -                       interrupt-map = <0 0 0 1 &intc 0 434 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
> -                                       <0 0 0 2 &intc 0 435 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
> -                                       <0 0 0 3 &intc 0 438 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
> -                                       <0 0 0 4 &intc 0 439 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
> +                       interrupt-map = <0 0 0 1 &intc 0 0 0 434 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
> +                                       <0 0 0 2 &intc 0 0 0 435 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
> +                                       <0 0 0 3 &intc 0 0 0 438 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
> +                                       <0 0 0 4 &intc 0 0 0 439 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
>
>                         clocks = <&gcc GCC_PCIE_1_PIPE_CLK>,
>                                  <&gcc GCC_PCIE_1_AUX_CLK>,
> --
> 2.30.2
>
