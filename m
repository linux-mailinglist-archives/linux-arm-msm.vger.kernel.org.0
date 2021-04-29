Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F6EB36E52C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Apr 2021 08:55:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237080AbhD2G4M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Apr 2021 02:56:12 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:40971 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233767AbhD2G4L (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Apr 2021 02:56:11 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619679323; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=i6nhprnTP7+B3o9IhSRHaKC/LVUmcR5lx3xKcdEqRdI=; b=rxX0ULKilDLXfcY+s0l/4VqeaQrj3KD73GeEt2svXlEqwzZjlxLVuSlimhY4p2E5eNGeYEXJ
 moOUN6Hp1bCod0TUKzUPjVGdGx4AALWFS/OPTGRNN6URoL7b6RGdlYybxb2Z0Puel6b+vJbT
 UQTWKq820xfIxAwBScRWdZ9HEIU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 608a585a853c0a2c469bab89 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 29 Apr 2021 06:55:22
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0FEA9C433F1; Thu, 29 Apr 2021 06:55:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.0.103] (unknown [49.204.182.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BD9C3C433F1;
        Thu, 29 Apr 2021 06:55:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BD9C3C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v3] Add support for duty-cycle for RCG
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1619334502-9880-1-git-send-email-tdas@codeaurora.org>
 <161956919717.177949.9925740807826300314@swboyd.mtv.corp.google.com>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <ed64fe46-361b-5bf9-88a6-d35cac2c98e7@codeaurora.org>
Date:   Thu, 29 Apr 2021 12:25:16 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <161956919717.177949.9925740807826300314@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thank you for your review.

On 4/28/2021 5:49 AM, Stephen Boyd wrote:
> Quoting Taniya Das (2021-04-25 00:08:21)
>> The root clock generators with MND divider has the capability to support
>> change in duty-cycle by updating the 'D'. Add the clock ops which would
>> check all the boundary conditions and enable setting the desired duty-cycle
>> as per the consumer.
>>
>> [v3]
>>    * Implement clockops for get_duty_cycle.
>>    * Return -EINVAL for Non-MND or HID RCGs.
> 
> We don't need cover letters for single patches. Please add these details
> after the dash before the diffstat on the single patch.
> 

Sure Stephen, will take care from next time. Let me know in case I need 
to re-submit the patch again.

>>
>> Taniya Das (1):
>>    clk: qcom: clk-rcg2: Add support for duty-cycle for RCG
>>
>>   drivers/clk/qcom/clk-rcg2.c | 81 +++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 81 insertions(+)
>>
>> --
>> Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
>> of the Code Aurora Forum, hosted by the  Linux Foundation.
>>

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
