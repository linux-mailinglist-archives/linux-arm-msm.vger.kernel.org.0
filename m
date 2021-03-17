Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 616CB33ED02
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Mar 2021 10:30:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbhCQJaD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Mar 2021 05:30:03 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:53434 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229767AbhCQJ35 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Mar 2021 05:29:57 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12H9S06s031684;
        Wed, 17 Mar 2021 10:29:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Le1/WIhRpOp/ydvOjnIkwYsdhvrXsLOvyzCD4qnBVGU=;
 b=YHd4sDnPvmw58ZMLHm4SEAbGjOiwJ1Ynd0sDrG9sgwMxLckk/et06866GXXKdel9omdX
 lfXhti+26/7o8LkxdQS5QSkghVg5M79jItn86LxKE7D5RE1bl4ggKxIsQRqkyLn1GrcQ
 HQUDPYOTmA1h0yJKVIUWu+0dPLr2iqPJJzvFmo1v7zWCxOAHsWvgTn4POTljWcL2ibag
 juD0zycNXTC2bgdHCewbjN2EZP99CDUjE5Bg3r83RgRYT7mQdw3tqUUrNUUI8nTyu484
 MwRh6AMwH66Ofo33VIK+oUc0F9iQlSEYOP9KXwBu2lMDn0ZuJXDfnXodX6LsNkBivLoR Zg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 37agam9pd2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 17 Mar 2021 10:29:50 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 52ADA100034;
        Wed, 17 Mar 2021 10:29:49 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0528821E665;
        Wed, 17 Mar 2021 10:29:49 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.50) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 17 Mar
 2021 10:29:48 +0100
Subject: Re: [PATCH v5 00/16] introduce a generic IOCTL interface for RPMsg
 channels management
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>
References: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <8599da66-b7df-e4a5-fcf3-008620420372@foss.st.com>
Date:   Wed, 17 Mar 2021 10:29:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-17_05:2021-03-17,2021-03-17 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/19/21 12:14 PM, Arnaud Pouliquen wrote:
> This series restructures the RPMsg char driver to decorrelate the control part and to
> create a generic RPMsg ioctl interface compatible with other RPMsg services.
> 
> The V4 and V5 fix compilation issues reported by the kernel test robot <lkp@intel.com>
> and analyzed by Dan Carpenter <dan.carpenter@oracle.com>.
> 
> The V3 is based on the guideline proposed by Mathieu Poirier to keep as much as possible
> the legacy implementation of the rpmsg_char used by the GLINK and SMD platforms.
> 
> Objectives of the series:
> - Allow to create a service from Linux user application:
>   - with a specific name
>   - with or without name service announcement.
> - Allow to probe the same service by receiving either a NS announcement from the remote firmware
>   or a Linux user application request.
> - Use these services independently of the RPMsg transport implementation (e.g be able to use
>   RPMSg char with the RPMsg virtio bus).
> 
> Steps in the series:
>   - Extract the control part of the char dev and create the rpmsg_ctrl.c file (patches 1 to 6)
>   - Enable the use of the chardev with the virtio backend (patches 7 to 11)
>   - Introduce the RPMSG_CREATE_DEV_IOCTL IOCTL to instantiate RPMsg devices (patch 12)
>     The application can then create or release a channel by specifying:
>        - the name service of the device to instantiate.   
>        - the source address.
>        - the destination address.
>   - Instantiate the /dev/rpmsg interface on remote NS announcement (patches 13 to 16)
> 
> In this revision, I do not divide the series into several parts in order to show a complete
> picture of the proposed evolution. To simplify the review, if requested, I can send it in
> several steps listed above.

No new revision of this series planned, but move forward by splitting it in 3
new series to ease the review.
The first step is addressed here:
https://patchwork.kernel.org/project/linux-remoteproc/list/?series=446305

> 
> Known current Limitations:
> - Tested only with virtio RPMsg bus. The glink and smd drivers adaptations have not been tested
>   (not able to test it).
> - For the virtio backend: No NS announcement is sent to the remote processor if the source
>   address is set to RPMSG_ADDR_ANY.
> - For the virtio backend: the existing RPMSG_CREATE_EPT_IOCTL is working but the endpoints are
>   not attached to an exiting channel.
> - to limit patches the pending RPMSG_DESTROY_DEV_IOCTL has not ben implemented. This will be
>   proposed in a second step.
> 
> This series can be applied on git/andersson/remoteproc.git for-next branch (d9ff3a5789cb).
> 
> This series can be tested using rpmsgexport, rpmsgcreatedev and ping tools available here:
> https://github.com/arnopo/rpmsgexport.git
> 
> Reference to the V4 discussion thread: https://lkml.org/lkml/2021/2/17/384
> 
> Arnaud Pouliquen (16):
>   rpmsg: char: rename rpmsg_char_init to rpmsg_chrdev_init
>   rpmsg: move RPMSG_ADDR_ANY in user API
>   rpmsg: add short description of the IOCTL defined in UAPI.
>   rpmsg: char: export eptdev create an destroy functions
>   rpmsg: char: dissociate the control device from the rpmsg class
>   rpmsg: move the rpmsg control device from rpmsg_char to rpmsg_ctrl
>   rpmsg: update rpmsg_chrdev_register_device function
>   rpmsg: glink: add sendto and trysendto ops
>   rpmsg: smd: add sendto and trysendto ops
>   rpmsg: char: use sendto to specify the message destination address
>   rpmsg: virtio: register the rpmsg_ctrl device
>   rpmsg: ctrl: introduce RPMSG_CREATE_DEV_IOCTL
>   rpmsg: char: introduce __rpmsg_chrdev_create_eptdev function
>   rpmsg: char: introduce a RPMsg driver for the RPMsg char device
>   rpmsg: char: no dynamic endpoint management for the default one
>   rpmsg: char: return an error if device already open
> 
>  drivers/rpmsg/Kconfig             |   9 ++
>  drivers/rpmsg/Makefile            |   1 +
>  drivers/rpmsg/qcom_glink_native.c |  18 ++-
>  drivers/rpmsg/qcom_smd.c          |  18 ++-
>  drivers/rpmsg/rpmsg_char.c        | 237 +++++++++++-------------------
>  drivers/rpmsg/rpmsg_char.h        |  51 +++++++
>  drivers/rpmsg/rpmsg_ctrl.c        | 229 +++++++++++++++++++++++++++++
>  drivers/rpmsg/rpmsg_internal.h    |  10 +-
>  drivers/rpmsg/virtio_rpmsg_bus.c  |  57 ++++++-
>  include/linux/rpmsg.h             |   3 +-
>  include/uapi/linux/rpmsg.h        |  18 ++-
>  11 files changed, 485 insertions(+), 166 deletions(-)
>  create mode 100644 drivers/rpmsg/rpmsg_char.h
>  create mode 100644 drivers/rpmsg/rpmsg_ctrl.c
> 
