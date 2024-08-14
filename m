Return-Path: <linux-arm-msm+bounces-28457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A27FD951588
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 09:30:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FF5A1F282A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 07:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37148140384;
	Wed, 14 Aug 2024 07:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RXNChrrY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A750713AD18;
	Wed, 14 Aug 2024 07:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723620528; cv=none; b=bcNfZHRY0BICpThLTSiuD30S8SnCV+gnHYPUJCNm4KUP4xcdOLP3R3xQ/1W9ET6AOdKClweYhlHXODK7Q19rmdgOdHXLPU0HOmBRqm+CZuKWn9JQ/Zx1+5pFdeT8VEy70F9jn7mj7tceqfwSE56zYRc+8nrhb2YDSRCdsqjANWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723620528; c=relaxed/simple;
	bh=nmZGLopCO+aDMgdb4k053+q3mxa7aGM1oArYZBgpi1E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E0UkOF9iZsfY3gcJwBDxzJJxSUdBUup1LNASzpYmUzXMd0Qb81rko2qCOBbswxkUEOnT7wydgrJsMiVrcGe6rkdPpsiGZ5sFWbnf2XnKViJU+Wp+c9zSXEET7Q/LfY0tsmQHXHcPJAiAlXQAl/0KqdstAdCxdLMK41cuLNT5Z7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RXNChrrY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47E2hwPp021416;
	Wed, 14 Aug 2024 07:28:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5b9yj+KsNZqov/JDe9PNJrN4JcMt+pHCxZZPJ83oefA=; b=RXNChrrYkB94Pd4b
	SZsQImob18efCRa97FH7p9VAWYuZNcmvIeO4dDNRbxNpIxxK0hZpYSJD9hTQAtMy
	HI2lZY62dj0F8ptVFJgkf1xh8nQsp7h7X98rmiMcqDYQm3XpVpPYzO1PtFmZt4xr
	O9Nk+euZvpP3goynK2TvB8kalbLVi4t3OnJyqVezxB8z51F7IKMd1YB0z86dyQfu
	NufvanIfnTxbv1cOD5AMLbFk+mlF5SPs8dgZnX7GNi+Dd5BlALI1VYE/vi6j4AZQ
	b9zjFHbdajIEDm1K1BJIFGDua19B0xr96w1uhI2kyAXhpb/5VML31r1C2rxkZZXg
	as9Drw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 410m290jkc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 07:28:38 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47E7SaoK013350
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 07:28:36 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 14 Aug 2024 00:28:33 -0700
From: Jingyi Wang <quic_jingyw@quicinc.com>
To: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <quic_tingweiz@quicinc.com>, <quic_aiquny@quicinc.com>,
        <quic_tengfan@quicinc.com>
CC: <quic_jingyw@quicinc.com>
Subject: [PATCH 2/3] dt-bindings: arm: qcom,ids: add SoC ID for QCS8275/QCS8300
Date: Wed, 14 Aug 2024 15:28:05 +0800
Message-ID: <20240814072806.4107079-3-quic_jingyw@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240814072806.4107079-1-quic_jingyw@quicinc.com>
References: <20240814072806.4107079-1-quic_jingyw@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: h98bdik0PjV415Q1ihM_z-16SaXvUmzV
X-Proofpoint-ORIG-GUID: h98bdik0PjV415Q1ihM_z-16SaXvUmzV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_04,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 adultscore=0
 impostorscore=0 phishscore=0 malwarescore=0 mlxlogscore=651
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408140051

Add the ID for Qualcomm QCS8275/QCS8300 SoC.

Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
 include/dt-bindings/arm/qcom,ids.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index d6c9e9472121..a213f6244c5d 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -274,6 +274,8 @@
 #define QCOM_ID_QCM8550			604
 #define QCOM_ID_IPQ5300			624
 #define QCOM_ID_IPQ5321			650
+#define QCOM_ID_QCS8300			674
+#define QCOM_ID_QCS8275			675
 
 /*
  * The board type and revision information, used by Qualcomm bootloaders and
-- 
2.25.1


