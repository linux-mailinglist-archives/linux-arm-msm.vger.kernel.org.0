Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8292D172951
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2020 21:14:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729795AbgB0UOO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Feb 2020 15:14:14 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:38859 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729767AbgB0UON (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Feb 2020 15:14:13 -0500
Received: by mail-pl1-f193.google.com with SMTP id p7so248375pli.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2020 12:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HueSZx0ts8rrl9axXw3uhQrr5WR5FCAoM3cWMzSUgig=;
        b=hNTfbru9GbcIsnZTVTdW0TakeEdKmidNn9IGs9Q4vyQM5obrsrI6gbCWhrTP1ZjqiG
         fNOQO9OikDz6eyrMN7moq6+WGCOBwPrQXpa4mnSSzA1zjBxWb2RPE+/8/vLCTnCaBr6+
         J/9PTCyTntgmKIZdiizaCQpVBAkIyzUGztMR71yEdQgpX3u3ovwgmtmnr04S4yvqhWy/
         o/4yKE3uf+lGEqeLvsHPav3OumWq/dUSWNoOD1zYxCtB8GSe/M7PmgK0T9e4u3e1oT3M
         NI181DWGmEzEoSrD1WNQ30g8z0NTEHw6ZFeB9C8lZAlzm7nGhujoJQ+Am/nLoY1gT+Vo
         bjsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HueSZx0ts8rrl9axXw3uhQrr5WR5FCAoM3cWMzSUgig=;
        b=IIvPiaIk/1VD3ClgiMCuCeh7/IisG+jAbThht9gcQfRgYgci8XrIi853f8W0EPhZpX
         kevc//Bc3I9UY+hdqCLIBwPlE31+senRNcxhCBiR7Zc+5dxA85gRY6bgnmMHTeb59K2B
         LWo/QE7KLDOCivVK8ezF7HDeFSobIFDbspzSKA3ZrdhJfBNpXI1CgSDTQKDh5b6z02hT
         WK4xPNCPywkijVfqly0SrmlVs4teqbbcEBSAjkrMLfzcWQU0kzAVCgPn9OLfwdsn3wJt
         4VSLOqWQBLtr6Pbc/WXTAWBZy8XqVfFT7QmAv1KhqD8Vr1yWhg0qh5DGNGbqSNpN62yA
         VQnw==
X-Gm-Message-State: APjAAAVRsbwCZZlK05S5yWQp9LtsByB0Cif4zHN9Fom9maOAmDYGi6Ke
        4KU5W6kKR7nkIU9ZBAdSJAdTmw==
X-Google-Smtp-Source: APXvYqyjkedN5nnEyPuP2TOGanlZFuaAlwWxVqtpqMCjioYvsaHmpHmOGZsqvmBEwtv9veLZecW9Cw==
X-Received: by 2002:a17:90a:191a:: with SMTP id 26mr656861pjg.111.1582834450608;
        Thu, 27 Feb 2020 12:14:10 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id v29sm7349350pgc.72.2020.02.27.12.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 12:14:10 -0800 (PST)
Date:   Thu, 27 Feb 2020 13:14:08 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org
Subject: Re: [PATCH 4/6] drivers: remoteproc: Add name field for every
 subdevice
Message-ID: <20200227201408.GB20116@xps15>
References: <1582167465-2549-1-git-send-email-sidgup@codeaurora.org>
 <1582167465-2549-5-git-send-email-sidgup@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582167465-2549-5-git-send-email-sidgup@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 19, 2020 at 06:57:43PM -0800, Siddharth Gupta wrote:
> From: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> 
> When a client driver wishes to utilize functionality from a particular
> subdevice of a remoteproc, it cannot differentiate between the subdevices
> that have been added. This patch allows the client driver to distinguish
> between subdevices and thus utilize their functionality.
> 
> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_common.c | 6 ++++++
>  include/linux/remoteproc.h       | 2 ++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
> index 60650bc..5d59538 100644
> --- a/drivers/remoteproc/qcom_common.c
> +++ b/drivers/remoteproc/qcom_common.c
> @@ -58,6 +58,7 @@ void qcom_add_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glink)
>  	glink->dev = dev;
>  	glink->subdev.start = glink_subdev_start;
>  	glink->subdev.stop = glink_subdev_stop;
> +	glink->subdev.name = kstrdup("glink", GFP_KERNEL);

Because @subdev is a member of qcom_rproc_glink (rather than a pointer), it is
possible to get to glink with container_of().  From there edge->name is
available - would that work?

>  
>  	rproc_add_subdev(rproc, &glink->subdev);
>  }
> @@ -73,6 +74,7 @@ void qcom_remove_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glin
>  	if (!glink->node)
>  		return;
>  
> +	kfree(glink->subdev.name);
>  	rproc_remove_subdev(rproc, &glink->subdev);
>  	of_node_put(glink->node);
>  }
> @@ -154,6 +156,7 @@ void qcom_add_smd_subdev(struct rproc *rproc, struct qcom_rproc_subdev *smd)
>  	smd->dev = dev;
>  	smd->subdev.start = smd_subdev_start;
>  	smd->subdev.stop = smd_subdev_stop;
> +	smd->subdev.name = kstrdup("smd", GFP_KERNEL);

Same as above - qcom_smd_edge has a name.

Worse case scenario, both qcom_rproc_glink and qcom_smd_edge have a device_node
that can be used as well.

>  
>  	rproc_add_subdev(rproc, &smd->subdev);
>  }
> @@ -169,6 +172,7 @@ void qcom_remove_smd_subdev(struct rproc *rproc, struct qcom_rproc_subdev *smd)
>  	if (!smd->node)
>  		return;
>  
> +	kfree(smd->subdev.name);
>  	rproc_remove_subdev(rproc, &smd->subdev);
>  	of_node_put(smd->node);
>  }
> @@ -220,6 +224,7 @@ void qcom_add_ssr_subdev(struct rproc *rproc, struct qcom_rproc_ssr *ssr,
>  			 const char *ssr_name)
>  {
>  	ssr->name = ssr_name;
> +	ssr->subdev.name = kstrdup("ssr_notifs", GFP_KERNEL);
>  	ssr->subdev.unprepare = ssr_notify_unprepare;
>  
>  	rproc_add_subdev(rproc, &ssr->subdev);
> @@ -233,6 +238,7 @@ EXPORT_SYMBOL_GPL(qcom_add_ssr_subdev);
>   */
>  void qcom_remove_ssr_subdev(struct rproc *rproc, struct qcom_rproc_ssr *ssr)
>  {
> +	kfree(ssr->subdev.name);
>  	rproc_remove_subdev(rproc, &ssr->subdev);
>  }
>  EXPORT_SYMBOL_GPL(qcom_remove_ssr_subdev);
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index e2eaba9..e2f60cc 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -519,6 +519,7 @@ struct rproc {
>  /**
>   * struct rproc_subdev - subdevice tied to a remoteproc
>   * @node: list node related to the rproc subdevs list
> + * @name: name of the subdevice
>   * @prepare: prepare function, called before the rproc is started
>   * @start: start function, called after the rproc has been started
>   * @stop: stop function, called before the rproc is stopped; the @crashed
> @@ -527,6 +528,7 @@ struct rproc {
>   */
>  struct rproc_subdev {
>  	struct list_head node;
> +	char *name;
>  
>  	int (*prepare)(struct rproc_subdev *subdev);
>  	int (*start)(struct rproc_subdev *subdev);
> -- 
> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
