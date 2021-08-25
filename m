Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21CF53F7CFF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Aug 2021 22:05:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242558AbhHYUGM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Aug 2021 16:06:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231421AbhHYUGH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Aug 2021 16:06:07 -0400
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF183C0613C1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Aug 2021 13:05:21 -0700 (PDT)
Received: by mail-oo1-xc2d.google.com with SMTP id v20-20020a4a2554000000b0028f8cc17378so184558ooe.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Aug 2021 13:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/yD6GFocSYAF/+qdR3IWw/sAEDk6He/axJwC6yOCiaw=;
        b=mJ8AgQwirI+leolAZ/cxcSNAjMpABFpjSzk+Wqkp4P44AtzlswwXSb/vn3jZOxitDS
         jTl+c72HhJZJJLWkcFbux6l02F+3+xt9pWiM59pbwbB+c6qwwSy665NcJBj3V1LCGhyQ
         ckr++I01AJTp/DnwmtdcnClK0aoCaLMjs0s1tdj6vY+HQMDWOlEjUediKr7gNo+2nRmE
         CojYKie68hYV0dAe6ZidfcVYGuL5zhxgjjekS/SsRyqSH5iG1rwgUuaFxOvs3dhPf31l
         u66K5BT695XgkTOU0SrAZDE4eEue5+GkQDrgBBT5WAMYoUGpjSD9Tpv2c6FEZrTTCn6q
         tqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/yD6GFocSYAF/+qdR3IWw/sAEDk6He/axJwC6yOCiaw=;
        b=GGiflwuh2kJTINhLF0IbWPbQ+qlwFSRvvT6iv8K6BxjM5o8gK3SYBuLzx9DvXxN6NX
         KMO7LcoKO13WLFEE377tdIM1P92uqP9iVq2WNWohRjWbw1bkzJN2rtphYxKY6iOiipyT
         qLXDq1NiJftGRprt6gENifGU3LoI5H+4VCYzmVMEA4j9QDEIJjQFuTpdTBFyaJyrES3Q
         WYtC3Sr9y72DBuIjR6yi1/j87lkdxYbkErkcHwOAyEv9d1IdoY1CdRk6hZQn/4ILKdjf
         r0yms9ewImvXGPDUyh2wZMN+auCERlLr9kkrFk0D6E+HoU5Wsy3dJXE4cUob41ne6cYz
         Vp9w==
X-Gm-Message-State: AOAM532Nhr9GjVDmndpOugm3y6JLL8nkNUVNQuF/BAr9hmnsknQclj7/
        nx4ATadZIexHy/IIgk2riQcfITshUzbpdA==
X-Google-Smtp-Source: ABdhPJxZ9ib/Ixgf3NwjII25VeGeIGejFPud0i8+B8IRb3QxIP5jgxW5GHM+IYL4Cn/rC11k4CzV2A==
X-Received: by 2002:a4a:9464:: with SMTP id j33mr76130ooi.5.1629921921180;
        Wed, 25 Aug 2021 13:05:21 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 31sm149954oti.63.2021.08.25.13.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 13:05:20 -0700 (PDT)
Date:   Wed, 25 Aug 2021 13:06:36 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Peter Chen <peter.chen@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, agross@kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org,
        wcheng@codeaurora.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 0/3] Implement role-switch notifications from dwc3-drd to
 dwc3-qcom
Message-ID: <YSaizDpqNRZcBGIc@ripper>
References: <20210704013314.200951-1-bryan.odonoghue@linaro.org>
 <20210707015704.GA28125@nchen>
 <YOX6d+sBEJMP4V3q@yoga>
 <20210708030631.GA22420@nchen>
 <YSWCnsZDdp57KBqB@ripper>
 <87zgt65avm.fsf@kernel.org>
 <ce5f12dd-ddc1-6a9c-3dfb-aa44ea166828@linaro.org>
 <YSZned9v1+ajzVx0@ripper>
 <90d17c95-1cf3-89aa-94ad-920e4781f866@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90d17c95-1cf3-89aa-94ad-920e4781f866@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 25 Aug 10:59 PDT 2021, Bryan O'Donoghue wrote:

> On 25/08/2021 16:53, Bjorn Andersson wrote:
> > But in the case of Type-C altmode several of our boards have either an
> > external gpio-based SBU-pin-swapper or some redriver on I2C with this
> > functionality, so we need a way to tell both the PHY and this external
> > contraption about the orientation.
> 
> Its a very similar problem to orientation switch
> 
> As an example
> 
> - redriver may need to fix up signal integrity for
>   lane switching
> 
> - PHY needs to toggle lanes from one IP block to another
> 

Right, conceptually the problem is similar, but IMHO there's a big
difference in that the redriver and PHY are two physically separate
entities - on different buses. The dwc3 glue and core represent the same
piece of hardware.

> I don't think off the top of my head a USB controller or DPU cares much
> about the orientation switch but for argument sake you could add one to that
> list.
> 

Right, downstream the DPU driver is involved in the orientation
switching in the PHY, but upstream this moved into the PHY driver.

> I _think_ the type-c mux layer handles this though, as in what we did on RB5
> has PHY and redriver receiving and reacting to a type-c orientation switch
> both with the existing type-c port driver and the new tcpm.
> 
> + Dmitry - he did the mux work on the PHY and the redriver
> 
> Seems to me that the type-c mux way of diseminating to more than one place
> might fight role-switching well too.
> 

Both works by you the controller using the of_graph to acquire the
handle to _the_ consumer. I'm not aware of any support that would allow
us to signal two separate entities about the mux, orientation or role.

But as I said, for the orientation (at least) we do need to signal two
separate pieces of hardware (and drivers) about the change. Perhaps the
notifier mechanism that Heikki linked to earlier would be sufficient
though (I don't see a problem with probe deferring the redriver until
the type-c controller is registered).

But I don't like the idea of duplicating the rather clumsy of_graph
definition on both the glue node and the core node in DT. Similar to how
we previously had to do extcon in both nodes, and we kept getting that
wrong.

Regards,
Bjorn
