Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A1706067BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Oct 2022 20:05:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbiJTSFJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Oct 2022 14:05:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230208AbiJTSEo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Oct 2022 14:04:44 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2FFCA47F;
        Thu, 20 Oct 2022 11:04:30 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29KHYDO8014489;
        Thu, 20 Oct 2022 18:04:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=/oibhew9lzXn8nCJs8ZsY81MwvYYAKDumXgp//D9Asc=;
 b=ker1rAzdcPYqzIp5GE7uG7FOcNeRAmMwloH0VJMPVLyc77wCv/jsPmwfrJ4lor5WjMy6
 IPDDKnHaaJOwvgtsGC7v29WoVdGdhncF92eUzvfLYEeUW4o/2aUYPmuELK16JBlPTUbf
 nOKQ6o8PlJABqYiiQwtpheEWwC459ygxCgSwkjkzbTG0UqCXbVQH22ehWCQu9KTmSIvE
 hszCN22XfPe+x7jJTEgdb/+FEw11jVO1SRg7yf8knWgm9JEdhEWtCImz4tzL8XJfI6Cr
 TPKs+xKpphfcX1DhzeUKgDJxhdnzGlWeV9NFJ65wWqI5/luIyun3J5Is1NWJQtKajd2F 3w== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ka6brvxq9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 20 Oct 2022 18:04:18 +0000
Received: from nasanex01a.na.qualcomm.com (corens_vlan604_snip.qualcomm.com [10.53.140.1])
        by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29KI4GNW008189
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 20 Oct 2022 18:04:17 GMT
Received: from asutoshd-linux1.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Thu, 20 Oct 2022 11:04:16 -0700
From:   Asutosh Das <quic_asutoshd@quicinc.com>
To:     <quic_cang@quicinc.com>, <martin.petersen@oracle.com>,
        <linux-scsi@vger.kernel.org>
CC:     <quic_nguyenb@quicinc.com>, <quic_xiaosenh@quicinc.com>,
        <stanley.chu@mediatek.com>, <eddie.huang@mediatek.com>,
        <daejun7.park@samsung.com>, <bvanassche@acm.org>,
        <avri.altman@wdc.com>, <mani@kernel.org>, <beanhuo@micron.com>,
        <quic_richardp@quicinc.com>,
        "Asutosh Das" <quic_asutoshd@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v3 00/17] Add Multi Circular Queue Support 
Date:   Thu, 20 Oct 2022 11:03:29 -0700
Message-ID: <cover.1666288432.git.quic_asutoshd@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: EvsK84bvxXYfjoS2PNG5sufB1qleJM_G
X-Proofpoint-GUID: EvsK84bvxXYfjoS2PNG5sufB1qleJM_G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-20_09,2022-10-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 mlxscore=0 spamscore=0
 suspectscore=0 clxscore=1011 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210200108
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

UFS Multi-Circular Queue (MCQ) has been added in UFSHCI v4.0 to improve storage performance.
The implementation uses the shared tagging mechanism so that tags are shared
among the hardware queues. The number of hardware queues is configurable.
This series doesn't include the ESI implementation for completion handling.

This implementation has been verified by booting on an emulation platform.
During testing, all low power modes were disabled and it was in HS-G1 mode.

Please take a look and let us know your thoughts.

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

Asutosh Das (17):
  ufs: core: Probe for ext_iid support
  ufs: core: Optimize duplicate code to read extended feature
  ufs: core: Introduce Multi-circular queue capability
  ufs: core: Defer adding host to scsi if mcq is supported
  ufs: core: mcq: Introduce Multi Circular Queue
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
  ufs: qcom-host: Enable multi circular queue capability

 drivers/ufs/core/Makefile      |   2 +-
 drivers/ufs/core/ufs-mcq.c     | 498 +++++++++++++++++++++++++++++++++++++++++
 drivers/ufs/core/ufshcd-priv.h |  84 ++++++-
 drivers/ufs/core/ufshcd.c      | 353 +++++++++++++++++++++++------
 drivers/ufs/host/ufs-qcom.c    |  49 ++++
 drivers/ufs/host/ufs-qcom.h    |   4 +
 include/ufs/ufs.h              |   6 +
 include/ufs/ufshcd.h           | 136 +++++++++++
 include/ufs/ufshci.h           |  63 ++++++
 9 files changed, 1127 insertions(+), 68 deletions(-)
 create mode 100644 drivers/ufs/core/ufs-mcq.c

-- 
2.7.4

