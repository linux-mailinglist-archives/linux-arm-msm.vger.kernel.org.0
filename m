Return-Path: <linux-arm-msm+bounces-2867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E32800954
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 12:07:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48527B20C92
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 11:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6930F210E0;
	Fri,  1 Dec 2023 11:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Tu5RxNuj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B06EC10D8;
	Fri,  1 Dec 2023 03:06:58 -0800 (PST)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B18uKgQ022357;
	Fri, 1 Dec 2023 11:06:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=ddKWip09Ii5EtoLGy+6Dq9XJZUZNVv7bpq19jVF3sCY=;
 b=Tu5RxNujEtPzzGWyxKBjwTpTh6Nf8ljoPOXDVWu3mn527fcgAIddOaOVB4YjKIWyHjf7
 juQK/0PpRoTuU0N4tmEGtmN8Kzq99eUmapSgo9IxJIn/VWLjGsuOrP06LJ+HgjoYZC0j
 2RRfFeA8pgDeMSXe7sOkgmZKOVP+SqfVKIsQVwA6wEER7uvZrZJUF88aKU7AO0qqyfpa
 /GX3eKPv1wf6i6aghWoLnG8emTfr3fjL4Qm6KQKjmDiKuRMf+Ta2Pa3HuRtUG8Ewc0bt
 WemhLrAcI6zC0fZqCOGImzgR1UuvWoCyslsvDH41mSoD5yeI5Zd+CkxfhxU+fkk7ShSy Fg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3upvm1tn6t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Dec 2023 11:06:54 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B1B6rEd017269
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Dec 2023 11:06:53 GMT
Received: from hu-deesin-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 1 Dec 2023 03:06:49 -0800
From: Deepak Kumar Singh <quic_deesin@quicinc.com>
To: <quic_bjorande@quicinc.com>, <bjorn.andersson@kernel.org>,
        <quic_clew@quicinc.com>, <mathieu.poirier@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <quic_sarannya@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        "Deepak
 Kumar Singh" <quic_deesin@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>
Subject: [PATCH V1] rpmsg: glink: smem: validate index before fifo read write
Date: Fri, 1 Dec 2023 16:36:31 +0530
Message-ID: <20231201110631.669085-1-quic_deesin@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 49DiMz7uDClOHEvaBUotB1hqK0N7ZCFp
X-Proofpoint-GUID: 49DiMz7uDClOHEvaBUotB1hqK0N7ZCFp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_09,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 bulkscore=0 adultscore=0 clxscore=1011 mlxscore=0 mlxlogscore=876
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312010072

Fifo head and tail index can be modified with wrong values from
untrusted remote procs. Glink smem is not validating these index
before using to read or write fifo. This can result in out of
bound memory access if head and tail have incorrect values.

Add check for validation of head and tail index. This check will
put index within fifo boundaries, so that no invalid memory access
is made. Further this may result in certain packet drops unless
glink finds a valid packet header in fifo again and recovers.

Crash signature and calltrace with wrong head and tail values:

Internal error: Oops: 96000007 [#1] PREEMPT SMP
pc : __memcpy_fromio+0x34/0xb4
lr : glink_smem_rx_peak+0x68/0x94

__memcpy_fromio+0x34/0xb4
glink_smem_rx_peak+0x68/0x94
qcom_glink_native_intr+0x90/0x888

Signed-off-by: Deepak Kumar Singh <quic_deesin@quicinc.com>
---
 drivers/rpmsg/qcom_glink_smem.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
index 7a982c60a8dd..9eba0aaae916 100644
--- a/drivers/rpmsg/qcom_glink_smem.c
+++ b/drivers/rpmsg/qcom_glink_smem.c
@@ -86,9 +86,14 @@ static size_t glink_smem_rx_avail(struct qcom_glink_pipe *np)
 	tail = le32_to_cpu(*pipe->tail);
 
 	if (head < tail)
-		return pipe->native.length - tail + head;
+		len = pipe->native.length - tail + head;
 	else
-		return head - tail;
+		len = head - tail;
+
+	if (WARN_ON_ONCE(len > pipe->native.length))
+		len = 0;
+
+	return len;
 }
 
 static void glink_smem_rx_peek(struct qcom_glink_pipe *np,
@@ -99,6 +104,10 @@ static void glink_smem_rx_peek(struct qcom_glink_pipe *np,
 	u32 tail;
 
 	tail = le32_to_cpu(*pipe->tail);
+
+	if (WARN_ON_ONCE(tail > pipe->native.length))
+		return;
+
 	tail += offset;
 	if (tail >= pipe->native.length)
 		tail -= pipe->native.length;
@@ -121,7 +130,7 @@ static void glink_smem_rx_advance(struct qcom_glink_pipe *np,
 
 	tail += count;
 	if (tail >= pipe->native.length)
-		tail -= pipe->native.length;
+		tail %= pipe->native.length;
 
 	*pipe->tail = cpu_to_le32(tail);
 }
@@ -146,6 +155,9 @@ static size_t glink_smem_tx_avail(struct qcom_glink_pipe *np)
 	else
 		avail -= FIFO_FULL_RESERVE + TX_BLOCKED_CMD_RESERVE;
 
+	if (WARN_ON_ONCE(avail > pipe->native.length))
+		avail = 0;
+
 	return avail;
 }
 
@@ -155,6 +167,9 @@ static unsigned int glink_smem_tx_write_one(struct glink_smem_pipe *pipe,
 {
 	size_t len;
 
+	if (WARN_ON_ONCE(head > pipe->native.length))
+		return head;
+
 	len = min_t(size_t, count, pipe->native.length - head);
 	if (len)
 		memcpy(pipe->fifo + head, data, len);
-- 
2.34.1


