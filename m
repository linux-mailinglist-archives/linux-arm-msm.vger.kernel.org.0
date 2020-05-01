Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4C421C1BE7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2020 19:37:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729953AbgEARhF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 May 2020 13:37:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729772AbgEARhE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 May 2020 13:37:04 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5F5CC08E859
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2020 10:37:04 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id t11so4845506pgg.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2020 10:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8Ssb7zR045y0hQVLJADfxNoncBIqCoA1zZayMTSJOr0=;
        b=hQ69sOZII3yUJZKvzqgTA8LlEb2W+x+4V2m+WK6WBI3Tv9Sz2Sa28ekYrPSz5DnTS6
         RnyhEv/ii17kbsMDUKml+C2aO6VCaV7qqB6bGAZP6M6uCSKwmdUOk3xVW5ovXqsj4fe9
         Ws/l7w4bPmqVcV8fKGJ+NoM6axcrB7Xp9DWboQsdYMiENlN1I1BuplWgP8rxdF5+A7T7
         QVXsgNe+JOwwnNEPtJ81qhP7LfWJ+oDH5drm/r0uk33usOgQiN+qUebKHveh2uWiKuno
         d2+TNZf1OCd5POX7yyQR1K45AzB7fzj4vv3GDTNScJ1V+r486i5ziz3URMRLDZ3x+FSS
         QbIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8Ssb7zR045y0hQVLJADfxNoncBIqCoA1zZayMTSJOr0=;
        b=M/ZhSbSYv/DRYUjL2zowK75KhG0YRBbjPOe9LrfObKqUdkMHmASWasHmQJiYnD7bcB
         kCQNKGS7e2ocCXsbJ9GsXgDfAGUfBeXOqPngIZrFLHADRBiZ1OKpe5coNRFXyet2J7zz
         yveXG9/pykX1cfT09W1EYXgpLWLRJKCUQDXvPhPYA4rQwvAWYXWSbjog4Li8fa73B+rR
         Npe3/85JN4zDsv3KIkZAD7PpE5b7uY07QuhSQ3WNpb8T/8uEsKAsBoSERzYYxLiof/BM
         7j4W0lG5KoXh8xJooQ87be+LkzbZoG6MYRc5b8h7ccdmcOgbYtB6k+LZxBJct3Tq5eOP
         dODw==
X-Gm-Message-State: AGi0PuZ3OOJn94MW/+t+K1nVytKZajoXORHSwwFYozsyZSGTQf0AD3RO
        tmbB/zRe5kBwjL1Dcw9VzqhoWQ==
X-Google-Smtp-Source: APiQypKsRiBbPiO5UhEvgJ1CHiMaz4G022mxednNbGE1FSP2xisXt1FHVOYEQLgrh2gez/w7Jv7UYQ==
X-Received: by 2002:a63:b542:: with SMTP id u2mr5053271pgo.352.1588354624072;
        Fri, 01 May 2020 10:37:04 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id a22sm2369969pga.28.2020.05.01.10.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 10:37:03 -0700 (PDT)
Date:   Fri, 1 May 2020 11:37:01 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Chris Lew <clew@codeaurora.org>, Sibi <sibis@codeaurora.org>,
        Siddharth Gupta <sidgup@codeaurora.org>
Subject: Re: [PATCH 2/4] soc: qcom: glink_ssr: Internalize ssr_notifiers
Message-ID: <20200501173701.GB30509@xps15>
References: <20200423003736.2027371-1-bjorn.andersson@linaro.org>
 <20200423003736.2027371-3-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200423003736.2027371-3-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 22, 2020 at 05:37:34PM -0700, Bjorn Andersson wrote:
> Rather than carrying a special purpose blocking notifier for glink_ssr
> in remoteproc's qcom_common.c, move it into glink_ssr so allow wider
> reuse of the common one.

After reading the changelog and the cover letter a few times along with thinking
about the content of the patch, I decude that glink_ssr devices using the
common ssr_notifiers in qcom_common.c was causing problems (having some details
on what those problems are would be useful). 

As such this patch is introducing a new notifier, also called ssr_notifiers,
that only deals with glink ssr notification to narrow the nature of the
notifications that are sent and received.  Is my understanding correct?  Also,
how does that fit into what Siddharth was doing here[1]?

It would be nice if Siddharth could ack the patch before moving forward.

Thanks,
Mathieu

[1]. https://patchwork.kernel.org/patch/11481081/ 

> 
> The rpmsg glink header file is used in preparation for the next patch.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/remoteproc/qcom_common.c |  8 ++++++++
>  drivers/soc/qcom/glink_ssr.c     | 24 +++++++++++++++++++-----
>  include/linux/rpmsg/qcom_glink.h |  6 ++++++
>  3 files changed, 33 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
> index ff26f2b68752..9028cea2d81e 100644
> --- a/drivers/remoteproc/qcom_common.c
> +++ b/drivers/remoteproc/qcom_common.c
> @@ -42,6 +42,13 @@ static void glink_subdev_stop(struct rproc_subdev *subdev, bool crashed)
>  	glink->edge = NULL;
>  }
>  
> +static void glink_subdev_unprepare(struct rproc_subdev *subdev)
> +{
> +	struct qcom_rproc_glink *glink = to_glink_subdev(subdev);
> +
> +	qcom_glink_ssr_notify(glink->ssr_name);
> +}
> +
>  /**
>   * qcom_add_glink_subdev() - try to add a GLINK subdevice to rproc
>   * @rproc:	rproc handle to parent the subdevice
> @@ -64,6 +71,7 @@ void qcom_add_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glink,
>  	glink->dev = dev;
>  	glink->subdev.start = glink_subdev_start;
>  	glink->subdev.stop = glink_subdev_stop;
> +	glink->subdev.unprepare = glink_subdev_unprepare;
>  
>  	rproc_add_subdev(rproc, &glink->subdev);
>  }
> diff --git a/drivers/soc/qcom/glink_ssr.c b/drivers/soc/qcom/glink_ssr.c
> index d7babe3d67bc..847d79c935f1 100644
> --- a/drivers/soc/qcom/glink_ssr.c
> +++ b/drivers/soc/qcom/glink_ssr.c
> @@ -54,6 +54,19 @@ struct glink_ssr {
>  	struct completion completion;
>  };
>  
> +/* Notifier list for all registered glink_ssr instances */
> +static BLOCKING_NOTIFIER_HEAD(ssr_notifiers);
> +
> +/**
> + * qcom_glink_ssr_notify() - notify GLINK SSR about stopped remoteproc
> + * @ssr_name:	name of the remoteproc that has been stopped
> + */
> +void qcom_glink_ssr_notify(const char *ssr_name)
> +{
> +	blocking_notifier_call_chain(&ssr_notifiers, 0, (void *)ssr_name);
> +}
> +EXPORT_SYMBOL_GPL(qcom_glink_ssr_notify);
> +
>  static int qcom_glink_ssr_callback(struct rpmsg_device *rpdev,
>  				   void *data, int len, void *priv, u32 addr)
>  {
> @@ -81,8 +94,9 @@ static int qcom_glink_ssr_callback(struct rpmsg_device *rpdev,
>  	return 0;
>  }
>  
> -static int qcom_glink_ssr_notify(struct notifier_block *nb, unsigned long event,
> -				 void *data)
> +static int qcom_glink_ssr_notifier_call(struct notifier_block *nb,
> +					unsigned long event,
> +					void *data)
>  {
>  	struct glink_ssr *ssr = container_of(nb, struct glink_ssr, nb);
>  	struct do_cleanup_msg msg;
> @@ -121,18 +135,18 @@ static int qcom_glink_ssr_probe(struct rpmsg_device *rpdev)
>  
>  	ssr->dev = &rpdev->dev;
>  	ssr->ept = rpdev->ept;
> -	ssr->nb.notifier_call = qcom_glink_ssr_notify;
> +	ssr->nb.notifier_call = qcom_glink_ssr_notifier_call;
>  
>  	dev_set_drvdata(&rpdev->dev, ssr);
>  
> -	return qcom_register_ssr_notifier(&ssr->nb);
> +	return blocking_notifier_chain_register(&ssr_notifiers, &ssr->nb);
>  }
>  
>  static void qcom_glink_ssr_remove(struct rpmsg_device *rpdev)
>  {
>  	struct glink_ssr *ssr = dev_get_drvdata(&rpdev->dev);
>  
> -	qcom_unregister_ssr_notifier(&ssr->nb);
> +	blocking_notifier_chain_unregister(&ssr_notifiers, &ssr->nb);
>  }
>  
>  static const struct rpmsg_device_id qcom_glink_ssr_match[] = {
> diff --git a/include/linux/rpmsg/qcom_glink.h b/include/linux/rpmsg/qcom_glink.h
> index 96e26d94719f..09daa0acde2c 100644
> --- a/include/linux/rpmsg/qcom_glink.h
> +++ b/include/linux/rpmsg/qcom_glink.h
> @@ -26,4 +26,10 @@ static inline void qcom_glink_smem_unregister(struct qcom_glink *glink) {}
>  
>  #endif
>  
> +#if IS_ENABLED(CONFIG_RPMSG_QCOM_GLINK_SSR)
> +void qcom_glink_ssr_notify(const char *ssr_name);
> +#else
> +static inline void qcom_glink_ssr_notify(const char *ssr_name) {}
> +#endif
> +
>  #endif
> -- 
> 2.24.0
> 
