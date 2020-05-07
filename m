Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0D7F1C988E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2020 20:01:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728093AbgEGSAy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 May 2020 14:00:54 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:23254 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726950AbgEGSAy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 May 2020 14:00:54 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588874453; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=V2UzeczAOzuRzbcwtp57WQZkgmlbothElG0QWq0YFcc=;
 b=l5ioqquBAwDymUEdso/3qfS1rUZp0i2Eyx6+dZgo2iZZENLqX5BwTiTVzTbUMTqLGnzuacH0
 w8eQA1c8kIjotxT5pGieG3t0cRIZH1LehMe2RyiHLxLoxZ7DtVwCOqqqr/mDdXG9jIoI4+2M
 4iPok3M29AfGnMqGVNQLvlyO3T4=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8996FC433F2; Thu,  7 May 2020 18:00:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rishabhb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0693FC433BA;
        Thu,  7 May 2020 18:00:20 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 07 May 2020 11:00:19 -0700
From:   rishabhb@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Chris Lew <clew@codeaurora.org>, Sibi <sibis@codeaurora.org>,
        Siddharth Gupta <sidgup@codeaurora.org>,
        linux-remoteproc-owner@vger.kernel.org
Subject: Re: [PATCH 1/4] remoteproc: qcom: Pass ssr_name to glink subdevice
In-Reply-To: <20200423003736.2027371-2-bjorn.andersson@linaro.org>
References: <20200423003736.2027371-1-bjorn.andersson@linaro.org>
 <20200423003736.2027371-2-bjorn.andersson@linaro.org>
Message-ID: <6138eb0490203f138e97baf9c3fdaf1a@codeaurora.org>
X-Sender: rishabhb@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-04-22 17:37, Bjorn Andersson wrote:
> Pass ssr_name to glink subdevice in preparation for tying glink_ssr to
> the glink subdevice, rather than having its own "ssr subdevice".
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Acked-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>

>  drivers/remoteproc/qcom_common.c    | 9 ++++++++-
>  drivers/remoteproc/qcom_common.h    | 5 ++++-
>  drivers/remoteproc/qcom_q6v5_adsp.c | 2 +-
>  drivers/remoteproc/qcom_q6v5_mss.c  | 2 +-
>  drivers/remoteproc/qcom_q6v5_pas.c  | 2 +-
>  5 files changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_common.c 
> b/drivers/remoteproc/qcom_common.c
> index 60650bcc8c67..ff26f2b68752 100644
> --- a/drivers/remoteproc/qcom_common.c
> +++ b/drivers/remoteproc/qcom_common.c
> @@ -46,8 +46,10 @@ static void glink_subdev_stop(struct rproc_subdev
> *subdev, bool crashed)
>   * qcom_add_glink_subdev() - try to add a GLINK subdevice to rproc
>   * @rproc:	rproc handle to parent the subdevice
>   * @glink:	reference to a GLINK subdev context
> + * @ssr_name:	identifier of the associated remoteproc for ssr 
> notifications
>   */
> -void qcom_add_glink_subdev(struct rproc *rproc, struct 
> qcom_rproc_glink *glink)
> +void qcom_add_glink_subdev(struct rproc *rproc, struct 
> qcom_rproc_glink *glink,
> +			   const char *ssr_name)
>  {
>  	struct device *dev = &rproc->dev;
> 
> @@ -55,6 +57,10 @@ void qcom_add_glink_subdev(struct rproc *rproc,
> struct qcom_rproc_glink *glink)
>  	if (!glink->node)
>  		return;
> 
> +	glink->ssr_name = kstrdup_const(ssr_name, GFP_KERNEL);
> +	if (!glink->ssr_name)
> +		return;
> +
>  	glink->dev = dev;
>  	glink->subdev.start = glink_subdev_start;
>  	glink->subdev.stop = glink_subdev_stop;
> @@ -74,6 +80,7 @@ void qcom_remove_glink_subdev(struct rproc *rproc,
> struct qcom_rproc_glink *glin
>  		return;
> 
>  	rproc_remove_subdev(rproc, &glink->subdev);
> +	kfree_const(glink->ssr_name);
>  	of_node_put(glink->node);
>  }
>  EXPORT_SYMBOL_GPL(qcom_remove_glink_subdev);
> diff --git a/drivers/remoteproc/qcom_common.h 
> b/drivers/remoteproc/qcom_common.h
> index 58de71e4781c..34e5188187dc 100644
> --- a/drivers/remoteproc/qcom_common.h
> +++ b/drivers/remoteproc/qcom_common.h
> @@ -11,6 +11,8 @@ struct qcom_sysmon;
>  struct qcom_rproc_glink {
>  	struct rproc_subdev subdev;
> 
> +	const char *ssr_name;
> +
>  	struct device *dev;
>  	struct device_node *node;
>  	struct qcom_glink *edge;
> @@ -30,7 +32,8 @@ struct qcom_rproc_ssr {
>  	const char *name;
>  };
> 
> -void qcom_add_glink_subdev(struct rproc *rproc, struct
> qcom_rproc_glink *glink);
> +void qcom_add_glink_subdev(struct rproc *rproc, struct 
> qcom_rproc_glink *glink,
> +			   const char *ssr_name);
>  void qcom_remove_glink_subdev(struct rproc *rproc, struct
> qcom_rproc_glink *glink);
> 
>  int qcom_register_dump_segments(struct rproc *rproc, const struct
> firmware *fw);
> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c
> b/drivers/remoteproc/qcom_q6v5_adsp.c
> index c60dabc6939e..d2a2574dcf35 100644
> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> @@ -461,7 +461,7 @@ static int adsp_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto disable_pm;
> 
> -	qcom_add_glink_subdev(rproc, &adsp->glink_subdev);
> +	qcom_add_glink_subdev(rproc, &adsp->glink_subdev, desc->ssr_name);
>  	qcom_add_ssr_subdev(rproc, &adsp->ssr_subdev, desc->ssr_name);
>  	adsp->sysmon = qcom_add_sysmon_subdev(rproc,
>  					      desc->sysmon_name,
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c
> b/drivers/remoteproc/qcom_q6v5_mss.c
> index 7af1d0c987e0..b5dd36775b77 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -1762,7 +1762,7 @@ static int q6v5_probe(struct platform_device 
> *pdev)
> 
>  	qproc->mpss_perm = BIT(QCOM_SCM_VMID_HLOS);
>  	qproc->mba_perm = BIT(QCOM_SCM_VMID_HLOS);
> -	qcom_add_glink_subdev(rproc, &qproc->glink_subdev);
> +	qcom_add_glink_subdev(rproc, &qproc->glink_subdev, "mpss");
>  	qcom_add_smd_subdev(rproc, &qproc->smd_subdev);
>  	qcom_add_ssr_subdev(rproc, &qproc->ssr_subdev, "mpss");
>  	qcom_add_ipa_notify_subdev(rproc, &qproc->ipa_notify_subdev);
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c
> b/drivers/remoteproc/qcom_q6v5_pas.c
> index 8ecc157f1ed1..fc6658b523b6 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -436,7 +436,7 @@ static int adsp_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto detach_proxy_pds;
> 
> -	qcom_add_glink_subdev(rproc, &adsp->glink_subdev);
> +	qcom_add_glink_subdev(rproc, &adsp->glink_subdev, desc->ssr_name);
>  	qcom_add_smd_subdev(rproc, &adsp->smd_subdev);
>  	qcom_add_ssr_subdev(rproc, &adsp->ssr_subdev, desc->ssr_name);
>  	adsp->sysmon = qcom_add_sysmon_subdev(rproc,
