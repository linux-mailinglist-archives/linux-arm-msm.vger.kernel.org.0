Return-Path: <linux-arm-msm+bounces-41455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 313279EC93D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 10:36:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 377E81680DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 09:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 348F91A83F5;
	Wed, 11 Dec 2024 09:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Y/pp1H2q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A561A83E1;
	Wed, 11 Dec 2024 09:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733909777; cv=none; b=DLRlIgMnz1rfIPgLayn7s0WbUGcX2bPjqM0aDEqga32nMAYDgI7mgMLFOZP9wc7GvZ5jLYVC4W/Lw/YnII42/LkSD0e622qgauAjVKuSJcz+12T9ZPt+PGcLiKZuD9kKhArW+bUj6nOuAWCmpe95g5G9UsS+fDSJicoZHuIjdjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733909777; c=relaxed/simple;
	bh=3x9nmfPFSyjJD8cJTggM9pdMGEg0mHaTpfHvrYUgg3k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=V0DbeHkcIcitJuLPWc7mNyYXmjYQtuyDefVFaDlxdosPvGiko3/gavDnstp4RBUaLrOydehkpTi1PQKKULYNaAyLIPu7y45sJOxbOVW/ouHb2bO+jSwLF88TV6DaT25Wm+pKnJjI3YyW0p1n/uxzphkAUoblQBZwhEVyat3NZGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Y/pp1H2q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BB8d06f019422;
	Wed, 11 Dec 2024 09:36:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qWyv3ADAxqhL8voe/0/BZQ
	u1nx/AkuQo8AMGpdZHP+c=; b=Y/pp1H2quoaJ6rmssTWWc4udA9jaxHrUAOoeie
	jvBoW5fEoutMbfUUfqNnSSSu1BkTMB8xXysLHkH7rAfiXI0qVXvOMFQy7IFm1tjF
	UvjGWAFeoN4lMUq6Man4UXK0FuQlZd0w39H6jxrDmdB3AhZLongRBlLkKrWZMIrA
	Lfs6wW/1612LnJt6b1QmmVPXqDn0RMKCl+b9xXWWF81mekOIXE3GP0wTi2srjt+6
	qhDgG9EdUYRKshXp/h+LhrB+AehCnLv+lYSSqV4ZNWdUDt1LleDGkJl3CoF3kIu/
	QW8974O7yvva96GacII8KQ5q7sGvet5ci/54z0SdNmThP5Mg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f7dpg5ws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 09:36:08 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BB9a78n020188
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 09:36:07 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 11 Dec 2024 01:36:01 -0800
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Wed, 11 Dec 2024 17:35:46 +0800
Subject: [PATCH] arm64: dts: qcom: qcs615: Add CPU capacity and DPC
 properties
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241211-add_cpu_capacity_and_dpc_properties-v1-1-03aaee023a77@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAPFcWWcC/x3NSwrDMAwA0asErWuITUg/VylFKJbSauMIOS0tI
 XeP6XI2bzao4ioVbt0GLh+tupQW8dRBflF5SlBuDalPQ0wxBmLGbG/MZJR1/SEVRraM5ouJrw0
 LFx7HdOZpnvorNMlcZv3+L/fHvh8Wuol6dQAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Lijuan Gao
	<quic_lijuang@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733909760; l=2894;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=3x9nmfPFSyjJD8cJTggM9pdMGEg0mHaTpfHvrYUgg3k=;
 b=KHAAqp0nKLTqUHy7icxGoXUvxEK+EMVy3H3Y8OshpmTfZDxjAEW/XD1Kk2t+q8WbZ8eaYxlHK
 w33BVa4Xy9vA1c3Wm3KgmZ1QzKQbk0X7VeMnWD5iFfnKYYQ0y6EhS3O
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: aoBs9U8cGcVEQQDpWrudbr0ISk2jtDOx
X-Proofpoint-ORIG-GUID: aoBs9U8cGcVEQQDpWrudbr0ISk2jtDOx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 mlxlogscore=765 mlxscore=0 adultscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412110072

Add "capacity-dmips-mhz" and "dynamic-power-coefficient" to the QCS615 SoC.
They are used to build the energy model, which in turn is used by EAS to
take placement decisions.

Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index c0e4b376a1c6..5d2034a10f2e 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -29,6 +29,8 @@ cpu0: cpu@0 {
 			enable-method = "psci";
 			power-domains = <&cpu_pd0>;
 			power-domain-names = "psci";
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <100>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 
@@ -47,6 +49,8 @@ cpu1: cpu@100 {
 			enable-method = "psci";
 			power-domains = <&cpu_pd1>;
 			power-domain-names = "psci";
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <100>;
 			next-level-cache = <&l2_100>;
 
 			l2_100: l2-cache {
@@ -64,6 +68,8 @@ cpu2: cpu@200 {
 			enable-method = "psci";
 			power-domains = <&cpu_pd2>;
 			power-domain-names = "psci";
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <100>;
 			next-level-cache = <&l2_200>;
 
 			l2_200: l2-cache {
@@ -81,6 +87,8 @@ cpu3: cpu@300 {
 			enable-method = "psci";
 			power-domains = <&cpu_pd3>;
 			power-domain-names = "psci";
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <100>;
 			next-level-cache = <&l2_300>;
 
 			l2_300: l2-cache {
@@ -98,6 +106,8 @@ cpu4: cpu@400 {
 			enable-method = "psci";
 			power-domains = <&cpu_pd4>;
 			power-domain-names = "psci";
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <100>;
 			next-level-cache = <&l2_400>;
 
 			l2_400: l2-cache {
@@ -115,6 +125,8 @@ cpu5: cpu@500 {
 			enable-method = "psci";
 			power-domains = <&cpu_pd5>;
 			power-domain-names = "psci";
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <100>;
 			next-level-cache = <&l2_500>;
 
 			l2_500: l2-cache {
@@ -132,6 +144,8 @@ cpu6: cpu@600 {
 			enable-method = "psci";
 			power-domains = <&cpu_pd6>;
 			power-domain-names = "psci";
+			capacity-dmips-mhz = <1740>;
+			dynamic-power-coefficient = <404>;
 			next-level-cache = <&l2_600>;
 			#cooling-cells = <2>;
 
@@ -150,6 +164,8 @@ cpu7: cpu@700 {
 			enable-method = "psci";
 			power-domains = <&cpu_pd7>;
 			power-domain-names = "psci";
+			capacity-dmips-mhz = <1740>;
+			dynamic-power-coefficient = <404>;
 			next-level-cache = <&l2_700>;
 
 			l2_700: l2-cache {

---
base-commit: 91e71d606356e50f238d7a87aacdee4abc427f07
change-id: 20241211-add_cpu_capacity_and_dpc_properties-8d6627dbfb09

Best regards,
-- 
Lijuan Gao <quic_lijuang@quicinc.com>


