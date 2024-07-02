Return-Path: <linux-arm-msm+bounces-24913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 593089247EF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 21:16:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B3881F23EF7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 19:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E340F1CE089;
	Tue,  2 Jul 2024 19:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="W0sPLpAx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F25E1CD5BD;
	Tue,  2 Jul 2024 19:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719947747; cv=none; b=oOxJl9CiHjpaxkiE4k9eEGiaudBX7pLQXHFUkEFp27oSbOsfL2lFPiLfT3v5yc9lE4N7XOn84OPY3C8gYi+IOXGfouDFTyCg14xwGalMAtQpitX0wsSshz47x2u2gDbxK3vzYso2H6ES9avOL/Xi5+q5E30zqJuaJ+F+wK2rpYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719947747; c=relaxed/simple;
	bh=pfMkyjuvRtamSZMSJMzdTMGkZMAFigbflx5Btyo5yE8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a3MscCkx7HJLVIZ+subPnGav2VAuYu4ZuSLcHBZgZVYmuCGnpmTgrxWBk8VMgaktlMAry/ES29D3gBMQXM3j7maxME5PeYqqIs/yD4K2aycvikUj9Ns1lxrRpxxPOVLuutvJfjbuLjVBiAnVFjVKB2xVnNHG84r6oHbbuBhzb1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=W0sPLpAx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 462HA1tB002698;
	Tue, 2 Jul 2024 19:15:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WhrtesgoL3y0EfWp8cvcQjNbzmfrKnZOHQLRPW0Yz+o=; b=W0sPLpAxc7eHQM16
	VQG2Lzg74vgBc0l7rSnTocgipJZoxnAui5lQagN9pzGLdJIHdpO/CTHHhiH6m2ng
	t7nr/FbT5FX9JcyWaTmlf6I4BGvHukS1Z20yzmIrflWfde9q2qlbql27e9bkZXyl
	Dgl7b5lke0t04jXwol05Q7SDHXUBg8iknmHRhktk2DVBwjLak5eakgOFZ9T0smdY
	6rFW7J6HIMBlW/JdUW1SF64Ub4hqUGs52ICgevb+zQNHSCwpEU/1PTIZhFam634V
	WosMkF1VxMdpXD882+lcb5R485gBwMlMYCcX5sfgl8BDyHjhqMvhwLCosz+6R1QM
	oykHrQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4029kh6su6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Jul 2024 19:15:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 462JFKFA023762
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 2 Jul 2024 19:15:20 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 2 Jul 2024 12:15:15 -0700
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_rgottimu@quicinc.com>, <quic_kshivnan@quicinc.com>,
        <quic_sibis@quicinc.com>, <conor+dt@kernel.org>
Subject: [RFC V3 4/4] arm64: dts: qcom: x1e80100: Enable LLCC/DDR/DDR_QOS dvfs
Date: Wed, 3 Jul 2024 00:44:40 +0530
Message-ID: <20240702191440.2161623-5-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240702191440.2161623-1-quic_sibis@quicinc.com>
References: <20240702191440.2161623-1-quic_sibis@quicinc.com>
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
X-Proofpoint-GUID: qzETlXD4ePxVMT1lbDLkMxSG6CyF1V_V
X-Proofpoint-ORIG-GUID: qzETlXD4ePxVMT1lbDLkMxSG6CyF1V_V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-02_14,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=969
 priorityscore=1501 suspectscore=0 adultscore=0 mlxscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407020141

Enable LLCC/DDR/DDR_QOS dvfs through the ARM SCMI QCOM vendor protocol.

Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
---

V2:
* Drop container dvfs memlat container node. [Rob]
* Replace qcom,cpulist with the standard "cpus" property. [Rob]
* Minor style fixes in dts.

 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 138 +++++++++++++++++++++++++
 1 file changed, 138 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 985b9a33285e..b22e74f64481 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -17,6 +17,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/soc/qcom,scmi-vendor.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
 / {
@@ -323,6 +324,143 @@ scmi_dvfs: protocol@13 {
 				reg = <0x13>;
 				#power-domain-cells = <1>;
 			};
+
+			scmi_vendor: protocol@80 {
+				reg = <0x80>;
+
+				memory-0 {
+					qcom,memory-type = <QCOM_MEM_TYPE_DDR>;
+					freq-table-hz = /bits/ 64 <200000000 4224000000>;
+
+					monitor-0 {
+						cpus = <&CPU0 &CPU1 &CPU2 &CPU3 &CPU4 &CPU5 &CPU6
+							&CPU7 &CPU8 &CPU9 &CPU10 &CPU11>;
+						qcom,ipm-ceil = <20000000>;
+						operating-points-v2 = <&memory0_monitor0_opp_table>;
+
+						memory0_monitor0_opp_table: opp-table {
+							compatible = "operating-points-v2";
+
+							opp-999000000 {
+								opp-hz = /bits/ 64 <999000000 547000000>;
+							};
+
+							opp-1440000000 {
+								opp-hz = /bits/ 64 <1440000000 768000000>;
+							};
+
+							opp-1671000000 {
+								opp-hz = /bits/ 64 <1671000000 1555000000>;
+							};
+
+							opp-2189000000 {
+								opp-hz = /bits/ 64 <2189000000 2092000000>;
+							};
+
+							opp-2516000000 {
+								opp-hz = /bits/ 64 <2516000000 3187000000>;
+							};
+
+							opp-3860000000 {
+								opp-hz = /bits/ 64 <3860000000 4224000000>;
+							};
+						};
+					};
+
+					monitor-1 {
+						cpus = <&CPU0 &CPU1 &CPU2 &CPU3 &CPU4 &CPU5 &CPU6
+							&CPU7 &CPU8 &CPU9 &CPU10 &CPU11>;
+						operating-points-v2 = <&memory0_monitor1_opp_table>;
+						qcom,compute-type;
+
+						memory0_monitor1_opp_table: opp-table {
+							compatible = "operating-points-v2";
+
+							opp-1440000000 {
+								opp-hz = /bits/ 64 <1440000000 200000000>;
+							};
+
+							opp-2189000000 {
+								opp-hz = /bits/ 64 <2189000000 768000000>;
+							};
+
+							opp-2516000000 {
+								opp-hz = /bits/ 64 <2516000000 1555000000>;
+							};
+
+							opp-3860000000 {
+								opp-hz = /bits/ 64 <3860000000 4224000000>;
+							};
+						};
+					};
+				};
+
+				memory-1 {
+					qcom,memory-type = <QCOM_MEM_TYPE_LLCC>;
+					freq-table-hz = /bits/ 64 <300000000 1067000000>;
+
+					monitor-0 {
+						cpus = <&CPU0 &CPU1 &CPU2 &CPU3 &CPU4 &CPU5 &CPU6
+							&CPU7 &CPU8 &CPU9 &CPU10 &CPU11>;
+						qcom,ipm-ceil = <20000000>;
+						operating-points-v2 = <&memory1_monitor0_opp_table>;
+
+						memory1_monitor0_opp_table: opp-table {
+							compatible = "operating-points-v2";
+
+							opp-999000000 {
+								opp-hz = /bits/ 64 <999000000 300000000>;
+							};
+
+							opp-1440000000 {
+								opp-hz = /bits/ 64 <1440000000 466000000>;
+							};
+
+							opp-1671000000 {
+								opp-hz = /bits/ 64 <1671000000 600000000>;
+							};
+
+							opp-2189000000 {
+								opp-hz = /bits/ 64 <2189000000 806000000>;
+							};
+
+							opp-2516000000 {
+								opp-hz = /bits/ 64 <2516000000 933000000>;
+							};
+
+							opp-3860000000 {
+								opp-hz = /bits/ 64 <3860000000 1066000000>;
+							};
+						};
+					};
+				};
+
+				memory-2 {
+					qcom,memory-type = <QCOM_MEM_TYPE_DDR_QOS>;
+					freq-table-hz = /bits/ 64 <QCOM_DDR_LEVEL_AUTO QCOM_DDR_LEVEL_PERF>;
+
+					monitor-0 {
+						qcom,ipm-ceil = <20000000>;
+						cpus = <&CPU0 &CPU1 &CPU2 &CPU3 &CPU4 &CPU5 &CPU6
+							&CPU7 &CPU8 &CPU9 &CPU10 &CPU11>;
+						operating-points-v2 = <&memory2_monitor0_opp_table>;
+
+						memory2_monitor0_opp_table: opp-table {
+							compatible = "operating-points-v2";
+
+							opp-2189000000 {
+								opp-hz = /bits/ 64 <2189000000>;
+								opp-level = <QCOM_DDR_LEVEL_AUTO>;
+							};
+
+							opp-3860000000 {
+								opp-hz = /bits/ 64 <3860000000>;
+								opp-level = <QCOM_DDR_LEVEL_PERF>;
+							};
+						};
+					};
+				};
+			};
 		};
 	};
 
-- 
2.34.1


