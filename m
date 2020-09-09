Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4041A26387D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Sep 2020 23:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730093AbgIIVaS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Sep 2020 17:30:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726534AbgIIVaM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Sep 2020 17:30:12 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30A2CC061756
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2020 14:30:11 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id j185so2236080vsc.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2020 14:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=47pCfHCQ+v4BbpZhrHNZ2wtMUQkpqJXTbV3lF3DkBic=;
        b=jXLCBqNUV9jGbre90QfVGVO4THC61Ocp5+wSKhoeIGyRADR6hKTBJUMPPXtjVJtlfT
         nxJk7eqLtaDCYR7zQTQAYQt9efFu8muNYflrHPKsG8DB37chbJKvqorUdT2Ks++80dxl
         sT5gwqw36/ChMVpExrBrojlJx98COigtRy9a8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=47pCfHCQ+v4BbpZhrHNZ2wtMUQkpqJXTbV3lF3DkBic=;
        b=TYZ/YZ2PfqbU2S04mddpwFuWOczQWwGyakdjoFMy6dhR4j6bFSfye5tgk9x3m2yD5j
         Vz9WQeTxmo5MECA2SZ4w2E57gFsXkBukNHL0Pcsa6NGPthNbK4dZeVYIHDCteXMzTwRq
         FCczqSYeX7zMRSQ1SMSVZFu5hjb6icQTcWW/Jb2yrWjox2Q2mLXk2ewG+qj2DrXxSXbU
         8lL2Q4f8VBoPPwwsM/2X2xovXQQ4moH925/S/uqV+0Cm2k+hTqL+iTtosHEI6DxG0byR
         vBwbOQCHbjYi7hP0of81DeIQtAV46XyVJzntX9LQ/QIE3Jcn/2xCTxirIwugU75ojh1y
         QlHA==
X-Gm-Message-State: AOAM5330uZnQi9wmf6B2YiNpuUkQIdBohwfi9+wQYM+P02N6EXEMdjjW
        B4zBNEcsyrSvOu1xqe6pJYKsvhYwGc+MYA==
X-Google-Smtp-Source: ABdhPJxolt5q8ExWghASEdJqiA7hdR8PTrlejkIlxhWsVNKmAx49rsUGjZU5HtPnNfH5nbfF0fASsg==
X-Received: by 2002:a67:6b87:: with SMTP id g129mr2120114vsc.53.1599687010070;
        Wed, 09 Sep 2020 14:30:10 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id o198sm572702vkd.43.2020.09.09.14.30.08
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2020 14:30:09 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id d2so1051430vkd.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2020 14:30:08 -0700 (PDT)
X-Received: by 2002:a1f:e641:: with SMTP id d62mr2162009vkh.30.1599687008270;
 Wed, 09 Sep 2020 14:30:08 -0700 (PDT)
MIME-Version: 1.0
References: <1599145498-20707-1-git-send-email-skakit@codeaurora.org> <1599145498-20707-4-git-send-email-skakit@codeaurora.org>
In-Reply-To: <1599145498-20707-4-git-send-email-skakit@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 9 Sep 2020 14:29:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VyRU3+BLx_6YPrOsaA6E05cJn_OpBR1y3Dt0LA0X5REA@mail.gmail.com>
Message-ID: <CAD=FV=VyRU3+BLx_6YPrOsaA6E05cJn_OpBR1y3Dt0LA0X5REA@mail.gmail.com>
Subject: Re: [PATCH V4 3/4] arm64: dts: qcom: sc7180: Add sleep state for BT UART
To:     satya priya <skakit@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        msavaliy@qti.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Sep 3, 2020 at 8:08 AM satya priya <skakit@codeaurora.org> wrote:
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index cecac3e..77e3523 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -507,6 +507,43 @@
>         };
>  };
>
> +&qup_uart3_sleep {
> +       pinconf-cts {
> +               /*
> +                * Configure no-pull on CTS. As this is driven by BT, do not
> +                * specify any pull in order to not conflict with BT pulls.
> +                */
> +               pins = "gpio38";
> +               bias-disable;

Same comment as in the previous patch that I'm not convinced removing
the bias here is correct.


> +       };
> +
> +       pinconf-rts {
> +               /*
> +                * Configure pull-down on RTS to make sure that the BT SoC can
> +                * wake up the system by sending wakeup bytes during suspend.
> +                */
> +               pins = "gpio39";
> +               bias-pull-down;
> +       };
> +
> +       pinconf-tx {
> +               /* Configure pull-up on TX when it isn't actively driven */
> +               pins = "gpio40";
> +               bias-pull-up;
> +       };
> +
> +       pinconf-rx {
> +               /*
> +                * Configure a pull-up on RX. This is needed to avoid
> +                * garbage data when the TX pin of the Bluetooth module is
> +                * in tri-state (module powered off or not driving the
> +                * signal yet).
> +                */
> +               pins = "gpio41";
> +               bias-pull-up;
> +       };
> +};
> +
>  &qup_uart8_default {

Slight nit that "default" starts with a "d" which sorts before "sleep"
which starts with an "s".  Thus "qup_uart8_default" should be above
"qup_uart3_sleep", not below.
