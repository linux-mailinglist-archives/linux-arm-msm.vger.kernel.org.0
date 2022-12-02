Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CE806403AB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 10:46:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232450AbiLBJqg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Dec 2022 04:46:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233090AbiLBJqU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Dec 2022 04:46:20 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4449A1D0FF;
        Fri,  2 Dec 2022 01:46:06 -0800 (PST)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B296Abe029281;
        Fri, 2 Dec 2022 09:46:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=Cpf5xdVUs0Lts4CKhfQVAVGXLzQbuR2j7KnQIG8ZaIE=;
 b=fdMvKD5qm0+DUoceQWEqbKkhJQ80lNYoTSH4K2gPoFvfMg/YdyNPc1mBXDUuk3UHEB2u
 zjC7mhA1jHnE8zT2JkgAdks4lEG9Q1RXMCohT7oG5/dvaUB1COh7MfbAXtKcd4LEHJ9d
 M4c40M3HlMIU3IOxSC9//fJKV/48Rchg/xxQMq7aT5O5EFAgW3eY+9LT2wd3+llB1CaH
 D+P/w0ICuIDxRlin3rQH0qUb7BW7q+014WCDlihBUuxW1hJ0s57XyAAy8u7QgMIhrPBe
 yRxBCFoADdoXX7Zm4t8Oj63CZGKxyimrtXiolOglS38rkuVAH1Dmd1TzudkR2Rj9JUK3 wQ== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m7c180pua-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 02 Dec 2022 09:46:02 +0000
Received: from nasanex01a.na.qualcomm.com (corens_vlan604_snip.qualcomm.com [10.53.140.1])
        by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2B29k1B5025956
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 2 Dec 2022 09:46:01 GMT
Received: from aiquny2-gv.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Fri, 2 Dec 2022 01:46:00 -0800
From:   Maria Yu <quic_aiquny@quicinc.com>
To:     <mathieu.poirier@linaro.org>
CC:     Maria Yu <quic_aiquny@quicinc.com>, <arnaud.pouliquen@foss.st.com>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <quic_clew@quicinc.com>
Subject: [PATCH v5 2/2] remoteproc: core: change to ordered workqueue for crash handler
Date:   Fri, 2 Dec 2022 17:45:32 +0800
Message-ID: <20221202094532.2925-3-quic_aiquny@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221202094532.2925-1-quic_aiquny@quicinc.com>
References: <20221202094532.2925-1-quic_aiquny@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: khmbiZQELznI8BHaAI2sQZBdyv-Hm28m
X-Proofpoint-GUID: khmbiZQELznI8BHaAI2sQZBdyv-Hm28m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-02_04,2022-12-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 malwarescore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212020075
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Only the first detected crash needed to be handled, so change
to ordered workqueue to avoid unnecessary multi active work at
the same time. This will reduce the pm_relax unnecessary concurrency.

Signed-off-by: Maria Yu <quic_aiquny@quicinc.com>
---
 drivers/remoteproc/remoteproc_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index c2d0af048c69..4b973eea10bb 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2728,8 +2728,8 @@ static void __exit rproc_exit_panic(void)
 
 static int __init remoteproc_init(void)
 {
-	rproc_recovery_wq = alloc_workqueue("rproc_recovery_wq",
-						WQ_UNBOUND | WQ_FREEZABLE, 0);
+	rproc_recovery_wq = alloc_ordered_workqueue("rproc_recovery_wq",
+						WQ_FREEZABLE, 0);
 	if (!rproc_recovery_wq) {
 		pr_err("remoteproc: creation of rproc_recovery_wq failed\n");
 		return -ENOMEM;
-- 
2.17.1

