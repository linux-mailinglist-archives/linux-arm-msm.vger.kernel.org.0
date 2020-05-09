Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B6F01CBF19
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 May 2020 10:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728060AbgEIIcc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 May 2020 04:32:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728056AbgEIIcb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 May 2020 04:32:31 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81770C05BD09
        for <linux-arm-msm@vger.kernel.org>; Sat,  9 May 2020 01:32:31 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id f6so2034274pgm.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 May 2020 01:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=peLvqahApCXlAKnnF8w/bg1cqALJbiZS/A1EF+xPi00=;
        b=LrbMYBHzrTEwUubsD4bXrHd/O12wcfnLcBB2xQEAly6vOFT1BbjY/OqmXAH2/UgrNe
         Bn2Ntnvlc6r64PRHhJdWxMwdWuWrDeGeaJCa6Y5mRpDFTa9XTtWM919aSunq6GHWU9K0
         aHVu8iGJBhVUs03cl/333GJrymWHOWRgkAPM53+dXf8LAlErRZQuQGtFxe96Wr743hkm
         mXcbSS2jWNM8RRZqxVgNqCy9bQNpWbG9RPEH0nG7QER5kRsNLQaSyf7BFIupJpVOHYin
         y0vKJKK71+7a7+wddE17YP3Fgc22b5V9aNw7LcMvUBa7ezSd3tOYnGhnutguBQAjT5Wh
         gB1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=peLvqahApCXlAKnnF8w/bg1cqALJbiZS/A1EF+xPi00=;
        b=NWtEv3Uej/6ZyutWBPEJShuS+Q+S7BlSpaS54OpNEaG02DtxSqi+cNJlgg8NasWA7a
         Qv4QAsmctJOQBokOwWFvKLz1sDNjX7bpBah+sfqZ85I+0wprhI1hFNoQ2X4m2REnkF1l
         9hnQf5jasj16KShhIryZOMiiDb+8iGTnkd27WSrYXzIu6rxuFQX1e9jtcMpLaVoP+moG
         YeDYoKsqrp69Tcr+hCpbNDnMCxIoEBcZnVlqHqoIW6TcOm/BGPSBu7gmxFseIVRgggSI
         incDFmkUZiIlw8kj3iKD1KU8tNbBVmMp0+O+vGmuGiBcobljWiDcWJhZgRBitBgCi4Je
         fsSw==
X-Gm-Message-State: AGi0PubBdgyqUGV2S41JHBI5vVq1l1U9pRcrBYsL7D8tYRUpVyu6Kmjg
        /eEWUqpPPK+fe4ZzXa1+HyJC44McmA==
X-Google-Smtp-Source: APiQypKCtnP3YGP/0tbBzeoYE1Kt/ecQul45s9TbKG8s3Zx0j34tYMOJO44U4dTeAf9UBrLGuJRYVg==
X-Received: by 2002:aa7:9ac9:: with SMTP id x9mr6681146pfp.304.1589013150928;
        Sat, 09 May 2020 01:32:30 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6e0c:55d2:2cb4:da01:ad1e:6ad9])
        by smtp.gmail.com with ESMTPSA id h13sm3044895pgm.69.2020.05.09.01.32.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 May 2020 01:32:30 -0700 (PDT)
Date:   Sat, 9 May 2020 14:02:23 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        hemantk@codeaurora.org, jhugo@codeaurora.org
Subject: Re: [PATCH v7 0/8] Bug fixes and improved logging in MHI
Message-ID: <20200509083222.GJ5845@Mani-XPS-13-9360>
References: <1588991208-26928-1-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588991208-26928-1-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bhaumik,

On Fri, May 08, 2020 at 07:26:40PM -0700, Bhaumik Bhatt wrote:
> A set of patches for bug fixes and improved logging in mhi/core/boot.c.
> Verified on x86 and arm64 platforms.
> 

Series applied to mhi-next! I'll wait for one more -rc before sending the
final series to Greg for v5.8. If any other series gets reviewed by that point,
I'll club them together for the final one.

Thanks,
Mani

> v7:
> -Updated commit text for macro inclusion
> -Updated channel ID bound checks
> -Fixed non-uniform placement of function parameters to be within 80 characters
> -Sent to correct Maintainer email ID
> 
> v6:
> -Updated the MHI_RANDOM_U32_NONZERO to only give a random number upto the
> supplied bitmask
> 
> v5:
> -Updated the macro MHI_RANDOM_U32_NONZERO to take a bitmask as the input
> parameter and output a non-zero value between 1 and U32_MAX
> 
> v4:
> -Dropped the change: bus: mhi: core: WARN_ON for malformed vector table
> -Updated bus: mhi: core: Read transfer length from an event properly to include
> parse rsc events
> -Use prandom_u32_max() instead of prandom_u32 to avoid if check in
> bus: mhi: core: Ensure non-zero session or sequence ID values are used
> 
> v3:
> -Fixed signed-off-by tags
> -Add a refactor patch for MHI queue APIs
> -Commit text fix in bus: mhi: core: Read transfer length from an event properly
> -Fix channel ID range check for ctrl and data event rings processing
> 
> v2:
> -Fix channel ID range check potential infinite loop
> -Add appropriate signed-off-by tags
> 
> Bhaumik Bhatt (4):
>   bus: mhi: core: Handle firmware load using state worker
>   bus: mhi: core: Return appropriate error codes for AMSS load failure
>   bus: mhi: core: Improve debug logs for loading firmware
>   bus: mhi: core: Ensure non-zero session or sequence ID values are used
> 
> Hemant Kumar (4):
>   bus: mhi: core: Refactor mhi queue APIs
>   bus: mhi: core: Cache intmod from mhi event to mhi channel
>   bus: mhi: core: Add range check for channel id received in event ring
>   bus: mhi: core: Read transfer length from an event properly
> 
>  drivers/bus/mhi/core/boot.c     |  75 +++++++++----------
>  drivers/bus/mhi/core/init.c     |   5 +-
>  drivers/bus/mhi/core/internal.h |   5 +-
>  drivers/bus/mhi/core/main.c     | 156 +++++++++++++++++++++-------------------
>  drivers/bus/mhi/core/pm.c       |   6 +-
>  include/linux/mhi.h             |   2 -
>  6 files changed, 129 insertions(+), 120 deletions(-)
> 
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
