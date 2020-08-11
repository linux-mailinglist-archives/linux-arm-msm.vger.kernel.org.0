Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05674241648
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Aug 2020 08:26:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728045AbgHKG0d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Aug 2020 02:26:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728038AbgHKG0d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Aug 2020 02:26:33 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D20B2C061756
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2020 23:26:32 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id ha11so1328464pjb.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2020 23:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VJTXqvLrvMMQzRof1vfqgipc+TGVK+u9sAMmZlRXQAg=;
        b=TagRL43FdmkJVZHHkDLuQOHpBpVjVUeBo6kA7CgyCUtd9h0IiwlOyCCJ8JYKd/sRO6
         0G5GFEx76LsLH4gTbPLBMKX4OT/bZ8MY9Pg1ZlJXg6gvqKyEiPVP8c9gm7PBZvcpRS5k
         j27BBdBUMKGqy90oqSfEqe9bLV2aGZNMjPkhpfi3oks1dJ7myszwKtc/XudO2ujxlQD/
         cuA6VKgImD6dWvyDfQje9e5/vHLmNyebo4IMJeDuz7mDfU/0fw4sn25twlS5M45/0q4Z
         lVPJUShFl2Mc7CL+LgXUydGzOAmCHlBq9TxM6mpchTMkQGmK42A81G/xYqTUwTCnRnwQ
         +ZbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VJTXqvLrvMMQzRof1vfqgipc+TGVK+u9sAMmZlRXQAg=;
        b=RZQ1OPkEM3KF1nCNDzh7trd+Kx5ev7mTGrVUN4Lq+kr77Iw/RkN1ELGOtp8Fk9Zeik
         SGibvePbFMxonKsprSSzgacjVJPObReqo4eC0KQiDY7hhLFFBh7bGfUteXT8hiH/VnGW
         aKlSYqjpHC3nIjCHxQhdTwZEOkh7Hzl4M605FNrzGGDYeQXgEkeBtN4QAr6BcACoNuyX
         VWyiwiAWeZ3a3HTqmqgowtXIa2xbn/yz6X9Fs6UYuUra2vYnl20dPAcNoKqzjddtY4w5
         gh7I7KlSaiEFsMXhx3AD0/T6JS7BYLM94JuaHwG2C7Wn7vpTYmIyAyToxAhqKHdD5P9a
         NTvw==
X-Gm-Message-State: AOAM530RI9svAhU11a86+EtQvutoGK4TUMq1v4VZvVMnoL0Ami4ne7So
        otSe4bubeHUUxMRa1R0oUEIX
X-Google-Smtp-Source: ABdhPJzWa4+iScHbqTBVCEZxGz8oX3jdRGzQwlJy8qC9cvSt8meVn4PTHsxB0TneD/ZWVhU1qWqvJg==
X-Received: by 2002:a17:90a:cc14:: with SMTP id b20mr3052803pju.1.1597127192084;
        Mon, 10 Aug 2020 23:26:32 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:699:2bc7:b9eb:9a30:bf89:3f3d])
        by smtp.gmail.com with ESMTPSA id u15sm1432169pje.42.2020.08.10.23.26.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Aug 2020 23:26:31 -0700 (PDT)
Date:   Tue, 11 Aug 2020 11:56:25 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 00/11] Introduce features and debugfs/sysfs entries
 for MHI
Message-ID: <20200811062625.GD2762@Mani-XPS-13-9360>
References: <1597096865-19636-1-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1597096865-19636-1-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bhaumik,

On Mon, Aug 10, 2020 at 03:00:54PM -0700, Bhaumik Bhatt wrote:
> Save hardware information from BHI.
> Allow reading and modifying some MHI variables for debug, test, and
> informational purposes using debugfs.
> Read values for device specific hardware information to be used by OEMs in
> factory testing such as serial number and PK hash using sysfs.
> 
> This set of patches was tested on arm64 and x86.
> 

Sorry for stretching the review so long. Will apply the series to mhi-next
once v5.9-rc1 is out.

Thanks,
Mani

> v7:
> -Added suggested-by and reviewed-by tags
> -Fixed nitpick on removal of M3_fast counter as it was unused
> -Updated sysfs documentation dates and intended kernel version
> -Fixed minor debugfs formatting by removing an extra newline character
> 
> v6:
> -Introduced APIs for allocating and freeing the MHI controller so as to ensure
> that it is always zero-initialized
> -Moved gerrits around for counter introduction
> -Fixed documentation for sysfs
> 
> v5:
> -Removed the debug entry to trigger reset and will be addressed in a seperate
> patch
> -Added patch bus: mhi: core: Use counters to track MHI device state transitions
> -Updated helper API to trigger a non-blocking host resume
> -Minor nitpicks also fixed
> 
> v4:
> -Removed bus: mhi: core: Introduce independent voting mechanism patch
> -Removed bus vote function from debugfs due to independent voting removal
> -Added helper resume APIs to aid consolidation of spread out code
> -Added a clean-up patch and a missing host resume in voting API
> 
> v3:
> -Add patch to check for pending packets in suspend as a dependency for the
> independent voting mechanism introduction
> -Include register dump entry for debugfs to dump MHI, BHI, and BHIe registers
> -Update commit message for the debugfs patch
> -Updated Documentation/ABI with the required info for sysfs
> -Updated debugfs patch to include a new KConfig entry and dependencies
> -Updated reviewed-by for some patches
> 
> v2:
> -Added a new debugfs.c file for specific debugfs entries and code
> -Updated commit text and addressed some comments for voting change
> -Made sure sysfs is only used for serial number and OEM PK hash usage
> 
> Bhaumik Bhatt (11):
>   bus: mhi: core: Remove double occurrence for mhi_ctrl_ev_task()
>     declaration
>   bus: mhi: core: Abort suspends due to outgoing pending packets
>   bus: mhi: core: Use helper API to trigger a non-blocking host resume
>   bus: mhi: core: Trigger host resume if suspended during
>     mhi_device_get()
>   bus: mhi: core: Use generic name field for an MHI device
>   bus: mhi: core: Introduce helper function to check device state
>   bus: mhi: core: Introduce counters to track MHI device state
>     transitions
>   bus: mhi: core: Introduce debugfs entries for MHI
>   bus: mhi: core: Read and save device hardware information from BHI
>   bus: mhi: core: Introduce APIs to allocate and free the MHI controller
>   bus: mhi: core: Introduce sysfs entries for MHI
> 
>  Documentation/ABI/stable/sysfs-bus-mhi |  21 ++
>  MAINTAINERS                            |   1 +
>  drivers/bus/mhi/Kconfig                |   8 +
>  drivers/bus/mhi/core/Makefile          |   5 +-
>  drivers/bus/mhi/core/boot.c            |  17 +-
>  drivers/bus/mhi/core/debugfs.c         | 409 +++++++++++++++++++++++++++++++++
>  drivers/bus/mhi/core/init.c            |  81 ++++++-
>  drivers/bus/mhi/core/internal.h        |  37 ++-
>  drivers/bus/mhi/core/main.c            |  27 +--
>  drivers/bus/mhi/core/pm.c              |  26 ++-
>  include/linux/mhi.h                    |  30 ++-
>  11 files changed, 623 insertions(+), 39 deletions(-)
>  create mode 100644 Documentation/ABI/stable/sysfs-bus-mhi
>  create mode 100644 drivers/bus/mhi/core/debugfs.c
> 
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
