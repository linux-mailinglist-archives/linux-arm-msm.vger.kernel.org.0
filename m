Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AB2A347CB4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 16:33:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236691AbhCXPci (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 11:32:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236753AbhCXPcP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 11:32:15 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D50FC0613E3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:32:14 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id x9so17840899qto.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iVb2QbYSbal4tLqCqk3qMZlVKf8EJnP6RzZIU2b/Gbg=;
        b=hAnApmAFjU4lv9213jcldZTaZ5s2KhQhYnd4rknFmPZzC4RkUkKgncqV6u2V058lBg
         LV9UVLtxKrtK10baBKnXk4Lzd/8E09LglXGiHW1+rl9gYBZyAn8w5kAKS427+wtIPTkb
         KdoAlmuuIl2k5nnaZQcSqy4/nO/mHB+5nBXSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iVb2QbYSbal4tLqCqk3qMZlVKf8EJnP6RzZIU2b/Gbg=;
        b=TjpGL0i5FbsYnu4VI45Bb0MMYxQZMJRcVzlAlUcojHQJnR0uspxHweUqDzRtqpJNlQ
         M7tYsv+uI7ebzsGkftjQdUguvMEaKaW3aSOY8/NCfh8jJ6+Ke3nxwvQAEuW0rdghnVHU
         3MkCRVYEtFR5mmYXEl8BM1fiAGFMDek9wjfEkOezl39vyoO8FCTZCo+FnDSRBqGQb+lt
         9GEjiRXADj1mLvq9oLkVTa0TSWp/3D7+4QugCG2juMhqo5goplbwO79KWTNWBP4B3W3G
         RaThJWPfZ2rJ9FXxs1/nQL7WDLqTzaQvYX0kR+zzEDCnGftVvZ94sNoU0qsSt/dEsPyP
         GysQ==
X-Gm-Message-State: AOAM530kbv07WR/+vGpEKftC9UzX0ZoJL20c7efYzVjQDSE+Ap3oKdde
        NaAJeSHJ21t3g8Fsxx9Nefj62gfLBXjf7g==
X-Google-Smtp-Source: ABdhPJypIrRu/IqTwBxCJIAqG5+FVKuekRi0/2Ju/cFag4gqXMKPJPA55b4HWwzq4kgG8stFCEhKZg==
X-Received: by 2002:ac8:44aa:: with SMTP id a10mr3723377qto.146.1616599933244;
        Wed, 24 Mar 2021 08:32:13 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id r7sm1623215qtm.88.2021.03.24.08.32.12
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Mar 2021 08:32:12 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 8so14537782ybc.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:32:12 -0700 (PDT)
X-Received: by 2002:a25:b443:: with SMTP id c3mr5809966ybg.32.1616599932107;
 Wed, 24 Mar 2021 08:32:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210324025534.1837405-1-swboyd@chromium.org>
In-Reply-To: <20210324025534.1837405-1-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 24 Mar 2021 08:32:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VfM10w60VUuTW5yXdykC8oXuxqq=FLfZYDP2aUh0P0_g@mail.gmail.com>
Message-ID: <CAD=FV=VfM10w60VUuTW5yXdykC8oXuxqq=FLfZYDP2aUh0P0_g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: trogdor: Add no-hpd to DSI bridge node
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Mar 23, 2021 at 7:55 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> We should indicate that we're not using the HPD pin on this device, per
> the binding document. Otherwise if code in the future wants to enable
> HPD in the bridge when this property is absent we'll be wasting power
> powering hpd when we don't use it on trogdor boards. We didn't notice
> this before because the kernel driver blindly disables hpd, but that
> won't be true for much longer.
>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Douglas Anderson <dianders@chromium.org>
> Fixes: 7ec3e67307f8 ("arm64: dts: qcom: sc7180-trogdor: add initial trogdor and lazor dt")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index 07c8b2c926c0..298af6d7fb4a 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -595,6 +595,8 @@ sn65dsi86_bridge: bridge@2d {
>                 clocks = <&rpmhcc RPMH_LN_BB_CLK3>;
>                 clock-names = "refclk";
>
> +               no-hpd;
> +

Sigh. I can't believe that I added this for cheza in commit
0d1ce0d14bd7 ("arm64: dts: sdm845: Add "no-hpd" to sn65dsi86 on
cheza") but forgot trogdor. Thanks.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

NOTE: if you were feeling charitable you might consider sending a
patch for "sdm850-lenovo-yoga-c630.dts" as well.  I don't personally
know if HPD is hooked up on that system, but presumably even if it is
it's just as useless as it is on other systems where the bridge is
used for eDP. If nothing else setting it preserves existing behavior.
Someone (I forget who) requested that I word the bindings specifically
to say that "no-hpd" was OK to specify in cases like that, since the
bindings say:

>      Set if the HPD line on the bridge isn't hooked up to anything or is
>      otherwise unusable.

-Doug
