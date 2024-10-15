Return-Path: <linux-arm-msm+bounces-34400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C65099E0AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 10:17:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C58A1284448
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 08:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 682D71DACA8;
	Tue, 15 Oct 2024 08:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HKlcKzkb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3E91DAC90;
	Tue, 15 Oct 2024 08:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728980207; cv=none; b=CjRSEdFqz91xkEDu6f6igf0UTbX03r+Yt/zFdEU5PIV1Q2d4di/E7jz3h3RM7DHcVjkgoy7UjN0MJW0SbYXyTBtTTxkUuMAsOvjx7Zoh/mGcgw7tayXr13mm+6iiM0p/lATbWgGpzlQwJ/i05nKFA/WYgDxJBYKDCo0pO0wlUco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728980207; c=relaxed/simple;
	bh=nC8FciNiN3Dfqy58CPUQXdpnt60YHZOVeQ/0YubqLHk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IzWgc2LHXG4XlLfA5v88r2R0IhJS0WGlPjC95NFrfNWKNuVDREuxBRaCVekyun8qPS62QRyoCX5QFFawtQHJHwmrzyfCpJTiR3Un20/YTG3HSeNLXDkRbHpVfHtIqtUYKieEoQb2Q4qMCCmT/LZsfIE5JtqG4HcySmnVeXUkny0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HKlcKzkb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49ENNl4C028840;
	Tue, 15 Oct 2024 08:16:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8BtTNXkjvMiKVnqAsUXbO2J/
	NsnCrNk4H2wTEClBxPQ=; b=HKlcKzkbAjd8pj7k7lRFyISRJYOm4pjJuWcbBveq
	V6ZOgxkwOV0b4bmOX2ICim4ECywVkvICOPF+CriapovSNlk57yKQERQiFx4vBMUx
	F4XxF4sdWa5/ry2Y2b2cKBIdXUyVANG/3T1fYPiglU507cmrxTXZyVOPvRLDUB3K
	TcBaK4MhNiKh70Oafy26lExVY20sNacT/4UrNAT5EVIsCHB8uB7O5RB347DHjzZG
	P4NJy14ovj6cqobexvjdlI23XjX1yQvgsXuCpdy00Ng3Y7uzUmnQJOKi9n7EYcUH
	v0eINTnqP/Ip6kElSEv3I+jMjOsGSnbsu/x0+A16LUEl7Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4292evjkjt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 08:16:35 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49F8GXKL005669
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 08:16:33 GMT
Received: from hu-qqzhou-sha.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 15 Oct 2024 01:16:30 -0700
From: Qingqing Zhou <quic_qqzhou@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <robimarko@gmail.com>,
        <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
        Qingqing Zhou
	<quic_qqzhou@quicinc.com>
Subject: [PATCH v2 3/4] arm64: dts: qcom: qcs615: add the SCM node
Date: Tue, 15 Oct 2024 13:46:02 +0530
Message-ID: <20241015081603.30643-4-quic_qqzhou@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241015081603.30643-1-quic_qqzhou@quicinc.com>
References: <20241015081603.30643-1-quic_qqzhou@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bixXW20W4eSuNi3vCRkI5LY9MSr__6kM
X-Proofpoint-ORIG-GUID: bixXW20W4eSuNi3vCRkI5LY9MSr__6kM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 phishscore=0 adultscore=0 bulkscore=0 mlxscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410150055

Add the SCM node for QCS615 platform. It is an interface to
communicate to the secure firmware.

Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index ac4c4c751da1..027c5125f36b 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -278,6 +278,13 @@
 		reg = <0 0x80000000 0 0>;
 	};
 
+	firmware {
+		scm {
+			compatible = "qcom,scm-qcs615", "qcom,scm";
+			qcom,dload-mode = <&tcsr 0x13000>;
+		};
+	};
+
 	camnoc_virt: interconnect-0 {
 		compatible = "qcom,qcs615-camnoc-virt";
 		#interconnect-cells = <2>;
-- 
2.17.1


