Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4795115A30F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2020 09:15:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728383AbgBLIPk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Feb 2020 03:15:40 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:4542 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728109AbgBLIPk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Feb 2020 03:15:40 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01C8E565008026;
        Wed, 12 Feb 2020 09:15:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=PtC6MNcf5VPs91Jldvobvz5GRjrwYDD84llnPUFRTL0=;
 b=fLOmkqx94vwZALx+mLsgvtHIr0HUe1cy2XPFcoRq/OGj8RfZPNe/0NtjNzT7mjnPzGKs
 fYiiua5hrBMKV3MUONUDB+gRAg6EkgbcQNJ5wTLQ0iQFHIGPILin7PC3at4HRHN1Yyhi
 R3dCv/56cWP8qThjbbPC94tDPiUVPiwPYlKpFK7mK5hI2p8bVd0PENBEDarz8UL2tF9V
 yjHpWrHLGZRq6C7bBBdFJrJACXi+OCwx1pXQfk2MjTS57fxsJxaKNx6XhMG9FWO4w/kN
 P0BGAkLLjJNkC/JNq2XzpInfWM02EPZoXtyEbvcQfOEETYFSgMgDqqFv2KE8PD65eqoJ Tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2y1uvdmhmx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 12 Feb 2020 09:15:22 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DCCAE10002A;
        Wed, 12 Feb 2020 09:15:21 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BFBE3220BCC;
        Wed, 12 Feb 2020 09:15:21 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.46) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 12 Feb
 2020 09:15:20 +0100
Subject: Re: [PATCH v4 0/5] remoteproc: Add elf64 support
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Clement Leger <cleger@kalray.eu>, Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        <linux-remoteproc@vger.kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andy Gross <agross@kernel.org>,
        Patrice Chotard <patrice.chotard@st.com>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>,
        Loic PALLARDY <loic.pallardy@st.com>, s-anna <s-anna@ti.com>
References: <527785289.2852303.1581062223707.JavaMail.zimbra@kalray.eu>
 <20200210162209.23149-1-cleger@kalray.eu>
 <5b8045be-0942-2ecf-5dba-dad58071f6af@st.com> <20200211231253.GC27770@xps15>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <8fa9ed3c-240f-1b82-913e-a4393013d333@st.com>
Date:   Wed, 12 Feb 2020 09:15:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200211231253.GC27770@xps15>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-12_02:2020-02-11,2020-02-12 signatures=0
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/12/20 12:12 AM, Mathieu Poirier wrote:
> On Tue, Feb 11, 2020 at 04:57:18PM +0100, Arnaud POULIQUEN wrote:
>> Hi Clement,
>>
>> I tested the series on the stm32 platform for remote proc firmwre load: no regression found.
>> I do not test the da_to_va feature as not implemented on stm32 platform.
> 
> It would be very interesting if you could test the coredump, that would give us
> a lot more confidence in the implementation.
I also tested the coredump generation. LGTM

> 
> Thanks,
> Mathieu
> 
>>
>> Regards,
>> Arnaud
>>
>>
>>
>> On 2/10/20 5:22 PM, Clement Leger wrote:
>>> This serie add support for elf64 in remoteproc (elf loader, coredump). 
>>> First two patches modifies the type of len argument (in da_to_va) and
>>> boot_addr in order to allow loading elf64 segment with a u64 size
>>> and a u64 entry point.
>>> Next patch introduce a set of macros to access elf64 and elf32
>>> transparently.
>>> Last two patches are the actual modification in the elf loader and
>>> remoteproc coredump support to add elf64 support.
>>>
>>> Changes from V3:
>>>  - Adapt coredump to elf64 file format
>>>  - Rename remoteproc_elf_loader.h to remoteproc_elf_helpers.h
>>>  - Update copyright year in remoteproc_elf_helpers.h
>>>  - Rename macros elf_hdr_* to elf_get_hdr_* for coherency with elf_hdr_set_*
>>>  - Split elf64 loader patch in 3:
>>>    - boot_addr u64 change
>>>    - remoteproc_elf_helpers.h creation
>>>    - elf64 loading
>>>
>>> Clement Leger (5):
>>>   remoteproc: Use u64 len for da_to_va
>>>   remoteproc: Use u64 type for boot_addr
>>>   remoteproc: Add elf helpers to access elf64 and elf32 fields
>>>   remoteproc: Add elf64 support in elf loader
>>>   remoteproc: Adapt coredump to generate correct elf type
>>>
>>>  Documentation/remoteproc.txt                |   2 +-
>>>  drivers/remoteproc/imx_rproc.c              |  11 +-
>>>  drivers/remoteproc/keystone_remoteproc.c    |   4 +-
>>>  drivers/remoteproc/qcom_q6v5_adsp.c         |   2 +-
>>>  drivers/remoteproc/qcom_q6v5_mss.c          |   2 +-
>>>  drivers/remoteproc/qcom_q6v5_pas.c          |   2 +-
>>>  drivers/remoteproc/qcom_q6v5_wcss.c         |   2 +-
>>>  drivers/remoteproc/qcom_wcnss.c             |   2 +-
>>>  drivers/remoteproc/remoteproc_core.c        |  69 +++++++------
>>>  drivers/remoteproc/remoteproc_elf_helpers.h |  95 ++++++++++++++++++
>>>  drivers/remoteproc/remoteproc_elf_loader.c  | 150 ++++++++++++++++++----------
>>>  drivers/remoteproc/remoteproc_internal.h    |   4 +-
>>>  drivers/remoteproc/st_remoteproc.c          |   2 +-
>>>  drivers/remoteproc/st_slim_rproc.c          |   4 +-
>>>  drivers/remoteproc/wkup_m3_rproc.c          |   4 +-
>>>  include/linux/remoteproc.h                  |   7 +-
>>>  16 files changed, 252 insertions(+), 110 deletions(-)
>>>  create mode 100644 drivers/remoteproc/remoteproc_elf_helpers.h
>>>
