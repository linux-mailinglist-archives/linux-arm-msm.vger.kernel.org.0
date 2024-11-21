Return-Path: <linux-arm-msm+bounces-38601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7516C9D4732
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 06:20:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1325EB21214
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 05:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 848A31C9EA4;
	Thu, 21 Nov 2024 05:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Dqe3oTUa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA731C9DDC;
	Thu, 21 Nov 2024 05:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732166413; cv=none; b=jYRvLi/6alIxzjT4BRR8mon+Nze+ViUh77LQyhgDI8qiqJMPVo1Yhf7hzt2aCLBJLTNdXV+rKnUp0XW0gLdmJRcpQ52+gC3Gqyrb7njTW1aQXKt8oa33ytOQFFuYMU+yvp+TnafUSjKCpKFU32s654qjQobfCO6LqVA2msW04uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732166413; c=relaxed/simple;
	bh=pm3HocN3GvrmiHeru0cjRN7+Ow4+dMkboMMoX8Fzt98=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bibZCWoimkeTUA1LSIzLjfxp4jfZIb76CyNjdbKOj0qapqLDVuOVxoi3pUBI51YsBhVhQQVtEu/yxKYVlYhP1IQ01IkfNIF6RvEDzwqgP/KYdnh3d6/SoEE0LHHm43dxuGBSiY3p3jluCAHre5CwBiUSauGKhxfELAxbWa4Y2PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Dqe3oTUa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AL0qwtN027170;
	Thu, 21 Nov 2024 05:20:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N+R+67d+Td8YLt+It/qRvVLGiiIIepGNAKAvyA3viL0=; b=Dqe3oTUaMaZKODY4
	JJRTytciP5YX/O6Pik5QQya5sYuOfqzDvqmgQAReQcnVvvy9FpnemDInv3LndIJ4
	wOeeWOg6gdltZi+4GNm7tMfZ1RfqA8nMV5QcGNEWm/2ND3EUiB/BIF4sNZ+x44/w
	Jdoy1DbxLOK8+/2gU2Xpm/cXry2apJTYwGYNV8OFk95PAWw0XZ3gZx559ZrWEtg8
	CnM+oc489c6FEHd7JvmuID26Uea5vc51ByTnc+SQDcwmfeNKOqgSj32P6In48PTV
	fRA0zFY3VcaimkTMTBNy+Fhv6xZGD/o+8vQ94iZNoiwJ01UQFUtxlhMWrXskUkuj
	XmA07w==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431ebyaf0r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 05:20:09 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AL5K97u013421
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 05:20:09 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 20 Nov 2024 21:20:05 -0800
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <conor@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: Varadarajan Narayanan <quic_varada@quicinc.com>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 3/3] arm64: dts: qcom: ipq5424: Add LLCC/system-cache-controller
Date: Thu, 21 Nov 2024 10:49:35 +0530
Message-ID: <20241121051935.1055222-4-quic_varada@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241121051935.1055222-1-quic_varada@quicinc.com>
References: <20241121051935.1055222-1-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MMD9_OOwbLS-n31avXOpmP0zxETvmN20
X-Proofpoint-ORIG-GUID: MMD9_OOwbLS-n31avXOpmP0zxETvmN20
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 mlxlogscore=648
 spamscore=0 mlxscore=0 phishscore=0 suspectscore=0 bulkscore=0
 adultscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411210039

Add a DT node for Last level cache (aka. system cache) controller
which provides control over the last level cache present on
IPQ5424 SoCs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
---
v3: Rebase to ToT

v2: Add Reviewed-by
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 5e219f900412..bdb73f8c09f9 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -145,6 +145,13 @@ soc@0 {
 		#size-cells = <2>;
 		ranges = <0 0 0 0 0x10 0>;
 
+		system-cache-controller@800000 {
+			compatible = "qcom,ipq5424-llcc";
+			reg = <0 0x00800000 0 0x200000>;
+			reg-names = "llcc0_base";
+			interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		tlmm: pinctrl@1000000 {
 			compatible = "qcom,ipq5424-tlmm";
 			reg = <0 0x01000000 0 0x300000>;
-- 
2.34.1


