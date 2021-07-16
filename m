Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2C353CB70B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jul 2021 13:55:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232146AbhGPL60 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jul 2021 07:58:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232088AbhGPL6Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jul 2021 07:58:25 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE736C06175F
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jul 2021 04:55:29 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id h4so9731655pgp.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jul 2021 04:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CuuUNeyNTsN3K8aU0aDQEXK/4L9nlIa7+OtjGKcpunY=;
        b=ilR7jMGSOT91epJRWKTSV4TWp91AUEqYfzdpHW14vYCWVY7/ySlHPQtpAKXc7SxrxE
         fo+GBS8AWSCzdpguryr1SCtkPXTzC21tpulmcw6IlfhZeDx8H8SwhW6svC2p7634K41n
         MJKrY4h6QXwnoXNixI5m+OCJ7ehTdb/lTTkoRlGhc+yiwOW6EC/3+yKkMlJHGyRmtYEX
         gvj2NPisv39pJmBFfFsAi0SsSFNTCIwdctM88B/c8XyzDH6/EgbC8ScWL2Nv+05wiRuI
         btk/ypvTaUplcsZM0PPu2pYqmFK8AAqp3+HMge0uiSO7hyLTRHq/2j0yi0Ugs56svB4r
         vC9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CuuUNeyNTsN3K8aU0aDQEXK/4L9nlIa7+OtjGKcpunY=;
        b=nPpNjzRE1Sv2STQoU4J0mrbg7COAHduFgolbu5CFd91NA/weo0yjC+cnfx4X6HocS/
         jHFobGfIa8crfOA29F891Ry3M1O7y8EKIdQIXXvRO7R0dtz0iBnTIlenFOQEl8KICrWz
         VpQaFvqmxQyqPQj8s89MlKhjCVDCDGVFqpnel6MJ54taxQLTMBlZ5/Zjbpc3lDyKj/1a
         6NRT+gV8zxerIw3xQ34aSpKtfaH8DQnjuoBdlubyAnp2JI7puhWlduTkRx3/HziK+OMw
         nEFcEjMgCYBuQerZVcdIlb3oj0MSOesFyVPFd/WohPU5gb+VGIp5xu/ohJ9xqauGPyZO
         dO2Q==
X-Gm-Message-State: AOAM533dVUonbp8htofOKYDfDfzPsOMDGwgn3u3jt7tMtHp71jVODPf+
        Z0Yhg6bA06P3w9R3mRBxGg4e
X-Google-Smtp-Source: ABdhPJxOEFP1CXXrcrvX7fhCHB6g9I+micwaJNEQO6WrcnBhsuPwOmA3D0NePJv9GvQodmWAguj0TA==
X-Received: by 2002:a05:6a00:1627:b029:333:323:2c04 with SMTP id e7-20020a056a001627b029033303232c04mr8802063pfc.78.1626436529253;
        Fri, 16 Jul 2021 04:55:29 -0700 (PDT)
Received: from workstation ([120.138.12.214])
        by smtp.gmail.com with ESMTPSA id n4sm10245611pff.51.2021.07.16.04.55.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Jul 2021 04:55:28 -0700 (PDT)
Date:   Fri, 16 Jul 2021 17:25:25 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org
Subject: Re: [PATCH v2] bus: mhi: core: Improve debug messages for power up
Message-ID: <20210716115525.GK3323@workstation>
References: <1620072038-36160-1-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1620072038-36160-1-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 03, 2021 at 01:00:38PM -0700, Bhaumik Bhatt wrote:
> Improve error message to be more descriptive if a failure occurs
> with an invalid power up execution environment. Additionally, add
> a debug log to print the execution environment and MHI state
> before a power up is attempted to confirm if the device is in an
> expected state. This helps clarify reasons for power up failures
> such as the device being found in a PBL or Emergency Download
> Mode execution environment and the host expected a full power up
> with Pass-Through and no image loading involved.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Applied to mhi-next!

Thanks,
Mani

> ---
> v2: Use power up instead of power on and update commit text with an example.
> 
>  drivers/bus/mhi/core/pm.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index adf426c..f4a8b9a 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -1076,12 +1076,16 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
>  
>  	/* Confirm that the device is in valid exec env */
>  	if (!MHI_IN_PBL(current_ee) && current_ee != MHI_EE_AMSS) {
> -		dev_err(dev, "Not a valid EE for power on\n");
> +		dev_err(dev, "%s is not a valid EE for power on\n",
> +			TO_MHI_EXEC_STR(current_ee));
>  		ret = -EIO;
>  		goto error_async_power_up;
>  	}
>  
>  	state = mhi_get_mhi_state(mhi_cntrl);
> +	dev_dbg(dev, "Attempting power on with EE: %s, state: %s\n",
> +		TO_MHI_EXEC_STR(current_ee), TO_MHI_STATE_STR(state));
> +
>  	if (state == MHI_STATE_SYS_ERR) {
>  		mhi_set_mhi_state(mhi_cntrl, MHI_STATE_RESET);
>  		ret = wait_event_timeout(mhi_cntrl->state_event,
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
