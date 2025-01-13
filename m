Return-Path: <linux-arm-msm+bounces-44883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83767A0B67D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 13:14:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 594C13A4488
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 12:13:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52CB022F14F;
	Mon, 13 Jan 2025 12:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HIgxbUSU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E9022A4FC;
	Mon, 13 Jan 2025 12:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736770415; cv=none; b=MV1d49xshqtEQHkjNukdnqnocfmnVa/8inF54Mp10PloSuitxduhFJGpVVGd0Ayy/wMcqkdKadA6IANaOeJeCTQkLlT02eFcVnoeZq/XeKfBukz+poN34/Y2LstwxwCaiZ0GpXqVj9nvn1QgHbL6vlk1sjvSl0xp1zsHIhV9naU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736770415; c=relaxed/simple;
	bh=w//yuk4skB9Q+vZbfJkpxgsHvuWxB8AU3j9YyeQErSI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=JPLl32wWCGr+s10nTAU/kswm3OcwxoIkcBxNrCc01SYUgqgFbh3wr4Nf/+TyRq+hC43T+LVvHDtr6tHZOGWWSFG7zpW2pUUlgGKnjt73qHSGVw2xtigkhRs/clziXbR6+BNsIlyjyvWetSsupQ8FQUtaLJfRXR1yeacmo5zmWT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HIgxbUSU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D2rstu029564;
	Mon, 13 Jan 2025 12:13:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6rQB5DgMgh2mLwujMp9r28ymI3Twq3DXYIClOqu4qd8=; b=HIgxbUSUiucLYZ6z
	L0JjqfUpAwrb+t4HNR+9CCYHnSxzX2uDA3bLpHTY/jLCrhAg2XR+Wf5/vLJ8ci5z
	Me4rQenqte1IgPZiPXzvjW+7HsDRwZv9daYAnh5lOujYLzbFU9eKsgB10ZaUPlIO
	kjaXoyPwUlUOHMUX3j7vgc2WgWJbWIVqQT0Zv42BOVl/2hqAvRwoWgqoFZgPikYB
	JtzBvbqYayFdrrcKhpn3XxTRMP1aEJgx3n0rwJhegzqjiDLyIgiTDInnN/QaYrvp
	IZLYXtw7wih2s5lq3xh//YrH2thD8f5wI9/j+jODXvgu7QSzE2AlIMlnPPIirtRu
	ZJY0hw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 444tevsf24-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 12:13:30 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50DCDTPt012405
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 12:13:29 GMT
Received: from hu-pbrahma-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 Jan 2025 04:13:26 -0800
From: Pratyush Brahma <quic_pbrahma@quicinc.com>
Date: Mon, 13 Jan 2025 17:43:07 +0530
Subject: [PATCH v2 2/3] arm64: dts: qcom: qcs9100: Update memory map
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250113-sa8775p-iot-memory-map-v2-2-aa2bb544706e@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736770400; l=1308;
 i=quic_pbrahma@quicinc.com; s=20250113; h=from:subject:message-id;
 bh=w//yuk4skB9Q+vZbfJkpxgsHvuWxB8AU3j9YyeQErSI=;
 b=uLe6yj3GALV1amnSWUxZV9vR+1H28RYDmHT17XiocYwAXp37g7mp/UsmZrHeUna9PyGDjMBcm
 Ns4iX/WjFBoBecSX+vcfl6El1qcva6xYzmG/eYXI3qCNL9FyirgKAZ8
X-Developer-Key: i=quic_pbrahma@quicinc.com; a=ed25519;
 pk=YvfZKC4rRO1Fot+wlXZqsoQWnAtLqrpMyEzslw3Ji+M=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: XymFlFOR_KbtpTO-YJ2deLFD7aQSDI3j
X-Proofpoint-GUID: XymFlFOR_KbtpTO-YJ2deLFD7aQSDI3j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 mlxscore=0 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 adultscore=0 mlxlogscore=506 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501130103

Update the iot specific memory map for qcs9100* boards.

Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts | 2 ++
 arch/arm64/boot/dts/qcom/qcs9100-ride.dts    | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts b/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts
index 759d1ec694b20e9cead674c1bd61c6a6627eeb27..06e57239bbe975b9c0b939d438095692243e39cf 100644
--- a/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts
@@ -5,6 +5,8 @@
 /dts-v1/;
 
 #include "sa8775p-ride-r3.dts"
+#include "sa8775p-iot.dtsi"
+
 / {
 	model = "Qualcomm QCS9100 Ride Rev3";
 	compatible = "qcom,qcs9100-ride-r3", "qcom,qcs9100", "qcom,sa8775p";
diff --git a/arch/arm64/boot/dts/qcom/qcs9100-ride.dts b/arch/arm64/boot/dts/qcom/qcs9100-ride.dts
index 979462dfec30ecbe6c437fd676c3da2d4386ff8e..27d5461acbf070d696cdad0c068f4e031f2beb67 100644
--- a/arch/arm64/boot/dts/qcom/qcs9100-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs9100-ride.dts
@@ -5,6 +5,8 @@
 /dts-v1/;
 
 #include "sa8775p-ride.dts"
+#include "sa8775p-iot.dtsi"
+
 / {
 	model = "Qualcomm QCS9100 Ride";
 	compatible = "qcom,qcs9100-ride", "qcom,qcs9100", "qcom,sa8775p";

-- 
2.22.0


