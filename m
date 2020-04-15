Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C97411AB05E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 20:11:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406177AbgDOSKq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 14:10:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2405877AbgDOSKl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 14:10:41 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACAF5C061A0C
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2020 11:10:41 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id b72so331883pfb.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2020 11:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yOYBo8OjxgFUtMIRY6LWGA61eRM9SefgAlvGVD6yLNE=;
        b=uyR3zgToYS8mKENYz2nWMYAMB/GuEttq4rdHLh72Oogd0C9iaqdiY+zZ+YwXHTxJww
         R5kmMnjaktd+YRbiCzCC4BbARWPsJOeRydzeCsJWJgTsd3c+ZtrK8ZrpeHSZoBNSYQ5G
         jCbxh5+SPvtgYxzE2yLKx7r3YO+deFbwHqEuUlNKhFyymhIRiP0kasFWvNLGddCTtDh1
         ODAQGq35qmLcM+g3/MNFmMGqG2IfVqgZXw5GgLPA6kfU8hYkneMF4ujTiSPkgg8kn2xF
         9tQO0dZXU1vFQvqllbJNdEc6gbmXJW57lkYwwkdoG2MeCAKzd21VviQxqYLR38PykAeR
         r/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yOYBo8OjxgFUtMIRY6LWGA61eRM9SefgAlvGVD6yLNE=;
        b=ZNJGpxal4CFqyPBSuzKbGcaa9M2Nmfe5oTpsIoqgNqSfJb1WEznw7GfyRnQE4Bbytm
         UoDVli/VU32lVVyeSUA1/6FORGqkxJoIAbto0cez7S8DdsBBJ66XDteodopQlF0nZ/R8
         NjuHlyUy/2d+9tKBd/63Uv2ti03TDzAOvfVHSderga9+XWqcRUeXWwDXmMbOues5saWY
         Ee90PzKyJCJ69uoGNU5TEJgP9tDC193+OC9VwjKACCOHBZMF7iCOvC/M/JlD46E0wqbV
         WaIrQnGTPwY7Nj+u9fZQ7AMj99wmUHxJ0uWGN0LMmE50bN3RVIyHON/6WeFdn4z/aeBm
         DbpQ==
X-Gm-Message-State: AGi0Pubra4/cTijY9OBuO9+pMZ4Om6p7EqR1FdHb0kCmSzs3waNI7Mdd
        Njlovspfq2FjGTu/8uGVjBASJg==
X-Google-Smtp-Source: APiQypJ6qJ39VM0kUmNEVlXtvEwbTTfiXrQq1kKfK78aoE4KVf394jbk0vwvHXBhxKyQYNlGu08xgQ==
X-Received: by 2002:a62:dd48:: with SMTP id w69mr18468228pff.86.1586974241107;
        Wed, 15 Apr 2020 11:10:41 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id 198sm14741291pfa.87.2020.04.15.11.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 11:10:40 -0700 (PDT)
Date:   Wed, 15 Apr 2020 12:10:38 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org
Subject: Re: [PATCH v2 6/6] remoteproc: qcom: Add notification types to SSR
Message-ID: <20200415181038.GE16583@xps15>
References: <1586389003-26675-1-git-send-email-sidgup@codeaurora.org>
 <1586389003-26675-7-git-send-email-sidgup@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586389003-26675-7-git-send-email-sidgup@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 08, 2020 at 04:36:43PM -0700, Siddharth Gupta wrote:
> The SSR subdevice only adds callback for the unprepare event. Add callbacks
> for unprepare, start and prepare events. The client driver for a particular
> remoteproc might be interested in knowing the status of the remoteproc
> while undergoing SSR, not just when the remoteproc has finished shutting
> down.
> 
> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_common.c | 39 +++++++++++++++++++++++++++++++++++----
>  include/linux/remoteproc.h       | 15 +++++++++++++++
>  2 files changed, 50 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
> index 56b0c3e..06611f2 100644
> --- a/drivers/remoteproc/qcom_common.c
> +++ b/drivers/remoteproc/qcom_common.c
> @@ -183,9 +183,9 @@ EXPORT_SYMBOL_GPL(qcom_remove_smd_subdev);
>   *
>   * Returns pointer to srcu notifier head on success, ERR_PTR on failure.
>   *
> - * This registers the @notify function as handler for restart notifications. As
> - * remote processors are stopped this function will be called, with the rproc
> - * pointer passed as a parameter.
> + * This registers the @notify function as handler for powerup/shutdown
> + * notifications. This function will be invoked inside the callbacks registered
> + * for the ssr subdevice, with the rproc pointer passed as a parameter.
>   */
>  void *qcom_register_ssr_notifier(struct rproc *rproc, struct notifier_block *nb)
>  {
> @@ -227,11 +227,39 @@ int qcom_unregister_ssr_notifier(void *notify, struct notifier_block *nb)
>  }
>  EXPORT_SYMBOL_GPL(qcom_unregister_ssr_notifier);
>  
> +static int ssr_notify_prepare(struct rproc_subdev *subdev)
> +{
> +	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
> +
> +	srcu_notifier_call_chain(ssr->rproc_notif_list,
> +				 RPROC_BEFORE_POWERUP, (void *)ssr->name);
> +	return 0;
> +}
> +
> +static int ssr_notify_start(struct rproc_subdev *subdev)
> +{
> +	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
> +
> +	srcu_notifier_call_chain(ssr->rproc_notif_list,
> +				 RPROC_AFTER_POWERUP, (void *)ssr->name);
> +	return 0;
> +}
> +
> +static void ssr_notify_stop(struct rproc_subdev *subdev, bool crashed)
> +{
> +	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
> +
> +	srcu_notifier_call_chain(ssr->rproc_notif_list,
> +				 RPROC_BEFORE_SHUTDOWN, (void *)ssr->name);
> +}
> +
> +
>  static void ssr_notify_unprepare(struct rproc_subdev *subdev)
>  {
>  	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
>  
> -	srcu_notifier_call_chain(ssr->rproc_notif_list, 0, (void *)ssr->name);
> +	srcu_notifier_call_chain(ssr->rproc_notif_list,
> +				 RPROC_AFTER_SHUTDOWN, (void *)ssr->name);
>  }
>  
>  /**
> @@ -248,6 +276,9 @@ void qcom_add_ssr_subdev(struct rproc *rproc, struct qcom_rproc_ssr *ssr,
>  {
>  	ssr->name = ssr_name;
>  	ssr->subdev.name = kstrdup("ssr_notifs", GFP_KERNEL);
> +	ssr->subdev.prepare = ssr_notify_prepare;
> +	ssr->subdev.start = ssr_notify_start;
> +	ssr->subdev.stop = ssr_notify_stop;
>  	ssr->subdev.unprepare = ssr_notify_unprepare;
>  	ssr->rproc_notif_list = kzalloc(sizeof(struct srcu_notifier_head),
>  								GFP_KERNEL);
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 687e1eb..facadb07 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -452,6 +452,21 @@ struct rproc_dump_segment {
>  };
>  
>  /**
> + * enum rproc_notif_type - Different stages of remoteproc notifications
> + * @RPROC_BEFORE_SHUTDOWN:	unprepare stage of  remoteproc
> + * @RPROC_AFTER_SHUTDOWN:	stop stage of  remoteproc
> + * @RPROC_BEFORE_POWERUP:	prepare stage of  remoteproc
> + * @RPROC_AFTER_POWERUP:	start stage of  remoteproc
> + */
> +enum rproc_notif_type {
> +	RPROC_BEFORE_SHUTDOWN,
> +	RPROC_AFTER_SHUTDOWN,
> +	RPROC_BEFORE_POWERUP,
> +	RPROC_AFTER_POWERUP,
> +	RPROC_MAX

Not sure why you have a RPROC_MAX here...  It is not needed in this set but it
might be in some downstream or upcoming code. 

Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> +};
> +
> +/**
>   * struct rproc - represents a physical remote processor device
>   * @node: list node of this rproc object
>   * @domain: iommu domain
> -- 
> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
