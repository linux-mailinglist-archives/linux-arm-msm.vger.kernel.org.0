Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6919B7D23
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2019 16:45:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389655AbfISOpv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Sep 2019 10:45:51 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:48918 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389041AbfISOpu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Sep 2019 10:45:50 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id DBBF46158B; Thu, 19 Sep 2019 14:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568904350;
        bh=khMtM6rvwdQIMEeHPhJZbSxvGqMZ8YsalJllt9BvrM0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=n3dMSjBiBS151l97CMaExOux8IghoDnjnFYn7IfjKf37+ZyfLp2pFR1gBP9/4uHbL
         LGuNtWWzBevIdd+OtDT8VPTYhLQq1UIWXJ349o3v8ZErj/dCuaOkO1fVPlkbPW+hKH
         EYUIsphR9aee1K/arLGbbxGbONip71S2XOndRTCI=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 09E1961576;
        Thu, 19 Sep 2019 14:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568904347;
        bh=khMtM6rvwdQIMEeHPhJZbSxvGqMZ8YsalJllt9BvrM0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PKhY46lwozj0vxMhCODrczhfdBRAiYyTtFbhYOFTpqmhu+9SuqqBPXNeOYtAM7S0x
         e+aPR2uTLKzWygF/8ZnFWMcrZ7aIDx8RV2EO0LpVi2PI5Nn8ckDct4qVi+9p37OwAO
         WMyr19QnBYB/CbNedLKkje8ks7G5+4H91Jt6LFCE=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 09E1961576
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Thu, 19 Sep 2019 08:45:44 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Sean Paul <seanpaul@chromium.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: include linux/sched/task.h
Message-ID: <20190919144543.GA14636@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Arnd Bergmann <arnd@arndb.de>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Sean Paul <seanpaul@chromium.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20190918195722.2149227-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190918195722.2149227-1-arnd@arndb.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 18, 2019 at 09:57:07PM +0200, Arnd Bergmann wrote:
> Without this header file, compile-testing may run into a missing
> declaration:
> 
> drivers/gpu/drm/msm/msm_gpu.c:444:4: error: implicit declaration of function 'put_task_struct' [-Werror,-Wimplicit-function-declaration]
> 
> Fixes: 482f96324a4e ("drm/msm: Fix task dump in gpu recovery")

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/msm/msm_gpu.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index a052364a5d74..edd45f434ccd 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -16,6 +16,7 @@
>  #include <linux/pm_opp.h>
>  #include <linux/devfreq.h>
>  #include <linux/devcoredump.h>
> +#include <linux/sched/task.h>
>  
>  /*
>   * Power Management:
> -- 
> 2.20.0
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
