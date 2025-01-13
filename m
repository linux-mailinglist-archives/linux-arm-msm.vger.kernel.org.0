Return-Path: <linux-arm-msm+bounces-44884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 542BCA0B681
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 13:14:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EAD3118865B4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 12:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23E2622F17F;
	Mon, 13 Jan 2025 12:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="V+uFfffY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996B422A4E8;
	Mon, 13 Jan 2025 12:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736770417; cv=none; b=q+j6T2jAIFwllCgP8wds07j20ZrFpF/0n327dpM8tevhI/AsFDNBOGRit1Kh2opFDVd7n5fiAv55qoKKmgv4FDZP4nw2wyYGrNpOjkmbbEWFZC0iu/JYuXYbxzzLCaU3+p4ztULFe1gRsyOymDmvKihx3Os39Y619/aAg6+IcBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736770417; c=relaxed/simple;
	bh=PaFzif1sJvn2/yPj5jQHN74vPbwpP3BV/hQP1N2aCSY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=IWi4DdvUidCVkixrmT/pUaRHs+FcrxL89iNsAlxVNT5HuR4a4uAb5y+jx1qZcf3nII4js0yiyNKheDN5GUFH4+0ITVlVhjR+jxzWf6AFHabDFX+0jlVvbn4L9ZxljswKKUmkmY1+SQ8h/O7J50ovf+7JqQ02sjgcP8rWxxbTM/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=V+uFfffY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DBD0gt021694;
	Mon, 13 Jan 2025 12:13:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e5JZoap/hMEkgDwTgoI3MPEzte/kchJYBufBAF1WdKM=; b=V+uFfffYXgTFb099
	a73W9XIPRjDnQRxedOxdiF2rkesR5I7sRPudsURXFGLJZzmds1+f7SmNqAJMdB0/
	J/pLT2wwB7BVToJkAHCGdXNYK57ozJfVobjY08DQkuF3uS4mHQc6USkebuvVQq7e
	st+yBOPf1JxChLnYtSrWOCqdn2uejWfumTDJKP+C44bgIt/IHAbNkTKMS2HXN/Mj
	UIOA3vTurHGq4IQ/GehoYpdqTUjr8U6XW99nbLHFxgd5xwTW8F7wuDvVykOhgydj
	9EawzDVaB5t7X6IfJMiK3YnjhNHAH3y2RK1dnLvrCSS4wGW5dyjN4tgb1gSNa+cV
	caaL5A==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 444swy9ggv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 12:13:32 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50DCDVtA006575
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 12:13:31 GMT
Received: from hu-pbrahma-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 Jan 2025 04:13:29 -0800
From: Pratyush Brahma <quic_pbrahma@quicinc.com>
Date: Mon, 13 Jan 2025 17:43:08 +0530
Subject: [PATCH v2 3/3] arm64: dts: qcom: qcs9075: Update memory map
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250113-sa8775p-iot-memory-map-v2-3-aa2bb544706e@quicinc.com>
References: <20250113-sa8775p-iot-memory-map-v2-0-aa2bb544706e@quicinc.com>
In-Reply-To: <20250113-sa8775p-iot-memory-map-v2-0-aa2bb544706e@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Pratyush Brahma <quic_pbrahma@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736770400; l=1955;
 i=quic_pbrahma@quicinc.com; s=20250113; h=from:subject:message-id;
 bh=PaFzif1sJvn2/yPj5jQHN74vPbwpP3BV/hQP1N2aCSY=;
 b=iBuarlDNxMpqTkUyMG+NkeltSrw728jq7gBjvjdknMNfqUKY+5Vdwin/yzIDDNRRQ8laJVvPY
 JXzg7n599V/Bh4+8zPVqqEwjutpQqooY3ooG8hbVVxj5y2vgpAUzhYC
X-Developer-Key: i=quic_pbrahma@quicinc.com; a=ed25519;
 pk=YvfZKC4rRO1Fot+wlXZqsoQWnAtLqrpMyEzslw3Ji+M=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JK3xm1B8mr9rrFY-kgJySnuETn9WvZzB
X-Proofpoint-ORIG-GUID: JK3xm1B8mr9rrFY-kgJySnuETn9WvZzB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 clxscore=1015 mlxscore=0 bulkscore=0 mlxlogscore=512 impostorscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130102

Update the iot specific memory map for qcs9075* boards.

This depends on Wasim Nazir's patches [1] to introduce
qcs9075 boards.

[1] https://lore.kernel.org/all/20241229152332.3068172-1-quic_wasimn@quicinc.com/

Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs9075-rb8.dts     | 1 +
 arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts | 1 +
 arch/arm64/boot/dts/qcom/qcs9075-ride.dts    | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs9075-rb8.dts b/arch/arm64/boot/dts/qcom/qcs9075-rb8.dts
index 3ab6deeaacf18eb4d5859f1bbb80c244bf8f224c..4458e2db2f3f2b222376b92e5c46c6557a1583b3 100644
--- a/arch/arm64/boot/dts/qcom/qcs9075-rb8.dts
+++ b/arch/arm64/boot/dts/qcom/qcs9075-rb8.dts
@@ -10,6 +10,7 @@
 #include "sa8775p.dtsi"
 #include "sa8775p-pmics.dtsi"
 #include "qcs9075-thermal.dtsi"
+#include "sa8775p-iot.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. Robotics RB8";
diff --git a/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts b/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
index 5f2d9f4166172a85f8d69f6cd8813d4469de5bd3..231c1e3f73eb3e11dc50bbebb1773e31a0c71723 100644
--- a/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
@@ -6,6 +6,7 @@
 
 #include "sa8775p-ride.dtsi"
 #include "qcs9075-thermal.dtsi"
+#include "sa8775p-iot.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. QCS9075 Ride Rev3";
diff --git a/arch/arm64/boot/dts/qcom/qcs9075-ride.dts b/arch/arm64/boot/dts/qcom/qcs9075-ride.dts
index 10ce48e7ba2f53a6daef8beba4d29d2907990baf..3d85a7636adb2d9462308d48cf0431e266807af7 100644
--- a/arch/arm64/boot/dts/qcom/qcs9075-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs9075-ride.dts
@@ -6,6 +6,7 @@
 
 #include "sa8775p-ride.dtsi"
 #include "qcs9075-thermal.dtsi"
+#include "sa8775p-iot.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. QCS9075 Ride";

-- 
2.22.0


