Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B373A2EF4B2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jan 2021 16:19:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbhAHPTa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jan 2021 10:19:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726430AbhAHPTa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jan 2021 10:19:30 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29F2AC061380
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Jan 2021 07:18:50 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id m6so6426306pfm.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Jan 2021 07:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=V73/EWzingOFt+4PN+e0jkvD/7PUrbeTmidSZeTvlqU=;
        b=dh8z2VgSlbfmjtleHshsnW9p32qvthpQDA4oE5GhMFtV3oIuMzI2hOZgH+3iikuY6L
         ndeWcnzHRmbWESXfN1MOwDsNcwwZuGuWORFSZGoaCVXEPeSoSpK/FPXihkNzAY2U3FSZ
         CPuec2PB7OcTYoESY2QJQNr78AjYjehQruVp8yhfBgsHyYotHRLndHm/q/RDC2H8QF/J
         lRWc14J3mw/KTdU0BXOBErOXEQAXxkQ8+Y+zJPpokb2UdBbP0veTpPzpVlZeqAsWEmMB
         mh+YboWZcTQKBYMZWvp4/qNc9PfFoMPDxS+wzieIS/9lKYiGxK3CVn0hUu/851I7VRqD
         eH5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=V73/EWzingOFt+4PN+e0jkvD/7PUrbeTmidSZeTvlqU=;
        b=XNmwW8MMt2hpL8Cn3hxeELLVhi+zm1GPCmHVutMM1fZxIe3yUUleiFhQdnsrg8GcV+
         M5HEpNL0cuYc0OZbRzgg+EXG2KrlYCgmxJcKj+ff0q3kt42878Hv+ZR6o8x2MThxz0v3
         Q82NaPBIbcTy31Ip5C2DF/3bQD74K2j5vZYyaZKnL4TrrPcDWJbACraaOcfyYrPlk0Jv
         s8RoMN5B/SIVJKysOGyQzwRHB66Aqa5I4JeBN4h7b9V4vQvUGxCWmx22PJSZSM+D8guK
         uVJZ+paXQDnKJqQq0VbJ1hpPAgx4ergw26ptWTMzhvTTZIUbItWLJaK1goa/SJJpWD3r
         sg9Q==
X-Gm-Message-State: AOAM530NBpWiehN6gFJrGjHZ3LupED41jk1d9TfqeJ9l28EKX7/4MvlI
        yz7h34EHuRckfg9cKO84s1s5Ss7eydN8
X-Google-Smtp-Source: ABdhPJxHuy1C4RPm7ZdpJTQV2+tmZfNM3Rf69HSbog39KC2gb/XhTkmtS4vckosr+wOaY8JNLMfJMw==
X-Received: by 2002:a63:5014:: with SMTP id e20mr7432385pgb.152.1610119129626;
        Fri, 08 Jan 2021 07:18:49 -0800 (PST)
Received: from work ([103.77.37.188])
        by smtp.gmail.com with ESMTPSA id b72sm9106289pfb.129.2021.01.08.07.18.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jan 2021 07:18:48 -0800 (PST)
Date:   Fri, 8 Jan 2021 20:48:45 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] mhi: core: Factorize mhi queuing
Message-ID: <20210108151845.GB32678@work>
References: <1607599892-6229-1-git-send-email-loic.poulain@linaro.org>
 <20210108120722.GC74017@thinkpad>
 <CAMZdPi-kfYy0x3UL_Hdvj=2t=aqvvxkRrm_BN=K14dF5PzbxyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMZdPi-kfYy0x3UL_Hdvj=2t=aqvvxkRrm_BN=K14dF5PzbxyA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jan 08, 2021 at 04:10:11PM +0100, Loic Poulain wrote:
> Hi Mani,
> 
> On Fri, 8 Jan 2021 at 13:07, Manivannan Sadhasivam <
> manivannan.sadhasivam@linaro.org> wrote:
> 
> > On Thu, Dec 10, 2020 at 12:31:32PM +0100, Loic Poulain wrote:
> > > Instead of duplicating queuing procedure in mhi_queue_dma(),
> > > mhi_queue_buf() and mhi_queue_skb(), add a new generic mhi_queue()
> > > as common helper.
> > >
> >
> > While doing the factoring, please don't make any additional changes. If
> > you want
> > to do, then use incremental patches.
> >
> 
> Well, I've not really performed additional change, I've just aligned all
> mhi_queue*() to use _irq for locking, but that was already the one used in
> mhi_queue_buf(), mhi_queue_dma and mhi_queue_skb now use it as well
> (instead bh), but it's because of the factoring. This has been tested
> carefully.
> 

And you have removed "pre_alloc" check... Either mention all the changes
in the commit message or do it incrementally.

Thanks,
Mani

> Regards,
> Loic
