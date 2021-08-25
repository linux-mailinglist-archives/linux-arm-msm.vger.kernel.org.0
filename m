Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D09F93F7975
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Aug 2021 17:52:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241384AbhHYPxA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Aug 2021 11:53:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237144AbhHYPw7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Aug 2021 11:52:59 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 235DCC061757
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Aug 2021 08:52:14 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id h133so8935653oib.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Aug 2021 08:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=X+yOu2k/0Aoq0PfnlNV9T3vcn5Wl0bg+LNX6moKW2AY=;
        b=uScA8LBNrH/79G1Q7QR27MlTKRlHhH2U1zkqkjo3EXd50v0u3GF9aj3CfXJU4V+Q72
         9NRgJkcmjKSToAbyQkIwYHfKcM+USHHfld7X6MwQmEh4OFqXr6BkqnfsJXsspNKAT9c8
         Zm1+k+TLBKRvlwRqtnHoZYxRM02LZrsmCiHIn6rPn+9O6ejyfLpb8o7OBJat5CcvN6XV
         RM0H3jICFo/Idi4N4MTOKHu3owGq3kcME/HF5EAn+OQFXTSRH622g3Flf9ic2fbBjqAV
         d4qHPzSOtOOdBOh7AjPJJ2FvKmWRK8wu/u1jCUfU5QcdzvNx2Q9pCqclcTrQ9YSfHzS5
         UBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=X+yOu2k/0Aoq0PfnlNV9T3vcn5Wl0bg+LNX6moKW2AY=;
        b=pb2rtwaUvJb3XNUnfAMxh7/7Ssj9lHNLb1Qk35XETOt+dnZQjp2PfgEvq1o3ZgjkLn
         PGomFOv8GQr8X+MgEW4yylbYvlxeGCikjjrV3dWr0zM7KM+Yfmku7YSSOe30VxhXZLkQ
         TimVEAWGIJ5fRuQqZAzzWceLotYjjjoZdLjsKaN4cj7acEUtLknSdOGLwqhMF1EXRxdR
         vWCuW3B0jNIzYrKxv7b0ep3hvgFvVdiNDJhzjs+oNK3WPN5K340MUXEWYBKdxtESzIF8
         30/rXFX8WkhXgbGzMOjdVhO1DG576IwWMiVC6Yq8lie8+lWoC5e1LRkrhl7EH/5zX+2m
         fKdA==
X-Gm-Message-State: AOAM531gQfY7y3qAFAtbPZRV4qZ62HqvalZvMdDnZ/aFnSs7Ta6Xvl8o
        uMijTZKpqVgIajR4vX9LHf4QOA==
X-Google-Smtp-Source: ABdhPJxpZA+yrh+fd6s1aTwCRIFMvjnLJJV+Zzca2ZJVcVcCwKpozzCqooBhKKueEubqQbR282cdKA==
X-Received: by 2002:aca:5342:: with SMTP id h63mr7163766oib.171.1629906733377;
        Wed, 25 Aug 2021 08:52:13 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id v16sm37715oou.45.2021.08.25.08.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 08:52:12 -0700 (PDT)
Date:   Wed, 25 Aug 2021 08:53:29 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Peter Chen <peter.chen@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, agross@kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org,
        wcheng@codeaurora.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/3] Implement role-switch notifications from dwc3-drd to
 dwc3-qcom
Message-ID: <YSZned9v1+ajzVx0@ripper>
References: <20210704013314.200951-1-bryan.odonoghue@linaro.org>
 <20210707015704.GA28125@nchen>
 <YOX6d+sBEJMP4V3q@yoga>
 <20210708030631.GA22420@nchen>
 <YSWCnsZDdp57KBqB@ripper>
 <87zgt65avm.fsf@kernel.org>
 <ce5f12dd-ddc1-6a9c-3dfb-aa44ea166828@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce5f12dd-ddc1-6a9c-3dfb-aa44ea166828@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 25 Aug 01:18 PDT 2021, Bryan O'Donoghue wrote:

> On 25/08/2021 06:51, Felipe Balbi wrote:
> > > Hi Peter, I took a proper look at this again, hoping to find a way to
> > > pass a callback pointer from dwc3-qcom to the dwc3 core, that can be
> > > called from __dwc3_set_mode() to inform the Qualcomm glue about mode
> > > changes.
> > I would rather keep the strict separation between glue and core.
> 
> # 1 __dwc3_set_mode
> Felipe wants to keep a strict separation between core and glue
> 
> # notifier
> Requires the core probe() to complete before the glue probe to work
> reliably. This then would lead us to remaking the dwc3-qcom::probe() to
> facilitate probe deferral.
> 
> We can be sure bugs would be introduced in this process.
> 
> AFAIK Felipe is not opposed to this, Bjorn likes it
> 

Using a notifier or just a direct callback from core to the glue is an
implementation detail, but as you say we need a way for the glue to
register this before the core is fully probed.

> # 2 extcon
> Works but a) is deprecated and b) even if it weren't deprecated has no way
> to layer the messages - that I know of.
> 

Even with extcon, I really don't fancy the fact that we're duplicating
extcon registration in the glue and core - not to mention how it looks
in DT.

> # 3 USB role switch
> Already in-place for the producer {phy, type-c port, usb-gpio typec, google
> ecros} to consumer dwc-core. It already has a layering 1:1 of that array of
> producers to the consumer.
> 
> Unlike extcon though it cannot relay messages to more than one consumer.
> 
> As I see it we can either
> 
> A. Rewrite the dwc3-qcom probe to make it synchronous with dwc3-core probe
> taking the hit of whatever bugs get thrown up as a result of that over the
> next while, potentially years.
> 

The reason for it to be synchronous is that we need the glue to be able
to register it in a way that the core can acquire it when it probes
later.

> B. Use USB role switch in some format.
> 
> Either
> X. as I've submitted here based on a bit of code in dwc3-core or
> 
> Y. maybe trying to hide the "relay" aspect in DTS and USB role-switch core
> 

I don't think it's appropriate to work around the split model in DT.

> It seems to me our choices are notifier + pain and churn - perhaps low,
> perhaps high or USB role switch
> 
> 3.B.X works and is what has been submitted here but, if it is objectionable
> is 3.B.Y viable ?
> 
> As in make USB role switch propigate to multiple consumers via DTS and
> whatever additional work is required in the role-switch layer ?
> 
> + Heikki on that one.
> 

I've not seen the need for multiple consumer of role switching yet (I
don't find this a legit target for it).

But in the case of Type-C altmode several of our boards have either an
external gpio-based SBU-pin-swapper or some redriver on I2C with this
functionality, so we need a way to tell both the PHY and this external
contraption about the orientation.

Regards,
Bjorn
