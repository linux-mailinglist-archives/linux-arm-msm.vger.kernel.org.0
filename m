Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E08C82AE53A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Nov 2020 02:02:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732123AbgKKBCC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Nov 2020 20:02:02 -0500
Received: from z5.mailgun.us ([104.130.96.5]:61778 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731657AbgKKBCC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Nov 2020 20:02:02 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1605056521; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=T/B1v6bnRxlVQg3RTaFBJX+up2GEMDlx7ltEY2WfdPM=;
 b=vPP5KZaDQzFJ93dXMKPi6Ai8Jq0Y73sU85r6PDyKB8QmzcYrsv+yGucY61czk19eMkleYNWN
 R8A4aEGhEYNd69Wi6aH+OxI7D3duD1AazoJVYb9t5SvPV0apv3OZCUqS2FVh1DqsYDyNuFRe
 +G+GC+yjvPfGvU1WnOPbP/osgHE=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5fab37f1cecc309dcb094eb4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 11 Nov 2020 01:01:37
 GMT
Sender: rishabhb=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 46A2EC433F0; Wed, 11 Nov 2020 01:01:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rishabhb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1451DC433C8;
        Wed, 11 Nov 2020 01:01:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 10 Nov 2020 17:01:34 -0800
From:   rishabhb@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Siddharth Gupta <sidgup@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] remoteproc: sysmon: Expose the shutdown result
In-Reply-To: <20201105045051.1365780-3-bjorn.andersson@linaro.org>
References: <20201105045051.1365780-1-bjorn.andersson@linaro.org>
 <20201105045051.1365780-3-bjorn.andersson@linaro.org>
Message-ID: <e625c41bf36c01b3feb756e41d67dc9e@codeaurora.org>
X-Sender: rishabhb@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-11-04 20:50, Bjorn Andersson wrote:
> A graceful shutdown of the Qualcomm remote processors where
> traditionally performed by invoking a shared memory state signal and
> waiting for the associated ack.
> 
> This was later superseded by the "sysmon" mechanism, where some form of
> shared memory bus is used to send a "graceful shutdown request" message
> and one of more signals comes back to indicate its success.
> 
> But when this newer mechanism is in effect the firmware is shut down by
> the time the older mechanism, implemented in the remoteproc drivers,
> attempts to perform a graceful shutdown - and as such it will never
> receive an ack back.
> 
> This patch therefor track the success of the latest shutdown attempt in
> sysmon and exposes a new function in the API that the remoteproc driver
> can use to query the success and the necessity of invoking the older
> mechanism.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v1:
> - New patch
> 
>  drivers/remoteproc/qcom_common.h |  6 +++
>  drivers/remoteproc/qcom_sysmon.c | 82 ++++++++++++++++++++++++--------
>  2 files changed, 69 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_common.h 
> b/drivers/remoteproc/qcom_common.h
> index dfc641c3a98b..8ba9052955bd 100644
> --- a/drivers/remoteproc/qcom_common.h
> +++ b/drivers/remoteproc/qcom_common.h
> @@ -51,6 +51,7 @@ struct qcom_sysmon *qcom_add_sysmon_subdev(struct
> rproc *rproc,
>  					   const char *name,
>  					   int ssctl_instance);
>  void qcom_remove_sysmon_subdev(struct qcom_sysmon *sysmon);
> +bool qcom_sysmon_shutdown_acked(struct qcom_sysmon *sysmon);
>  #else
>  static inline struct qcom_sysmon *qcom_add_sysmon_subdev(struct rproc 
> *rproc,
>  							 const char *name,
> @@ -62,6 +63,11 @@ static inline struct qcom_sysmon
> *qcom_add_sysmon_subdev(struct rproc *rproc,
>  static inline void qcom_remove_sysmon_subdev(struct qcom_sysmon 
> *sysmon)
>  {
>  }
> +
> +static inline bool qcom_sysmon_shutdown_acked(struct qcom_sysmon 
> *sysmon)
> +{
> +	return false;
> +}
>  #endif
> 
>  #endif
> diff --git a/drivers/remoteproc/qcom_sysmon.c 
> b/drivers/remoteproc/qcom_sysmon.c
> index 38f63c968fa8..1c42f00010d3 100644
> --- a/drivers/remoteproc/qcom_sysmon.c
> +++ b/drivers/remoteproc/qcom_sysmon.c
> @@ -44,6 +44,7 @@ struct qcom_sysmon {
>  	struct mutex lock;
> 
>  	bool ssr_ack;
> +	bool shutdown_acked;
> 
>  	struct qmi_handle qmi;
>  	struct sockaddr_qrtr ssctl;
> @@ -115,10 +116,13 @@ static void sysmon_send_event(struct qcom_sysmon 
> *sysmon,
>  /**
>   * sysmon_request_shutdown() - request graceful shutdown of remote
>   * @sysmon:	sysmon context
> + *
> + * Return: boolean indicator of the remote processor acking the 
> request
>   */
> -static void sysmon_request_shutdown(struct qcom_sysmon *sysmon)
> +static bool sysmon_request_shutdown(struct qcom_sysmon *sysmon)
>  {
>  	char *req = "ssr:shutdown";
> +	bool acked = false;
>  	int ret;
> 
>  	mutex_lock(&sysmon->lock);
> @@ -141,9 +145,13 @@ static void sysmon_request_shutdown(struct
> qcom_sysmon *sysmon)
>  	if (!sysmon->ssr_ack)
>  		dev_err(sysmon->dev,
>  			"unexpected response to sysmon shutdown request\n");
> +	else
> +		acked = true;
> 
>  out_unlock:
>  	mutex_unlock(&sysmon->lock);
> +
> +	return acked;
>  }
> 
>  static int sysmon_callback(struct rpmsg_device *rpdev, void *data, int 
> count,
> @@ -297,14 +305,33 @@ static struct qmi_msg_handler 
> qmi_indication_handler[] = {
>  	{}
>  };
> 
> +static bool ssctl_request_shutdown_wait(struct qcom_sysmon *sysmon)
> +{
> +	int ret;
> +
> +	ret = wait_for_completion_timeout(&sysmon->shutdown_comp, 10 * HZ);
> +	if (ret)
> +		return true;
> +
> +	ret = try_wait_for_completion(&sysmon->ind_comp);
> +	if (ret)
> +		return true;
> +
> +	dev_err(sysmon->dev, "timeout waiting for shutdown ack\n");
> +	return false;
> +}
> +
>  /**
>   * ssctl_request_shutdown() - request shutdown via SSCTL QMI service
>   * @sysmon:	sysmon context
> + *
> + * Return: boolean indicator of the remote processor acking the 
> request
>   */
> -static void ssctl_request_shutdown(struct qcom_sysmon *sysmon)
> +static bool ssctl_request_shutdown(struct qcom_sysmon *sysmon)
>  {
>  	struct ssctl_shutdown_resp resp;
>  	struct qmi_txn txn;
> +	bool acked = false;
>  	int ret;
> 
>  	reinit_completion(&sysmon->ind_comp);
> @@ -312,7 +339,7 @@ static void ssctl_request_shutdown(struct
> qcom_sysmon *sysmon)
>  	ret = qmi_txn_init(&sysmon->qmi, &txn, ssctl_shutdown_resp_ei, 
> &resp);
>  	if (ret < 0) {
>  		dev_err(sysmon->dev, "failed to allocate QMI txn\n");
> -		return;
> +		return false;
>  	}
> 
>  	ret = qmi_send_request(&sysmon->qmi, &sysmon->ssctl, &txn,
> @@ -320,27 +347,23 @@ static void ssctl_request_shutdown(struct
> qcom_sysmon *sysmon)
>  	if (ret < 0) {
>  		dev_err(sysmon->dev, "failed to send shutdown request\n");
>  		qmi_txn_cancel(&txn);
> -		return;
> +		return false;
>  	}
> 
>  	ret = qmi_txn_wait(&txn, 5 * HZ);
> -	if (ret < 0)
> +	if (ret < 0) {
>  		dev_err(sysmon->dev, "failed receiving QMI response\n");
> -	else if (resp.resp.result)
> +	} else if (resp.resp.result) {
>  		dev_err(sysmon->dev, "shutdown request failed\n");
> -	else
> +	} else {
>  		dev_dbg(sysmon->dev, "shutdown request completed\n");
> -
> -	if (sysmon->shutdown_irq > 0) {
> -		ret = wait_for_completion_timeout(&sysmon->shutdown_comp,
> -						  10 * HZ);
> -		if (!ret) {
> -			ret = try_wait_for_completion(&sysmon->ind_comp);
> -			if (!ret)
> -				dev_err(sysmon->dev,
> -					"timeout waiting for shutdown ack\n");
> -		}
> +		acked = true;
>  	}
> +
> +	if (sysmon->shutdown_irq > 0)
> +		return ssctl_request_shutdown_wait(sysmon);
> +
> +	return acked;
>  }
> 
>  /**
> @@ -508,6 +531,9 @@ static void sysmon_stop(struct rproc_subdev
> *subdev, bool crashed)
>  		.subsys_name = sysmon->name,
>  		.ssr_event = SSCTL_SSR_EVENT_BEFORE_SHUTDOWN
>  	};
> +	bool acked;
> +
> +	sysmon->shutdown_acked = false;
> 
>  	mutex_lock(&sysmon->state_lock);
>  	sysmon->state = SSCTL_SSR_EVENT_BEFORE_SHUTDOWN;
> @@ -519,9 +545,11 @@ static void sysmon_stop(struct rproc_subdev
> *subdev, bool crashed)
>  		return;
> 
>  	if (sysmon->ssctl_version)
> -		ssctl_request_shutdown(sysmon);
> +		acked = ssctl_request_shutdown(sysmon);
>  	else if (sysmon->ept)
> -		sysmon_request_shutdown(sysmon);
> +		acked = sysmon_request_shutdown(sysmon);
> +
> +	sysmon->shutdown_acked = acked;
>  }
> 
>  static void sysmon_unprepare(struct rproc_subdev *subdev)
> @@ -679,6 +707,22 @@ void qcom_remove_sysmon_subdev(struct qcom_sysmon 
> *sysmon)
>  }
>  EXPORT_SYMBOL_GPL(qcom_remove_sysmon_subdev);
> 
> +/**
> + * qcom_sysmon_shutdown_acked() - query the success of the last 
> shutdown
> + * @sysmon:	sysmon context
> + *
> + * When sysmon is used to request a graceful shutdown of the remote 
> processor
> + * this can be used by the remoteproc driver to query the success, in 
> order to
> + * know if it should fall back to other means of requesting a 
> shutdown.
> + *
> + * Return: boolean indicator of the success of the last shutdown 
> request
> + */
> +bool qcom_sysmon_shutdown_acked(struct qcom_sysmon *sysmon)
> +{
> +	return sysmon && sysmon->shutdown_acked;
> +}
> +EXPORT_SYMBOL_GPL(qcom_sysmon_shutdown_acked);
> +
>  /**
>   * sysmon_probe() - probe sys_mon channel
>   * @rpdev:	rpmsg device handle

Reviewed-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
