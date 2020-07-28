Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61C06230804
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jul 2020 12:45:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728699AbgG1Kpr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jul 2020 06:45:47 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:39885 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728566AbgG1Kpr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jul 2020 06:45:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595933146; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=UwYBC8FIK6Ao+d1NkDjZjS8SDHzIo5U4cf8VMIHtRHo=;
 b=nlmrHJHYgtRiCnCteFjByTT03e1GxQO/NlD0VQqiP06+iXDZmcswBPhlwocFGBt2TlG5Y9q0
 riyiP/EQHyUCTg26IMTDHgue8F20nhSa/9a7KYbb5Vm6awcZ+6Aibi60ZrmVCY8o8x1eZPnB
 kpHWEbx9263LK8EiJqrZm1Q1u/I=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n16.prod.us-east-1.postgun.com with SMTP id
 5f2001d8fcbecb3df18e8da4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Jul 2020 10:45:44
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E55F4C4339C; Tue, 28 Jul 2020 10:45:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: gokulsri)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 05D62C433CA;
        Tue, 28 Jul 2020 10:45:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 28 Jul 2020 16:15:42 +0530
From:   gokulsri@codeaurora.org
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        agross@kernel.org, linux-soc@vger.kernel.org,
        devicetree@vger.kernel.org, govinds@codeaurora.org,
        sricharan@codeaurora.org
Subject: Re: [v7 1/4] remoteproc: qcom: wcss: populate hardcoded param using
 driver data
In-Reply-To: <159442464252.1987609.9113647358389820731@swboyd.mtv.corp.google.com>
References: <20190726092332.25202-1-govinds@codeaurora.org>
 <1593766722-28838-1-git-send-email-gokulsri@codeaurora.org>
 <1593766722-28838-2-git-send-email-gokulsri@codeaurora.org>
 <159442464252.1987609.9113647358389820731@swboyd.mtv.corp.google.com>
Message-ID: <2cf8aa0af13a104a8e4171ebcb0a6e62@codeaurora.org>
X-Sender: gokulsri@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

   Thanks for your comments Stephen.
   Will address your comments below and re-submit.
On 2020-07-11 05:14, Stephen Boyd wrote:
> Quoting Gokul Sriram Palanisamy (2020-07-03 01:58:39)
>> From: Govind Singh <govinds@codeaurora.org>
>> 
>> Q6 based WiFi fw loading is supported across
>> different targets, ex: IPQ8074/QCS404. In order to
>> support different fw names/pas id etc, populate
>> hardcoded param using driver data.
>> 
>> Signed-off-by: Govind Singh <govinds@codeaurora.org>
>> [rebased on top of 5.8-rc3]
> 
> This tag is not really useful and doesn't follow the style of having
> your email prefix the text. I'd expect to see
> 
> [gokulsri@codeaurora.org: made some sort of change]
> 
>> Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
>> ---
>>  drivers/remoteproc/qcom_q6v5_wcss.c | 31 
>> ++++++++++++++++++++++++++-----
>>  1 file changed, 26 insertions(+), 5 deletions(-)
>> 
>> diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c 
>> b/drivers/remoteproc/qcom_q6v5_wcss.c
>> index 88c76b9..abc5f9d 100644
>> --- a/drivers/remoteproc/qcom_q6v5_wcss.c
>> +++ b/drivers/remoteproc/qcom_q6v5_wcss.c
>> @@ -70,6 +71,11 @@
>>  #define TCSR_WCSS_CLK_MASK     0x1F
>>  #define TCSR_WCSS_CLK_ENABLE   0x14
>> 
>> +struct wcss_data {
>> +       const char *firmware_name;
>> +       int crash_reason_smem;
> 
> Is it signed for some reason?
   Can be unsigned. Will update.
> 
>> +};
>> +
>>  struct q6v5_wcss {
>>         struct device *dev;
>> 
>> @@ -92,6 +98,8 @@ struct q6v5_wcss {
>>         void *mem_region;
>>         size_t mem_size;
>> 
>> +       int crash_reason_smem;
>> +
> 
> Same question, why not unsigned?
   Can be unsigned. Will update.
> 
>>         struct qcom_rproc_glink glink_subdev;
>>         struct qcom_rproc_ssr ssr_subdev;
>>  };
>> @@ -430,7 +438,7 @@ static int q6v5_wcss_load(struct rproc *rproc, 
>> const struct firmware *fw)
>>                                      wcss->mem_size, 
>> &wcss->mem_reloc);
>>  }
>> 
>> -static const struct rproc_ops q6v5_wcss_ops = {
>> +static const struct rproc_ops q6v5_wcss_ipq8074_ops = {
>>         .start = q6v5_wcss_start,
>>         .stop = q6v5_wcss_stop,
>>         .da_to_va = q6v5_wcss_da_to_va,
>> @@ -530,12 +538,17 @@ static int q6v5_alloc_memory_region(struct 
>> q6v5_wcss *wcss)
>> 
>>  static int q6v5_wcss_probe(struct platform_device *pdev)
>>  {
>> +       const struct wcss_data *desc;
>>         struct q6v5_wcss *wcss;
>>         struct rproc *rproc;
>>         int ret;
>> 
>> -       rproc = rproc_alloc(&pdev->dev, pdev->name, &q6v5_wcss_ops,
>> -                           "IPQ8074/q6_fw.mdt", sizeof(*wcss));
>> +       desc = of_device_get_match_data(&pdev->dev);
> 
> Use device_get_match_data() and drop the of_device.h include.
   ok, will do.
> 
>> +       if (!desc)
>> +               return -EINVAL;
>> +
>> +       rproc = rproc_alloc(&pdev->dev, pdev->name, 
>> &q6v5_wcss_ipq8074_ops,
>> +                           desc->firmware_name, sizeof(*wcss));
>>         if (!rproc) {
>>                 dev_err(&pdev->dev, "failed to allocate rproc\n");
>>                 return -ENOMEM;
>> @@ -587,8 +602,14 @@ static int q6v5_wcss_remove(struct 
>> platform_device *pdev)
>>         return 0;
>>  }
>> 
>> +static const struct wcss_data wcss_ipq8074_res_init = {
>> +       .firmware_name = "IPQ8074/q6_fw.mdt",
>> +       .crash_reason_smem = WCSS_CRASH_REASON,
>> +};
>> +
>>  static const struct of_device_id q6v5_wcss_of_match[] = {
>> -       { .compatible = "qcom,ipq8074-wcss-pil" },
>> +       { .compatible = "qcom,ipq8074-wcss-pil", .data = 
>> &wcss_ipq8074_res_init },
>> +
> 
> Please remove this extra newline.
   ok. Will do.
> 
>>         { },
>>  };
>>  MODULE_DEVICE_TABLE(of, q6v5_wcss_of_match);
