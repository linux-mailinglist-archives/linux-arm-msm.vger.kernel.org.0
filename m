Return-Path: <linux-arm-msm+bounces-33549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4609948F0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 14:18:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DD8F1C218E5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 12:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 434DE1DE3BB;
	Tue,  8 Oct 2024 12:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="T7BQkz8M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B983B1DDA36;
	Tue,  8 Oct 2024 12:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728389889; cv=none; b=X1Hh4yaLAL5E+XK+Zk7L6F/lh9EUAs/vz4GBObHGg/sBdpBEA69EVpeys6MXuy68gNkl5U+O5ZPat4KY0Vayy5g60zWNqhocwS9R0eXzxqs3U9ubSPaCi1jcs5TEKGwDniaK372PygMD1dfgr2yMr5wvbTpADyyuLXNuoTERcKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728389889; c=relaxed/simple;
	bh=514KldOZ3tK8J7DT30tLPRUoqhdi48w4zftEs1nR60g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZduCzagOHm6Hr0k7CR+PJWxCmgc9z+w4Bk9JgBBzRsWG2CqihpctXOfg1JyFxm+FLmUq9MAXQLNJQwO7UMvjRTQdIMkkTmhp7+jqQFAzXEa0UfqHypYr3YUZQhx2YOC3SgtqaD68yeucMQWL++MLIV4F0kE8ouy6iSxDrPce4zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=T7BQkz8M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 498687d0026919;
	Tue, 8 Oct 2024 12:18:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=LR7Fv5JZHSZc5g/kI6HJZZE+/51U2QC5gdb
	NmDpj9Rg=; b=T7BQkz8MpZfkzqC5i16dQLTcF2HfYwPI7JCcwsZJ2gFjj5IGuPh
	NpbhpiFbJkbCoh2YBZffgEBBK5o15SIJoaZWnTv3M/Y4MNyfoOt5Ns1MaEStxsFQ
	dsBBY0+s8FHc/jBSsKTBZrVkhCoO6mdx+UOuebTrWbUsFafll/M4yLCT1JI+v2OB
	WB3BRdMuXZnMPK3dWo4/dmtWiTkmqY9P6YtisB481cavSLhJuVhR6/T2rQdU4Sro
	dwRF6g8ByXnEhT9c7LRl/pOM+1zO2atkHareptn1+Jh0n5d9s0EYDlcfcXtOIpYt
	BB2LedmWrvMXBSRM5a+1kG/PT3XgUFPw02Q==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xq9ycgr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 12:18:04 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 498CI1SB018333;
	Tue, 8 Oct 2024 12:18:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 422xhkw1eb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 12:18:01 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 498CI1Pa018326;
	Tue, 8 Oct 2024 12:18:01 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-skananth-hyd.qualcomm.com [10.213.96.172])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 498CI0GJ018325
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 12:18:01 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 432606)
	id EAEB1AF8; Tue,  8 Oct 2024 17:47:59 +0530 (+0530)
From: Subramanian Ananthanarayanan <quic_skananth@quicinc.com>
To: andersson@kernel.org, krzk+dt@kernel.org
Cc: quic_krichai@quicinc.com, quic_vbadigan@quicinc.com,
        Subramanian Ananthanarayanan <quic_skananth@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] arm64: dts: qcom: sa8775p: Update iommu-map entry
Date: Tue,  8 Oct 2024 17:47:54 +0530
Message-Id: <20241008121755.1174730-1-quic_skananth@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hqnomVuQEgyXfGGgd60dF5dkmbMOBFHM
X-Proofpoint-GUID: hqnomVuQEgyXfGGgd60dF5dkmbMOBFHM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410080077

SA8775P has only support for SMMU v2, due to this PCIe has limited
SID entries to enable dynamic IOMMU mapping in the driver, hence
we are updating static entries.

iommu-map entries are added to support more PCIe device like switch
attach, SRIOV capable devices. These entries are specific to this
board as topology of PCIe devices can vary based on the end usecase
connected via PCIe. For other board files, these entries may
not be directly applicable.

Signed-off-by: Subramanian Ananthanarayanan <quic_skananth@quicinc.com>
---
Changes in V2:
	- Updated commit message.
---
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
index 0c1b21def4b6..05c9f572ae42 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
@@ -675,6 +675,37 @@ &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie0_default_state>;
 
+	iommu-map = <0x0 &pcie_smmu 0x0000 0x1>,
+		    <0x100 &pcie_smmu 0x0001 0x1>,
+		    <0x101 &pcie_smmu 0x0002 0x1>,
+		    <0x208 &pcie_smmu 0x0003 0x1>,
+		    <0x210 &pcie_smmu 0x0004 0x1>,
+		    <0x218 &pcie_smmu 0x0005 0x1>,
+		    <0x280 &pcie_smmu 0x0006 0x1>,
+		    <0x281 &pcie_smmu 0x0007 0x1>,
+		    <0x282 &pcie_smmu 0x0008 0x1>,
+		    <0x283 &pcie_smmu 0x0009 0x1>,
+		    <0x284 &pcie_smmu 0x000a 0x1>,
+		    <0x285 &pcie_smmu 0x000b 0x1>,
+		    <0x286 &pcie_smmu 0x000c 0x1>,
+		    <0x287 &pcie_smmu 0x000d 0x1>,
+		    <0x288 &pcie_smmu 0x000e 0x1>,
+		    <0x289 &pcie_smmu 0x000f 0x1>,
+		    <0x28a &pcie_smmu 0x0010 0x1>,
+		    <0x28b &pcie_smmu 0x0011 0x1>,
+		    <0x28c &pcie_smmu 0x0012 0x1>,
+		    <0x28d &pcie_smmu 0x0013 0x1>,
+		    <0x28e &pcie_smmu 0x0014 0x1>,
+		    <0x28f &pcie_smmu 0x0015 0x1>,
+		    <0x290 &pcie_smmu 0x0016 0x1>,
+		    <0x291 &pcie_smmu 0x0017 0x1>,
+		    <0x292 &pcie_smmu 0x0018 0x1>,
+		    <0x293 &pcie_smmu 0x0019 0x1>,
+		    <0x300 &pcie_smmu 0x001a 0x1>,
+		    <0x400 &pcie_smmu 0x001b 0x1>,
+		    <0x500 &pcie_smmu 0x001c 0x1>,
+		    <0x501 &pcie_smmu 0x001d 0x1>;
+
 	status = "okay";
 };
 
@@ -685,6 +716,37 @@ &pcie1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;
 
+	iommu-map = <0x0 &pcie_smmu 0x0080 0x1>,
+		    <0x100 &pcie_smmu 0x0081 0x1>,
+		    <0x101 &pcie_smmu 0x0082 0x1>,
+		    <0x208 &pcie_smmu 0x0083 0x1>,
+		    <0x210 &pcie_smmu 0x0084 0x1>,
+		    <0x218 &pcie_smmu 0x0085 0x1>,
+		    <0x280 &pcie_smmu 0x0086 0x1>,
+		    <0x281 &pcie_smmu 0x0087 0x1>,
+		    <0x282 &pcie_smmu 0x0088 0x1>,
+		    <0x283 &pcie_smmu 0x0089 0x1>,
+		    <0x284 &pcie_smmu 0x008a 0x1>,
+		    <0x285 &pcie_smmu 0x008b 0x1>,
+		    <0x286 &pcie_smmu 0x008c 0x1>,
+		    <0x287 &pcie_smmu 0x008d 0x1>,
+		    <0x288 &pcie_smmu 0x008e 0x1>,
+		    <0x289 &pcie_smmu 0x008f 0x1>,
+		    <0x28a &pcie_smmu 0x0090 0x1>,
+		    <0x28b &pcie_smmu 0x0091 0x1>,
+		    <0x28c &pcie_smmu 0x0092 0x1>,
+		    <0x28d &pcie_smmu 0x0093 0x1>,
+		    <0x28e &pcie_smmu 0x0094 0x1>,
+		    <0x28f &pcie_smmu 0x0095 0x1>,
+		    <0x290 &pcie_smmu 0x0096 0x1>,
+		    <0x291 &pcie_smmu 0x0097 0x1>,
+		    <0x292 &pcie_smmu 0x0098 0x1>,
+		    <0x29d &pcie_smmu 0x0099 0x1>,
+		    <0x300 &pcie_smmu 0x009a 0x1>,
+		    <0x400 &pcie_smmu 0x009b 0x1>,
+		    <0x500 &pcie_smmu 0x009c 0x1>,
+		    <0x501 &pcie_smmu 0x009d 0x1>;
+
 	status = "okay";
 };
 
-- 
2.34.1


