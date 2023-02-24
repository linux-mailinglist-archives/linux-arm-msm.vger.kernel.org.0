Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 987E56A23A1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Feb 2023 22:18:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbjBXVST (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Feb 2023 16:18:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229864AbjBXVSQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Feb 2023 16:18:16 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22FE24C3E;
        Fri, 24 Feb 2023 13:17:53 -0800 (PST)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31OK5hs0030408;
        Fri, 24 Feb 2023 21:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=2KeglNGIGTjZRWimPDaOKRsBt+lnwUieaIjlGkQbDEM=;
 b=fwdBbrlPqw3uesc+q/CiqsrKpTuPFaFFrP4MtLPPuSAZxr6qwvx4JD05L/mWJSb87ryH
 JFmzqRrLuEExo0u4fe+Ih0pbXbLbU9X6HPr4eoru3PXGQBtVHM19d9ss/htbyqPKqANo
 ziMxvgITSn+R+wRljsGc2zBbYjUe/8NwRiwBeCUTK4EHFKx+QBfSH2V1I4ncjr+k9AHs
 BX7d7sn1k8u7Kf9xAanT/jkABTev9oLXVE5jpw0Aus6KwGPFZMDF85DXayxBThaFSaK1
 mh9gnzCy7WuBn5xypf/73e88QPh6Dq3YxKKAVEL5P257FKzWDxxf1waoj9BUZQpG6wgn ng== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nwybwnwch-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 24 Feb 2023 21:17:25 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31OLHOXF018415
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 24 Feb 2023 21:17:24 GMT
Received: from hu-gokukris-sd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Fri, 24 Feb 2023 13:17:23 -0800
From:   Gokul krishna Krishnakumar <quic_gokukris@quicinc.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Trilok Soni <quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        "Elliot Berman" <quic_eberman@quicinc.com>,
        Guru Das Srinagesh <quic_gurus@quicinc.com>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        Siddharth Gupta <sidgup@codeaurora.org>,
        Gokul krishna Krishnakumar <quic_gokukris@quicinc.com>
Subject: [PATCH v5 2/2] remoteproc: qcom: Add full coredump fallback mechanism
Date:   Fri, 24 Feb 2023 13:17:07 -0800
Message-ID: <20230224211707.30916-3-quic_gokukris@quicinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230224211707.30916-1-quic_gokukris@quicinc.com>
References: <20230224211707.30916-1-quic_gokukris@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rJjw62YLETut6RPGP3-Zs-qtUw_Rm3kD
X-Proofpoint-ORIG-GUID: rJjw62YLETut6RPGP3-Zs-qtUw_Rm3kD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-24_16,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=976 malwarescore=0 impostorscore=0
 bulkscore=0 spamscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302240169
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Siddharth Gupta <sidgup@codeaurora.org>

If a remoteproc's firmware does not support minidump but the driver
adds an ID, the minidump driver does not collect any coredumps when
the remoteproc crashes. This hinders the purpose of coredump
collection. This change adds a fallback mechanism in the event of a
crash.

Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
Signed-off-by: Gokul krishna Krishnakumar <quic_gokukris@quicinc.com>
---
 drivers/remoteproc/qcom_common.c   | 13 +++++++++++--
 drivers/remoteproc/qcom_q6v5_pas.c |  1 +
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index 7da3259be14a..280a5a821dca 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -173,12 +173,21 @@ void qcom_minidump(struct rproc *rproc, unsigned int minidump_id,
 	 */
 	if (subsystem->regions_baseptr == 0 ||
 	    le32_to_cpu(subsystem->status) != 1 ||
-	    le32_to_cpu(subsystem->enabled) != MD_SS_ENABLED ||
-	    le32_to_cpu(subsystem->encryption_status) != MD_SS_ENCR_DONE) {
+	    le32_to_cpu(subsystem->enabled) != MD_SS_ENABLED) {
+		return rproc_coredump(rproc);
+	}
+
+	if (le32_to_cpu(subsystem->encryption_status) != MD_SS_ENCR_DONE) {
 		dev_err(&rproc->dev, "Minidump not ready, skipping\n");
 		return;
 	}
 
+	/**
+	 * Clear out the dump segments populated by parse_fw before
+	 * re-populating them with minidump segments.
+	 */
+	rproc_coredump_cleanup(rproc);
+
 	ret = qcom_add_minidump_segments(rproc, subsystem, rproc_dumpfn_t);
 	if (ret) {
 		dev_err(&rproc->dev, "Failed with error: %d while adding minidump entries\n", ret);
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 27d3a6f8c92f..d065f99b4c32 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -442,6 +442,7 @@ static const struct rproc_ops adsp_minidump_ops = {
 	.start = adsp_start,
 	.stop = adsp_stop,
 	.da_to_va = adsp_da_to_va,
+	.parse_fw = qcom_register_dump_segments,
 	.load = adsp_load,
 	.panic = adsp_panic,
 	.coredump = adsp_minidump,
-- 
2.39.2

