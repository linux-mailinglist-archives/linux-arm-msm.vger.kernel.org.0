Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 422345ABADE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Sep 2022 00:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbiIBWm4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Sep 2022 18:42:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbiIBWmz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Sep 2022 18:42:55 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70015E725F;
        Fri,  2 Sep 2022 15:42:53 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 282KFRek013313;
        Fri, 2 Sep 2022 22:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=DMpRXlBJEPMO1B/g5veB7Bj4BDZBa0GEsIo0IPwimq8=;
 b=Tz8mnj0sY64ja2xd6V6NSERV1sUbtLFk8D5pSqZrIzBavpSeka0yDiEHA/zV0Z7/642g
 p1E43onlwGUQ4sPv0WlaAvbhT22oWQHZaK57XJkAwPoh10JocAzQ9/0f4bvHv9B1PeFL
 OkVNbb/TOQWcW2fLCg7DQBSTXUf7jcHBmbkhtOHpbt2Fr094aGm7VU5x+AvgWEc393qS
 OOvtvlh4XZS0lKu5JCstK7mNllR7SBS0f1Cjpzc0C1CO9sXpwEeGpkP6uIj+9L+ny1eR
 n7obaTzI08F39AjwWHEBhijHUTMxpg22NnmPVSHLeenbGqmtSRHfjhlv4eUTV3X2E9Ut 2A== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jashfe9n7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 02 Sep 2022 22:42:24 +0000
Received: from nasanex01a.na.qualcomm.com (corens_vlan604_snip.qualcomm.com [10.53.140.1])
        by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 282MgNF0007683
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 2 Sep 2022 22:42:23 GMT
Received: from asutoshd-linux1.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Fri, 2 Sep 2022 15:42:23 -0700
From:   Asutosh Das <quic_asutoshd@quicinc.com>
To:     <quic_nguyenb@quicinc.com>, <quic_xiaosenh@quicinc.com>,
        <stanley.chu@mediatek.com>, <adrian.hunter@intel.com>,
        <bvanassche@acm.org>, <avri.altman@wdc.com>, <mani@kernel.org>,
        <quic_cang@quicinc.com>, <beanhuo@micron.com>,
        <martin.petersen@oracle.com>, <linux-scsi@vger.kernel.org>
CC:     Asutosh Das <quic_asutoshd@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>
Subject: [RFC PATCH v3 0/4] UFS Multi-Circular Queue (MCQ) 
Date:   Fri, 2 Sep 2022 15:41:36 -0700
Message-ID: <cover.1662157846.git.quic_asutoshd@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: FyOsImqxk4e0V8qq-rO8w6jW7_Bd8rgA
X-Proofpoint-ORIG-GUID: FyOsImqxk4e0V8qq-rO8w6jW7_Bd8rgA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-02_06,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1011 mlxscore=0
 bulkscore=0 mlxlogscore=888 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209020101
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

UFS Multi-Circular Queue (MCQ) has been added in UFSHCI v4.0 to improve storage performance.
This patch series is a RFC implementation of this.

This is the initial driver implementation and it has been verified by booting on an emulation
platform. During testing, all low power modes were disabled and it was in HS-G1 mode.

Please take a look and let us know your thoughts.

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


Asutosh Das (2):
  ufs: core: prepare ufs for multi circular queue support
  ufs: core: mcq: Adds Multi-Circular Queue support

Can Guo (2):
  ufs: core: Add Event Specific Interrupt configuration vendor specific
    ops
  ufs: host: qcom: Add MCQ support

 drivers/ufs/core/Makefile      |   2 +-
 drivers/ufs/core/ufs-mcq.c     | 474 +++++++++++++++++++++++++++++++++++++++++
 drivers/ufs/core/ufshcd-priv.h | 102 +++++++++
 drivers/ufs/core/ufshcd.c      | 370 +++++++++++++++++++++++++-------
 drivers/ufs/host/ufs-qcom.c    | 134 ++++++++++++
 drivers/ufs/host/ufs-qcom.h    |  13 ++
 include/ufs/ufs.h              |   6 +
 include/ufs/ufshcd.h           | 137 ++++++++++++
 include/ufs/ufshci.h           |  79 +++++++
 9 files changed, 1238 insertions(+), 79 deletions(-)
 create mode 100644 drivers/ufs/core/ufs-mcq.c

-- 
2.7.4

