Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BED413FA0F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Aug 2021 22:59:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231723AbhH0VAg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Aug 2021 17:00:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231664AbhH0VAg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Aug 2021 17:00:36 -0400
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E467C0613D9
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Aug 2021 13:59:47 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id b7so10243424iob.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Aug 2021 13:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aXHt+zBvV2P2yRdRsCvTblJhainZty6Jg0vDCbYmK8M=;
        b=FV8wBmGYU5sDobyYYnQpOECTKrYkK8EB7/GlKxGqyLstGxzDaWlP7jlTT05tsDEu9N
         m3ODA5TwhdedwETDFIuIUoqNe6jBe53IH7JlysQzvDipyp3WcCIgWyE2nSumqs3jqm+E
         Zr7wV9fgaErAPWv/uxHyXK5/YaePil/2i1r98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aXHt+zBvV2P2yRdRsCvTblJhainZty6Jg0vDCbYmK8M=;
        b=g7o/cPJoPSmNpQAfpiNfxrhfn3mOueNhxApxz9LUe0l4NhR4wKIe/7zgypQdxMkA9j
         Pdfy2j4EK3lt8z8xu0SXq8kNXEiM4bL9jx3IJ3zPmQHGvOfv5UgReam99dlrcvLbQAfC
         HvYtUSa7npXFUfnbhW/nvOt978mZylcM5K6iOgDC95Xb05lyty4a1G1v+TkAm3cks2Nw
         QVK0IKae0OO+3H+H5qzNoNVAhBLtJPIXpZqGRT/3St2zcbhp/hmFsDhDMV914GslTOgJ
         nVyewPzpuRU+yU2hJsYlSAzLovuZN3x+4u2IjZSX9R8g/MRvfjl0do8AkPJrx4o7gekY
         0V3A==
X-Gm-Message-State: AOAM533NDsZCAiZZPOjHVZM3MBT99N1d/49u4Yvy3B0YU6u5JCrgNn2F
        1KKzVX865s3adKC7sl0XAuQBx9zTZId68g==
X-Google-Smtp-Source: ABdhPJyqLLp+UILrJVnfWeYRD49z9dNOXMeilWAQ04zrewZqlFY+PaLfhIAnOKySZ+DV9ayAA+APiA==
X-Received: by 2002:a05:6638:c4d:: with SMTP id g13mr1292616jal.43.1630097986611;
        Fri, 27 Aug 2021 13:59:46 -0700 (PDT)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com. [209.85.166.175])
        by smtp.gmail.com with ESMTPSA id a17sm4357674ilm.27.2021.08.27.13.59.46
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Aug 2021 13:59:46 -0700 (PDT)
Received: by mail-il1-f175.google.com with SMTP id j15so8342344ila.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Aug 2021 13:59:46 -0700 (PDT)
X-Received: by 2002:a92:a008:: with SMTP id e8mr7587200ili.187.1630097542564;
 Fri, 27 Aug 2021 13:52:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210726231351.655302-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210726231351.655302-1-bjorn.andersson@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 27 Aug 2021 13:52:10 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UGtHXD==Yy8CVCOioYGb=2hqGQOoNWftD1Jj7OiEp51g@mail.gmail.com>
Message-ID: <CAD=FV=UGtHXD==Yy8CVCOioYGb=2hqGQOoNWftD1Jj7OiEp51g@mail.gmail.com>
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

On Mon, Jul 26, 2021 at 4:15 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> +static int dp_parser_find_panel(struct dp_parser *parser)
> +{
> +       struct device_node *np = parser->pdev->dev.of_node;
> +       int rc;
> +
> +       rc = drm_of_find_panel_or_bridge(np, 2, 0, &parser->drm_panel, NULL);

Why port 2? Shouldn't this just be port 1 always? The yaml says that
port 1 is "Output endpoint of the controller". We should just use port
1 here, right?

-Doug
