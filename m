Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D63F82146B5
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jul 2020 16:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727076AbgGDO5D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Jul 2020 10:57:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726488AbgGDO5D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Jul 2020 10:57:03 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 132EAC061794
        for <linux-arm-msm@vger.kernel.org>; Sat,  4 Jul 2020 07:57:03 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id cv18so7685002pjb.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Jul 2020 07:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=T5ivJGFMS8l655Uv/RE5CHugIfJFOuIIYbEDilXGXss=;
        b=rm9vaEvuxYykAd3uwe48eVOyoNQaP+YHUjVUtF4riLnU5be9sJT+o4erWOH00v/dGO
         Jf4upm8oiedECEDJ2KGSt+HXAdvHQMP5dCINSHQN7p/cM3o4lw6cyw0v8rfuINFa864X
         z/1t/It7fWOTRRv30MoQ7AOEWunZCK2ks8cmQGKHaqpm4DpkVk90aLN+mqEFwXbVFfRa
         VzWVjsPfm5pIpZTRgidT2sNhCW+bhFDStDCCiEibq0z0Dp/d4OJLeBgx1M9lIVwZEaNo
         EepAxEb/5n7900vJzXMVFUA9E2d/gKgJyhnpXSLz5SADP/EyYf4jopRWF+oniFHbj7vn
         xlGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=T5ivJGFMS8l655Uv/RE5CHugIfJFOuIIYbEDilXGXss=;
        b=VHrtiM/M2BmHOhbaRrtqPPvrOwstab82Wd5NCjEmUL1smFLiCs13Xt1vHZZWlccu+N
         XKAaW+NgrFkdhXDywcmWiY8qB9ik0QBJsnEv/+4SRD/ZF1s3MpZceXkHjI58L6pwwNR0
         z2NQrxymf9BeXtbdLbp1X15Z/Ig2y79dacGI3LsWWBeGoi8syUsqr0SgVpzq95EDO9k2
         AKtB669fDuTRdUNjfI1tyBewiIH4mhSTBfuc+VBK488MBPs6rpr8R7J20oN+/Cae0YJk
         AXIM0EKBePTeTrgOlXxJ4gvwzzCyOmePSLbU06Q3gcDo+RmKdwBh+hvJ3ykJJBRizDFE
         0C8g==
X-Gm-Message-State: AOAM5315Rprji8bfQazBgd+tk77NXydXHxwq+iQwE/YufbXxwixFlBYs
        GG6e6ylq/k8oZ31D17Ff6vO8
X-Google-Smtp-Source: ABdhPJztNX703knSvL8QCwuvzOGC8mD18J64XhuJv9KJ2a95oXPCL0I0ukJbOGB2y2JUxUagBSuY7w==
X-Received: by 2002:a17:90a:191b:: with SMTP id 27mr45064379pjg.158.1593874622508;
        Sat, 04 Jul 2020 07:57:02 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:680:29c6:d74:dc5c:e13f:c458])
        by smtp.gmail.com with ESMTPSA id f14sm13764448pjq.36.2020.07.04.07.56.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Jul 2020 07:57:01 -0700 (PDT)
Date:   Sat, 4 Jul 2020 20:26:55 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/9] bus: mhi: core: Trigger a host resume when device
 vote is requested
Message-ID: <20200704145655.GD3066@Mani-XPS-13-9360>
References: <1593448782-8385-1-git-send-email-bbhatt@codeaurora.org>
 <1593448782-8385-5-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1593448782-8385-5-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 29, 2020 at 09:39:37AM -0700, Bhaumik Bhatt wrote:
> It is possible that the host may be suspending or suspended and may
> not allow an outgoing device wake assert immediately if a client has
> requested for it. Ensure that the host wakes up and allows for it so
> the client does not have to wait for an external trigger or an
> outgoing packet to be queued for the host resume to occur.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Remove the term 'vote' from the commit subject, it doesn't seem right. How about
"Trigger host resume if already suspended during mhi_device_get()"? With that
fixed,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/pm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index 5e3994e..74c5cb1 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -1115,6 +1115,9 @@ void mhi_device_get(struct mhi_device *mhi_dev)
>  
>  	mhi_dev->dev_wake++;
>  	read_lock_bh(&mhi_cntrl->pm_lock);
> +	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
> +		mhi_trigger_resume(mhi_cntrl, false);
> +
>  	mhi_cntrl->wake_get(mhi_cntrl, true);
>  	read_unlock_bh(&mhi_cntrl->pm_lock);
>  }
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
