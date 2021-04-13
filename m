Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 302A735D870
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Apr 2021 09:02:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237019AbhDMHCh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Apr 2021 03:02:37 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:34272 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236895AbhDMHCg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Apr 2021 03:02:36 -0400
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13D6uM6d023631;
        Tue, 13 Apr 2021 09:02:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=7UbdKKMjXFg4ypYx825ZeIdiHUiAyvlWtyfpJeemBIk=;
 b=hF+dpteLGIselyWHyuc8KmnGvuTcVXR8dgMJzLQR5xuZOV9mAYmrs3t4jtdre29X/k9Z
 r+yoK338urOKQZlLKwHljlTzlWvZzkJJ9IExl1/8BtDnZpsgEUBjcGmXRfxrfa46BzLq
 i2XuzWYyhGas1ONEFDG0/DqoBul8DLccFK7YxIi83UPESI5M58chQlOOZy+TAENmhkcE
 7UdCd8pKX/1L+qtUBHddvV1B5uJF+MtBGMXk2aUzcmniJ5uuZ5NfQAfQ8pe2juMB8Dbx
 cmr3emEBrYXlWqTZoWf1e/t58feYHJN+T7Rsjbha2T6SCejGoHCbIJPcnrze+4LwC0Bc 6A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 37vrp5bq84-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 13 Apr 2021 09:02:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6EB5A10002A;
        Tue, 13 Apr 2021 09:02:10 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5696B2196A6;
        Tue, 13 Apr 2021 09:02:10 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 13 Apr
 2021 09:02:09 +0200
Subject: Re: [PATCH 0/7] Restructure the rpmsg char and introduce the
 rpmsg-raw channel
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Andy Gross <agross@kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>
References: <20210323122737.23035-1-arnaud.pouliquen@foss.st.com>
 <20210412200245.GB582352@xps15>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <5cd3bd32-1539-371e-c8e4-10870fc20d22@foss.st.com>
Date:   Tue, 13 Apr 2021 09:02:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210412200245.GB582352@xps15>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-13_03:2021-04-13,2021-04-13 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Mathieu,

On 4/12/21 10:02 PM, Mathieu Poirier wrote:
> On Tue, Mar 23, 2021 at 01:27:30PM +0100, Arnaud Pouliquen wrote:
>> This series is the second step in the division of the series [1]: 
>> "Introducing a Generic IOCTL Interface for RPMsg Channel Management".
>>
>> The purpose of this patchset is to:
>> - split the control code related to the control
>>   and the endpoint. 
>> - define the rpmsg-raw channel, associated with the rpmsg char device to
>>   allow it to be instantiated using a name service announcement.
>>     
>> An important point to keep in mind for this patchset is that the concept of
>> channel is associated with a default endpoint. To facilitate communication
>> with the remote side, this default endpoint must have a fixed address.
>>
>> Consequently, for this series, I made a design choice to fix the endpoint
>> on the "rpmsg-raw" channel probe, and not allow to create/destroy an endpoint
>> on FS open/close.
>>
>> This is only applicable for channels probed by the rpmsg bus. The behavior,
>> using the RPMSG_CREATE_EPT_IOCTL and RPMSG_DESTROY_EPT_IOCTL controls, is
>> preserved.
>>   
>> The next steps should be to correct this:
>> Introduce the IOCTLs RPMSG_CREATE_DEV_IOCTL and RPMSG_DESTROY_DEV_IOCTL
>> to instantiate the rpmsg devices
>>
>> [1]: https://patchwork.kernel.org/project/linux-remoteproc/list/?series=435523
>>
>> Arnaud Pouliquen (7):
>>   rpmsg: char: Export eptdev create an destroy functions
>>   rpmsg: Move the rpmsg control device from rpmsg_char to rpmsg_ctrl
>>   rpmsg: Update rpmsg_chrdev_register_device function
>>   rpmsg: char: Introduce __rpmsg_chrdev_create_eptdev function
>>   rpmsg: char: Introduce a rpmsg driver for the rpmsg char device
>>   rpmsg: char: No dynamic endpoint management for the default one
>>   rpmsg: char: Return error if user try to destroy a default endpoint.
>>
> 
> I am done reviewing this set.

Thanks for the review! I will integrate all your remarks in my next revision.
Since I haven't seen any major problems, I hope to send it today or tomorrow.

Regards,
Arnaud

> 
> Thanks,
> Mathieu
>  
>>  drivers/rpmsg/Kconfig             |   9 ++
>>  drivers/rpmsg/Makefile            |   1 +
>>  drivers/rpmsg/qcom_glink_native.c |   2 +-
>>  drivers/rpmsg/qcom_smd.c          |   2 +-
>>  drivers/rpmsg/rpmsg_char.c        | 221 +++++++++-------------------
>>  drivers/rpmsg/rpmsg_char.h        |  50 +++++++
>>  drivers/rpmsg/rpmsg_ctrl.c        | 233 ++++++++++++++++++++++++++++++
>>  drivers/rpmsg/rpmsg_internal.h    |   8 +-
>>  drivers/rpmsg/virtio_rpmsg_bus.c  |   2 +-
>>  9 files changed, 368 insertions(+), 160 deletions(-)
>>  create mode 100644 drivers/rpmsg/rpmsg_char.h
>>  create mode 100644 drivers/rpmsg/rpmsg_ctrl.c
>>
>> -- 
>> 2.17.1
>>
