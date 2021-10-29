Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34B1243F742
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Oct 2021 08:34:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232053AbhJ2GhH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Oct 2021 02:37:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230222AbhJ2GhG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Oct 2021 02:37:06 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECD19C061714
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 23:34:38 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id t4so11975067oie.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 23:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=GQ7Y/cBRSLim6Rx9vEWWjTsJPB80yq9sZIwcvs7gvvg=;
        b=k3bLbfKh2BZGGq8q1i8iPyVo3TB1kmbTpSuFslveGQrRVY8WJLpAu3MpbNY5TQIqYn
         F+UzbpGpF46xQ5k52eQhh1SM+a+n/WkgMVExBUwsDZZJSszj+mINu4tXFC9AIQBOLtIs
         deBLZErlM1mgAA2yTQJDneVP+aNHQsCHRZXLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=GQ7Y/cBRSLim6Rx9vEWWjTsJPB80yq9sZIwcvs7gvvg=;
        b=58C73QMQPDImn+5gTPIuIEUkVIBGD5PtxFUchlyu7evMq6RaHv70/nUkv3/uDF4z5E
         LDnziXCSZjdotcdh8ZBdTs7AL+dlJ0oAl8UER42m5XmRscz8bfjPBXp0PNDUqhFq1iQ1
         QSWVsVr5m3aBw2IudPq07xuSwMe3vU1EA+fm6Vmuez5cI5UTU2E5DJohBo6GITQiOuX7
         5UeAa8FZDGRrUmkkETvmyBYtxACH+kv3EEVJVxYVtUQYGz4vjFSCabGNG6m7dmBct9fy
         KnzRa+zr6G5UfuK22KaVuw0JvLRc6UzOU/ADdnUWrcrJuTDoORDJ+xosntS2GupsIopQ
         8Biw==
X-Gm-Message-State: AOAM5333ksnG4BDxVDRfyn8PmIesAvzXlYr+13y/TEUdBPDWVq/9l89j
        w64xlN4TPbr2rYyu1w5D0hFvOeXGqVucgIr3G2h6KQ==
X-Google-Smtp-Source: ABdhPJwm/KO+spYF3fCUYZRIMVRbTzcVCYfzPWRbqmPfNKUDsp9cZJThNvNy9br2eX4E4Vf2AW7jjo0ee5jf117j+q0=
X-Received: by 2002:a05:6808:2124:: with SMTP id r36mr6747996oiw.64.1635489278381;
 Thu, 28 Oct 2021 23:34:38 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 28 Oct 2021 23:34:38 -0700
MIME-Version: 1.0
In-Reply-To: <CA+cxXhnu38eOJtuvHdS0Wyy7LmjmTMn9qjoVOqcNYK3F1xhrmQ@mail.gmail.com>
References: <20211028151022.1.Ie56f55924f5c7706fe3194e710bbef6fdb8b5bc6@changeid>
 <CAE-0n50XwcLBmOBaRiF-qW=R-HfanjviteEzmMDbDuPJruX65g@mail.gmail.com> <CA+cxXhnu38eOJtuvHdS0Wyy7LmjmTMn9qjoVOqcNYK3F1xhrmQ@mail.gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 28 Oct 2021 23:34:38 -0700
Message-ID: <CAE-0n52-DTb17sewUiZ2znQWWexkpf5YbFsBaQdd3Z0n+BZqzw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: sc7180: Support Lazor/Limozeen rev9
To:     Philip Chen <philipchen@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>, dianders@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Philip Chen (2021-10-28 17:48:39)
> Hi Stephen,
>
> On Thu, Oct 28, 2021 at 4:00 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Philip Chen (2021-10-28 15:11:31)
> > > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
> > > index 8b79fbb75756..69666f92176a 100644
> > > --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
> > > @@ -5,13 +5,10 @@
> > >   * Copyright 2020 Google LLC.
> > >   */
> > >
> > > -#include "sc7180.dtsi"
> > > -
> > >  ap_ec_spi: &spi6 {};
> > >  ap_h1_spi: &spi0 {};
> >
> > Can we get rid of this node swap now? I think it is only around because
> > early on we swapped the EC and H1 spi interfaces and then we had to swap
> > it every time we made a new board.
> >
> > $ git grep ap_ec_spi
> > arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi:ap_ec_spi: &spi6 {};
> > arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi:ap_ec_spi: &spi6 {};
> > arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi:ap_ec_spi: &spi6 {};
> > arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts:ap_ec_spi: &spi6 {};
> >
> > It feels like we'd be better off leaving that quirk in trogdor-r0, which
> > conveniently isn't upstream, and then relabel the spi nodes in
> > sc7180-trogdor.dtsi now. Otherwise I look at this and have to remember
> > that whenever this dtsi file is included, we've already included the
> > sc7180.dtsi file before it, so that the relabel actually works.
>
> I agree it'll be great if we can get rid of the node swap.
> It's out of the scope of this patch series though.
> We should probably send a separate patch for this change later?
>

Ok.
