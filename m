Return-Path: <linux-arm-msm+bounces-2410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F497FD44F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 11:35:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93E981C20F6A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 10:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EEC81B27D;
	Wed, 29 Nov 2023 10:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fzLN1fUl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 496E41FCC;
	Wed, 29 Nov 2023 02:34:51 -0800 (PST)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AT979On026566;
	Wed, 29 Nov 2023 10:34:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=1anJyjgUkN/P+gfFdsqIVWsq9f84g9x+Tv+9mPBIuHs=;
 b=fzLN1fUldq4KFffOJxEBHkp57VnFlsMhZp1JBIWh6qD/PHCAzGnBxX0rXHGGH4+5JBN2
 llzmJdWjhIfWmQcCD8DrZSGTIOIfkVM9XsQX+YLdUKBv7nuqrxZyptq+PDnvixSJrIJ0
 E64DAY42HhQg6M4tlMg1EozbGai3/G8z+s3dLGuaYx3SzKaBb1lzOeh/6OANf4n+NifT
 aAdAC6O7HSr1rROO+n7Z1eZt4c9fKaIu7C0ERNmJhW94WgiAxU3XmZDuxRhnZatoOnfJ
 7IZNy3bMORFbhfMYVISG8mORf92+DSiSMbJL4TYVwk4/ejujDiY1peVAdlTuK8MPIUC8 4Q== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3up2byr7sq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 10:34:48 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ATAYlwc029954
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 10:34:47 GMT
Received: from tengfan2-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 29 Nov 2023 02:34:42 -0800
From: Tengfei Fan <quic_tengfan@quicinc.com>
To: <agross@kernel.org>, <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Tengfei Fan
	<quic_tengfan@quicinc.com>
Subject: [PATCH v7 5/6] arm64: dts: qcom: sm4450-qrd: mark QRD4450 reserved gpios
Date: Wed, 29 Nov 2023 18:33:24 +0800
Message-ID: <20231129103325.24854-6-quic_tengfan@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231129103325.24854-1-quic_tengfan@quicinc.com>
References: <20231129103325.24854-1-quic_tengfan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QpN-g5V8hmfmP2XfG2z1rCJeILF8N25s
X-Proofpoint-ORIG-GUID: QpN-g5V8hmfmP2XfG2z1rCJeILF8N25s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-29_07,2023-11-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 mlxlogscore=547 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311290078

Some gpios are reserved for other subsystems, so mark these reserved
gpios.

Suggested-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm4450-qrd.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm4450-qrd.dts b/arch/arm64/boot/dts/qcom/sm4450-qrd.dts
index bb8c58fb4267..866e93783590 100644
--- a/arch/arm64/boot/dts/qcom/sm4450-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm4450-qrd.dts
@@ -23,6 +23,10 @@
 	status = "okay";
 };
 
+&tlmm {
+	gpio-reserved-ranges = <0 4>; /* NFC eSE SPI */
+};
+
 &uart7 {
 	status = "okay";
 };
-- 
2.17.1


