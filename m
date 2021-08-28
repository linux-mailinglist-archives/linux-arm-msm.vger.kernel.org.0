Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 813BC3FA63F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Aug 2021 16:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230271AbhH1Ol0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Aug 2021 10:41:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229700AbhH1OlZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Aug 2021 10:41:25 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FBFFC061756
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Aug 2021 07:40:35 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id x10-20020a056830408a00b004f26cead745so11869908ott.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Aug 2021 07:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5YPoL8GlpbFtSNjK3CYZgxgeOeetG15fvTthzuY2WMc=;
        b=iVWEM1beHr4kq2zNmhblRgSN3FGepoKEmyL4yElV1Ctij9bUPoWDx72laKDCLFu0/r
         KdBqgnRmDcf6v/Ut6bhfq+iUmWHKKH/+6ENEJYcmuvHqBzgxRTXrxY7CXN+mhqb0BYfU
         JIsRVh1vXfGNfz3aii0PcBHTgbhBV8sp4cojFlWasi6VWv6L0bLGeflI5Db1Z0SJHC2w
         g+Jz5QDAUPspAB8f6HGy67XQQb3hPKc3WbhQoDFCD7QsmDpRRa2b84fuckfol4OIBBVr
         HzLx4qcl5Sr3DWMjTyBFeWuwHW2HK9iZKjobSIaKa/NcLp9dT05T/EzdUSwKh+OoSMqb
         J4TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5YPoL8GlpbFtSNjK3CYZgxgeOeetG15fvTthzuY2WMc=;
        b=YgM7znXHf4sl0axJLto2/cTULdU5LjZPzPAs47KoOY3Kj1Vr7tpY8vkCEXmGNydfZY
         pwW+9dE2tM96v3wBcN7cbMshR6nmDURIGs7Olxgm0yMIuKfQqk6krPIYYX9/8ZP1gpl1
         GOvzhhK8cA+me6sB7bUpGtqdcEK7EuAvBSq3Zg6f2371rhNb43sIvdMpPwfv4vD8/pFj
         V9AXXfE7hfjSSVfmnApD9ylvZdPO1jlGEmiKZoXWK457jj0wrbpOsXfAO/dJPzXQhOBZ
         eoZTuEbqbAWw4Pcr2eet5r+TK+lpTcSSEgWOnkhiCKRpTVfqd2ztgDM1le4RIYvsGnyP
         UxAQ==
X-Gm-Message-State: AOAM533oMFZoRnZEDSlEKEe2HbTeY/G3az1oS5UcklH+nI708wM6SAk6
        +QNdfKnLPqDWFvRLh6WYDAGANQ==
X-Google-Smtp-Source: ABdhPJzKJsmSdUekZjhIgLwPoay9yS3v22MJnOumK09rmQaevnM2pWN41fMpQJqzK/xbyf2unTc4vw==
X-Received: by 2002:a05:6830:402c:: with SMTP id i12mr12679667ots.287.1630161634668;
        Sat, 28 Aug 2021 07:40:34 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k1sm1942767otr.43.2021.08.28.07.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 07:40:34 -0700 (PDT)
Date:   Sat, 28 Aug 2021 09:40:31 -0500
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
Message-ID: <YSpK3wTUdqlUyJxb@yoga>
References: <20210726231351.655302-1-bjorn.andersson@linaro.org>
 <CAD=FV=UGtHXD==Yy8CVCOioYGb=2hqGQOoNWftD1Jj7OiEp51g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=UGtHXD==Yy8CVCOioYGb=2hqGQOoNWftD1Jj7OiEp51g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 27 Aug 15:52 CDT 2021, Doug Anderson wrote:

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

I thought port 1 was the link to the Type-C controller, didn't give it a
second thought and took the next available.

But per the binding it makes sense that the panel is the "Output
endpoint of the controller" and I guess one will have either a Type-C
controller or a panel - even after the DP rework?

Regards,
Bjorn
