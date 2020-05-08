Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EC131CB800
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2020 21:15:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726811AbgEHTO7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 May 2020 15:14:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726797AbgEHTO6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 May 2020 15:14:58 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D39C4C061A0C
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2020 12:14:56 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id a4so1298425pgc.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2020 12:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=B766Kq3wwMIZDh21Hnvsv+cWtRtFWNJvMN2IylFQHjI=;
        b=LjzDUAM/U9Np2yDM7Gd/ghWCHkZnU5fcEJvc0bEeg7q4hhHoLA7UleUGvoE06Em1En
         ahxEMpiQiF14yRL/UdS8hWULOzgsOlxJEMkaL6NWRHmQ24D//SdIkgbHHGRy0qA5Ml7U
         cIVSdQ1efavQWrtxD04bOr2MRhrHgPNFrb77g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=B766Kq3wwMIZDh21Hnvsv+cWtRtFWNJvMN2IylFQHjI=;
        b=Hy0gC1b628NhaHnSoSMKnOOFYef56/wVEVbx77xsZwgEHsFkPV3wzHwVfPNtixb4kf
         08vDKPTAaw38gnIDhQm7PO+dl3dhMc4XIgAdsdSCyH0RD171OXI7mGjMjyJIleLwLF4R
         15CQ6hYRfxnaY2aVkjAiH9yG+UWDdnBpZ8IUnfalgDy1IE4qzuh34CWSveibVF5x4gUT
         2UXIV1Eob8xLyQWNY0szSU/ejeZSNDImIKYmClfZbcyAoZFjqlwaQ+xPvyozye5X74v+
         aIh+THlbzyiT9+WRR43QJNYvpGfAL6Lxbu5SPHoynxSsXg6EaXL12cxYVrxWA182iBy5
         vvMQ==
X-Gm-Message-State: AGi0PubCWrKNsudKrr/4UHh4S6Tb97Pa3M+Hzh+OZj2FcwMUnuyPnaVK
        7t3mwzhfYySdkTE31RIEIW3Ayw==
X-Google-Smtp-Source: APiQypLoabMFrHcLg+AaIOSyN1MVOq0lrqEGKCkCFnD47I2CUY1crIKVFHSJx855pUPM6XCezTC8dw==
X-Received: by 2002:a62:5cc7:: with SMTP id q190mr4241312pfb.98.1588965296322;
        Fri, 08 May 2020 12:14:56 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id g16sm2550307pfq.203.2020.05.08.12.14.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2020 12:14:55 -0700 (PDT)
Date:   Fri, 8 May 2020 12:14:54 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de, broonie@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, dianders@chromium.org,
        evgreen@chromium.org, georgi.djakov@linaro.org
Subject: Re: [PATCH V5 2/7] soc: qcom-geni-se: Add interconnect support to
 fix earlycon crash
Message-ID: <20200508191454.GH4525@google.com>
References: <1588919619-21355-1-git-send-email-akashast@codeaurora.org>
 <1588919619-21355-3-git-send-email-akashast@codeaurora.org>
 <20200508175938.GB4525@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200508175938.GB4525@google.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 08, 2020 at 10:59:38AM -0700, Matthias Kaehlcke wrote:
> Hi Akash,
> 
> overall this looks good to me, a few comments inline
> 
> On Fri, May 08, 2020 at 12:03:34PM +0530, Akash Asthana wrote:
> > QUP core clock is shared among all the SE drivers present on particular
> > QUP wrapper, the system will reset(unclocked access) if earlycon used after
> > QUP core clock is put to 0 from other SE drivers before real console comes
> > up.
> > 
> > As earlycon can't vote for it's QUP core need, to fix this add ICC
> > support to common/QUP wrapper driver and put vote for QUP core from
> > probe on behalf of earlycon and remove vote during earlycon exit call.
> > 
> > Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> > Reported-by: Matthias Kaehlcke <mka@chromium.org>
> > ---
> > Change in V3:
> >  - Add geni_remove_earlycon_icc_vote API that will be used by earlycon
> >    exit function to remove ICC vote for earlyconsole.
> >  - Remove suspend/resume hook for geni-se driver as we are no longer
> >    removing earlyconsole ICC vote from system suspend, we are removing
> >    from earlycon exit.
> > 
> > Change in V4:
> >  - As per Matthias comment make 'earlycon_wrapper' as static structure.
> > 
> > Changes in V5:
> >  - Vote for core path only after checking whether "qcom_geni" earlycon is
> >    actually present or not by traversing over structure "console_drivers".
> > 
> >  drivers/soc/qcom/qcom-geni-se.c       | 63 +++++++++++++++++++++++++++++++++++
> >  drivers/tty/serial/qcom_geni_serial.c |  7 ++++
> >  include/linux/qcom-geni-se.h          |  2 ++
> >  3 files changed, 72 insertions(+)
> > 
> > diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> > index 63403bf..66fe6f2 100644
> > --- a/drivers/soc/qcom/qcom-geni-se.c
> > +++ b/drivers/soc/qcom/qcom-geni-se.c

...

> > +#ifdef CONFIG_SERIAL_EARLYCON
> > +	if (console_drivers)
> 
> The loop should have curly braces ("use braces when a loop contains more than
> a single simple statement"), even though the compiler doesn't need them in
> this case. This is not a loop, but I was told by a maintainer that it equally
> applies, which makes sense.
> 
> You could avoid one level of indentation through:
> 
> if (!console_drivers)
> 	goto exit;
> 
> > +		for_each_console(bcon)

Actually the NULL check of 'console_drivers' is not needed:

#define for_each_console(con) \
        for (con = console_drivers; con != NULL; con = con->next)

see also:

commit caa72c3bc584bc28b557bcf1a47532a7a6f37e6f
Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date:   Mon Feb 3 15:31:25 2020 +0200

    console: Drop double check for console_drivers being non-NULL
