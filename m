Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23BC41AD049
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2020 21:24:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728632AbgDPTXz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Apr 2020 15:23:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728112AbgDPTXx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Apr 2020 15:23:53 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7918BC061A10
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2020 12:23:53 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id f8so564029plt.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2020 12:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aKFYVYQ9OYxfkj6UtWE/c0zee6GGkl7hN2RiXbrSsVQ=;
        b=wOOCNhaQsoosxHRpdTHfDHxWt+3yGUwtdVHwF/2+AdpJ85PsC8MarhgRu+8jev/fUw
         guZPcEBfiQibYkIVoTbLyaM6Sn0VMko49d/uKZC4KFoRxdN0drDm372VeGsWO4MMzNbH
         IBIx/jZz+pr/4Cwst1GDcrnoY+ozXV3t+DzKHxanKWTIp51IsQSu4wvgiLJJlokx4nQH
         0Acdma8hyGFfKiB55qOrNPYc42ho6XiVtd+wmAkwGZp0UA9JevcXfDYt2Qi4c1jRtYnG
         MONrmuHqYbLHEaHlcRMW9p065LGFFAkDU/brduXXVkgSUPt9l1yml2c5mpbucPCRPhtU
         CuGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aKFYVYQ9OYxfkj6UtWE/c0zee6GGkl7hN2RiXbrSsVQ=;
        b=SpiHI+8nqtP4Ls1yg5n5RVRs774Q5Ot/r530MlLbuLzsnLgRe3bRmUltdzwrfuRwgm
         41OuNAeWEDcGoX9ayxai/slEx6d6++nYG/v65WQo4PMt8Qo27tWhdeAjWnvNzxBaI5t5
         WZgdPHoXBx3H0k2+YaUzczlnrDmy392cWPPsERYOnDhbGXmuIfug89a4wVtdN9pee2Fd
         jnxddBI0rIHVygYHKxQGSwyNRclxkmIG4GQ7DLJIbNCLxSR93wscKkuvvMj/60pb3iDC
         mL5ul3bys86mEOpPlvVqyzIKqAgMBKf5UDk6+yWACSvv4VRo0uPhYJFip5yJyRTVJxsG
         0W9Q==
X-Gm-Message-State: AGi0PuZiMPY2lF15l3WTKEIZre7oLA/UxfrtkxxtfMsmpBlJOaL/CxAP
        nAfOBchYXWXkaKqGvQpvvOhl3Q==
X-Google-Smtp-Source: APiQypK0eaYot0thKROCDeMzMTdcPgMIkES3AeLNRv813IJwsbnRKl5Rw9PycXGl/pCuoTqlxZH3aw==
X-Received: by 2002:a17:90b:3691:: with SMTP id mj17mr6924777pjb.114.1587065032831;
        Thu, 16 Apr 2020 12:23:52 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id p8sm3465938pjd.10.2020.04.16.12.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 12:23:52 -0700 (PDT)
Date:   Thu, 16 Apr 2020 13:23:50 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org
Subject: Re: [PATCH v2 1/2] remoteproc: core: Add an API for changing
 firmware name
Message-ID: <20200416192350.GA29577@xps15>
References: <1586384305-7825-1-git-send-email-sidgup@codeaurora.org>
 <1586384305-7825-2-git-send-email-sidgup@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586384305-7825-2-git-send-email-sidgup@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Siddharth,

On Wed, Apr 08, 2020 at 03:18:24PM -0700, Siddharth Gupta wrote:
> Add an API which allows to change the name of the firmware to be booted on
> the specified rproc. This change gives us the flixibility to change the
> firmware at run-time depending on the usecase. Some remoteprocs might use
> a different firmware for testing, production and development purposes,
> which may be selected based on the fuse settings during bootup.
> 
> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 43 ++++++++++++++++++++++++++++++++++++
>  include/linux/remoteproc.h           |  1 +
>  2 files changed, 44 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index fb9c813..9f99fe2 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1796,6 +1796,49 @@ int rproc_boot(struct rproc *rproc)
>  EXPORT_SYMBOL(rproc_boot);
>  
>  /**
> + * rproc_set_firmware_name() - change the firmware name for specified remoteproc
> + * @rproc: handle of a remote processor
> + * @firmware: name of the firmware to boot with
> + *
> + * Change the name of the firmware to be loaded to @firmware in the rproc
> + * structure. We should ensure that the remoteproc is not running.
> + *
> + * Returns 0 on success, and an appropriate error value otherwise.
> + */
> +int rproc_set_firmware_name(struct rproc *rproc, const char *firmware)
> +{
> +	int len, ret = 0;
> +	char *p;
> +
> +	if (!rproc || !firmware)
> +		return -EINVAL;
> +
> +	len = strcspn(firmware, "\n");
> +	if (!len)
> +		return -EINVAL;
> +
> +	mutex_lock(&rproc->lock);
> +
> +	if (rproc->state != RPROC_OFFLINE) {
> +		ret = -EBUSY;
> +		goto out;
> +	}
> +
> +	p = kstrndup(firmware, len, GFP_KERNEL);
> +	if (!p) {
> +		ret = -ENOMEM;
> +		goto out;
> +	}
> +
> +	kfree(rproc->firmware);
> +	rproc->firmware = p;
> +out:
> +	mutex_unlock(&rproc->lock);
> +	return ret;
> +}
> +EXPORT_SYMBOL(rproc_set_firmware_name);
> +

This is much better, thanks for cleaning things up. Keep in mind that when you
do resend this rproc->firmware will likely have become a "const char *",
requiring the use of kstrndup_const()...  But that is for a later time.  

Mathieu

> +/**
>   * rproc_shutdown() - power off the remote processor
>   * @rproc: the remote processor
>   *
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 9c07d79..c5d36e6 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -613,6 +613,7 @@ rproc_of_resm_mem_entry_init(struct device *dev, u32 of_resm_idx, size_t len,
>  			     u32 da, const char *name, ...);
>  
>  int rproc_boot(struct rproc *rproc);
> +int rproc_set_firmware_name(struct rproc *rproc, const char *firmware);
>  void rproc_shutdown(struct rproc *rproc);
>  void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type);
>  int rproc_coredump_add_segment(struct rproc *rproc, dma_addr_t da, size_t size);
> -- 
> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
