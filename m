Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B33AB2AE53F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Nov 2020 02:03:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732052AbgKKBDc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Nov 2020 20:03:32 -0500
Received: from z5.mailgun.us ([104.130.96.5]:61778 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731713AbgKKBDb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Nov 2020 20:03:31 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1605056611; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=PRPWPlKvfoqup5yOYOvRoxNoeYSOWPJdVPHods/P4Tk=;
 b=M3YL6Df662g10alu5x1FkYvde5kO50P/jY1sEjgMtUP3XLtSgCkqTK1mkSQfrxmmGKUnL1ZR
 8LzEsxC7NbE1przyPIWoRe8uJrpqQILEPR6P38INFfbTQHZg3JGfjPchIpjD/j+Iogb4Mf5A
 cn1chS1xe50B+/huJa/WOWPpzPA=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5fab38628bd2e3c222410748 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 11 Nov 2020 01:03:30
 GMT
Sender: rishabhb=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E1182C433C6; Wed, 11 Nov 2020 01:03:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rishabhb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7F5D6C433C8;
        Wed, 11 Nov 2020 01:03:27 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 10 Nov 2020 17:03:27 -0800
From:   rishabhb@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Siddharth Gupta <sidgup@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] remoteproc: qcom: q6v5: Query sysmon before
 graceful shutdown
In-Reply-To: <20201105045051.1365780-4-bjorn.andersson@linaro.org>
References: <20201105045051.1365780-1-bjorn.andersson@linaro.org>
 <20201105045051.1365780-4-bjorn.andersson@linaro.org>
Message-ID: <9b917882cc9191bbfadc69dbcb067f6b@codeaurora.org>
X-Sender: rishabhb@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-11-04 20:50, Bjorn Andersson wrote:
> Requesting a graceful shutdown through the shared memory state signals
> will not be acked in the event that sysmon has already successfully 
> shut
> down the remote firmware. So extend the stop request API to optinally
optionally
> take the remoteproc's sysmon instance and query if there's already been
> a successful shutdown attempt, before doing the signal dance.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v1:
> - New patch
> 
>  drivers/remoteproc/qcom_q6v5.c      | 8 +++++++-
>  drivers/remoteproc/qcom_q6v5.h      | 3 ++-
>  drivers/remoteproc/qcom_q6v5_adsp.c | 2 +-
>  drivers/remoteproc/qcom_q6v5_mss.c  | 2 +-
>  drivers/remoteproc/qcom_q6v5_pas.c  | 2 +-
>  drivers/remoteproc/qcom_q6v5_wcss.c | 2 +-
>  6 files changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5.c 
> b/drivers/remoteproc/qcom_q6v5.c
> index fd6fd36268d9..9627a950928e 100644
> --- a/drivers/remoteproc/qcom_q6v5.c
> +++ b/drivers/remoteproc/qcom_q6v5.c
> @@ -13,6 +13,7 @@
>  #include <linux/soc/qcom/smem.h>
>  #include <linux/soc/qcom/smem_state.h>
>  #include <linux/remoteproc.h>
> +#include "qcom_common.h"
>  #include "qcom_q6v5.h"
> 
>  #define Q6V5_PANIC_DELAY_MS	200
> @@ -146,15 +147,20 @@ static irqreturn_t q6v5_stop_interrupt(int irq,
> void *data)
>  /**
>   * qcom_q6v5_request_stop() - request the remote processor to stop
>   * @q6v5:	reference to qcom_q6v5 context
> + * @sysmon:	reference to the remote's sysmon instance, or NULL
>   *
>   * Return: 0 on success, negative errno on failure
>   */
> -int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5)
> +int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5, struct qcom_sysmon 
> *sysmon)
>  {
>  	int ret;
> 
>  	q6v5->running = false;
> 
> +	/* Don't perform SMP2P dance if sysmon already shut down the remote 
> */
> +	if (qcom_sysmon_shutdown_acked(sysmon))
> +		return 0;
> +
>  	qcom_smem_state_update_bits(q6v5->state,
>  				    BIT(q6v5->stop_bit), BIT(q6v5->stop_bit));
> 
> diff --git a/drivers/remoteproc/qcom_q6v5.h 
> b/drivers/remoteproc/qcom_q6v5.h
> index c4ed887c1499..1c212f670cbc 100644
> --- a/drivers/remoteproc/qcom_q6v5.h
> +++ b/drivers/remoteproc/qcom_q6v5.h
> @@ -8,6 +8,7 @@
> 
>  struct rproc;
>  struct qcom_smem_state;
> +struct qcom_sysmon;
> 
>  struct qcom_q6v5 {
>  	struct device *dev;
> @@ -40,7 +41,7 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct
> platform_device *pdev,
> 
>  int qcom_q6v5_prepare(struct qcom_q6v5 *q6v5);
>  int qcom_q6v5_unprepare(struct qcom_q6v5 *q6v5);
> -int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5);
> +int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5, struct qcom_sysmon 
> *sysmon);
>  int qcom_q6v5_wait_for_start(struct qcom_q6v5 *q6v5, int timeout);
>  unsigned long qcom_q6v5_panic(struct qcom_q6v5 *q6v5);
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c
> b/drivers/remoteproc/qcom_q6v5_adsp.c
> index efb2c1aa80a3..9db0380236e7 100644
> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> @@ -264,7 +264,7 @@ static int adsp_stop(struct rproc *rproc)
>  	int handover;
>  	int ret;
> 
> -	ret = qcom_q6v5_request_stop(&adsp->q6v5);
> +	ret = qcom_q6v5_request_stop(&adsp->q6v5, adsp->sysmon);
>  	if (ret == -ETIMEDOUT)
>  		dev_err(adsp->dev, "timed out on wait\n");
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c
> b/drivers/remoteproc/qcom_q6v5_mss.c
> index 9a473cfef758..501764934014 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -1370,7 +1370,7 @@ static int q6v5_stop(struct rproc *rproc)
>  	struct q6v5 *qproc = (struct q6v5 *)rproc->priv;
>  	int ret;
> 
> -	ret = qcom_q6v5_request_stop(&qproc->q6v5);
> +	ret = qcom_q6v5_request_stop(&qproc->q6v5, qproc->sysmon);
>  	if (ret == -ETIMEDOUT)
>  		dev_err(qproc->dev, "timed out on wait\n");
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c
> b/drivers/remoteproc/qcom_q6v5_pas.c
> index 3837f23995e0..ed1772bfa55d 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -214,7 +214,7 @@ static int adsp_stop(struct rproc *rproc)
>  	int handover;
>  	int ret;
> 
> -	ret = qcom_q6v5_request_stop(&adsp->q6v5);
> +	ret = qcom_q6v5_request_stop(&adsp->q6v5, adsp->sysmon);
>  	if (ret == -ETIMEDOUT)
>  		dev_err(adsp->dev, "timed out on wait\n");
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c
> b/drivers/remoteproc/qcom_q6v5_wcss.c
> index 8846ef0b0f1a..d6639856069b 100644
> --- a/drivers/remoteproc/qcom_q6v5_wcss.c
> +++ b/drivers/remoteproc/qcom_q6v5_wcss.c
> @@ -390,7 +390,7 @@ static int q6v5_wcss_stop(struct rproc *rproc)
>  	int ret;
> 
>  	/* WCSS powerdown */
> -	ret = qcom_q6v5_request_stop(&wcss->q6v5);
> +	ret = qcom_q6v5_request_stop(&wcss->q6v5, wcss->sysmon);
>  	if (ret == -ETIMEDOUT) {
>  		dev_err(wcss->dev, "timed out on wait\n");
>  		return ret;
Reviewed-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
