Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 764A135649D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Apr 2021 08:56:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345855AbhDGG4z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 02:56:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242439AbhDGG4y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 02:56:54 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A041C06174A
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Apr 2021 23:56:44 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id l76so12285640pga.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Apr 2021 23:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qlzTZxMrHlq9IaqoYKOJhu98bRmyXXyoDWHeXFeO+Y4=;
        b=S7iJhWrBVnhGLodRiVAEYpbEsjKXcw36YgsCvXSjljjp6i6wKWJ9cYhc2vpHOm9yFT
         SVcL3hqCEe14me2bFzG7Zei5iXci3bSEhBKMZ9pdEXeQADcsQzYuyCXILXut1qSEsWOs
         Do71CGaJO3dntbwkxCovcRu5yK6r0e1BiFdmrWFRLpObGfsDWaPM0Kp+8wz5O8JZYRIR
         ryRR9gEZ19ZYRP2I0fkJ+SNsNi9gGdSi0P9QbL6GIVGt2CGse0f4+CzXVPlb9fJaEiub
         5pMy9O4jfSwlC2gkZHiVS0/i8B9X4qRpvGfRa3cUI/hndGF83/mgAqaUPoq3U91XR9z6
         KMGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qlzTZxMrHlq9IaqoYKOJhu98bRmyXXyoDWHeXFeO+Y4=;
        b=dZBJCtdTAbIVtHiqFNcYGwJ0VpNFemoVaEWSlafJ08+VnFdje0cc95alSTRSpBOA22
         3OtZ+5ZFb4KKkRcyo2h/G5fKtlxmlHI5wdjluuSdz+bQZMlabvriS3QzioINjqQAx9Ez
         yhfuG7xAGhqVfDZ9MFsFGfat+p02r9hpBlO+yKEkUIo/EQ1Y6uGKRB3nCYZnHRrsMx0Z
         05kxNUvzEIUd3XhhdnlOOr8bVTdKUfWs5xufslwrvjWDJo/c1pBsJuf+o8lQnIb+zALB
         PokpVl1L1ubSkN0hEQVyCngV0jpNwmdBrxYBEAJAXSmSduYEN8MiglpSBo4L+5iu6wvl
         bqIQ==
X-Gm-Message-State: AOAM530OyN3aGhZ3Ik9AFl0Q6yN/2Md8WA6bBKSbrjP56KR7373w74YV
        5lo/nwkYVTRcEPoG7s4vbR28
X-Google-Smtp-Source: ABdhPJxfVatsZMv7+MAExdQodk/gPS37IrjWs/+GZhw62k+votfbyNuu4FQhziXufV+UJfaUVxB/Mg==
X-Received: by 2002:a63:48c:: with SMTP id 134mr1937231pge.347.1617778603893;
        Tue, 06 Apr 2021 23:56:43 -0700 (PDT)
Received: from work ([103.77.37.180])
        by smtp.gmail.com with ESMTPSA id p5sm4315078pfg.85.2021.04.06.23.56.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Apr 2021 23:56:43 -0700 (PDT)
Date:   Wed, 7 Apr 2021 12:26:39 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        carl.yin@quectel.com, naveen.kumar@quectel.com,
        loic.poulain@linaro.org
Subject: Re: your mail
Message-ID: <20210407065639.GM8675@work>
References: <1617311778-1254-1-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617311778-1254-1-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 01, 2021 at 02:16:09PM -0700, Bhaumik Bhatt wrote:
> Subject: [PATCH v8 0/9] Updates to MHI channel handling
> 

Subject is present in the body ;)

> MHI specification shows a state machine with support for STOP channel command
> and the validity of certain state transitions. MHI host currently does not
> provide any mechanism to stop a channel and restart it without resetting it.
> There are also times when the device moves on to a different execution
> environment while client drivers on the host are unaware of it and still
> attempt to reset the channels facing unnecessary timeouts.
> 
> This series addresses the above areas to provide support for stopping an MHI
> channel, resuming it back, improved documentation and improving upon channel
> state machine handling in general.
> 
> This set of patches was tested on arm64 and x86_64 architecture.
> 

Series applied to mhi-next!

Thanks,
Mani

> v8:
> -Split the state machine improvements patch to three patches as per review
> 
> v7:
> -Tested on x86_64 architecture
> -Drop the patch "Do not clear channel context more than once" as issue is fixed
> differently using "bus: mhi: core: Fix double dma free()"
> -Update the commit text to better reflect changes on state machine improvements
> 
> v6:
> -Dropped the patch which introduced start/stop transfer APIs for lack of users
> -Updated error handling and debug prints on channel handling improvements patch
> -Improved commit text to better explain certain patches based on review comments
> -Removed references to new APIs from the documentation improvement patch
> 
> v5:
> -Added reviewed-by tags from Hemant I missed earlier
> -Added patch to prevent kernel warnings on clearing channel context twice
> 
> v4:
> -Updated commit text/descriptions and addressed checkpatch checks
> -Added context validity check before starting/stopping channels from new API
> -Added patch to clear channel context configuration after reset/unprepare
> 
> v3:
> -Updated documentation for channel transfer APIs to highlight differences
> -Create separate patch for "allowing channel to be disabled from stopped state"
> 
> v2:
> -Renamed the newly introduced APIs to mhi_start_transfer() / mhi_stop_transfer()
> -Added improved documentation to avoid confusion with the new APIs
> -Removed the __ prefix from mhi_unprepare_channel() API for consistency.
> 
> Bhaumik Bhatt (9):
>   bus: mhi: core: Allow sending the STOP channel command
>   bus: mhi: core: Clear context for stopped channels from remove()
>   bus: mhi: core: Improvements to the channel handling state machine
>   bus: mhi: core: Update debug messages to use client device
>   bus: mhi: core: Hold device wake for channel update commands
>   bus: mhi: core: Clear configuration from channel context during reset
>   bus: mhi: core: Check channel execution environment before issuing
>     reset
>   bus: mhi: core: Remove __ prefix for MHI channel unprepare function
>   bus: mhi: Improve documentation on channel transfer setup APIs
> 
>  drivers/bus/mhi/core/init.c     |  22 ++++-
>  drivers/bus/mhi/core/internal.h |  12 +++
>  drivers/bus/mhi/core/main.c     | 190 ++++++++++++++++++++++++----------------
>  include/linux/mhi.h             |  18 +++-
>  4 files changed, 162 insertions(+), 80 deletions(-)
> 
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
