Return-Path: <linux-arm-msm+bounces-41392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B432C9EC1D1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 02:59:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF0701634AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 01:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 293491DF988;
	Wed, 11 Dec 2024 01:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UqQ93OPx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7162C1DF254;
	Wed, 11 Dec 2024 01:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733882365; cv=none; b=WlT5iXrci/Dwc76p6R75WIbHIK7tVQuAoNBtHqo+jqi/wMbnE21X+/Bc69t9dRD5PwyvJyzhNXzuCgpmqBEafJkJFnlLRmOif11vvs/4fvnPJ2sqv8IWZRoJk8R5pyiMKtzyyBNQrJLx3BjsBCB4PDMwsjVkU8j08lMSkcrRGz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733882365; c=relaxed/simple;
	bh=AKjYRcMWeksudFdm74PjE0YJmfDEHmNUYsP/z7eIXQI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Jz15B1HdFsr7al7il2TQvjgwjdPVW3PDsnkOaGzgLZoRhevEIcRC6MmSd4X2RKeDlCyEFgsmUONyLG54wPPcJW0c1ClGAmznR62XWnxo1iH4hbn/rsVDJnlabQ7xM/Y790BOfkOoqQpBdx7UZ5mev8MwqEvAh16WFjsIph1GGBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UqQ93OPx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BAEnAoq029986;
	Wed, 11 Dec 2024 01:59:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8el/D2aQmJAFrpkqw5bHxq8FObstuyoUH2NqOrA6j5g=; b=UqQ93OPxfYRqQllb
	rCfoGO6HqCFKULVFZiD7tT8AiMgAAzXlbCR+tzDEgtl3lsJAjJuR2YFbOjp1EWoM
	LyK3lRt3aND1Qfe/ofCowN3K9pk620w9qZQaHLPz4z55DYv+PJufHIqBbSXbAeSh
	m8n8SP29GSimwOwa7rSW+Rcy1/oFbnYPNo9uhGt8UoCcQ6rXhzqgad+itx1MTESm
	hBIWqOTevv6Gm43toyDO8otIfKys0yWIZjrcSKJX52Guyo4VNC9Hsh7TV8p8x447
	W7uavsZyaEJkmOndFfM0KN8FdQtrxC+rVCCNeL5mAhYg3QHygZg67/6d3Y2o1p/G
	jLEAVQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43eqr31mdv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 01:59:19 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BB1xIaP025723
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 01:59:18 GMT
Received: from songxue-gv.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 10 Dec 2024 17:59:14 -0800
From: Song Xue <quic_songxue@quicinc.com>
Date: Wed, 11 Dec 2024 09:57:58 +0800
Subject: [PATCH 2/2] arm64: dts: qcom: Enable secondary USB controller on
 QCS615 Ride
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241211-add_usb_host_mode_for_qcs615-v1-2-edce37204a85@quicinc.com>
References: <20241211-add_usb_host_mode_for_qcs615-v1-0-edce37204a85@quicinc.com>
In-Reply-To: <20241211-add_usb_host_mode_for_qcs615-v1-0-edce37204a85@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Krishna Kurapati
	<krishna.kurapati@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>
X-Mailer: b4 0.15-dev-88a27
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733882348; l=1398;
 i=quic_songxue@quicinc.com; s=20240911; h=from:subject:message-id;
 bh=kKe4s3XKwFQfTeZ9bwf41VARC1I80JIcgi/PxB6/egw=;
 b=L6VAd3xipHBcOw9v33MY0waJaEmfo4EBapeePNhrateByCj2mxR9d3YwNsS9OOAwuc9sl5ube
 dbFehwLsJONDI2Q7odCg/Dkd6aMGdWFaIrF43ytCD2PRnIBf2ea0A7V
X-Developer-Key: i=quic_songxue@quicinc.com; a=ed25519;
 pk=Z6tjs+BBbyg1kYqhBq0EfW2Pl/yZdOPXutG9TOVA1yc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: qB_ViVdEB65Gvvux-s--rFTnxgaat272
X-Proofpoint-GUID: qB_ViVdEB65Gvvux-s--rFTnxgaat272
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 mlxlogscore=713
 suspectscore=0 mlxscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412110014

From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Enable secondary USB controller on QCS615 Ride platform. The secondary
USB controller is made "host", as it is a Type-A port.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Co-developed-by: Song Xue <quic_songxue@quicinc.com>
Signed-off-by: Song Xue <quic_songxue@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index f41319ff47b983d771da52775fa78b4385c4e532..26ce0496d13ccbfea392c6d50d9edcab85fbc653 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -203,6 +203,15 @@ &gcc {
 		 <&sleep_clk>;
 };
 
+&pm8150_gpios {
+	usb2_en_state: usb2-en-state {
+		pins = "gpio10";
+		function = "normal";
+		output-high;
+		power-source = <0>;
+	};
+};
+
 &pon_pwrkey {
 	status = "okay";
 };
@@ -248,6 +257,25 @@ &usb_1_dwc3 {
 	dr_mode = "peripheral";
 };
 
+&usb_hsphy_2 {
+	vdd-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l12a>;
+	vdda-phy-dpdm-supply = <&vreg_l13a>;
+
+	status = "okay";
+};
+
+&usb_2 {
+	pinctrl-0 = <&usb2_en_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&usb_2_dwc3 {
+	dr_mode = "host";
+};
+
 &watchdog {
 	clocks = <&sleep_clk>;
 };

-- 
2.25.1


