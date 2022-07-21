Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B90D357D473
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jul 2022 21:58:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231853AbiGUT6i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jul 2022 15:58:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230518AbiGUT6h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jul 2022 15:58:37 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9C5E6383
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jul 2022 12:58:36 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id t3so3545984edd.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jul 2022 12:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mHKWUmFgUfuZc36J9hbJA8Kke1gZwOYkNn4MmRRQ64Q=;
        b=beAHVgvfeXkhJLLqR7EMnPg46bA2u+iFLwngja2Te+ki3gsPMJlt+qGKCn63WN9SLp
         1XWqRoiVTca7Vy9/skOyyqzKasfEB7HFvZsfS6SAcEzZf6jVN4Yu1IcuE4qWWnMHFjBC
         fPVcDvyptwdijAuWxXrvk1ONHaad+BKsTmbTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mHKWUmFgUfuZc36J9hbJA8Kke1gZwOYkNn4MmRRQ64Q=;
        b=zB6v3xylBqTX7Rj6DRu9g99gwSPMq9WZXJ0BSY37fUm7AR781uIsa2WgJ1318wUseu
         pZg3CWIKcMak3AI/Ut3K3D2DXlcfCqchVeI6M0+VXFXXV+YMPxs8O1SjerOw2HJ7qnYi
         JPX6P1ui9YtZ54QJWVjCmVALuiMul+o0qW9FNf6uctXcY+lpxdahihRI8OkH4KJtsD/W
         64JGPhfKZtZGxhZdIyOalAVRPFj1FMHYdQXW4EG0ozMG6mDVqWVFjxjcQZdr+ofChf4x
         Pxr0oJGEcFk/700ohv6+1A88YvyOv0XHsxuIWrXv/iYsdSvZPyiIFJjFcD3oFDVt1Xtq
         MvtA==
X-Gm-Message-State: AJIora+V6EM5/WmY3aDb5cCuKZGnN9kb+QomlhyLGCbS2VE5BMLNBGdv
        n9+qqQodpmadsz5QMXwzr9bWIxYVKkexcTd6Hxw=
X-Google-Smtp-Source: AGRyM1tK8ScLUmpcz9V/PYYyOSo9O+Js8+IqBce3Ua7lG9BPwR+PZYtm8Txiybq1iyNJfvjywlwmvA==
X-Received: by 2002:a05:6402:2786:b0:43a:dc4e:ea63 with SMTP id b6-20020a056402278600b0043adc4eea63mr60597389ede.175.1658433514934;
        Thu, 21 Jul 2022 12:58:34 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id w23-20020a17090649d700b0072b33e91f96sm1166834ejv.190.2022.07.21.12.58.33
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 12:58:34 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id bu1so3743809wrb.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jul 2022 12:58:33 -0700 (PDT)
X-Received: by 2002:a05:6000:2c9:b0:21d:bd7d:3af6 with SMTP id
 o9-20020a05600002c900b0021dbd7d3af6mr34835wry.405.1658433513568; Thu, 21 Jul
 2022 12:58:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220718073104.146985-1-jinghung.chen3@hotmail.com> <SG2PR03MB5006A2ADC6ED22199D8C88D9CC8C9@SG2PR03MB5006.apcprd03.prod.outlook.com>
In-Reply-To: <SG2PR03MB5006A2ADC6ED22199D8C88D9CC8C9@SG2PR03MB5006.apcprd03.prod.outlook.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 21 Jul 2022 12:58:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WTe0ArnF2U43Nmy8Ri-CnqMCssVGcWiPUiLaHzS8zVUQ@mail.gmail.com>
Message-ID: <CAD=FV=WTe0ArnF2U43Nmy8Ri-CnqMCssVGcWiPUiLaHzS8zVUQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: Add LTE SKUs for sc7280-villager family
To:     Jimmy Chen <jinghung.chen3@hotmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alan Huang <alan-huang@quanta.corp-partner.google.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Jul 18, 2022 at 12:31 AM Jimmy Chen <jinghung.chen3@hotmail.com> wrote:
>
> This adds LTE skus for villager device tree files.
>
> Signed-off-by: Jimmy Chen <jinghung.chen3@hotmail.com>
> ---
>
> Changes in v6:
> - Remove v5 accidentally added sc7280-herobrine-herobrine-r1-lte.dts
>
> Changes in v5:
> - Reorder '.dtb' in Makefile
> - Put the "interconnects" line back
>
> Changes in v4:
> - Reorder 'status' last
>
>  arch/arm64/boot/dts/qcom/Makefile               |  2 ++
>  .../boot/dts/qcom/sc7280-chrome-common.dtsi     | 11 -----------
>  .../boot/dts/qcom/sc7280-herobrine-crd.dts      |  1 +
>  .../dts/qcom/sc7280-herobrine-herobrine-r1.dts  |  1 +
>  .../boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi | 17 +++++++++++++++++
>  .../qcom/sc7280-herobrine-villager-r0-lte.dts   | 14 ++++++++++++++
>  .../qcom/sc7280-herobrine-villager-r1-lte.dts   | 14 ++++++++++++++
>  arch/arm64/boot/dts/qcom/sc7280-idp.dts         |  1 +
>  8 files changed, 50 insertions(+), 11 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0-lte.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dts
>
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 7e6a4d7ef3266..bd43d984f69fc 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -103,7 +103,9 @@ dtb-$(CONFIG_ARCH_QCOM)     += sc7180-trogdor-r1-lte.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += sc7280-herobrine-crd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += sc7280-herobrine-herobrine-r1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += sc7280-herobrine-villager-r0.dtb
> +dtb-$(CONFIG_ARCH_QCOM)        += sc7280-herobrine-villager-r0-lte.dtb
>  dtb-$(CONFIG_ARCG_QCOM)        += sc7280-herobrine-villager-r1.dtb
> +dtb-$(CONFIG_ARCH_QCOM)        += sc7280-herobrine-villager-r1-lte.dtb

Whoops! Looks like you'll need a v7. There's a subtle typo above.
"ARCH" doesn't end with a "G".

-Doug
