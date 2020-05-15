Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80A5C1D592F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2020 20:39:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbgEOSjw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 May 2020 14:39:52 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:23086 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726297AbgEOSjw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 May 2020 14:39:52 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589567992; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=mBPBCYFoKWdI3mEJ/ipBvucpCeB6dmeaUNTapAwv4TA=; b=F9gBoT3vYJDT2kKipcCbfGrYgP7+VzsVyM+4Hw/4T1RX3exs/ZNBCOJCu6R/DEZMxEU/detv
 5PtFXNO+Tfm/t9aPLMLfzifXOQ4JOE8hj9/oK14TyFeSQJr6G9uD2ka4zn1/VH4zfLWJ8CnH
 IRgtfsSX3xYQ4NOta6xDvSI7SmI=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ebee1f7.7f85bbbcc960-smtp-out-n04;
 Fri, 15 May 2020 18:39:51 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 12CB1C43636; Fri, 15 May 2020 18:39:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.110.50.174] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 98FECC433D2;
        Fri, 15 May 2020 18:39:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 98FECC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [RFC 3/3] dt-bindings: usb: dwc3: Add entry for tx-fifo-resize
To:     Rob Herring <robh@kernel.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, balbi@kernel.org,
        gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, jackp@codeaurora.org
References: <1588888768-25315-1-git-send-email-wcheng@codeaurora.org>
 <1588888768-25315-4-git-send-email-wcheng@codeaurora.org>
 <20200515031042.GA25107@bogus>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <10d2109d-cfb7-73d0-a186-4fa5f17feffe@codeaurora.org>
Date:   Fri, 15 May 2020 11:39:46 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200515031042.GA25107@bogus>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/14/2020 8:10 PM, Rob Herring wrote:
> On Thu, May 07, 2020 at 02:59:28PM -0700, Wesley Cheng wrote:
>> Re-introduce the comment for the tx-fifo-resize setting for the DWC3
>> controller.
> 
> Why?
> 

Hi Rob,

Initially, the reasoning behind bringing back the DTSI parameter, was to
address situations where vendors don't require the resizing logic.  I
was assuming that each vendor has their own HW configuration for the TX
FIFO size, and some may already have sufficient space to account for
their endpoint requirements.  However, if Felipe doesn't believe we need
to have a DTSI parameter for this, then we don't need to re-add this
back in.

>>
>> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
>> ---
>>  Documentation/devicetree/bindings/usb/dwc3.txt | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
>> index 9946ff9..489f5da 100644
>> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
>> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
>> @@ -105,7 +105,7 @@ Optional properties:
>>  			1-16 (DWC_usb31 programming guide section 1.2.3) to
>>  			enable periodic ESS TX threshold.
>>  
>> - - <DEPRECATED> tx-fifo-resize: determines if the FIFO *has* to be reallocated.
>> + - tx-fifo-resize: determines if the FIFO *has* to be reallocated.
>>   - snps,incr-burst-type-adjustment: Value for INCR burst type of GSBUSCFG0
>>  			register, undefined length INCR burst type enable and INCRx type.
>>  			When just one value, which means INCRX burst mode enabled. When
>> -- 
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
