Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43F1C2CE54B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Dec 2020 02:45:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726532AbgLDBo3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Dec 2020 20:44:29 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:62218 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726057AbgLDBo3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Dec 2020 20:44:29 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1607046249; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=F3o5pmC8ZGXGCmm0N748k6mnq3fawMCam/6LEvp6od4=;
 b=UCANgRuwOdGBgyO0tBcHQqBkRWQLNClOPEj4P24N5kRk5FROapYmWYpteBUy9OIRsoTuLKA7
 ZNF9vddUKzz/sps8cP9OaemsEoPLqjq8u9Zk6twRYjbxrKZQvnnYC39eGVpPcPOfmc7YpID3
 vyy0VoHYmDy56hI2FQWUpgghrDU=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-west-2.postgun.com with SMTP id
 5fc9944f08086a3dc72b3ed6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 04 Dec 2020 01:43:43
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D1FADC43463; Fri,  4 Dec 2020 01:43:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 56461C43462;
        Fri,  4 Dec 2020 01:43:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 03 Dec 2020 17:43:42 -0800
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Hemant Kumar <hemantk@codeaurora.org>
Cc:     manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
        loic.poulain@linaro.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, hemantk=codeaurora.org@codeaurora.org
Subject: Re: [PATCH v3 1/7] bus: mhi: core: Allow receiving a STOP channel
 command response
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <6668b99c-a1a7-920a-4a7e-e2cb2729baee@codeaurora.org>
References: <1606952438-15321-1-git-send-email-bbhatt@codeaurora.org>
 <1606952438-15321-2-git-send-email-bbhatt@codeaurora.org>
 <6668b99c-a1a7-920a-4a7e-e2cb2729baee@codeaurora.org>
Message-ID: <fbc578fa720b6f492d77c64efdb80e67@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-12-02 04:15 PM, Hemant Kumar wrote:
> Hi Bhaumik,
> 
> On 12/2/20 3:40 PM, Bhaumik Bhatt wrote:
>> Add support to receive the response to a STOP channel command to the
> How about saying "Add support to send the STOP channel command ?
Addressed in v4.
>> MHI bus. If a client would like to STOP a channel instead of issuing
>> a RESET to it, this would provide support for it.
>> 
>> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
>> ---
>>   drivers/bus/mhi/core/main.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>> 
>> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
>> index 702c31b..a7bb8a7 100644
>> --- a/drivers/bus/mhi/core/main.c
>> +++ b/drivers/bus/mhi/core/main.c
>> @@ -1193,6 +1193,11 @@ int mhi_send_cmd(struct mhi_controller 
>> *mhi_cntrl,
>>   		cmd_tre->dword[0] = MHI_TRE_CMD_RESET_DWORD0;
>>   		cmd_tre->dword[1] = MHI_TRE_CMD_RESET_DWORD1(chan);
>>   		break;
>> +	case MHI_CMD_STOP_CHAN:
>> +		cmd_tre->ptr = MHI_TRE_CMD_STOP_PTR;
>> +		cmd_tre->dword[0] = MHI_TRE_CMD_STOP_DWORD0;
>> +		cmd_tre->dword[1] = MHI_TRE_CMD_STOP_DWORD1(chan);
>> +		break;
>>   	case MHI_CMD_START_CHAN:
>>   		cmd_tre->ptr = MHI_TRE_CMD_START_PTR;
>>   		cmd_tre->dword[0] = MHI_TRE_CMD_START_DWORD0;
>> 
> 
> Thanks,
> Hemant

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
