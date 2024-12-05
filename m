Return-Path: <linux-arm-msm+bounces-40435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D329E4DAD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 07:41:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EEF27161C01
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 06:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD49919645D;
	Thu,  5 Dec 2024 06:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="h3CMn8MD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3BD18FDDC;
	Thu,  5 Dec 2024 06:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733380885; cv=none; b=fspsqxO9/WQhOgZHFb1gHnbhENzA+71VT1BlKdUrPSjuvB+ZkfeA07kMJUAzpoczM9tIYNF6v7aJAYsUkZfyOBYOQFs/o1a5MhxTJmcAwdwB41TD/BxZONPwdzyBpNJ6K9i2Umxc59dVIn0DG+hFiYN0IBILuJ6wuyphr0XbOjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733380885; c=relaxed/simple;
	bh=pnQ7lrd5rJR2VwEgYT3foFAOMi1xJ0apXrQnyBre3WI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J23ljrUSYj7BIKAa0c6Y4EfHXf9rrFN/gfWO5YBU0WhOZ21fUZ356IKKZPLM0BgswzJCIaq9RIs2xdX9wy3cZNxe7I1Khz7C4FDxbqAIv2kfMMR33tHhJ9I4MocTyJEINFve9h6Bv5Z7dk2fssTXOhTXTvUFaxeSvqc/vTM1pic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=h3CMn8MD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4HRtKw031023;
	Thu, 5 Dec 2024 06:41:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RIum3ECAP3cphxVispyZ3KDCFW8Nu1CKDyKVVZCtLrc=; b=h3CMn8MDs0UUXnj7
	RFNtT7iDxBK9/NdDfCds+rHTpM/UaXhFJlgl2iedR5vuPI4h7Z7TPAyYJDeZT8OZ
	Y9fyzVKThB9djC2i6eeF0FqFzKM12F+nQX6ACKaN4t0wuV/vJaQHsTJw9KVHy+4f
	CZmlMT0jEyccx7T9NlQjVktrM9B3dpWJpUaOA/oWLq2KG1YWFQ9dDFbCyTbYBmjU
	LGYujQp7/oOwdE7e4unY06wNno/mlHQC3tv5aFjht//JMyHHc97Nn293hixjNaO/
	RScb5aZvzthbQSUuNfGDOQah6FnYjuZqfkFqXZh2jsoe4kz28dS1eTOckEbxAoC7
	JbsIAg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439w90xkfu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 06:41:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B56f7Cw022285
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Dec 2024 06:41:07 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 4 Dec 2024 22:41:03 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH 1/2] dt-bindings: clock: qcom: gcc-ipq5424: remove apss_dbg clock macro
Date: Thu, 5 Dec 2024 12:10:36 +0530
Message-ID: <20241205064037.1960323-2-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241205064037.1960323-1-quic_mmanikan@quicinc.com>
References: <20241205064037.1960323-1-quic_mmanikan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: EvW-3B3r_eisskxLUgrBqyYwzPN-iDc3
X-Proofpoint-GUID: EvW-3B3r_eisskxLUgrBqyYwzPN-iDc3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=955 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050050

Since gcc_apss_dbg_clk has no consumers, the linux kernel will turn it
off. This causes a kernel crash because this clock is access protected
by trust zone. Therefore remove the gcc_apss_dbg_clk macro.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
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


