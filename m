Return-Path: <linux-arm-msm+bounces-57228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1792AAF549
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 10:16:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6865A1BC7DD2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 08:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A1BC22DA16;
	Thu,  8 May 2025 08:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KrxKV25K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2CF22154B;
	Thu,  8 May 2025 08:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746692156; cv=none; b=PqJI4OMTrtSEVD80yB2MUemBKPW4dUPhZshxWEW9L4hPq7wMlUcKnJMeBTgqy0oUFqZBsQCjdUfVX9bKLZlo3cZZYgjRmbniphVnpP9g9FpsKrNkj3pdmd14/bPwPEgtG167IhJV12p+z8jl/9P6rRYLwrt7t2rZtGZRD9mPPIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746692156; c=relaxed/simple;
	bh=30LrIKBBll7Dujcsr9mqzl8zpWmZeJP5Cm4yFdsay/g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gOOfIihuafA3hB17aP+jxIf44Ujo+8mKrs6lbXTNWYv7pmSZIp78wxrHx4J3QbzfAZCy2wuxkM7MUZoBRSRDTx3iv6yH152gY73bHXJbSOo7hAOhvidf/upmCxZYlvIy/mZ1q3PaYoNCT2BteLBcAQlui+68Y9ZEozTLTuPC2Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KrxKV25K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5484WnJt016851;
	Thu, 8 May 2025 08:15:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5rt8vsXqhX8
	MUFon9nFsB+7zSyJRp5+P8BGxxhdTzb0=; b=KrxKV25Krl9BnTBTM2HYmZqioPQ
	SgblALJ+owWXdpxsEJnTBEeP7QGvBdTgD5dUvH5shO1lqOOWpKcQDvkmo6EECjci
	qsESSCgH2TSdRRlWisvd31wYTfT1yi5aRtXy08vlG8yVWZMDedv7y0VNWIWOGtlN
	Z7bGwiVhpAc8B9CkoDGu1xWPWG2wh3UqqhNb+ECdAQ58O2TaiyUcTJHlNMr6few8
	Er+JAodwGf5MIiq/ml3Giy3cebRHQEaCAlzB4Q2mdxCUS+wBXqhqfzLdmO1ToibA
	T+2eYO9Pb0Fh1DYKZrtSNghrn+Y6RlJuVetYHdugV6n6hoL3J/RvXAhoTUA==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp68hdp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 08:15:39 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5488FbgP015295;
	Thu, 8 May 2025 08:15:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 46dc7mq5ft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 08:15:37 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5488FbOH015282;
	Thu, 8 May 2025 08:15:37 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 5488FbsS015267
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 08:15:37 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 4635958)
	id 108D240CFD; Thu,  8 May 2025 16:15:36 +0800 (CST)
From: Wenbin Yao <quic_wenbyao@quicinc.com>
To: catalin.marinas@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        vkoul@kernel.org, kishon@kernel.org, sfr@canb.auug.org.au,
        linux-phy@lists.infradead.org
Cc: krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com, quic_cang@quicinc.com, quic_qianyu@quicinc.com,
        quic_wenbyao@quicinc.com
Subject: [PATCH v3 4/5] arm64: dts: qcom: x1e80100-qcp: Add qref supply for PCIe PHYs
Date: Thu,  8 May 2025 16:15:13 +0800
Message-Id: <20250508081514.3227956-5-quic_wenbyao@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250508081514.3227956-1-quic_wenbyao@quicinc.com>
References: <20250508081514.3227956-1-quic_wenbyao@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDA3MiBTYWx0ZWRfX8/PD56QYFILF
 l1hmA/c9w/23dLojVeSdOLbmZ2a0w90rGiesv3wDg10NJDoguuqDDtqWznWwu9dJ9w8fIIdb6Ol
 WDji7LSmo0ndtKvVzLnPSzebadvFYG4k/xpeHSoyvZ1bbcfXi0Lj5BMAaw+r4UiWQpOurJU3uAr
 KKC7elYppIAx5LfPCqU4nZpE7uSbKxRwbm9OZkAJdtyjfSIntQ1I8Qv5/OgluBMfr6J25RhJ8U4
 rmQG6paZk9CV4/vvjClcvyJX1QJz3jg0+EsK1p7ZcH4yIOYKi0dt57VBzI7BWAZRP++sfqjtVqJ
 loAj7r2zCp+pYe2ECyfx9eAfzbIuwgahkyKmCiO0+7Rd/Rq8PFetj5fvtyRp9mNv/Mfgyk9bR+v
 +H+1SQ2e5TaqYmfBFSHJUoC4/k1WzyyPeoEnXrP0dt5sgLWThrUFZtZKqAJ7oQLv7wdmhXN2
X-Proofpoint-GUID: -8fcnbdSkNyIeY4rp2aDy6GtK-sEpCZ9
X-Proofpoint-ORIG-GUID: -8fcnbdSkNyIeY4rp2aDy6GtK-sEpCZ9
X-Authority-Analysis: v=2.4 cv=BvGdwZX5 c=1 sm=1 tr=0 ts=681c682c cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=OjqB7RjhM8taGROUhtwA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_02,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0 mlxscore=0
 spamscore=0 mlxlogscore=916 malwarescore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080072

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
index ec2479f8f..a7f3ac142 100644
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


