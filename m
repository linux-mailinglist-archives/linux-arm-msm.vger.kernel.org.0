Return-Path: <linux-arm-msm+bounces-64531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EC3B0186C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 11:41:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3D693A37CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 09:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B89D427E7F2;
	Fri, 11 Jul 2025 09:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TmKS7jS3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F5327C879;
	Fri, 11 Jul 2025 09:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752226862; cv=none; b=r5DQskeu4bjmDznH1u2Og+2EYZ8mi8AZTVlyo6ZD97OfiT0GlqNekKF+3wAlsIf46WbkhwYe/7B4NI+h2GCFTXNtcLm3s2BdNqJk9l1QR0RmjAOUiRjY6xJoLZFsjI2I1QfombwKwGupHJltj8cYt5cW+7gZutaHwPe16qcHvaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752226862; c=relaxed/simple;
	bh=8HLNUJ+ODJOFkjp3T8ePMB3YHb45vLPbDzd28lgjf28=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kBgyfN6u9Xzh5eqmHITtT8/mQBjiBLD5sFJJcnhEnQmIPcbg8tJpL3Pa+iVBZ8zXVS1vsaELGpZ5h+zACrlC1qEN6XfkLnpkPf8E+pNy+BvdzDLxn0pBHcpUPNisy6H3f0742nO7Kt5Y9o2ZDebrBgonf8BC8UP13woJ6n6tB5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TmKS7jS3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B1XBeU016803;
	Fri, 11 Jul 2025 09:40:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gjYjOpQG6wXtXCJvIxEpwaFMEpUUZrOepO0zheiglxU=; b=TmKS7jS3ffiRu3CT
	h7xpKc4teaRpZPBqCITcysWiwphbFdbRx6xASaQub1K8AMP6cgcF/TCWi7dvZbG7
	hZrPy8SVfxLjigo77Wya9JYi0bXQg35SkbEcXOE0TeEtNjQLSMj/UQ+zqw1hAI1a
	OAIfc5tz3GOIah8BtjZNVnYdTGWZFJXnOzMaZvPa5IKGrx8uwAsh894qgtn4BsLc
	djhHfg4wKbdW4ohUtwYuoLihAkmhXECSLAMvUrQfwarADNjx4jgAf6PZyaM1s6NT
	wo92Bavy70I4Q4U3j13fq+D4o7fA3wMKNy29vE+xgolSVBDRCxCVQGrl577P5pmb
	spwQ0A==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smap82xh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 09:40:49 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56B9emvw032125
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 09:40:48 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 11 Jul 2025 02:40:47 -0700
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
Subject: [PATCH v6 5/5] arm64: dts: qcom: msm8996: Add coresight qmi node
Date: Fri, 11 Jul 2025 02:40:31 -0700
Message-ID: <20250711094031.4171091-6-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250711094031.4171091-1-quic_jinlmao@quicinc.com>
References: <20250711094031.4171091-1-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Ar7u3P9P c=1 sm=1 tr=0 ts=6870dc21 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=3H110R4YSZwA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=_vcsFIMFqyRQzRopD1IA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: FCtgReMf5prrPSWRqhkXqtcyb93TWRBf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA2OCBTYWx0ZWRfX1OxN1i0sK0v8
 CtwqUnNdknqS/7Bu+Dtyyb4ZPEwZ+Jgywdcemf1pAk31QC9MGtyWHaWzzCdQHYP4M/FQHXpNl+m
 1UIyLEtDyDPSDIT0xq2HNsPkHApol7wwACn7oS7gcbTN4TxN0jNL9uMrxswTTF55cxrCm0Pbqiy
 NfHMoKry91uaOjAVR+VcETJeEAca3k2BB6QJis8gxL950/qbX7I1ikJMVTsf1qlDTJ+5EK+eeEV
 OztKLWhqqAbvABw06tyjU5zRJ4sFiyYbdxHjTOH1VwdtAnSN8kV0RU725CJx/aqRAnOjWS03VLY
 yTJMeH3PPVjsUvlGLnxZNNLeUu/fv9AXUDKBMJoWjIEaqyjS6Ej4Tg9bl/HHJwT2yfYhXIsupni
 j1NmeUpvPDLOJjH+Lj3Rl5OfuQ1ySLSg4D2Lc/4Hh6plH99y9U+p2A4NtMETXpcth0Fs5Le+
X-Proofpoint-GUID: FCtgReMf5prrPSWRqhkXqtcyb93TWRBf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 phishscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507110068

coresight qmi nodes is to init the qmi connection to remote subsystem.
qcom,qmi-id is used by remote etm driver to get the remote subsystem
connection and send the request.

Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index ede851fbf628..0032817825f2 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -40,6 +40,15 @@ sleep_clk: sleep-clk {
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
@@ -448,6 +457,8 @@ memory@80000000 {
 	etm {
 		compatible = "qcom,coresight-remote-etm";
 
+		qcom,qmi-instance-id = <0x2>;
+
 		out-ports {
 			port {
 				modem_etm_out_funnel_in2: endpoint {
-- 
2.25.1


