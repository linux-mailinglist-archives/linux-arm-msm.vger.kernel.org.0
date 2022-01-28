Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF6C44A0007
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jan 2022 19:23:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343869AbiA1SXt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jan 2022 13:23:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343741AbiA1SXt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jan 2022 13:23:49 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5271DC06173B
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jan 2022 10:23:49 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id q19-20020a056830441300b0059a54d66106so6593251otv.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jan 2022 10:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+Z84hA385+KUpWAPAKjIC7/QMu1TKrmdAANnEx3DyCY=;
        b=BBo5QdBta5BAavqJ7iRkpq+Hd+0Mgt0/RUjLKEczTFkyK9/d4eh0F+5YL/b407BHNg
         gMYCmjyzHgmAR3RLYnew181kdoiqeT82Wsa4RONhtG3CZyKIcthbk79qr/64iHIB4+Os
         gB4NXoiLdwBDjAfdxPunyT4j0bb3ZZYI+jX5zas5YljOVnjBPuQgIBuw+9jD05Rt+b7K
         ac/+tNzOougAkStGC0tpTiSraZ53qpbksn7nBojjj3A0MOjB9Ki+xmZXVrplz8VqJKXD
         6qSQRXCeTGBdEHmIjT9vDY+E59XwRExamhX+gvwaDln1ZmWB2x3mOV/8baor+hiDBude
         MgKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+Z84hA385+KUpWAPAKjIC7/QMu1TKrmdAANnEx3DyCY=;
        b=CZp715oTVYZbyq08DoIshY1g4IgP0BejxG855IVTSE/qOf+tk4cDw0EOnDs5J5wgF/
         77R+fs6T1TLVCcHofT2Y6YChgk9IAGI/N9qay1ElqXTxDw9OvDn0vhNn7F145B7DmKa4
         ywlGMQ9Cw0Au0RphWCx03rnTc1mPx+X+Bpg/pPum4ngngZrcYzGOLxt+pSZAJQd+9iGU
         aS3mxtLyPR4I0anD8unzTMFTnrl5u+Z3pMuJLJNqC1T2C+IPk0pDx7sxh9rpyKMi9bbB
         j0/IIl6XCmxeXS+LJxPQFeGRQ5dvIpfmBqNpr3hJTN2zgQpocyt7Rj4XW+DYZaawdLyJ
         YUJQ==
X-Gm-Message-State: AOAM532AUo+TGBpuLWtg+s6CxMyxilM7SeCCNVvDKysjJPUtOYZOuomn
        QLK93w7WxXI8FRGXj1fBqUGXVeYZnYw80A==
X-Google-Smtp-Source: ABdhPJxoxtcRm7gplqirhnjzY+X2kbmnsS9fA2HSBZEma2oDdbXZI8Fs58UWiHtW/ITPEYZ+PQX+yg==
X-Received: by 2002:a9d:628a:: with SMTP id x10mr5380348otk.264.1643394228584;
        Fri, 28 Jan 2022 10:23:48 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id 44sm11993414otl.15.2022.01.28.10.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jan 2022 10:23:47 -0800 (PST)
Date:   Fri, 28 Jan 2022 10:24:12 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Lukasz Luba <lukasz.luba@arm.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-pm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/2] cpufreq: Reintroduce ready() callback
Message-ID: <YfQ0zFyJsjIZnCys@ripper>
References: <20220128032554.155132-1-bjorn.andersson@linaro.org>
 <f539ca2b-22c4-5708-ddd6-4b638dc0655d@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f539ca2b-22c4-5708-ddd6-4b638dc0655d@arm.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 28 Jan 00:52 PST 2022, Lukasz Luba wrote:

> Hi Bjorn,
> 
> On 1/28/22 3:25 AM, Bjorn Andersson wrote:
> > This effectively revert '4bf8e582119e ("cpufreq: Remove ready()
> > callback")' (except the Chinese translation), in order to reintroduce
> 
> Is there something wrong with the Chinese translation that it has to be
> dropped? Someone has put an effort to create it, I'd assume (and also
> based on online translator) that it's correct.
> 

I don't expect there to be anything wrong with the Chinese translation,
unfortunately "git revert" trips on a merge conflict and I'm
unfortunately not able to resolve that on my machine.

> > the ready callback.
> > 
> > This is needed in order to be able to leave the thermal pressure
> > interrupts in the Qualcomm CPUfreq driver disabled during
> > initialization, so that it doesn't fire while related_cpus are still 0.
> 
> If you are going to push the 2nd patch into stable tree, then you would
> also need this one.
> 

That's correct. This patch is however not a stable change in itself, so
I didn't mark it as such. I can work with the stable maintainers to let
them know that this patch is needs to go along with patch 2 - although
I've seen cases before where they automagically resolved that.

Regards,
Bjorn
