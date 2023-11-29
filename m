Return-Path: <linux-arm-msm+bounces-2361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6027E7FCF91
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 07:58:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C509E2822C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 06:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 697501078B;
	Wed, 29 Nov 2023 06:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jZBN/Jzj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA90119A6;
	Tue, 28 Nov 2023 22:58:25 -0800 (PST)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ASNSLx9025752;
	Wed, 29 Nov 2023 06:58:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=LsICOZfGK90sPM4D4fqzedjtuDu0jx2XyVM/Kw8raRE=;
 b=jZBN/JzjtUulhYeuqNV//7MAOyI6Ur5aSWpcUDlbMnJEbWHlBKXryeZgqd7JNwkPoKfN
 EvWsNbfC5S3QJdIE4tY4iF6no/jGK6/fbnidZF3aH3ufn27Xrjwr7jk79L49UUCbH7fy
 No+l8fjgTXZQiPm/T/kQHQImIdWExSwqj4YxrrhBzzKeoeoKqeE0tD2+L+1GUB/mtkrK
 1iFFHNe0fs90XwITRZubX+gM2QG7W5jI5uBukKImpHfICLDHNTwS6+7pc7URv6kLnIoO
 aMbDpp3tj1mHTR9shw/ml9JhhtE6PJdrMOnliXyXjOredhAcwaSRvDUg0TzJybmh9I5b UA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3unnpese8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 06:58:21 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AT6wKsR020954
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 06:58:20 GMT
Received: from blr-ubuntu-253.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 28 Nov 2023 22:58:16 -0800
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_mdtipton@quicinc.com>, <linux-arm-kernel@lists.infradead.org>,
        <quic_asartor@quicinc.com>, <quic_lingutla@quicinc.com>,
        Sibi Sankar
	<quic_sibis@quicinc.com>
Subject: [PATCH 3/3] firmware: arm_scmi: Increase the maximum opp count
Date: Wed, 29 Nov 2023 12:27:48 +0530
Message-ID: <20231129065748.19871-4-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231129065748.19871-1-quic_sibis@quicinc.com>
References: <20231129065748.19871-1-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: AR6n_PD1s-LLN0Fb8fWTsRCyat1A1kzT
X-Proofpoint-ORIG-GUID: AR6n_PD1s-LLN0Fb8fWTsRCyat1A1kzT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-29_03,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 mlxscore=0 phishscore=0 mlxlogscore=793 priorityscore=1501 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311290049

The number of opps on certain variants of the X1E80100 SoC are greater
than current maximum, so increase the MAX_OPP count to the next log level
to accommodate that.

Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
---
 drivers/firmware/arm_scmi/perf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm_scmi/perf.c
index 3344ce3a2026..edf34a3c4d6a 100644
--- a/drivers/firmware/arm_scmi/perf.c
+++ b/drivers/firmware/arm_scmi/perf.c
@@ -24,7 +24,7 @@
 #include "protocols.h"
 #include "notify.h"
 
-#define MAX_OPPS		16
+#define MAX_OPPS		24
 
 enum scmi_performance_protocol_cmd {
 	PERF_DOMAIN_ATTRIBUTES = 0x3,
-- 
2.17.1


