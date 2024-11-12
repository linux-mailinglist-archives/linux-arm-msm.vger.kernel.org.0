Return-Path: <linux-arm-msm+bounces-37576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FC79C51D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 10:23:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06ED5282298
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 09:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D7F20E334;
	Tue, 12 Nov 2024 09:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="agXmmMgH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F6320C01C;
	Tue, 12 Nov 2024 09:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731403351; cv=none; b=Bn/f3CasN9j2JGHeYcTRfc94OhKvoCPzEepL9X4ZkZs5Xz3J9Teebpb18+rNYDXHCJR1E8/rZUatxYZQ3lpXa9g1KiCvuewBoWXEBxDhi328dAySU3R0Bi3XswkWhlasd3rBPB8WVazW7Wh7hyMnaFRZWHDKUGR6iQLB0aK3G8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731403351; c=relaxed/simple;
	bh=HbPRoTK+5ecjOBd4kupRXj04+4MDj2bAMeEpxQghujs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=oIj26stSyjHlaiA6YoJurdUVYY+p9rApWb2oh+Gs+2OEpsHjBsXicjLV+b4B1k2TZrN65BGbkhxlxaYn10UIhy/BfKJd5gLp68mpjhaYnzrF3Q5upezKSDnC1rjLuHH/2xU2+QMsIvDstuCaxv+uS8jCVOmANrwP1yp8nAK6wQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=agXmmMgH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AC2fUlM016070;
	Tue, 12 Nov 2024 09:22:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WgIEGJU+IUFY2w92iwdfbA5+1qtuqc8lJu1StZlZoDE=; b=agXmmMgHzIPalpEE
	2p/5aOZrTclB6XR/o6wMjeP7BM5fKmowt8eSKS0Xz5jhijHEPJe8rpo+g8z7C/nZ
	rWT2lh29kPIoJmk5e8inUg2Wr8oJShAZcAcQE8RSCuGZZWYh3Y9tUOLLZFwh1aNs
	tYJMS83UkeJNBEkR+zOkdNWDsEGcfneuVHWJSHP9Z+RaCZf/1XnP1/kUlOQMJz8X
	iqu+xywou/ODXUsCP9+SIX3oga6CWmCS7M8LblRXChmsj2Q9qXfKjGYBWgeqL8v2
	JzCQdXhygc73zOPdq+vfJweC7zB81tXwb2nodTTSljkLvtHRD9pQKkYT8QvmHpqU
	S2fh6Q==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42syy26qta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 09:22:28 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AC9MRxI002714
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 09:22:27 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 12 Nov 2024 01:22:20 -0800
From: Tingguo Cheng <quic_tingguoc@quicinc.com>
Date: Tue, 12 Nov 2024 17:21:31 +0800
Subject: [PATCH v4 2/3] arm64: dts: qcom: qcs615-ride: Enable PMIC
 peripherals
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241112-adds-spmi-pmic-peripherals-for-qcs615-v4-2-f0e54d8b6516@quicinc.com>
References: <20241112-adds-spmi-pmic-peripherals-for-qcs615-v4-0-f0e54d8b6516@quicinc.com>
In-Reply-To: <20241112-adds-spmi-pmic-peripherals-for-qcs615-v4-0-f0e54d8b6516@quicinc.com>
To: <quic_fenglinw@quicinc.com>, <quic_tingweiz@quicinc.com>,
        <kernel@quicinc.com>, <quic_eberman@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Tingguo Cheng <quic_tingguoc@quicinc.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731403332; l=988;
 i=quic_tingguoc@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=HbPRoTK+5ecjOBd4kupRXj04+4MDj2bAMeEpxQghujs=;
 b=oXcBo042k9rAZiVQuqtxfYFSP/UnZ78lfa/1glut3Nznz3OrdMh76eZ09UsXg00yk17Ao+BHq
 1yEyTRwtVyJAdwQ3/ZALmzW14kF1yRW/RKVPSh6yavPNx3l/iCSTdAS
X-Developer-Key: i=quic_tingguoc@quicinc.com; a=ed25519;
 pk=PiFYQPN5GCP7O6SA43tuKfHAbl9DewSKOuQA/GiHQrI=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lh0T3uzeoc5emLecNWMRdpILNla1pxme
X-Proofpoint-ORIG-GUID: lh0T3uzeoc5emLecNWMRdpILNla1pxme
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=768 suspectscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411120076

Enable PMIC and PMIC peripherals for qcs615-ride board.

Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index ee6cab3924a6d71f29934a8debba3a832882abdd..c99790aea8f94c3af05fe9f2040fb3e3accd5717 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -6,6 +6,7 @@
 
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "qcs615.dtsi"
+#include "pm8150.dtsi"
 / {
 	model = "Qualcomm Technologies, Inc. QCS615 Ride";
 	compatible = "qcom,qcs615-ride", "qcom,qcs615";
@@ -210,6 +211,15 @@ &rpmhcc {
 	clocks = <&xo_board_clk>;
 };
 
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+	status = "okay";
+};
+
 &uart0 {
 	status = "okay";
 };

-- 
2.34.1


