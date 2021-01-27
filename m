Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E27330599B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 12:26:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236618AbhA0LZo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 06:25:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236459AbhA0LYC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 06:24:02 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FCBAC061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jan 2021 03:23:22 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id l18so1167048pji.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jan 2021 03:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OG2yJLIqfiH42Pa0O50XjJYhcx8um8MWOosstWvl1Pc=;
        b=SQp6Rv8XAemNGt6drTByryIecsm65sSQ+omeKhrm2DXW+V30886OlqnjFrseaW3iUX
         a/JdQqSKafv4yz78Y/abSW/1AlyQcJ1KOIOMA6duOjRl91t39lOO7XO12L9jO6dPdUQL
         kES5GKsKBmd4IK1R+f/qcEesh7uXzuVXHFLnu21vW+tmDmqYkaAQqbK1RDOAUa0iHX3g
         ToQv318+vn3tWTSyzFxPvq2X0uqiwr0MvX05mEryltqszCL+sZfOG945e1jqpptpel9U
         D0wnD+392ZAPFL6jvNBLgedfL4Th8pc57/vjx0TUb6nlfbvVAtwjMJ7YfXRdOrAiQaI1
         8k3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OG2yJLIqfiH42Pa0O50XjJYhcx8um8MWOosstWvl1Pc=;
        b=GQFDkWnnwIlMzPTeqKHQVwZ76sjvI43S0ObuGHvRL29ieaT9QDsExM85PzHLQrVqwD
         42l2eaX7DbSGF+9tAiw/6x2dWh7GcfrZ4o9dZa3zoqosMxc4o8/WLW5E3cCV2qTadyMS
         UUi+1JrhfVVYq9mAhmJOnX6B7PEEaNrMVmQz1onaUIEY0VpRRiVss9WkTtAqVr8MfRN8
         7KPJKJFGmgEFwuwso7TvGz80AOehdRzNRtRTkc5i+dnMGHhQZyoGnrD/kLHIbmIiqC0k
         q+SpJXAYFxSL/OT7oI8bsfXdodOxGNcqGhizut8EsJI+sX9oc2+6yZUd0eZjkBvL4CP2
         lhGw==
X-Gm-Message-State: AOAM532Du2dPgeyu8k0sbr9OzSaZGCzWnHCxhDJODentfmr6MLvXAg6p
        Gt6MRKmQuPvj3FIHRYo4L+gI
X-Google-Smtp-Source: ABdhPJyhdAu87ZdUJjQqKtvHeADuVwF7j4Bf22IDtmvQ6OtojrEmBtAYnwsgguPk0KKU7ujG3f+K5w==
X-Received: by 2002:a17:902:ec82:b029:de:8483:50b4 with SMTP id x2-20020a170902ec82b02900de848350b4mr10908996plg.41.1611746601534;
        Wed, 27 Jan 2021 03:23:21 -0800 (PST)
Received: from work ([103.77.37.150])
        by smtp.gmail.com with ESMTPSA id g22sm2116282pfu.200.2021.01.27.03.23.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Jan 2021 03:23:20 -0800 (PST)
Date:   Wed, 27 Jan 2021 16:53:17 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>, davem@davemloft.net,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Hemant Kumar <hemantk@codeaurora.org>
Subject: Re: [PATCH net-next 1/3] bus: mhi: core: Add helper API to return
 number of free TREs
Message-ID: <20210127112317.GA3141@work>
References: <1610388462-16322-1-git-send-email-loic.poulain@linaro.org>
 <20210113193301.2a9b7ae7@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <20210114035749.GA4607@work>
 <20210113200246.526d4dc0@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210113200246.526d4dc0@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 13, 2021 at 08:02:46PM -0800, Jakub Kicinski wrote:
> On Thu, 14 Jan 2021 09:27:49 +0530 Manivannan Sadhasivam wrote:
> > On Wed, Jan 13, 2021 at 07:33:01PM -0800, Jakub Kicinski wrote:
> > > On Mon, 11 Jan 2021 19:07:40 +0100 Loic Poulain wrote:  
> > > > From: Hemant Kumar <hemantk@codeaurora.org>
> > > > 
> > > > Introduce mhi_get_free_desc_count() API to return number
> > > > of TREs available to queue buffer. MHI clients can use this
> > > > API to know before hand if ring is full without calling queue
> > > > API.
> > > > 
> > > > Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
> > > > Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>
> > > > Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>  
> > > 
> > > Can we apply these to net-next or does it need to be on a stable branch
> > > that will also get pulled into mhi-next?  
> > 
> > We should use the immutable branch for this so that I can pull into
> > mhi-next.
> 

Please find the immutable branch:
https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git/log/?h=mhi-net-immutable

I've now merged this into mhi-next!

Thanks,
Mani

> Thanks for a quire reply!
> 
> Loic, FWIW git merge-base is your friend.
