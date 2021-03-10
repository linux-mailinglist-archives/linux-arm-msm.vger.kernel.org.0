Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A10A333FF4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 15:09:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232814AbhCJOIg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 09:08:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232808AbhCJOID (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 09:08:03 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50C74C061760
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 06:08:03 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id x29so11479946pgk.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 06:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1dnlnnG6guD+k60v0FjgIQ9Tl0jScXDP+aIyOD9ZKPM=;
        b=GjngrHxG9FWe61VRrJrlxC4tkNTga3gHgNntUI85TOQDpxUl7QniRLvNaTEunqxIpq
         YelY/uEze7X1rZIqJq00Ty4RcWMrwkb4Mf2wl23W9+VRqoo2fYofBnQ/MLENGCEi7r/7
         tP1gXGhPhmuPHhYqL4fpBYfX1Cn0K7iuqbeejI0Nu9zI1B9t3Y+E+bJ31rWeAdMuVq4r
         52elek1Osb+ui0lAavWCzYXIE5HrUleeiAU9KYnqSR2GIX4YW34UY74okWeuA8dHQbLg
         pEdP1MvMY9dtj/mWCz3lNFkBGC5M1OlzYbFWhj+LjIldCGOBJgnw+z6gh1wzI2FgP3NC
         1nhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1dnlnnG6guD+k60v0FjgIQ9Tl0jScXDP+aIyOD9ZKPM=;
        b=G2Yt3Wq+5Dfw7kYiY0uaVzk2HF9j7sbQHjQ1vHANWZZgyF+gTuWOyko/8Nb3fr4gqe
         rGVpftYFiFFM1XQR3zceCi9ImipD79wfOhVpdl6SyWNlK+7CYFouKEb2yhWI9MawQffB
         QBaFN8SLFg2vF2kxcwk5j5NrnjekaL2TZKsqqUUtBlmMxkEv7PiIaX4+wh6jlo5V5Ewf
         zcPvjvdn1zTfDK7gjmjXUALQcz/cwdvJO58D/f05pDeWfQzTK8+zjHPCU9an3ZAy+8po
         j4nD4MpnADbgSU3OXvbRwHDBHtWIVKLFVdn09GftJRo8OqOFTmH4bA7687j8NW2/haor
         a2HA==
X-Gm-Message-State: AOAM532R8Ff9ijWyQBbQy7fdLLbM7whLpmNHiOpjF4AFAt2Hhi1B9qav
        hrexO3ZfxDhl1HcyTo6xZogi
X-Google-Smtp-Source: ABdhPJzB3BEVU7GeZTLogAHSOrU0BB2nEVrffSEQzYG+GiguZDb0u64v6wwiRKp1s7M67qmah8Wlfw==
X-Received: by 2002:aa7:9989:0:b029:1f5:aa05:94af with SMTP id k9-20020aa799890000b02901f5aa0594afmr3045232pfh.34.1615385282806;
        Wed, 10 Mar 2021 06:08:02 -0800 (PST)
Received: from thinkpad ([103.66.79.59])
        by smtp.gmail.com with ESMTPSA id m3sm15895961pgk.47.2021.03.10.06.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 06:08:02 -0800 (PST)
Date:   Wed, 10 Mar 2021 19:37:56 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org, carl.yin@quectel.com,
        naveen.kumar@quectel.com
Subject: Re: [PATCH v6 0/4] Serialize execution environment changes for MHI
Message-ID: <20210310140756.GR30275@thinkpad>
References: <1614208985-20851-1-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614208985-20851-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 24, 2021 at 03:23:01PM -0800, Bhaumik Bhatt wrote:
> v6:
> -Add patch to improve debug message
> -Fix switch-case fall through warning for EE serialization patch
> -Address review comments and update commit text
> 
> v5:
> -Update commit text for "clear devices when moving execution environments" patch
> -Added test platform details that were missed out in the cover letter
> -Merged two if checks in to a single one for EE serialization patch
> 
> v4:
> -Addressed review comments for additional info logging for EE movements
> -Updated switch case for EE handling in mhi_intvec_threaded_handler()
> 
> v3:
> -Update commit text to accurately reflect changes and reasoning based on reviews
> 
> v2:
> -Add patch to clear devices when moving execution environments
> 
> Note: This patch is first in series of execution environment related changes.
> 
> During full boot chain firmware download, the PM state worker downloads the AMSS
> image after waiting for the SBL execution environment change in PBL mode itself.
> Since getting rid of the firmware load worker thread, this design needs to
> change and MHI host must download the AMSS image from the SBL mode of PM state
> worker thread instead of blocking waits for SBL EE in PBL transition processing.
> 
> Ensure that EE changes are handled only from appropriate places and occur
> one after another and handle only PBL or RDDM EE changes as critical events
> directly from the interrupt handler and the status callback is given to the
> controller drivers promptly.
> 
> When moving from SBL to AMSS EE, clear SBL specific client devices by calling
> remove callbacks for them so they are not left opened in a different execution
> environment.
> 
> This patchset was tested on ARM64.
> 

Series applied to mhi-next!

Thanks,
Mani

> Bhaumik Bhatt (4):
>   bus: mhi: core: Destroy SBL devices when moving to mission mode
>   bus: mhi: core: Download AMSS image from appropriate function
>   bus: mhi: core: Process execution environment changes serially
>   bus: mhi: core: Update debug prints to include local device state
> 
>  drivers/bus/mhi/core/boot.c     | 51 +++++++++++++--------------
>  drivers/bus/mhi/core/internal.h |  1 +
>  drivers/bus/mhi/core/main.c     | 76 +++++++++++++++++++++++++++--------------
>  drivers/bus/mhi/core/pm.c       | 10 ++++--
>  4 files changed, 83 insertions(+), 55 deletions(-)
> 
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
