Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E6C01C9898
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2020 20:02:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728131AbgEGSBh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 May 2020 14:01:37 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:11637 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728130AbgEGSBg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 May 2020 14:01:36 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588874495; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=SVQSqROXpIvygyQ3701TonPjmX97ZR/o5HUjviGGPXU=;
 b=vSjA6mdarXtfYmxfY5NfS0HOOE/lnKoSa7zjJW0jfVElgSvKgUyxgBzSebN3QP5OuP9+hX3H
 MIlAtZgaTFIOtkvSZ6/EPDGgjFMATskTB+PSu6bBO8A+TTv4WO0KtVl5rbA0Z1XlGrB9ZwNK
 Qq/3j+CsZWb3+GJ1ZKh+zePjX1g=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 099FDC433BA; Thu,  7 May 2020 18:00:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rishabhb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 37265C433F2;
        Thu,  7 May 2020 18:00:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 07 May 2020 11:00:54 -0700
From:   rishabhb@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Chris Lew <clew@codeaurora.org>, Sibi <sibis@codeaurora.org>,
        Siddharth Gupta <sidgup@codeaurora.org>,
        linux-remoteproc-owner@vger.kernel.org
Subject: Re: [PATCH 2/4] soc: qcom: glink_ssr: Internalize ssr_notifiers
In-Reply-To: <20200423003736.2027371-3-bjorn.andersson@linaro.org>
References: <20200423003736.2027371-1-bjorn.andersson@linaro.org>
 <20200423003736.2027371-3-bjorn.andersson@linaro.org>
Message-ID: <ec8920c9aca56278abff44745df5425e@codeaurora.org>
X-Sender: rishabhb@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-04-22 17:37, Bjorn Andersson wrote:
> Rather than carrying a special purpose blocking notifier for glink_ssr
> in remoteproc's qcom_common.c, move it into glink_ssr so allow wider
> reuse of the common one.
> 
> The rpmsg glink header file is used in preparation for the next patch.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Acked-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>

>  drivers/remoteproc/qcom_common.c |  8 ++++++++
>  drivers/soc/qcom/glink_ssr.c     | 24 +++++++++++++++++++-----
>  include/linux/rpmsg/qcom_glink.h |  6 ++++++
>  3 files changed, 33 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_common.c 
> b/drivers/remoteproc/qcom_common.c
> index ff26f2b68752..9028cea2d81e 100644
> --- a/drivers/remoteproc/qcom_common.c
> +++ b/drivers/remoteproc/qcom_common.c
> @@ -42,6 +42,13 @@ static void glink_subdev_stop(struct rproc_subdev
> *subdev, bool crashed)
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
> @@ -64,6 +71,7 @@ void qcom_add_glink_subdev(struct rproc *rproc,
> struct qcom_rproc_glink *glink,
>  	glink->dev = dev;
>  	glink->subdev.start = glink_subdev_start;
>  	glink->subdev.stop = glink_subdev_stop;
> +	glink->subdev.unprepare = glink_subdev_unprepare;
> 
>  	rproc_add_subdev(rproc, &glink->subdev);
>  }
> diff --git a/drivers/soc/qcom/glink_ssr.c 
> b/drivers/soc/qcom/glink_ssr.c
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
> @@ -81,8 +94,9 @@ static int qcom_glink_ssr_callback(struct 
> rpmsg_device *rpdev,
>  	return 0;
>  }
> 
> -static int qcom_glink_ssr_notify(struct notifier_block *nb, unsigned
> long event,
> -				 void *data)
> +static int qcom_glink_ssr_notifier_call(struct notifier_block *nb,
> +					unsigned long event,
> +					void *data)
>  {
>  	struct glink_ssr *ssr = container_of(nb, struct glink_ssr, nb);
>  	struct do_cleanup_msg msg;
> @@ -121,18 +135,18 @@ static int qcom_glink_ssr_probe(struct
> rpmsg_device *rpdev)
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
> diff --git a/include/linux/rpmsg/qcom_glink.h 
> b/include/linux/rpmsg/qcom_glink.h
> index 96e26d94719f..09daa0acde2c 100644
> --- a/include/linux/rpmsg/qcom_glink.h
> +++ b/include/linux/rpmsg/qcom_glink.h
> @@ -26,4 +26,10 @@ static inline void
> qcom_glink_smem_unregister(struct qcom_glink *glink) {}
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
