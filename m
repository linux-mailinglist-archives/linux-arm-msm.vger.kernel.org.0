Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37C6F3E4367
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Aug 2021 11:57:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233683AbhHIJ6G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Aug 2021 05:58:06 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:60990 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233500AbhHIJ6G (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Aug 2021 05:58:06 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1628503066; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Z2qKMHaBBf4V2dXurrhUXPgNh/wH4eq/5Nkqig/rsv0=; b=SQNNWEQKtRiZkof8SIm8Up/iPnnvaSdqzBnOGA1w+vx8KFh7JU97cKyVuToZjOhjCMEnrds+
 Z+yHKpv6Yv/CsRC4KCq/FXcPNM9nNwOpl/B7IZnKFEqBsISq5JU0ZqG4sBZ3cIx7pBixDuZI
 1IC6ikxXyoWLAZHgE92il1PDYHw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 6110fc0dad1af6394935be45 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 09 Aug 2021 09:57:33
 GMT
Sender: deesin=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BC4A4C433F1; Mon,  9 Aug 2021 09:57:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.1.3] (unknown [106.202.252.205])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: deesin)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6CB63C433D3;
        Mon,  9 Aug 2021 09:57:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6CB63C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=deesin@codeaurora.org
Subject: Re: [PATCH V5 1/2] soc: qcom: aoss: Expose send for generic usecase
To:     Stephen Boyd <swboyd@chromium.org>, bjorn.andersson@linaro.org,
        clew@codeaurora.org, sibis@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, Andy Gross <agross@kernel.org>
References: <1628161974-7182-1-git-send-email-deesin@codeaurora.org>
 <1628161974-7182-2-git-send-email-deesin@codeaurora.org>
 <CAE-0n50fN42fhAcoCJBz-PEW5sEdqSKT5YuaxWE_29J=P1=vQw@mail.gmail.com>
From:   Deepak Kumar Singh <deesin@codeaurora.org>
Message-ID: <4b3b6b0f-8c21-53ce-4341-1e8686d3b73c@codeaurora.org>
Date:   Mon, 9 Aug 2021 15:27:26 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAE-0n50fN42fhAcoCJBz-PEW5sEdqSKT5YuaxWE_29J=P1=vQw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 8/6/2021 12:04 AM, Stephen Boyd wrote:
> Quoting Deepak Kumar Singh (2021-08-05 04:12:53)
>> diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
>> index 934fcc4..b84cb31 100644
>> --- a/drivers/soc/qcom/qcom_aoss.c
>> +++ b/drivers/soc/qcom/qcom_aoss.c
>> @@ -515,6 +521,43 @@ static void qmp_cooling_devices_remove(struct qmp *qmp)
>>                  thermal_cooling_device_unregister(qmp->cooling_devs[i].cdev);
>>   }
>>
>> +/**
>> + * qmp_get() - get a qmp handle from a device
>> + * @dev: client device pointer
>> + *
>> + * Return: handle to qmp device on success, ERR_PTR() on failure
>> + */
>> +struct qmp *qmp_get(struct device *dev)
>> +{
>> +       struct platform_device *pdev;
>> +       struct device_node *np;
>> +       struct qmp *qmp;
>> +
>> +       if (!dev || !dev->of_node)
>> +               return ERR_PTR(-EINVAL);
>> +
>> +       np = of_parse_phandle(dev->of_node, "qcom,qmp", 0);
>> +       if (!np)
>> +               return ERR_PTR(-ENODEV);
>> +
>> +       pdev = of_find_device_by_node(np);
>> +       of_node_put(np);
>> +       if (!pdev)
>> +               return ERR_PTR(-EINVAL);
>> +
>> +       qmp = platform_get_drvdata(pdev);
>> +
>> +       return qmp ? qmp : ERR_PTR(-EPROBE_DEFER);
>> +}
>> +EXPORT_SYMBOL(qmp_get);
>> +
>> +void qmp_put(struct qmp *qmp)
>> +{
>> +       if (!IS_ERR_OR_NULL(qmp))
>> +               put_device(qmp->dev);
> Where is the corresponding get_device() call?
of_find_device_by_node() internally calls get_device(), so no need to 
call get_device() explicitly.
>
>> +}
>> +EXPORT_SYMBOL(qmp_put);
>> +
>>   static int qmp_probe(struct platform_device *pdev)
>>   {
>>          struct resource *res;
