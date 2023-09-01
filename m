Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 348FE79015E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Sep 2023 19:23:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350358AbjIARXZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Sep 2023 13:23:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350362AbjIARXY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Sep 2023 13:23:24 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 198C21B2
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Sep 2023 10:23:22 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 381CRWOj004702;
        Fri, 1 Sep 2023 17:23:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=L5dXNT+4DfmcFmNQYQxTtJ5jl5Xe6gYS0yW814MatHc=;
 b=XYCiPTzVdzCWS1QglCeGPhb7VE7OiQx2ankr25Lo0oPfL7ibRaVur+rXq9vnwMKQLjbQ
 4ajg/4dklXzYIZJTQitY2zKTrtnA/yld749RlJTmQOnqjhYRjZHTqRNGVEBa84uhlY61
 9LtZhQTn0WWeuqGs8BS38/EXWlo5lKi8Ujy0XNE7rjAmYPP03gpcBzBsZGwPRUkTnVtY
 4MhsRv94Sh1l0vLTsmpgKMDDJrlty2jo6+IOhTzWYxPI3iR3GdobNFLtGJBsc0ij7rFo
 Co5pM5S33tBiRVQmm2JCCunr/1olrKXuqSjr6st2psczqKVPiku5CmZTvuNjFlF5rz7h vQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3stku2cq4a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 01 Sep 2023 17:23:16 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 381HNFLF015063
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 1 Sep 2023 17:23:15 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Fri, 1 Sep 2023 10:23:14 -0700
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
To:     <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
        <stanislaw.gruszka@linux.intel.com>, <ogabbay@kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH 3/7] accel/qaic: Declare BO 'sliced' after all the operations are complete
Date:   Fri, 1 Sep 2023 11:22:43 -0600
Message-ID: <20230901172247.11410-4-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230901172247.11410-1-quic_jhugo@quicinc.com>
References: <20230901172247.11410-1-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: abO9rIUkAgPpXpEBmgLpuEvG2ErjHs4R
X-Proofpoint-ORIG-GUID: abO9rIUkAgPpXpEBmgLpuEvG2ErjHs4R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-01_14,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 spamscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309010163
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>

Once the BO is declared 'sliced' by setting bo->sliced to true we can
perform DMA (QAIC_EXECUTE_BO) operation on that BO. Hence we should
declare a BO sliced after completing all the operations.

Adding BO to its respective DBC list in qaic_attach_slicing_bo() seems
out of place as qaic_attach_slicing_bo() should just update BO with
slicing configuration.

Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/accel/qaic/qaic_data.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index 710bd355ed8e..6a802497834c 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -911,9 +911,6 @@ static int qaic_attach_slicing_bo(struct qaic_device *qdev, struct qaic_bo *bo,
 		return -ENOSPC;
 	}
 
-	bo->sliced = true;
-	list_add_tail(&bo->bo_list, &bo->dbc->bo_lists);
-
 	return 0;
 }
 
@@ -1015,6 +1012,8 @@ int qaic_attach_slice_bo_ioctl(struct drm_device *dev, void *data, struct drm_fi
 	if (args->hdr.dir == DMA_TO_DEVICE)
 		dma_sync_sgtable_for_cpu(&qdev->pdev->dev, bo->sgt, args->hdr.dir);
 
+	bo->sliced = true;
+	list_add_tail(&bo->bo_list, &bo->dbc->bo_lists);
 	srcu_read_unlock(&dbc->ch_lock, rcu_id);
 	drm_gem_object_put(obj);
 	srcu_read_unlock(&qdev->dev_lock, qdev_rcu_id);
-- 
2.40.1

