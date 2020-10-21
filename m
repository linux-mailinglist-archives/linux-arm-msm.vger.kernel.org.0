Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9A362950B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Oct 2020 18:25:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437768AbgJUQZv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Oct 2020 12:25:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390908AbgJUQZu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Oct 2020 12:25:50 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A83CC0613CE
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2020 09:25:48 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id az3so1410654pjb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2020 09:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3M1GR8sUu5p1axYViJdkD29z5g+AeYis/SFIbV+Ug74=;
        b=tZ1PR0/WUzPGelPeF19E7iaQH9Pxb3HEPFvr8uhRQt+L4y60aoHEu5tbEDA2lsmiV+
         9oLuvGHewe2SpNfQXlyIgFIUjNJbONk6Vk2A5TUM3LRJ30zE6wuEYK0Xq3YBjqexhMs+
         QHIbix3sqd4tCDgyOFiE2y4HjeeNopBYgU0RXWdF0I58S3c9pSaQW5UrLY7C80DhjgvP
         U8nFUAxuA+Pjqv8o825M5u3oQ7n/vaRlTltcMpAJDR4FPKt5Gox2NHw2K1yTHZDFLmFV
         +ErjQp1rDk+4bzuTV1uziNoTzJq1b4bMzWYy8lPT8tpcsWzkzB17hXv71/wCTr8UzwRZ
         1xnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3M1GR8sUu5p1axYViJdkD29z5g+AeYis/SFIbV+Ug74=;
        b=JSmBvTIxPK4FCHQfBUNYRMwM9aFXd1M/4Hxn/Y4v1wqIy0VsRHJ1ytUXTIUT+NdLNc
         sFI2yGDJ9sv+XKzSmPb9d8YkMd7PZZ0bI/k/nPfJc3WYCLIoLJrnY2+ZzBPvPQ3BDu6H
         VKWFLGgzwFObIdwnyPU6Sj1oyaiSMKGuLInd4gK6TVXD9gyxrITR/2D6a9cN5iPMd3+n
         9Zr9hqqXlJyr+ssOTS//A4fn2d4cbl3a4OCfCLJiwB+EaNGUi+c4XPrXCCmgT/PrxtZT
         ls28Li6MkWawn92sTNH6rpxCG4O+k07TsfC0EcYO4CcF2GDJuAd3HttIPQrnJP+/pN4V
         qj2A==
X-Gm-Message-State: AOAM530ZB6+LFjXby5UpjBhq+la7jDRFcpdhVfmKeYO13pqnrByN2J1s
        qE8/SL/6NIQLThrqlT1N3HeG
X-Google-Smtp-Source: ABdhPJxQO+6/uKRfGbB61qTErjC8+ThiC6c5CFbt3y6O0PMNj75yj2AQ1Za/3IbSYAL/To817czp7Q==
X-Received: by 2002:a17:902:ec05:b029:d2:ab3c:dc4f with SMTP id l5-20020a170902ec05b02900d2ab3cdc4fmr4398259pld.81.1603297548004;
        Wed, 21 Oct 2020 09:25:48 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:70e:2a27:314a:6d22:ec47:a603])
        by smtp.gmail.com with ESMTPSA id m3sm2449297pfk.23.2020.10.21.09.25.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Oct 2020 09:25:47 -0700 (PDT)
Date:   Wed, 21 Oct 2020 21:55:40 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Hemant Kumar <hemantk@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: Re: [PATCH v7 1/4] bus: mhi: core: Add helper API to return number
 of free TREs
Message-ID: <20201021162540.GG3334@Mani-XPS-13-9360>
References: <1602907457-13680-1-git-send-email-hemantk@codeaurora.org>
 <1602907457-13680-2-git-send-email-hemantk@codeaurora.org>
 <20201021152714.GD3334@Mani-XPS-13-9360>
 <CAMZdPi8xcsrKx2eV5da98fsGt2zO3f6ARMz7WJsyDSb3CnM0FA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMZdPi8xcsrKx2eV5da98fsGt2zO3f6ARMz7WJsyDSb3CnM0FA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 21, 2020 at 05:43:14PM +0200, Loic Poulain wrote:
> On Wed, 21 Oct 2020 at 17:27, Manivannan Sadhasivam <
> manivannan.sadhasivam@linaro.org> wrote:
> 
> > On Fri, Oct 16, 2020 at 09:04:14PM -0700, Hemant Kumar wrote:
> > > Introduce mhi_get_free_desc_count() API to return number
> >
> 
> Would it not be a good idea to have naming aligned with other methods?
> Like mhi_queue_num_free() or mhi_queue_no_free_elem...
> 

'queue_num_free' doesn't sound like getting the number of available
descriptors...

Thanks,
Mani

> Loic
