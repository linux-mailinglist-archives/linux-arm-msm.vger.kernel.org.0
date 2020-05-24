Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A77801DFE06
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2020 11:47:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728766AbgEXJqE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 May 2020 05:46:04 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:22182 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728825AbgEXJqD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 May 2020 05:46:03 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590313562; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=rtPQNEuxTE+qtpvH3PG/YKnXwSbJX2CZrUtuoTcZOXY=; b=u7FFcQhbzJF9AXbDRXdrOr6sJXqfUfyYUOeIFJHCOsmpfVuoUBp73nKKV2k8jhwuY183KOqc
 wFOPjgzwkh7sycihzQfZcxnZOxPCbpHqgV1mlX4sMWW7kxU/1omIbjJAgVnMtMoKv6NLrTvU
 3pi/iA1zu9g4ESO3CJHHAEZ/h4w=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eca4253.7f032d442dc0-smtp-out-n03;
 Sun, 24 May 2020 09:45:55 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 94981C433C9; Sun, 24 May 2020 09:45:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.104] (unknown [49.207.133.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sivaprak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4DE7DC433C6;
        Sun, 24 May 2020 09:45:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4DE7DC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sivaprak@codeaurora.org
Subject: Re: [PATCH V4 7/8] mailbox: qcom: Add ipq6018 apcs compatible
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1588573224-3038-1-git-send-email-sivaprak@codeaurora.org>
 <1588573224-3038-8-git-send-email-sivaprak@codeaurora.org>
 <20200512201931.GJ2165@builder.lan>
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
Message-ID: <32f33ed2-7c00-3967-e34b-424c5906a91b@codeaurora.org>
Date:   Sun, 24 May 2020 15:15:47 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200512201931.GJ2165@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On 5/13/2020 1:49 AM, Bjorn Andersson wrote:
> On Sun 03 May 23:20 PDT 2020, Sivaprakash Murugesan wrote:
>
>> The Qualcomm ipq6018 has apcs block, add compatible for the same.
>> Also, the apcs provides a clock controller functionality similar
>> to msm8916 but the clock driver is different.
>>
>> Create a child platform device based on the apcs compatible for the
>> clock controller functionality.
>>
>> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
>> ---
>>   drivers/mailbox/qcom-apcs-ipc-mailbox.c | 26 +++++++++++++++++---------
>>   1 file changed, 17 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
>> index eeebafd..7c0c4b0 100644
>> --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
>> +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
>> @@ -45,6 +45,16 @@ static const struct mbox_chan_ops qcom_apcs_ipc_ops = {
>>   	.send_data = qcom_apcs_ipc_send_data,
>>   };
>>   
>> +static const struct of_device_id apcs_clk_match_table[] = {
>> +	{ .compatible = "qcom,msm8916-apcs-kpss-global",
>> +	  .data = "qcom-apcs-msm8916-clk", },
> These are easier to read if you ignore the 80-char limit.
> Unless Jassi's object that is.
since Jassi has not objected your comment, I am making the change as per 
your suggestion.
>
>> +	{ .compatible = "qcom,qcs404-apcs-apps-global",
>> +	  .data = "qcom-apcs-msm8916-clk", },
>> +	{ .compatible = "qcom,ipq6018-apcs-apps-global",
> Add your entry on top, to maintain sort order.
ok.
>
>> +	  .data = "qcom,apss-ipq-clk", },
>> +	{}
>> +};
>> +
>>   static int qcom_apcs_ipc_probe(struct platform_device *pdev)
>>   {
>>   	struct qcom_apcs_ipc *apcs;
>> @@ -54,11 +64,7 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
>>   	void __iomem *base;
>>   	unsigned long i;
>>   	int ret;
>> -	const struct of_device_id apcs_clk_match_table[] = {
>> -		{ .compatible = "qcom,msm8916-apcs-kpss-global", },
>> -		{ .compatible = "qcom,qcs404-apcs-apps-global", },
>> -		{}
>> -	};
>> +	const struct of_device_id *clk_device;
>>   
>>   	apcs = devm_kzalloc(&pdev->dev, sizeof(*apcs), GFP_KERNEL);
>>   	if (!apcs)
>> @@ -93,11 +99,12 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
>>   		return ret;
>>   	}
>>   
>> -	if (of_match_device(apcs_clk_match_table, &pdev->dev)) {
>> +	clk_device = of_match_device(apcs_clk_match_table, &pdev->dev);
> Better use of_device_match_data() and get the string directly (or NULL).

As I checked there is no API called of_device_match_data(), the API 
of_device_get_match_data()

returns the data associated with the device and it cannot be used here.

please correct me if wrong.

>
>> +	if (clk_device) {
>>   		apcs->clk = platform_device_register_data(&pdev->dev,
>> -							  "qcom-apcs-msm8916-clk",
>> -							  PLATFORM_DEVID_NONE,
>> -							  NULL, 0);
>> +						(const char *)clk_device->data,
>> +						PLATFORM_DEVID_NONE,
>> +						NULL, 0);
> I didn't apply the patch to look for myself, but please ensure to
> maintain indentation to follow the parenthesis on the line before.
ok.
>
>>   		if (IS_ERR(apcs->clk))
>>   			dev_err(&pdev->dev, "failed to register APCS clk\n");
>>   	}
>> @@ -127,6 +134,7 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
>>   	{ .compatible = "qcom,sdm845-apss-shared", .data = (void *)12 },
>>   	{ .compatible = "qcom,sm8150-apss-shared", .data = (void *)12 },
>>   	{ .compatible = "qcom,ipq8074-apcs-apps-global", .data = (void *)8 },
>> +	{ .compatible = "qcom,ipq6018-apcs-apps-global", .data = (void *)8 },
> Add it one line up and you'll maintain partial sorting...
ok.
