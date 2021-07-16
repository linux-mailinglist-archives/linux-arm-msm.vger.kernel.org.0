Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA2693CBED6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jul 2021 23:59:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230490AbhGPWCK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jul 2021 18:02:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236958AbhGPWCI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jul 2021 18:02:08 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F33AC061760
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jul 2021 14:59:12 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id o72-20020a9d224e0000b02904bb9756274cso11389267ota.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jul 2021 14:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Upana4scSf40Sce7qso1PCWb+aKZrn6kdUZ7xJPEhD4=;
        b=PTNuS1S+/gRREcL0CPaZnz4d+t6t2QdOQdQG5gE5QrzHxKPofdTykYPDhEe1c38os/
         tna9lNAdrGq6otRvH0ydUE15ihlKU6W+O1Poh3Ha6OrOU0hwnywnY8j7YoBQqdHE6okD
         ViuOI4CPSkqVDWhJxFea2uhPNAAgrvyGq//OPmp55zr1uOGCvurVoBuwiClBCubEqfVM
         /1t3EwpddGRJLPUhWmR5zJsXj54Q1Zfb5GelXf3lJN1rbNojId3MQr0jENEYos1GZcVD
         usYvRrF+2u8RxeLTylexG3tt/RoKvYgOFWZ5l+j0WNm8bR0DnM4MiJIuvCTWTlC5BIXf
         mLcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Upana4scSf40Sce7qso1PCWb+aKZrn6kdUZ7xJPEhD4=;
        b=UDx/tOtuiOiVu8XEe5oHcJtJbYLB9Cj4l6wIMjGOnStS6q3Y9reCst/RUTyrmBtitp
         4iSWQzubIfZ8Pue3hzsedfysorZK1jxGC/sWL00Xlfg47BNBHwKy02okLXXvkPK0mdJM
         Gbnzx6KGwk4nFTVuJ++JpFgt8cHrZJhiOtjxSTLl2J/0Wqm/SA+plaGHAmp/mH0u7FCa
         fiI4BizMs1XyZ9JBoXEtjR21pySkD2zoOHjQ1BC2bD1It3ufdE5HNM7GKfeYYzaNI8yJ
         Maa7C5mq4rc9D1HThl7VUpGQXxdU0zCDlcT0uXg3V/THlEQ2fmsToaIPSqVoiYRIU7gs
         HlNg==
X-Gm-Message-State: AOAM5335C1VkJfNxRN0Fq4WY9DEz7Q5ldHdPK7M+1XFBbEwhPEvy1jZY
        quceaCslpiP0luGMBOc4KDyrng==
X-Google-Smtp-Source: ABdhPJzFdJf9M4Q/WxxCMdzZjgpq1467Q8OzN9siY/SdLsU6aGpi+lwUo3MI8o9xxs43MCNv6xxCwA==
X-Received: by 2002:a9d:6c1:: with SMTP id 59mr2115187otx.318.1626472750119;
        Fri, 16 Jul 2021 14:59:10 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k13sm2155366otl.50.2021.07.16.14.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jul 2021 14:59:09 -0700 (PDT)
Date:   Fri, 16 Jul 2021 16:59:07 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>, ulf.hansson@linaro.org,
        viresh.kumar@linaro.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, rojay@codeaurora.org,
        stephan@gerhold.net
Subject: Re: [PATCH v4 2/2] arm64: dts: sc7180: Add required-opps for i2c
Message-ID: <YPIBK/NJgBNZVI8Y@yoga>
References: <1626429658-18961-1-git-send-email-rnayak@codeaurora.org>
 <1626429658-18961-3-git-send-email-rnayak@codeaurora.org>
 <YPHpsO5LlQRQxj9y@yoga>
 <CAE-0n53CHD8c7C4ETWRgzmZmFSCcBw46wSs4pKbYMRjA_tD3yg@mail.gmail.com>
 <YPHxfHPC/faq/y+J@yoga>
 <CAE-0n50qx80cMFPJ1x9rc+EMR1L+j2CUMyDjWAbnE9mPHjf-TQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n50qx80cMFPJ1x9rc+EMR1L+j2CUMyDjWAbnE9mPHjf-TQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 16 Jul 16:49 CDT 2021, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2021-07-16 13:52:12)
> > On Fri 16 Jul 15:21 CDT 2021, Stephen Boyd wrote:
> >
> > > Quoting Bjorn Andersson (2021-07-16 13:18:56)
> > > > On Fri 16 Jul 05:00 CDT 2021, Rajendra Nayak wrote:
> > > >
> > > > > qup-i2c devices on sc7180 are clocked with a fixed clock (19.2 MHz)
> > > > > Though qup-i2c does not support DVFS, it still needs to vote for a
> > > > > performance state on 'CX' to satisfy the 19.2 Mhz clock frequency
> > > > > requirement.
> > > > >
> > > >
> > > > Sounds good, but...
> > > >
> > > > > Use 'required-opps' to pass this information from
> > > > > device tree, and also add the power-domains property to specify
> > > > > the CX power-domain.
> > > > >
> > > >
> > > > ..is the required-opps really needed with my rpmhpd patch in place?
> > > >
> > >
> > > Yes? Because rpmhpd_opp_low_svs is not the lowest performance state for
> > > CX.
> >
> > On e.g. sm8250 the first available non-zero corner presented in cmd-db
> > is low_svs.
> 
> Indeed. On sc7180 it's not the first non-zero corner. I suppose
> retention for CX isn't actually used when the SoC is awake so your
> rpmhpd patch is putting in a vote for something that doesn't do anything
> at runtime for CX? I imagine that rpmh only sets the aggregate corner to
> retention when the whole SoC is suspended/sleeping, otherwise things
> wouldn't go very well. Similarly, min_svs may be VDD minimization? If
> so, those first two states are basically states that shouldn't be used
> at runtime, almost like sleep states.
> 

But if that's the case, I don't think it's appropriate for the "enabled
state" of the domain to use any of those corners.

As this means that anyone who needs any of the rpmhpd domains active
also needs to specify required-opps, which wouldn't be needed for any
other power domain provider.

And more importantly it means that a device sitting in a GDSC, which
would be parented by a rpmhpd domain has no way to specify the GDSC and
trickle the minimum-vote up to the rpmhpd domain. (And I know that we
don't describe the parentship of the GDSCs today, but this patch
tells me that it's around the corner - for more than MMCX)

Regards,
Bjorn

> >
> > And if this (which?) clock requires a higher corner than the lowest
> > possible in order to tick at this "lowest" frequency, I'm certainly
> > interested in some more details.
> >
