Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FEF8F9658
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2019 17:56:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727431AbfKLQzy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Nov 2019 11:55:54 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:50874 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727202AbfKLQzx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Nov 2019 11:55:53 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id DA0FA60F33; Tue, 12 Nov 2019 16:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573577753;
        bh=2qpw0n4O5/VIIorasibWq8jjTR8oYNzI+JNmPHLt2pY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iGmZdbQY66/bgutJyGZVBGTaKUuS8gepGQsU64940awZpY2+X1sD5qNEOW+V0ZAoH
         vxhd/0kI4Ht1oDTdl1EULXWaN3AIvSf0EjKZ+3SFn0y8nsHK/+IMc18lS9zE+HZM80
         4BGB687GMhlzpInsbZe4bgMJw1IFmc5306zA4P+0=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9FE5960A1D;
        Tue, 12 Nov 2019 16:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573577751;
        bh=2qpw0n4O5/VIIorasibWq8jjTR8oYNzI+JNmPHLt2pY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aiEuMyLFE2BX5DhMR98stwoqCmSOxUKjan2nekilbOoz+9b5qK92E9833VzN9ojXj
         KMdgeU+3XtXJHGLB2w9+waQSniDtc1F2JUjdFxUFw+XJDdUhJVyoCqE+JVmkAGmOjp
         iEWRPErsxAAyWyAmlqe1R3DNZ0weD+LIl63yueoo=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9FE5960A1D
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Tue, 12 Nov 2019 09:55:48 -0700
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     y2038@lists.linaro.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Sam Ravnborg <sam@ravnborg.org>, Joe Perches <joe@perches.com>,
        Jonathan Marek <jonathan@marek.ca>,
        "Kristian H. Kristensen" <hoegsberg@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH 14/16] drm/msm: avoid using 'timespec'
Message-ID: <20191112165548.GB14014@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Arnd Bergmann <arnd@arndb.de>, y2038@lists.linaro.org,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Sam Ravnborg <sam@ravnborg.org>, Joe Perches <joe@perches.com>,
        Jonathan Marek <jonathan@marek.ca>,
        "Kristian H. Kristensen" <hoegsberg@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20191108213257.3097633-1-arnd@arndb.de>
 <20191108213257.3097633-15-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191108213257.3097633-15-arnd@arndb.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 08, 2019 at 10:32:52PM +0100, Arnd Bergmann wrote:
> The timespec structure and associated interfaces are deprecated and will
> be removed in the future because of the y2038 overflow.
> 
> The use of ktime_to_timespec() in timeout_to_jiffies() does not
> suffer from that overflow, but is easy to avoid by just converting
> the ktime_t into jiffies directly.

This seems good to me. y2038 changes are the best changes.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/msm/msm_drv.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 71547e756e29..740bf7c70d8f 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -454,8 +454,7 @@ static inline unsigned long timeout_to_jiffies(const ktime_t *timeout)
>  		remaining_jiffies = 0;
>  	} else {
>  		ktime_t rem = ktime_sub(*timeout, now);
> -		struct timespec ts = ktime_to_timespec(rem);
> -		remaining_jiffies = timespec_to_jiffies(&ts);
> +		remaining_jiffies = ktime_divns(rem, NSEC_PER_SEC / HZ);
>  	}
>  
>  	return remaining_jiffies;
> -- 
> 2.20.0
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
