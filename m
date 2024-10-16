Return-Path: <linux-arm-msm+bounces-34608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F18A79A0DD1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 17:16:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3310281FFA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 15:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 885EE20F5AA;
	Wed, 16 Oct 2024 15:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GmATWxXY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B518820E039;
	Wed, 16 Oct 2024 15:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729091768; cv=none; b=BVbRzlhvYaHwJL+3vILfs73EXwYpKgzhxp6zZR4ZlsUh/N9h9kM6ZX545AIZTAsupI61zWm5tb/uAkkxkIY+JmuXO4pTL335DykuXPzxWCbhDO7PSudtDviX4usutTyLXthIepU6eFS7WuoaHlxVQG/wkyiCYQunRyeHg2oOCNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729091768; c=relaxed/simple;
	bh=AGFvBqZcOpFJc/vc3Rkdwn69OFtLMgqN1dg8JfD6eP0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=diRwPPMM5WGUcPPbAxfmK9100VrJBdNafwtbDL+/EiNcQ0eBQosUUA0n6eiyhRmMO0mr2H7fvD3F4GyYKH+kGRRKllV3uLVp/UrT0HToUKkw7H3Wy/OgQyklfTBeUJvRIX2qfpL701XOp/ULIj1VGzGtMAVjnX5D2RUaKask0+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GmATWxXY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GAIC5W011297;
	Wed, 16 Oct 2024 15:16:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BCvtCIWpj+5RPHLFM2XEGOMMWtdpr2SPatTPIvCdBU4=; b=GmATWxXYrh5VXMOO
	GlMeuCEip8BtGbYX5GmvcN4PjVqOl3t5YLNYpaJ0r504THZdaDIoCjUn15Z4XwD5
	d1TfthPhhCJORu2KGjAfkWv3/5movEK94QTisEmN/S8q65wlVBwnpF3SVyxwe/GN
	dYKKhp52TbGeoeKNOvWHCxY+BQyFuPKj5LZiEXncgLbR3eVIIBgahX/a54pw45Ey
	jpuut5k8QM1KNitmlnv7DLe1beNcsSyVuWb0/iqlYE6q6jL7kiFTT2QXlrESiUoL
	tER7gA+ggMKSgYEvFt0wKt8D3aPQ77ZmYp9uccDh+u9xOCM8RtU3Azs2k6meZ9DB
	kFPLxw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42abm5h0p9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 15:16:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49GFG1hh017931
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 15:16:01 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 16 Oct 2024 08:15:58 -0700
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH 1/3] dt-bindings: arm: qcom,ids: add SoC ID for IPQ5424/IPQ5404
Date: Wed, 16 Oct 2024 20:45:26 +0530
Message-ID: <20241016151528.2893599-2-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241016151528.2893599-1-quic_mmanikan@quicinc.com>
References: <20241016151528.2893599-1-quic_mmanikan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 8VMsjdo_4e1VlWYbFtRwiZkyh8FDDmCR
X-Proofpoint-GUID: 8VMsjdo_4e1VlWYbFtRwiZkyh8FDDmCR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=587 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410160095

Add the ID for Qualcomm IPQ5424/IPQ5404 SoC.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
 include/dt-bindings/arm/qcom,ids.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 8332f8d82f96..b6940f098b49 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -276,6 +276,8 @@
 #define QCOM_ID_QCM8550			604
 #define QCOM_ID_IPQ5300			624
 #define QCOM_ID_IPQ5321			650
+#define QCOM_ID_IPQ5424			651
+#define QCOM_ID_IPQ5404			671
 #define QCOM_ID_QCS8300			674
 #define QCOM_ID_QCS8275			675
 
-- 
2.34.1


