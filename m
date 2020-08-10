Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7499C2411E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Aug 2020 22:51:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgHJUvu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Aug 2020 16:51:50 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:50381 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726412AbgHJUvt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Aug 2020 16:51:49 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597092709; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=v2bPcIhJzgNJjDaAtjyj+VEpCVRojqaWUChwZ3DzC8U=; b=qEue+ZWDT++8X5tSzxQ1chG2yqQIMKC9YXfdtr7E5NKTCvLzjpWNRyMbqLn0bO9fAcJAzwDy
 lTWkkYK/HzDQqyx9KFtkPtb3wfepOgkGChuOV53kseSVXZH+nJU9w1iWKGc06kfEIAvrtUD2
 jjfgvz6ZMvjtiSVe6NIj19IQpfA=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-east-1.postgun.com with SMTP id
 5f31b357440a07969aac07d4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 10 Aug 2020 20:51:35
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DA650C43391; Mon, 10 Aug 2020 20:51:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.110.5.78] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6F1E1C433CA;
        Mon, 10 Aug 2020 20:51:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6F1E1C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH 3/3] usb: dwc3: dwc3-qcom: Find USB connector and register
 role switch
To:     Felipe Balbi <balbi@kernel.org>, bjorn.andersson@linaro.org,
        kishon@ti.com, vkoul@kernel.org, agross@kernel.org,
        gregkh@linuxfoundation.org, robh+dt@kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        jackp@codeaurora.org
References: <20200731045712.28495-1-wcheng@codeaurora.org>
 <20200731045712.28495-4-wcheng@codeaurora.org> <87ft8upukf.fsf@kernel.org>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <e46edf7a-04b8-35fb-df6c-0379dfb63a6b@codeaurora.org>
Date:   Mon, 10 Aug 2020 13:51:32 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <87ft8upukf.fsf@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 8/10/2020 5:13 AM, Felipe Balbi wrote:
> 
> Hi,
> 
> Wesley Cheng <wcheng@codeaurora.org> writes:
>> @@ -190,6 +195,73 @@ static int dwc3_qcom_register_extcon(struct dwc3_qcom *qcom)
>>  	return 0;
>>  }
>>  
>> +static int dwc3_qcom_usb_role_switch_set(struct usb_role_switch *sw,
>> +					 enum usb_role role)
>> +{
>> +	struct dwc3_qcom *qcom = usb_role_switch_get_drvdata(sw);
>> +	struct fwnode_handle *child;
>> +	bool enable = false;
>> +
>> +	if (!qcom->dwc3_drd_sw) {
>> +		child = device_get_next_child_node(qcom->dev, NULL);
>> +		if (child) {
>> +			qcom->dwc3_drd_sw = usb_role_switch_find_by_fwnode(child);
>> +			fwnode_handle_put(child);
>> +			if (IS_ERR(qcom->dwc3_drd_sw)) {
>> +				qcom->dwc3_drd_sw = NULL;
>> +				return 0;
>> +			}
>> +		}
>> +	}
>> +
>> +	usb_role_switch_set_role(qcom->dwc3_drd_sw, role);
> 
> why is this done at the glue layer instead of core.c?
> 
Hi Felipe,

Thanks for the feedback.  So the DWC3 DRD driver already registers a
role switch device for receiving external events.  However, the DWC3
glue (dwc3-qcom) needs to also know of the role changes, so that it can
set the override bits accordingly in the controller.  I've seen a few
implementations, ie using a notifier block to notify the glue of these
events, but that placed a dependency on the DWC3 core being available to
the DWC3 glue at probe time.  If the DWC3 core was not available at that
time, the dwc3-qcom driver will finish its probing routine, and since
the notifier was never registered, the role change events would not be
received.

By registering another role switch device in the DWC3 glue, this gives
us a place to attempt initializing a channel w/ the DWC3 core if it
wasn't ready during probe().  For example...

usb_conn_detect_cable(role=USB_ROLE_DEVICE)
-->usb_role_switch_set_role(sw=dwc3-qcom)
  -->dwc3_qcom_usb_role_switch_set()
    -- IF DWC3 core role switch available
	-->usb_role_switch_set_role(sw=drd)
    -- ELSE
	--> do nothing.

So basically, the goal is to just propagate the role change event down
to the DWC3 core, while breaking the dependency of it being available at
probe.
>> +	if (role == USB_ROLE_DEVICE)
>> +		enable = true;
>> +	else
>> +		enable = false;
>> +
>> +	qcom->mode = (role == USB_ROLE_HOST) ? USB_DR_MODE_HOST :
>> +					       USB_DR_MODE_PERIPHERAL;
>> +	dwc3_qcom_vbus_overrride_enable(qcom, enable);
> 
> could you add a patch fixing this typo?
> 
Sure, I'll submit a separate patch to remove that extra 'r'

Thanks
Wesley

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
