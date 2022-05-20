Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E86FE52F49D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 May 2022 22:44:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238447AbiETUoM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 May 2022 16:44:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231217AbiETUoM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 May 2022 16:44:12 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED508193233
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 13:44:10 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id h11so11028491eda.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 13:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=68piDRPYyGX+8Kyo8j5dYWvQ7UCAfg+Z9z+ncUpXzkQ=;
        b=WqueUB0FZvMjwwyFM8/byn7J6ZpW/YsB9QLgdQ7hEeyQqYVVrkG9Nm6JD6fsroOa2M
         LuqnL+H8DYouLJz2gZ2DsRfXHkguHA8ELhHPw6uFPpaH0Y60qvs/+LInAQB55axMZoNi
         pAdXfEb6HPMFU/NEVNunlCyMLcdmHFWl6m/E0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=68piDRPYyGX+8Kyo8j5dYWvQ7UCAfg+Z9z+ncUpXzkQ=;
        b=Q1og88LaV68IDVkeiB7dsiC5i5aTAvMAV0YhN6qYXnDpvkMXUxmocpIKaQMzkwOejo
         ii/ezI5Mtnb5jLJff0d4wyNkBUmldxilNrsobG42suPFjbi4cjr81J0hbF+0hMdrfBZA
         b7+VmyM91gMAIFDV6B1JVMUuheCLzaP/V0a41V9S0o/XTwg0SRqqcXWUdxXyDbvv7gkf
         aT/5NL7w7aE7QsVj3ByCGMxmJQv6QYMsYgFp/bmnl8z+1XY+8FAgLPEpqFpjdMRApn30
         eDZy96PMvXKMaZCiWoCeOmR9TCdnmJPdPUy3ut71vBKBCMc/z6FwII7eOfuqfhmR3hYr
         OoBw==
X-Gm-Message-State: AOAM533YuTTG3TjRlANzkiHuCAUBXYAWbkyEVbYqj3/bxciuESTmv4vH
        Psb4zU63qMJ8YK3AjZlUCFuxcHBd1v+PKepQJlQ=
X-Google-Smtp-Source: ABdhPJzAmpbm8/DnpYZJJ+nrG5+2jGHR/+VAE7rKAd4JtZCWeF4HSCXEHVJWh3YB+CF9QFdhhkdT/A==
X-Received: by 2002:a05:6402:11c7:b0:428:5fdc:80c5 with SMTP id j7-20020a05640211c700b004285fdc80c5mr12841879edw.332.1653079449197;
        Fri, 20 May 2022 13:44:09 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id w6-20020a170907270600b006f3ef214dedsm3460454ejk.83.2022.05.20.13.44.07
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 13:44:08 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id k30so12958911wrd.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 13:44:07 -0700 (PDT)
X-Received: by 2002:a05:6000:2c1:b0:20c:5e37:3ed1 with SMTP id
 o1-20020a05600002c100b0020c5e373ed1mr9682745wry.342.1653079447381; Fri, 20
 May 2022 13:44:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220520161004.1141554-1-judyhsiao@chromium.org> <20220520161004.1141554-2-judyhsiao@chromium.org>
In-Reply-To: <20220520161004.1141554-2-judyhsiao@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 20 May 2022 13:43:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WnXrvO4ip0uHQ-5KAVQKgb_GgVH=vdmH6rCbZXEuhAYw@mail.gmail.com>
Message-ID: <CAD=FV=WnXrvO4ip0uHQ-5KAVQKgb_GgVH=vdmH6rCbZXEuhAYw@mail.gmail.com>
Subject: Re: [v2 1/3] arm64: dts: qcom: sc7280: herobrine: Add pinconf
 settings for mi2s1
To:     Judy Hsiao <judyhsiao@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Jimmy Cheng-Yi Chiang <cychiang@google.com>,
        Judy Hsiao <judyhsiao@google.com>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, May 20, 2022 at 9:10 AM Judy Hsiao <judyhsiao@chromium.org> wrote:
>
> 1. Add drive strength property for mi2s1 on sc7280 based platforms.
> 2. Disbale the pull-up mi2s1_data0, mi2s1_sclk.
>
> Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> index 9cb1bc8ed6b5..6d8744e130b0 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> @@ -612,6 +612,20 @@ &dp_hot_plug_det {
>         bias-disable;
>  };
>
> +&mi2s1_data0 {
> +       drive-strength = <6>;
> +       bias-disable;
> +};
> +
> +&mi2s1_sclk {
> +       drive-strength = <6>;
> +       bias-disable;
> +};
> +
> +&mi2s1_ws {
> +       drive-strength = <6>;
> +};

I'm actually curious why this line has a drive-strength but _no_ bias
setting. I guess I should figure out what the heck "ws" is. Ah, I
guess it is word select.

Since this is an output I'd expect to see "bias-disable" here too.

-Doug
