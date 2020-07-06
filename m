Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21B29215DE8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2020 20:04:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729716AbgGFSEk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jul 2020 14:04:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729632AbgGFSEk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jul 2020 14:04:40 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71C25C061794
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2020 11:04:40 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id u185so15243922pfu.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2020 11:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mt7RscZq1TJMb1tWvWuPIetOt+Q1/nE1Zx/gXdxvawg=;
        b=q23x4gWkEKgxG/i1z9YbYrVkvHDm9PQY1dG75p9Cq/6mHNPUrcfflET/MB6PpKClEG
         nbkV2v9/v5x4Q6IvTO67PADDQYppWAbpP3oqjBUUc/eLhCHVZkTx4APdBzBvfT49KnS1
         MXoHMXH+BMegcK10pJS4MuRM7B0ybit5zVlcjqkneRyDJU0/7KTQhJ+JXJB43YBOQ9gc
         p8Hwv+oNtkdlkpLvDz2yask5Vrb9t3aQ6jRrmrCF8A0rYiXekArNovlbNq/GGvMGvAwo
         4sTSY329v9qgn7X919roRObd1DpAStVWsLbEF3Bl0QJ1sqivhjCKUNN3i6J7D7OXFnwG
         35UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mt7RscZq1TJMb1tWvWuPIetOt+Q1/nE1Zx/gXdxvawg=;
        b=mit2guTqegw0OIATqfTQImvqGBybwSrzoMLJ81wyOl/haxJ/44Tjz1aZPUsBLqXVaX
         v9wgZIE2Cz4FXEZNJLULNAcfltWb3XzFr6vlobZZMok/sMTUkp/DzJ+JkRmGh1QkoKt2
         zgMPrqP8mmStFUYISlD1E7ntRKiXp6KQoHYObnaL6bY/q2nTOEi4uYbMUmSEy0kkh0w7
         fEih5Hop92/I+fqKvEWuGEHuQKb62N1gfgHnQAeeehXN09rdTTf6WTVzY/6VAzN47ClK
         W3UBnou3n2L8cybCZL4ldnNdcLW9ueFrLUAgKBwp1scIk90bWzPJOIt7xCDmzjEAIgBu
         mjmw==
X-Gm-Message-State: AOAM530TVVvlc4LcucrlZxwoYiGLemkJU52R0EuOukP5fj1qvK4vt6M4
        YT9+F2eV+z6YrpBZkWfmkuoTag==
X-Google-Smtp-Source: ABdhPJyaUf4iyVeVudOQqfvRRfSSiadh+8eBe/LyFvtUQy7eIyw5mrvdsAsQTwxI347UihI7KpSf3A==
X-Received: by 2002:aa7:952b:: with SMTP id c11mr18629395pfp.186.1594058679877;
        Mon, 06 Jul 2020 11:04:39 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id u74sm20051365pgc.58.2020.07.06.11.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 11:04:39 -0700 (PDT)
Date:   Mon, 6 Jul 2020 12:04:37 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Deepak Kumar Singh <deesin@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, clew@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH V5 0/4] Signaling api support in glink/rpmsg clients
Message-ID: <20200706180437.GB614737@xps15>
References: <1593182819-30747-1-git-send-email-deesin@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1593182819-30747-1-git-send-email-deesin@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Deepak,

On Fri, Jun 26, 2020 at 08:16:55PM +0530, Deepak Kumar Singh wrote:
> Change from version 5
> [V5,4/4] rpmsg: char: Add signal callback and POLLPRI support
> Updated for sparse warning. Replaced POLLPRI => EPOLLPRI to fix
> warning.
> 
> Change from version 4
> I am taking over these patches from aneela@codeaurora.org
> Fixed all the trivial review comments.
> 
> Signal conversion to and from native signal as done in patch V4,2/4
> is intentional.
> 
> Arun Kumar Neelakantam (3):
>   rpmsg: glink: Add support to handle signals command
>   rpmsg: char: Add TIOCMGET/TIOCMSET ioctl support
>   rpmsg: char: Add signal callback and POLLPRI support
> 
> Deepak Kumar Singh (1):
>   rpmsg: core: Add signal API support

I'm confused here - V5 (or what I think it is) was sent out on June 24th without
a cover letter.  This set has a cover letter but it is labeled V5.  So is this
the cover letter that should have been sent out on the 24th and the content
herein relevent to that set?  Or is it accurate and the label on the cover
letter of this set is wrong and should have been V6?

I have little confidence in both sets and as such won't be reviewing them.
Please send a new revision that is properly labeled.

Thanks,
Mathieu   


> 
>  drivers/rpmsg/qcom_glink_native.c | 125 ++++++++++++++++++++++++++++++++++++++
>  drivers/rpmsg/rpmsg_char.c        |  76 ++++++++++++++++++++++-
>  drivers/rpmsg/rpmsg_core.c        |  40 ++++++++++++
>  drivers/rpmsg/rpmsg_internal.h    |   5 ++
>  include/linux/rpmsg.h             |  27 ++++++++
>  5 files changed, 270 insertions(+), 3 deletions(-)
> 
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
