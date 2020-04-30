Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E52571C03BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2020 19:21:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726760AbgD3RU7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Apr 2020 13:20:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726380AbgD3RUz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Apr 2020 13:20:55 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EB35C035494
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2020 10:20:54 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id f7so94805pfa.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2020 10:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OaoWzWV5VQdkXlx1W0mhM139g1iUDLV+um1kY+EVRdA=;
        b=mX/VUhlD5Z5dC1P65kSuNUE7hIcr4Kh/o+uBhm/q690m4TF+Ot8HGqz3wlGXLRZx1w
         GaII4K+11fo2JiO8nGIhZ45BA6l3W9HEoT6/BC+7k7ggmAeCMolqx7zjtjtg1LWMyU4Q
         8mGUONSEyM0r3moVIl7UB55iDJAmoo9a0cbix0IX7l8RJsdjZgjA5MMQgZ/cTL++yFjH
         WvAEL8s02KL3f+Hg2apCdJ7UEdGB3jj5YobUiV0V9/bfCntWnmjzY+fFpsJlr7XbAD4L
         OKDZu4xoh3+RjQZX3kSAUT0D8Fmd26ZIzt3joXLJIR0au3J7iuyClHxzfWIpQEze2XVC
         UTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OaoWzWV5VQdkXlx1W0mhM139g1iUDLV+um1kY+EVRdA=;
        b=Qt8k3xwVCsrev8TZOt9RI0hZFdZnbc+1ZTIZftRkVm0QoAT5tV12GjH+2sZwO/7DA2
         PiDDQJpQSuI13Gbmk7sTY+GzJGD17MmQVLec8IeWZd1tkmOqcy9n0M47ov+tmM7jC2AW
         lvmlTb8O6pyRZQ4TbdLJ1kSrWOKVqkLNYbBpLcSPNqq2SCsFh6vXEcZFuHJh6zpTlfFQ
         LnU4Mw3cYhA8fOmvP1T8vl3gogWV4PPclR2rQpnt1MnFB7pi0Dhlptms5rjHR6GFdUVt
         Ds0XUypCtINkhPn9CWC4KKB4MytL/H0JHaY7GfOJgjmJevKtILHwY6eB5Rd89T9aV4U0
         28/w==
X-Gm-Message-State: AGi0PuZeLlU67eYtANDdSndsQgRQkgyLdaP4BDFMYyss17LJFb/Br+WO
        jFN3cwzQW7geOwLkpT3htQar3xJHLSHK
X-Google-Smtp-Source: APiQypIFGoYKRmXCKaIropj/Nb4pYx44aEvNe68yMeW1wIRAxBHaoAvIr159kwiS4aSfJ9JlX1R0KQ==
X-Received: by 2002:a63:6f82:: with SMTP id k124mr1258152pgc.278.1588267253330;
        Thu, 30 Apr 2020 10:20:53 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6081:946c:419e:a71:7237:1613])
        by smtp.gmail.com with ESMTPSA id k4sm290920pgg.88.2020.04.30.10.20.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 10:20:52 -0700 (PDT)
Date:   Thu, 30 Apr 2020 22:50:47 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/6] Misc MHI fixes
Message-ID: <20200430172047.GI9449@Mani-XPS-13-9360>
References: <1588003153-13139-1-git-send-email-jhugo@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588003153-13139-1-git-send-email-jhugo@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jeff,

On Mon, Apr 27, 2020 at 09:59:07AM -0600, Jeffrey Hugo wrote:
> A few (independent) fixes to the MHI bus for issues that I have come across
> while developing against the mainline code.
> 
> v3:
> -reorder series to put changes which are ready, based on reviews, in front
> -change error from EIO to ETIMEDOUT when sync_power_up fails
> -add change to correct a conflict of channel device names
> 
> v2:
> -fix syserr reset log message
> -fix power up error check code style
> -add change to remove pci assumptions for register accesses
> -add comment typo fix
> 
> 
> Jeffrey Hugo (6):
>   bus: mhi: core: Make sure to powerdown if mhi_sync_power_up fails
>   bus: mhi: core: Remove link_status() callback
>   bus: mhi: core: Offload register accesses to the controller
>   bus: mhi: core: Fix typo in comment
>   bus: mhi: core: Handle syserr during power_up
>   bus: mhi: core: Fix channel device name conflict
> 

I'll queue all these patches except [5/6] to mhi-next branch and also send
them along with one of my fix to Greg to be included in upcoming RC.

Thanks,
Mani

>  drivers/bus/mhi/core/init.c     |  7 +++----
>  drivers/bus/mhi/core/internal.h |  3 ---
>  drivers/bus/mhi/core/main.c     | 16 ++++------------
>  drivers/bus/mhi/core/pm.c       | 26 +++++++++++++++++++++++++-
>  include/linux/mhi.h             | 10 +++++++---
>  5 files changed, 39 insertions(+), 23 deletions(-)
> 
> -- 
> Qualcomm Technologies, Inc. is a member of the
> Code Aurora Forum, a Linux Foundation Collaborative Project.
