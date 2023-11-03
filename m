Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47E227E0597
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Nov 2023 16:33:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234049AbjKCPdu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Nov 2023 11:33:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233679AbjKCPdu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Nov 2023 11:33:50 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8117A123
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Nov 2023 08:33:44 -0700 (PDT)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A3Ex4xY026323;
        Fri, 3 Nov 2023 15:33:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=zVbZdnZwO5n4Y0Q+NvgutF2CvAxm+N/jXhIrpQVSRxA=;
 b=QPvctQ1O93r8cOg+nYL940YkMDSSvJxOAi4UPZLhvOZGqFCLNllbiBaRg/W8pmB0lqhr
 pc3E22qmqT++LzsmxLxnnAoQIwamEmFpC4yFVw/9zjMFLDgLBQYt9hbFBPU/eyPovprL
 eyJUpildTLvWcZfrJuvqCkhmVVk9Md1mOMzZuKme4G6Gc+ml6myKH2PFr8UaeVOwRezp
 x8E5nGmPSUlwfYKd7AH+umGEZ+wrP7qxF0L8XkVbiAA4UhqDppQdfq0Qvdr4PesK79c7
 K+lQQyeCZWM/lIcmVDc+/p2F6K7JoL+M26tqV0FIU8FKkJzNfjwu2a+oLZxUvJYWw52O HQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u533j830e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 03 Nov 2023 15:33:29 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A3FXSxW031804
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 3 Nov 2023 15:33:28 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Fri, 3 Nov 2023 08:33:27 -0700
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
To:     <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
        <stanislaw.gruszka@linux.intel.com>, <ogabbay@kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH] accel/qaic: Update MAX_ORDER use to be inclusive
Date:   Fri, 3 Nov 2023 09:33:02 -0600
Message-ID: <20231103153302.20642-1-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rm_Q-aJC_ypkzl5OMTMciEHJAw2Ds8Tp
X-Proofpoint-ORIG-GUID: rm_Q-aJC_ypkzl5OMTMciEHJAw2Ds8Tp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-03_15,2023-11-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310240000
 definitions=main-2311030131
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MAX_ORDER was redefined so that valid allocations to the page allocator
are in the range of 0..MAX_ORDER, inclusive in the commit
23baf831a32c ("mm, treewide: redefine MAX_ORDER sanely").

We are treating MAX_ORDER as an exclusive value, and thus could be
requesting larger allocations.  Update our use to match the redefinition
of MAX_ORDER.

Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
---
 drivers/accel/qaic/qaic_data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index 8da81768f2ab..8998c28e566e 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -452,7 +452,7 @@ static int create_sgt(struct qaic_device *qdev, struct sg_table **sgt_out, u64 s
 		 * later
 		 */
 		buf_extra = (PAGE_SIZE - size % PAGE_SIZE) % PAGE_SIZE;
-		max_order = min(MAX_ORDER - 1, get_order(size));
+		max_order = min(MAX_ORDER, get_order(size));
 	} else {
 		/* allocate a single page for book keeping */
 		nr_pages = 1;
-- 
2.40.1

