Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 282303B7528
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jun 2021 17:28:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234792AbhF2Paw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Jun 2021 11:30:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234802AbhF2Pav (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Jun 2021 11:30:51 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11E70C061787
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jun 2021 08:28:24 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id g24so12690328pji.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jun 2021 08:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VuuCdU8uAmKGBo8SImwfisVY2Ba0hcixfgMHcrixL7o=;
        b=AKt8HPsPsJ2ywzYB8tqCs5F9/z9DqNbOFY13/dcY+xCSNrsNs6CYe5lT+IWiyMvkfG
         fFwovFSVwNF/Hnu1M4O3dYwOKtkE/u7irgBvBu7A0XYi02tOP7U4A0+8DrPRZVw2K7cZ
         MJGvGNqOh1JkWlbazcA1e1itTxT2tqNkDkqdQUy5TgY84UAr/uuZx1JtTnnrt+G9o5wq
         hUnaEYBV9xyOXdRMGFXj4Van+AFQU+JUqO5srbSsJNLmT38fjNAJJTJZAXSoHyve4mVV
         KbLLcF9YxEl0MT893LOlU/erZSMAIDOMX9WwMWGxADL81IrjIpveSAoNjHvHzEFuV4gh
         nkZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VuuCdU8uAmKGBo8SImwfisVY2Ba0hcixfgMHcrixL7o=;
        b=OCijMQELqPGtkR+4EXhslVHf9040NKj9oUB42D+YHnviKSjZ5xjtKQ5O7oG0P7O6M6
         +wksXuxyTt1yIyeQBbSGQo6pYuY4keV3oRXHKPjNUAPwmJDk5owozWiAZT700Ad61k7o
         PgVBACZE86FhEX2dC3HVBVbOlwpr/8/A+QkOr9zMhmqlV+b4bljBDwmVKsFNXIK16agA
         1gSOIjvN/U7xVVybkHEjUgCtZynOMSAGiD68ha/cHnH/fIOMtNTUonMNJJFW1SrN+wXm
         rQSnWu8zNhy9XH9hkOJ1G7TEBJop5YfZirjE6aEsjxsdFEakuKOzHxJBYh4j1W/2ftVb
         DW9A==
X-Gm-Message-State: AOAM533koBslpdFHVJdD8w82iJePmkkT31TOftladRyrmb7nCgzsg1I0
        v2730hzxHs9+dhIWNZjVQiLV
X-Google-Smtp-Source: ABdhPJzNywL9BPuI+wsO40c0iGHp9swihEt0eL3tAyyRzrd+pc0kOG4MJpi2KK1UBS2vhuxCv/2jxQ==
X-Received: by 2002:a17:90a:390d:: with SMTP id y13mr43719932pjb.133.1624980503512;
        Tue, 29 Jun 2021 08:28:23 -0700 (PDT)
Received: from workstation ([120.138.12.32])
        by smtp.gmail.com with ESMTPSA id cs1sm3420299pjb.56.2021.06.29.08.28.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Jun 2021 08:28:22 -0700 (PDT)
Date:   Tue, 29 Jun 2021 20:58:19 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, thara.gopinath@linaro.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: aoss: Fix the out of bound usage of
 cooling_devs
Message-ID: <20210629152819.GC3580@workstation>
References: <20210628172741.16894-1-manivannan.sadhasivam@linaro.org>
 <YNpVMvhEfrz9EqyO@google.com>
 <20210629042558.GA3580@workstation>
 <YNsrcHOf90rZl44z@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YNsrcHOf90rZl44z@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 29, 2021 at 07:17:20AM -0700, Matthias Kaehlcke wrote:
> On Tue, Jun 29, 2021 at 09:55:58AM +0530, Manivannan Sadhasivam wrote:
> > On Mon, Jun 28, 2021 at 04:03:14PM -0700, Matthias Kaehlcke wrote:
> > 
> > [...]
> > 
> > > 
> > > 
> > > A few more previous lines of code for context:
> > > 
> > >   int count = QMP_NUM_COOLING_RESOURCES;
> > > 
> > >   qmp->cooling_devs = devm_kcalloc(qmp->dev, count,
> > >                                    sizeof(*qmp->cooling_devs),
> > >                                    GFP_KERNEL);
> > > 
> > > I would suggest to initialize 'count' to 0 from the start and pass
> > > QMP_NUM_COOLING_RESOURCES to devm_kcalloc() rather than 'count',
> > > instead of resetting 'count' afterwards.
> > 
> > Yeah, I thought about it but the actual bug in the code is not resetting
> > the count value to 0. So fixing this way seems a better option.
> 
> I don't agree that it's the better option. IMO it's clearer to pass
> the constant QMP_NUM_COOLING_RESOURCES directly to devm_kcalloc(),
> rather than giving the impression that the number of allocated items
> is variable. Repurposing variables can be confusing and led to this
> bug. Also the resulting code doesn't need to re-initialize 'count'.

I don't dis-agree with you on this :) Let me send v2 incorporating the
comments.

Thanks,
Mani
