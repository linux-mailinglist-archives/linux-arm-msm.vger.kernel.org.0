Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52A1C203377
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2020 11:33:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726952AbgFVJdm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jun 2020 05:33:42 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:13568 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726982AbgFVJdm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jun 2020 05:33:42 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592818421; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: References: Cc: To:
 Subject: From: Sender; bh=vrHaCLVrBpW0c9FNy6REcSMG1UjdnzZ5O3XMh6dAXk8=;
 b=tuM30VCUdo8nXEv7zd5KHPGJtsVB9sImh0xMSrQh1Cp0UK2rMyakKGeFAaHMoswRFo2ravtU
 d3ORAohP1+QFYXx1SRuOcrckQe5j447W/8My9u5p5H9L1vVWMtnYDhgsxDilSOlIHSdQ3H2Q
 l28837UqDxDbadiR6fgszRS1gPo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5ef07aed567385e8e785d7a5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 22 Jun 2020 09:33:33
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8968BC433C8; Mon, 22 Jun 2020 09:33:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.29.129] (unknown [49.36.71.202])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 98211C433C8;
        Mon, 22 Jun 2020 09:33:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 98211C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
Subject: Re: [PATCH] soc: qcom: rpmh: Use __fill_rpmh_msg API during
 rpmh_write()
To:     Stephen Boyd <swboyd@chromium.org>, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rnayak@codeaurora.org, ilina@codeaurora.org,
        lsrao@codeaurora.org
References: <1592486051-22256-1-git-send-email-mkshah@codeaurora.org>
 <159255500790.62212.11790974984337702896@swboyd.mtv.corp.google.com>
Message-ID: <31fe6700-b7ea-6d57-0e83-75bcfb118c08@codeaurora.org>
Date:   Mon, 22 Jun 2020 15:03:24 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <159255500790.62212.11790974984337702896@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 6/19/2020 1:53 PM, Stephen Boyd wrote:
> Quoting Maulik Shah (2020-06-18 06:14:11)
>> Use __fill_rpmh_msg API during rpmh_write(). This allows to
>> remove duplication of code in error checking, copying commands
>> and setting message state.
>>
>> Signed-off-by: Maulik Shah<mkshah@codeaurora.org>
>> ---
>>   drivers/soc/qcom/rpmh.c | 12 +++---------
>>   1 file changed, 3 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
>> index f2b5b46c..a0a0b97 100644
>> --- a/drivers/soc/qcom/rpmh.c
>> +++ b/drivers/soc/qcom/rpmh.c
>> @@ -181,8 +181,6 @@ static int __rpmh_write(const struct device *dev, enum rpmh_state state,
>>          struct cache_req *req;
>>          int i;
>>   
>> -       rpm_msg->msg.state = state;
>> -
>>          /* Cache the request in our store and link the payload */
>>          for (i = 0; i < rpm_msg->msg.num_cmds; i++) {
>>                  req = cache_rpm_request(ctrlr, state, &rpm_msg->msg.cmds[i]);
>> @@ -190,8 +188,6 @@ static int __rpmh_write(const struct device *dev, enum rpmh_state state,
>>                          return PTR_ERR(req);
>>          }
>>   
>> -       rpm_msg->msg.state = state;
>> -
>>          if (state == RPMH_ACTIVE_ONLY_STATE) {
>>                  WARN_ON(irqs_disabled());
>>                  ret = rpmh_rsc_send_data(ctrlr_to_drv(ctrlr), &rpm_msg->msg);
> Were these two hunks just nonsense assignments to rpm_msg->msg.state?

yes, using  __fill_rpmh_msg() and DEFINE_RPMH_MSG_ONSTACK takes care of 
setting this.

Thanks,
Maulik

>
>> @@ -268,11 +264,9 @@ int rpmh_write(const struct device *dev, enum rpmh_state state,
>>          DEFINE_RPMH_MSG_ONSTACK(dev, state, &compl, rpm_msg);
>>          int ret;
>>   
>> -       if (!cmd || !n || n > MAX_RPMH_PAYLOAD)
>> -               return -EINVAL;
>> -
>> -       memcpy(rpm_msg.cmd, cmd, n * sizeof(*cmd));
>> -       rpm_msg.msg.num_cmds = n;
>> +       ret = __fill_rpmh_msg(&rpm_msg, state, cmd, n);
>> +       if (ret)
>> +               return ret;
> This part makes sense and is discussed in the commit text.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

