Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72199421B2C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 02:36:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbhJEAiP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 20:38:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbhJEAiP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 20:38:15 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95F11C061749
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Oct 2021 17:36:25 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id z184so9218764iof.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Oct 2021 17:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cIEfmhHMWRR+UfbfarKixY0VfYOQ7qrc2Yu2ffv5Aws=;
        b=HVKYKpLYZsQ9UTyyVy1Vf68F9k+FOnBn7+9LJBhoCIDGj4DtpqnbiLLEuHoP7URbRu
         yWbC7e48enorTEgwAc9q+sBTCplD/Nk3G42Ixoy6VrM2x9T1VsqUikRntsEX0fSkrzfT
         mapzJmRojmYesEyumCJd5at2lucUUJNvK2HSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cIEfmhHMWRR+UfbfarKixY0VfYOQ7qrc2Yu2ffv5Aws=;
        b=1ZsuzTHZb4DNmRNNB/HIof2fQkJn3LYKyjxAvGoDUq574/7jn+4hvQgZ4sqcX87ltu
         yKnKrYdmKHxLiL4xQOBjX7Dnd8bF10kpgGVzqmYdcXC5EPNVW6ascZcaRzrBCOzLVweO
         JJw+Jn4jFwFiWpYBCttiYWfcBClW90JQUdYXy2lzKl3iGDqDJ01zBN6etJFh7gwObTbY
         SqQZU+6iJU9gYgSL05U0WMGzAJ5mn6U3yqozyCdRegONaBm6dKAiKw4hD0cD+/cW49RM
         +eCrj7JNmSPjHfxCIFR9ciNy8PUBHWXGSt9AQqEQlMrPUX7Xvkj5BIEHUJ9SQdi6Pist
         lDKA==
X-Gm-Message-State: AOAM5301w9aMbfeQtYs7iywzxy35Maje51iX6otwSC/95GgdrZpekZOR
        08yhuwEmXC/nqj76fKodBCsIwhNEeXYjbQ==
X-Google-Smtp-Source: ABdhPJyltT7JD+1Gqrn6A9Yz1lq/WcG0wLIxbBzcVuCZKWpxZ9mFmXmhiqAZMzfyyl5aURE0M9wKYA==
X-Received: by 2002:a6b:6f0a:: with SMTP id k10mr125546ioc.101.1633394184914;
        Mon, 04 Oct 2021 17:36:24 -0700 (PDT)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com. [209.85.166.45])
        by smtp.gmail.com with ESMTPSA id b6sm9350842iod.55.2021.10.04.17.36.23
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Oct 2021 17:36:23 -0700 (PDT)
Received: by mail-io1-f45.google.com with SMTP id h129so22433296iof.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Oct 2021 17:36:23 -0700 (PDT)
X-Received: by 2002:a02:c7d2:: with SMTP id s18mr175853jao.68.1633394182579;
 Mon, 04 Oct 2021 17:36:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210726231351.655302-1-bjorn.andersson@linaro.org>
 <CAD=FV=UGtHXD==Yy8CVCOioYGb=2hqGQOoNWftD1Jj7OiEp51g@mail.gmail.com> <YVd3YdfgFVc0Br5T@ripper>
In-Reply-To: <YVd3YdfgFVc0Br5T@ripper>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 4 Oct 2021 17:36:10 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U=xVLuKOYHbGPTkLjGa8_U+F1ZtEvJt4LGaRuR5SsKFw@mail.gmail.com>
Message-ID: <CAD=FV=U=xVLuKOYHbGPTkLjGa8_U+F1ZtEvJt4LGaRuR5SsKFw@mail.gmail.com>
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

On Fri, Oct 1, 2021 at 2:00 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Fri 27 Aug 13:52 PDT 2021, Doug Anderson wrote:
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
> Finally got back to this, changed it to 1 and figured out why I left it
> at 2.
>
> drm_of_find_panel_or_bridge() on a DP controller will find the of_graph
> reference to the USB-C controller, scan through the registered panels
> and conclude that the of_node of the USB-C controller isn't a registered
> panel and return -EPROBE_DEFER.

I'm confused, but maybe it would help if I could see something
concrete. Is there a specific board this was happening on?

Under the DP node in the device tree I expect:

ports {
  port@1 {
    reg = <1>;
    edp_out: endpoint {
      remote-endpoint = <&edp_panel_in>;
    };
  };
};

If you have "port@1" pointing to a USB-C controller but this instance
of the DP controller is actually hooked up straight to a panel then
you should simply delete the "port@1" that points to the typeC and
replace it with one that points to a panel, right?

-Doug
