Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65CFE31EF7A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Feb 2021 20:16:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232823AbhBRTOu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Feb 2021 14:14:50 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:45526 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S234821AbhBRRx4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Feb 2021 12:53:56 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11IHpepq004881;
        Thu, 18 Feb 2021 18:52:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=XODayXtjSQ8qofzvOfGATQFA0V7gz/yaN0JIYBsK+cY=;
 b=JWDvVsYkU4wO3UVeVliMiM9ZUzRGkLUwXdUvmgr8TyNKc7CD3Cj7hSEKh7EV5gCXP7bA
 qJpAoP/GVbNDZGZENZZUh3KFCJcj3jCVCgjCY1AFs6CtksjA7bj/nythFokXORckyfLS
 oxqKUM9gLwxu5Z0tuHtfhNDowwU0AGAq9ImubXXEPgYLsbw3UuL6e6L6OPA6ysbv5myK
 mJeW1cEkROBfQDzIYYvYugTVFU4II0cJvcqqI+hpaBXy4pHbFHBgg1VC+tO/HiRpj/ou
 xr7NrFQg858EDsmWVmJhFJ90kzu8pWxdH4oTcYOd5axItl2QD3wxOYIoLSHBPn6aCzga OQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 36p6hq029x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 18 Feb 2021 18:52:46 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 11E9610002A;
        Thu, 18 Feb 2021 18:52:45 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E34FE2C41F6;
        Thu, 18 Feb 2021 18:52:44 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 18 Feb
 2021 18:52:44 +0100
Subject: Re: [PATCH v4 14/16] rpmsg: char: introduce a RPMsg driver for the
 RPMsg char device
To:     Dan Carpenter <dan.carpenter@oracle.com>, <kbuild@lists.01.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
CC:     <lkp@intel.com>, <kbuild-all@lists.01.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>
References: <20210218123333.GK2087@kadam>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <dbfb7ced-bc0c-5e47-a937-3fe07a4129bf@foss.st.com>
Date:   Thu, 18 Feb 2021 18:52:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210218123333.GK2087@kadam>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-02-18_09:2021-02-18,2021-02-18 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dan,

On 2/18/21 1:33 PM, Dan Carpenter wrote:
> Hi Arnaud,
> 
> url:    https://github.com/0day-ci/linux/commits/Arnaud-Pouliquen/introduce-a-generic-IOCTL-interface-for-RPMsg-channels-management/20210217-214044
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git f40ddce88593482919761f74910f42f4b84c004b
> config: riscv-randconfig-m031-20210215 (attached as .config)
> compiler: riscv32-linux-gcc (GCC) 9.3.0
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> smatch warnings:
> drivers/rpmsg/rpmsg_char.c:429 rpmsg_chrdev_probe() error: we previously assumed 'rpdev->ept' could be null (see line 423)
> 
> vim +429 drivers/rpmsg/rpmsg_char.c
> 
> 7337f30f7a4426 Arnaud Pouliquen 2021-02-17  413  static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
> 7337f30f7a4426 Arnaud Pouliquen 2021-02-17  414  {
> 7337f30f7a4426 Arnaud Pouliquen 2021-02-17  415  	struct rpmsg_channel_info chinfo;
> 7337f30f7a4426 Arnaud Pouliquen 2021-02-17  416  	struct rpmsg_eptdev *eptdev;
> 7337f30f7a4426 Arnaud Pouliquen 2021-02-17  417  
> 7337f30f7a4426 Arnaud Pouliquen 2021-02-17  418  	memcpy(chinfo.name, RPMSG_CHAR_DEVNAME, sizeof(RPMSG_CHAR_DEVNAME));
> 7337f30f7a4426 Arnaud Pouliquen 2021-02-17  419  	chinfo.src = rpdev->src;
> 7337f30f7a4426 Arnaud Pouliquen 2021-02-17  420  	chinfo.dst = rpdev->dst;
> 7337f30f7a4426 Arnaud Pouliquen 2021-02-17  421  
> 7337f30f7a4426 Arnaud Pouliquen 2021-02-17  422  	eptdev = __rpmsg_chrdev_create_eptdev(rpdev, &rpdev->dev, chinfo);
> 7337f30f7a4426 Arnaud Pouliquen 2021-02-17 @423  	if (IS_ERR(eptdev) && rpdev->ept) {
>                                                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> This condition is strange.

> 
> 7337f30f7a4426 Arnaud Pouliquen 2021-02-17  424  		rpmsg_destroy_ept(rpdev->ept);
>                                                                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> What?  Why are we undoing this when it's not something that we created?
> This seems like a layering violation...

Right,something is not clean here, I need to crosscheck, but should be
	if (IS_ERR(eptdev) && ) {
		return PTR_ERR(eptdev);
	}
The endpoint is already destroyed by rpmsg_dev_probe on error.

> 
> 7337f30f7a4426 Arnaud Pouliquen 2021-02-17  425  		return PTR_ERR(eptdev);
> 7337f30f7a4426 Arnaud Pouliquen 2021-02-17  426  	}
> 7337f30f7a4426 Arnaud Pouliquen 2021-02-17  427  
> 7337f30f7a4426 Arnaud Pouliquen 2021-02-17  428  	/* Set the private field of the default endpoint to retrieve context on callback. */
> 7337f30f7a4426 Arnaud Pouliquen 2021-02-17 @429  	rpdev->ept->priv = eptdev;
>                                                         ^^^^^^^^^^^^^^^^^^^^^^^^^
> If "rpdev->ept" is NULL this will Oops.  If "eptdev" is an error pointer
> that seems wrong as well.

rpdev->ept is set in rpmsg_dev_probe as the callback is defined so can not be
null, so probably a false positive here.
eptdev can not be an error pointer here for the same reason.

Anyway adding a check on the pointer, is not a big work and can prevent from
future issue.

As consequence of you multi-reports I have installed your smatch tool on my PC
and added it in my compilation chain. :)

Thanks for the review and the tool,
Arnaud

> 
> 7337f30f7a4426 Arnaud Pouliquen 2021-02-17  430  
> 7337f30f7a4426 Arnaud Pouliquen 2021-02-17  431  	return 0;
> 7337f30f7a4426 Arnaud Pouliquen 2021-02-17  432  }
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 
