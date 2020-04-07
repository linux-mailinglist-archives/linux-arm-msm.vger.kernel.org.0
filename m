Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D79DE1A1897
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 01:26:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbgDGX05 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Apr 2020 19:26:57 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:36069 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726386AbgDGX04 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Apr 2020 19:26:56 -0400
Received: by mail-pl1-f196.google.com with SMTP id g2so1824589plo.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2020 16:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=y5LS3MU2ajrGhRzRJXtmecDXDze15/f8wGbcQHqh5n4=;
        b=NmOHvzswUt9XYTE1FH4pjMmmWuJs4RiOc30XXNe/xawQjAVjxF4k/O55uZbflAP5xM
         Cp6qLKTEtUR08ztRXxhoxXQwdkviEYF6dxtYh3Wsj+o+3nZYQ7xU8rFfKOhcZk+Bhpi4
         HP77kgIUYAYgSknWgI4gvHP0DUvuUf7JCBS8hsEq7nffrAmL0nVkPQaYeiOygFEkzl5N
         Xr+erFsD2lXoxBmsReXKP0EOl2MT2F927ooDWplLYCf2yJeovnK18pDwJ9cmht2aFcQ9
         X5+ayPRdsmUfBW4r2RobojK4RPdw7PUgVsjP2Sa/7mBENcUociKnoa7TEd1ltawkCZDl
         0T3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=y5LS3MU2ajrGhRzRJXtmecDXDze15/f8wGbcQHqh5n4=;
        b=YuUYc+VrTiywBmwGYR/QJ4+Ara+RaJHzgbNf/NvjOvbuKYIw/eo02dbOHfJrVnjndV
         DfASn6qnNVqgiB2GIrHY8SmueyMu+KnLkhilAZ+KeWsRHcrS/bxIeYx8GvHdnQdhfYk9
         Wkn3JO166/Ai/CjuMNLDGmD52tltjyKXYr/Ws7vKaLCdujh92/zgq0cd3aVvdREbDwmQ
         1e9uTMsVl6KKNUI2cxHAHAoLwjZqIM5ZmSstpBmKWoxm5J0BNcHbx6TCvS9HWZu5kcJR
         GhoakZNO0SXSmm7HJ4HDVtuJsi6wP3PrXBNkjFIBx05Iynu8REUQntuhkMw6AXLrXGGu
         MgfA==
X-Gm-Message-State: AGi0PubPjh1i0qR1VRcZj04dvTMUttjN1RRuDeHWBVx5oMOnGvBSpIPe
        MVKQlLDg5mx5kDwXlVnTSd+n6Q==
X-Google-Smtp-Source: APiQypKoPhJDW9jWO0if0qrlkO0oFu9JmnbT7a7/ETHNk4nvDKag6Odi3YwvY66/1Ba6oswXw3zGYA==
X-Received: by 2002:a17:90a:be0b:: with SMTP id a11mr1977543pjs.56.1586302014257;
        Tue, 07 Apr 2020 16:26:54 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q12sm14143932pgi.86.2020.04.07.16.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 16:26:53 -0700 (PDT)
Date:   Tue, 7 Apr 2020 16:26:59 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     rishabhb@codeaurora.org
Cc:     Siddharth Gupta <sidgup@codeaurora.org>, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, linux-remoteproc-owner@vger.kernel.org
Subject: Re: [PATCH 2/2] remoteproc: core: Prevent sleep when rproc crashes
Message-ID: <20200407232659.GM20625@builder.lan>
References: <1582164713-6413-1-git-send-email-sidgup@codeaurora.org>
 <1582164713-6413-3-git-send-email-sidgup@codeaurora.org>
 <20200407222958.GL20625@builder.lan>
 <c98b9b02c49b41c6e2493407f11c5eac@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c98b9b02c49b41c6e2493407f11c5eac@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 07 Apr 15:59 PDT 2020, rishabhb@codeaurora.org wrote:

> On 2020-04-07 15:29, Bjorn Andersson wrote:
> > On Wed 19 Feb 18:11 PST 2020, Siddharth Gupta wrote:
> > 
> > > Remoteproc recovery should be fast and any delay will have an impact
> > > on the
> > > user-experience. Use power management APIs (pm_stay_awake and
> > > pm_relax) to
> > > ensure that the system does not go to sleep.
> > > 
> > > Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> > > ---
> > >  drivers/remoteproc/remoteproc_core.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/drivers/remoteproc/remoteproc_core.c
> > > b/drivers/remoteproc/remoteproc_core.c
> > > index 5ab65a4..52e318c 100644
> > > --- a/drivers/remoteproc/remoteproc_core.c
> > > +++ b/drivers/remoteproc/remoteproc_core.c
> > > @@ -1712,6 +1712,8 @@ static void rproc_crash_handler_work(struct
> > > work_struct *work)
> > > 
> > >  	if (!rproc->recovery_disabled)
> > >  		rproc_trigger_recovery(rproc);
> > > +
> > > +	pm_relax(&rproc->dev);
> > >  }
> > > 
> > >  /**
> > > @@ -2242,6 +2244,8 @@ void rproc_report_crash(struct rproc *rproc,
> > > enum rproc_crash_type type)
> > >  		return;
> > >  	}
> > > 
> > > +	pm_stay_awake(&rproc->dev);
> > 
> > Following Mathieu's question I was expecting you to do this on
> > rproc->dev.parent.
> > 
> > But looking at the implementation of pm_stay_awake(), it ends up being a
> > nop if dev->power.wakeup isn't specified. This in turn seems to come
> > from device_wakeup_enable(), which will bail if dev->power.can_wakeup is
> > not set. But I don't see where this would be set for either the platform
> > driver or the remoteproc's struct device - and neither one of them have
> > a "wakeup" attribute in sysfs.
> > 
> > Is there some additional plumbing needed for this?
> We should be able to create a standalone wakeup source using
> wakeup_source_init.
> Then we can use _pm_stay_awake and _pm_relax on it.

Afaict the way to do this would be to call device_wakeup_enable() on
either the remoteproc or platform driver's struct device.

Given that the resources related to waking up the system are associated
with the platform driver I think this should be done on the platform
driver's struct device and these calls should operate on the rproc's
parent.

Regards,
Bjorn

> > 
> > Regards,
> > Bjorn
> > 
> > > +
> > >  	dev_err(&rproc->dev, "crash detected in %s: type %s\n",
> > >  		rproc->name, rproc_crash_to_string(type));
> > > 
> > > --
> > > Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> > > a Linux Foundation Collaborative Project
