Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D77913B8929
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jun 2021 21:31:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233675AbhF3Te0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Jun 2021 15:34:26 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:38839 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233681AbhF3TeZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Jun 2021 15:34:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1625081516; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=0SXU6AvU5sB2MZGk7w9XTvpdFJk9l/OjBx5DRCacHS0=;
 b=UxdKaTWwIsFjV34TF/CoGGuS3ZQhN0WS5ODZk728xUlp7zWBlQ5ObWIzk4PF923KnDMYpMZS
 +HHa+KmCkU/VoDbeYFveoFghO1YdqnlDyMzlOSEsYc/3OZ1NeO8+DV9bZ1XTUXOrhVmVHKS5
 7yG86CssJXNy5eFwUDr0ioDME+8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60dcc6904ca9face34f35406 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 30 Jun 2021 19:31:28
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 27FC5C4360C; Wed, 30 Jun 2021 19:31:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B1B0CC433F1;
        Wed, 30 Jun 2021 19:31:25 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 01 Jul 2021 01:01:25 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org,
        swboyd@chromium.org, ulf.hansson@linaro.org, rjw@rjwysocki.net,
        agross@kernel.org, ohad@wizery.com, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org
Subject: Re: [PATCH v3 04/13] remoteproc: qcom: q6v5: Use qmp_send to update
 co-processor load state
In-Reply-To: <YNZGls1wHbWgsEO5@google.com>
References: <1624560727-6870-1-git-send-email-sibis@codeaurora.org>
 <1624560727-6870-5-git-send-email-sibis@codeaurora.org>
 <YNZGls1wHbWgsEO5@google.com>
Message-ID: <82de11c77b8b46dcdfec4a2d2569ac95@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Matthias,
Thanks for taking time to review the series.

On 2021-06-26 02:41, Matthias Kaehlcke wrote:
> On Fri, Jun 25, 2021 at 12:21:58AM +0530, Sibi Sankar wrote:
>> The power domains exposed by the AOSS QMP driver control the load 
>> state
>> resources linked to modem, adsp, cdsp remoteprocs. These are used to
>> notify the Always on Subsystem (AOSS) that a particular co-processor 
>> is
>> up/down. AOSS uses this information to wait for the co-processors to
>> suspend before starting its sleep sequence.
>> 
>> These co-processors enter low-power modes independent to that of the
>> application processor and the load state resources linked to them are
>> expected to remain unaltered across system suspend/resume cycles. To
>> achieve this behavior lets stop using the power-domains exposed by the
>> AOSS QMP node and replace them with generic qmp_send interface 
>> instead.
>> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>>  drivers/remoteproc/qcom_q6v5.c      | 56 +++++++++++++++++++++++++-
>>  drivers/remoteproc/qcom_q6v5.h      |  7 +++-
>>  drivers/remoteproc/qcom_q6v5_adsp.c |  7 +++-
>>  drivers/remoteproc/qcom_q6v5_mss.c  | 44 ++++----------------
>>  drivers/remoteproc/qcom_q6v5_pas.c  | 80 
>> +++++++++----------------------------
>>  drivers/remoteproc/qcom_q6v5_wcss.c |  4 +-
>>  6 files changed, 94 insertions(+), 104 deletions(-)
>> 
>> diff --git a/drivers/remoteproc/qcom_q6v5.c 
>> b/drivers/remoteproc/qcom_q6v5.c
>> index 9627a950928e..4a9a481c211b 100644
>> --- a/drivers/remoteproc/qcom_q6v5.c
>> +++ b/drivers/remoteproc/qcom_q6v5.c
>> @@ -16,8 +16,28 @@
>>  #include "qcom_common.h"
>>  #include "qcom_q6v5.h"
>> 
>> +#define Q6V5_LOAD_STATE_MSG_LEN	64
>>  #define Q6V5_PANIC_DELAY_MS	200
>> 
>> +static int q6v5_load_state_toggle(struct qcom_q6v5 *q6v5, bool 
>> enable)
>> +{
>> +	char buf[Q6V5_LOAD_STATE_MSG_LEN] = {};
>> +	int ret;
>> +
>> +	if (IS_ERR(q6v5->qmp))
>> +		return 0;
>> +
>> +	snprintf(buf, sizeof(buf),
>> +		 "{class: image, res: load_state, name: %s, val: %s}",
>> +		 q6v5->load_state, enable ? "on" : "off");
>> +
>> +	ret = qmp_send(q6v5->qmp, buf, sizeof(buf));
>> +	if (ret)
>> +		dev_err(q6v5->dev, "failed to toggle load state\n");
>> +
>> +	return ret;
>> +}
>> +
>>  /**
>>   * qcom_q6v5_prepare() - reinitialize the qcom_q6v5 context before 
>> start
>>   * @q6v5:	reference to qcom_q6v5 context to be reinitialized
>> @@ -26,6 +46,12 @@
>>   */
>>  int qcom_q6v5_prepare(struct qcom_q6v5 *q6v5)
>>  {
>> +	int ret;
>> +
>> +	ret = q6v5_load_state_toggle(q6v5, true);
>> +	if (ret)
>> +		return ret;
>> +
>>  	reinit_completion(&q6v5->start_done);
>>  	reinit_completion(&q6v5->stop_done);
>> 
>> @@ -47,6 +73,7 @@ EXPORT_SYMBOL_GPL(qcom_q6v5_prepare);
>>  int qcom_q6v5_unprepare(struct qcom_q6v5 *q6v5)
>>  {
>>  	disable_irq(q6v5->handover_irq);
>> +	q6v5_load_state_toggle(q6v5, false);
>> 
>>  	return !q6v5->handover_issued;
>>  }
>> @@ -196,12 +223,13 @@ EXPORT_SYMBOL_GPL(qcom_q6v5_panic);
>>   * @pdev:	platform_device reference for acquiring resources
>>   * @rproc:	associated remoteproc instance
>>   * @crash_reason: SMEM id for crash reason string, or 0 if none
>> + * @load_state: load state resource string
>>   * @handover:	function to be called when proxy resources should be 
>> released
>>   *
>>   * Return: 0 on success, negative errno on failure
>>   */
>>  int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device 
>> *pdev,
>> -		   struct rproc *rproc, int crash_reason,
>> +		   struct rproc *rproc, int crash_reason, const char *load_state,
>>  		   void (*handover)(struct qcom_q6v5 *q6v5))
>>  {
>>  	int ret;
>> @@ -210,6 +238,7 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct 
>> platform_device *pdev,
>>  	q6v5->dev = &pdev->dev;
>>  	q6v5->crash_reason = crash_reason;
>>  	q6v5->handover = handover;
>> +	q6v5->load_state = kstrdup_const(load_state, GFP_KERNEL);
>> 
>>  	init_completion(&q6v5->start_done);
>>  	init_completion(&q6v5->stop_done);
>> @@ -286,9 +315,34 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct 
>> platform_device *pdev,
>>  		return PTR_ERR(q6v5->state);
>>  	}
>> 
>> +	q6v5->qmp = qmp_get(&pdev->dev);
>> +	if (IS_ERR(q6v5->qmp)) {
>> +		if (PTR_ERR(q6v5->qmp) != -ENODEV) {
>> +			if (PTR_ERR(q6v5->qmp) != -EPROBE_DEFER)
>> +				dev_err(&pdev->dev, "failed to acquire load state\n");
>> +			return PTR_ERR(q6v5->qmp);
>> +		}
>> +	} else {
>> +		if (!q6v5->load_state) {
>> +			dev_err(&pdev->dev, "load state resource string empty\n");
>> +			return -EINVAL;
>> +		}
>> +	}
>> +
>>  	return 0;
>>  }
>>  EXPORT_SYMBOL_GPL(qcom_q6v5_init);
>> 
>> +/**
>> + * qcom_q6v5_deinit() - deinitialize the q6v5 common struct
>> + * @q6v5:	reference to qcom_q6v5 context to be deinitialized
>> + * @pdev:	platform_device reference for acquiring resources
>> + */
>> +void qcom_q6v5_deinit(struct qcom_q6v5 *q6v5, struct platform_device 
>> *pdev)
>> +{
> 
> pdev isn't used, remove it?

thanks for catching this. It was an
artefact of the recent qmp api changes.

> 
> 	kfree_const(q6v5->load_state);
> 
>> +	qmp_put(q6v5->qmp);
>> +}
>> +EXPORT_SYMBOL_GPL(qcom_q6v5_deinit);
>> +
>>  MODULE_LICENSE("GPL v2");
>>  MODULE_DESCRIPTION("Qualcomm Peripheral Image Loader for Q6V5");
>> diff --git a/drivers/remoteproc/qcom_q6v5.h 
>> b/drivers/remoteproc/qcom_q6v5.h
>> index 1c212f670cbc..3d9f525cb4ec 100644
>> --- a/drivers/remoteproc/qcom_q6v5.h
>> +++ b/drivers/remoteproc/qcom_q6v5.h
>> @@ -5,6 +5,7 @@
>> 
>>  #include <linux/kernel.h>
>>  #include <linux/completion.h>
>> +#include <linux/soc/qcom/qcom_aoss.h>
>> 
>>  struct rproc;
>>  struct qcom_smem_state;
>> @@ -15,6 +16,8 @@ struct qcom_q6v5 {
>>  	struct rproc *rproc;
>> 
>>  	struct qcom_smem_state *state;
>> +	struct qmp *qmp;
>> +
>>  	unsigned stop_bit;
>> 
>>  	int wdog_irq;
>> @@ -32,12 +35,14 @@ struct qcom_q6v5 {
>> 
>>  	bool running;
>> 
>> +	const char *load_state;
>>  	void (*handover)(struct qcom_q6v5 *q6v5);
>>  };
>> 
>>  int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device 
>> *pdev,
>> -		   struct rproc *rproc, int crash_reason,
>> +		   struct rproc *rproc, int crash_reason, const char *load_state,
>>  		   void (*handover)(struct qcom_q6v5 *q6v5));
>> +void qcom_q6v5_deinit(struct qcom_q6v5 *q6v5, struct platform_device 
>> *pdev);
>> 
>>  int qcom_q6v5_prepare(struct qcom_q6v5 *q6v5);
>>  int qcom_q6v5_unprepare(struct qcom_q6v5 *q6v5);
>> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c 
>> b/drivers/remoteproc/qcom_q6v5_adsp.c
>> index 8b0d8bbacd2e..0f5e0fd216b4 100644
>> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
>> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
>> @@ -185,7 +185,9 @@ static int adsp_start(struct rproc *rproc)
>>  	int ret;
>>  	unsigned int val;
>> 
>> -	qcom_q6v5_prepare(&adsp->q6v5);
>> +	ret = qcom_q6v5_prepare(&adsp->q6v5);
>> +	if (ret)
>> +		return ret;
>> 
>>  	ret = clk_prepare_enable(adsp->xo);
>>  	if (ret)
>> @@ -465,7 +467,7 @@ static int adsp_probe(struct platform_device 
>> *pdev)
>>  	if (ret)
>>  		goto disable_pm;
>> 
>> -	ret = qcom_q6v5_init(&adsp->q6v5, pdev, rproc, 
>> desc->crash_reason_smem,
>> +	ret = qcom_q6v5_init(&adsp->q6v5, pdev, rproc, 
>> desc->crash_reason_smem, NULL,
>>  			     qcom_adsp_pil_handover);
> 
> Doesn't passing a load_state of NULL cause qcom_q6v5_init() to fail
> with -EINVAL?

qmp_get is expected to error out with
-ENODEV since we don't mention a qmp
node in dt. When a client needs to use
qmp in the future we would replace NULL
with the proper load_state string value.

> 
>> --- a/drivers/remoteproc/qcom_q6v5_wcss.c
>> +++ b/drivers/remoteproc/qcom_q6v5_wcss.c
>> @@ -1044,8 +1044,7 @@ static int q6v5_wcss_probe(struct 
>> platform_device *pdev)
>>  	if (ret)
>>  		goto free_rproc;
>> 
>> -	ret = qcom_q6v5_init(&wcss->q6v5, pdev, rproc, 
>> desc->crash_reason_smem,
>> -			     NULL);
>> +	ret = qcom_q6v5_init(&wcss->q6v5, pdev, rproc, 
>> desc->crash_reason_smem, NULL, NULL);
> 
> Same as for adsp_probe(), doesn't a load_state of NULL cause _init() to 
> fail?

it won't for the same reason explained
above.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
