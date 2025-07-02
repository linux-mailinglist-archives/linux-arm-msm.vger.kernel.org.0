Return-Path: <linux-arm-msm+bounces-63338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 971B9AF0EA3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 11:00:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1393D4A01AD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 09:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F22F2441A0;
	Wed,  2 Jul 2025 09:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nSOjp2W9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA63B242D86;
	Wed,  2 Jul 2025 09:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751446805; cv=none; b=pjetWxocF9TrN3d9rQ0YJw0h784WLlcsBORORJkYFLkNYJ2oZ0ZoExhZTfoIbI0GilBPPpHd8ix9AdF4HjQkKLdONjy+YZuwYBlsCf5gU/GB7agcUXl9zWuyVeH9m0sqYgSxfxSeJymUjkeyVpWJ/xFXzI/ULGt0zMzSmPT3Pi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751446805; c=relaxed/simple;
	bh=bII4dviX1J1y/8PVse2wWAO2zXUYN7E3jBriBPaoMBA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j3HsvPecoM6JXCePAEYbR72sDSSElut50JxQj3SZfcGAsR5SGV/c4K4z+qP1w6I7UPj8rwNwxvjIa9rmxwbJg9uPLzy2Y5mwprsNRqxkoe5qQGBri3HGQAr6F0A9ATmxTUWB1UHGgjoBL4+4WzSmvIDLUMnLIIeip59GVj8Uxtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nSOjp2W9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5623fDZf010383;
	Wed, 2 Jul 2025 09:00:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LKVbcoYV5xgvRGYT0ElzmeIS
	o6yn3EZh3/wZEJS/PCs=; b=nSOjp2W9+4CT0J+MtEvHU7iPdz87Q2f5EUWdIGQH
	qeD4z2N76C0jcWhXKgmSMTsDE1xP1sghGRm2SEWrblcbBuMbttFZsHT1eHbL4iGp
	ortc4KStCKoI+nMXhpyW1njupoEMtxAKurv4jBqlxLWYqAcUMEKMUbhYd+vWTixb
	vVJU47SqBQ3N73KeTp1lg1D7U5sIynqS66e6z6X6eqB1nZU45UAE3u3F/ho8STgg
	9tb7LoZEU/3lKGyZqH8BuKliyLyIMRe7kjJnDUKT3GG+pfrVwsleezGRfvkY+TmO
	o89Gn9svInT80t6/divStEsEwZAT93/u5A1uXh6drfkZfA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mw308vqp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 09:00:01 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 562901N3006187
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Jul 2025 09:00:01 GMT
Received: from hu-sayalil-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 2 Jul 2025 01:59:58 -0700
From: Sayali Lokhande <quic_sayalil@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mmc-owner@vger.kernel.org>
Subject: [PATCH V3 3/3] arm64: dts: qcom: qcs8300-ride: Enable SDHC1 node
Date: Wed, 2 Jul 2025 14:29:27 +0530
Message-ID: <20250702085927.10370-4-quic_sayalil@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250702085927.10370-1-quic_sayalil@quicinc.com>
References: <20250702085927.10370-1-quic_sayalil@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=CY4I5Krl c=1 sm=1 tr=0 ts=6864f511 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=_IW4Oi3bjg1409mID4wA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Mtv-LTJR46oYns7svL6ntRH0xrUnNR4G
X-Proofpoint-GUID: Mtv-LTJR46oYns7svL6ntRH0xrUnNR4G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA3MiBTYWx0ZWRfX/Wo6f4g2xEfo
 +Pg4BS3DSDkbZ2oqQ8sBZNUY2Mk1urx7vY0wD7snx/WPnQy+KQ1dGOqxXhxbcdMjcxrNs/ejh76
 PEbWMO77mW/PKHloKduBlOkBHv9caeW/+a3+dWzCbfncxfZZ5kqdnJ5R4r4aJLEzXytxqN/rtOH
 F/rG5cVvgeRBrERdL861efwAB9vFuxRab56u7ij43h3bv7o9hJAEDFH36toRnwp+JScE4POUq4v
 Jr2/T7jsRUHfzU65vjn7jUSlw9WtNO19nBtTiWdbnFBWDKUsuc/nHDSUjhuKDqWHRRGH8C34l+P
 uUzazk/2GxbhphoG0gyUDasFzCeLkeBVYvu/AHjEsSgp1imdtsyR93IbfXFi4RbjWZEmU8u+DkJ
 hGkXh+rnc5sTqjLlA/tjvvef6TvwaeAm68qqxA0bgE9Jr37vc12urW8RUx/OnNCQJWCXMBGA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=608 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 mlxscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507020072

Enable sdhc1 support for qcs8300 ride platform.

Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index 8c166ead912c..9c37a0f5ba25 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -17,6 +17,7 @@
 
 	aliases {
 		serial0 = &uart7;
+		mmc0 = &sdhc_1;
 	};
 
 	chosen {
@@ -332,6 +333,26 @@
 	status = "okay";
 };
 
+&sdhc_1 {
+	pinctrl-0 = <&sdc1_state_on>;
+	pinctrl-1 = <&sdc1_state_off>;
+	pinctrl-names = "default", "sleep";
+
+	bus-width = <8>;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+	vmmc-supply = <&vreg_l8a>;
+	vqmmc-supply = <&vreg_s4a>;
+
+	non-removable;
+	no-sd;
+	no-sdio;
+
+	status = "okay";
+};
+
 &tlmm {
 	ethernet0_default: ethernet0-default-state {
 		ethernet0_mdc: ethernet0-mdc-pins {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


