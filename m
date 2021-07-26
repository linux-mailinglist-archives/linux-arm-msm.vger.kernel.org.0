Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59B273D6607
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jul 2021 19:50:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231694AbhGZRJx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jul 2021 13:09:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231502AbhGZRJx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jul 2021 13:09:53 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CADBDC061765
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jul 2021 10:50:21 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id x15so11833592oic.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jul 2021 10:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=db48y/ovq+/R24P2kuhwOLAKu+icrzjTHuCcSHS86vg=;
        b=w1uqw0eZtgt4oeg8v9LZI7uXoVEIOkGhBTsjhDru5QNLljSUpMgtcxH9f+3VbGkoYV
         hJP1nNBhc6oQIjO1dZd6jFOoLYmfT5vM1qnC6Ffx1bc/ny6L3xG2rPcJ5mGeGj90ZeTV
         JVxgMgz8/du2yQv2Az0128DkCblfYB7wwh2/7hJF2BJusX5wv13SSZPChhuzr/PI8QKZ
         zrdrOUdEi7Wo7h2RZcduQkOvSp3kua+ivw3AQ4JlHEOdDsMhKCmMHlI3+WvowjtlpxR7
         cJ6YzL/XAaAhi0I3bmrkp5mHjGs5JfXiItLz67tvOqBeoi4KL16VdFmwM5tSDm5XqdSm
         a3ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=db48y/ovq+/R24P2kuhwOLAKu+icrzjTHuCcSHS86vg=;
        b=m/54WUyRNUuAzgh9qIItoQZFkiJCgweUW83w5K2juKuvt3qU+bI/i2SKvATUCpo1S4
         rp2FAK1nilCXT/Yg/IxhdD7jUiJoRExGUbO9g3Dv+TmyfgY8a5LB94QfZ2mO+GqB4hxO
         8zukXEytLFjJsQ7fR8ICwSD1Fl7IwYjt/3r0ijBxdOfyRkE6AytIuabMKqmHjn/8NR0s
         0PDplsNsdeWIVXutgbkHYiROVmuOb4p9Fuf4SeY33FNPXekmnp6ACq8PbhD+2ObCkbvV
         D9f6/X4/AEtZkUo94QITxJqFxKDSdo14I8TC482B7o+V19NYF3DNFgpB1xa5lX26/zuT
         4nSg==
X-Gm-Message-State: AOAM532fYv2+UaT4vfqTWxuTmGtTWmdLApaKz52tY2donhZIOPZgow/l
        Xy/2kSsFPL1MyYCedHMqLVJzQA==
X-Google-Smtp-Source: ABdhPJx/nGg701JhccQq4lqQVoXFFP3F3OPPYRM5w+P3u/t+MNBSirVAf1yX4j6qSp94l2IEEXDSng==
X-Received: by 2002:aca:4d55:: with SMTP id a82mr12164918oib.100.1627321821170;
        Mon, 26 Jul 2021 10:50:21 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l17sm107177ota.20.2021.07.26.10.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 10:50:20 -0700 (PDT)
Date:   Mon, 26 Jul 2021 10:48:32 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Baruch Siach <baruch@tkos.co.il>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Uwe Kleine-K?nig <u.kleine-koenig@pengutronix.de>,
        Lee Jones <lee.jones@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Balaji Prakash J <bjagadee@codeaurora.org>,
        Robert Marko <robert.marko@sartura.hr>,
        Kathiravan T <kathirav@codeaurora.org>,
        linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 3/4] dt-bindings: pwm: add IPQ6018 binding
Message-ID: <YP71cMSjuvmiREda@ripper>
References: <889aae1b88f120cb6281919d27164a959fbe69d0.1626948070.git.baruch@tkos.co.il>
 <70f0522a9394e9da2f31871442d47f6ad0ff41aa.1626948070.git.baruch@tkos.co.il>
 <YP2tAR+zZgJZQOgG@yoga>
 <87h7ghwwcb.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h7ghwwcb.fsf@tarshish>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 25 Jul 21:08 PDT 2021, Baruch Siach wrote:

> Hi Bjorn,
> 
> On Sun, Jul 25 2021, Bjorn Andersson wrote:
> > On Thu 22 Jul 05:01 CDT 2021, Baruch Siach wrote:
> >> +  clocks:
> >> +    maxItems: 1
> >> +
> >> +  clock-names:
> >> +    const: core
> >
> > With a single clock, it's nice to skip the -names.
> 
> I find it nicer and better for forward compatibility with hardware
> variants the might introduce more clocks.
> 

Do you foresee any need for forward compatibility? What other clocks
would this binding have to refer to?

That said, you'd achieve the same forward compatibility by just
making sure that the current clock is the first on in the amended
binding (which you have to do with or without -names).

> Are there any downsides to -names?
> 

Look at the number of places in a typical dts that we could have added
clock-names, reg-names, interrupt-names, power-domain-names etc for a
single cell.

I do find it beneficial to keep things cleaner and sticking with the
design of "single resource has no -names".

Regards,
Bjorn
