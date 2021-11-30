Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29C03462F82
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Nov 2021 10:26:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240139AbhK3J31 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Nov 2021 04:29:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240134AbhK3J31 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Nov 2021 04:29:27 -0500
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8138BC061746
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Nov 2021 01:26:08 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id 137so12049909pgg.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Nov 2021 01:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=oXaDYGL7nEXP6MNRdftg+VSUENUU16+vGuz3Sq2zHmk=;
        b=GJ1ucd5ka2VdzllDSZLTJ8pjC8gSB9QI0NsluP3HnKA83XqVS+NSe2+pZAiSgVBUJR
         6GGRstmcea2lyftcaJg9Yn7NFFsH2EFs5qLy/GAmKtto2Kgq3njYVds7Kgg3iluBGpok
         LExATY1eamMn+U6ymOAJsMc2oOy9a+aj/Fj94bgL00K9N23WNuFXCtEkDJZWTrhHrLF4
         OMtJKZG+h3C1kbjot788f9ZqnAN+xRvwZtmYJr5060ame2CX1yqnlMJQAQwZORK6Cc9y
         yZ+vOVW7JCyheNHqqmeMAAlRD2zUizWAetGcw5HX2C1H0JYKbJSveh1IjfR2BjwkMtUj
         ExJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oXaDYGL7nEXP6MNRdftg+VSUENUU16+vGuz3Sq2zHmk=;
        b=ljUJpm66J6uqlg9xXAuYqzhMcmbjPWu5+BLm4+cfsH9Lhgd/14p+TetqoUffnggEQd
         gMF+y8G9C6yPVZd0U8fugDFdFJ2dkNtF4xH5XkX1NvfrVGYOe6F9UsQDKhn4Ou7spjHP
         fDUQlEqpdDJeBUegdDq/4MvMfMN2BRYeL4e8ivYZXAePb8oo+NX9K9/3ke3Sqt0zso4S
         /6QkbDvlPnYg0QZ3bdSS+5JpZfzyn3yW0+e5vcqmBR1E9cse3fpvm4jJYJcu7JRS3oT7
         RfQf5vh8rDealIjbqp4TBg0BDo2yOvqYHdCCU6dFzRMP+fIctxePIepFUz1h3FDETbQo
         /nDA==
X-Gm-Message-State: AOAM532U/o96w7MAG39bdPafht6fnkXv+ffqbrt8vYE8aY4AcsdIqg5w
        8MydzUsvrAyEVGcjzDp1NgFS9Q==
X-Google-Smtp-Source: ABdhPJw1xQqbeYhHCicpDBy+0sukQLd5rd5BI0RUeGimNc2XNL9J4iwrJyi5V0c3hsqtLtPVqAtcOA==
X-Received: by 2002:a63:8349:: with SMTP id h70mr40123495pge.315.1638264368057;
        Tue, 30 Nov 2021 01:26:08 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id h194sm19796817pfe.156.2021.11.30.01.26.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Nov 2021 01:26:07 -0800 (PST)
Date:   Tue, 30 Nov 2021 17:26:02 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Maulik Shah <quic_mkshah@quicinc.com>
Cc:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] irqchip: Add Qualcomm MPM controller driver
Message-ID: <20211130092601.GI10105@dragon>
References: <20211126093529.31661-1-shawn.guo@linaro.org>
 <20211126093529.31661-3-shawn.guo@linaro.org>
 <56a5820e-9cd7-aa49-7ce8-9547f355986e@quicinc.com>
 <20211129134459.GC10105@dragon>
 <519ac97a-6bff-ee93-58c6-63559c3a6cb6@quicinc.com>
 <20211130084445.GG10105@dragon>
 <e7a70e7d-c9b6-c10d-23c8-dd5ca74cc4dd@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7a70e7d-c9b6-c10d-23c8-dd5ca74cc4dd@quicinc.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 30, 2021 at 02:34:28PM +0530, Maulik Shah wrote:
> Hi,
> 
> On 11/30/2021 2:14 PM, Shawn Guo wrote:
> > On Tue, Nov 30, 2021 at 01:56:02PM +0530, Maulik Shah wrote:
> > > Hi,
> > > 
> > > On 11/29/2021 7:15 PM, Shawn Guo wrote:
> > > > > This is not limited to suspend, you will need to notify RPM during deepest
> > > > > cpu idle state entry as well, since MPM may be monitoring interrupts in that
> > > > > case too.
> > > > Yeah, I was trying to test this MPM driver with cpuidle, but failed to
> > > > see the SoC get into vlow/vmin state from cpuidle.
> > > In a few cases SoC can enter vmin/vlow from cpuidle one is from static
> > > screen on.
> > > 
> > > > Do you have any
> > > > suggestion how I should test it properly?
> > > Suspend resume (use "s2idle" and not "deep" mode on upstream kernel) is one
> > > good method, but you will have to make sure all drivers have removed votes
> > > on xo clock when entering suspend.
> > > Also need to make sure other subsystem like modem is in power collaspe (look
> > > at the internal master stats driver to know if other subsystems entering to
> > > low power mode or not).
> > I have already been able to trigger a vmin sleep with s2idle by doing:
> > 
> >   $ echo mem > /sys/power/state
> > 
> > My question is how I can get a vmin sleep in idle case, so that MPM
> > driver can be tested in both suspend and idle context.
> > 
> > Shawn
> 
> In a few cases SoC can enter vmin/vlow from cpuidle one is from static screen on.
> you can turn on display and set display off timeout to maximum (30 minutes) in android phone and then just leave the device idle for few minutes
> 
> another possible way (if display is not present) is to take some wake_lock (write something to /sys/power/wake_lock) and disconnect USB and leave the device idle for few minutes.
> since taking wake_lock device will not enter suspend, cpuidle can make SoC enter deepest mode like vmin (if all other conditions like other subsystem sleeping and votes on xo clock removed, etc met).

I'm running an upstream kernel with neither display nor USB enabled.  I
will test again and check conditions of other subsystems.

Thanks for the input, Maulik!

Shawn
