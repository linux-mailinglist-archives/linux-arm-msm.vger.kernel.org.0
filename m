Return-Path: <linux-arm-msm+bounces-39421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 281D99DB700
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 12:57:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E8DDB221B8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 11:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E3BC19ADBF;
	Thu, 28 Nov 2024 11:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WTFbol8o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B0919ADA2;
	Thu, 28 Nov 2024 11:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732794999; cv=none; b=snccwKISpggIy8GWmWJThyU1k9IlUdsZHca2fEbtsegWpFWb1+ooOpCvo+nLCFMe4/YVlrLbpIjLC1n/sQnOhxBE2VcoerrazujwY8DfCm/xDmvvcYfa4NbKsWEWsnstUB2dwyQv+HACbZ4dnXte/DJa5jJ1ppUyWnzHXQlrf/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732794999; c=relaxed/simple;
	bh=PUCL6IyC0pYB6tMfy6hltdUBwGeFHk3ER6ZVdQFYGHw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=p2Ill59RQYSbtOWOl9bp7WdcH897HknhENMC4iMRjSpyx2pm2VTEOxkEfUVOgOQUXG4jV9GhZkYW7A15ma81WZVdBycl904Cjeym9dLBG0vALEwkWgZnfJabbL763+rcP4uNypmNm42jJ231AUgusCImGY2vRlNy9pO/Uaea8a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WTFbol8o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AS8kAiI024919;
	Thu, 28 Nov 2024 11:56:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+tonBH7YMIajOVt2imWKV44Tein9ZfCBMGwQpwb3VDw=; b=WTFbol8oAcF8liWy
	peX8ej19ge8l+8UmPzLPvlct+g9IY6IFd8FFGcJdqMUUZ8gI4CL3Ak+NxM8BeyNB
	AGqVMq3RTRILB4/YIS0Ikrk/40XQdp5kWo7W0B6w6xz/K04OIzmC5xrNQJvw3V6z
	+mm7CYyagBzxxnL+zBYpsomFaR7jVmLI1W6BonDV2PTTEqztDRqLTKmrJEo6qbqi
	erK3/vFPa2aVGSSRBR09kGDPSHwZnyHZsVoUDLCKrdT522C+Hyu4Gkj4H1P7x9Y4
	Smke5sGNV8/eb4nBAwOyKqn7E6UmBrarNLeMVCmIVV486EQ8ipeXJXi1YfpeCcQx
	9Lk0uQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4366xwjh0v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 11:56:34 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ASBuX9o010885
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 11:56:33 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 28 Nov 2024 03:56:27 -0800
From: Tingguo Cheng <quic_tingguoc@quicinc.com>
Date: Thu, 28 Nov 2024 19:55:26 +0800
Subject: [PATCH v5 2/3] arm64: dts: qcom: qcs615-ride: Enable PMIC
 peripherals
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241128-adds-spmi-pmic-peripherals-for-qcs615-v5-2-ae673596b71c@quicinc.com>
References: <20241128-adds-spmi-pmic-peripherals-for-qcs615-v5-0-ae673596b71c@quicinc.com>
In-Reply-To: <20241128-adds-spmi-pmic-peripherals-for-qcs615-v5-0-ae673596b71c@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732794978; l=984;
 i=quic_tingguoc@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=PUCL6IyC0pYB6tMfy6hltdUBwGeFHk3ER6ZVdQFYGHw=;
 b=hU/LR1Aopp+205FQXW5lj+NS0uM+ralUeF2rBRdX7hD7fURA45WJxAdDBSg/4JVSdiwag8jPM
 BtpIJAngcxtAFtASfUfGRhrkW6vXRySziEt5O123iMFvwmrjfm9Z2BS
X-Developer-Key: i=quic_tingguoc@quicinc.com; a=ed25519;
 pk=PiFYQPN5GCP7O6SA43tuKfHAbl9DewSKOuQA/GiHQrI=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: fmCpkz9XXaG-ShHQoEX6LNUg_t_nYSZg
X-Proofpoint-GUID: fmCpkz9XXaG-ShHQoEX6LNUg_t_nYSZg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 mlxlogscore=865
 mlxscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2411280094

Enable PMIC and PMIC peripherals for qcs615-ride board.

Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index ee6cab3924a6d71f29934a8debba3a832882abdd..4e2f39c78546b4a2a95914fd4aa55d92b9670cb5 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -6,6 +6,7 @@
 
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "qcs615.dtsi"
+#include "pm8150.dtsi"
 / {
 	model = "Qualcomm Technologies, Inc. QCS615 Ride";
 	compatible = "qcom,qcs615-ride", "qcom,qcs615";
@@ -202,6 +203,16 @@ &gcc {
 		 <&sleep_clk>;
 };
 
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };

-- 
2.34.1


