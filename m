Return-Path: <linux-arm-msm+bounces-22981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C7390C7F2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 12:56:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6D811F27778
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 10:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 011C01CD5C8;
	Tue, 18 Jun 2024 09:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QqxZPbTX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C1E156960;
	Tue, 18 Jun 2024 09:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718702855; cv=none; b=NyvPZoCivEWzsTIE7GicGZ1UpoCeXr1K9PTFpdTkI2xhHX8DouXNw3SBp/zJqrbZpByWLh7bWaA3Rm4wPqQCfC8Cqmx9c9tV19Ofco0cOVteeuR4HWDorDaI4B6RLzazvUtIQyaonQzZGgPMpkO3DxZbJqdEQGUViEiGkLhSJkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718702855; c=relaxed/simple;
	bh=92lysn2R3TIjIHZA1as52NSzVBrlCHxTHK1HkSwRBUY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZQINwuUCbAeUYMzU6TLWgnZD1Xa4FjRpxelL+nFQpwLVF7ZckIrpNkG6NKsDsNdM4E8YkZx2t4qHGqoc5xZXHejk6bFGP/4AgWZy5r1vsFA11cqlPDVpyp9E82IiQqaK9xiFhNgNYmXBUZBlm3Ui/mm5D0wqUleDaht5pwHjllk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QqxZPbTX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45I7vMiJ008963;
	Tue, 18 Jun 2024 09:27:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5CKTMwQnyrlDmzFvHrNQaY
	QUXSiVWWEFF/dJG0musOI=; b=QqxZPbTX8DW2F07q0R85ktyd+AjgsJii1aUd1/
	Its4Xy+lPzxQ8Ofk/2/+VY1S2pYO7WvgGDtbbs2DJYb7/Cc8LI5lRu/hidkBm+sT
	G83Kq9zEut77oeBTjJGrxjvl+KyiYjdN7H2Gv3bKdBnukjGUwwpo1agp8LYnVt80
	SyQ9YLyRkEP4psbHNZ5Tjzfvg/Zm71IKzJQ8wiZbq+BnHas2hPuxZWtyDZbB/ODp
	s3ukjXxUXJfzZnXRVOK/13xKTS/580Y+jowBc4OBLLrKPOySDQgjdd8VCjkyrXtW
	Q5BhNAaFsYdBAxifI/JoGIjMgZg05O5x5xWcRACmsXx8JY0w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ytuav9h4h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 09:27:31 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45I9RUqP017084
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 09:27:30 GMT
Received: from hu-kbajaj-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 18 Jun 2024 02:27:26 -0700
From: Komal Bajaj <quic_kbajaj@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Komal Bajaj <quic_kbajaj@quicinc.com>
Subject: [PATCH v3] arm64: dts: qcom: qdu1000: Add secure qfprom node
Date: Tue, 18 Jun 2024 14:57:11 +0530
Message-ID: <20240618092711.15037-1-quic_kbajaj@quicinc.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PPXyRw7Fmpa7M7Mg7JA3JSsgOPQb3-6b
X-Proofpoint-ORIG-GUID: PPXyRw7Fmpa7M7Mg7JA3JSsgOPQb3-6b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_02,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=798
 suspectscore=0 mlxscore=0 phishscore=0 adultscore=0 clxscore=1015
 spamscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406180069

Add secure qfprom node and also add properties for multi channel
DDR. This is required for LLCC driver to pick the correct LLCC
configuration.

Fixes: 6209038f131f ("arm64: dts: qcom: qdu1000: Add LLCC/system-cache-controller")
Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
---
Changes in v3:
* Addressed comment by Konrad
* Added Fixes tag in commit message as suggested by Dmitry
* Link to v2: https://lore.kernel.org/linux-arm-msm/20240612063424.2494-1-quic_kbajaj@quicinc.com/

Changes in v2:
* Minor correction in commit message
* Link to v1: https://lore.kernel.org/linux-arm-msm/20240607113445.2909-1-quic_kbajaj@quicinc.com/
---
 arch/arm64/boot/dts/qcom/qdu1000.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
index 7a77f7a55498..27f9fc87079c 100644
--- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
+++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
@@ -1584,6 +1584,21 @@ system-cache-controller@19200000 {
 			reg-names = "llcc0_base",
 				    "llcc_broadcast_base";
 			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
+
+			nvmem-cells = <&multi_chan_ddr>;
+			nvmem-cell-names = "multi-chan-ddr";
+		};
+
+		sec_qfprom: efuse@221c8000 {
+			compatible = "qcom,qdu1000-sec-qfprom", "qcom,sec-qfprom";
+			reg = <0 0x221c8000 0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			multi_chan_ddr: multi-chan-ddr@12b {
+				reg = <0x12b 0x1>;
+				bits = <0 2>;
+			};
 		};
 	};

--
2.42.0


