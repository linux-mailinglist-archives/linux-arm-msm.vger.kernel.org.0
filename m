Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DA18198B9C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2020 07:15:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbgCaFPm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Mar 2020 01:15:42 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:38846 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725809AbgCaFPm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Mar 2020 01:15:42 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585631741; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=dA6bvcGTput8Imgq5d/DRsbXCLiTBtRU6iE8eOYQx5I=; b=vHsu6KxW7yi2d0tdNiLmczBe2AJxPevhdhhiyKipYGu/bWpZlkW4WXUpKSn3QzbvElFrK4a3
 sbh9/BvJGeNbD3V3eZH5HP2DM37objMyvcf/hkUiACY2WDri6BKibrlTZr6H2KDLyQah+B9P
 Bc4tA/w+I9nrlSuhAa+uugZ5R6Q=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e82d1f5.7f8b463fa110-smtp-out-n01;
 Tue, 31 Mar 2020 05:15:33 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 13A95C433F2; Tue, 31 Mar 2020 05:15:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.24.160] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sanm)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A93B5C433D2;
        Tue, 31 Mar 2020 05:15:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A93B5C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sanm@codeaurora.org
Subject: Re: [PATCH v6 2/4] usb: dwc3: qcom: Add interconnect support in dwc3
 driver
To:     Felipe Balbi <balbi@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
References: <1585302203-11008-1-git-send-email-sanm@codeaurora.org>
 <1585302203-11008-3-git-send-email-sanm@codeaurora.org>
 <20200329171756.GA199755@google.com> <87h7y62r28.fsf@kernel.org>
 <20200330155038.GC199755@google.com> <87zhbx1q6q.fsf@kernel.org>
From:   "Sandeep Maheswaram (Temp)" <sanm@codeaurora.org>
Message-ID: <ec7e921a-45fe-c178-cc04-2a04dd4a75f5@codeaurora.org>
Date:   Tue, 31 Mar 2020 10:45:19 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <87zhbx1q6q.fsf@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 3/31/2020 3:05 AM, Felipe Balbi wrote:
> Hi,
>
> Matthias Kaehlcke <mka@chromium.org> writes:
>>> Matthias Kaehlcke <mka@chromium.org> writes:
>>>>> Add interconnect support in dwc3-qcom driver to vote for bus
>>>>> bandwidth.
>>>>>
>>>>> This requires for two different paths - from USB master to
>>>>> DDR slave. The other is from APPS master to USB slave.
>>>>>
>>>>> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
>>>>> Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
>>>>> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
>>>>> ---
>>>>>   drivers/usb/dwc3/dwc3-qcom.c | 128 ++++++++++++++++++++++++++++++++++++++++++-
>>>>>   1 file changed, 126 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
>>>>> index 1dfd024..7e85fe6 100644
>>>>> --- a/drivers/usb/dwc3/dwc3-qcom.c
>>>>> +++ b/drivers/usb/dwc3/dwc3-qcom.c
>>>>>
>>>>> ...
>>>>>
>>>>> +/* To disable an interconnect, we just set its bandwidth to 0 */
>>>>> +static int dwc3_qcom_interconnect_disable(struct dwc3_qcom *qcom)
>>>>> +{
>>>>> +	int ret;
>>>>> +
>>>>> +	ret = icc_set_bw(qcom->usb_ddr_icc_path, 0, 0);
>>>>> +	if (ret)
>>>>> +		return ret;
>>>>> +
>>>>> +	ret = icc_set_bw(qcom->apps_usb_icc_path, 0, 0);
>>>>> +	if (ret)
>>>>> +		goto err_reenable_memory_path;
>>>>> +
>>>>> +	return 0;
>>>>> +
>>>>> +	/* Re-enable things in the event of an error */
>>>>> +err_reenable_memory_path:
>>>>> +	ret = dwc3_qcom_interconnect_enable(qcom);
>>>> This overwrites the error that led to the execution of this code path.
>>>> The function should return original error, not the result of the
>>>> _interconnect_enable() call.
>>>>
>>>> I saw Felipe queued the patch for v5.8. I think the main options to fix this
>>>> are:
>>>>
>>>> - a v6 of this patch to replace v5 in Felipe's tree (which IIUC will be rebased
>>>>    anyway once there is a v5.7-rc)
>>>> - send the fix as a separate patch
>>>> - Felipe amends the patch in his tree
>>>>
>>>> Felipe, what would work best for you?
>>> Let's go for a v6, which commits should I drop? I can't find anything
>>> related to $subject in my queue:
>>>
>>> $ git --no-pager log --oneline HEAD ^linus/master -- drivers/usb/dwc3/dwc3-qcom.c
>>> 201c26c08db4 usb: dwc3: qcom: Replace <linux/clk-provider.h> by <linux/of_clk.h>
>> I thought I saw a "queued for v5.8" message from you, but can't find that back.
>> I guess I saw the "queued" message for the "Add USB DWC3 support for SC7180"
>> series and thought it was for this one. Sorry for the confusion.
> no worries :-)
>
Should I remove the ret from below line and send a new version?
+	ret = dwc3_qcom_interconnect_enable(qcom);

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
