Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05CC1167975
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2020 10:33:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727036AbgBUJdI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Feb 2020 04:33:08 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:39355 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728103AbgBUJdH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Feb 2020 04:33:07 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582277586; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=YXNMIm4ZOZ9CnParaqb7qbfYy1/tzl8hkD+zHYO7eI0=; b=P6O8skGYkSnPko1d+kB4gyRIWATHQAU0HaQUDRRxiZHNN+7q1viktDxHbE2PyC2i2vjPfWeH
 ZH8FG/IN4fYbZoq3IZS/XaQmpklPYEDlnIcbe7XkxuGUtR1vq0Ia9XbbyrOV8Akfa2c0mw1k
 7ZBNrz4Km/kTFNw7TMzBmBVrdLg=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4fa3c9.7fe23163c768-smtp-out-n02;
 Fri, 21 Feb 2020 09:32:57 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D0C29C433A2; Fri, 21 Feb 2020 09:32:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.13.37] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7D745C43383;
        Fri, 21 Feb 2020 09:32:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7D745C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v5 1/7] drivers: qcom: rpmh: fix macro to accept NULL
 argument
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     swboyd@chromium.org, evgreen@chromium.org,
        bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, rnayak@codeaurora.org, ilina@codeaurora.org,
        lsrao@codeaurora.org
References: <1582108810-21263-1-git-send-email-mkshah@codeaurora.org>
 <1582108810-21263-2-git-send-email-mkshah@codeaurora.org>
 <20200220193105.GB24720@google.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <dbec4ecb-403a-3bfe-0404-9d212cdfeaab@codeaurora.org>
Date:   Fri, 21 Feb 2020 15:02:50 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200220193105.GB24720@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 2/21/2020 1:01 AM, Matthias Kaehlcke wrote:
> Hi Maulik,
>
> this patch and '[v5,2/7] drivers: qcom: rpmh: remove rpmh_flush
> export' already landed in the QCOM tree (in the branch 'drivers-for-5.7'):
>
> d5e205079c34a drivers: qcom: rpmh: remove rpmh_flush export
> aff9cc0847a58 drivers: qcom: rpmh: fix macro to accept NULL argument
>
> Please rebase your working tree and stop sending these.
>
> Thanks
>
> Matthias

Hi Matthias

Rebased and updated in v6.

Thanks,

Maulik

>
> On Wed, Feb 19, 2020 at 04:10:04PM +0530, Maulik Shah wrote:
>> Device argument matches with dev variable declared in RPMH message.
>> Compiler reports error when the argument is NULL since the argument
>> matches the name of the property. Rename dev argument to device to
>> fix this.
>>
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>> ---
>>   drivers/soc/qcom/rpmh.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
>> index 035091f..3a4579d 100644
>> --- a/drivers/soc/qcom/rpmh.c
>> +++ b/drivers/soc/qcom/rpmh.c
>> @@ -23,7 +23,7 @@
>>   
>>   #define RPMH_TIMEOUT_MS			msecs_to_jiffies(10000)
>>   
>> -#define DEFINE_RPMH_MSG_ONSTACK(dev, s, q, name)	\
>> +#define DEFINE_RPMH_MSG_ONSTACK(device, s, q, name)	\
>>   	struct rpmh_request name = {			\
>>   		.msg = {				\
>>   			.state = s,			\
>> @@ -33,7 +33,7 @@
>>   		},					\
>>   		.cmd = { { 0 } },			\
>>   		.completion = q,			\
>> -		.dev = dev,				\
>> +		.dev = device,				\
>>   		.needs_free = false,				\
>>   	}
>>   
>> -- 
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
>> of Code Aurora Forum, hosted by The Linux Foundation

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
