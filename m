Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CD55248246
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 11:52:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726357AbgHRJwo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Aug 2020 05:52:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbgHRJwm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Aug 2020 05:52:42 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19941C061342
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2020 02:52:42 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id c6so9186049pje.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2020 02:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HngpiG1gQB2OuVdbYZPjDidF2R9Sis8V4dhpfYTXD1k=;
        b=qvZlWgB208NPxxvIaw2n/2K91FtxDWBHJczlBRp/y4tdticMmarHzpw8OWL8EnJLSG
         cdAzk+TR5RvGzwYMWTbY2UXC9FiPatuFj98Ao56UWV/XmycpfhfO9OjIJl7i3r61SRmY
         zi+scozI+NHZJEcfJUrPye7n7wl+tFkzUaJKhuH+DiTr10EYUAtNRMAmWhJGEO0LyI4K
         LAMFeaIguZZJs1Qy6AeKbrZcPkAmfyn9m0HRVpJ4HsVEHzWndzyuqOhv2Usu9Tac0eNV
         synyiAoJxIAvT3DeNua+Z2ggX2bD1LuKJdCststFAlJU5sjhH13F9wuGvF3snlXTvB8m
         SLnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HngpiG1gQB2OuVdbYZPjDidF2R9Sis8V4dhpfYTXD1k=;
        b=j7/EpozQLT286vXKkDXqN6uNwY4PAQHdKgQ65iYdTVbqmQNqwc0mnAN+KdBvzWYjx4
         N0jUHxGg2wDcEdmIyo0lgPL7y6eVTpja5eRpyzh9cnCpIimiaLbmUgpQ3WDZwBV0Wr6S
         mCQTh9R8DxfyDa7LCM9I4fnJwXB0KCXXxUl3z6kSrvtnd/TZ1iC3jj+NYl7eMS4F82YI
         w+ALiyJ8ERqruWWS20BA6XTZYjHHQ3Jfpk0xEJEHH6d7VqxV21wJRK0Y9hYszTRYVUAV
         aMPIyKs3nPMdhU+SgmCPd2EVt58SYX1VP3jdfbxotPFmIgV67XAOa8lsRrIP468coYIl
         o9NQ==
X-Gm-Message-State: AOAM532gNg1h+VIUGsW6mNroP1x71325ilWBdG2HfWH/WFJ1D60f6id3
        xuF73iFNqw9lmkiIQd26wFzu
X-Google-Smtp-Source: ABdhPJwULNcGMAqp61TcSMHe/zMDxpulczRRMG3x8iFICVkRFnfU9QVCQuo2Pdv0MDhG7rHTGXe1tA==
X-Received: by 2002:a17:90b:796:: with SMTP id l22mr15965293pjz.46.1597744361514;
        Tue, 18 Aug 2020 02:52:41 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:796:aa9c:e184:5916:ccba:b6d1])
        by smtp.gmail.com with ESMTPSA id y19sm23186134pfn.77.2020.08.18.02.52.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Aug 2020 02:52:40 -0700 (PDT)
Date:   Tue, 18 Aug 2020 15:22:34 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 00/11] Introduce features and debugfs/sysfs entries
 for MHI
Message-ID: <20200818095234.GC13207@Mani-XPS-13-9360>
References: <1597096865-19636-1-git-send-email-bbhatt@codeaurora.org>
 <20200811062625.GD2762@Mani-XPS-13-9360>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200811062625.GD2762@Mani-XPS-13-9360>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 11, 2020 at 11:56:25AM +0530, Manivannan Sadhasivam wrote:
> Hi Bhaumik,
> 
> On Mon, Aug 10, 2020 at 03:00:54PM -0700, Bhaumik Bhatt wrote:
> > Save hardware information from BHI.
> > Allow reading and modifying some MHI variables for debug, test, and
> > informational purposes using debugfs.
> > Read values for device specific hardware information to be used by OEMs in
> > factory testing such as serial number and PK hash using sysfs.
> > 
> > This set of patches was tested on arm64 and x86.
> > 
> 
> Sorry for stretching the review so long. Will apply the series to mhi-next
> once v5.9-rc1 is out.

Series applied to mhi-next!

Thanks,
Mani

> 
> Thanks,
> Mani
> 
> > v7:
> > -Added suggested-by and reviewed-by tags
> > -Fixed nitpick on removal of M3_fast counter as it was unused
> > -Updated sysfs documentation dates and intended kernel version
> > -Fixed minor debugfs formatting by removing an extra newline character
> > 
> > v6:
> > -Introduced APIs for allocating and freeing the MHI controller so as to ensure
> > that it is always zero-initialized
> > -Moved gerrits around for counter introduction
> > -Fixed documentation for sysfs
> > 
> > v5:
> > -Removed the debug entry to trigger reset and will be addressed in a seperate
> > patch
> > -Added patch bus: mhi: core: Use counters to track MHI device state transitions
> > -Updated helper API to trigger a non-blocking host resume
> > -Minor nitpicks also fixed
> > 
> > v4:
> > -Removed bus: mhi: core: Introduce independent voting mechanism patch
> > -Removed bus vote function from debugfs due to independent voting removal
> > -Added helper resume APIs to aid consolidation of spread out code
> > -Added a clean-up patch and a missing host resume in voting API
> > 
> > v3:
> > -Add patch to check for pending packets in suspend as a dependency for the
> > independent voting mechanism introduction
> > -Include register dump entry for debugfs to dump MHI, BHI, and BHIe registers
> > -Update commit message for the debugfs patch
> > -Updated Documentation/ABI with the required info for sysfs
> > -Updated debugfs patch to include a new KConfig entry and dependencies
> > -Updated reviewed-by for some patches
> > 
> > v2:
> > -Added a new debugfs.c file for specific debugfs entries and code
> > -Updated commit text and addressed some comments for voting change
> > -Made sure sysfs is only used for serial number and OEM PK hash usage
> > 
> > Bhaumik Bhatt (11):
> >   bus: mhi: core: Remove double occurrence for mhi_ctrl_ev_task()
> >     declaration
> >   bus: mhi: core: Abort suspends due to outgoing pending packets
> >   bus: mhi: core: Use helper API to trigger a non-blocking host resume
> >   bus: mhi: core: Trigger host resume if suspended during
> >     mhi_device_get()
> >   bus: mhi: core: Use generic name field for an MHI device
> >   bus: mhi: core: Introduce helper function to check device state
> >   bus: mhi: core: Introduce counters to track MHI device state
> >     transitions
> >   bus: mhi: core: Introduce debugfs entries for MHI
> >   bus: mhi: core: Read and save device hardware information from BHI
> >   bus: mhi: core: Introduce APIs to allocate and free the MHI controller
> >   bus: mhi: core: Introduce sysfs entries for MHI
> > 
> >  Documentation/ABI/stable/sysfs-bus-mhi |  21 ++
> >  MAINTAINERS                            |   1 +
> >  drivers/bus/mhi/Kconfig                |   8 +
> >  drivers/bus/mhi/core/Makefile          |   5 +-
> >  drivers/bus/mhi/core/boot.c            |  17 +-
> >  drivers/bus/mhi/core/debugfs.c         | 409 +++++++++++++++++++++++++++++++++
> >  drivers/bus/mhi/core/init.c            |  81 ++++++-
> >  drivers/bus/mhi/core/internal.h        |  37 ++-
> >  drivers/bus/mhi/core/main.c            |  27 +--
> >  drivers/bus/mhi/core/pm.c              |  26 ++-
> >  include/linux/mhi.h                    |  30 ++-
> >  11 files changed, 623 insertions(+), 39 deletions(-)
> >  create mode 100644 Documentation/ABI/stable/sysfs-bus-mhi
> >  create mode 100644 drivers/bus/mhi/core/debugfs.c
> > 
> > -- 
> > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> > a Linux Foundation Collaborative Project
> > 
