Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 861411AB056
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 20:10:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405376AbgDOSHW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 14:07:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2404681AbgDOSHU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 14:07:20 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69FAFC061A0C
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2020 11:07:20 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id b8so333621pfp.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2020 11:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6C3pEnvEDdvrQw/90ofLNOaYh5du+dDIyVaw8R2X6PU=;
        b=zSZNk/VRC6kmAJM0qdteDAjzXknHzYnSOkJ6KBd/9SPeqwdvN3h4FJQehSFmLlfs32
         uiJSin29PElx/wPVweYwIDqVUg5BcbxtClEWqetc5L/QVjy9C8//JzkZfWsKWr96TXEm
         TyBhoMS9A4Gr/iW7LYWSN4JUzqwgKxw7iH6rEopZIXhUuhzQlsSrZutXHAQ0Kq8f606D
         DrtqPpH1svUSXit0OZMtZ96IJOnVaLxrXJrCUrR3s2lLs5kernlvQpNC/TRPs8lSHSCG
         e/CNAf+PkCaKDkp2c8eIF+Gdav8DQHnemCT8iXW25zE4MdKeRD1Si52EkbnUiGOSWCEZ
         B3QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6C3pEnvEDdvrQw/90ofLNOaYh5du+dDIyVaw8R2X6PU=;
        b=moWaIH9HaOYA7FaN1lI7OdsQJG+q0u3XEwTgzKf7/Vl0d0uxYN+t8UYsZfsveeG4tl
         W5GwPlHZMST9K7cyjr6gmYx+6n5qMH8vEWUp9X2yx1ClQM7H82Y1JVhEtxwYMYca7oVS
         yx3w06WV3VRV5XwVmY/bI4ke7REACjhkAvXnwMUdqBU8MyPsfi4CX8iuU1QqcGlL4KXj
         Ve8W/N+qXB03Y256ihf11/fKdtR/3MWNIxbK6qedPlh05B0bQ2PP1pT0cwq/JVuJ0Ypz
         mbbrNgnLWpt2vhwiKCOMShQsq8ypifR002BcCKWfIBTwOX+bKvQeeptlGxaFBg4maOEg
         xaeg==
X-Gm-Message-State: AGi0PubwO/57LkeYzcioqaOh5tlREY09O77aPTFH+IQZxL5PwoSGjIEm
        IAKUBLGh64KR+wX3sF4ZaKKu9A==
X-Google-Smtp-Source: APiQypISS49EqCaurxZV/8fJ42FuizoYsp23pn2htdGj8ZS/9G1SQJQi++ic18c9Cw+laQPwuFth4A==
X-Received: by 2002:a63:f403:: with SMTP id g3mr28685967pgi.47.1586974039694;
        Wed, 15 Apr 2020 11:07:19 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id 22sm4945820pfb.132.2020.04.15.11.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 11:07:18 -0700 (PDT)
Date:   Wed, 15 Apr 2020 12:07:16 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org
Subject: Re: [PATCH v2 5/6] remoteproc: qcom: Add per subsystem SSR
 notification
Message-ID: <20200415180716.GD16583@xps15>
References: <1586389003-26675-1-git-send-email-sidgup@codeaurora.org>
 <1586389003-26675-6-git-send-email-sidgup@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586389003-26675-6-git-send-email-sidgup@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 08, 2020 at 04:36:42PM -0700, Siddharth Gupta wrote:
> Currently there is a global notification chain which is called whenever any
> remoteproc shuts down. This leads to all the listeners being notified, and
> is not an optimal design as kernel drivers might only be interested in
> listening to notifications from a particular remoteproc. Create an
> individual notifier chain for every SSR subdevice, and modify the
> notification registration API to include the remoteproc struct as an
> argument. Update the existing user of the registration API to get the
> phandle of the remoteproc dt node to register for SSR notifications.
> 
> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_common.c      | 49 +++++++++++++++++++++++++++--------
>  drivers/remoteproc/qcom_common.h      |  1 +
>  drivers/soc/qcom/glink_ssr.c          | 20 ++++++++++++--
>  include/linux/remoteproc/qcom_rproc.h | 17 ++++++++----
>  4 files changed, 69 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
> index 1d2351b..56b0c3e 100644
> --- a/drivers/remoteproc/qcom_common.c
> +++ b/drivers/remoteproc/qcom_common.c
> @@ -23,8 +23,6 @@
>  #define to_smd_subdev(d) container_of(d, struct qcom_rproc_subdev, subdev)
>  #define to_ssr_subdev(d) container_of(d, struct qcom_rproc_ssr, subdev)
>  
> -static BLOCKING_NOTIFIER_HEAD(ssr_notifiers);
> -
>  static int glink_subdev_start(struct rproc_subdev *subdev)
>  {
>  	struct qcom_rproc_glink *glink = to_glink_subdev(subdev);
> @@ -180,27 +178,52 @@ EXPORT_SYMBOL_GPL(qcom_remove_smd_subdev);
>  
>  /**
>   * qcom_register_ssr_notifier() - register SSR notification handler
> + * @rproc:	pointer to the remoteproc structure
>   * @nb:		notifier_block to notify for restart notifications
>   *
> - * Returns 0 on success, negative errno on failure.
> + * Returns pointer to srcu notifier head on success, ERR_PTR on failure.
>   *
> - * This register the @notify function as handler for restart notifications. As
> - * remote processors are stopped this function will be called, with the SSR
> - * name passed as a parameter.
> + * This registers the @notify function as handler for restart notifications. As
> + * remote processors are stopped this function will be called, with the rproc
> + * pointer passed as a parameter.
>   */
> -int qcom_register_ssr_notifier(struct notifier_block *nb)
> +void *qcom_register_ssr_notifier(struct rproc *rproc, struct notifier_block *nb)
>  {
> -	return blocking_notifier_chain_register(&ssr_notifiers, nb);
> +	struct rproc_subdev *subdev;
> +	struct qcom_rproc_ssr *ssr;
> +	int ret;

Variable 'ret' needs to be initalised to -ENOENT.

> +
> +	if (!rproc)
> +		return ERR_PTR(-EINVAL);
> +
> +	mutex_lock(&rproc->lock);
> +	list_for_each_entry(subdev, &rproc->subdevs, node) {
> +		ret = strcmp(subdev->name, "ssr_notifs");
> +		if (!ret)
> +			break;
> +	}
> +	mutex_unlock(&rproc->lock);
> +	if (ret)
> +		return ERR_PTR(-ENOENT);

If the rproc->subdevs list is empty to_ssr_subdev() will generate a coredump.

With the above:

Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> +
> +	ssr = to_ssr_subdev(subdev);
> +	srcu_notifier_chain_register(ssr->rproc_notif_list, nb);
> +
> +	return ssr->rproc_notif_list;
>  }
>  EXPORT_SYMBOL_GPL(qcom_register_ssr_notifier);
>  
>  /**
>   * qcom_unregister_ssr_notifier() - unregister SSR notification handler
> + * @notify:	pointer to srcu notifier head
>   * @nb:		notifier_block to unregister
>   */
> -void qcom_unregister_ssr_notifier(struct notifier_block *nb)
> +int qcom_unregister_ssr_notifier(void *notify, struct notifier_block *nb)
>  {
> -	blocking_notifier_chain_unregister(&ssr_notifiers, nb);
> +	if (!notify)
> +		return -EINVAL;
> +
> +	return srcu_notifier_chain_unregister(notify, nb);
>  }
>  EXPORT_SYMBOL_GPL(qcom_unregister_ssr_notifier);
>  
> @@ -208,7 +231,7 @@ static void ssr_notify_unprepare(struct rproc_subdev *subdev)
>  {
>  	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
>  
> -	blocking_notifier_call_chain(&ssr_notifiers, 0, (void *)ssr->name);
> +	srcu_notifier_call_chain(ssr->rproc_notif_list, 0, (void *)ssr->name);
>  }
>  
>  /**
> @@ -226,6 +249,9 @@ void qcom_add_ssr_subdev(struct rproc *rproc, struct qcom_rproc_ssr *ssr,
>  	ssr->name = ssr_name;
>  	ssr->subdev.name = kstrdup("ssr_notifs", GFP_KERNEL);
>  	ssr->subdev.unprepare = ssr_notify_unprepare;
> +	ssr->rproc_notif_list = kzalloc(sizeof(struct srcu_notifier_head),
> +								GFP_KERNEL);
> +	srcu_init_notifier_head(ssr->rproc_notif_list);
>  
>  	rproc_add_subdev(rproc, &ssr->subdev);
>  }
> @@ -239,6 +265,7 @@ EXPORT_SYMBOL_GPL(qcom_add_ssr_subdev);
>  void qcom_remove_ssr_subdev(struct rproc *rproc, struct qcom_rproc_ssr *ssr)
>  {
>  	kfree(ssr->subdev.name);
> +	kfree(ssr->rproc_notif_list);
>  	rproc_remove_subdev(rproc, &ssr->subdev);
>  }
>  EXPORT_SYMBOL_GPL(qcom_remove_ssr_subdev);
> diff --git a/drivers/remoteproc/qcom_common.h b/drivers/remoteproc/qcom_common.h
> index 58de71e..7792691 100644
> --- a/drivers/remoteproc/qcom_common.h
> +++ b/drivers/remoteproc/qcom_common.h
> @@ -27,6 +27,7 @@ struct qcom_rproc_subdev {
>  struct qcom_rproc_ssr {
>  	struct rproc_subdev subdev;
>  
> +	struct srcu_notifier_head *rproc_notif_list;
>  	const char *name;
>  };
>  
> diff --git a/drivers/soc/qcom/glink_ssr.c b/drivers/soc/qcom/glink_ssr.c
> index d7babe3..2b39683 100644
> --- a/drivers/soc/qcom/glink_ssr.c
> +++ b/drivers/soc/qcom/glink_ssr.c
> @@ -7,6 +7,7 @@
>  #include <linux/completion.h>
>  #include <linux/module.h>
>  #include <linux/notifier.h>
> +#include <linux/remoteproc.h>
>  #include <linux/rpmsg.h>
>  #include <linux/remoteproc/qcom_rproc.h>
>  
> @@ -49,6 +50,7 @@ struct glink_ssr {
>  	struct rpmsg_endpoint *ept;
>  
>  	struct notifier_block nb;
> +	void *notifier_head;
>  
>  	u32 seq_num;
>  	struct completion completion;
> @@ -112,6 +114,7 @@ static int qcom_glink_ssr_notify(struct notifier_block *nb, unsigned long event,
>  static int qcom_glink_ssr_probe(struct rpmsg_device *rpdev)
>  {
>  	struct glink_ssr *ssr;
> +	struct rproc *rproc;
>  
>  	ssr = devm_kzalloc(&rpdev->dev, sizeof(*ssr), GFP_KERNEL);
>  	if (!ssr)
> @@ -125,14 +128,27 @@ static int qcom_glink_ssr_probe(struct rpmsg_device *rpdev)
>  
>  	dev_set_drvdata(&rpdev->dev, ssr);
>  
> -	return qcom_register_ssr_notifier(&ssr->nb);
> +	rproc = rproc_get_by_child(&rpdev->dev);
> +	if (!rproc) {
> +		dev_err(&rpdev->dev, "glink device not child of rproc\n");
> +		return -EINVAL;
> +	}
> +
> +	ssr->notifier_head = qcom_register_ssr_notifier(rproc, &ssr->nb);
> +	if (IS_ERR(ssr->notifier_head)) {
> +		dev_err(&rpdev->dev,
> +			"failed to register for ssr notifications\n");
> +		return PTR_ERR(ssr->notifier_head);
> +	}
> +
> +	return 0;
>  }
>  
>  static void qcom_glink_ssr_remove(struct rpmsg_device *rpdev)
>  {
>  	struct glink_ssr *ssr = dev_get_drvdata(&rpdev->dev);
>  
> -	qcom_unregister_ssr_notifier(&ssr->nb);
> +	qcom_unregister_ssr_notifier(ssr->notifier_head, &ssr->nb);
>  }
>  
>  static const struct rpmsg_device_id qcom_glink_ssr_match[] = {
> diff --git a/include/linux/remoteproc/qcom_rproc.h b/include/linux/remoteproc/qcom_rproc.h
> index fa8e386..89e830a 100644
> --- a/include/linux/remoteproc/qcom_rproc.h
> +++ b/include/linux/remoteproc/qcom_rproc.h
> @@ -2,20 +2,27 @@
>  #define __QCOM_RPROC_H__
>  
>  struct notifier_block;
> +struct rproc;
>  
>  #if IS_ENABLED(CONFIG_QCOM_RPROC_COMMON)
>  
> -int qcom_register_ssr_notifier(struct notifier_block *nb);
> -void qcom_unregister_ssr_notifier(struct notifier_block *nb);
> +void *qcom_register_ssr_notifier(struct rproc *rproc,
> +				 struct notifier_block *nb);
> +int qcom_unregister_ssr_notifier(void *notify, struct notifier_block *nb);
>  
>  #else
>  
> -static inline int qcom_register_ssr_notifier(struct notifier_block *nb)
> +static inline void *qcom_register_ssr_notifier(struct rproc *rproc,
> +					       struct notifier_block *nb)
>  {
> -	return 0;
> +	return NULL;
>  }
>  
> -static inline void qcom_unregister_ssr_notifier(struct notifier_block *nb) {}
> +static inline int qcom_unregister_ssr_notifier(void *notify,
> +					       struct notifier_block *nb)
> +{
> +	return 0;
> +}
>  
>  #endif
>  
> -- 
> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
