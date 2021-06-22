Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69C283AFCA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 07:27:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbhFVFaA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 01:30:00 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:28673 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230109AbhFVF3y (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 01:29:54 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624339659; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=d4DXAvBzd+NblqWuAC/vQM0I4ES2Q8ZE7I6FHwueUdY=; b=TrokpnyCXpuF43p9GEmls/HJmZGgO3vHNysIMQsNWuy0npHNoa72QTl3L6P3UIYiJ5Ggf3RE
 kYZTAtOGbATgLfPuDmRgWGC2SMFMF62R+M6e9bpUEHAXF27tvrK0jlz5oMWVI/bYyomY43UX
 1Re8V8ssyctP6h7/gr/OLUKCW98=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60d174b6e570c05619c1bb1e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 22 Jun 2021 05:27:18
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CE58AC4338A; Tue, 22 Jun 2021 05:27:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [10.110.90.136] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 487C2C433D3;
        Tue, 22 Jun 2021 05:27:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 487C2C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH v10 3/6] usb: dwc3: Resize TX FIFOs to meet EP bursting
 requirements
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     balbi@kernel.org, robh+dt@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, frowand.list@gmail.com,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jackp@codeaurora.org, fntoth@gmail.com,
        heikki.krogerus@linux.intel.com, andy.shevchenko@gmail.com
References: <1623923899-16759-1-git-send-email-wcheng@codeaurora.org>
 <1623923899-16759-4-git-send-email-wcheng@codeaurora.org>
 <YMstrL1aQYGe7NB0@kroah.com>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <1a979c61-e996-b94a-c986-a9721d3b3297@codeaurora.org>
Date:   Mon, 21 Jun 2021 22:27:13 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YMstrL1aQYGe7NB0@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/17/2021 4:10 AM, Greg KH wrote:
> On Thu, Jun 17, 2021 at 02:58:16AM -0700, Wesley Cheng wrote:
>> +static int dwc3_gadget_check_config(struct usb_gadget *g, unsigned long ep_map)
>> +{
>> +	struct dwc3 *dwc = gadget_to_dwc(g);
>> +	unsigned long in_ep_map;
>> +	int fifo_size = 0;
>> +	int ram1_depth;
>> +	int ep_num;
>> +
>> +	if (!dwc->do_fifo_resize)
>> +		return 0;
>> +
>> +	/* Only interested in the IN endpoints */
>> +	in_ep_map = ep_map >> 16;

Hi Greg,

> 
> Wait, this "map" is split up into 16/16 somehow?  So it's only 32bits
> big?
>

Yes, correct. Upper 16 carries IN eps, lower 16 carries OUT eps.  Will
fix that based off your other comment.

> Where did you document this map structure?  Why is it needed at all, you
> have the gadget, don't you have access to the full list of endpoints
> here as well?
> 
> confused,
> 

Unfortunately, we do not have the entire list of endpoints for each
function until the composite driver receives the SET_CONFIG packet from
the host.  By this time, if we incorrectly allowed the configuration to
start enumeration w/ the host, and there were some EPs which have no
FIFO memory allocated, that would lead to those interfaces/functions
being broken.

The USB UDC driver does have the in_epnum and out_epnum, but those are
currently only being incremented in case we don't match EPs by string.
(in usb_ep_autoconfig_ss())

Thanks
Wesley Cheng

> greg k-h
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
