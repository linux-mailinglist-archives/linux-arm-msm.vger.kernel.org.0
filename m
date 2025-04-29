Return-Path: <linux-arm-msm+bounces-56086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14138AA082A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 12:10:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C00681B648A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 10:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BA852BE7D3;
	Tue, 29 Apr 2025 10:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dhkbtnzf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E14B2BE0E1;
	Tue, 29 Apr 2025 10:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745921383; cv=none; b=cumg8UPM5kU9tWXrvA1kOgxzbHsQUQ7o+6c3APZ3kZnZgrTox890hUvjC59BB/CQLkw7OyPgWM4CHA+9aDE4z2qeu2UgeLBTFSbBVwUz+/pAHMIyovnTLiMorMw5LAzvgqYTcjXJRwncQaGb+bYnnThrI3MgOz0FRl3r+Ih7FPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745921383; c=relaxed/simple;
	bh=Qsq+VfoGUW2v+Mv+j7DAjECure5XIuNLTQgdqhaBamI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=sjSIw+I+Mok62jToRSHLAMfRzh+cDIVJwNPPPnkvy6AMsN8a0ian3+LgfTxI5TW33riY5WUT2BcGHNlIwsTMHY2UKSaBFT7MjpVWsa2Gd9V7+BQGeZxe2fy4WFzv6WdFazp/a1bC8//cHnj37x5rd93Zendd2rgl9WZ46vGqqwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dhkbtnzf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNqM8E015446;
	Tue, 29 Apr 2025 10:09:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=12hipdhhaPt4CO/ltQv4GR
	1SDZa5jKo0IbM4LWPNclw=; b=dhkbtnzfDtj+hBMEXYemc1aJc+do7ScPpDfnoB
	wpUiDZRCfv1YJPe3ONkKx6QfmluQJFw9nzjECYnkdhp7VFJLIWAnyxC9W3rGhWe1
	3mL8KXlbnCK6IYLQEAGG34jwephi3GAZnlYdWr8LAeKyRfdothrNO1NLhoUA+EVg
	K3NWmjq8R0RJhK3t5vbGt52mwMlgm8Yq8TmejBhnl0n0p01f9rvnJhDksrkexNe9
	gdj0euMPy+PLSS8lcy4bri3uORr6Jsyw92ayq/qN0TzmVQb8TCCtdZSvGDrJa3aE
	6CA30m02AxWN5HhFxyWkAV2i8P6ByfMccII7ylCvw71ufjIQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468r8hu2kq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 10:09:38 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53TA9cWq023204
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 10:09:38 GMT
Received: from hu-pbrahma-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 29 Apr 2025 03:09:35 -0700
From: Pratyush Brahma <quic_pbrahma@quicinc.com>
Date: Tue, 29 Apr 2025 15:39:25 +0530
Subject: [PATCH v2] arm64: dts: qcom: qcs8300: add the pcie smmu node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250429-qcs8300-pcie-smmu-v2-1-445288af3ea7@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAFSlEGgC/32NSw7CMAwFr1J5jVE+FAIr7oG6AGOoF03ahEagK
 ncn9AAsZ6Q3b4HEUTjBqVkgcpYkwVcwmwaov/ono9wrg1GmVUbtcaLkrFI4kjCmYZhxR04bTQd
 7ZAd1N0Z+yHttXrrKvaRXiJ/1Iuuf/VfLGjU6ZlZsW9fe6DzNQuJpS2GArpTyBd5A0Fa0AAAA
X-Change-ID: 20250206-qcs8300-pcie-smmu-4c8121c739e8
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Pratyush Brahma <quic_pbrahma@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745921375; l=4362;
 i=quic_pbrahma@quicinc.com; s=20250113; h=from:subject:message-id;
 bh=Qsq+VfoGUW2v+Mv+j7DAjECure5XIuNLTQgdqhaBamI=;
 b=e4B+aBJXUG4UY25k+bcLE594FhL8zXmt0GlGNkEiiGNKGd4FMeXtLCa6zGht7sgCDhbJx+Gpm
 ZbnAwFCn2+qBBcBcOSDrEfs09f7a9ja2M01z7J1KHDPqCZxOXiMW/6V
X-Developer-Key: i=quic_pbrahma@quicinc.com; a=ed25519;
 pk=YvfZKC4rRO1Fot+wlXZqsoQWnAtLqrpMyEzslw3Ji+M=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: eVb3-yjeZZ9Fhp8CqEdlg8Q6t2xhKlwL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA3NSBTYWx0ZWRfX1E8aef0SbFWa ZOxPBtUslPHcEqqi0ODDhkRxa7kwA2p9aUDOB9WUfX0vSnV8jLFqWU3nXnGjFCngmIJ0+krxSMB NYScgQPQTbE4DdHwMWQFx6yrqyVOo5FkseazsF7AJ43nQXyW651e31lL2r61L43Ybx7ckGmfgdR
 qIIeBRmKQk9F6XVDBtLRGM7MlplK1sIw9R0iiLCSXhjYZUmP3srZN7xsyMKtwoVDkKsN7Zic1aq p9IEsugb0TkOzEIGXPI4Wh14si/5yvKMf+28CwUFbGhoBCF85ELYMeHFvMrwbSOICDKR/abb4GQ p4qEIqDRNOK7umBwCJCEMCCnMy+jmFDu3nbWi2vZHD/7y1Mtvw5C/YIO2Blr6FF2sIiO0/9jBsm
 MzDcKDY57ZNwYPH6i4zhAAmd4P6rO7OeSxwB0b0w/3yB30B/wGk4gqfG3Mp5ebF9NAnh5AM4
X-Authority-Analysis: v=2.4 cv=cfzSrmDM c=1 sm=1 tr=0 ts=6810a562 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=mN_G0mnyTAQcExH3DvwA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: eVb3-yjeZZ9Fhp8CqEdlg8Q6t2xhKlwL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=594 adultscore=0
 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290075

Add the PCIe SMMU node to enable address translations
for pcie.

Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
---
Changes in v2:
- Updated the global-interrupts and interrupts based on Konrad's suggestions
- Link to v1: https://lore.kernel.org/r/20250206-qcs8300-pcie-smmu-v1-1-8eee0e3585bc@quicinc.com
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 74 +++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 4a057f7c0d9fae0ebd1b3cf3468746b382bc886b..5d15e2d77003d1f2e14e1d43a29330a67a070a07 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -3199,6 +3199,80 @@ apps_smmu: iommu@15000000 {
 				     <GIC_SPI 895 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		pcie_smmu: iommu@15200000 {
+			compatible = "qcom,qcs8300-smmu-500", "qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x15200000 0x0 0x80000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+			dma-coherent;
+
+			interrupts = <GIC_SPI 922 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 926 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 927 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 928 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 929 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 951 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 952 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 953 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 954 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 955 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 956 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 957 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 958 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 959 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 886 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 887 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 888 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 889 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 821 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 823 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 824 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 446 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 447 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 452 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 841 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 842 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 843 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 844 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 845 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 846 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 847 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 848 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 849 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 850 IRQ_TYPE_LEVEL_HIGH>,
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
+				     <GIC_SPI 815 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 837 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 838 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 839 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 854 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 855 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 856 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 857 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 790 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 791 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 792 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 793 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 794 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 795 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 796 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 797 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 639 IRQ_TYPE_LEVEL_HIGH>,
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


