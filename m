Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 566402FED7C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jan 2021 15:53:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729593AbhAUOvU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jan 2021 09:51:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730064AbhAUOvD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jan 2021 09:51:03 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84AE3C06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jan 2021 06:50:23 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id cq1so1795960pjb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jan 2021 06:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=A6/bA1MgplZUG26J8G5Fe59NQfim1BcuRy5CK9gZx1U=;
        b=Fy4+3Ag3HLw5h41R0aJPqvEEDeIBHVKxNIYfA7ZgLQcBVuTi/skbW1/6nyy+eMsI1b
         PbiNvWBLFObZH6xgWZbEcLgOih+Dfiqg/2wco7WZuJ0zJqdUauaWQfGGclFPPGgd1DMW
         jImQv9/vqz1i7+0lYNsKNXjlspGE2HLu2BaF099X9T66EOeeYYYTMSUbP9hFTfaIjahx
         Qr6iv8p/N4O6y4Mh9vFwenhn/yhpV/SUo1p9brFpAplLvTDtrvJHuRx2V502FBkzGi6A
         WJKMWy2fy1x6dtcqSIeI4eHLqHvm+mTdMxYREKtokwNVaGVyq27uMAaDM75yMeO7yM3g
         QlIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=A6/bA1MgplZUG26J8G5Fe59NQfim1BcuRy5CK9gZx1U=;
        b=ipzHlx/D8C32vjdo7TrGNrZSW9u+7SRwdS8ajFu21z21eDfu+yXDDMe9eNj3JeeBOZ
         n/UXx5J+YBUxRLaD5YOgneA5IvguuEfYFn5XsZPHihEu662bFUA3PSmqZ2FRNWQqN3Um
         bmOP0zJanri9eBYG50FpXx28BqFDclrkzg8g3y4uwZnDjf29OltULFGHbX8Rz8La/P7C
         vZZ3sjAjma18JEpRD5WEPtH7wHaVDmSyWEUA7CY5KJ6tMxA32TyyKYq1f+kFUMXdBf3b
         fncGmYcTsbFX1A67xEKnlyDzSgxdBmjnO2t6wJTG3oKpshZsH8R/aG9AemddEEDvs0K2
         SG8w==
X-Gm-Message-State: AOAM5330qA3g5DzDMb/MIvqcLnU2FWBTWWhySay4gsE+HiKdrgqplIsh
        qwyHtUm0RgmcXlo5rGug7e+q2+VB5r3J
X-Google-Smtp-Source: ABdhPJxNYAJ9GhFAWoHDUq/s5lhwjbtg58T00xGm5r0pJVsZWTtt+NuJ4fCgvN9vovCU/LKam1xLuQ==
X-Received: by 2002:a17:90b:182:: with SMTP id t2mr12712899pjs.50.1611240623014;
        Thu, 21 Jan 2021 06:50:23 -0800 (PST)
Received: from work ([103.77.37.184])
        by smtp.gmail.com with ESMTPSA id c85sm5787366pfb.37.2021.01.21.06.50.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Jan 2021 06:50:21 -0800 (PST)
Date:   Thu, 21 Jan 2021 20:20:18 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org
Subject: Re: [PATCH v5 5/9] bus: mhi: core: Add support to stop or start
 channel data transfers
Message-ID: <20210121145018.GC5473@work>
References: <1610139297-36435-1-git-send-email-bbhatt@codeaurora.org>
 <1610139297-36435-6-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1610139297-36435-6-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jan 08, 2021 at 12:54:53PM -0800, Bhaumik Bhatt wrote:
> Some MHI client drivers may want to request a pause or halt of
> data transfer activity on their channels. Support for this does
> not exist and must be introduced, wherein the channel context is
> not reset or cleared but only the STOP channel command is issued.
> This would need to be paired with an API that allows resuming the
> data transfer activity on channels by use of the START channel
> command. This API assumes that the context information is already
> setup. Enable this using two new APIs, mhi_start_transfer() and
> mhi_stop_transfer().
> 

Do you have any user for these APIs? If not then please post it when one
is available.

Thanks,
Mani
