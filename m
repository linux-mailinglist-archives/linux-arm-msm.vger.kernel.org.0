Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AE4B4A6212
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 18:15:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240484AbiBARPp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Feb 2022 12:15:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240470AbiBARPo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Feb 2022 12:15:44 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C7A4C06173B
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Feb 2022 09:15:44 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id a13so33362116wrh.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Feb 2022 09:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=vuODL4R8sWx9OfFHsJcQsIGcRHDIKVpO9qvvFMatGKg=;
        b=dzb0z2VsksG6lwrjCZriyd0Ja/8hxqDsV7pWCrRKJ2lzm4ZNcCH2zYBWXPu4oMNTXK
         fWHT6ruiWLPHzc0UouY0EVebGMyse6bZDq0xiTCG4agdGIHkrvh1J3eSuEhS4ZMPOjNg
         xmjbYlffWpMKw4SbOQVyVSlVwrfVvR7Ipd9AnSKKGs+pOqg72vFFDxq9hkcGErODDf30
         fAHKvq5UkyqXRQ8NIXgWJk5AbQakp/ZftEWCxINS9FrTRRZ42DhYjpWUXD8sVathJFpI
         veG8pZocDz42nVGM9OaE8kllg/CGALMaC/JBBo3+ppUR2TdVtg1zNd2GDkDsSYR7+owh
         XzMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=vuODL4R8sWx9OfFHsJcQsIGcRHDIKVpO9qvvFMatGKg=;
        b=HTkBkhfCxRPy4GCS9igGqEP5Ht/LN+yvAfmxBL2askud12YObh6KrSMEwaMD48/uAC
         aj18ZkC137evPY/RllftFUSG4PFyjUDYQFpXnXmfk/NgIQ4H7d75s+V62Rmr2xaCLJCS
         dnoQA9aUT2qVZz2YmoO7UHFv5BvdONowryd1vyCi/TRKirXZliFCqtjqkSdvDzT8Wpar
         gfqifzMHIi5mIjyhFaqKt/z41YssJZvvDJB6j4kag9V4lzMYAX7yYoi0u2LpW6uyuLU/
         Dpxfrr4n90F2nqYEU+mYvRvywz2gRxUCjZqpDnZnk2vF3SyEbaaiUb7FXd1m56S3qIny
         2GwA==
X-Gm-Message-State: AOAM533Rco8J59M1B2yhLyNKNdPtmEZbb2lCkUpHwr92/Mfrv7yNYnAU
        xV/iZeBEUvfK7+WzSR26sPSLfhd8dpPIQWS6
X-Google-Smtp-Source: ABdhPJz0lwKeu7K9RB3IzmSFYBp7AIF6ASq5a+5Q0YeRnhGQt197OSVsxY4iOSxejWmBynjYYdGerA==
X-Received: by 2002:a5d:6f0e:: with SMTP id ay14mr22305793wrb.60.1643735743021;
        Tue, 01 Feb 2022 09:15:43 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id d7sm20665428wri.117.2022.02.01.09.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 09:15:42 -0800 (PST)
Date:   Tue, 1 Feb 2022 17:15:40 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Jia-Ju Bai <baijiaju1990@gmail.com>
Cc:     mani@kernel.org, hemantk@codeaurora.org, bbhatt@codeaurora.org,
        loic.poulain@linaro.org, jhugo@codeaurora.org,
        linux-arm-msm@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [BUG] bus: mhi: possible deadlock in mhi_pm_disable_transition()
 and mhi_async_power_up()
Message-ID: <20220201171540.2udq3x6r2swctzau@maple.lan>
References: <d3a94b53-0d77-dafe-ce45-f9ab23278616@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d3a94b53-0d77-dafe-ce45-f9ab23278616@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Jan 29, 2022 at 10:56:30AM +0800, Jia-Ju Bai wrote:
> Hello,
> 
> My static analysis tool reports a possible deadlock in the mhi driver in
> Linux 5.10:
> 
> mhi_async_power_up()
>   mutex_lock(&mhi_cntrl->pm_mutex); --> Line 933 (Lock A)
>   wait_event_timeout(mhi_cntrl->state_event, ...) --> Line 985 (Wait X)
>   mutex_unlock(&mhi_cntrl->pm_mutex); --> Line 1040 (Unlock A)
> 
> mhi_pm_disable_transition()
>   mutex_lock(&mhi_cntrl->pm_mutex); --> Line 463 (Lock A)
>   wake_up_all(&mhi_cntrl->state_event); --> Line 474 (Wake X)
>   mutex_unlock(&mhi_cntrl->pm_mutex); --> Line 524 (Unlock A)
>   wake_up_all(&mhi_cntrl->state_event); --> Line 526 (Wake X)
> 
> When mhi_async_power_up() is executed, "Wait X" is performed by holding
> "Lock A". If mhi_pm_disable_transition() is concurrently executed at this
> time, "Wake X" cannot be performed to wake up "Wait X" in
> mhi_async_power_up(), because "Lock A" is already hold by
> mhi_async_power_up(), causing a possible deadlock.
> I find that "Wait X" is performed with a timeout, to relieve the possible
> deadlock; but I think this timeout can cause inefficient execution.
> 
> I am not quite sure whether this possible problem is real and how to fix it
> if it is real.
> Any feedback would be appreciated, thanks :)

Interesting find but I think it would be better to run your tool
against more recent kernels to confirm any problem reports. In this
case the code you mention looks like it was removed in v5.17-rc1
(and should eventually make its way to the stable kernels too).


Daniel.
