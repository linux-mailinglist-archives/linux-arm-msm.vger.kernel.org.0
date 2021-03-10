Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51393333FC0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 14:58:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232335AbhCJN6W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 08:58:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230183AbhCJN6Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 08:58:16 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8750BC061760
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 05:58:16 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id nh23-20020a17090b3657b02900c0d5e235a8so7533898pjb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 05:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ckOMbHyLGofS4voBDEQMP8/MoFg0pd4GSGHyRJXKSYY=;
        b=w8ZBlJ+XRyfA91G9+L/zHKoEonccR+8gucyJEFeFwa8CTkHirpvDFN6os2Mp74ADL2
         XpY9p6gdUfFZ07tYCMpIpD5QrSbS3dNuNwEpdjYeDueCYraPxg7mTV3S/RpLCeVLqd/j
         rCL+i9ziAHi/cAWNPt5/ZmfHUTrHTrwRMktwcqfAlYGyFzvNYhF39QecHbjsaaBvvWYj
         ZkR7hJBuVLlecWJyZ6TvlIP2H9OODwIIccUYGzGZXYFB1gqz9tb4pxRjMcwbwCIxUTE6
         9mH0TZPpsHxySq1o8IhT3/o2zALuHdWYDPMLn3gkKAept4RvGjuCan4NMO96v93mgCwv
         QCrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ckOMbHyLGofS4voBDEQMP8/MoFg0pd4GSGHyRJXKSYY=;
        b=CBY27hY+WkvaLX5oYZdVTZyggT5e6vOiUceVYtth9erVXBVjiIpRfzeCMseSWsbe7N
         oOLWH/R9WHRBQqjeFbuGFileXTLW5fH57B8shUTdiG4wyc84/sYdR2yVpjwcGBdi9SjK
         uh2nPiWtEvIkmUw2/RGMtgFtg+P5uHOHHKRC1/C5bl/OymZ+4u55GIK4rcgP8gcpW34R
         76QSwrYdCeYNUhmsGXro5x4sST6iRnSngZao+FM6D4GWuFxvDBa19qJtf2QI5PUEGeUQ
         XUiqAwxjEs4gN6TFRr0Rv1KeUzD05pvyMMZdgCuz+PFEtNbbrOHQFPCzBgQSMIK8wiyj
         FMUQ==
X-Gm-Message-State: AOAM53018ljBOYe0ktWUb1Z1HIXjcl4gtoChRr9DduRbZZThrYVKW+qG
        aP7GpsUZmgLjmJ6VYMsn2j4b
X-Google-Smtp-Source: ABdhPJwWza/fwy6u0iEvokSIuYI8VtSiygh9Sj8ZY7FCK+wFF8/orPMeK6pqhs7aww1Ih5p7COxRLA==
X-Received: by 2002:a17:902:6547:b029:e4:547b:77cb with SMTP id d7-20020a1709026547b02900e4547b77cbmr3016768pln.75.1615384696001;
        Wed, 10 Mar 2021 05:58:16 -0800 (PST)
Received: from thinkpad ([103.66.79.59])
        by smtp.gmail.com with ESMTPSA id u9sm16595650pgc.59.2021.03.10.05.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 05:58:15 -0800 (PST)
Date:   Wed, 10 Mar 2021 19:28:11 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        jhugo@codeaurora.org
Subject: Re: [PATCH] bus: mhi: Early MHI resume failure in non M3 state
Message-ID: <20210310135811.GO30275@thinkpad>
References: <1614960841-20233-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614960841-20233-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 05, 2021 at 05:14:01PM +0100, Loic Poulain wrote:
> MHI suspend/resume are symmetric and balanced procedures. If device is
> not in M3 state on a resume, that means something happened behind our
> back. In this case resume is aborded and error reported, to let the
> controller handling the situation.
> 

Will fix the spelling mistakes while applying. Please try to avoid them...

> This is mainly requested for system wide suspend-resume operation in
> PCI context which may lead to power-down/reset of the controller which
> will then lose its MHI context. In such cases, PCI driver is supposed
> to recover and reinitialize the device.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/pm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index 0cd6445..725a0b2 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -916,6 +916,9 @@ int mhi_pm_resume(struct mhi_controller *mhi_cntrl)
>  	if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state))
>  		return -EIO;
>  
> +	if (mhi_get_mhi_state(mhi_cntrl) != MHI_STATE_M3)
> +		return -EINVAL;
> +
>  	/* Notify clients about exiting LPM */
>  	list_for_each_entry_safe(itr, tmp, &mhi_cntrl->lpm_chans, node) {
>  		mutex_lock(&itr->mutex);
> -- 
> 2.7.4
> 
