Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C96E715940F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2020 16:57:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728519AbgBKP5l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Feb 2020 10:57:41 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:19470 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728389AbgBKP5l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Feb 2020 10:57:41 -0500
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01BFgiWh005066;
        Tue, 11 Feb 2020 16:57:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=bbFYX6l2oHqcB37HwIrG102ruoCSat6PEqciFlehfTo=;
 b=PKySJ8G8AbrJ4k583iDjQs5mLCntymoL0h/H00hNilX+pwgwuQ2Y3AM2dzjvJS4kEKof
 wBxUShCEKlPOAdYvT0452DmMw1ng8n4h3Ey9HKxwVYVoHS7i0vq5YJjaGQM29EzKMfSe
 otegXhwK+aJeZ5YCKBCW0OlkS94QYtBbrNzBEk9IAqCC0znPOihKq2852TEwpMu3UxO0
 09yiRVJk7CfMny2D48ELea1BddTYrDxvAfSp+56dgCNXgxmhqC78b5AqSgUA3WIZ8Y0v
 mVnb2rdOAdOXi77/pkSBhz7PZTqFBFMl5NvtUiIgB+RzLYWOE+NnzeJnPTw8cupkUu0a zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2y1urh6kvb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 11 Feb 2020 16:57:24 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9A09910003B;
        Tue, 11 Feb 2020 16:57:19 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7B11D2C2801;
        Tue, 11 Feb 2020 16:57:19 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.44) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 11 Feb
 2020 16:57:18 +0100
Subject: Re: [PATCH v4 0/5] remoteproc: Add elf64 support
To:     Clement Leger <cleger@kalray.eu>, Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        <linux-remoteproc@vger.kernel.org>
CC:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andy Gross <agross@kernel.org>,
        Patrice Chotard <patrice.chotard@st.com>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>,
        Loic PALLARDY <loic.pallardy@st.com>, s-anna <s-anna@ti.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
References: <527785289.2852303.1581062223707.JavaMail.zimbra@kalray.eu>
 <20200210162209.23149-1-cleger@kalray.eu>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <5b8045be-0942-2ecf-5dba-dad58071f6af@st.com>
Date:   Tue, 11 Feb 2020 16:57:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200210162209.23149-1-cleger@kalray.eu>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-11_04:2020-02-10,2020-02-11 signatures=0
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Clement,

I tested the series on the stm32 platform for remote proc firmwre load: no regression found.
I do not test the da_to_va feature as not implemented on stm32 platform.

Regards,
Arnaud



On 2/10/20 5:22 PM, Clement Leger wrote:
> This serie add support for elf64 in remoteproc (elf loader, coredump). 
> First two patches modifies the type of len argument (in da_to_va) and
> boot_addr in order to allow loading elf64 segment with a u64 size
> and a u64 entry point.
> Next patch introduce a set of macros to access elf64 and elf32
> transparently.
> Last two patches are the actual modification in the elf loader and
> remoteproc coredump support to add elf64 support.
> 
> Changes from V3:
>  - Adapt coredump to elf64 file format
>  - Rename remoteproc_elf_loader.h to remoteproc_elf_helpers.h
>  - Update copyright year in remoteproc_elf_helpers.h
>  - Rename macros elf_hdr_* to elf_get_hdr_* for coherency with elf_hdr_set_*
>  - Split elf64 loader patch in 3:
>    - boot_addr u64 change
>    - remoteproc_elf_helpers.h creation
>    - elf64 loading
> 
> Clement Leger (5):
>   remoteproc: Use u64 len for da_to_va
>   remoteproc: Use u64 type for boot_addr
>   remoteproc: Add elf helpers to access elf64 and elf32 fields
>   remoteproc: Add elf64 support in elf loader
>   remoteproc: Adapt coredump to generate correct elf type
> 
>  Documentation/remoteproc.txt                |   2 +-
>  drivers/remoteproc/imx_rproc.c              |  11 +-
>  drivers/remoteproc/keystone_remoteproc.c    |   4 +-
>  drivers/remoteproc/qcom_q6v5_adsp.c         |   2 +-
>  drivers/remoteproc/qcom_q6v5_mss.c          |   2 +-
>  drivers/remoteproc/qcom_q6v5_pas.c          |   2 +-
>  drivers/remoteproc/qcom_q6v5_wcss.c         |   2 +-
>  drivers/remoteproc/qcom_wcnss.c             |   2 +-
>  drivers/remoteproc/remoteproc_core.c        |  69 +++++++------
>  drivers/remoteproc/remoteproc_elf_helpers.h |  95 ++++++++++++++++++
>  drivers/remoteproc/remoteproc_elf_loader.c  | 150 ++++++++++++++++++----------
>  drivers/remoteproc/remoteproc_internal.h    |   4 +-
>  drivers/remoteproc/st_remoteproc.c          |   2 +-
>  drivers/remoteproc/st_slim_rproc.c          |   4 +-
>  drivers/remoteproc/wkup_m3_rproc.c          |   4 +-
>  include/linux/remoteproc.h                  |   7 +-
>  16 files changed, 252 insertions(+), 110 deletions(-)
>  create mode 100644 drivers/remoteproc/remoteproc_elf_helpers.h
> 
