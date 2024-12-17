Return-Path: <linux-arm-msm+bounces-42524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE7E9F4A14
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 12:40:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8189416BF3C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 11:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93CDC1F1312;
	Tue, 17 Dec 2024 11:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hDJsCN9a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47D71F12FE;
	Tue, 17 Dec 2024 11:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734435581; cv=none; b=Sa1RCu0hxFKa8k9HVSIA/l1UqS6GpliOLL3t3LM9JxvoyX3I1fAc2wWd47RnNBKkZkCW24DYDYnNhnI7ctbXvRLMAKFKDtnvbEaAL1uNsJa8FBxOzQZmnJcO4o0IISK/pBMWntkblYr2DxyZPxWRjGDdOpLFY4eP5lIp254837E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734435581; c=relaxed/simple;
	bh=UIkY2UhnbvwHnMmCGeW/C0EwLnP8uo7nIwvagSY1I+w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O/Zy0gqivfNfqeFe1XliSQCIjg8/Hkv21s5ZXUEPZxsJ05F9gL7nkrHSkaDPLcghi0pThzuMIp4N2z/8tWMGPmctoy2+wy6Rw0hU1vdwD4ETGkk63ana2iRyCehYcuEVvb9co67gDdU6lQQDQIEyoJdDsqQRwmsdgXN3rtnJzeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hDJsCN9a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH6RaRj002735;
	Tue, 17 Dec 2024 11:39:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zGBtT2gX9hHQA7lfV0Zin+SsHMSdMq+rY2wR6aogZ/E=; b=hDJsCN9almNIziFP
	JKyWqGREdq64Vz53cHpuG21XrL+o05ZQoss4OXy6T2yMN74FTcRBgwR6ntG/7JTq
	v5oUeCOIdzooKDVKxUPzN68qrleFBhXIlQPpwziEquvFtWki6H422ggOEk1KNaT2
	lZAJV4is3bAjgFWf66PgfPhMJoZStirsU524q0gSrRQIjLHGaSfpge1PSiNl/VrF
	BWS719fr3rcl570iqlIKwQqJMmbomRvSGbNYSPN4CihAaeC0ZFJun3qvDzrpXghY
	zojQRLbd5I3yby6Qu5T2XyRMhUL1WRB/RF8evZhlbnkceeL4V00hlZfQshBwGDIU
	0fpNtg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k424gvdr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 11:39:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BHBdYvw005430
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 11:39:34 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 17 Dec 2024 03:39:30 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH v2 2/2] dt-bindings: clock: qcom: gcc-ipq5424: remove apss_dbg clock macro
Date: Tue, 17 Dec 2024 17:09:09 +0530
Message-ID: <20241217113909.3522305-3-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217113909.3522305-1-quic_mmanikan@quicinc.com>
References: <20241217113909.3522305-1-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WTy2Y4-6Kixwy6nnWW_IwfHN2SKf9w70
X-Proofpoint-ORIG-GUID: WTy2Y4-6Kixwy6nnWW_IwfHN2SKf9w70
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 suspectscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170096

The gcc_apss_dbg clk is access protected by trust zone, and accessing
it results in a kernel crash. Therefore remove the gcc_apss_dbg_clk macro.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
Changes in V2:
	- Pick up A-b tag.
	- Updated commit message.
	- Patch #1 from V1 has been moved to Patch #2 in V2 to enusre
	  it is bisecatble.

 include/dt-bindings/clock/qcom,ipq5424-gcc.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/dt-bindings/clock/qcom,ipq5424-gcc.h b/include/dt-bindings/clock/qcom,ipq5424-gcc.h
index 755ce7a71c7c..9f14680052a0 100644
--- a/include/dt-bindings/clock/qcom,ipq5424-gcc.h
+++ b/include/dt-bindings/clock/qcom,ipq5424-gcc.h
@@ -12,7 +12,6 @@
 #define GPLL2					2
 #define GPLL2_OUT_MAIN                          3
 #define GCC_SLEEP_CLK_SRC			4
-#define GCC_APSS_DBG_CLK                        5
 #define GCC_USB0_EUD_AT_CLK			6
 #define GCC_PCIE0_AXI_M_CLK_SRC			7
 #define GCC_PCIE0_AXI_M_CLK			8
-- 
2.34.1


