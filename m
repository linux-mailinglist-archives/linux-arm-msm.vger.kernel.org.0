Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37AE03FF730
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Sep 2021 00:33:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236148AbhIBWeY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Sep 2021 18:34:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231642AbhIBWeW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Sep 2021 18:34:22 -0400
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AAE4C061575
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Sep 2021 15:33:23 -0700 (PDT)
Received: by mail-il1-x132.google.com with SMTP id z2so3462071iln.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Sep 2021 15:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vEOAhsHQM9G+tVvC78A/rhgecetN4byQdhrLLpo0P0g=;
        b=LDmJnOglDM6SRfrqk879nlvltfZEhwju/ts9Exu/2rE0XB+Lj74aGi7ZCLry1NSj0f
         btPQfuDa+Q2ntfjL+zK+k6leKrLg6ahv0/pjTn7Y3JJbbdq5v55q2XUGEdXr0VDSURWz
         zo/R1rY1OagPqlvLvu4Emr9cTHgcwBCjlU/VE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vEOAhsHQM9G+tVvC78A/rhgecetN4byQdhrLLpo0P0g=;
        b=KEDHMF9pnzzJImhslw+JtDU2SwjeKfKSeuKaToMdg19KTTnol9jR02bFvI6n2iKtmt
         o6RBJ2uDBpdAveDYWRxUigqCmIdkievWbQFsQrv784toyqRq1Ngsz0vd+v3vdJUj7nJe
         zKZD3+wA9aAFPPzxcr8aewzqG4PQC1QkMVoVPEFYcWxP29S7bCCWSHXGESpx8jv1uWkw
         4fLd7gdIsLBTCWwTrC+sq3ZY/PgBo+sUDnG3W3upCTIUESJanuNSmffho2Dp6EM2WRZK
         eQd4f8//ynmS3bI2ttRKlpVK5YfyxBeOntO8rVOxko/wvQPd3QhXHbR8qFZelGAlYNJc
         yHjg==
X-Gm-Message-State: AOAM530zjMXet/M5C9NqW6loNNKLXYxaJHssXesPxkAHOAW2ktA+TJbL
        rQQwBNMWbr5bufYfBD8IdpJbr/RLGo8Tpw==
X-Google-Smtp-Source: ABdhPJyU+9Tcoq/Va6pj4akOvjuNeJOoxQFODcTTrH0WSAKyrEaDU8aZVCHQ4Ql8bltndbJvIAEOeA==
X-Received: by 2002:a92:de4b:: with SMTP id e11mr348565ilr.22.1630622001219;
        Thu, 02 Sep 2021 15:33:21 -0700 (PDT)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com. [209.85.166.174])
        by smtp.gmail.com with ESMTPSA id t17sm1615205iln.24.2021.09.02.15.33.19
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Sep 2021 15:33:20 -0700 (PDT)
Received: by mail-il1-f174.google.com with SMTP id v16so3415895ilo.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Sep 2021 15:33:19 -0700 (PDT)
X-Received: by 2002:a92:cf4a:: with SMTP id c10mr329106ilr.269.1630621999435;
 Thu, 02 Sep 2021 15:33:19 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20210902221015eucas1p26fae8f6ba4c70087dc7b007a271dce4b@eucas1p2.samsung.com>
 <20210901201934.1084250-1-dianders@chromium.org> <b1b67791-69b7-a5c0-9e98-73bb82afaeaa@samsung.com>
In-Reply-To: <b1b67791-69b7-a5c0-9e98-73bb82afaeaa@samsung.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 2 Sep 2021 15:33:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W+7gReePki1kgxwxMTXEeeCoaFm1C63EcV+YOP7kayGA@mail.gmail.com>
Message-ID: <CAD=FV=W+7gReePki1kgxwxMTXEeeCoaFm1C63EcV+YOP7kayGA@mail.gmail.com>
Subject: Re: [PATCH v3 00/16] eDP: Support probing eDP panels dynamically
 instead of hardcoding
To:     Andrzej Hajda <a.hajda@samsung.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-mips <linux-mips@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-sunxi@lists.linux.dev,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
        =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Sep 2, 2021 at 3:10 PM Andrzej Hajda <a.hajda@samsung.com> wrote:
>
> Removed most CC: SMTP server protested.

Yeah, it was because of the dang defconfig patches. My general policy
is to send the cover letter to everyone even if not everyone gets CCed
on all patches, but it ended up as a lot... Speaking of which, I'd
definitely be interested in your take on the defconfig topic:

https://lore.kernel.org/r/CAD=FV=WPXAUyuAHb1jKx9F_aw+JGX4MWB3or=Eq5rXoKY=OQMw@mail.gmail.com

Do you agree with Olof that I should set the "default" for the new
config to be the same as the old config? It doesn't make sense going
forward but it helps for anyone with old configs...


> On 01.09.2021 22:19, Douglas Anderson wrote:
> > The goal of this patch series is to move away from hardcoding exact
> > eDP panels in device tree files. As discussed in the various patches
> > in this series (I'm not repeating everything here), most eDP panels
> > are 99% probable and we can get that last 1% by allowing two "power
> > up" delays to be specified in the device tree file and then using the
> > panel ID (found in the EDID) to look up additional power sequencing
> > delays for the panel.
> >
> > This patch series is the logical contiunation of a previous patch
> > series where I proposed solving this problem by adding a
> > board-specific compatible string [1]. In the discussion that followed
> > it sounded like people were open to something like the solution
> > proposed in this new series.
> >
> > In version 2 I got rid of the idea that we could have a "fallback"
> > compatible string that we'd use if we didn't recognize the ID in the
> > EDID. This simplifies the bindings a lot and the implementation
> > somewhat. As a result of not having a "fallback", though, I'm not
> > confident in transitioning any existing boards over to this since
> > we'll have to fallback to very conservative timings if we don't
> > recognize the ID from the EDID and I can't guarantee that I've seen
> > every panel that might have shipped on an existing product. The plan
> > is to use "edp-panel" only on new boards or new revisions of old
> > boards where we can guarantee that every EDID that ships out of the
> > factory has an ID in the table.
> >
> > Version 3 of this series now splits out all eDP panels to their own
> > driver and adds the generic eDP panel support to this new driver. I
> > believe this is what Sam was looking for [2].
> >
> > [1] https://lore.kernel.org/r/YFKQaXOmOwYyeqvM@google.com/
> > [2] https://lore.kernel.org/r/YRTsFNTn%2FT8fLxyB@ravnborg.org/
> >
> I like the idea - if something can be configured dynamically lets do it.
> But I have few questions:
> 1. Have you read different real panels id's? In many cases (MIPI DSI,
> LVDS with EDID) manufacturers often forgot to set proper id fields. I do
> not know how EDID's ids are reliable in case of edp panels.

I have read several and (so far) they have been quite reliable but I
will admit that I haven't done an exhaustive sample. I guess my answer
to whether we can trust it is:

a) Presumably you'd only use this new "edp-panel" compatible on
systems whose panel IDs are known to be reliable. Old systems can keep
determining the panel by compatible string. The two schemes can
co-exist.

b) As we start using this new scheme then there will be more
validation of panel ID strings and, presumably, they will become more
reliable.

It is still true that ID conflicts could exist. A vendor could ship
two different panels with the same ID and maybe nobody would notice
because they weren't ever hooked up to the same board. In that case
we'd have a question of what to do upstream. If this really happens
then I suppose (worst case) we could use the device tree to help
differentiate and each board could say that "panel ID <x> hooked up to
this board is actually panel <y>". I hope we don't have to do that
because it feels dirty, but at least it gives us _something_ if we get
backed into a corner.


> 2. You are working with edp panels - beside EDID they have DPCD which
> contains things like IEEE_OUI and "Device Identification String", I
> guess they could be also used for detecting panels, have you considered
> it? I think DPCD Id should be assigned to EDP-Sink interface, and EDID
> Id to the actual panel behind it. With this assumption one could
> consider which timings should be property of which entity.

This could be another way to help us if we're backed into a corner in
the future. Right now the driver requires that you give access to a
full eDP AUX bus to use the "generic eDP" panel support even though it
currently only relies on the EDID, so it would be pretty easy to
utilize this info in the future. So far the ID has been reliable for
me though.


-Doug
