Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1487224102A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Aug 2020 21:28:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728357AbgHJT2K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Aug 2020 15:28:10 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:63627 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729177AbgHJTLQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Aug 2020 15:11:16 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597086674; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Erzx1fruSSrSxj4EEjWNMx4b9AuQa5yJ7QWcymESvIY=;
 b=LMgyO4w2LJgjNWxB1L9NzmDQpLldTR40Zvn8+RSCgT0zNXbZfIg/iM32ZJu/0EWYIB5r65Sb
 uFY8xnSU8PW6cMEiyM5ptP/Z1igYR+pwZ44QlJpocZ5hW5KM9jKYslsbLfBmjmCmCLkmTPuj
 4vIG9NpvD/MErJFTQsw0eGFUsJg=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-west-2.postgun.com with SMTP id
 5f319bcb1e4d3989d49a8d14 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 10 Aug 2020 19:11:07
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8588AC4363E; Mon, 10 Aug 2020 19:11:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED autolearn=ham
        autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 557F0C43617;
        Mon, 10 Aug 2020 19:11:04 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 10 Aug 2020 12:11:04 -0700
From:   bbhatt@codeaurora.org
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH v6 11/11] bus: mhi: core: Introduce sysfs entries for MHI
In-Reply-To: <20200807052242.GD3230@Mani-XPS-13-9360>
References: <1595901740-27379-1-git-send-email-bbhatt@codeaurora.org>
 <1595901740-27379-12-git-send-email-bbhatt@codeaurora.org>
 <20200807052242.GD3230@Mani-XPS-13-9360>
Message-ID: <dbe47f5d3b9aaef9815d2659df3a5161@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-08-06 22:22, Manivannan Sadhasivam wrote:
> On Mon, Jul 27, 2020 at 07:02:20PM -0700, Bhaumik Bhatt wrote:
>> Introduce sysfs entries to enable userspace clients the ability to 
>> read
>> the serial number and the OEM PK Hash values obtained from BHI. OEMs
>> need to read these device-specific hardware information values through
>> userspace for factory testing purposes and cannot be exposed via 
>> degbufs
>> as it may remain disabled for performance reasons. Also, update the
>> documentation for ABI to include these entries.
>> 
>> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
>> ---
>>  Documentation/ABI/stable/sysfs-bus-mhi | 21 ++++++++++++++
>>  MAINTAINERS                            |  1 +
>>  drivers/bus/mhi/core/init.c            | 53 
>> ++++++++++++++++++++++++++++++++++
>>  3 files changed, 75 insertions(+)
>>  create mode 100644 Documentation/ABI/stable/sysfs-bus-mhi
>> 
>> diff --git a/Documentation/ABI/stable/sysfs-bus-mhi 
>> b/Documentation/ABI/stable/sysfs-bus-mhi
>> new file mode 100644
>> index 0000000..1d5d0d6
>> --- /dev/null
>> +++ b/Documentation/ABI/stable/sysfs-bus-mhi
>> @@ -0,0 +1,21 @@
>> +What:		/sys/bus/mhi/devices/.../serialnumber
>> +Date:		Jul 2020
>> +KernelVersion:	5.8
>> +Contact:	Bhaumik Bhatt <bbhatt@codeaurora.org>
>> +Description:	The file holds the serial number of the client device 
>> obtained
>> +		using a BHI (Boot Host Interface) register read after at least
>> +		one attempt to power up the device has been done. If read
>> +		without having the device power on at least once, the file will
>> +		read all 0's.
>> +Users:		Any userspace application or clients interested in device 
>> info.
> 
> I think you're not using tabs here and that's why it is showing 
> mangled. Please
> use tabs as like other files.
> 
> Thanks,
> Mani
> 
Hi Mani,

I am using tabs actually. I, in fact, copied another file 
(sysfs-bus-vmbus) and only modified the
required entries and did a diff to confirm.

I doubt there is more I can do.

Please let me know if the next patch is acceptable soon.

>> +
>> +What:		/sys/bus/mhi/devices/.../oem_pk_hash
>> +Date:		Jul 2020
>> +KernelVersion:	5.8
>> +Contact:	Bhaumik Bhatt <bbhatt@codeaurora.org>
>> +Description:	The file holds the OEM PK Hash value of the endpoint 
>> device
>> +		obtained using a BHI (Boot Host Interface) register read after
>> +		at least one attempt to power up the device has been done. If
>> +		read without having the device power on at least once, the file
>> +		will read all 0's.
>> +Users:		Any userspace application or clients interested in device 
>> info.
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index e64e5db..5e49316 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -11018,6 +11018,7 @@ M:	Hemant Kumar <hemantk@codeaurora.org>
>>  L:	linux-arm-msm@vger.kernel.org
>>  S:	Maintained
>>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git
>> +F:	Documentation/ABI/stable/sysfs-bus-mhi
>>  F:	Documentation/mhi/
>>  F:	drivers/bus/mhi/
>>  F:	include/linux/mhi.h
>> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
>> index 972dbf0..c086ef2 100644
>> --- a/drivers/bus/mhi/core/init.c
>> +++ b/drivers/bus/mhi/core/init.c
>> @@ -76,6 +76,56 @@ const char *to_mhi_pm_state_str(enum mhi_pm_state 
>> state)
>>  	return mhi_pm_state_str[index];
>>  }
>> 
>> +static ssize_t serial_number_show(struct device *dev,
>> +				  struct device_attribute *attr,
>> +				  char *buf)
>> +{
>> +	struct mhi_device *mhi_dev = to_mhi_device(dev);
>> +	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
>> +
>> +	return snprintf(buf, PAGE_SIZE, "Serial Number: %u\n",
>> +			mhi_cntrl->serial_number);
>> +}
>> +static DEVICE_ATTR_RO(serial_number);
>> +
>> +static ssize_t oem_pk_hash_show(struct device *dev,
>> +				struct device_attribute *attr,
>> +				char *buf)
>> +{
>> +	struct mhi_device *mhi_dev = to_mhi_device(dev);
>> +	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
>> +	int i, cnt = 0;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(mhi_cntrl->oem_pk_hash); i++)
>> +		cnt += snprintf(buf + cnt, PAGE_SIZE - cnt,
>> +				"OEMPKHASH[%d]: 0x%x\n", i,
>> +				mhi_cntrl->oem_pk_hash[i]);
>> +
>> +	return cnt;
>> +}
>> +static DEVICE_ATTR_RO(oem_pk_hash);
>> +
>> +static struct attribute *mhi_sysfs_attrs[] = {
>> +	&dev_attr_serial_number.attr,
>> +	&dev_attr_oem_pk_hash.attr,
>> +	NULL,
>> +};
>> +
>> +static const struct attribute_group mhi_sysfs_group = {
>> +	.attrs = mhi_sysfs_attrs,
>> +};
>> +
>> +static int mhi_create_sysfs(struct mhi_controller *mhi_cntrl)
>> +{
>> +	return sysfs_create_group(&mhi_cntrl->mhi_dev->dev.kobj,
>> +				  &mhi_sysfs_group);
>> +}
>> +
>> +static void mhi_destroy_sysfs(struct mhi_controller *mhi_cntrl)
>> +{
>> +	sysfs_remove_group(&mhi_cntrl->mhi_dev->dev.kobj, &mhi_sysfs_group);
>> +}
>> +
>>  /* MHI protocol requires the transfer ring to be aligned with ring 
>> length */
>>  static int mhi_alloc_aligned_ring(struct mhi_controller *mhi_cntrl,
>>  				  struct mhi_ring *ring,
>> @@ -917,6 +967,8 @@ int mhi_register_controller(struct mhi_controller 
>> *mhi_cntrl,
>>  	mhi_cntrl->mhi_dev = mhi_dev;
>> 
>>  	mhi_create_debugfs(mhi_cntrl);
>> +	if (mhi_create_sysfs(mhi_cntrl))
>> +		dev_err(mhi_cntrl->cntrl_dev, "Failed to create sysfs entries\n");
>> 
>>  	return 0;
>> 
>> @@ -940,6 +992,7 @@ void mhi_unregister_controller(struct 
>> mhi_controller *mhi_cntrl)
>>  	struct mhi_chan *mhi_chan = mhi_cntrl->mhi_chan;
>>  	unsigned int i;
>> 
>> +	mhi_destroy_sysfs(mhi_cntrl);
>>  	mhi_destroy_debugfs(mhi_cntrl);
>> 
>>  	kfree(mhi_cntrl->mhi_cmd);
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project
>> 
