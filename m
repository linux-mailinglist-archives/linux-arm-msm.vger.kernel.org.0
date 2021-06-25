Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BBA93B4A06
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jun 2021 23:11:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbhFYVOQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Jun 2021 17:14:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229881AbhFYVOP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Jun 2021 17:14:15 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6DE9C061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jun 2021 14:11:52 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id d12so9182225pgd.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jun 2021 14:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mPJ7afS4gOnNtRxp5sDV9YUnbOYd8G/QI2wtyyECpQE=;
        b=EW5vfrJZS3gExTY64duiLUAnIIww4dXcwRc9TyhXd1F2bbVeuVMw9kW5qWHigI4V8/
         7njaBTHzBoRBjPGfuyTLEo5LfWqHy9oglg0qXFDu1H9mSDubxa4nYBEvf+XUsp//r/U6
         3NnXoya9fC8PUQjyVl0PX898rM6cbMCxw5HOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mPJ7afS4gOnNtRxp5sDV9YUnbOYd8G/QI2wtyyECpQE=;
        b=BNSzzRIzaYWefdIcqyobiwG+2qR62gcs+7FVDgwplB6L7WvVXDh7OP45gJ6+U3BUF2
         Jtq3KjVnA+TSXBZ5u99/kxDzO5TFZsr6pk6dVwerM3kl3GR+YzHrDpcaSJ/WC1XppNqe
         xRMCL7vTx1cYOCFw53/hIm1P6ATuXnB/S4zTlA+7iaYURoABHTiMdP1h6X7goVgEC8Bj
         zf34zR/caVVXerOy9dCmLuSr9El0l975Cv+Y+ggQ3MpZ7BUlRm17OXYac2KNAw28JgCv
         cIxHH/3kQHPSulRqnZaNcUj4S0fLlL05c6YYTU9N47LysHfLbDii5Zayj23iSBEQFN1A
         kzjw==
X-Gm-Message-State: AOAM533N5Im5D/pNl0spBFjQXk//ls8hrrCaxfBPQseW9DU9LMjaXN9i
        nlByWSKWY7hbPhOzXs5LC7WAZQ==
X-Google-Smtp-Source: ABdhPJyBMfFExcbqG00ZeTSEw5gOWA/X/lW7+HXaNlfcL9XIMVwpVJkoMpWVqC5ODq2ass26+CVwWw==
X-Received: by 2002:a62:e90f:0:b029:307:8154:9ff7 with SMTP id j15-20020a62e90f0000b029030781549ff7mr12354800pfh.79.1624655512400;
        Fri, 25 Jun 2021 14:11:52 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:cc13:a7dd:f4b5:2160])
        by smtp.gmail.com with UTF8SMTPSA id t2sm6538295pfg.73.2021.06.25.14.11.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jun 2021 14:11:51 -0700 (PDT)
Date:   Fri, 25 Jun 2021 14:11:50 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org,
        swboyd@chromium.org, ulf.hansson@linaro.org, rjw@rjwysocki.net,
        agross@kernel.org, ohad@wizery.com, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org
Subject: Re: [PATCH v3 04/13] remoteproc: qcom: q6v5: Use qmp_send to update
 co-processor load state
Message-ID: <YNZGls1wHbWgsEO5@google.com>
References: <1624560727-6870-1-git-send-email-sibis@codeaurora.org>
 <1624560727-6870-5-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1624560727-6870-5-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 25, 2021 at 12:21:58AM +0530, Sibi Sankar wrote:
> The power domains exposed by the AOSS QMP driver control the load state
> resources linked to modem, adsp, cdsp remoteprocs. These are used to
> notify the Always on Subsystem (AOSS) that a particular co-processor is
> up/down. AOSS uses this information to wait for the co-processors to
> suspend before starting its sleep sequence.
> 
> These co-processors enter low-power modes independent to that of the
> application processor and the load state resources linked to them are
> expected to remain unaltered across system suspend/resume cycles. To
> achieve this behavior lets stop using the power-domains exposed by the
> AOSS QMP node and replace them with generic qmp_send interface instead.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_q6v5.c      | 56 +++++++++++++++++++++++++-
>  drivers/remoteproc/qcom_q6v5.h      |  7 +++-
>  drivers/remoteproc/qcom_q6v5_adsp.c |  7 +++-
>  drivers/remoteproc/qcom_q6v5_mss.c  | 44 ++++----------------
>  drivers/remoteproc/qcom_q6v5_pas.c  | 80 +++++++++----------------------------
>  drivers/remoteproc/qcom_q6v5_wcss.c |  4 +-
>  6 files changed, 94 insertions(+), 104 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
> index 9627a950928e..4a9a481c211b 100644
> --- a/drivers/remoteproc/qcom_q6v5.c
> +++ b/drivers/remoteproc/qcom_q6v5.c
> @@ -16,8 +16,28 @@
>  #include "qcom_common.h"
>  #include "qcom_q6v5.h"
>  
> +#define Q6V5_LOAD_STATE_MSG_LEN	64
>  #define Q6V5_PANIC_DELAY_MS	200
>  
> +static int q6v5_load_state_toggle(struct qcom_q6v5 *q6v5, bool enable)
> +{
> +	char buf[Q6V5_LOAD_STATE_MSG_LEN] = {};
> +	int ret;
> +
> +	if (IS_ERR(q6v5->qmp))
> +		return 0;
> +
> +	snprintf(buf, sizeof(buf),
> +		 "{class: image, res: load_state, name: %s, val: %s}",
> +		 q6v5->load_state, enable ? "on" : "off");
> +
> +	ret = qmp_send(q6v5->qmp, buf, sizeof(buf));
> +	if (ret)
> +		dev_err(q6v5->dev, "failed to toggle load state\n");
> +
> +	return ret;
> +}
> +
>  /**
>   * qcom_q6v5_prepare() - reinitialize the qcom_q6v5 context before start
>   * @q6v5:	reference to qcom_q6v5 context to be reinitialized
> @@ -26,6 +46,12 @@
>   */
>  int qcom_q6v5_prepare(struct qcom_q6v5 *q6v5)
>  {
> +	int ret;
> +
> +	ret = q6v5_load_state_toggle(q6v5, true);
> +	if (ret)
> +		return ret;
> +
>  	reinit_completion(&q6v5->start_done);
>  	reinit_completion(&q6v5->stop_done);
>  
> @@ -47,6 +73,7 @@ EXPORT_SYMBOL_GPL(qcom_q6v5_prepare);
>  int qcom_q6v5_unprepare(struct qcom_q6v5 *q6v5)
>  {
>  	disable_irq(q6v5->handover_irq);
> +	q6v5_load_state_toggle(q6v5, false);
>  
>  	return !q6v5->handover_issued;
>  }
> @@ -196,12 +223,13 @@ EXPORT_SYMBOL_GPL(qcom_q6v5_panic);
>   * @pdev:	platform_device reference for acquiring resources
>   * @rproc:	associated remoteproc instance
>   * @crash_reason: SMEM id for crash reason string, or 0 if none
> + * @load_state: load state resource string
>   * @handover:	function to be called when proxy resources should be released
>   *
>   * Return: 0 on success, negative errno on failure
>   */
>  int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
> -		   struct rproc *rproc, int crash_reason,
> +		   struct rproc *rproc, int crash_reason, const char *load_state,
>  		   void (*handover)(struct qcom_q6v5 *q6v5))
>  {
>  	int ret;
> @@ -210,6 +238,7 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
>  	q6v5->dev = &pdev->dev;
>  	q6v5->crash_reason = crash_reason;
>  	q6v5->handover = handover;
> +	q6v5->load_state = kstrdup_const(load_state, GFP_KERNEL);
>  
>  	init_completion(&q6v5->start_done);
>  	init_completion(&q6v5->stop_done);
> @@ -286,9 +315,34 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
>  		return PTR_ERR(q6v5->state);
>  	}
>  
> +	q6v5->qmp = qmp_get(&pdev->dev);
> +	if (IS_ERR(q6v5->qmp)) {
> +		if (PTR_ERR(q6v5->qmp) != -ENODEV) {
> +			if (PTR_ERR(q6v5->qmp) != -EPROBE_DEFER)
> +				dev_err(&pdev->dev, "failed to acquire load state\n");
> +			return PTR_ERR(q6v5->qmp);
> +		}
> +	} else {
> +		if (!q6v5->load_state) {
> +			dev_err(&pdev->dev, "load state resource string empty\n");
> +			return -EINVAL;
> +		}
> +	}
> +
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(qcom_q6v5_init);
>  
> +/**
> + * qcom_q6v5_deinit() - deinitialize the q6v5 common struct
> + * @q6v5:	reference to qcom_q6v5 context to be deinitialized
> + * @pdev:	platform_device reference for acquiring resources
> + */
> +void qcom_q6v5_deinit(struct qcom_q6v5 *q6v5, struct platform_device *pdev)
> +{

pdev isn't used, remove it?

	kfree_const(q6v5->load_state);

> +	qmp_put(q6v5->qmp);
> +}
> +EXPORT_SYMBOL_GPL(qcom_q6v5_deinit);
> +
>  MODULE_LICENSE("GPL v2");
>  MODULE_DESCRIPTION("Qualcomm Peripheral Image Loader for Q6V5");
> diff --git a/drivers/remoteproc/qcom_q6v5.h b/drivers/remoteproc/qcom_q6v5.h
> index 1c212f670cbc..3d9f525cb4ec 100644
> --- a/drivers/remoteproc/qcom_q6v5.h
> +++ b/drivers/remoteproc/qcom_q6v5.h
> @@ -5,6 +5,7 @@
>  
>  #include <linux/kernel.h>
>  #include <linux/completion.h>
> +#include <linux/soc/qcom/qcom_aoss.h>
>  
>  struct rproc;
>  struct qcom_smem_state;
> @@ -15,6 +16,8 @@ struct qcom_q6v5 {
>  	struct rproc *rproc;
>  
>  	struct qcom_smem_state *state;
> +	struct qmp *qmp;
> +
>  	unsigned stop_bit;
>  
>  	int wdog_irq;
> @@ -32,12 +35,14 @@ struct qcom_q6v5 {
>  
>  	bool running;
>  
> +	const char *load_state;
>  	void (*handover)(struct qcom_q6v5 *q6v5);
>  };
>  
>  int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
> -		   struct rproc *rproc, int crash_reason,
> +		   struct rproc *rproc, int crash_reason, const char *load_state,
>  		   void (*handover)(struct qcom_q6v5 *q6v5));
> +void qcom_q6v5_deinit(struct qcom_q6v5 *q6v5, struct platform_device *pdev);
>  
>  int qcom_q6v5_prepare(struct qcom_q6v5 *q6v5);
>  int qcom_q6v5_unprepare(struct qcom_q6v5 *q6v5);
> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
> index 8b0d8bbacd2e..0f5e0fd216b4 100644
> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> @@ -185,7 +185,9 @@ static int adsp_start(struct rproc *rproc)
>  	int ret;
>  	unsigned int val;
>  
> -	qcom_q6v5_prepare(&adsp->q6v5);
> +	ret = qcom_q6v5_prepare(&adsp->q6v5);
> +	if (ret)
> +		return ret;
>  
>  	ret = clk_prepare_enable(adsp->xo);
>  	if (ret)
> @@ -465,7 +467,7 @@ static int adsp_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto disable_pm;
>  
> -	ret = qcom_q6v5_init(&adsp->q6v5, pdev, rproc, desc->crash_reason_smem,
> +	ret = qcom_q6v5_init(&adsp->q6v5, pdev, rproc, desc->crash_reason_smem, NULL,
>  			     qcom_adsp_pil_handover);

Doesn't passing a load_state of NULL cause qcom_q6v5_init() to fail with -EINVAL?

> --- a/drivers/remoteproc/qcom_q6v5_wcss.c
> +++ b/drivers/remoteproc/qcom_q6v5_wcss.c
> @@ -1044,8 +1044,7 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto free_rproc;
>  
> -	ret = qcom_q6v5_init(&wcss->q6v5, pdev, rproc, desc->crash_reason_smem,
> -			     NULL);
> +	ret = qcom_q6v5_init(&wcss->q6v5, pdev, rproc, desc->crash_reason_smem, NULL, NULL);

Same as for adsp_probe(), doesn't a load_state of NULL cause _init() to fail?
