Return-Path: <linux-arm-msm+bounces-55587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBB3A9C381
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 11:31:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A14C91B83919
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 09:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D969D23D28D;
	Fri, 25 Apr 2025 09:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BudrOJat"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA5323C8A3;
	Fri, 25 Apr 2025 09:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745573417; cv=none; b=Ielr7/m9cTetY4M/QOEP80/QhM1yrU87d9V6PlWjdBzFWsXtHSOXPNWI0fi9/RIDJ9hW4x8dtm/VxK5S4A94vtzJEsPRsM0N3rWihPPNXnOJ+4g4BsFZUgzdX+IZsTGCpnyUGulZGJ+tAOqprX+1LsJSoQxUa2KK0CXTTer74xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745573417; c=relaxed/simple;
	bh=ste7Fc5oKfX+ZjQjOKPFURRxNnqXr6gYItPFMZtS0Z0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LGZcrEVcmDuCGcAUikAlNxO5PmI8d4+lEPRuNHmg2JayhNvMJuYMqY0resHkFNL9XSWBF0RXMP+QgL0UFnP+ggBLIz9xq3vuUy12quKWf85g9tKZe+Y/eXT6Zvww3spLTkaEE20cKSDs1q5T9RzoP1X0y8fDeF+z50AFXbmN6Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BudrOJat; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8T8ZQ015508;
	Fri, 25 Apr 2025 09:30:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CzkmqC+WLm1
	vrlbf2jTj168oIwfL1CCLWC31NbkXyhA=; b=BudrOJatB8RNqLEFiCFF0VuND4s
	4J0IwqGsXgm90IY/kVEcVPEBasw7MXGVVQyXPkI3Is2Om+GNnWM9/xRHSAfycxq1
	SAkd3gLgDL8QgOYPQYn3YerMwhzw5ZaR4DVLxEPZzRVZQQAYfj0udMJJmeLlAI4R
	66mJ588SJV5GR0Yx5CT/74DRGBUu24Gj2+I1CNdRK4rL51hYqHRU/Tems2tD/ALf
	s39XQInmcJj7vNebBpX9jL6nZGQKC9YvH4PTEFNV3X3UoD/cLi/gvqyuDYLVYtM1
	BaGpWVk5W2D8EI/bl54btuKVHYkJilcV21lhoYRXbyO75NHnG1lfmHL8KDw==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3gdyq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 09:30:08 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 53P9U2Vc022398;
	Fri, 25 Apr 2025 09:30:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4644wnf75s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 09:30:06 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53P9U62l022446;
	Fri, 25 Apr 2025 09:30:06 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 53P9U5XB022442
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 09:30:06 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 4635958)
	id ECAA040D72; Fri, 25 Apr 2025 17:30:04 +0800 (CST)
From: Wenbin Yao <quic_wenbyao@quicinc.com>
To: catalin.marinas@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com, quic_cang@quicinc.com, quic_qianyu@quicinc.com,
        quic_wenbyao@quicinc.com
Subject: [PATCH v2 4/4] arm64: dts: qcom: x1e80100-qcp: Add qref supply for PCIe PHYs
Date: Fri, 25 Apr 2025 17:29:55 +0800
Message-Id: <20250425092955.4099677-5-quic_wenbyao@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250425092955.4099677-1-quic_wenbyao@quicinc.com>
References: <20250425092955.4099677-1-quic_wenbyao@quicinc.com>
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
X-Proofpoint-ORIG-GUID: ALFYs74D6CbD8NMaewXD5DNcPP3R-3jy
X-Proofpoint-GUID: ALFYs74D6CbD8NMaewXD5DNcPP3R-3jy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA2OCBTYWx0ZWRfX2d40eRStsULl C5CldPbn7DfkLfLYxzVNqBXxebmhks0NcEwZntbYMTnjdUt6lqkdFoHLy1A9a8taYNuVTRBSkYj eoNZzvwiQAEGpydVmWn62oTwvBlLif35Cc6ePbX8SkPdiMTyO027AZJM0gAJexLo2w26OllgzZ+
 tGBXCxcej35v4Y5v49ryCQ6ieuri7hnBMMmBwPhEO1dSToLKHjz7Lym2WXGLNB94wWwKFRCg7W7 mcVrkVjss4K0+iLIiCltoM/yv8ovi/f6GrKaL0Qs57coAjk9JgYPZjIaWZUmN6nRJMnHuQSNKyz PxhqNrvf7Vipnfl9aMHyb+ahyoKXFIiA13F70r6nYpXLbGkq2zw+HnoT+/ufn7ZALAQqqRpdFbd
 sJWJcLDjBNJNIzeuy3r6WJ2elYgEq71mytanVSLe56JNhqhMAorrl0iTSv/LeZ+j013SKp6k
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=680b5620 cx=c_pps a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=OjqB7RjhM8taGROUhtwA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=920 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250068

From: Qiang Yu <quic_qianyu@quicinc.com>

All PCIe PHYs on X1E80100 require vdda-qref power supplies, but this is
missing in the current PHY device tree node. The PCIe port can still
function because the regulator L3J, which vdda-qref consumes, is voted by
other components.

Since the device tree should accurately describe the hardware, add the
vdda-qref power supply explicitly in all PCIe PHY device nodes.

Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index 88dfd2199..10f2ac70e 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -994,6 +994,7 @@ &pcie3 {
 &pcie3_phy {
 	vdda-phy-supply = <&vreg_l3c_0p8>;
 	vdda-pll-supply = <&vreg_l3e_1p2>;
+	vdda-qref-supply = <&vreg_l3j_0p8>;
 
 	status = "okay";
 };
@@ -1017,6 +1018,7 @@ &pcie4 {
 &pcie4_phy {
 	vdda-phy-supply = <&vreg_l3i_0p8>;
 	vdda-pll-supply = <&vreg_l3e_1p2>;
+	vdda-qref-supply = <&vreg_l3j_0p8>;
 
 	status = "okay";
 };
@@ -1053,6 +1055,7 @@ &pcie6a {
 &pcie6a_phy {
 	vdda-phy-supply = <&vreg_l1d_0p8>;
 	vdda-pll-supply = <&vreg_l2j_1p2>;
+	vdda-qref-supply = <&vreg_l3j_0p8>;
 
 	status = "okay";
 };
-- 
2.34.1


