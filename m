Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BF032F1B5D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jan 2021 17:49:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388904AbhAKQr6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jan 2021 11:47:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730189AbhAKQr5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jan 2021 11:47:57 -0500
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com [IPv6:2607:f8b0:4864:20::931])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63A58C061795
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jan 2021 08:47:17 -0800 (PST)
Received: by mail-ua1-x931.google.com with SMTP id j59so44478uad.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jan 2021 08:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iQTCUBSd32PPGYWf+4NIALcXpFdvaLx7ubBy6PwA+oo=;
        b=dV4BlOFvq3NnHp1B03OjVOTUkXxDivdCZzUxDmW4DhWl6JK6pz/TMEZzznL40CNtlU
         qTyNX4XXjyD4aWzUANyL5M3W32syMhp1DThb4pUUuqAM0FwZhL67S1aeDy5vDZDwNy2n
         0n7glfkziSL5hW3iiaR7wq4xhfDKi5Lv9eZxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iQTCUBSd32PPGYWf+4NIALcXpFdvaLx7ubBy6PwA+oo=;
        b=poN7QcvgpcTCJCoFRP8TTgiUJCKYfoZQ8gPIxWHnE7k5hcbqF+XUxxPz3k0JRJg+/4
         RCA1iGSlPz/VCJAiIrfZDJAKv5L1yuTswCUT4cqCmGBsSLTUx7BwsTvlqKq4nwkrNWt9
         JIPZCt5PGBf8S3U0KF51ZARMvjoAKpALkbiSiK1PeeKZOeQ0ak6QwBrvmFudkPEQz4+t
         wXsWScjys1X9tqDK5zSTSCCo3qcU8jDJX58pgchqyfS8BGiintJCda+xk5VzVVREDl9q
         Gp+hqTw50+c1o6eYK9BHmui+Dpzurj1h4F4SeFzYoV7gVO5hiE70zFB50bNhICkvW3BM
         WtoA==
X-Gm-Message-State: AOAM532FM5L1WcoXTeSaL9n/k1F8X+tbdq30iOyXG/b3P7uGweqZSmnQ
        GsokYj4Z8aIS1VefugITnM6rZgG7VTOA3w==
X-Google-Smtp-Source: ABdhPJyXmZ0NP1XIhoKUCxXq1EBx2oHAjrE2wRkCti3wX6169LzxfmM2nb+9hGgBNZBxozStSTeftw==
X-Received: by 2002:ab0:20d4:: with SMTP id z20mr398453ual.44.1610383636327;
        Mon, 11 Jan 2021 08:47:16 -0800 (PST)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id p136sm60457vke.6.2021.01.11.08.47.13
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jan 2021 08:47:14 -0800 (PST)
Received: by mail-vk1-f179.google.com with SMTP id a6so4381313vkb.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jan 2021 08:47:13 -0800 (PST)
X-Received: by 2002:a1f:4582:: with SMTP id s124mr621617vka.7.1610383633600;
 Mon, 11 Jan 2021 08:47:13 -0800 (PST)
MIME-Version: 1.0
References: <20210111151651.1616813-1-vkoul@kernel.org> <20210111151651.1616813-8-vkoul@kernel.org>
In-Reply-To: <20210111151651.1616813-8-vkoul@kernel.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 11 Jan 2021 08:47:01 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UPNnSmgJM33QjAb4VvTe4Xs-OHcQCkk5E+o3u+afjbjA@mail.gmail.com>
Message-ID: <CAD=FV=UPNnSmgJM33QjAb4VvTe4Xs-OHcQCkk5E+o3u+afjbjA@mail.gmail.com>
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sdm845: enable dma for spi
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        linux-spi <linux-spi@vger.kernel.org>, linux-i2c@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Jan 11, 2021 at 7:18 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> @@ -2622,6 +2626,13 @@ pinmux {
>                                                "gpio2", "gpio3";
>                                         function = "qup0";
>                                 };
> +
> +                               config {

Convention in Qualcomm device tree files seems to be that the node is
"pinconf", not "config".


> +                                       pins = "gpio0", "gpio1",
> +                                              "gpio2", "gpio3";
> +                                       drive-strength = <6>;
> +                                       bias-disable;
> +                               };

Pin config almost never belongs in the SoC dtsi file.  This should be
in the board .dts file.  What if pulls are needed on some pins?  What
if you need a stronger or weaker drive strength?

-Doug
