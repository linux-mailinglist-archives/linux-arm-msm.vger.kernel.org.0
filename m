Return-Path: <linux-arm-msm+bounces-60190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B0203ACD929
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 10:03:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB103172BF5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 08:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0144128B4F2;
	Wed,  4 Jun 2025 08:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="p3u6RaDr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8508D27FB3E;
	Wed,  4 Jun 2025 08:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749024182; cv=none; b=Ar/odSXuJ0uN1A95DxJqqV7C4D4W1ycJxfF30qITm4/yVd3IN0NIrGX3TQ7r3uZNwax1aCLmdACD/8v+9b3lv8VzScmV1XCAqssQlv12qdyR56qsEsS6yNIuaZ0ryx/r15l3ruZYYOeupJXri3GnrzokWsToSiBI2DUSjs+MLBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749024182; c=relaxed/simple;
	bh=iwD3bGLpR1NyUzs6GyvILRJlvIVEmrZ6Nmr4B0zx/xk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hT7q1h/6YnzBQKABGGPpVSK/fEbvgpgp7/+RHmR0D1x0+pq9WSggxkXdoPylDZNkXVj5hchixMLKAcCA30Hm3BerbZ48adqU0ajHBFoKvVqaKEMx1Wf+knmbQ9aGZ+0EAFto7ehTbM9jtfYL9SPvKQ6SdA4J9uMYOeB82LvoN1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=p3u6RaDr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5540G03u014378;
	Wed, 4 Jun 2025 08:02:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bzWTEW+W3lG
	iCAhiPR5K0lLXKV9A8/Cr9jORc6rODr0=; b=p3u6RaDrre5XBDpAaxkRR5sWGtn
	AEr4JnFEH8Q5VowQbVfQL7q6pDCAoI2Ewt4H2pinP/7pwbxmjcBxw8pPu/U9lTsz
	S12iA4PMg4QUj4+81eksNmtlHwhr/DJVeBFCUY/rpUj/jGRhPE9i1pZCXjgOTnw3
	L96/xwk8To0SLXE4x9L+C+LiSgGbx29qVFWLwsrtOh1aSLgp3zwy1e0j/LJIlBw5
	GPOISfRk7EkcwAXOeb1xOLmkNHtzdYG2UaDYNAv27PzxNOer2cm1/YaSFCWC5+4K
	pc0+heZxqzWACkoMITXDZAhQbCorYWUbywBQ4LQcNuPqIwcf+gcGBvLYe3w==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472be810gx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 08:02:49 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 55482kLQ018808;
	Wed, 4 Jun 2025 08:02:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 46ytum6jgp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 08:02:46 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55482kZp018800;
	Wed, 4 Jun 2025 08:02:46 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 55482kcw018797
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 08:02:46 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 4635958)
	id 4093940D26; Wed,  4 Jun 2025 16:02:45 +0800 (CST)
From: Wenbin Yao <quic_wenbyao@quicinc.com>
To: catalin.marinas@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        vkoul@kernel.org, kishon@kernel.org, sfr@canb.auug.org.au,
        linux-phy@lists.infradead.org
Cc: krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com, quic_cang@quicinc.com,
        qiang.yu@oss.qualcomm.com, quic_wenbyao@quicinc.com
Subject: [PATCH v4 4/5] arm64: dts: qcom: x1e80100-qcp: Add qref supply for PCIe PHYs
Date: Wed,  4 Jun 2025 16:02:36 +0800
Message-Id: <20250604080237.494014-5-quic_wenbyao@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250604080237.494014-1-quic_wenbyao@quicinc.com>
References: <20250604080237.494014-1-quic_wenbyao@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=bNYWIO+Z c=1 sm=1 tr=0 ts=683ffda9 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=tbgy-Di65HE5H-DEitsA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Jb3zl6ZJ9lXJ3Ii9JmAgHg35wUgNWerC
X-Proofpoint-ORIG-GUID: Jb3zl6ZJ9lXJ3Ii9JmAgHg35wUgNWerC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA2MyBTYWx0ZWRfX4r04uPZVJ259
 kK6/t7YUI2/vg5hA4LOyzgMPYGhz3Zdr5aO31SfxLOaGvaaDPSwDE7YyZNnG+H92o9W5Ds1Lelk
 c4H9nqoMRcfl3NGJvlDMUOgY/LI6YQe+LMuZ5d993AXArs1Fg8Uidw0fmvVz2r0Q/mi34xIFDfr
 qJ861DsQPBFPXDNGfxUE9ybgxJ/kKk/VF46JK9d22V1PPe2dXgskogNU6ToCdHDPYiUOrjQBpWI
 t/jYX7mYkhoXLR9ngiZsNZ7n9waN2gGsZLfP5zcDp+QEXA1wyAamJGl98yj6/cWF5RwCitR+ZPf
 JNJOsKVZThHIFgyuveAxHL1VW3Ur+UzF1Fu5Ezw92iidyHYclfCWKmfF5L5tbJJRrI+7bYB0Yti
 htRJvw7nOQFeQwl6/vqWdORZslR4StgMTbrk5K8XSsnm9ixIQldewox7X2VXoZokRguEUzDG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 impostorscore=0 spamscore=0 clxscore=1015
 mlxlogscore=882 adultscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040063

From: Qiang Yu <qiang.yu@oss.qualcomm.com>

All PCIe PHYs on X1E80100 require vdda-qref power supplies, but this is
missing in the current PHY device tree node. The PCIe port can still
function because the regulator L3J, which vdda-qref consumes, is voted by
other components.

Since the device tree should accurately describe the hardware, add the
vdda-qref power supply explicitly in all PCIe PHY device nodes.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index 71c44e37a..3bbd234e5 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -993,6 +993,7 @@ &pcie3 {
 &pcie3_phy {
 	vdda-phy-supply = <&vreg_l3c_0p8>;
 	vdda-pll-supply = <&vreg_l3e_1p2>;
+	vdda-qref-supply = <&vreg_l3j_0p8>;
 
 	status = "okay";
 };
@@ -1016,6 +1017,7 @@ &pcie4 {
 &pcie4_phy {
 	vdda-phy-supply = <&vreg_l3i_0p8>;
 	vdda-pll-supply = <&vreg_l3e_1p2>;
+	vdda-qref-supply = <&vreg_l3j_0p8>;
 
 	status = "okay";
 };
@@ -1052,6 +1054,7 @@ &pcie6a {
 &pcie6a_phy {
 	vdda-phy-supply = <&vreg_l1d_0p8>;
 	vdda-pll-supply = <&vreg_l2j_1p2>;
+	vdda-qref-supply = <&vreg_l3j_0p8>;
 
 	status = "okay";
 };
-- 
2.34.1


