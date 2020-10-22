Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D553B29678D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Oct 2020 01:13:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S368496AbgJVXNm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Oct 2020 19:13:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504396AbgJVXNl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Oct 2020 19:13:41 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF398C0613CE
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2020 16:13:39 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id e3so1847802vsr.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2020 16:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XqZRiMhuJbb9xQjfZ/Kso8UhUVd+NGKCMF23xD+oK5A=;
        b=G0PWbSpxIEODLM5nxyFaH4wcSC5Tof/eTKvTFJfDjb4jdSxh2k8WP0w07CycnNkqSs
         uVupbWaEV3DgvKcdVUr023+qrEjkshzPyyEO/uc3JhL9c/OIwsiOvagKq1aJG5DeQy7e
         iP06v2r5JX4Qjn83Q+ncdtCN2QZf0gf30vzfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XqZRiMhuJbb9xQjfZ/Kso8UhUVd+NGKCMF23xD+oK5A=;
        b=AVOBAeJJ20JcH9zQkHo9QN6ljTPQbyi+3DE4N3Udj2gtacVDAhk2qVD4oHLEDZgWua
         ZXWSVPay05G2XN7nWXrhGBSWP99KTSXMsAM80sljiK4noYXEItXiyfOlF6T3daVXcncI
         /Vmlq7azam382MgnEbbam5litcYzSlF1UgFJqkjvvWNYMJao0+6M82boKprUfuGlIanG
         W31yyCyKLRKUCIM1KpEkQ/UzK0+sNHaDIjV0wQppN13v6Hy+Re8zG1dIYGIvKrHrZOIa
         POyTJt7MndN+IiOAApqhTOhVwyDO8eniZiN2wB2MxsWs9rZG/LKouMndb2n7+ASqoVjH
         A13Q==
X-Gm-Message-State: AOAM5302p+pVNELjPlQdYfM7gY3BJoDv822DWEpGbD+dr4dvyzLiJCIx
        AB1ZDZcPKMCR454mbnG1To0elpbmoePWfQ==
X-Google-Smtp-Source: ABdhPJy5pe1KuAEH6wcmyUwY6p9lcAxgGXttCgJRYr0jstXv+FwSkhqbHm/GgBVrYuDk2cX1krwKsg==
X-Received: by 2002:a67:ffd8:: with SMTP id w24mr4012100vsq.18.1603408418842;
        Thu, 22 Oct 2020 16:13:38 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id t71sm455788vkb.7.2020.10.22.16.13.38
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2020 16:13:38 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id r9so960913uat.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2020 16:13:38 -0700 (PDT)
X-Received: by 2002:a9f:31ce:: with SMTP id w14mr3531663uad.104.1603408090224;
 Thu, 22 Oct 2020 16:08:10 -0700 (PDT)
MIME-Version: 1.0
References: <20201022050445.930403-1-amstan@chromium.org> <20201021220404.v3.2.Ie4d84af5a85e8dcb8f575845518fa39f324a827d@changeid>
In-Reply-To: <20201021220404.v3.2.Ie4d84af5a85e8dcb8f575845518fa39f324a827d@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 22 Oct 2020 16:07:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VeRs=EzBoQkVNVYnrEmUAwV0B-zKtYeS9s80TpEjPmgg@mail.gmail.com>
Message-ID: <CAD=FV=VeRs=EzBoQkVNVYnrEmUAwV0B-zKtYeS9s80TpEjPmgg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: trogdor: Add brightness-levels
To:     Alexandru Stan <amstan@chromium.org>
Cc:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Oct 21, 2020 at 10:05 PM Alexandru Stan <amstan@chromium.org> wrote:
>
> We want userspace to represent the human perceived brightness.
> Since the led drivers and the leds themselves don't have a
> linear response to the value we give them in terms of perceived
> brightness, we'll bake the curve into the dts.
>
> The panel also doesn't have a good response under 5%, so we'll avoid
> sending it anything lower than that.
>
> Note: Ideally this patch should be coupled with the driver change from
> "backlight: pwm_bl: Fix interpolation", but it can work without it,
> without looking too ugly.
>
> Signed-off-by: Alexandru Stan <amstan@chromium.org>
> ---
>
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
