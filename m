Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 071E9303461
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jan 2021 06:25:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731083AbhAZFXt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jan 2021 00:23:49 -0500
Received: from a1.mail.mailgun.net ([198.61.254.60]:61514 "EHLO
        a1.mail.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731744AbhAZBYH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jan 2021 20:24:07 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1611624227; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=O9V4up07IpE1qF4+xHCrvY2NGhcP/Eg6BkRDYO1CsiU=; b=qOG9jap5KivTNgcQ5VPkl8c8mRgNjIeQQvLSaN4jAU3Ose7wB5453iJsSvV/7SXft2lXEZ2q
 mI+TY1wqjCSCDzo/tK+NDB5cb9HLBjUMeRm942W6hPXD9InjpitvglEvXuoSjmBZuiVe680U
 WkqHRIUaN3dzoENEY3zsi3lM5iY=
X-Mailgun-Sending-Ip: 198.61.254.60
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 600f6a462c36b2106d3966e6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 26 Jan 2021 01:03:02
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 08905C43461; Tue, 26 Jan 2021 01:03:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.110.78.65] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 51560C433ED;
        Tue, 26 Jan 2021 01:03:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 51560C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH v6 1/4] usb: gadget: udc: core: Introduce check_config to
 verify USB configuration
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, robh+dt@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        peter.chen@nxp.com, jackp@codeaurora.org
References: <1611288100-31118-1-git-send-email-wcheng@codeaurora.org>
 <1611288100-31118-2-git-send-email-wcheng@codeaurora.org>
 <20210122162447.GC43566@rowland.harvard.edu>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <784ce67c-d4ef-63ae-8f81-c52fc5b2e794@codeaurora.org>
Date:   Mon, 25 Jan 2021 17:02:59 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210122162447.GC43566@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1/22/2021 8:24 AM, Alan Stern wrote:
> On Thu, Jan 21, 2021 at 08:01:37PM -0800, Wesley Cheng wrote:
>> Some UDCs may have constraints on how many high bandwidth endpoints it can
>> support in a certain configuration.  This API allows for the composite
>> driver to pass down the total number of endpoints to the UDC so it can verify
>> it has the required resources to support the configuration.
>>
>> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> 
> 
>> --- a/include/linux/usb/gadget.h
>> +++ b/include/linux/usb/gadget.h
>> @@ -328,6 +328,7 @@ struct usb_gadget_ops {
>>  	struct usb_ep *(*match_ep)(struct usb_gadget *,
>>  			struct usb_endpoint_descriptor *,
>>  			struct usb_ss_ep_comp_descriptor *);
>> +	int	(*check_config)(struct usb_gadget *gadget, unsigned long ep_map);
>>  };
>>  
>>  /**
>> @@ -607,6 +608,7 @@ int usb_gadget_connect(struct usb_gadget *gadget);
>>  int usb_gadget_disconnect(struct usb_gadget *gadget);
>>  int usb_gadget_deactivate(struct usb_gadget *gadget);
>>  int usb_gadget_activate(struct usb_gadget *gadget);
>> +int usb_gadget_check_config(struct usb_gadget *gadget, unsigned long ep_map);
>>  #else
>>  static inline int usb_gadget_frame_number(struct usb_gadget *gadget)
>>  { return 0; }
> 
> Don't you also need an entry for the case where CONFIG_USB_GADGET isn't 
> enabled?
> 
> Alan Stern
> 
Hi Alan,

Thanks for pointing that out.  I missed that, and will add it to the
next rev.

Thanks
Wesley Cheng


-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
