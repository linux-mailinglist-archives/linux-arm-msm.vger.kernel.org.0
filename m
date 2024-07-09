Return-Path: <linux-arm-msm+bounces-25557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F57F92B09D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 08:51:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4845C1F2419F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 06:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AD5415219B;
	Tue,  9 Jul 2024 06:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PQipfchM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB611514C3;
	Tue,  9 Jul 2024 06:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720507830; cv=none; b=nFfuyiRZPCS7jU7Z+iDbvTM7krgbD5y2t+aQTvjTKA846JBzIpc+r/cq+QjiDXAas7WHWl7LDe8ePuVMoGTfwu16Yc3E/kxTDevp1l1wKGjudohaeYNRbSm9fzer5PMnMB2s74tO/4uy5sVSjUbOlulEw89y7Jm/Y+K2oLoLtR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720507830; c=relaxed/simple;
	bh=BC53NUr5S1tyon6u7PNyp0ncpVxZDaFWVQC6lOvIsPs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qTg48YSM0uUUhM7z13YmQcvxuOKWU71tTknaeZeS2ora7Gxniixfvv/sV9EzbqDxv1diDQfHJDn2FYypJa01+aJ9cw/LCyBR+UlHAmXIDa0LVSin/54AClN5agUASxZmoC6VtIax/2yxOWRSd60K21mXiVva0gtnOijwDCSO5U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PQipfchM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 468MxNuY003205;
	Tue, 9 Jul 2024 06:50:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8AXDN2cjC6HX8I8LZqU07wi/8NyC63TdGCzNBVTdp1s=; b=PQipfchMdlnON4E2
	BxkkXuw+5C7mBkOQA0z++hIIiDzAVuriW8AJHvnDDVwqj7w5mVVP/ea21jmrckNu
	mNNvhMOM1TtRQ99IfyMFik7ucjVrq4RTyAoU1mVODLoM4fWmqcaWRp23Fsr25yqj
	ZrsysHAhuQh2aeM+duuOxHDPOMQaalinPbxrCuZ7NSghJrNc0y4X8ddNbDWJ9lH8
	xGZ/5uOYE8o4i59mHATholrcnG73x66iSoCuHAjbW7bf7SvPjDo42+c/3oINU96u
	aV2HNRjYRr5V/etDpqyYsAVYhc3AAeLc/fG41UhuxF8lidT9rBZHI1at13pjF1ZV
	C7UAaQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406x515q2c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 06:50:25 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4696oPZq021625
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 06:50:25 GMT
Received: from hu-nainmeht-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 8 Jul 2024 23:50:21 -0700
From: Naina Mehta <quic_nainmeht@quicinc.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <konrad.dybcio@linaro.org>, <manivannan.sadhasivam@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_nainmeht@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 5/5] arm64: dts: qcom: sdx75-idp: enable MPSS remoteproc node
Date: Tue, 9 Jul 2024 12:19:24 +0530
Message-ID: <20240709064924.325478-6-quic_nainmeht@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240709064924.325478-1-quic_nainmeht@quicinc.com>
References: <20240709064924.325478-1-quic_nainmeht@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: aGpN8HRr2X-0rx4Qx7IvXXYCdAzn9YMs
X-Proofpoint-ORIG-GUID: aGpN8HRr2X-0rx4Qx7IvXXYCdAzn9YMs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-08_15,2024-07-08_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=962 mlxscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090044

Enable MPSS remoteproc node on sdx75-idp platform.

Signed-off-by: Naina Mehta <quic_nainmeht@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdx75-idp.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdx75-idp.dts b/arch/arm64/boot/dts/qcom/sdx75-idp.dts
index fde16308c7e2..f1bbe7ab01ab 100644
--- a/arch/arm64/boot/dts/qcom/sdx75-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sdx75-idp.dts
@@ -282,6 +282,12 @@ &qupv3_id_0 {
 	status = "okay";
 };
 
+&remoteproc_mpss {
+	firmware-name = "qcom/sdx75/modem.mbn",
+			"qcom/sdx75/modem_dtb.mbn";
+	status = "okay";
+};
+
 &sdhc {
 	cd-gpios = <&tlmm 103 GPIO_ACTIVE_LOW>;
 	vmmc-supply = <&reg_2v95_vdd>;
-- 
2.34.1


