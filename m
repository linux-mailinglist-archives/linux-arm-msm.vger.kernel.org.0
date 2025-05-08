Return-Path: <linux-arm-msm+bounces-57211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2F6AAF3A3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 08:21:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A69843AF0B4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 06:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40F251EE03D;
	Thu,  8 May 2025 06:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="U01R9mny"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A242747F;
	Thu,  8 May 2025 06:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746685288; cv=none; b=JmODjK7Mj9OeSa1bFU0aDwBGiDMvFqY9dmMePBKybM+wTWK6cDPI8O7+TYWla3VAg9xCpDvaIF93txYkNwysN96B1P87BKZrnELuKs2pbZGSmgZ2A88XlkR6FUvt4dxWCh5NkLKA1pJTioaxtmM5tD59IS4nYHL4822i9sbql30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746685288; c=relaxed/simple;
	bh=mAOKs8vfh8GL51i+5ZqU3pmvpAidzcqwJ23zuR6gRcw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=Abi3ulUB9GiTGLRwjzE9SnpITl+e4LWK7S6b3lIdh5w/i9CS/Z+mKfJTlqcVmB5CnURKoFkmcrUsVPLOII8B6uOf4jzDtcYkMSN9v7Ka6vJC+telq216vEC/9j6hdi7lMK1N8XAHK7XWwlGay2u73Cp21k4FROkffJQNK8ntR1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=U01R9mny; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5484WihM016698;
	Thu, 8 May 2025 06:21:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aXEpNCgBXEplRsmnFqBTaD
	/WdumCcW80FrPOXNCpCjI=; b=U01R9mnyL+n6pzrje3en40/xbnMJ08zLL9nOQh
	KNJ0cQlPaD3+nOh4ti7ebEsEzmpJEBuL7Y6dshZd4Zy9jHyAbMe+HNtOKXkfCrr2
	IBkzH1rRm50BeTUdiLODw8RrMUCCNdyev8RcRR1K0i8Iwse/cRdAqPAvRh1dq6gx
	Q3L1fwH3DH+kWy8det/nRrkyZbEfq6aA6ru0T8kuwqHbgc3316E6x6yHbBcOgifE
	yLuTrgMQfB8z62c5UBVpITeLtWJF2vZLsNf2Mxig8RcknTWaP4Qr5t8dQkleS1no
	6rHUCpYwAqFDzNEp8cQVqtZj6h+SrixpHI99N+flRPIfENVQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp687k0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 06:21:23 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5486LNwN023449
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 May 2025 06:21:23 GMT
Received: from hu-pbrahma-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 7 May 2025 23:21:20 -0700
From: Pratyush Brahma <quic_pbrahma@quicinc.com>
Date: Thu, 8 May 2025 11:51:02 +0530
Subject: [PATCH v3] arm64: dts: qcom: qcs8300: add the pcie smmu node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250508-qcs8300-pcie-smmu-v3-1-c6b4453b0b22@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAE5NHGgC/33NTQ6CMBCG4auQrq1pp0WKK+9hXOA4yCz4a6XRE
 O5uYWNMjMv3S+aZWQTyTEEcs1l4ihy471KYXSawqbo7Sb6lFqAgV6AOcsTgjFJyQCYZ2naSFp0
 GjYUpyYl0N3iq+bmZ50vqhsOj96/tRdTr+k+LWmrpiEiRyV1+xdM4MXKHe+xbsXoRPoaF8pcBy
 bA2B+eq2lBVfBvLsrwBg+H1rPgAAAA=
X-Change-ID: 20250206-qcs8300-pcie-smmu-4c8121c739e8
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        "Pratyush Brahma" <quic_pbrahma@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746685280; l=4707;
 i=quic_pbrahma@quicinc.com; s=20250113; h=from:subject:message-id;
 bh=mAOKs8vfh8GL51i+5ZqU3pmvpAidzcqwJ23zuR6gRcw=;
 b=xlzE8M/ZVyi4HsnUYthPTFlYmkvssExPLQxKzFFSXnZVvokm0E6CcEtFw9py3+v9A/mncDa8X
 AUSNhT2LBrzCPwOUkLblJ2112B6MSDhVaplrPXMX+F/FCwignowuTCS
X-Developer-Key: i=quic_pbrahma@quicinc.com; a=ed25519;
 pk=YvfZKC4rRO1Fot+wlXZqsoQWnAtLqrpMyEzslw3Ji+M=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDA1MyBTYWx0ZWRfX364zgFAWwa+9
 elWPUPd2UAjGY75MccbFKrViEIbBFwrqTypOguzTef3fA+Ei3zmFEac5BTAwNqr47lrUt577eif
 ploy3xcocg7vrupl7feqQm/Itrb7Z512HuRtcBuWppLD7EyC0wy5siSK7swYdO5UsFRO4KQExl1
 zLKudqCaIpLxhNG4cxglBG0v4oCdv/oYpBDPQRIAnORA00kcOPsTrca9/3yYQNYjefKdz2ss1Rk
 Rd6CeCRbIMiROKFcVjSoi3L0AKZxyD+EaHiE2qRJVlIODK6mCR5HlIbLIcQOueC1OLkUaRaLvNh
 kv7cvqiLoY9LK/0NOjS/j7n/3ijUyy7LFyQcc1J2OCj+cu+kQRv7j7zu8GHeosTWSaLV6V5PFyo
 P/R0pwcgVhKvSjQNHwqzWpm/yIZ9zS8e2jQgfjmKER98pnYd6xR7MvN3oWAlihYs0L9WrDCT
X-Proofpoint-GUID: AAiApmGiujQrWNsa0b3MfZFc4doDson3
X-Proofpoint-ORIG-GUID: AAiApmGiujQrWNsa0b3MfZFc4doDson3
X-Authority-Analysis: v=2.4 cv=BvGdwZX5 c=1 sm=1 tr=0 ts=681c4d63 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=FJSpEYV9s5LVA0W2JrAA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_02,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0 mlxscore=0
 spamscore=0 mlxlogscore=618 malwarescore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080053

Add the PCIe SMMU node to enable address translations
for pcie.

Reviewed-by: Dmitry Baryshkov <lumag@kernel.org>
Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
---
Changes in v3:
- Revised interrupt numbers and global-interrupts to v1 after rechecking as Konrad suggested.
- Added Dmitry's R-by tag based on v1
- Link to v2: https://lore.kernel.org/r/20250429-qcs8300-pcie-smmu-v2-1-445288af3ea7@quicinc.com

Changes in v2:
- Updated the global-interrupts and interrupts based on Konrad's suggestions
- Link to v1: https://lore.kernel.org/r/20250206-qcs8300-pcie-smmu-v1-1-8eee0e3585bc@quicinc.com
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 75 +++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 4a057f7c0d9fae0ebd1b3cf3468746b382bc886b..fe88244771583de9fed7b7e88c69a14872d4ffc8 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -3199,6 +3199,81 @@ apps_smmu: iommu@15000000 {
 				     <GIC_SPI 895 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		pcie_smmu: iommu@15200000 {
+			compatible = "qcom,qcs8300-smmu-500", "qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x15200000 0x0 0x80000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <2>;
+			dma-coherent;
+
+			interrupts = <GIC_SPI 920 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 921 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 925 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 926 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 927 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 928 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 950 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 951 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 952 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 953 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 954 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 955 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 956 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 957 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 958 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 885 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 886 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 887 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 888 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 820 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 822 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 823 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 446 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 447 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 452 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 840 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 841 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 842 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 843 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 844 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 845 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 846 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 847 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 848 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 849 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 802 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 803 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 804 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 805 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 806 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 807 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 808 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 809 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 810 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 811 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 812 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 813 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 814 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 836 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 837 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 838 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 839 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 854 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 855 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 856 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 790 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 791 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 792 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 793 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 794 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 795 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 796 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 639 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 640 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		intc: interrupt-controller@17a00000 {
 			compatible = "arm,gic-v3";
 			reg = <0x0 0x17a00000 0x0 0x10000>,

---
base-commit: a13f6e0f405ed0d3bcfd37c692c7d7fa3c052154
change-id: 20250206-qcs8300-pcie-smmu-4c8121c739e8

Best regards,
-- 
Pratyush Brahma <quic_pbrahma@quicinc.com>


