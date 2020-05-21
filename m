Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B7E21DD1E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2020 17:29:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729678AbgEUP3l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 May 2020 11:29:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728266AbgEUP3j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 May 2020 11:29:39 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31A1CC061A0F
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2020 08:29:38 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id a13so2967759pls.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2020 08:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dzTSkoUSf6ji3NTN+1eYpRWJNdw3yxOKZnV7YqVUwaw=;
        b=u8Ez7YlVrl4SrqtiHTcp0HdaD7SBjyNaGbUW0ZxGIYH8C9cRKIeQItl34KvkZaxOvM
         j/GynPp+bUv1b0gvkN3fbRROKwV+c9TAogwmSJjb1N2jRdhDz2UFowH5GeqO5YG354Ng
         McsmL8Y35p6qnS4Akf5zBOat0x94yASD/ZZsJ1q5VFR0TgyWwczi0kgf5K/FjriD/8aN
         KNmP5hWxQZnPHAUADA8yGD/Ld8yKVqAx6e9eXw0UaZHa2Gu2du4z39br58K+NflmtSMB
         qr6hkV36mKnpH5l0cPx71qu7CMgbfNNrOOF11gnT2C5cSeofI3ihnHZDai+FFxlMkZEV
         AWHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dzTSkoUSf6ji3NTN+1eYpRWJNdw3yxOKZnV7YqVUwaw=;
        b=AtJv/jA7QeTELeIlG6nCbkBKbm8NF6oG2GFefKOk+xMQ/21LrP2mQbOw99+f3ucjMF
         3cWW3lPOKqMyjZv8vBUwlgnK1guKugirRSfQmjLc3HTHl2qnReae7viXlmItytI0swli
         ntNZdx+NxWxfkEGD3AnkQXD4ItvuITceewNT7dJBYfFVlmCbzC2/Ha4pjZtcitw1ER5M
         pZ8lIlhOnFf8sfkAq/xwBpapra2+R1YDaWHYaw8g5x2LhqchEO3jmn2GOIAL+glRG5Zv
         ruv9dUdQjoW4Sb8CaFt01a2bRezts3kJgSWe3zTTwBCYUkVzxXsj6SIDNb8c0Pe0mWID
         3bPw==
X-Gm-Message-State: AOAM531068mY7G9+kDGRdIJdcNJNuIYU9X3+YVjvoazV/DaODD8+zNe6
        Wtqtz9evPpdfgsm22r7RiTK2
X-Google-Smtp-Source: ABdhPJwYtjxuead8StBG7/eIdFNkN27jA3CXxe192i8JIyP1rKaRh7+cC5imuRmmgO5E06T0Mj8BWw==
X-Received: by 2002:a17:90a:ea84:: with SMTP id h4mr12024975pjz.8.1590074977412;
        Thu, 21 May 2020 08:29:37 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:69f:45f2:3d8d:3719:f568:7ee9])
        by smtp.gmail.com with ESMTPSA id z6sm4524343pgu.85.2020.05.21.08.29.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 May 2020 08:29:36 -0700 (PDT)
Date:   Thu, 21 May 2020 20:59:30 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, jhugo@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/14] MHI patches for v5.8
Message-ID: <20200521152930.GA16101@Mani-XPS-13-9360>
References: <20200521152540.17335-1-mani@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200521152540.17335-1-mani@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 21, 2020 at 08:55:26PM +0530, mani@kernel.org wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Hi Greg,
> 
> Here is the set of MHI patches for v5.8. Most of the patches are cleanup and
> refactoring ones. All of them are reviewed by myself and Jeff and also
> verified on x86 and ARM64 architectures for functionality.
> 

Greg,

Sorry, something wrong happened with my git config and these patches were sent
from my korg ID. Please let me know if I have to resend from my linaro ID to
match the signed-off-by tag.

Sorry for the confusion!

Thanks,
Mani

> Here is the short summary:
> -------------------------------------------------------------
> 
> - The firmware download was handled by a worker thread which gets scheduled
> when the device powers up. But this thread waits until the device gets into
> PBL state (notified using PM state worker). Sometimes, there might be delay for
> the device to enter PBL state and due to that the firmware worker thread will
> timeout. So in order to handle this situation effectively, the firmware load
> is now directly called by PM state worker instead of scheduling the thread.
> 
> - Return proper error codes incase of error while loading the AMSS firmware
> through BHIE protocol
> 
> - The MHI register space of the device accepts only non-zero values for the
> sequence identifier. But there is a possibility that the host might write zero
> (due to the use of prandom_u32() API). Hence, a macro is introduced which
> provides non-zero sequence identifiers and used them in all places.
> 
> - Moved all common TRE generation code to mhi_gen_tre() function
> 
> - The MHI host reads channel ID from the event ring element of the client
> device. This ID can be of any value between 0 to 255 but the host may not
> support all those IDs. So reject the event ring elements whose channel IDs
> are not within the limits of the controller.
> 
> - Limit the transfer length read from the client device. This value should
> be within the size of the MHI host buffer but there are chances this can
> be larger.
> 
> - Remove the system worker thread for processing the SYS_ERR condition and
> instead call the function directly from EE worker. This is done to avoid
> any possible race while MHI shutting down.
> 
> - Handle MHI power off in the state worker thread as like MISSION_MODE. This
> helps in preventing a possible race condition where a power off is issued by
> the controller while processing mission mode.
> 
> - Skip the handling of BHI interrupt when the register access is not allowed
> due to the device in wrong PM state.
> 
> - The write_lock of 'mhi_chan->lock' should only protect 'db_mode'. Hence, use
> it properly in places where it is protecting other unwanted regions.
> 
> - Reset the client device if it is in SYS_ERR state during power up.
> 
> -------------------------------------------------------------
> 
> Please consider merging!
> 
> Thanks,
> Mani
> 
> Bhaumik Bhatt (4):
>   bus: mhi: core: Handle firmware load using state worker
>   bus: mhi: core: Return appropriate error codes for AMSS load failure
>   bus: mhi: core: Improve debug logs for loading firmware
>   bus: mhi: core: Ensure non-zero session or sequence ID values are used
> 
> Hemant Kumar (9):
>   bus: mhi: core: Refactor mhi queue APIs
>   bus: mhi: core: Cache intmod from mhi event to mhi channel
>   bus: mhi: core: Add range check for channel id received in event ring
>   bus: mhi: core: Read transfer length from an event properly
>   bus: mhi: core: Remove the system error worker thread
>   bus: mhi: core: Handle disable transitions in state worker
>   bus: mhi: core: Skip handling BHI irq if MHI reg access is not allowed
>   bus: mhi: core: Do not process SYS_ERROR if RDDM is supported
>   bus: mhi: core: Handle write lock properly in mhi_pm_m0_transition
> 
> Jeffrey Hugo (1):
>   bus: mhi: core: Handle syserr during power_up
> 
>  drivers/bus/mhi/core/boot.c     |  75 ++++++------
>  drivers/bus/mhi/core/init.c     |   8 +-
>  drivers/bus/mhi/core/internal.h |   9 +-
>  drivers/bus/mhi/core/main.c     | 194 ++++++++++++++++++--------------
>  drivers/bus/mhi/core/pm.c       |  86 +++++++++-----
>  include/linux/mhi.h             |   4 -
>  6 files changed, 217 insertions(+), 159 deletions(-)
> 
> -- 
> 2.26.GIT
> 
