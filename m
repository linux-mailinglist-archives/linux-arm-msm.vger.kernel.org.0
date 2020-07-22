Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6836F229E91
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jul 2020 19:33:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728936AbgGVRd1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jul 2020 13:33:27 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:64265 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726685AbgGVRd1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jul 2020 13:33:27 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595439206; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=RLU97VPwbcjVpG9YS+DY2JZ9ZOWhHWhYKxgSJC3rnSc=; b=pXICuzZ0ui+FADKKHVyUM3LY7my8vED1mDW3jBCVea/WxICx0CCKGCwP2ZpZLKw41D4zsHno
 ZyHrycP2xaqavH1tJqaVzPH/8OtthsbtEXYxBWBY9gk4SdNUe6KFz2Gx4lJVP6QVNmaRzzQV
 MS8Nl5mpWHAwCO+hVzaNX/DNR+0=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n18.prod.us-east-1.postgun.com with SMTP id
 5f1878507c8ca473a87f4112 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 22 Jul 2020 17:33:04
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1A3B5C43395; Wed, 22 Jul 2020 17:33:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.10] (cpe-70-95-5-60.san.res.rr.com [70.95.5.60])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sidgup)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6C316C433C9;
        Wed, 22 Jul 2020 17:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6C316C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sidgup@codeaurora.org
Subject: Re: [PATCH v4 1/2] remoteproc: Add remoteproc character device
 interface
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, ohad@wizery.com, corbet@lwn.net,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org,
        linux-doc@vger.kernel.org
References: <1594148870-27276-1-git-send-email-sidgup@codeaurora.org>
 <1594148870-27276-2-git-send-email-sidgup@codeaurora.org>
 <20200715201839.GA3204081@xps15> <20200715215149.GA3267350@xps15>
 <81d7514c-727e-b4dc-e4ac-74a25966ccaf@codeaurora.org>
 <20200721205635.GM2922385@builder.lan> <20200722171841.GA1268891@xps15>
From:   Siddharth Gupta <sidgup@codeaurora.org>
Message-ID: <415eb089-4a45-96e9-1816-88ba9c9be9aa@codeaurora.org>
Date:   Wed, 22 Jul 2020 10:33:01 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722171841.GA1268891@xps15>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 7/22/2020 10:18 AM, Mathieu Poirier wrote:
> On Tue, Jul 21, 2020 at 01:56:35PM -0700, Bjorn Andersson wrote:
>> On Tue 21 Jul 12:16 PDT 2020, Siddharth Gupta wrote:
>>> On 7/15/2020 2:51 PM, Mathieu Poirier wrote:
>>>> On Wed, Jul 15, 2020 at 02:18:39PM -0600, Mathieu Poirier wrote:
>>>>> On Tue, Jul 07, 2020 at 12:07:49PM -0700, Siddharth Gupta wrote:
>> [..]
>>>>>> diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
>> [..]
>>>>>> +int rproc_char_device_add(struct rproc *rproc)
>>>>>> +{
>>>>>> +	int ret;
>>>>>> +	dev_t cdevt;
>>>>>> +
>>>>>> +	cdev_init(&rproc->char_dev, &rproc_fops);
>>>>>> +	rproc->char_dev.owner = THIS_MODULE;
>>>>>> +
>>>>>> +	cdevt = MKDEV(rproc_major, rproc->index);
>>>>>> +	ret = cdev_add(&rproc->char_dev, cdevt, 1);
>>>> Trying this patchset on my side gave me the following splat[1].  After finding
>>>> the root case I can't understand how you haven't see it on your side when you
>>>> tested the feature.
>>>>
>>>> [1]. https://pastebin.com/aYTUUCdQ
>> Mathieu, I've looked at this back and forth. Afaict this implies that
>> rproc_major is still 0. Could it be that either alloc_chrdev_region()
>> failed or somehow has yet to be called when you hit this point?
> That is exacly what I thought when I first stumbled on this but instrumenting
> the code showed otherwise.
>
> After function rproc_init_cdev() has been called @rproc_major contains the
> dynamically allocated major number in the upper 12 bits and the base minor
> number in the lower 20 bits.
>
> In rproc_char_device_add() we find this line:
>
>          cdevt = MKDEV(rproc_major, rproc->index);
>
> Macro MKDEV() builds a device number by shifting @rproc_major by 20 bits to the
> left and OR'ing that with @rproc->index.  But the device's major number is
> already occupying the upper 12bits, so shifthing another 20 bits to the left
> makes the major portion of the device number '0'.  That is causing cdev_add() to
> complain bitterly.
>
> The right way to do this is:
>
>          cdevt = MKDEV(MAJOR(rproc_major), rproc->index);
>
> Once I found the problem I thought about 32/64 bit issues.  Since Siddharth is
> using a 64bit application processor shifting another 20 bits would still have
> yielded a non-zero value.  But that can't be since dev_t is a u32 in
> linux/types.h.
>
> As such I can't see how it is possible to not hit that problem on a 64bit
> platform.
Hey Mathieu,

I just checked my testing tree for our devices and realized that I have 
an older version
of the patch. Hence I was unable to reproduce the error. I will fix this 
problem, and
send out a new patchset today.

Sorry about this error!

Thanks,
Sid
>>> Hey Mathieu,
>>>
>>> We aren't able to reproduce the error that you are seeing, the splat is
>>> coming
>>> from the check for whiteout device[1] - which shouldn't happen because of
>>> the
>>> find_dynamic_major call[2], right?
>>>
>>> We are successfully seeing all our character device files and able to
>>> successfully boot remoteprocs. From what I read and understood about
>>> whiteout
>>> devices they will be hidden in the fs.
>>>
>>> Could you provide more details about your configuration and testing?
>>>
>>> [1]: https://github.com/torvalds/linux/blob/master/fs/char_dev.c#L486
>>> <https://github.com/torvalds/linux/blob/master/fs/char_dev.c#L123>
>>> [2]: https://github.com/torvalds/linux/blob/master/fs/char_dev.c#L123
>>>
>>> <https://github.com/torvalds/linux/blob/master/fs/char_dev.c#L486>
>>>>>> +	if (ret < 0)
>>>>>> +		goto out;
>>>>>> +
>>>>>> +	rproc->dev.devt = cdevt;
>>>>>> +out:
>>>>>> +	return ret;
>>>>>> +}
>>>>>> +
>>>>>> +void rproc_char_device_remove(struct rproc *rproc)
>>>>>> +{
>>>>>> +	__unregister_chrdev(rproc_major, rproc->index, 1, "remoteproc");
>>>>>> +}
>>>>>> +
>>>>>> +void __init rproc_init_cdev(void)
>>>>>> +{
>>>>>> +	int ret;
>>>>>> +
>>>>>> +	ret = alloc_chrdev_region(&rproc_major, 0, NUM_RPROC_DEVICES, "remoteproc");
>>>>>> +	if (ret < 0)
>>>>>> +		pr_err("Failed to alloc rproc_cdev region, err %d\n", ret);
>>>>>> +}
>>>>>> +
>>>>>> +void __exit rproc_exit_cdev(void)
>>>>>> +{
>>>>>> +	unregister_chrdev_region(MKDEV(rproc_major, 0), NUM_RPROC_DEVICES);
>>>>> Please go back to the comment I made on this during my last review and respin.
>>>> After digging in the code while debugging the above problem, I don't see how
>>>> unregistering the chrdev region the way it is done here would have worked.
>>> Since this is compiled statically and not built as a module, we will never
>>> exercise the code path, so I will remove it in the next patchset.
>>>
>> You're right Siddharth, since we changed CONFIG_REMOTEPROC to bool it's no longer
>> possible to hit remoteproc_exit(), so you can omit this function
>> entirely. (And we should clean up the rest of that as well)
>>
>> [..]
>>>>>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>> [..]
>>>>>> @@ -488,6 +489,8 @@ struct rproc_dump_segment {
>>>>>>     * @auto_boot: flag to indicate if remote processor should be auto-started
>>>>>>     * @dump_segments: list of segments in the firmware
>>>>>>     * @nb_vdev: number of vdev currently handled by rproc
>>>>>> + * @char_dev: character device of the rproc
>>>>>> + * @cdev_put_on_release: flag to indicate if remoteproc should be shutdown on @char_dev release
>>>>>>     */
>>>>>>    struct rproc {
>>>>>>    	struct list_head node;
>>>>>> @@ -523,6 +526,8 @@ struct rproc {
>>>>>>    	int nb_vdev;
>>>>>>    	u8 elf_class;
>>>>>>    	u16 elf_machine;
>>>>>> +	struct cdev char_dev;
>> As stated privately, I assumed based on this name that this is a struct
>> device related to that character device. So please rename this cdev to
>> save me from doing this mistake again.
>>
>> Thanks,
>> Bjorn
