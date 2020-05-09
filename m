Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDE6A1CBF48
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 May 2020 10:43:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725930AbgEIInL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 May 2020 04:43:11 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:31382 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726214AbgEIInL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 May 2020 04:43:11 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589013789; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=7q6ciT5kWTeLY/TWplHoNnQfdOa1lllVc1nno43F/RI=; b=Z1hJ/5eUEDep+aByeCv/Q7etn5FQF0OG0SjwgKvHiTP6QjBLTfp+b3HFILOa1J3V4fgMiX/z
 ZKonCK/n6SB8SECjOX3CGDNXe/Qk2IPx5aCh1TumdZvBMbMf+DfI5CEXGVLlXerVTkNfbvyd
 jH0X7iD80AaMk54UI7ATmGVtD3g=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eb66d15.7f3d25ce3ca8-smtp-out-n03;
 Sat, 09 May 2020 08:43:01 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9D137C433BA; Sat,  9 May 2020 08:43:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.110.20.51] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0DA83C433D2;
        Sat,  9 May 2020 08:42:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0DA83C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [RFC 1/3] usb: dwc3: Resize TX FIFOs to meet EP bursting
 requirements
To:     Felipe Balbi <balbi@kernel.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        gregkh@linuxfoundation.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        jackp@codeaurora.org
References: <1588888768-25315-1-git-send-email-wcheng@codeaurora.org>
 <1588888768-25315-2-git-send-email-wcheng@codeaurora.org>
 <878si2mw7i.fsf@kernel.org>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <f966ac74-94d9-7aca-dc10-71052a8f82a9@codeaurora.org>
Date:   Sat, 9 May 2020 01:42:58 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <878si2mw7i.fsf@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/8/2020 5:45 AM, Felipe Balbi wrote:
> 
> Hi,
> 
> Wesley Cheng <wcheng@codeaurora.org> writes:
>> Some devices have USB compositions which may require multiple endpoints
>> that support EP bursting.  HW defined TX FIFO sizes may not always be
>> sufficient for these compositions.  By utilizing flexible TX FIFO
>> allocation, this allows for endpoints to request the required FIFO depth to
>> achieve higher bandwidth.  With some higher bMaxBurst configurations, using
>> a larger TX FIFO size results in better TX throughput.
> 
> This needs to be carefully thought out as it can introduce situations
> where gadget drivers that worked previously stop working.
> 

Hi Felipe,

Thanks for the feedback.  I agree, the TX FIFO resizing logic should be
reviewed carefully to, in order not to cause any regressions.  Would you
be willing to shed some light on some of the failures you've seen
previously where the gadget drivers stopped working?  (would help
possibly come up with better approaches, etc...)

>> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
>> index 4c171a8..e815c13 100644
>> --- a/drivers/usb/dwc3/core.h
>> +++ b/drivers/usb/dwc3/core.h
>> @@ -675,6 +675,7 @@ struct dwc3_event_buffer {
>>   *		isochronous START TRANSFER command failure workaround
>>   * @start_cmd_status: the status of testing START TRANSFER command with
>>   *		combo_num = 'b00
>> + * @fifo_depth: allocated TXFIFO depth
>>   */
>>  struct dwc3_ep {
>>  	struct usb_ep		endpoint;
>> @@ -718,6 +719,7 @@ struct dwc3_ep {
>>  	u8			resource_index;
>>  	u32			frame_number;
>>  	u32			interval;
>> +	int			fifo_depth;
>>  
>>  	char			name[20];
>>  
>> @@ -1004,6 +1006,7 @@ struct dwc3_scratchpad_array {
>>   * 	1	- utmi_l1_suspend_n
>>   * @is_fpga: true when we are using the FPGA board
>>   * @pending_events: true when we have pending IRQs to be handled
>> + * @needs_fifo_resize: not all users might want fifo resizing, flag it
>>   * @pullups_connected: true when Run/Stop bit is set
>>   * @setup_packet_pending: true when there's a Setup Packet in FIFO. Workaround
>>   * @three_stage_setup: set if we perform a three phase setup
>> @@ -1044,6 +1047,7 @@ struct dwc3_scratchpad_array {
>>   * @dis_metastability_quirk: set to disable metastability quirk.
>>   * @imod_interval: set the interrupt moderation interval in 250ns
>>   *                 increments or 0 to disable.
>> + * @last_fifo_depth: total TXFIFO depth of all enabled USB IN/INT endpoints
>>   */
>>  struct dwc3 {
>>  	struct work_struct	drd_work;
>> @@ -1204,6 +1208,7 @@ struct dwc3 {
>>  	unsigned		is_utmi_l1_suspend:1;
>>  	unsigned		is_fpga:1;
>>  	unsigned		pending_events:1;
>> +	unsigned		needs_fifo_resize:1;
> 
> Instead of passing a flag, this could be detected in runtime during ->udc_start()
> 

The flag was going to serve the purpose of allowing platforms to define
if they want to enable the TX FIFO resizing logic or not.  Maybe in
their particular HW platform, the HW default FIFO settings are sufficient.

>> diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
>> index 6dee4da..7ee2302 100644
>> --- a/drivers/usb/dwc3/ep0.c
>> +++ b/drivers/usb/dwc3/ep0.c
>> @@ -611,6 +612,43 @@ static int dwc3_ep0_set_config(struct dwc3 *dwc, struct usb_ctrlrequest *ctrl)
>>  		return -EINVAL;
>>  
>>  	case USB_STATE_ADDRESS:
> 
> are you sure it's safe to fiddle with TX FIFO allocation at SetAddress()
> time?
> 

It should be acceptable, as the function drivers shouldn't be calling
usb_ep_enable() until we receive a SET_CONFIG from the host to enable
the configuration.  __dwc3_gadget_ep_enable() -->
dwc3_gadget_set_ep_config() is where we'd assign the EP to a particular
TX FIFO.

>> +		/*
>> +		 * If tx-fifo-resize flag is not set for the controller, then
>> +		 * do not clear existing allocated TXFIFO since we do not
>> +		 * allocate it again in dwc3_gadget_resize_tx_fifos
>> +		 */
>> +		if (dwc->needs_fifo_resize) {
>> +			/* Read ep0IN related TXFIFO size */
>> +			dep = dwc->eps[1];
>> +			size = dwc3_readl(dwc->regs, DWC3_GTXFIFOSIZ(0));
>> +			if (dwc3_is_usb31(dwc))
>> +				dep->fifo_depth = DWC31_GTXFIFOSIZ_TXFDEP(size);
>> +			else
>> +				dep->fifo_depth = DWC3_GTXFIFOSIZ_TXFDEP(size);
>> +
>> +			dwc->last_fifo_depth = dep->fifo_depth;
>> +			/* Clear existing TXFIFO for all IN eps except ep0 */
>> +			for (num = 3; num < min_t(int, dwc->num_eps,
>> +				DWC3_ENDPOINTS_NUM); num += 2) {
>> +				dep = dwc->eps[num];
>> +				/* Don't change TXFRAMNUM on usb31 version */
>> +				size = dwc3_is_usb31(dwc) ?
>> +					dwc3_readl(dwc->regs,
>> +						   DWC3_GTXFIFOSIZ(num >> 1)) &
>> +						   DWC31_GTXFIFOSIZ_TXFRAMNUM :
>> +						   0;
>> +
>> +				dwc3_writel(dwc->regs,
>> +					    DWC3_GTXFIFOSIZ(num >> 1),
>> +					    size);
>> +				dep->fifo_depth = 0;
>> +
>> +				dev_dbg(dwc->dev, "%s(): %s fifo_depth:%x\n",
>> +					__func__, dep->name,
>> +					dep->fifo_depth);
> 
> no dev_dbg() calls in this driver, please.
> 

Got it.

>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>> index 00746c2..6baca05 100644
>> --- a/drivers/usb/dwc3/gadget.c
>> +++ b/drivers/usb/dwc3/gadget.c
>> @@ -540,6 +540,97 @@ static int dwc3_gadget_start_config(struct dwc3_ep *dep)
>>  	return 0;
>>  }
>>  
>> +/*
>> + * dwc3_gadget_resize_tx_fifos - reallocate fifo spaces for current use-case
>> + * @dwc: pointer to our context structure
>> + *
>> + * This function will a best effort FIFO allocation in order
>> + * to improve FIFO usage and throughput, while still allowing
>> + * us to enable as many endpoints as possible.
>> + *
>> + * Keep in mind that this operation will be highly dependent
>> + * on the configured size for RAM1 - which contains TxFifo -,
>> + * the amount of endpoints enabled on coreConsultant tool, and
>> + * the width of the Master Bus.
>> + *
>> + * In the ideal world, we would always be able to satisfy the
>> + * following equation:
>> + *
>> + * ((512 + 2 * MDWIDTH-Bytes) + (Number of IN Endpoints - 1) * \
>> + * (3 * (1024 + MDWIDTH-Bytes) + MDWIDTH-Bytes)) / MDWIDTH-Bytes
>> + *
>> + * Unfortunately, due to many variables that's not always the case.
>> + */
>> +static int dwc3_gadget_resize_tx_fifos(struct dwc3 *dwc, struct dwc3_ep *dep)
>> +{
>> +	int fifo_size, mdwidth, max_packet = 1024;
>> +	int tmp, mult = 1, fifo_0_start, ram1_depth;
>> +
>> +	if (!dwc->needs_fifo_resize)
>> +		return 0;
>> +
>> +	/* resize IN endpoints excepts ep0 */
> 
> typo: excepts
> 

Got it.

>> +	if (!usb_endpoint_dir_in(dep->endpoint.desc) || dep->number <= 1)
>> +		return 0;
>> +
>> +	/* Don't resize already resized IN endpoint */
>> +	if (dep->fifo_depth) {
>> +		dev_dbg(dwc->dev, "%s fifo_depth:%d is already set\n",
>> +					dep->endpoint.name, dep->fifo_depth);
> 
> no dev_dbg()
> 

Understood.

>> @@ -620,6 +711,10 @@ static int __dwc3_gadget_ep_enable(struct dwc3_ep *dep, unsigned int action)
>>  	int			ret;
>>  
>>  	if (!(dep->flags & DWC3_EP_ENABLED)) {
>> +		ret = dwc3_gadget_resize_tx_fifos(dwc, dep);
> 
> technically, you're no resizing a single FIFO. In any case, what happens
> when you run out of space midway through the resizing? You already
> accepted the gadget driver, you're already bound to it, then you resize
> the FIFOs and things start to fall apart. How do we handle that?
> 

Yes, that is a valid concern.  At the moment, if we returned -ENOMEM due
to the resizing logic failing, then the function driver would receive an
error during usb_ep_enable().  This would then most likely result in the
data path not being enabled for each subsequent function driver.  Would
the situation be better if we avoid binding to the UDC entirely if our
TXFIFO was out of memory?

Thanks again for the input!

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
