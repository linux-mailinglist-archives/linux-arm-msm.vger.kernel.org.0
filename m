Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5382C2ABBCB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Nov 2020 14:32:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732067AbgKINbC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Nov 2020 08:31:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732079AbgKINbA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Nov 2020 08:31:00 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8A4BC0613D3
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2020 05:30:59 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id q5so5201031pfk.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2020 05:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+sz4tbYNuwYjyVl/Ub4iOvWLg0YjxVlle9/HbtnKn3I=;
        b=ufKvexxEIva0lg+0/eug7BwTwcoisncojILiOcOxK8iGgqzqRFN2dRTHx4+A7F2XLT
         umwQNfUgA8siwS6Sh/fdr5nmQOZygHKzXeMkrT7BP3VSxz5Y/2PeypLDd88VkPbF8DDn
         131MQYExWaE4kTGsRPDPPflC5mlEcUX/rWqWEskHV4Z5bdTGijJLJ9esUz/ab13E7AfQ
         IlesHAtiqt1lykkgqd8hi+QWagdataYSti1zKtjT2+pUFLzdQWS2rnf4+Zf5eKQRUjQw
         5oi6tSAkC+btdR+AueU52vFL9kDY77kl8u34Pg6BSziBrUOKnfSqUX6BAmgYGKVMZmgE
         qRBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+sz4tbYNuwYjyVl/Ub4iOvWLg0YjxVlle9/HbtnKn3I=;
        b=m1hkmy+TI3yEqn1qLZv/09E2tRszrrEslgXC8XSH4VXlWd3OH2eCup8ymrdrTzbAQ1
         f4LRrnm+EBIMvcsUDMW+WC9prYYsDbPsP3hvVTKKoil5IpJ7z+UaoB2XZZnnz0/u6sgm
         6dv33NCm2EqvQhvA45SFr3Nolhqc5l+Az0WRD+SuF7JYbOq8z0a5BdkrbA+Uc02psJru
         4w1OmlGZRL8RnSqmY+blvXw4lr/J2F4rIKnUNWWu450X3DE+ICY4A0ItV/o0kUHChzwA
         V5WbSMmRVbDfw60n5pUOICQ/fzPRELz6ROoukRmc3EC7fwHVNLG3bdYmV5L0FFXvWfv5
         edpg==
X-Gm-Message-State: AOAM531D1nDx8Pnp5kRSq+hDe+dOYVMoP8QSx8Y91OLh7oitzSkqgRAb
        dDRL46WPi4rvxw6DIPb21oYDDd6T1dgk
X-Google-Smtp-Source: ABdhPJxms5ZKTWmwkdoTuf00rSaubUgSEiO8B+mlRPFp3HCt+MWWggJDnLrr8AJWBitsNFApgcP7YQ==
X-Received: by 2002:a17:90b:3687:: with SMTP id mj7mr13252559pjb.143.1604928659159;
        Mon, 09 Nov 2020 05:30:59 -0800 (PST)
Received: from work ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id p4sm7881148pjo.6.2020.11.09.05.30.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Nov 2020 05:30:58 -0800 (PST)
Date:   Mon, 9 Nov 2020 19:00:53 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] Minor bug fixes and clean-up for MHI host driver
Message-ID: <20201109133053.GK24289@work>
References: <1604684690-31065-1-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604684690-31065-1-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 06, 2020 at 09:44:44AM -0800, Bhaumik Bhatt wrote:
> This patch series serves to clean up the MHI host driver by removing an
> unnecessary counter and an unused function. It also renames a function to make
> it clearly worded. There is currently no user of this exported function which
> makes it is safe to do so now.
> 
> Bug fixes include adding a missing EXPORT_SYMBOL_GPL to a function, and adding
> a return value check to bail out of RDDM download in kernel panic path.
> 
> An outlier among the group exports the mhi_get_exec_env() API for use by
> controller drivers, in case they need to determine behavior on the basis of the
> current execution environment.
> 
> This set of patches was tested on arm64.

Series applied to mhi-next!

Thanks,
Mani

> 
> v2:
> -Removed the declaration for mhi_get_exec_env() from internal.h
> -Improved on the error log message in RDDM download exit case due to unknown EE
> 
> Bhaumik Bhatt (6):
>   bus: mhi: core: Remove unnecessary counter from mhi_firmware_copy()
>   bus: mhi: core: Add missing EXPORT_SYMBOL for mhi_get_mhi_state()
>   bus: mhi: core: Expose mhi_get_exec_env() API for controllers
>   bus: mhi: core: Remove unused mhi_fw_load_worker() declaration
>   bus: mhi: core: Rename RDDM download function to use proper words
>   bus: mhi: core: Skip RDDM download for unknown execution environment
> 
>  drivers/bus/mhi/core/boot.c     | 15 +++++++++------
>  drivers/bus/mhi/core/internal.h |  2 --
>  drivers/bus/mhi/core/main.c     |  2 ++
>  include/linux/mhi.h             | 12 +++++++++---
>  4 files changed, 20 insertions(+), 11 deletions(-)
> 
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
