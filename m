Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CD7F3735CA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 May 2021 09:44:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231752AbhEEHpR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 May 2021 03:45:17 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:20669 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231709AbhEEHpQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 May 2021 03:45:16 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1620200660; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=+S5kmU6xVK0FKbVGrsxNwlTFR/UzcM5BAX9iz0qyWHI=; b=vibsq298/JnI91zfGPlFQQWMGzcEqX973e9CxOW0XPbhnS57xkm7OC6lH8RkcgKX+CIqWAq9
 9BHrqzhomQaJl2TML9NGhy3w4vnxTSqsfCHFwiorPzc61hiz2hXaHuklNTuHjJIwx3x0SfCl
 tTwa2osBWP0ICi0blEt6eNAp75o=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 60924cd48166b7eff7bc5d30 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 05 May 2021 07:44:20
 GMT
Sender: deesin=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 856C0C433F1; Wed,  5 May 2021 07:44:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.1.3] (unknown [122.163.131.242])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: deesin)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9ADAAC433D3;
        Wed,  5 May 2021 07:44:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9ADAAC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=deesin@codeaurora.org
Subject: Re: [PATCH V2 1/2] soc: qcom: aoss: Expose send for generic usecase
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Deepak Kumar Singh <deesin@qti.qualcomm.com>
Cc:     clew@codeaurora.org, sibis@codeaurora.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, Andy Gross <agross@kernel.org>
References: <1617943188-23278-1-git-send-email-deesin@qti.qualcomm.com>
 <1617943188-23278-2-git-send-email-deesin@qti.qualcomm.com>
 <YHYJVjvjUyXtrNmC@builder.lan>
From:   Deepak Kumar Singh <deesin@codeaurora.org>
Message-ID: <926738e1-6786-aa6f-5a85-784d624575c7@codeaurora.org>
Date:   Wed, 5 May 2021 13:14:07 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YHYJVjvjUyXtrNmC@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 4/14/2021 2:42 AM, Bjorn Andersson wrote:
> On Thu 08 Apr 23:39 CDT 2021, Deepak Kumar Singh wrote:
> [..]
>> +/**
>> + * qmp_get() - get a qmp handle from a device
>> + * @dev: client device pointer
>> + *
>> + * Return: handle to qmp device on success, ERR_PTR() on failure
>> + */
>> +struct qmp *qmp_get(struct device *dev)
>> +{
>> +	struct platform_device *pdev;
>> +	struct device_node *np;
>> +	struct qmp *qmp;
>> +
>> +	if (!dev || !dev->of_node)
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	np = of_parse_phandle(dev->of_node, "qcom,qmp", 0);
>> +	if (!np)
>> +		return ERR_PTR(-ENODEV);
>> +
>> +	pdev = of_find_device_by_node(np);
>> +	if (!pdev)
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	qmp = platform_get_drvdata(pdev);
>> +	return qmp ? qmp : ERR_PTR(-EPROBE_DEFER);
>> +}
>> +EXPORT_SYMBOL(qmp_get);
>> +
>> +void qmp_put(struct platform_device *pdev)
>> +{
>> +	platform_device_put(pdev);
> I was expecting that the devres allocated struct qmp would stick around
> until the struct device's release callback came. As described in my
> answer to Mani yesterday I was wrong.
>
> As such you need to make sure that struct qmp stays around until
> qmp_remove() and all qmp_put() calls has been made.
>
> I presume a reasonable way to achieve this is to not use devm to
> allocate our struct qmp, add a kref to the object. So this would have to
> be a kref_put() on that instead of the platform_device_put() I asked you
> to implement here.
>
> Sorry about that.
>
>
> The rest of the patch looks good.
>
> Regards,
> Bjorn

Hi Bjorn,

Even if we use kref_put(), would it not require platform_device_put()? 
As per my understanding of_find_device_by_node(np) will increment 
node/pdev kobj refcount which both needs to be decremented.

