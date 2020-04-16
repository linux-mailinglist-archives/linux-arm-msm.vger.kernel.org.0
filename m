Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 436A11AD083
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2020 21:42:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728246AbgDPTls (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Apr 2020 15:41:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726161AbgDPTlr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Apr 2020 15:41:47 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0AADC061A10
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2020 12:41:47 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id w11so2108712pga.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2020 12:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4+5yvpF/CzkFV4Q2jkIdrwA/yhScLV1YzzJf+T0+lT0=;
        b=vCizqDZqzySQAlaQKNZSPfzWTNKVRci9vMWz/TPic+3XrkQ03Ffgkm9kWe0f4jZjUf
         8G/6u6CSBI/Ollj0zVbg8YRdI9x7IulHItSD/ttIFKdkO77DNk9A2QM5GoXfHCf58OOY
         ENtU9vEBypBTtQvaaLBL8IVFxOKZCqadrz/x6ScCnlG0oxmakq9nru4cWYT20gdDgyY4
         UI+drYXOPUwSRIZRBwmi9GvTGrryUnz5pMW4HOHttXbnoQotENvKHXfDGo8RgUaV0vxP
         3QlZeNHsCFrYH93qGFHQbLR2Z2zNWAVNhknBrBzhUwknHU7g1S3YMLN4mvZEVckyopmG
         kNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4+5yvpF/CzkFV4Q2jkIdrwA/yhScLV1YzzJf+T0+lT0=;
        b=aKGJNhfUq3t0zGtQQdRlbSIYIPD7hPfZpgN8Xnddthjqw0n5xZybrg4SfMRcILwCRD
         e87ao2yt86VVnPNv4k8d3HjYEJJxtLXbix85rzU3Dh1WgISof+EWfkCAL8fYHb8azYbj
         ssLEn3Vg11z2+SlQxs+vtZmNug4RNYh7T4ChHRtiscfkVY16AUmh2Bz7itry6PGLAl8Q
         JKnEw/MCME8k5H9KmX4ThYZYwzCLHnR3l433EdpiutnkIrzlff3kuQ77jeBFEFkzgPzz
         0hPsI3fO3DT1bft2A/rWr0AR8JBM5g/T6jRlmw7umw+nCwQFIQ9Go4i0WVYTmsPsDYt7
         Fh5g==
X-Gm-Message-State: AGi0PuYuclrRdRjLP/PzVXbM8sark23goWdDHFMTshwIXHHXS+2CjQMp
        2Un4lLFVyGuzNDuC2tn5ku6X0g==
X-Google-Smtp-Source: APiQypL9j8meLyGkikWSZboSQOmU2u65qLLK1r6+xhTUyBIVdpn5qScfiojY7EddmHUFHZFnYDfj6w==
X-Received: by 2002:a05:6a00:c8:: with SMTP id e8mr32914135pfj.131.1587066106898;
        Thu, 16 Apr 2020 12:41:46 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id y123sm17140605pfb.13.2020.04.16.12.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 12:41:46 -0700 (PDT)
Date:   Thu, 16 Apr 2020 13:41:44 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org
Subject: Re: [PATCH v2 2/2] remoteproc: core: Prevent sleep when rproc crashes
Message-ID: <20200416194144.GA30314@xps15>
References: <1586384305-7825-1-git-send-email-sidgup@codeaurora.org>
 <1586384305-7825-3-git-send-email-sidgup@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586384305-7825-3-git-send-email-sidgup@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 08, 2020 at 03:18:25PM -0700, Siddharth Gupta wrote:
> Remoteproc recovery should be fast and any delay will have an impact on the
> user-experience. Add a wakeup source to remoteproc which ensures that the
> system does not go into idle state while a remoteproc is recovering, thus
> prevent any delays that might occur during system resume.
> 
> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c   | 1 +
>  drivers/remoteproc/remoteproc_core.c | 4 ++++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 7a63efb..6bb2c7d 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -401,6 +401,7 @@ static int adsp_probe(struct platform_device *pdev)
>  
>  	adsp = (struct qcom_adsp *)rproc->priv;
>  	adsp->dev = &pdev->dev;
> +	device_wakeup_enable(adsp->dev);
>  	adsp->rproc = rproc;
>  	adsp->pas_id = desc->pas_id;
>  	adsp->has_aggre2_clk = desc->has_aggre2_clk;
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 9f99fe2..19a360d 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1729,6 +1729,8 @@ static void rproc_crash_handler_work(struct work_struct *work)
>  
>  	if (!rproc->recovery_disabled)
>  		rproc_trigger_recovery(rproc);
> +
> +	pm_relax(rproc->dev.parent);
>  }
>  
>  /**
> @@ -2273,6 +2275,8 @@ void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type)
>  		return;
>  	}
>  
> +	pm_stay_awake(rproc->dev.parent);
> +

Much better:

Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  	dev_err(&rproc->dev, "crash detected in %s: type %s\n",
>  		rproc->name, rproc_crash_to_string(type));
>  
> -- 
> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
