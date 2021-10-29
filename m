Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C52AF4405D1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Oct 2021 01:35:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229441AbhJ2Xho (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Oct 2021 19:37:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230504AbhJ2Xhm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Oct 2021 19:37:42 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F862C061714
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Oct 2021 16:35:13 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id n11so7454271oig.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Oct 2021 16:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=PpuLCz4ga4Gy0Gh5NWyC/cRzLKCgj8drSbwewDSyv/8=;
        b=Oypysc3NkHamf8CiPca5foDaX4rg23TW2UfyCEtKHki7XkSRFky2YWN++WJHWmmJfM
         mkbIXUlJiHkGkFVw0c/Wd75fdP21uSCZwExRYIbzXB2Rigp33corJIq+pUtKGGsxtcri
         X/+yJqOEoqN2mgG9ALqWp7+NFJ1ZXJhqcrTLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=PpuLCz4ga4Gy0Gh5NWyC/cRzLKCgj8drSbwewDSyv/8=;
        b=kc2m8BU25a4UUUzmtOCWAMK2brQdpcdWlJy0wO+tntMWkEDXosRwO76LyMmcWAmFwp
         h0W43y98I1PqIksX3gLFZLplNQ80o/OgmpO46ntbt71druIrQ+41aK2AGEO5+ZoANTYs
         kumiEoC1WE1m+C6bjcFYGoOF7w3D35XvndXfq0ZXiRnpC2AxoomENlfk4mZRsyPoEmok
         O3CzPDCweMZV4IxGfKpBkVK+l+fTpN6CrGmAe5yX3WawCGdZ/Tkf5jl89aAR8KQ9Gtyk
         UNWxLwJKMlUmZVaMfbKKnP0oFO9mR53OFh5panX/KfViGO2+B79npQaOWYT4FNcpEWwV
         7l7Q==
X-Gm-Message-State: AOAM530I6zWBJyYCSMgqP0jAfcgaPtWLie7boPpMtqnZVPvqQiABRAQQ
        oiFjYwgYWDO9g+ywfSJ56dusWH4CFo9hldmWpJILkA==
X-Google-Smtp-Source: ABdhPJyWaT+MMZqBwZXfDN3Io0Rslk8aTKIOKmbket2sdZ9RXXz9r/tqr4x0CJsA9ge/fs17qFtWdQqKRcAGi4vSJEk=
X-Received: by 2002:a05:6808:2307:: with SMTP id bn7mr2111471oib.32.1635550512672;
 Fri, 29 Oct 2021 16:35:12 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 29 Oct 2021 18:35:12 -0500
MIME-Version: 1.0
In-Reply-To: <CA+cxXhmswiRa7urqXAtF0r6qtAMs1PVMydqGM49O6koOOfUDdA@mail.gmail.com>
References: <20211029152647.v3.1.Ie17e51ad3eb91d72826ce651ca2786534a360210@changeid>
 <20211029152647.v3.2.If23c83a786fc4d318a1986f43803f22b4b1d82cd@changeid>
 <CAE-0n50JTi+62Nzs+Lc4h4PGDdzEV2Ojm+OD+sqM1LDqC_QSow@mail.gmail.com> <CA+cxXhmswiRa7urqXAtF0r6qtAMs1PVMydqGM49O6koOOfUDdA@mail.gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 29 Oct 2021 18:35:12 -0500
Message-ID: <CAE-0n535BjC_6Q31RBahdDeuEE1WXCJfG=M3ykB75X=5mnLq4A@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] arm64: dts: sc7180: Specify "data-lanes" for DSI
 host output
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

Quoting Philip Chen (2021-10-29 16:24:58)
> Hi Stephen,
>
> On Fri, Oct 29, 2021 at 4:16 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Philip Chen (2021-10-29 15:27:41)
> > > MSM DSI host driver actually parses "data-lanes" in DT and compare
> > > it with the number of DSI lanes the bridge driver sets for
> > > mipi_dsi_device. So we need to always specify "data-lanes" for the
> > > DSI host output. As of now, "data-lanes" is added to ti-sn65dsi86 dts
> > > fragment, but missing in parade-ps8640 dts fragment, which requires
> > > a fixup.
> >
> > I don't see data-lanes required in the schema, and
> > dsi_host_parse_lane_data() seems happy to continue without it. I do see
> > that num_data_lanes isn't set though. Does this patch fix it?
> The problem I see is from dsi_host_attach().
> If there is no "data-lanes" in DT, num_data_lanes would be 0.
> Then dsi_host_attach() would return -EINVAL.

Ok, got it.

>
> >
> > ----8<----
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > index e269df285136..f6fba07220e5 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > @@ -1696,6 +1696,7 @@ static int dsi_host_parse_lane_data(struct
> > msm_dsi_host *msm_host,
> >         if (!prop) {
> >                 DRM_DEV_DEBUG(dev,
> >                         "failed to find data lane mapping, using default\n");
> > +               msm_host->num_data_lanes = 4;
> >                 return 0;
> >         }
>
> I haven't tried.
> But I think it can fix the problem I described above.
> Would you like to send it as a separate patch?
> Or I can do it.

Sure feel free to send it as another patch. Or fix the schema to make
data-lanes required. I think fixing the driver is probably better so
that we don't have to set data-lanes when it's the default 4 lanes. At
least I think 4 lanes is the default.
