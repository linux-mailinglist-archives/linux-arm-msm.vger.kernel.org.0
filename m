Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B1A23BE060
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jul 2021 02:51:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229876AbhGGAy0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jul 2021 20:54:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229834AbhGGAy0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jul 2021 20:54:26 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF4AFC061574
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jul 2021 17:51:46 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id t3so1453076oic.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jul 2021 17:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=s1ffWoDxY3VEBE1q35gustTBk0aEjDRruN7MtUPHf+s=;
        b=Ra+wCD0SHtYTko26/J1Cue0W0aDrFn9aSunhan4jY+Ku4VPvSN9WRXcMbnD4rhZnSK
         2QthozXeQcedU9GrmFB43j/jrN0Yjq4HftOf6+yzt+f/zGbx0dyhzSd3tWUdv7JTdBDF
         JzKV+Wwmrvusajw20DvOwGvBXYlZX0YHiojWzy/Q5dgdAG5cGWx3u2koM/EQsJrjcGZf
         Z+w+R2NM5WOr7inBdRWwVg4npDKnw7TAa0YLPv+dwNjlJ2GBJcCvl24SgjfrAmBeKE0p
         NuHc5VZ3iIFXyEW7emO3v17J7GAWUueRKgYUse/4iNJLtUeqyooAfzPdiWCbsD8SuYFp
         pqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=s1ffWoDxY3VEBE1q35gustTBk0aEjDRruN7MtUPHf+s=;
        b=kjXANj9qZOPg23RYk4vexaERKyjLVHVM/U+vehqMXwCMYKVSixPS9fOp0nHtTp/ITH
         qUC8pNWsQOVt9WtV3h//ruzJ9IYxaHQC+auL/HrlO9PMqNJtrBokfzcH74dirGrln2Q4
         VBcHS0tGh8FqY89biUUaRQNl/VXvErG30jSIyqE1PrQhu4mGu+gYCRjlPt7R6m0rMeLT
         sz2yhkI1bM+EwTIFzylVXM/8WX0hTktTiK0dyD6nC92YjB0AgQnU+rhCcIahNhUHp9x0
         tQfh6prcrEjjCFIRmwbRdlVtt34k6Ofz7ZbXjN7pcFs28bbgleWByOy98r7Lf3fyRb3v
         G+bw==
X-Gm-Message-State: AOAM531tdn4/0dv71ZEu9QCsTuU66mnE1CqWzw+jnCSg5m2DhM4iQwEt
        YUq4J670nQ29QlXBXda3MkNLHA==
X-Google-Smtp-Source: ABdhPJyNJiVNErijMnayY3hae/x4q3f+pLPIXDHbJM0FyfNJpF2vVd7vubXKnUQzaS4QdbPu0Hl1pg==
X-Received: by 2002:aca:3a55:: with SMTP id h82mr2706375oia.59.1625619106268;
        Tue, 06 Jul 2021 17:51:46 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id s131sm3745306oib.52.2021.07.06.17.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 17:51:45 -0700 (PDT)
Date:   Tue, 6 Jul 2021 17:50:23 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     vkoul@kernel.org, kishon@ti.com, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        robh+dt@kernel.org, jonathan@marek.ca,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: Re: [PATCH 2/2] phy: qcom-qmp: Register as a typec switch for
 orientation detection
Message-ID: <YOT6T3YZSz1EysuO@ripper>
References: <20210706230702.299047-1-bryan.odonoghue@linaro.org>
 <20210706230702.299047-3-bryan.odonoghue@linaro.org>
 <YOTuh2hYp7IC+4rt@yoga>
 <9f213505-c118-b6fd-676b-1bafd83d8380@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f213505-c118-b6fd-676b-1bafd83d8380@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 06 Jul 17:35 PDT 2021, Bryan O'Donoghue wrote:

> On 07/07/2021 01:00, Bjorn Andersson wrote:
> > In order to perform link training on 4 lanes we need to reset the
> > PHY_MODE_CTRL with only DP_MODE.
> 
> We're only the two lanes for USB on sm8250 and at the moment only USB works
> - not dp on 8250.
> 
> Perhaps you've discovered why the DP times out on 8250..
> 

The way this problem manifest itself in my testing (on sc8180x) is that
the 3rd lane fails to complete link training, although it wasn't
completely obvious from the kernel prints until you look at the
implementation.

I don't know if you're still struggling with the AUX timeout, but if
you're past that this would be a strong candidate. That said, if you set
data-lanes = <0 1> in your DP node then it won't attempt to go 4 lanes
and wouldn't hit this problem.

> > In my efforts on sc8180x I skipped the disable/enable in switch_set() (I
> > believe because I didn't have the init_count check...) and then in
> > qcom_qmp_phy_configure_dp_mode() I issue a reset when we're heading to 4
> > lanes. Perhaps we can do the disable/enable and achieve the same thing,
> > but as written here you won't get 4 lanes...
> > 
> > I will do some more testing.
> 
> Do you have a commit I can cherry pick ? Might be worth testing out with
> tcpm + dp on the sm8250 if its working for you on sc8180x
> 

I dumped my hack-branch on github a while ago and have been working on
cleaning this up to get the patches out:

https://github.com/andersson/kernel/commits/wip/sc8180x-edp-dp-nvme-sdx55-dump

Unfortunately I extended my testing and realized that DPMS doesn't work
reliably.

With my MST hub (and single monitor) I often hit a security violation
when accessing REG_DP_STATE_CTRL when powering down the display, unless
I have drm.debug=511 (i.e. changing the timing of things). With the more
favourable timing DPMS on/off works nicely.

With my direct type-c/dp cable I can reliably power down the display,
but resuming it generally fails immediately - the monitor is waking up,
and then goes back to sleep (probably because the software has given up
on me already).

Trying to debug these two issues currently.

Connecting, disconnecting and reconnecting the cable works reliably
though, so once upstream boots again I intend to send out most of my
cleaned up patches.

Regards,
Bjorn
