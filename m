Return-Path: <linux-arm-msm+bounces-19008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 238978B8482
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2024 05:45:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96F481F2279A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2024 03:45:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5AA9282E5;
	Wed,  1 May 2024 03:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Tnp7EbRE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5043233E1
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 May 2024 03:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714535135; cv=none; b=E/W71SHLErif1wNsD5MLe2KLfUG1UR+KlcXaaVYjve0lRUB9aYTKx4HVLLKDZYIDUTUuFunJUYDGJ0NwUJRZb5iVqNUWQkeIAL9DY4QEe12WZ3ly8d4vkcWyVKFl8pAN6gj2MhubzxVM+UCI6gFEqoyr9ib9qSzIL+yEbaIqx5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714535135; c=relaxed/simple;
	bh=OzjwrBXmKkj9lLBxgaOhTSJ0mDTDWJtGCm0RLwLvhnw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=MAuTGQ3C+4lbVlduSBMHj91kKNeSVy44oCpQW7+KbDD3/4XjzPdtO9QNk1zDMY0yCQeA9XrxzBXdGvfNdeTY5TbMVy+5+lQ8Ejvq5T1CTZ+QK9XWjVYiqvEUMTPnLRuSwseqPnIEyYSGvWH/7GTlKQmxyi1M8P77x7H2VmFqI6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Tnp7EbRE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4413Na2r024871
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 May 2024 03:45:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:to:cc; s=qcppdkim1; bh=kl/
	0Ar7iTADqabyhEDPNNpB+f6Q98eolYmF4gdPqfK0=; b=Tnp7EbREjBDjnD+4AJP
	eNlF7Bg7PVhqIjyuunZA0ANnLKfYPVJrPLIoRUZAmDwuqapwM2Mmjdv5Ja4AqQhO
	JCloZiqZ+HsYREftFeLOVfZhg0fOI9JUfOIMnz9QAxbQuI0LQQW/Ora26tY0YFo2
	EdtR3ZZuapnLuJfYIv+mEhaQH7akh2EQb+x9u+ZCh8ELMpZTzKHe6yqSW7GaIqeo
	00X03bHWiU92Y9u7O21ypqMXbWP09zynS+kRqJwBzetKmD4y6vXZoS0t7u8xW0DL
	u3+OBIlka4CWR2FqjaETxOcStpaExk1+rm44I+GGm5FG5sokyGukyTQ49+0mP84J
	2Cg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xtvf7jggq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 May 2024 03:45:32 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4413jVTN009038
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 May 2024 03:45:31 GMT
Received: from hu-scheluve-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 30 Apr 2024 20:45:27 -0700
From: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Date: Tue, 30 Apr 2024 20:45:18 -0700
Subject: [PATCH v2] arm64: dts: qcom: sa8775p: mark ethernet devices as
 DMA-coherent
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240430-mark_ethernet_devices_dma_coherent-v2-1-24fbbdc90122@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAM26MWYC/5WNQQ7CIBBFr9LMWgwQQOPKe5iGIIx2YgoVsNE0v
 bvYG7h8L/nvL1AwExY4dQtknKlQig3krgM/uHhHRqExSC4VV1Kz0eWHxTpgjlhtaBOPxYbRWZ+
 axFiZ8UZodT0qYTS00JTxRu/t5NI3HqjUlD/b5yx+9q/8LJhgLvCD1lwplOb8fJGn6Pc+jdCv6
 /oFdN66sdYAAAA=
To: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>
CC: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bZiB2O4e0aVcWbQrWiukNHkQmEunUlbo
X-Proofpoint-ORIG-GUID: bZiB2O4e0aVcWbQrWiukNHkQmEunUlbo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-01_03,2024-04-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=515 priorityscore=1501
 phishscore=0 mlxscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2405010025

Ethernet devices are cache coherent, mark it as such in the dtsi.
Fixes: ff499a0fbb23 ("arm64: dts: qcom: sa8775p: add the first 1Gb ethernet interface")
Fixes: e952348a7cc7 ("arm64: dts: qcom: sa8775p: add a node for EMAC1")

Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
---
Changes in v2:
Remove internal change-id from commit message
- Link to v1: https://lore.kernel.org/r/20240425-mark_ethernet_devices_dma_coherent-v1-1-ad0755044e26@quicinc.com
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 231cea1f0fa8..5ab4ca978837 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -2504,6 +2504,7 @@ ethernet1: ethernet@23000000 {
 			phy-names = "serdes";
 
 			iommus = <&apps_smmu 0x140 0xf>;
+			dma-coherent;
 
 			snps,tso;
 			snps,pbl = <32>;
@@ -2538,6 +2539,7 @@ ethernet0: ethernet@23040000 {
 			phy-names = "serdes";
 
 			iommus = <&apps_smmu 0x120 0xf>;
+			dma-coherent;
 
 			snps,tso;
 			snps,pbl = <32>;

---
base-commit: a93289b830ce783955b22fbe5d1274a464c05acf
change-id: 20240425-mark_ethernet_devices_dma_coherent-6c6154b84165

Best regards,
-- 
Sagar Cheluvegowda <quic_scheluve@quicinc.com>


