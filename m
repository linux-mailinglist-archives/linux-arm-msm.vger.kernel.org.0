Return-Path: <linux-arm-msm+bounces-36543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7B19B78FD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 11:50:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3DA31F214B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 10:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B118198E86;
	Thu, 31 Oct 2024 10:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UD5UgAt3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA83214659B;
	Thu, 31 Oct 2024 10:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730371800; cv=none; b=RBzyYOOSJBOoa5A6/jN1Z4Gx//95N+QN9gpzT/sMXwiXeG6kacDeXhEpIoFTyZsM5nRFbgBOGMUqPQqPUAPs+AFg9GPOSQwhbnFpJIcVCyyaQ08sJ31SN2NnrnSGns6mpu55SumwcE0urOo2m9VRfZeYFVnvleOPDbyuyDF2sos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730371800; c=relaxed/simple;
	bh=qTw56vURI6NfWKabL1zgcZlMdCUHPVNrsVfT4MsULlM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=klgSoqdtOEt/awLMyQWmB/Lsl9hXJnj4xHERqgJkHffdD34BK5qyx9qXdl+eW67kdPvJCHKAAtExwS0iz/YLun6DNxqsUhLtTfchXtyNyr76/cjLMWOV4yMeMVpy3SL5lJ/Sy7LQ1tJOtGB6pYXzO5mScZOf+8uWmuvs24LDE0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UD5UgAt3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49VAnTX1019721;
	Thu, 31 Oct 2024 10:49:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BWtRn+vyZ5AO60Uh50mbgn
	cyIhFUSCNFmaFHSsobGeY=; b=UD5UgAt37vaedwi2RdP26inNcluV44INQUgneA
	a2WPLJ3uwvxg9B7LUHDQuIJwDe7ede773PO784HUry58xGY4PH4t3v7si37aqS7X
	inNeIJ5PQcKoQzgXiHCmt4GtiOMQL99ErCPY0Q6lvwXh9H67VwUwSJtdKhB2FjWd
	3uJihzDScWkOTPV1EgikZT0SrM/Iav/OOURE79VQS/u7KN8fLtypBrZ2r47gcPAs
	yA5I6N2lRQ4M2SrHPPUYERzrnwgiN8EZdwyICw0FKuehZ21MsmDWEnNN1R5db3Ln
	Q9HDhYC2dBjSdHExsBpZFOp+ERZTxHXbyquILhrNiBWqEKmQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42grguqcha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Oct 2024 10:49:53 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49VAnqlM012682
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Oct 2024 10:49:52 GMT
Received: from songxue-gv.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 31 Oct 2024 03:49:46 -0700
From: Song Xue <quic_songxue@quicinc.com>
Date: Thu, 31 Oct 2024 18:49:02 +0800
Subject: [PATCH v2] arm64: dts: qcom: qcs615: Add LLCC support for QCS615
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241031-add_llcc_dts_node_for_qcs615-v2-1-205766a607ca@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAJ5gI2cC/32Qy26DMBBFfwV5XSq/Caz6H1VkmfHQjESA2A5qF
 eXf65BWyaLq8s7inHvnwhJGwsS66sIirpRonkqQLxWDg58+sKZQMpNcasEVr30IbhwBXMjJTXN
 AN8zRnSBZYWpEpYVXGAL2rCCWiAN9bvj3fckHSnmOX5ttFbfrD1iI/8GrqEWNjffaSK1B2bfTm
 YAmeIX5yPbXuytiuSbKd+FjQNmzWaTcLDRRJj+6dF6WOeZnj5TGDlb7FqTuVs2e3/BL4e2j6x8
 Ia3dmMMCV6FW3yhui9wnrUvRIuat6KxsOqgff7hqjOPoBrBdmaIPRCIFzpZCjKquu35mfHt6fA
 QAA
X-Change-ID: 20241030-add_llcc_dts_node_for_qcs615-ee341a3eddeb
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>
X-Mailer: b4 0.15-dev-88a27
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730371786; l=2521;
 i=quic_songxue@quicinc.com; s=20240911; h=from:subject:message-id;
 bh=qTw56vURI6NfWKabL1zgcZlMdCUHPVNrsVfT4MsULlM=;
 b=6M30wbIlcoyak7IS+j17D6MqnqDVEFWoYQhiOCN2J3x0FSLgzVIeQYMXBenVmBXjqv94kZehe
 /MiG8zd7RF7DreW7MNAsKah0qKXijMHyCnGLuoz/sP4mwO6GFShNQ8n
X-Developer-Key: i=quic_songxue@quicinc.com; a=ed25519;
 pk=Z6tjs+BBbyg1kYqhBq0EfW2Pl/yZdOPXutG9TOVA1yc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: aBGkHFrXWuixq2urEdz5bNdmo-xIRE-M
X-Proofpoint-GUID: aBGkHFrXWuixq2urEdz5bNdmo-xIRE-M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=965 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410310081

The QCS615 platform has LLCC(Last Level Cache Controller) as the system
cache controller. It includes 1 LLCC instance and 1 LLCC broadcast
interface.

Add LLCC node support for the QCS615 platform.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Song Xue <quic_songxue@quicinc.com>
---
This patch series depends on below patch series:
https://lore.kernel.org/linux-arm-msm/20241022-add_initial_support_for_qcs615-v4-0-0a551c6dd342@quicinc.com/
https://lore.kernel.org/linux-arm-msm/20241010-add_llcc_support_for_qcs615-v2-1-044432450a75@quicinc.com/

Changes in v2:
- Pad both register addresses to 8 hex digits.
- Link to v1: https://lore.kernel.org/r/20241011-add_llcc_dts_node_for_qcs615-v1-1-e7aa45244c36@quicinc.com
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index ac4c4c751da1fbb28865877555ba317677bc6bd2..1c4695a57c5b4039b28f93449d3b435a4dc46c4d 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -495,6 +495,14 @@ dc_noc: interconnect@9160000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		llcc: system-cache-controller@9200000 {
+			compatible = "qcom,qcs615-llcc";
+			reg = <0x0 0x09200000 0x0 0x50000>,
+			      <0x0 0x09600000 0x0 0x50000>;
+			reg-names = "llcc0_base",
+				    "llcc_broadcast_base";
+		};
+
 		gem_noc: interconnect@9680000 {
 			reg = <0x0 0x9680000 0x0 0x3e200>;
 			compatible = "qcom,qcs615-gem-noc";

---
base-commit: b6270c3bca987530eafc6a15f9d54ecd0033e0e3
change-id: 20241030-add_llcc_dts_node_for_qcs615-ee341a3eddeb
prerequisite-change-id: 20241022-add_initial_support_for_qcs615-2256f64a9c24:v4
prerequisite-patch-id: 09782474af7eecf1013425fd34f9d2f082fb3616
prerequisite-patch-id: 624720e543d7857e46d3ee49b8cea413772deb4c
prerequisite-patch-id: 04ca722967256efddc402b7bab94136a5174b0b9
prerequisite-patch-id: ab88a42ec69ad90e8509c9c5b7c6bdd595a7f783
prerequisite-patch-id: 918724fafe43acaa4c4b980bfabe36e9c3212cd1
prerequisite-patch-id: 3bd8edd83297815fcb1b81fcd891d3c14908442f
prerequisite-patch-id: fc1cfec4ecd56e669c161c4d2c3797fc0abff0ae
prerequisite-change-id: 20241009-add_llcc_support_for_qcs615-6685f5c031b3:v2
prerequisite-patch-id: 7f93f240f926884c60a86c3ca651bb2232b88bed
prerequisite-patch-id: 6758ca439e10ac057d7834bb42860eb58198287b

Best regards,
-- 
Song Xue <quic_songxue@quicinc.com>


