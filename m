Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D6712AA00E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Nov 2020 23:21:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729311AbgKFWTq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Nov 2020 17:19:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728883AbgKFWTn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Nov 2020 17:19:43 -0500
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBDAEC0613CF
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2020 14:19:42 -0800 (PST)
Received: by mail-ua1-x944.google.com with SMTP id y1so872449uac.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2020 14:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NLCsiO9TjoGgxC0blophxfVUgB7zlNdYWu3aSewsL8U=;
        b=PoE2LDCvCjd9a68IojxzjjWvhXcThirPfm6qDX2WRJ2KG+ePtdymrUqF0KirURDPpX
         OnroHjhjWv3e6dA9K/oFgopPmWqjZzFwyQaQtO5HA99UYvYoj/EQw0ElFxuopkMZXRSD
         WagKY36tH3tYTUatAseCS5pDhrwJ/d3y92MNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NLCsiO9TjoGgxC0blophxfVUgB7zlNdYWu3aSewsL8U=;
        b=rSCWHIgTNWdV7yImwwNGs4amgGSQ6UbOs/gBjR8rOnUhRYvW6GBuiDoI5LuYu7/yAr
         apqhqLhlj7WYjzoAAjyHSrYPD3ub1cAvKZVRqmDIf4Ut8MZoVDl3pgKI4gfTLNDwc2W9
         HTiXimSlNTMZBz95PUrbF8F7d67HYzC0NytPhQ++AniQzOKai7KFP1RMnSmlVNWSWSzH
         oxVZBrifOjMc7eqvawt2qdH3HJCtq2fVkX5cI6zBkIkta4nPMDQLcr9z4uDOD0caPC9x
         TyzhW0oeg0uyQ+ZFbdKYwvkMZ0u30zmPmosnE3ryV1FYyM+uIF7joZBiRk1zmGPdKxfg
         6ruw==
X-Gm-Message-State: AOAM533vlKms0Wvr5Q8BJ9qK3z80KlGKQFCfvD2+850XsEuZTLNf9u/H
        JM7ZYzfzmas3vMIsYE0AzaI58dE6G9lMrw==
X-Google-Smtp-Source: ABdhPJwNaHMkYgju0fS7hMYm9eNB/x8Gh1XwQxtl/26RXKq+KDe2dAN4NpXG8/MnLeD/maRIqg53eg==
X-Received: by 2002:ab0:728e:: with SMTP id w14mr2450505uao.74.1604701181909;
        Fri, 06 Nov 2020 14:19:41 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id g7sm335680vsp.25.2020.11.06.14.19.41
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2020 14:19:41 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id l22so1557227vsa.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2020 14:19:41 -0800 (PST)
X-Received: by 2002:a67:1e01:: with SMTP id e1mr2877788vse.49.1604701180750;
 Fri, 06 Nov 2020 14:19:40 -0800 (PST)
MIME-Version: 1.0
References: <20201106140125.v3.1.I5a75056d573808f40fed22ab7d28ea6be5819f84@changeid>
 <20201106140125.v3.2.I0ed4abdd2b2916fbedf76be254bc3457fb8b9655@changeid>
In-Reply-To: <20201106140125.v3.2.I0ed4abdd2b2916fbedf76be254bc3457fb8b9655@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 6 Nov 2020 14:19:28 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UCiBNwtCqVrc0kFDghLsAxZo4NwAoupzXy9m10pwJgpg@mail.gmail.com>
Message-ID: <CAD=FV=UCiBNwtCqVrc0kFDghLsAxZo4NwAoupzXy9m10pwJgpg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sc7180-trogdor: Make pp3300_a
 the default supply for pp3300_hub
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Nov 6, 2020 at 2:01 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> The trogdor design has two options for supplying the 'pp3300_hub' power
> rail, it can be supplied by 'pp3300_l7c' or 'pp3300_a'. The 'pp3300_a'
> path includes a load switch that can be controlled through GPIO84.
> Initially trogdor boards used 'pp3300_l7c' to power the USB hub, newer
> revisions (will) use 'pp3300_a' as supply for 'pp3300_hub'.
>
> Add a DT node for the 'pp3300_a' path and a pinctrl entry for the GPIO.
> Make this path the default and keep trogdor rev1, lazor rev0 and rev1
> on 'pp3300_l7c'. These earlier revisions also allocated the GPIO to the
> purpose of controlling the power switch, so there is no need to limit
> the pinctrl config to newer revisions. Remove the platform-wide
> 'always/boot-on' properties from 'pp3300_l7c' and add them to the
> boards that use this supply. Also delete the 'always/boot-on'
> properties of 'pp3300_hub' for these boards.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>
> Changes in v3:
> - removed 'always-on' and 'boot-on' from 'pp3300_l7c'
> - always pair 'always-on' and 'boot-on' properties
> - removed comment for 'pp3300_hub' 'always-on' and 'boot-on' properties
>
> Changes in v2:
> - added 'always-on' and 'boot-on' properties for new 'pp3300_hub'
> - removed platform-wide 'always-on' property for 'pp3300_l7c'
> - added 'always-on' property to 'pp3300_l7c'  for boards that still
>   use 'pp3300_l7c'
> - delete 'always-on' property of 'pp3300_hub' for boards that still
>   use 'pp3300_l7c'
> - got rid of 'pp3300_hub_7c' label, just use 'pp3300_l7c'
> - fixed position of 'en_pp3300_hub' node to respect ordering
> - updated commit message
>
>  .../boot/dts/qcom/sc7180-trogdor-lazor-r0.dts | 15 ++++++++
>  .../boot/dts/qcom/sc7180-trogdor-lazor-r1.dts | 15 ++++++++
>  .../arm64/boot/dts/qcom/sc7180-trogdor-r1.dts | 15 ++++++++
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  | 34 +++++++++++++++++--
>  4 files changed, 76 insertions(+), 3 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
