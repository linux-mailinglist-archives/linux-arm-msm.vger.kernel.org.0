Return-Path: <linux-arm-msm+bounces-34716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2469A1E59
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 11:29:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BA3ECB24A7B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 09:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 623AA1D9591;
	Thu, 17 Oct 2024 09:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Hdaw8qPD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101BF1D90D9;
	Thu, 17 Oct 2024 09:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729157336; cv=none; b=groGnOpoy9bBbeYHDa6EC6mkFGt7IZYS3jjmFl+KOIkwx8FwNhysjHlk8OFwKkIHZ4Z9M3htff0Be/8qiuaxePgNmXML+Wybwmsb4tbw7av+jlCI8/53t+ua5nIEtUrRWjw/3lk03Tt/FlTiM5xOB4kS3QWfUspAWHX+Wayiv8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729157336; c=relaxed/simple;
	bh=83cH9HJgjYFVsjIC3u9qtw9cDZHkMSXGwxmMITfT6Hg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=BWAjxyjFuwZR/N+xCkbHcrftLPPTpDG635/WJPoTPLbPzDJTcw2jb1ZYDYolKzZPpE8GXmwtYAJ/b5ZhS+knZmSFlCafXfg354ywP9/uvJeVQSQhZJqZEjNFs2NwZ9zomUYRQbDHbIAgCeDl8fOGT0eLub2bZcnh5kyCjDU7694=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Hdaw8qPD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49H7kldv007441;
	Thu, 17 Oct 2024 09:28:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JE5+ih9zaWyyFOnZT7dIsaFRI1fg7+sYKmqRnQBgvNY=; b=Hdaw8qPDIi1L/RXW
	DX1ocAqZNUcvfh278s/scPkiPPnJKDqGIgaPWovwavQh1eS+UDPp8jCSwFLk+QPg
	w5U2sVTypKKTlBQHGAVWQJjWfZ6oq9QdyVr4uJv8JZxNsM6lXXef+LT+bKCuPdZK
	rjeJFZbNsQiasftJrd5dTzsPuCHYWNHWjZyKqN1l1fefDmcrMSAaAvNXzXo9dYFY
	vs31pKdhxRYg9f3DmlVGnbmuut63iVGmgwxKDUplaoM1prm4m7Y5HB53WlBjFyKD
	e/3yi7T3kyKTqSu3rs+6izpP/3JZj0UCaPY7ahcw5v0B4RiWR1mNVLG0x8o1kBOE
	g6bm8g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429mjy7mtq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 09:28:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49H9SlTt006560
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 09:28:47 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 17 Oct
 2024 02:28:43 -0700
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Date: Thu, 17 Oct 2024 14:58:30 +0530
Subject: [PATCH 1/3] arm64: dts: qcom: sa8775p: Add support to scale DDR/L3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241017-sa8775p-cpufreq-l3-ddr-scaling-v1-1-074e0fb80b33@quicinc.com>
References: <20241017-sa8775p-cpufreq-l3-ddr-scaling-v1-0-074e0fb80b33@quicinc.com>
In-Reply-To: <20241017-sa8775p-cpufreq-l3-ddr-scaling-v1-0-074e0fb80b33@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        "Imran
 Shaik" <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya Kakitapalli" <quic_skakitap@quicinc.com>,
        Jagadeesh Kona
	<quic_jkona@quicinc.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5dl_MOTuKDSef_8MzPAr_XIlZ91Zhtbw
X-Proofpoint-ORIG-GUID: 5dl_MOTuKDSef_8MzPAr_XIlZ91Zhtbw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=818 phishscore=0
 mlxscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170063

Add support to scale DDR and L3 based on CPU frequencies
on SA8775P platform.

Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 06bf2ba556b89b643da901857a9aa7cdc7ba90cc..d8b90bd4b1f05604185f015929a1f296799ad6a4 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/interconnect/qcom,icc.h>
+#include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
@@ -47,6 +48,10 @@ CPU0: cpu@0 {
 			next-level-cache = <&L2_0>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3_cl0 MASTER_EPSS_L3_APPS
+					&epss_l3_cl0 SLAVE_EPSS_L3_SHARED>;
 			L2_0: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
@@ -69,6 +74,10 @@ CPU1: cpu@100 {
 			next-level-cache = <&L2_1>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3_cl0 MASTER_EPSS_L3_APPS
+					&epss_l3_cl0 SLAVE_EPSS_L3_SHARED>;
 			L2_1: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
@@ -86,6 +95,10 @@ CPU2: cpu@200 {
 			next-level-cache = <&L2_2>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3_cl0 MASTER_EPSS_L3_APPS
+					&epss_l3_cl0 SLAVE_EPSS_L3_SHARED>;
 			L2_2: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
@@ -103,6 +116,10 @@ CPU3: cpu@300 {
 			next-level-cache = <&L2_3>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3_cl0 MASTER_EPSS_L3_APPS
+					&epss_l3_cl0 SLAVE_EPSS_L3_SHARED>;
 			L2_3: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
@@ -120,6 +137,10 @@ CPU4: cpu@10000 {
 			next-level-cache = <&L2_4>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3_cl1 MASTER_EPSS_L3_APPS
+					&epss_l3_cl1 SLAVE_EPSS_L3_SHARED>;
 			L2_4: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
@@ -143,6 +164,10 @@ CPU5: cpu@10100 {
 			next-level-cache = <&L2_5>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3_cl1 MASTER_EPSS_L3_APPS
+					&epss_l3_cl1 SLAVE_EPSS_L3_SHARED>;
 			L2_5: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
@@ -160,6 +185,10 @@ CPU6: cpu@10200 {
 			next-level-cache = <&L2_6>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3_cl1 MASTER_EPSS_L3_APPS
+					&epss_l3_cl1 SLAVE_EPSS_L3_SHARED>;
 			L2_6: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
@@ -177,6 +206,10 @@ CPU7: cpu@10300 {
 			next-level-cache = <&L2_7>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3_cl1 MASTER_EPSS_L3_APPS
+					&epss_l3_cl1 SLAVE_EPSS_L3_SHARED>;
 			L2_7: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;

-- 
2.34.1


