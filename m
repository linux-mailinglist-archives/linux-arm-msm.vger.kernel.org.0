Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A30AE31C6D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Feb 2021 08:33:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbhBPHc0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Feb 2021 02:32:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229694AbhBPHcZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Feb 2021 02:32:25 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9D7BC061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Feb 2021 23:31:45 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id c19so229606pjq.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Feb 2021 23:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qdlCLTlp7jDhU1SYjcZ4aty98XM8vub3j1b+BGeNYxQ=;
        b=duahtLR4fZY8WTH/2yQC7gOnUtqcsGr4OK28qGUO7BQPdN+CcjF7orF5ae29J8ot1Q
         3P284thv2sG3EZJlz3EGzrSHKEvCPubZ1WDr1S6vRmup9WZJOQqxJ6TWKNfrdEupVyod
         tqgbBt0EmYApooq9fuArONkjyi3L5FGIQNdMfxVJB+wy45IxayqASvuctC2UIykEXeKK
         YCkvWRnMc6xkwOx2NQQFzXgpufffGsVFd3DvA5v/vnxrQ58HFvO8ymwJo8MDgoQcJkYZ
         a0Fgl9Z1F3jDl0kmnEBiLrM65g49uJVw3ZN7Nc+fUcbhKpImZkwrDk+4HoaN0qGDVT/i
         1NdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qdlCLTlp7jDhU1SYjcZ4aty98XM8vub3j1b+BGeNYxQ=;
        b=Gz9YJvT1xcmTXcAC6kthMfZ+31zoNJQN+9wr0MmeyTJQsLwyqdQgAAGv9K8uHituVl
         DEemZIL01GNkVi4DwrgoMg1oUdG2U8vSDY4ICTchWTBn4CxTxZ1IXolZC8p9Bbes6RLv
         e994Wqdh3vQQDWEKpDFPecjAJOWa58lHTZ382LGDRczh0OCp4JYwTQkxoJgRNUv3K0XP
         WP0xr5bWdKfa41RdQoNhkWGUJOrzNZPDmA2Vs3bo0FvLoyO//cGuoGohapnM1JtLvutI
         8mA0TuF3hQGLgYcTgMN6giG+7A36mjsiLctrcl0Mein8JAHtYj94nA45bTMx7EdorRva
         WGaQ==
X-Gm-Message-State: AOAM5334iz24iHwHeOrDozwuZqVE4CeGouv62zz99SVLIinV+U9W3Uh9
        f/Bw7J9aN1s3ncfW/dv+AZiR
X-Google-Smtp-Source: ABdhPJzoO/yqYnmdFzx/IbJw7rU/0JO/ecD//AsZLAlh6JG8BMuEx/ZmggPE5LzgW6v0CV0IF1/WUA==
X-Received: by 2002:a17:90a:2c9:: with SMTP id d9mr2948983pjd.67.1613460705260;
        Mon, 15 Feb 2021 23:31:45 -0800 (PST)
Received: from thinkpad ([2409:4072:618e:567:b42:dd4b:9608:1db1])
        by smtp.gmail.com with ESMTPSA id c69sm13415949pfb.88.2021.02.15.23.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 23:31:44 -0800 (PST)
Date:   Tue, 16 Feb 2021 13:01:35 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        loic.poulain@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: core: Fix check for syserr at power_up
Message-ID: <20210216073135.GC5082@thinkpad>
References: <1613165243-23359-1-git-send-email-jhugo@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1613165243-23359-1-git-send-email-jhugo@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Feb 12, 2021 at 02:27:23PM -0700, Jeffrey Hugo wrote:
> The check to see if we have reset the device after detecting syserr at
> power_up is inverted.  wait_for_event_timeout() returns 0 on failure,
> and a positive value on success.  The check is looking for non-zero
> as a failure, which is likely to incorrectly cause a device init failure
> if syserr was detected at power_up.  Fix this.
> 
> Fixes: e18d4e9fa79b ("bus: mhi: core: Handle syserr during power_up")
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/pm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index 681960c..36ab7aa 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -1092,7 +1092,7 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
>  							   &val) ||
>  					!val,
>  				msecs_to_jiffies(mhi_cntrl->timeout_ms));
> -		if (ret) {
> +		if (!ret) {
>  			ret = -EIO;
>  			dev_info(dev, "Failed to reset MHI due to syserr state\n");
>  			goto error_bhi_offset;
> -- 
> Qualcomm Technologies, Inc. is a member of the
> Code Aurora Forum, a Linux Foundation Collaborative Project.
> 
