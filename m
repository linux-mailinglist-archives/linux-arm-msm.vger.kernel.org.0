Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFDA5790158
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Sep 2023 19:23:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346635AbjIARXL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Sep 2023 13:23:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350355AbjIARXK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Sep 2023 13:23:10 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A978D1B2
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Sep 2023 10:23:07 -0700 (PDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 381Ca6rU001069;
        Fri, 1 Sep 2023 17:23:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=XxrAAPpc3EbA/i97+C/NooLr7QtJW+bzlFwtvct/PRs=;
 b=W8sZ1LOuCRoeUjhEmZjYhKQv9MN5TmWm0FVUtZ7i8ZjoMO3Kzs120TccSc3VJzQPqNTM
 P+vIK6vUXuJu/rQed274OmY22XttxCLMARsB13nthizVYPezXtWmHwBUeaqFrOHvUVU9
 9APSlj+TbyAVGEUzSX2VrUvLt191G9hRo+/K66lwS8MCY0CZ64wFPjRo/wBN7TFmJXkc
 hubm5PRwh0f9gts01gHvMU2g/SjOfYZ9olfyI3Ot6FwiZOr/nBPnLSkfvTkJo/G+CCnA
 qW5wS3XKC2dSK+wSqhldOPSI0OBan0FdOk0rKmnRFFgTvOBAd8s6kSIgmGdvPbXJE8vu yA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sug2h8uj3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 01 Sep 2023 17:23:03 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 381HN3Tm011196
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 1 Sep 2023 17:23:03 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Fri, 1 Sep 2023 10:23:02 -0700
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
To:     <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
        <stanislaw.gruszka@linux.intel.com>, <ogabbay@kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH 0/7] accel/qaic: Extend uAPI to support undoing ATTACH_SLICE_BO
Date:   Fri, 1 Sep 2023 11:22:40 -0600
Message-ID: <20230901172247.11410-1-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: FBlCT0muirC2sOcI_f8WsoH36eKea1cN
X-Proofpoint-ORIG-GUID: FBlCT0muirC2sOcI_f8WsoH36eKea1cN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-01_14,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=706 priorityscore=1501 mlxscore=0 phishscore=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309010163
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A BO for a QAIC device has two states -
1. Allocated
2. Sliced

A BO can be allocated at any time, and is initialized in the allocated state.
A BO can transition to the sliced state via ATTACH_SLICE_BO.  This prepares the
BO for use with an active workload.  Currently a BO in the sliced state can
only be used with a single workload, and will only transition back to the
allocated state once the workload is deactivated.

Userspace would like the ability to trigger a BO transition from the sliced
state to the allocated state. This would support the usecase of a userspace
client that has two active workloads, where the output of the first workload
becomes the input of the second workload. Currently, the client would need
two BOs, once for each workload, and copy from one BO to the other.

To support this usecase, we create the detach slice concept which is the
inverse operation of ATTACH_SLICE_BO.  We extend the uAPI with a new
DETACH_SLICE_BO ioctl that allows userspace to perform this operation.

Since ATTACH_SLICE_BO and DETACH_SLICE_BO are related operations, they share
a decent amount of code. This series starts with restructuring the common code
for use in both ioctls before finally adding the DETACH_SLICE_BO.

Pranjal Ramajor Asha Kanojiya (7):
  accel/qaic: Remove ->size field from struct qaic_bo
  accel/qaic: Update BO metadata in a central location
  accel/qaic: Declare BO 'sliced' after all the operations are complete
  accel/qaic: Undo slicing setup done in qaic_attach_slicing_bo()
  accel/qaic: Clean up BO during flushing of transfer list
  accel/qaic: Create a function to initialize BO
  accel/qaic: Add QAIC_DETACH_SLICE_BO IOCTL

 Documentation/accel/qaic/qaic.rst |  10 ++
 drivers/accel/qaic/qaic.h         |   6 +-
 drivers/accel/qaic/qaic_data.c    | 187 +++++++++++++++++++++++-------
 drivers/accel/qaic/qaic_drv.c     |   1 +
 include/uapi/drm/qaic_accel.h     |  24 +++-
 5 files changed, 175 insertions(+), 53 deletions(-)

-- 
2.40.1

