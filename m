Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F40B42EB0CA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 18:01:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729407AbhAERAj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 12:00:39 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:42853 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729242AbhAERAj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 12:00:39 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 105GvP2w022779;
        Tue, 5 Jan 2021 17:59:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=2fUXaq98mIsE3vawZ+Hz9GoscBvlrYe8yxNagdvtxp0=;
 b=1qUJ2LlD+DlmjVIN6WcCl2meV62jo9r5WjJXTSKqIgMBu8PeYSSQLK/NDErivGm/p7gH
 65r+ILFUD8GHKWH8vAZXgsN++AkthMwZjuW9ce57YsJneGtZWLfSIrMavjZIt2FiOh05
 PKEZUt7DjXODMOLA9k3jtgf1Rdqj4R3k+xg39DXCAWJ/jXxSLiZhpowO7LGYoK/Vqe8h
 ou9Pd+kUJMF+hpDuSGhovOrD1xzFZ5iygmZbiE/byHz0hbVCL1n4AK1Dp4nRYrhG2DPm
 mwbcQIYy0mJpQPF6HWXILxxwfX5ANo9KNsrQtzYWysKxK3aZeUuJDa3U292dgF/0WG4o aA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 35tf66x5cr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 05 Jan 2021 17:59:52 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C3710100034;
        Tue,  5 Jan 2021 17:59:51 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AE22922BFA2;
        Tue,  5 Jan 2021 17:59:51 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 5 Jan
 2021 17:59:51 +0100
Subject: Re: [PATCH v2 00/16] introduce generic IOCTL interface for RPMsg
 channels management
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
 <X/Oet4lT9Hf14adx@builder.lan>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <60f4b837-7037-0ae0-c932-d2836bfcbc89@foss.st.com>
Date:   Tue, 5 Jan 2021 17:59:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <X/Oet4lT9Hf14adx@builder.lan>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-05_05:2021-01-05,2021-01-05 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Bjorn,

On 1/5/21 12:03 AM, Bjorn Andersson wrote:
> On Tue 22 Dec 04:57 CST 2020, Arnaud Pouliquen wrote:
> 
>> This series is a restructuring of the RPMsg char driver, to create a generic
>> RPMsg ioctl interface for all rpmsg services.
>>
>> The RPMsg char driver provides interfaces that:
>> - expose a char RPMsg device for communication with the remote processor,
>> - expose controls interface for applications to create and release endpoints.
>>
>> The objective of this series is to decorrelate the two interfaces:
>>   - Provide a char device for a RPMsg raw service in the rpmsg_char that can be
>>     probed by a RPMsg bus on a ns announcement.
>>   - Generalize the use of the ioctl for all RPMsg services by creating the
>>     rpmsg_ctrl, but keep it compatibile with the legacy.
>>
>> If the V1 create a new rpmsg_raw driver in addition to the rpmsg_ctrl this
>> version try to reuse the rpmsg_char driver by addapting QCOM GLINK and SMD
>> drivers.
>> So a goal of this version is to help to determine the best strategy to move
>> forward:
>>   - reuse rpmsg_char.
>>   - introduce a new driver and keep rpmsg_char as a legacy driver for a while.
>>
>> Notice that SMD and GLINK patches have to be tested, only build has been tested.
>>
>> 1) RPMsg control driver: rpmsg_ctrl.c
>>   This driver is based on the control part of the RPMsg_char driver. 
>>   On probe a /dev/rpmsg_ctrl<X> interface is created to allow to manage the
>>   channels.
>>   The principles are the following:
>>   - The RPMsg service driver registers it's name and the associated service
>>     using the rpmsg_ctrl_unregister_ctl API. The list of supported services
>>     is defined in  include/uapi/linux/rpmsg.h and exposed to the
>>     application thanks to a new field in rpmsg_endpoint_info struct.
>>   - On the RPMsg bus probe(e.g virtio bus) an rpmsg_ctrl device is
>>     registered that creates the control interface.
>>   - The application can then create or release a channel by specifying:
>>        - the name service
>>        - the source address.
>>        - the destination address.
> 
> Why is this useful?
I'm not sure to understand what is behind your question.
I guess the question is why is it useful to create a channel?
Mainly to use same way to probe a RPMsg service than the NS announcement.

> 
>>   - The rpmsg_ctrl uses the same interface than the ns announcement to
>>     create and release the associated channel but using the driver_override
>>     field to force the service name.
>>     The  "driver_override" allows to force the name service associated to
>>     an RPMsg driver, bypassing the rpmsg_device_id based match check.
> 
> You mean, the chinfo driver_override allows the ioctl to specify which
> driver should be bound to the device created for the newly registered
> endpoint?

Yes exactly, this is the main point of the proposal. Having the same RPMsg
driver that can be probed either by the remote side using the NS announcement
mechanism or by the rpmsg ctrl interface.
The driver "just" has to register to the RPMsg ctrl which service it supports.

> 
>>   - At least for virtio bus, an associated ns announcement is sent to the
>>     remote side.  
>>
>> 2) rpmsg char driver: rpmsg_char.c
>>     - The rpmsg class has not been removed. The associated attributes
>>       are already available in /sys/bus/rpmsg/.
> 
> So today a rpmsg_device gets the same attributes both from the class and
> the bus? So the only difference is that there will no longer be a
> /sys/class/rpmsg ?

Yes, if the rpmsg_char is probed by the bus,
My proposal is to suppress attributes in /sys/class/rpmsg as they are already
defined in /sys/bus/rpmsg/devices/
But class attribute can be kept if needed...

Thanks,
Arnaud

> 
> Regards,
> Bjorn
> 
>>     - The eptdev device is now an RPMsg device probed by a RPMsg bus driver
>>       (probed only by the ioctl in rpmsg_char driver).
>>
>> Know current Limitations:
>> - Tested only with virtio RPMsg bus and for one vdev instance.
>> - The glink and smd drivers adaptations have not been tested (not able to test).
>> - To limit commit and not update the IOCT interface some features have been not
>>   implemented in this first step:
>>     - the NS announcement as not been updated, it is not possible to create an
>>       endpoint with a destibnation address set to RPMSG_ADDR_ANY (-1),
>>     - not possible to destroy the channel,
>>     - only the "rpmsg-raw" service is supported.
>>
>> This series can be applied in Bjorn's rpmsg-next branch on top of the
>> RPMsg_ns series(4c0943255805).
>>
>> This series can be tested using rpmsgexport tools available here:
>> https://github.com/andersson/rpmsgexport.
>> ---
>> new from V1[1]:
>> - In V1 the rpmsg_char.c was not impacted, a rpmsg_raw.c has been created
>>   instead.
>> - IOCTL interface as not been updated (to go by steps).
>> - smd and glink drivers has been updated to support channels creation and
>>   release.
>>
>> [1] https://patchwork.kernel.org/project/linux-remoteproc/list/?series=327277
>>
>> Arnaud Pouliquen (16):
>>   rpmsg: introduce RPMsg control driver for channel creation
>>   rpmsg: add RPMsg control API to register service
>>   rpmsg: add override field in channel info
>>   rpmsg: ctrl: implement the ioctl function to create device
>>   rpmsg: ns: initialize channel info override field
>>   rpmsg: add helper to register the rpmsg ctrl device
>>   rpmsg: char: clean up rpmsg class
>>   rpmsg: char: make char rpmsg a rpmsg device without the control part
>>   rpmsg: char: register RPMsg raw service to the ioctl interface.
>>   rpmsg: char: allow only one endpoint per device
>>   rpmsg: char: check destination address is not null
>>   rpmsg: virtio: use the driver_override in channel creation ops
>>   rpmsg: virtio: probe the rpmsg_ctl device
>>   rpmsg: glink: add create and release rpmsg channel ops
>>   rpmsg: smd: add create and release rpmsg channel ops
>>   rpmsg: replace rpmsg_chrdev_register_device use
>>
>>  drivers/rpmsg/Kconfig             |   8 +
>>  drivers/rpmsg/Makefile            |   1 +
>>  drivers/rpmsg/qcom_glink_native.c |  96 +++++++--
>>  drivers/rpmsg/qcom_smd.c          |  59 +++++-
>>  drivers/rpmsg/rpmsg_char.c        | 246 ++++++-----------------
>>  drivers/rpmsg/rpmsg_ctrl.c        | 320 ++++++++++++++++++++++++++++++
>>  drivers/rpmsg/rpmsg_internal.h    |  14 --
>>  drivers/rpmsg/rpmsg_ns.c          |   1 +
>>  drivers/rpmsg/virtio_rpmsg_bus.c  |  38 +++-
>>  include/linux/rpmsg.h             |  40 ++++
>>  include/uapi/linux/rpmsg.h        |  14 ++
>>  11 files changed, 606 insertions(+), 231 deletions(-)
>>  create mode 100644 drivers/rpmsg/rpmsg_ctrl.c
>>
>> -- 
>> 2.17.1
>>
