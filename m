Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B792E3D1516
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jul 2021 19:27:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229959AbhGUQq6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jul 2021 12:46:58 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:15269 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230115AbhGUQq5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jul 2021 12:46:57 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626888454; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=swMqGV8m/Wr6ICPtIzEUe798ROYia+lHDqkNbchZrz0=;
 b=wJFCUrZFRIx9sn12hNPxf/dyMYFlZfYEwQ6iyGcGhdWkonbdXV+mHZDcO5A5m85DuTBn+S5u
 NK1MaGDbHjbHDUtSr1DEcHGsYHdIFbKoN649mhoMQSo5CtE6qxDSOeCWYsvAUuyYiB7dNyG5
 8GkOV7cYWziUSsU3/d2C+4LewSo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60f858fa1dd16c8788226ec1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Jul 2021 17:27:22
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4C198C4314A; Wed, 21 Jul 2021 17:27:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 52912C433F1;
        Wed, 21 Jul 2021 17:27:20 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 21 Jul 2021 22:57:20 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     bjorn.andersson@linaro.org, mka@chromium.org, robh+dt@kernel.org,
        ulf.hansson@linaro.org, rjw@rjwysocki.net, agross@kernel.org,
        ohad@wizery.com, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org
Subject: Re: [PATCH v4 04/13] remoteproc: qcom: q6v5: Use qmp_send to update
 co-processor load state
In-Reply-To: <CAE-0n518x-W8kCdtrLjw0kwsbEnLzk9OmnKara_B=et0j9+ScA@mail.gmail.com>
References: <1626755807-11865-1-git-send-email-sibis@codeaurora.org>
 <1626755807-11865-5-git-send-email-sibis@codeaurora.org>
 <CAE-0n518x-W8kCdtrLjw0kwsbEnLzk9OmnKara_B=et0j9+ScA@mail.gmail.com>
Message-ID: <a2c8d6e237e9b7f63ed1d3d4eda43ad8@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-07-21 10:56, Stephen Boyd wrote:
> Quoting Sibi Sankar (2021-07-19 21:36:38)
>> diff --git a/drivers/remoteproc/qcom_q6v5.c 
>> b/drivers/remoteproc/qcom_q6v5.c
>> index 7e9244c748da..997ff21271f7 100644
>> --- a/drivers/remoteproc/qcom_q6v5.c
>> +++ b/drivers/remoteproc/qcom_q6v5.c
>> @@ -16,8 +16,28 @@
>>  #include "qcom_common.h"
>>  #include "qcom_q6v5.h"
>> 
>> +#define Q6V5_LOAD_STATE_MSG_LEN        64
>>  #define Q6V5_PANIC_DELAY_MS    200
>> 
>> +static int q6v5_load_state_toggle(struct qcom_q6v5 *q6v5, bool 
>> enable)
>> +{
>> +       char buf[Q6V5_LOAD_STATE_MSG_LEN] = {};
> 
> Just to confirm, we want to set the whole buffer to zero before writing
> it? Sounds good to not send stack junk over to to the other side but
> maybe we could skip initializing to zero for the first part of the
> buffer that isn't used?

Sure, it makes sense to incorporate
a warn_on and memset the remainder
of the buffer after populating it.

> 
>> +       int ret;
>> +
>> +       if (IS_ERR(q6v5->qmp))
>> +               return 0;
>> +
>> +       snprintf(buf, sizeof(buf),
>> +                "{class: image, res: load_state, name: %s, val: %s}",
>> +                q6v5->load_state, enable ? "on" : "off");
> 
> Should we WARN_ON() if the message doesn't fit into the 64-bytes?
> 
>> +
>> +       ret = qmp_send(q6v5->qmp, buf, sizeof(buf));
>> +       if (ret)
>> +               dev_err(q6v5->dev, "failed to toggle load state\n");
>> +
>> +       return ret;
>> +}
>> +
>>  /**
>>   * qcom_q6v5_prepare() - reinitialize the qcom_q6v5 context before 
>> start
>>   * @q6v5:      reference to qcom_q6v5 context to be reinitialized
>> @@ -196,12 +223,13 @@ EXPORT_SYMBOL_GPL(qcom_q6v5_panic);
>>   * @pdev:      platform_device reference for acquiring resources
>>   * @rproc:     associated remoteproc instance
>>   * @crash_reason: SMEM id for crash reason string, or 0 if none
>> + * @load_state: load state resource string
>>   * @handover:  function to be called when proxy resources should be 
>> released
>>   *
>>   * Return: 0 on success, negative errno on failure
>>   */
>>  int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device 
>> *pdev,
>> -                  struct rproc *rproc, int crash_reason,
>> +                  struct rproc *rproc, int crash_reason, const char 
>> *load_state,
>>                    void (*handover)(struct qcom_q6v5 *q6v5))
>>  {
>>         int ret;
>> @@ -286,9 +314,36 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct 
>> platform_device *pdev,
>>                 return PTR_ERR(q6v5->state);
>>         }
>> 
>> +       q6v5->load_state = kstrdup_const(load_state, GFP_KERNEL);
>> +       q6v5->qmp = qmp_get(&pdev->dev);
>> +       if (IS_ERR(q6v5->qmp)) {
>> +               if (PTR_ERR(q6v5->qmp) != -ENODEV) {
>> +                       if (PTR_ERR(q6v5->qmp) != -EPROBE_DEFER)
>> +                               dev_err(&pdev->dev, "failed to acquire 
>> load state\n");
> 
> Use dev_err_probe()?

sure I'll use it.

> 
>> +                       kfree_const(q6v5->load_state);
>> +                       return PTR_ERR(q6v5->qmp);
>> +               }
>> +       } else {
>> +               if (!q6v5->load_state) {
> 
> Use else if and deindent?

lol, my bad.

> 
>> +                       dev_err(&pdev->dev, "load state resource 
>> string empty\n");
>> +                       return -EINVAL;
>> +               }
>> +       }
>> +
>>         return 0;
>>  }
>>  EXPORT_SYMBOL_GPL(qcom_q6v5_init);
>> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
