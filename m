Return-Path: <linux-arm-msm+bounces-55387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CF9A9ACAB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 14:00:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 789824427B2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 12:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F239230BD4;
	Thu, 24 Apr 2025 11:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XG9gFkdc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A7C22DF84;
	Thu, 24 Apr 2025 11:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745495966; cv=none; b=VRwwwJAu3zkdOA+di86cpruOpklKyxDsAHfgKVQvexQ3hh4dRzN983e39nwAbtrvlus1O/Dkt0nALsQhAE9UNOryIdCmvu1O7CWNKRREV26fwxs27fA9mrbe0JhLsgfRG9N4ZgX6fctr4w34spYx91UbvNOCfano8FHAxcb6ghA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745495966; c=relaxed/simple;
	bh=O5weyZMUoTyRg5SadcZ69bTRgiBYwIOPSS9n423+MYg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a2S7RadAO1nX1H7r9tTcDYnwbnIGsfeTR9qbnc3SZOCe2s2kZnd5sFXNcBwzVnbMxW4dFds8XSJxjbBQXTDL2VISgKLyg5TVlKLIFZMozelulJjIRvw7t8RE0yvGfg/Ythvm72q4tRqabRw3MTyczZjeTCOHkrjTKKftFAFNdRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XG9gFkdc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OBofDx024007;
	Thu, 24 Apr 2025 11:59:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rfOJ8F5WCfAl4G//Z9uP1v61ZS1IETkb5bfIARMIDaQ=; b=XG9gFkdc6qqHGcbh
	1h1bvADAXNbqcHskPfvnHsbg8IhfOT/Chli2cQzR11MFOuJlJJP1i+FslExzDCNi
	yEk9lxAg7ltMFsqx0EwpfytICRJg07ybNE2xl0pry++LkAt2+ytopRS58dLFpQOI
	koMpZLVqPPMEnAki2cplWj+Gbk84E+gB4F6PYSe0uIkUk/k3i3QAMh5vZT/W7mnT
	QUTmgmFNomCuGUhRTStMoLB3sTnk52LP4U1yj8rtqGjyuclHPTvQFw8T7tn00fu8
	VYd8hiTwxGP1aHMWx+enfoP6RYLpXOzrfcj1tfU0tvl3iWpfDDdNVKADD46vracn
	qUjk9g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh15dq0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 11:59:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53OBxATk016738
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 11:59:10 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 24 Apr 2025 04:59:09 -0700
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 5/5] arm64: dts: qcom: msm8996: Add coresight qmi node
Date: Thu, 24 Apr 2025 04:58:54 -0700
Message-ID: <20250424115854.2328190-6-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250424115854.2328190-1-quic_jinlmao@quicinc.com>
References: <20250424115854.2328190-1-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Klk8bjJZeWaNpKCsHmJppDHlvHPopqbl
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=680a278f cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=3H110R4YSZwA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=_vcsFIMFqyRQzRopD1IA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Klk8bjJZeWaNpKCsHmJppDHlvHPopqbl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA4MCBTYWx0ZWRfX5umFyhSrWKfy fQx1Fa8d+ZIfAn5h04cip7D71EFf8h8oxGyzzncMnt5NXlP02EdIBpoxXzUdyjrZIBCxzHGHXPM U4e0fFyfu3gaSgoi8a2eYDfO4PXECR4i6ekxgFA5ovuIsDBzlHnv08a8sEt6NTcqiUp8WZ8nC68
 PwksXM/jp3/grXa0Kloti+HeigFZXQKX5z/hQb8YSfkux51M0qlXg/1zehcMYbG1wI7NQYoJE4T rCJKbble455JX2Pj+7kGuqAhVVgyOxNGT8tdhI7L6bPx9uc3dwV3xSfajlHZK6Um0VvExEDtDP9 McNaPMCX1v7d/iXExCT/S1JSGStnxEWujk3SFxoJ2/Nt3TyivzdapUFqpPTDQq7KBtDEzkDqxzE
 N0I9NnJ6+Yhu1YvNGxqXgGzRf6b5l1j0UXQwVXHfS3IZsr5sR4h21rSJb+o0QcSYSRdZ2pr2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240080

coresight qmi nodes is to init the qmi connection to remote subsystem.
qcom,qmi-id is used by remote etm driver to get the remote subsystem
connection and send the request.

Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 4719e1fc70d2..d3bd8caccc0f 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -39,6 +39,15 @@ sleep_clk: sleep-clk {
 		};
 	};
 
+	coresight-qmi {
+		compatible = "qcom,coresight-qmi";
+
+		conns-0 {
+			qmi-id = <0x2>;
+			service-id = <0x33>;
+		};
+	};
+
 	cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
@@ -447,6 +456,8 @@ memory@80000000 {
 	etm {
 		compatible = "qcom,coresight-remote-etm";
 
+		qcom,qmi-id = <0x2>;
+
 		out-ports {
 			port {
 				modem_etm_out_funnel_in2: endpoint {
-- 
2.25.1


