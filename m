Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A2B243F420
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Oct 2021 02:48:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231468AbhJ2AvT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 20:51:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231461AbhJ2AvT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 20:51:19 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6227BC061714
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 17:48:50 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id a129so6789347yba.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 17:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RR10NcdVnk1TXpaY9k+McyemxyXRCAjJsI5p8UJyeEE=;
        b=je1Q1O+E+IAMH50n6kSYsYBq9DP2BbOqvwHFjhTQwTnTpPDQW/KLax+sy3hh1Ti83A
         KBvlt0NDKjloxRzR46VYgbrCrj92wJfs3v7xQ4kAwamgXAy8ntZsv90ahoYFtM6FZZdm
         SjY0gcrVltLksvtwLXhUsPPxvyrEHQalRHfY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RR10NcdVnk1TXpaY9k+McyemxyXRCAjJsI5p8UJyeEE=;
        b=cipcF7HrlOUX6LYsUu5mJOJpHUMZwYOTyn9O0GMCrdNEm6VEG+osUgLbcEQV0ym6yP
         lMGyMccV2QU1ciIyo80is4+0GPMfMky7e33KVcH2motnqIYF5pRvPJCTKsP9XKh6jlEn
         78DQ+iI3MH9mmbIr+hLGFBdH7Fmn4jNgDSqaMF3O17fUdZN+2L09ecpLgud96twXgk2S
         uDrMNXLXKxs1L4ame1Bd97WP0oB6k2wMbYGTm375Pk9arriKUr9o4eeppHeJYWIy9hjO
         kUx8ehtzYebiBGiTYtQvxn+deS3Ca991HpYjFnv2Xwg0AmM7hqWLfhqYID8hreMwKi9H
         V4kw==
X-Gm-Message-State: AOAM531xTJ9QaJJvSQ+qwdEIOrFJ1ZDPYVcfzVLA2nLxFewTVF7+t1wQ
        3v1Qn4A7Ge37z+q25fEhtN/jBXOM5lywdGU7eD+ohg==
X-Google-Smtp-Source: ABdhPJzD4b97WCfq3smhAQB1MAvemDvB1d9B3h0Ln65gRGIoRqbA0/LnneC7xpA4e6pDgx19TQrwGNOZjnx7kLhiOxk=
X-Received: by 2002:a25:bfce:: with SMTP id q14mr4166387ybm.508.1635468529683;
 Thu, 28 Oct 2021 17:48:49 -0700 (PDT)
MIME-Version: 1.0
References: <20211028151022.1.Ie56f55924f5c7706fe3194e710bbef6fdb8b5bc6@changeid>
 <CAE-0n50XwcLBmOBaRiF-qW=R-HfanjviteEzmMDbDuPJruX65g@mail.gmail.com>
In-Reply-To: <CAE-0n50XwcLBmOBaRiF-qW=R-HfanjviteEzmMDbDuPJruX65g@mail.gmail.com>
From:   Philip Chen <philipchen@chromium.org>
Date:   Thu, 28 Oct 2021 17:48:39 -0700
Message-ID: <CA+cxXhnu38eOJtuvHdS0Wyy7LmjmTMn9qjoVOqcNYK3F1xhrmQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: sc7180: Support Lazor/Limozeen rev9
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>, dianders@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen,

On Thu, Oct 28, 2021 at 4:00 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Philip Chen (2021-10-28 15:11:31)
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
> > index 8b79fbb75756..69666f92176a 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
> > @@ -5,13 +5,10 @@
> >   * Copyright 2020 Google LLC.
> >   */
> >
> > -#include "sc7180.dtsi"
> > -
> >  ap_ec_spi: &spi6 {};
> >  ap_h1_spi: &spi0 {};
>
> Can we get rid of this node swap now? I think it is only around because
> early on we swapped the EC and H1 spi interfaces and then we had to swap
> it every time we made a new board.
>
> $ git grep ap_ec_spi
> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi:ap_ec_spi: &spi6 {};
> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi:ap_ec_spi: &spi6 {};
> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi:ap_ec_spi: &spi6 {};
> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts:ap_ec_spi: &spi6 {};
>
> It feels like we'd be better off leaving that quirk in trogdor-r0, which
> conveniently isn't upstream, and then relabel the spi nodes in
> sc7180-trogdor.dtsi now. Otherwise I look at this and have to remember
> that whenever this dtsi file is included, we've already included the
> sc7180.dtsi file before it, so that the relabel actually works.

I agree it'll be great if we can get rid of the node swap.
It's out of the scope of this patch series though.
We should probably send a separate patch for this change later?

>
> >
> >  #include "sc7180-trogdor.dtsi"
> > -#include "sc7180-trogdor-ti-sn65dsi86.dtsi"
> >
> >  &ap_sar_sensor {
> >         semtech,cs0-ground;
