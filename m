Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD76263B705
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Nov 2022 02:21:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233590AbiK2BVb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Nov 2022 20:21:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234981AbiK2BV3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Nov 2022 20:21:29 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE6FF3F061;
        Mon, 28 Nov 2022 17:21:27 -0800 (PST)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AT11Ygo008924;
        Tue, 29 Nov 2022 01:21:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=z5v1JIPKe9c6KpBK63Fi+uSKIiyGtMpBRb6q6Uhj854=;
 b=bAxhmaUG7hgW5dc598JkJm5aUu2fHArei3OtKa8SsmBIcWfVOPwYObLlw+u+6FYGHjow
 zCkjzRq1y9mJHD0aPG+zpR8lZlO96P/64AJxSToJJq9h5eufLUgTQnGEpiokMC5kkS/8
 sfSJcUumQtfnmEs7xbH8znzHqgXuFRYSCrhzoT7rSa+CqH/OTFqB/4gaf8MRL2gsOD3K
 lTZDibxeQB2gKY3JV/wNj2rRUCyRYlnf6lWh3KtigXzJ7dWX4y43S/oTJAY18hsPEkky
 ygtapy5LSPzcn1ekiHFvhViYzQl8dd7NAB5+W9LT4g5vgbHk8pbwqnSzES68owfwXkwN Ww== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m3aw35fk6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 29 Nov 2022 01:21:15 +0000
Received: from nasanex01a.na.qualcomm.com (corens_vlan604_snip.qualcomm.com [10.53.140.1])
        by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AT1LEHs023681
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 29 Nov 2022 01:21:14 GMT
Received: from asutoshd-linux1.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 28 Nov 2022 17:21:14 -0800
From:   Asutosh Das <quic_asutoshd@quicinc.com>
To:     <quic_cang@quicinc.com>, <martin.petersen@oracle.com>,
        <linux-scsi@vger.kernel.org>
CC:     <quic_nguyenb@quicinc.com>, <quic_xiaosenh@quicinc.com>,
        <stanley.chu@mediatek.com>, <eddie.huang@mediatek.com>,
        <daejun7.park@samsung.com>, <bvanassche@acm.org>,
        <avri.altman@wdc.com>, <mani@kernel.org>, <beanhuo@micron.com>,
        Asutosh Das <quic_asutoshd@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v6 00/16] Add Multi Circular Queue Support 
Date:   Mon, 28 Nov 2022 17:20:41 -0800
Message-ID: <cover.1669684648.git.quic_asutoshd@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: S8JTNw9HSDeooM5PSsaLyUmMVlsvUmQX
X-Proofpoint-GUID: S8JTNw9HSDeooM5PSsaLyUmMVlsvUmQX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-28_17,2022-11-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211290006
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

UFS Multi-Circular Queue (MCQ) has been added in UFSHCI v4.0 to improve storage performance.
The implementation uses the shared tagging mechanism so that tags are shared
among the hardware queues. The number of hardware queues is configurable.
This series doesn't include the ESI implementation for completion handling.
This implementation has been verified by on a Qualcomm platform.

Please take a look and let us know your thoughts.

v5 -> v6:
- Addressed Mani's comments
- Addressed Bart's comments

v4 -> v5:
- Fixed failure to fallback to SDB during initialization
- Fixed failure when rpm-lvl=5 in the ufshcd_host_reset_and_restore() path
- Improved ufshcd_mcq_config_nr_queues() to handle different configurations
- Addressed Bart's comments
- Verified read/write using FIO, clock gating, runtime-pm[lvl=3, lvl=5]

v3 -> v4:
- Added a kernel module parameter to disable MCQ mode
- Added Bart's reviewed-by tag for some patches
- Addressed Bart's comments

v2 -> v3:
- Split ufshcd_config_mcq() into ufshcd_alloc_mcq() and ufshcd_config_mcq()
- Use devm_kzalloc() in ufshcd_mcq_init()
- Free memory and resource allocation on error paths
- Corrected typos in code comments

v1 -> v2:
- Added a non MCQ related change to use a function to extrace ufs extended
feature
- Addressed Mani's comments
- Addressed Bart's comments

v1:
- Split the changes
- Addressed Bart's comments
- Addressed Bean's comments

* RFC versions:
v2 -> v3:
- Split the changes based on functionality
- Addressed queue configuration issues
- Faster SQE tail pointer increments
- Addressed comments from Bart and Manivannan

v1 -> v2:
- Enabled host_tagset
- Added queue num configuration support
- Added one more vops to allow vendor provide the wanted MAC
- Determine nutrs and can_queue by considering both MAC, bqueuedepth and EXT_IID support
- Postponed MCQ initialization and scsi_add_host() to async probe
- Used (EXT_IID, Task Tag) tuple to support up to 4096 tasks (theoretically)


Asutosh Das (16):
  ufs: core: Optimize duplicate code to read extended feature
  ufs: core: Probe for ext_iid support
  ufs: core: Introduce Multi-circular queue capability
  ufs: core: Defer adding host to scsi if mcq is supported
  ufs: core: mcq: Add support to allocate multiple queues
  ufs: core: mcq: Configure resource regions
  ufs: core: mcq: Calculate queue depth
  ufs: core: mcq: Allocate memory for mcq mode
  ufs: core: mcq: Configure operation and runtime interface
  ufs: core: mcq: Use shared tags for MCQ mode
  ufs: core: Prepare ufshcd_send_command for mcq
  ufs: core: mcq: Find hardware queue to queue request
  ufs: core: Prepare for completion in mcq
  ufs: mcq: Add completion support of a cqe
  ufs: core: mcq: Add completion support in poll
  ufs: core: mcq: Enable Multi Circular Queue

 drivers/ufs/core/Makefile      |   2 +-
 drivers/ufs/core/ufs-mcq.c     | 416 +++++++++++++++++++++++++++++++++++++++++
 drivers/ufs/core/ufshcd-priv.h |  92 ++++++++-
 drivers/ufs/core/ufshcd.c      | 395 +++++++++++++++++++++++++++++++-------
 drivers/ufs/host/ufs-qcom.c    | 148 +++++++++++++++
 drivers/ufs/host/ufs-qcom.h    |   5 +
 include/ufs/ufs.h              |   6 +
 include/ufs/ufshcd.h           | 128 +++++++++++++
 include/ufs/ufshci.h           |  64 +++++++
 9 files changed, 1189 insertions(+), 67 deletions(-)
 create mode 100644 drivers/ufs/core/ufs-mcq.c

-- 
2.7.4

