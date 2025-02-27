Return-Path: <linux-arm-msm+bounces-49667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BF9A4797C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 10:42:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2365A17228A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 09:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 526EE2288EA;
	Thu, 27 Feb 2025 09:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="l5Sar5Oe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA482226177;
	Thu, 27 Feb 2025 09:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740649366; cv=none; b=oQq0D9C2If0WRhqE9rYwOqiXsg8DdQgnJEPrGQhaSOllJTBYe3Ijjkwn2aRfM6dWjzc9oT17LrC8a1GFVVSoMOg6vf6QGasEkJG7iH5MkI4XcA6AR2UK5uSFZkdsAyayI4LQdXlENRxBttY4z1bEQ1m+j1oPx1ZiQJN1TBQ4Dco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740649366; c=relaxed/simple;
	bh=PtOmzlY6KYXkBJx275SrxKV6K4pn/j/MTqxF5tn5PA4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BsjStMvcB+FMOlyFoRDmCapyTTuDdLVCyy93r5QHagKCLR82/bsWcFcq4fXKLuQVPSqGEGbwsiGRP9mRuCRl5Fix18itpqGZNGIzMLkHIk7ef4oKk4J5cxh7xkRN209fmUGfa6larI47IRpp7YFGNExZXHk0e+9P2DoXfQg0BKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=l5Sar5Oe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51R8Hj7E011850;
	Thu, 27 Feb 2025 09:42:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/V74EYPtaU5xCiZ16Rppo5
	QuD5Pf1qTrW9r/Npe6Gt8=; b=l5Sar5Oe9LitF784lRX78F3AZhenSMUGRqZhKN
	LCyrKlLdwweF98jN34IKiqmn0hVR6fQTlvUhBaM00TE2i+wNcafvblngBMltyu33
	RPsFVBJY7obSA5BiGXdoP1GuqwnaF0CoBx4aVObetTrOAAGR1BAeJUD+uZ5397dr
	3g78qRSn7+WlvCvYvig2dJFUYF96k/bTXA86hnkoCqO7DV8K93EZcUY0TB1YipyS
	bEAD2rIb6F7FH2fdGRmsNwUahWsOko2GdY1o1PsfJhhS+aE6kgC1u3YHJLhXpOl7
	uaa8kUcM9RgIPVrHaAYNIuTpEKpx/N34DUPgMFxXRxdwgvCQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prkd4rc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 09:42:41 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51R9gejD010330
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 09:42:40 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 27 Feb 2025 01:42:37 -0800
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: Varadarajan Narayanan <quic_varada@quicinc.com>
Subject: [PATCH v1] arm64: dts: qcom: ipq5424: Enable MMC
Date: Thu, 27 Feb 2025 15:12:26 +0530
Message-ID: <20250227094226.2380930-1-quic_varada@quicinc.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-GUID: Vt9KXoTnQE-uzJcS-ppGekGMR_ha4Grn
X-Proofpoint-ORIG-GUID: Vt9KXoTnQE-uzJcS-ppGekGMR_ha4Grn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_04,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=779 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502270073

Enable MMC and relevant pinctrl entries.

Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
---
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
index b6e4bb3328b3..252687be9dc3 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
@@ -69,6 +69,14 @@ &qusb_phy_1 {
 	status = "okay";
 };
 
+&sdhc {
+	pinctrl-0 = <&sdc_default_state>;
+	pinctrl-names = "default";
+	supports-cqe;
+
+	status = "okay";
+};
+
 &sleep_clk {
 	clock-frequency = <32000>;
 };
-- 
2.34.1


