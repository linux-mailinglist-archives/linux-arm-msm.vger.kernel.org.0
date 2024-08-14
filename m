Return-Path: <linux-arm-msm+bounces-28566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0AE9525C6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 00:33:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56B3FB21475
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 22:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA2B71448C1;
	Wed, 14 Aug 2024 22:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jNTE4nme"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6582460B96;
	Wed, 14 Aug 2024 22:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723674785; cv=none; b=BUgeYXZmIZETQhUwRL8fQE6sJJ4TGSsDPzUr7BdJTbcr5//Ngpg5sRSNtyvnz3Fn7H4kCZPUuPtx7k06NvMRHWgoTaBKwcnbyal3hxw+kBs0DOZIVaqb+TuxnJJDkcw29SoZAe5Plwps5lBvwTJcTju6rml9tbTKmINkKT0FVyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723674785; c=relaxed/simple;
	bh=S1eu9tSKC76OMa5c3XhM7Xqp7G+7jOZIvB4j8xPr+f4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=W9O9+0WRSkCPqhHcQaIte6fPEoAt+iGC02gCQ+IXdJSqDr6lIaEcsrVjJol2wrNMRP8SnnKbvMie/aFZyaTmAJt8uLMzc5GUo8k51qVLTYuWIarve+m2W5Is04RQ9sLHz/fM1/8DLz52ast9T9DP/w9E5PhDuozmvPDpIOf0kr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jNTE4nme; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47EBMIsT017721;
	Wed, 14 Aug 2024 22:32:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=LHJSBTU5f9BDa7mzVZmYcrdoxdCy4mWD22j
	0XMnhglk=; b=jNTE4nme5R6AYy3uD5faLxM3bzuBcw8YwUFQ4B/PgM4Hy5NRV5Y
	pNvfBAUuk39TU8F83nADiwHJmB5PSHvf4dosD+F0uTWHxqSjmUEsv+p39mWNWH0Z
	csM4vdPWJJg080odfNby9ryosCAO7LzdzooBXQW1tAYy92qhu8ywXHJ66e7CfVtE
	lWrIBWveYS/l7QDJBD4huxKWEK9CEpvvYLtlX+ICiuTDf4UsU/3Kv7dptwFSuoij
	NIK/iq5e3nEPFA2v3/iuuKjilu4qT202egBFDCs+HTnciEe2Ht0UjtknozJupsP/
	i1ZN15V1/WNCGLNPZyliyxdW3cK22yzU2bw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 410j1jb6bk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 22:32:57 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 47EMWu4F030562;
	Wed, 14 Aug 2024 22:32:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 410was373k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 22:32:56 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 47EMSBoh025167;
	Wed, 14 Aug 2024 22:32:56 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-uchalich-lv.qualcomm.com [10.81.89.1])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 47EMWu4L030557
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 22:32:56 +0000
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 4184210)
	id 1D795651; Wed, 14 Aug 2024 15:32:56 -0700 (PDT)
From: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Sibi Sankar <quic_sibis@quicinc.com>
Cc: Murali Nalajala <quic_mnalajal@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com,
        stable@vger.kernel.org,
        Unnathi Chalicheemala <quic_uchalich@quicinc.com>,
        Elliot Berman <quic_eberman@quicinc.com>
Subject: [PATCH v2] firmware: qcom_scm: Mark get_wq_ctx() as atomic call
Date: Wed, 14 Aug 2024 15:32:44 -0700
Message-Id: <20240814223244.40081-1-quic_uchalich@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: H_CVMw0VpxLZ0VOzAedJXZuqofGLmlqs
X-Proofpoint-GUID: H_CVMw0VpxLZ0VOzAedJXZuqofGLmlqs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_18,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 clxscore=1011
 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408140156

From: Murali Nalajala <quic_mnalajal@quicinc.com>

Currently get_wq_ctx() is wrongly configured as a standard call. When two
SMC calls are in sleep and one SMC wakes up, it calls get_wq_ctx() to
resume the corresponding sleeping thread. But if get_wq_ctx() is
interrupted, goes to sleep and another SMC call is waiting to be allocated
a waitq context, it leads to a deadlock.

To avoid this get_wq_ctx() must be an atomic call and can't be a standard
SMC call. Hence mark get_wq_ctx() as a fast call.

Fixes: 6bf325992236 ("firmware: qcom: scm: Add wait-queue handling logic")
Cc: stable@vger.kernel.org
Signed-off-by: Murali Nalajala <quic_mnalajal@quicinc.com>
Signed-off-by: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
Reviewed-by: Elliot Berman <quic_eberman@quicinc.com>
---
Changes in v2:
- Made commit message more clear.
- R-b tag from Elliot.
- Link to v1: https://lore.kernel.org/all/20240611-get_wq_ctx_atomic-v1-1-9189a0a7d1ba@quicinc.com/

 drivers/firmware/qcom/qcom_scm-smc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_scm-smc.c b/drivers/firmware/qcom/qcom_scm-smc.c
index dca5f3f1883b..2b4c2826f572 100644
--- a/drivers/firmware/qcom/qcom_scm-smc.c
+++ b/drivers/firmware/qcom/qcom_scm-smc.c
@@ -73,7 +73,7 @@ int scm_get_wq_ctx(u32 *wq_ctx, u32 *flags, u32 *more_pending)
 	struct arm_smccc_res get_wq_res;
 	struct arm_smccc_args get_wq_ctx = {0};
 
-	get_wq_ctx.args[0] = ARM_SMCCC_CALL_VAL(ARM_SMCCC_STD_CALL,
+	get_wq_ctx.args[0] = ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,
 				ARM_SMCCC_SMC_64, ARM_SMCCC_OWNER_SIP,
 				SCM_SMC_FNID(QCOM_SCM_SVC_WAITQ, QCOM_SCM_WAITQ_GET_WQ_CTX));
 
-- 
2.34.1


