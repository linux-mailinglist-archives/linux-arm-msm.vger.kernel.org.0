Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3C4F1CA3CE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2020 08:24:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbgEHGYh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 May 2020 02:24:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:51682 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725897AbgEHGYg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 May 2020 02:24:36 -0400
Received: from Mani-XPS-13-9360 (unknown [157.50.45.37])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D7B6F20708;
        Fri,  8 May 2020 06:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588919076;
        bh=ipSng+pkwhd74+txooJRJcZ+/1mr44m5cObyP7Qx0oA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AzLqG0QnN9DhncY4Cpt5RkNjQy3WPL6ROQ/g1g+9Qdw3KW08CunrKG0SlczG1L940
         8QCYB+jIfbCq672M0cWSF56EIgZH1roYdqqQ6tzhtPWK5RDFFBZwuP3wtPtPoeaCHg
         F97Oc+V4etkKTJdM/iZNNMr3I8PukgEWVVERHBZk=
Date:   Fri, 8 May 2020 11:54:27 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        hemantk@codeaurora.org, jhugo@codeaurora.org
Subject: Re: [PATCH v6 0/8] Bug fixes and improved logging in MHI
Message-ID: <20200508062427.GD2696@Mani-XPS-13-9360>
References: <1588718832-4891-1-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588718832-4891-1-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bhaumik,

Can you please send the next version to my linaro.org mail address? Since
it is what listed in MAINTAINERS file for now, I'd like to use it for MHI
work.

Thanks,
Mani

On Tue, May 05, 2020 at 03:47:04PM -0700, Bhaumik Bhatt wrote:
> A set of patches for bug fixes and improved logging in mhi/core/boot.c.
> Verified on x86 and arm64 platforms.
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
>  drivers/bus/mhi/core/boot.c     |  75 ++++++++++++------------
>  drivers/bus/mhi/core/init.c     |   5 +-
>  drivers/bus/mhi/core/internal.h |   5 +-
>  drivers/bus/mhi/core/main.c     | 124 ++++++++++++++++++++--------------------
>  drivers/bus/mhi/core/pm.c       |   6 +-
>  include/linux/mhi.h             |   2 -
>  6 files changed, 108 insertions(+), 109 deletions(-)
> 
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
