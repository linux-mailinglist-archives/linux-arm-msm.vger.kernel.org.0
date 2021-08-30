Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AE8E3FB9A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Aug 2021 18:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237684AbhH3QDH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Aug 2021 12:03:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237659AbhH3QDH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Aug 2021 12:03:07 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 784A7C061575
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Aug 2021 09:02:13 -0700 (PDT)
Received: by mail-io1-xd33.google.com with SMTP id m11so12203839ioo.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Aug 2021 09:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G49FQ0uWZW6i9vFSjQGplZyOwvgazjM4XABr+KXbVDU=;
        b=FgHn+o867IORlJciLs9Bi5TiNrh3rHwcUaE5v5BWRE+D8Ogj7RMwzmHDca7m5f8xyj
         9k6vgOSezNdEwZZ1S0k2a3NC7CqeBjcGdzWdN8NEYaWiFGWtWUCGltPFnCPFQ9udKeno
         Z4/rimxn50hBdSQnCkBaIIuQD78qeLnmmelk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G49FQ0uWZW6i9vFSjQGplZyOwvgazjM4XABr+KXbVDU=;
        b=Myrb7flkaZp22cwcw7yM3THdui/G7+5FosjPUei1NxoPVwAwH4KnO1Z8dc/lFw0I/+
         he8mxBJ40GVR5ipQYpzxompHESkEp/CijsREGOABLV9iWS9GR0ljGMG3pBhhgK5yz3P1
         GOg7J/0iG8tCccHFIKPO25bAkDwh2s0tLnloJALnSymmnLHBL+AI+dhSx1cji/GRv1tf
         /ZdMB4ZxPcVbLClJjie0xQnDpCO0lAyosh7Fg48KjHe9gj0rx1SyMU/qHrx2xyt2RE8x
         0E1DK/yTzQhifZoPqWpkEdTpKRLsUeHSRmhjk8fHiRzrMWOieEHv5K+eSpBbr9CFlwBB
         HevA==
X-Gm-Message-State: AOAM530fvmEEgKinJKCDOD+auzS1bTB7qe3EICDH+/IroRa1voDd1oXY
        PH+M6eji3l7oDHILhU3Vkk45+2MGmYHA9g==
X-Google-Smtp-Source: ABdhPJzOoOTNtHHaP3tacLjjGuXqDCaLfQ6xurstm6bhqrkSN+bRKha1nzOdAjzkL869An7mI/vrrA==
X-Received: by 2002:a02:946d:: with SMTP id a100mr20661042jai.118.1630339332784;
        Mon, 30 Aug 2021 09:02:12 -0700 (PDT)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com. [209.85.166.48])
        by smtp.gmail.com with ESMTPSA id n11sm7984076ioo.44.2021.08.30.09.02.11
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Aug 2021 09:02:12 -0700 (PDT)
Received: by mail-io1-f48.google.com with SMTP id g9so20566251ioq.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Aug 2021 09:02:11 -0700 (PDT)
X-Received: by 2002:a02:c7d2:: with SMTP id s18mr17206234jao.22.1630339331487;
 Mon, 30 Aug 2021 09:02:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210726231351.655302-1-bjorn.andersson@linaro.org>
 <CAD=FV=UGtHXD==Yy8CVCOioYGb=2hqGQOoNWftD1Jj7OiEp51g@mail.gmail.com> <YSpK3wTUdqlUyJxb@yoga>
In-Reply-To: <YSpK3wTUdqlUyJxb@yoga>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 30 Aug 2021 09:01:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=URLJHujmu36sNMfPVMYtDZUirJq5T-PLbeMGqjLuMtNQ@mail.gmail.com>
Message-ID: <CAD=FV=URLJHujmu36sNMfPVMYtDZUirJq5T-PLbeMGqjLuMtNQ@mail.gmail.com>
Subject: Re: [RFC] drm/msm/dp: Allow attaching a drm_panel
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Vara Reddy <varar@codeaurora.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sat, Aug 28, 2021 at 7:40 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Fri 27 Aug 15:52 CDT 2021, Doug Anderson wrote:
>
> > Hi,
> >
> > On Mon, Jul 26, 2021 at 4:15 PM Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> > >
> > > +static int dp_parser_find_panel(struct dp_parser *parser)
> > > +{
> > > +       struct device_node *np = parser->pdev->dev.of_node;
> > > +       int rc;
> > > +
> > > +       rc = drm_of_find_panel_or_bridge(np, 2, 0, &parser->drm_panel, NULL);
> >
> > Why port 2? Shouldn't this just be port 1 always? The yaml says that
> > port 1 is "Output endpoint of the controller". We should just use port
> > 1 here, right?
> >
>
> I thought port 1 was the link to the Type-C controller, didn't give it a
> second thought and took the next available.
>
> But per the binding it makes sense that the panel is the "Output
> endpoint of the controller" and I guess one will have either a Type-C
> controller or a panel - even after the DP rework?

Right, my understanding is that "port 1" is the output port
irregardless of whether you're outputting to a panel or a DP
connector. I think the only case it would make sense to add a new port
is if it was possible for the output to be connected to both a panel
and a DP port simultaneously. ...but that doesn't make sense.

-Doug
