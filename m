Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3716E3A70DD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jun 2021 22:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234749AbhFNVBY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Jun 2021 17:01:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234935AbhFNVBX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Jun 2021 17:01:23 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9D27C061767
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jun 2021 13:59:19 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id d19so11782244oic.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jun 2021 13:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/6pKbYj2ed0f0UaEFoaaIUYpFQjvxwrfEa8r7ccecLg=;
        b=VUcpHcO5+69x+UmFhBX81AvNnV4yZG99MUIPNECFwsScWTK9TaiV0hoCkGfUU7392i
         IdO3v0bqNtQ1pwOSOr5vbmkySR/9FlzDmozXlGeRfxcECdSsPUtEdGP3mmVqo+gbFuSx
         I/hgEmF4rADrAYt7llABIPizW00BM03GI/jxEkEFQMC+ceuxqkSY3x0i97Kt4IXrHsd4
         i7QlXM1QDPv+NcO410O/yjq72NZY5qV2iCblFogQg9l3bPUMsde5DdeS/BiL7PNGRux8
         woxP/GxKqD7irINk0gd14N5PWdLSw9pnWtKhqYVsYiQzD1BvT2DSP5aLiqSVf7hdMCDs
         yR7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/6pKbYj2ed0f0UaEFoaaIUYpFQjvxwrfEa8r7ccecLg=;
        b=g06O0x+7jfLqSCgNFEO8CMZqUZuXpdo7VxekMpzcB3aSQxfxi33J8kf4LJ19DGEEzi
         VoB2eyJ9Tn+TCPkvu20SOFHmnzCG1Y+lWERn9eEzmWwDFuUIOH2xKAvKzt2LJ+RmX7ZG
         vO6PG6RF5rfKUf33wLIAub2oYr2EcBEIRfthVyMhxMEhuNTX/z/C89Mrwxo0t8ImNnmE
         Xx3Ku0ySa0oVm234EmXnfCMSGX9D80HmXhHWRgHomV3DPHMObgkaLu1n6IkvTA5VVLwt
         lSmZk0jzgofX9oXXBKFZd7r+h1UHOvHwb2k/I9zpxjfMUyTGpLml27RWEBUN+/grxKDd
         pQzA==
X-Gm-Message-State: AOAM531IKDNjKlJvxGw6gkDRdngGERHuE6VTlqypuUngIueUQq0AOfwx
        VnWN3AaspQ55nOpHx71m4fS26w==
X-Google-Smtp-Source: ABdhPJyGwTQzDPCtsM1dRKOQR3lJJwgBKHzl/HwiNMhRIvnaoQC31Qzw/GHpYHI9LCZcyYFGlq/1kg==
X-Received: by 2002:a05:6808:352:: with SMTP id j18mr672718oie.122.1623704356727;
        Mon, 14 Jun 2021 13:59:16 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id h1sm3583245otq.59.2021.06.14.13.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 13:59:16 -0700 (PDT)
Date:   Mon, 14 Jun 2021 15:59:14 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     ohad@wizery.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, psodagud@codeaurora.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v2 0/4] remoteproc: core: Fixes for rproc cdev and add
Message-ID: <YMfDItBIwGtyqAEd@builder.lan>
References: <1623703244-26814-1-git-send-email-sidgup@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1623703244-26814-1-git-send-email-sidgup@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 14 Jun 15:40 CDT 2021, Siddharth Gupta wrote:

> This patch series contains stability fixes and error handling for remoteproc.
> 

Thanks for respinning this Sid, I think patch 3 looks good now as well,
but it seems you accidentally got an additional file in the same patch.

Can you please fix that up and resend the patches?

Regards,
Bjorn

> The changes included in this series do the following:
> Patch 1: Fixes the creation of the rproc character device.
> Patch 2: Validates rproc as the first step of rproc_add().
> Patch 3: Fixes the rproc cdev remove and the order of dev_del() and cdev_del().
> Patch 4: Adds error handling in rproc_add().
> 
> v1 -> v2:
> - Added extra patch which addresses Bjorn's comments on patch 3
>   from v1.
> - Fixed commit text for patch 2 (s/calling making/making).
> 
> Siddharth Gupta (4):
>   remoteproc: core: Move cdev add before device add
>   remoteproc: core: Move validate before device add
>   remoteproc: core: Fix cdev remove and rproc del
>   remoteproc: core: Cleanup device in case of failure
> 
>  0000-cover-letter.patch.backup       | 26 ++++++++++++++++++++++++++
>  drivers/remoteproc/remoteproc_cdev.c |  2 +-
>  drivers/remoteproc/remoteproc_core.c | 27 ++++++++++++++++++---------
>  3 files changed, 45 insertions(+), 10 deletions(-)
>  create mode 100644 0000-cover-letter.patch.backup
> 
> -- 
> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
