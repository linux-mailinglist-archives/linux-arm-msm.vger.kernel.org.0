Return-Path: <linux-arm-msm+bounces-48813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC21A3ED6C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 08:40:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0BAB189F343
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 07:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDDF61FF1A3;
	Fri, 21 Feb 2025 07:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Rb56zbuV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D861F9F51;
	Fri, 21 Feb 2025 07:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740123628; cv=none; b=Hr+egWA34Up1jYB5CH/NdCGhXJm1QPuMarFg87NxgOsRnA+XK/GitKZhSWzAx3SVQGkN+rfVHsdRjrocfvC6KaZWG1CZNxEhWv9R/fi2eWQc02AzFnpHylhFZZfzVm8Ush3BXoIfvNoHJI1iTKr6mi4LczH78ZO26qqnyXKqeW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740123628; c=relaxed/simple;
	bh=TTMctbbdgc6onLfb+2Sfpp5Dv8gnfUaWXhFTGY7keXo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=ih7jr3g08xm8DuNZuVjFr0WR9Ro3l8wjn6eDFdadN3nPHaSt+ypMPN+LBgSZk9fmQzGAQfMW6TbT3/91PgPTOkhDR7q29e4i41VDESsCtTHsKQVLjEnaMIOjQtamm1kx0ONW3wgsaxVbzwKRhMMzFZm9S7i93TvxKi0PSedgGLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Rb56zbuV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51L627jo020390;
	Fri, 21 Feb 2025 07:40:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lbeKc48AASYUaIDpv9z8oe
	VMeJZHxO7wPHMSBlQFHzk=; b=Rb56zbuVwnjpi45WWTzJ/kK6FviZpBZ7mIDP5e
	2WOKukSHfXNZvH4MmEJ4wkss7FKT1+1shYE6YRifH/oxYcNtWlKyiWtAh32nvOhw
	+377qnTUdz4APwitn88SDLRnYgLVt+wzr/Gc7eLcL37eZtfXU32gTEuvl6hYohPD
	f03A1qjfDD7bWuDUikCLYrvVvdIXJQEKVaIuFhk4lEIqNZ1bpGBYRYTJeSI5VbtK
	clh9wsU1t02Al4V2uUF11OO8on3Hn4HxR5P+vqJcmzWMFzfJvIUE27cVf22DCeG7
	bb15zBVgNaVn8xvg7f7FUnK1APY9cBCfUDXrb3UD7UzwDtDA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44x06t3mhw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 07:40:23 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51L7eN3q026921
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 07:40:23 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 20 Feb 2025 23:40:17 -0800
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Fri, 21 Feb 2025 15:39:57 +0800
Subject: [PATCH] arm64: dts: qcom: qcs615: Add Command DB support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250221-add_command_db_support-v1-1-d60acbf913aa@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAMwtuGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyMD3cSUlPjk/NzcxLyU+JSk+OLSgoL8ohJdc8Nkw1TzFDML4yQTJaD
 mgqLUtMwKsMHRsbW1AMCIZ6toAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740123617; l=1220;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=TTMctbbdgc6onLfb+2Sfpp5Dv8gnfUaWXhFTGY7keXo=;
 b=DWxSGAHnYrCU4PSswFas5iZdNYiqjTwMGfFf1blaqsKpekNvk6Utb/+PWzKM+F5fwknif3fNp
 gdiqGkHGvgXDC1iFsTPmWVyp7RPPK/A84mKN5BJuQqx0nuWCd78ZShI
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: kk9bHys0WfF50oaEU_FMO3Y7PNqkc0HA
X-Proofpoint-GUID: kk9bHys0WfF50oaEU_FMO3Y7PNqkc0HA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_01,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 clxscore=1011 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 mlxlogscore=678 phishscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210056

Command DB is a database in the shared memory of QCOM SoCs, that
provides a mapping between resource key and the resource address for a
system resource managed by a remote processor. The data is stored in a
shared memory region and is loaded by the remote processor. Therefore,
enabling Command DB ensures that those resources function properly.

Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index f4abfad474ea..4e060ce68e6c 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -417,6 +417,12 @@ reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
+		aop_cmd_db_mem: aop-cmd-db@85f20000 {
+			compatible = "qcom,cmd-db";
+			reg = <0x0 0x85f20000 0x0 0x20000>;
+			no-map;
+		};
+
 		smem_region: smem@86000000 {
 			compatible = "qcom,smem";
 			reg = <0x0 0x86000000 0x0 0x200000>;

---
base-commit: 8936cec5cb6e27649b86fabf383d7ce4113bba49
change-id: 20250220-add_command_db_support-71c1e7d683b4

Best regards,
-- 
Lijuan Gao <quic_lijuang@quicinc.com>


