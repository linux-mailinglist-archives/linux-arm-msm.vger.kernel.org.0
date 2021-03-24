Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9C4F3484C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 23:44:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238799AbhCXWoN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 18:44:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238710AbhCXWnx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 18:43:53 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF104C06174A
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 15:43:53 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id j7so342396qtx.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 15:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GWMxWz3piUu0E2SKHD8SGAU1LhDZYlXiAId/32v4ol8=;
        b=ULVqvxm4U91zfE1dgFNEhJFnAyQ+/wwoqjiFqO73eUpwGcd8EBj8emwbMNUytA7MTd
         v0mYgBfK9gQm38WxXs6uvdngYSs31V7UGrrQ79FG9aCbgU4xC2qPVSlmKifW0xJCaj20
         4Ft2hIzINQogQkYQ26260vQHKfIJhRGv2S7/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GWMxWz3piUu0E2SKHD8SGAU1LhDZYlXiAId/32v4ol8=;
        b=SBpCcnFq+FxXb8EyjnYvaqoZKPGw8wMrVLJdDeQMbCbce9koCLqSFXzIERlKab+EII
         5jRY7WmcCXFiM38+fHz9I/9E05tum+KF1SENpkysfJ0ayrTOTVSdgbcjaxM/WTnWM/ii
         TauHCgzfHl3ya5oMwXcRfPI0JLli3OTrCIfXr+pF1MqHUQg6OfBNE7RLyXPELRNEB4nM
         7780EOGZASK4a/5cDseXOsDP9Jig3vvMF/LOjc6Kutcb0QHsfyxKrjYnJ3k2yKn4hPQJ
         8ywutfJ1vcdIEG84hvi4IaBMFc4qyklADh5N41LY6Vl8GPFj/bDVL/s/GkF85RzcZGQz
         wu1A==
X-Gm-Message-State: AOAM530Wh1rbbYNbw7gDtN/5MMBrwvPIPKf+mdTEhzz38+w5pEivD46y
        2Mxf9gODZaKcbKEbu7dJz+7sDnXS0u/1yQ==
X-Google-Smtp-Source: ABdhPJyamsIeK0MS6agk7o+/+qBhCA1pUyybBNc3iEZwzMntL8ZABlrYKRScLgvz/3y/n3owRWluIw==
X-Received: by 2002:aed:3001:: with SMTP id 1mr5187289qte.344.1616625832421;
        Wed, 24 Mar 2021 15:43:52 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id a10sm2781768qkh.122.2021.03.24.15.43.51
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Mar 2021 15:43:51 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id i144so303499ybg.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 15:43:51 -0700 (PDT)
X-Received: by 2002:a25:b443:: with SMTP id c3mr8496662ybg.32.1616625831301;
 Wed, 24 Mar 2021 15:43:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210324191549.2043808-1-swboyd@chromium.org>
In-Reply-To: <20210324191549.2043808-1-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 24 Mar 2021 15:43:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UTm9QshU88y3F+-GxYSsWpjwZDTst0VA+efb7-=MKKmg@mail.gmail.com>
Message-ID: <CAD=FV=UTm9QshU88y3F+-GxYSsWpjwZDTst0VA+efb7-=MKKmg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: c630: Add no-hpd to DSI bridge node
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Steev Klimaszewski <steev@kali.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Mar 24, 2021 at 12:15 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> We should indicate that we're not using the HPD pin on this device, per
> the binding document. Otherwise if code in the future wants to enable
> HPD in the bridge when this property is absent we'll be wasting power
> powering hpd when we don't use it.

It's not really about wasting power. It's really more about:

a) If HPD is actually hooked up on the board, it's actually _slower_
to use it than to just assume the worst case time.

b) If HPD isn't hooked up but we try to use it then everything will just fail.

I don't know which of a) or b) is true, but I'd imagine that one or
the other is.


> Presumably this board isn't using hpd
> on the bridge.
>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Douglas Anderson <dianders@chromium.org>

Cc: Steev Klimaszewski <steev@kali.org>


> Fixes: 7ec3e67307f8 ("arm64: dts: qcom: sc7180-trogdor: add initial trogdor and lazor dt")

Wrong Fixes?


> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> index 140db2d5ba31..c2a709a384e9 100644
> --- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> @@ -376,6 +376,8 @@ sn65dsi86: bridge@2c {
>                 clocks = <&sn65dsi86_refclk>;
>                 clock-names = "refclk";
>
> +               no-hpd;
> +
>                 ports {
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>
> base-commit: a38fd8748464831584a19438cbb3082b5a2dab15
> --
> https://chromeos.dev
>
