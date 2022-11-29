Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68AAD63C531
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Nov 2022 17:30:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235959AbiK2Qau (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Nov 2022 11:30:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235972AbiK2Qas (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Nov 2022 11:30:48 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9C4A69317;
        Tue, 29 Nov 2022 08:30:46 -0800 (PST)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ATBx8ML008371;
        Tue, 29 Nov 2022 16:30:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=yxhYxk0RPU/E1U4MDLFbodFueUIdKQyzlmEOFEDZbJs=;
 b=YcBBSniemkK0ZyYV5ClzTLHTVKaUGAkZb2dK6n+hoJmWBvgbeekU9cBip9b079kXHL+w
 Pe/xCn0T+/V3F7qVOqSzRC82SD2pL4IfnKkT8iPt9f7Y5Lu/YGrUuPLzUveBuqSXmH96
 siZr2KYeDec/lkhshyIHpN/EglslIgvWrRauCEa4zxX3bIN7ErYRmJV79/sEkCUMeguV
 kvv8GXwF5DwtaFjNr1868pK6T/d1FkTtHLUQGBFbk2p9UqvYBhCYrZaX7DEefIwDAnwp
 giVM8tSBpKVl0b3ZxuJ/4F+FJ6R6ajEuFVYTcHYAcRhY3qbDulnMqUC21VpytHqlHSdC Bw== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m55m92uje-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 29 Nov 2022 16:30:17 +0000
Received: from nasanex01a.na.qualcomm.com ([10.52.223.231])
        by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2ATGUHMr026977
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 29 Nov 2022 16:30:17 GMT
Received: from asutoshd-linux1.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 29 Nov 2022 08:30:16 -0800
Date:   Tue, 29 Nov 2022 08:30:16 -0800
From:   Asutosh Das <quic_asutoshd@quicinc.com>
To:     Manivannan Sadhasivam <mani@kernel.org>
CC:     <quic_cang@quicinc.com>, <martin.petersen@oracle.com>,
        <linux-scsi@vger.kernel.org>, <quic_nguyenb@quicinc.com>,
        <quic_xiaosenh@quicinc.com>, <stanley.chu@mediatek.com>,
        <eddie.huang@mediatek.com>, <daejun7.park@samsung.com>,
        <bvanassche@acm.org>, <avri.altman@wdc.com>, <beanhuo@micron.com>,
        <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v6 00/16] Add Multi Circular Queue Support
Message-ID: <20221129163016.GG20677@asutoshd-linux1.qualcomm.com>
References: <cover.1669684648.git.quic_asutoshd@quicinc.com>
 <20221129153931.GJ4931@workstation>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20221129153931.GJ4931@workstation>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uJi4FoBmhbyKwKH962RgDr4_mx_Czw0A
X-Proofpoint-GUID: uJi4FoBmhbyKwKH962RgDr4_mx_Czw0A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-29_10,2022-11-29_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 malwarescore=0 mlxscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 mlxlogscore=999 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211290091
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 29 2022 at 07:39 -0800, Manivannan Sadhasivam wrote:
>Hi Asutosh,
>
>On Mon, Nov 28, 2022 at 05:20:41PM -0800, Asutosh Das wrote:
>> UFS Multi-Circular Queue (MCQ) has been added in UFSHCI v4.0 to improve storage performance.
>> The implementation uses the shared tagging mechanism so that tags are shared
>> among the hardware queues. The number of hardware queues is configurable.
>> This series doesn't include the ESI implementation for completion handling.
>> This implementation has been verified by on a Qualcomm platform.
>>
>> Please take a look and let us know your thoughts.
>>
>> v5 -> v6:
>> - Addressed Mani's comments
>> - Addressed Bart's comments
>>
>
>Thanks for the continuous update of the series. In this version, you
>seem to have missed some review tags from myself and Bart. Please
>make sure to collect all tags in the next version if you happen to
>send one.
>
Thanks Mani. I will send an updated series with the tags added today.

-asd

>Thanks,
>Mani
>
>> v4 -> v5:
>> - Fixed failure to fallback to SDB during initialization
>> - Fixed failure when rpm-lvl=5 in the ufshcd_host_reset_and_restore() path
>> - Improved ufshcd_mcq_config_nr_queues() to handle different configurations
>> - Addressed Bart's comments
>> - Verified read/write using FIO, clock gating, runtime-pm[lvl=3, lvl=5]
>>
>> v3 -> v4:
>> - Added a kernel module parameter to disable MCQ mode
>> - Added Bart's reviewed-by tag for some patches
>> - Addressed Bart's comments
>>
>> v2 -> v3:
>> - Split ufshcd_config_mcq() into ufshcd_alloc_mcq() and ufshcd_config_mcq()
>> - Use devm_kzalloc() in ufshcd_mcq_init()
>> - Free memory and resource allocation on error paths
>> - Corrected typos in code comments
>>
>> v1 -> v2:
>> - Added a non MCQ related change to use a function to extrace ufs extended
>> feature
>> - Addressed Mani's comments
>> - Addressed Bart's comments
>>
>> v1:
>> - Split the changes
>> - Addressed Bart's comments
>> - Addressed Bean's comments
>>
>> * RFC versions:
>> v2 -> v3:
>> - Split the changes based on functionality
>> - Addressed queue configuration issues
>> - Faster SQE tail pointer increments
>> - Addressed comments from Bart and Manivannan
>>
>> v1 -> v2:
>> - Enabled host_tagset
>> - Added queue num configuration support
>> - Added one more vops to allow vendor provide the wanted MAC
>> - Determine nutrs and can_queue by considering both MAC, bqueuedepth and EXT_IID support
>> - Postponed MCQ initialization and scsi_add_host() to async probe
>> - Used (EXT_IID, Task Tag) tuple to support up to 4096 tasks (theoretically)
>>
>>
>> Asutosh Das (16):
>>   ufs: core: Optimize duplicate code to read extended feature
>>   ufs: core: Probe for ext_iid support
>>   ufs: core: Introduce Multi-circular queue capability
>>   ufs: core: Defer adding host to scsi if mcq is supported
>>   ufs: core: mcq: Add support to allocate multiple queues
>>   ufs: core: mcq: Configure resource regions
>>   ufs: core: mcq: Calculate queue depth
>>   ufs: core: mcq: Allocate memory for mcq mode
>>   ufs: core: mcq: Configure operation and runtime interface
>>   ufs: core: mcq: Use shared tags for MCQ mode
>>   ufs: core: Prepare ufshcd_send_command for mcq
>>   ufs: core: mcq: Find hardware queue to queue request
>>   ufs: core: Prepare for completion in mcq
>>   ufs: mcq: Add completion support of a cqe
>>   ufs: core: mcq: Add completion support in poll
>>   ufs: core: mcq: Enable Multi Circular Queue
>>
>>  drivers/ufs/core/Makefile      |   2 +-
>>  drivers/ufs/core/ufs-mcq.c     | 416 +++++++++++++++++++++++++++++++++++++++++
>>  drivers/ufs/core/ufshcd-priv.h |  92 ++++++++-
>>  drivers/ufs/core/ufshcd.c      | 395 +++++++++++++++++++++++++++++++-------
>>  drivers/ufs/host/ufs-qcom.c    | 148 +++++++++++++++
>>  drivers/ufs/host/ufs-qcom.h    |   5 +
>>  include/ufs/ufs.h              |   6 +
>>  include/ufs/ufshcd.h           | 128 +++++++++++++
>>  include/ufs/ufshci.h           |  64 +++++++
>>  9 files changed, 1189 insertions(+), 67 deletions(-)
>>  create mode 100644 drivers/ufs/core/ufs-mcq.c
>>
>> --
>> 2.7.4
>>
