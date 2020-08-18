Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A29F248F2F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 21:59:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbgHRT7C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Aug 2020 15:59:02 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:18831 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726684AbgHRT7A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Aug 2020 15:59:00 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597780739; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: References: Cc: To: From:
 Subject: Sender; bh=zZL+Wq+UWx6ZdXVL+KawbcxWSyrD/Dh71Ipog7tgjDM=; b=me8JwS36gQyuJUuqrtUz93G2XmKVGydqGtXXoko1HPIwwta4D+T0Ttm51YE/5eWNXgE8Uruy
 FtLCT468Yx5O2VHUMN4W6jNX27faDTDM4fWNlTSNNTcrhttuo8An2cLwRShfNhpCg/w6c6eY
 TkOoNGYAu5B6x0JZU5kEJrTl7T0=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f3c32e8440a07969a72c007 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 18 Aug 2020 19:58:32
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9AF1FC43391; Tue, 18 Aug 2020 19:58:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.110.104.6] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 450AAC433C6;
        Tue, 18 Aug 2020 19:58:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 450AAC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [RFC v4 1/3] usb: dwc3: Resize TX FIFOs to meet EP bursting
 requirements
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     Felipe Balbi <balbi@kernel.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, gregkh@linuxfoundation.org,
        robh+dt@kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        jackp@codeaurora.org
References: <20200624022848.7765-1-wcheng@codeaurora.org>
 <20200624022848.7765-2-wcheng@codeaurora.org> <87d03yptxi.fsf@kernel.org>
 <b0c8a95b-45e3-0d79-2a7c-14c8936dd551@codeaurora.org>
 <877du5pseu.fsf@kernel.org>
 <a55445db-91b0-c2fd-0a90-0b10870b45cb@codeaurora.org>
Message-ID: <35c02c96-01f1-a7f1-e5d7-c26df77ecccd@codeaurora.org>
Date:   Tue, 18 Aug 2020 12:58:29 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <a55445db-91b0-c2fd-0a90-0b10870b45cb@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 8/12/2020 11:34 AM, Wesley Cheng wrote:
>>
>> awesome, thanks a lot for this :-) It's a considerable increase in your
>> setup. My only fear here is that we may end up creating a situation
>> where we can't allocate enough FIFO for all endpoints. This is, of
>> course, a consequence of the fact that we enable one endpoint at a
>> time.
>>
>> Perhaps we could envision a way where function driver requests endpoints
>> in bulk, i.e. combines all endpoint requirements into a single method
>> call for gadget framework and, consequently, for UDC.
>>
> Hi Felipe,
> 
> I agree...Resizing the txfifo is not as straightforward as it sounds :).
>  Would be interesting to see how this affects tput on other platforms as
> well.  We had a few discussions within our team, and came up with the
> logic implemented in this patch to reserve at least 1 txfifo per
> endpoint. Then we allocate any additional fifo space requests based on
> the remaining space left.  That way we could avoid over allocating, but
> the trade off is that we may have unused EPs taking up fifo space.
> 
> I didn't consider branching out to changing the gadget framework, so let
> me take a look at your suggestion to see how it turns out.
> 

Hi Felipe,

Instead of catching the out of FIFO memory issue during the ep enable
stage, I was thinking if we could do it somewhere during the bind.  Then
this would allow for at least failing the bind instead of having an
enumerated device which doesn't work. (will happen if we bail out during
ep enable phase)  The idea I had was the following:

Introduce a new USB gadget function pointer, say
usb_gadget_check_config(struct usb_gadget *gadget, unsigned long ep_map)

The purpose for the ep_map is to carry information about the endpoints
the configuration requires, since each function driver will define the
endpoint descriptor(s) it will advertise to the host.  We have access to
these ep desc after the bind() routine is executed for the function
driver, so we can update this map after every bind.  The configfs driver
will call the check config API every time a configuration is added.

static int configfs_composite_bind(struct usb_gadget *gadget,
		struct usb_gadget_driver *gdriver)
{
...
  /* Go through all configs, attach all functions */
  list_for_each_entry(c, &gi->cdev.configs, list) {
  ...
    list_for_each_entry_safe(f, tmp, &cfg->func_list, list) {
    ...
      	if (f->ss_descriptors) {
	  struct usb_descriptor_header **descriptors;
	  descriptors = f->ss_descriptors;
	  for (; *descriptors; ++descriptors) {
	    struct usb_endpoint_descriptor *ep;
	    int addr;
		
	    if ((*descriptors)->bDescriptorType != USB_DT_ENDPOINT)
		continue;
		
	    ep = (struct usb_endpoint_descriptor *)*descriptors;
	    addr = ((ep->bEndpointAddress & 0x80) >> 3)
	    |  (ep->bEndpointAddress & 0x0f);
	    set_bit(addr, &ep_map);
	  }
	}
    usb_gadget_check_config(cdev->gadget, ep_map);

What it'll allow us to do is to decode the ep_map in the dwc3/udc driver
to determine if we have enough fifo space. Also, if we wanted to utilize
this ep map for the actual resizing stage, we could eliminate the issue
of not knowing how many EPs will be enabled, and allocating potentially
unused fifos due to unused eps.


Thanks
Wesley

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
