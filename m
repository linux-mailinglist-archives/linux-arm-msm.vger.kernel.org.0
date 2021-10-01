Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E4F841F696
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 23:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232084AbhJAVCY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 17:02:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbhJAVCX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 17:02:23 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC479C061775
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Oct 2021 14:00:38 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id o59-20020a9d2241000000b0054745f28c69so13029719ota.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Oct 2021 14:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NC9cmhLrHdckMuK/r28TvZNjmeIVCX8ECTisIPvM3VE=;
        b=XimCMpcHPEIPcAavsLIBQ7e4UqLEpKZsP5a1nMGqsGf5ozPAwSgkjCn3bwUoBZRJKG
         38ks49GU17lkYI2bUN0zLpXw9zF9ykNXYAGdQOR6LoXpO9e6e7Qk22Vt0qU7gX8ejinL
         9vTstYflDVB0JcqkSbf+/tuaA1by6r7A2zhQkDqQdZyrw0wphZmwvBATHJcr7X6uHDtO
         4e+5tVG7WGVxi3W7EEG8Sv/2kLYkWsUa3qMSPzEieSJ56Ux7OgiTsVd40kvXZvD1GFwA
         yRKjcpF1mNHBtiF7/rZkhigpYnHR6SvtN76kF3sXuZKVzyg8PBs9ClyTcUmqq/SWXvAt
         K4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NC9cmhLrHdckMuK/r28TvZNjmeIVCX8ECTisIPvM3VE=;
        b=xEdDiXhbIMqI0QzKrxWYHeNDiMApHj3aG0G5VIZzY+ZMTK+V1f3ZCaBUg2vQS/SwRB
         wqzev+3hDr1PbKU0/9J3PY3ya7tAa8EFsT2PjQztQtkU87R73SL1A2psRGAL56WWDyJt
         V3uvt1B2LCsfFs89m2ZecOii2wVREXgL55CWwk8KlY3OZY4dQnBQDKv9ns3UoZ6eSHaL
         sGMAOWpXCdjHk9gR1G0XXk6ITvAInzsL0FOr6lyQihsBzO2tj0DBgWLZJAqFwGX35ZPV
         w0qPzX1Iq5B0+m2LGqhRkL+MFBsbIAvVjbhu6YfLJk/4dqZRaBKHA4bHXhUJPB21qcEP
         o/Hw==
X-Gm-Message-State: AOAM532jNl/olV77WmxdYyJN1ixa7f3b03IxR1NhWNbyjJAGU7xEQNQb
        zuRufWAui50/hMMedhliSpujJw==
X-Google-Smtp-Source: ABdhPJwoHN/UBWInkMgxVgelTcg9Ak/uofV+tp/je2/pG4B/t/W7LZ0cC6Rvth9aFQh6/JZINgrG/Q==
X-Received: by 2002:a9d:6396:: with SMTP id w22mr18800otk.26.1633122038272;
        Fri, 01 Oct 2021 14:00:38 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id j24sm539724otq.72.2021.10.01.14.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 14:00:37 -0700 (PDT)
Date:   Fri, 1 Oct 2021 14:02:25 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Doug Anderson <dianders@chromium.org>
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
Subject: Re: [RFC] drm/msm/dp: Allow attaching a drm_panel
Message-ID: <YVd3YdfgFVc0Br5T@ripper>
References: <20210726231351.655302-1-bjorn.andersson@linaro.org>
 <CAD=FV=UGtHXD==Yy8CVCOioYGb=2hqGQOoNWftD1Jj7OiEp51g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=UGtHXD==Yy8CVCOioYGb=2hqGQOoNWftD1Jj7OiEp51g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 27 Aug 13:52 PDT 2021, Doug Anderson wrote:

> Hi,
> 
> On Mon, Jul 26, 2021 at 4:15 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > +static int dp_parser_find_panel(struct dp_parser *parser)
> > +{
> > +       struct device_node *np = parser->pdev->dev.of_node;
> > +       int rc;
> > +
> > +       rc = drm_of_find_panel_or_bridge(np, 2, 0, &parser->drm_panel, NULL);
> 
> Why port 2? Shouldn't this just be port 1 always? The yaml says that
> port 1 is "Output endpoint of the controller". We should just use port
> 1 here, right?
> 

Finally got back to this, changed it to 1 and figured out why I left it
at 2.

drm_of_find_panel_or_bridge() on a DP controller will find the of_graph
reference to the USB-C controller, scan through the registered panels
and conclude that the of_node of the USB-C controller isn't a registered
panel and return -EPROBE_DEFER.

So I picked 2, because I'm not able to figure out a way to distinguish
between a not yet probed panel and the USB-C controller...

Any suggestions?

Regards,
Bjorn
