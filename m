Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA73B2425BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Aug 2020 09:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726786AbgHLHBb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Aug 2020 03:01:31 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:58131 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726734AbgHLHBa (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Aug 2020 03:01:30 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597215690; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=1lYd7mEpSaT77nxAeNLUtAPE92rtIeFulVxU9PJ93dc=; b=D+hRXcfgU199/QHhiMFP9JhsOoWUYJJQjWzKp+Ug7L9VAgnWjGZijH0SrP+WCKENzvKw4gWx
 y4UdGwmC2h7cgMkfU6u4f9MYHHjVVavc1JGZRaj7UW0qD5FP2lBLetZmpEWtK3d+h7pAi/Wv
 cjqeCgBxZaoxOY8gu1XQirMAjj8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-west-2.postgun.com with SMTP id
 5f339390668ab3fef6158580 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 12 Aug 2020 07:00:32
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8BD0BC43395; Wed, 12 Aug 2020 07:00:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.110.76.76] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 375A2C433C6;
        Wed, 12 Aug 2020 07:00:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 375A2C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [RFC v4 1/3] usb: dwc3: Resize TX FIFOs to meet EP bursting
 requirements
To:     Peter Chen <hzpeterchen@gmail.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, balbi@kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        robh+dt@kernel.org, lkml <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        USB list <linux-usb@vger.kernel.org>, jackp@codeaurora.org
References: <20200624022848.7765-1-wcheng@codeaurora.org>
 <20200624022848.7765-2-wcheng@codeaurora.org>
 <CAL411-qvuCTib1VBV9uRwL-rEHkefFLm1x-WLLP4kYzcNtQd_g@mail.gmail.com>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <47f1568e-ba8f-b7f2-9f67-a891c0e06541@codeaurora.org>
Date:   Wed, 12 Aug 2020 00:00:29 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAL411-qvuCTib1VBV9uRwL-rEHkefFLm1x-WLLP4kYzcNtQd_g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 8/11/2020 7:22 PM, Peter Chen wrote:
> On Wed, Jun 24, 2020 at 10:31 AM Wesley Cheng <wcheng@codeaurora.org> wrote:
>>
>> Some devices have USB compositions which may require multiple endpoints
>> that support EP bursting.  HW defined TX FIFO sizes may not always be
>> sufficient for these compositions.  By utilizing flexible TX FIFO
>> allocation, this allows for endpoints to request the required FIFO depth to
>> achieve higher bandwidth.  With some higher bMaxBurst configurations, using
>> a larger TX FIFO size results in better TX throughput.
>>
>> Ensure that one TX FIFO is reserved for every IN endpoint.  This allows for
>> the FIFO logic to prevent running out of FIFO space.
>>
> 
> You may do this for only allocated endpoints, but you need override
> default .match_ep
> API. See cdns3/gadget.c and cdns3/ep0.c as an example.
> 
> Peter
> 

Hi Peter,

Thank you for your input.  I've actually considered doing some
matching/resizing in the .match_ep route as well, but it doesn't work
well for situations where multiple configurations are in play. The
reason being that if you look at the epautoconf APIs, the configfs
driver will use the usb_ep_autoconfig_reset() to reset the endpoints
claimed between initialization of each configuration.  This means that
the epautoconf driver expects to re-use the usb_endpoints:

static int configfs_composite_bind(struct usb_gadget *gadget,
	struct usb_gadget_driver *gdriver)
{
...

/* Go through all configs, attach all functions */
list_for_each_entry(c, &gi->cdev.configs, list) {
...
list_for_each_entry_safe(f, tmp, &cfg->func_list, list) {
	list_del(&f->list);
	ret = usb_add_function(c, f);
	if (ret) {
		list_add(&f->list, &cfg->func_list);
		goto err_purge_funcs;
	}
}
usb_ep_autoconfig_reset(cdev->gadget);
}

So in this situation, I wouldn't want the dwc3 gadget driver to assign a
different dwc3 ep for endpoints in each configuration, when we know that
only one set of EPs will be active when the host chooses.  I hope I
understood your feedback correctly, and definitely appreciate the input!

Thanks
Wesley

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
