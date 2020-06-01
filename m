Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E0081EB0F0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2020 23:29:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728195AbgFAV3F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Jun 2020 17:29:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728590AbgFAV3E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Jun 2020 17:29:04 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE3CDC03E97C
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2020 14:29:02 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id j21so4067998pgb.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2020 14:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fUElKYdtd0S2QzT3Ha4tcMjoudyfwMGfy5qOgP152fM=;
        b=uCTJZLoSnSFLN5YaAStdYypi4L0N4WxVVQIshM7W5ntpJdCOjOhW0c/CHMtm7K6Upv
         hvdaxUxoZkeM6/P1WZTxZPODHacAjgdMX4Yg//pAc04y9KKhbEQ3BuR3dMIHM+4BmyCp
         ytlBCwNIBNzZ3Pxsv+9ech3jN+SAGfArx3/QSStuNuzi673aX64Xl6eLxe9vN7zYp0S0
         EqVfj4sApebndrMZ/YSUe9AsK29UeFNrH39b/Qn0xZzBTAH0qhJuLwBWSVw1hdujS33T
         3vgPkY+LInWKsbDawbq+YCU++wgqdmX1RaS+tK7twl8cpbOvgV9R2czXQ+zzeyn7TpsP
         /1dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fUElKYdtd0S2QzT3Ha4tcMjoudyfwMGfy5qOgP152fM=;
        b=m2GdjPRwevSgyx0Bed/GgHBEapJNvi8BuEBGhxPcTv9hwXbyeUNOP7o5xl4yYApzef
         UWY367SwYM8yBG31xXz31GzIK51axNNJNoIbAmoN0s6TLN/LpMsNAem1joRjdvuIU3al
         9d/wpWlcLUtab/3YhMLngJJpSBqPm/5ColVnzkXWvplIzATYbBFT4RgXkp9F0ex9C5Eu
         AuANnHU0ZLM+9e6lNkRy0YLD5eWGRz8J/ZmOdQyDDHJ+qNPgsHt9fo+LRJ6dexDtn1ab
         2qMlCEwNKETL3PVQWoUIcwSbtBqKmi+bWX19chAVTLFL6AP/ZNwW4Fs4TWNdqOocREAe
         NCfQ==
X-Gm-Message-State: AOAM531E0vGXkQ9irwym8k7eUHHvbZ3njuHmJ7Qp4wr2UDtAx3SdeTnm
        LHIAduTolPLMLHIdlu/oSaPBwA==
X-Google-Smtp-Source: ABdhPJwwGnA1dLyvE8AboSf3bXlwdAbmFrm8CLGzvi2WI3ozBrNN5gX0DVB4rXyNpdblkYo35H7Ojw==
X-Received: by 2002:a63:9304:: with SMTP id b4mr20494118pge.229.1591046941983;
        Mon, 01 Jun 2020 14:29:01 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id 3sm311486pfi.68.2020.06.01.14.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 14:29:00 -0700 (PDT)
Date:   Mon, 1 Jun 2020 15:28:58 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        Stephen Boyd <swboyd@chromium.org>, robin.murphy@arm.com
Subject: Re: [PATCH 2/2] coresight: tmc: Add shutdown callback for TMC ETR/ETF
Message-ID: <20200601212858.GB24287@xps15>
References: <cover.1590947174.git.saiprakash.ranjan@codeaurora.org>
 <28123d1e19f235f97555ee36a5ed8b52d20cbdea.1590947174.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28123d1e19f235f97555ee36a5ed8b52d20cbdea.1590947174.git.saiprakash.ranjan@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Sai,

On top of the comments already privided by Mike, I have the following:

On Mon, Jun 01, 2020 at 01:32:26PM +0530, Sai Prakash Ranjan wrote:
> Implement a shutdown callback to ensure ETR/ETF hardware is
> properly shutdown in reboot/shutdown path. This is required
> for ETR/ETF which has SMMU address translation enabled like
> on SC7180 SoC and few others. If the hardware is still accessing
> memory after SMMU translation is disabled as part of SMMU
> shutdown callback in system reboot or shutdown path, then
> IOVAs(I/O virtual address) which it was using will go on the bus
> as the physical addresses which might result in unknown crashes
> (NoC/interconnect errors). So we make sure from this shutdown
> callback that the ETR/ETF is shutdown before SMMU translation is
> disabled and device_link in SMMU driver will take care of ordering
> of shutdown callbacks such that SMMU shutdown callback is not
> called before any of its consumer shutdown callbacks.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  .../hwtracing/coresight/coresight-tmc-etf.c   |  4 +--
>  .../hwtracing/coresight/coresight-tmc-etr.c   |  2 +-
>  drivers/hwtracing/coresight/coresight-tmc.c   | 29 +++++++++++++++++++
>  drivers/hwtracing/coresight/coresight-tmc.h   |  3 ++
>  4 files changed, 35 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
> index 36cce2bfb744..cba3e7592820 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
> @@ -85,7 +85,7 @@ static void __tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
>  	CS_LOCK(drvdata->base);
>  }
>  
> -static void tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
> +void tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
>  {
>  	__tmc_etb_disable_hw(drvdata);
>  	coresight_disclaim_device(drvdata->base);
> @@ -118,7 +118,7 @@ static int tmc_etf_enable_hw(struct tmc_drvdata *drvdata)
>  	return 0;
>  }
>  
> -static void tmc_etf_disable_hw(struct tmc_drvdata *drvdata)
> +void tmc_etf_disable_hw(struct tmc_drvdata *drvdata)
>  {
>  	CS_UNLOCK(drvdata->base);
> 

Why do we care about ETB and ETF when they both use RAM internal to the device?
Moreover, the system RAM they use is not dedicated and as such falls back to the
kernel's memory pool. 
 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index 625882bc8b08..b29c2db94d96 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -1110,7 +1110,7 @@ static void __tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
>  
>  }
>  
> -static void tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
> +void tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
>  {
>  	__tmc_etr_disable_hw(drvdata);
>  	/* Disable CATU device if this ETR is connected to one */
> diff --git a/drivers/hwtracing/coresight/coresight-tmc.c b/drivers/hwtracing/coresight/coresight-tmc.c
> index 5a271ebc4585..7e687a356fe0 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc.c
> @@ -540,6 +540,34 @@ static int tmc_probe(struct amba_device *adev, const struct amba_id *id)
>  	return ret;
>  }
>  
> +static void tmc_shutdown(struct amba_device *adev)
> +{
> +	struct tmc_drvdata *drvdata = amba_get_drvdata(adev);
> +
> +	if (!drvdata->enable)
> +		goto out;
> +
> +	/*
> +	 * We do not care about the active trace sessions here
> +	 * since the system is going down unlike remove callback,
> +	 * just make sure that the hardware is shutdown.
> +	 */
> +	switch (drvdata->config_type) {
> +	case TMC_CONFIG_TYPE_ETB:
> +		tmc_etb_disable_hw(drvdata);
> +		break;
> +	case TMC_CONFIG_TYPE_ETF:
> +		tmc_etf_disable_hw(drvdata);
> +		break;
> +	case TMC_CONFIG_TYPE_ETR:
> +		tmc_etr_disable_hw(drvdata);
> +	}
> +
> +out:
> +	misc_deregister(&drvdata->miscdev);
> +	coresight_unregister(drvdata->csdev);

If a session is active when tmc_shutdown() is called, unregistering the ETF/ETR
will result in a kernel crash if the session is stopped before the kernel has
had the opportunity to shutdown.  It is the problem as trying to make coresight
drivers modular. 

For this to really work the ongoing session would need to be stopped.  That
would teardown the path and stop the sink.

That being said I'm sure that dependencies on an IOMMU isn't a problem confined
to coresight. I am adding Robin Murphy, who added this commit [1], to the thread
in the hope that he can provide guidance on the right way to do this.

Thanks,
Mathieu

[1]. 2ac15068f346 arm64: dts: juno: Add SMMUs device nodes  

> +}
> +
>  static const struct amba_id tmc_ids[] = {
>  	CS_AMBA_ID(0x000bb961),
>  	/* Coresight SoC 600 TMC-ETR/ETS */
> @@ -558,6 +586,7 @@ static struct amba_driver tmc_driver = {
>  		.suppress_bind_attrs = true,
>  	},
>  	.probe		= tmc_probe,
> +	.shutdown	= tmc_shutdown,
>  	.id_table	= tmc_ids,
>  };
>  builtin_amba_driver(tmc_driver);
> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
> index d156860495c7..f4f56c474e58 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc.h
> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
> @@ -262,6 +262,8 @@ u32 tmc_get_memwidth_mask(struct tmc_drvdata *drvdata);
>  /* ETB/ETF functions */
>  int tmc_read_prepare_etb(struct tmc_drvdata *drvdata);
>  int tmc_read_unprepare_etb(struct tmc_drvdata *drvdata);
> +void tmc_etb_disable_hw(struct tmc_drvdata *drvdata);
> +void tmc_etf_disable_hw(struct tmc_drvdata *drvdata);
>  extern const struct coresight_ops tmc_etb_cs_ops;
>  extern const struct coresight_ops tmc_etf_cs_ops;
>  
> @@ -270,6 +272,7 @@ ssize_t tmc_etb_get_sysfs_trace(struct tmc_drvdata *drvdata,
>  /* ETR functions */
>  int tmc_read_prepare_etr(struct tmc_drvdata *drvdata);
>  int tmc_read_unprepare_etr(struct tmc_drvdata *drvdata);
> +void tmc_etr_disable_hw(struct tmc_drvdata *drvdata);
>  extern const struct coresight_ops tmc_etr_cs_ops;
>  ssize_t tmc_etr_get_sysfs_trace(struct tmc_drvdata *drvdata,
>  				loff_t pos, size_t len, char **bufpp);
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
