Return-Path: <linux-arm-msm+bounces-57140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D13AAADC87
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 12:28:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F3D01C22394
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 10:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79901233D64;
	Wed,  7 May 2025 10:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Sbft8m3z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08F32144DB;
	Wed,  7 May 2025 10:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746613642; cv=none; b=MI5A+mhB6hedN4nFdo1b4jbV8MoPEgLkCEx3ygC0LRNPUAz9aOyJXN53Nk6I0pdCTysF10O0ILIpVxe2sZ12hwV8IpbtNpDWpTXm7hvZnLSZHz1RnyekfZx5dq3UUwpvwk9s9bzby2xGsLmMsyuIVp8HaojLbzUh0PB86uUHxsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746613642; c=relaxed/simple;
	bh=3/q3xuOtXrFpuM7Qn9xSnqLv3Ug5+jtrJuY3nQcHMEo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=O6IlT0gn0xY6kM56bBEgCg7kj1smE85Of2H4pcsOKPTxFU6uCEwP+T+NfmoHuXP5zvNeehe6/oMygdpjjSXOvQulqdDXbZvzSeCANsfDgT7pos5ao4yzpXnLnVx22hbjNwh8SkEATc3KZKJn0u3hJDJqxuzVX80YhuSRYpGNX0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Sbft8m3z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5471HhRB023100;
	Wed, 7 May 2025 10:27:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lbVLaKbwJE+/LiNi+OZPIsj0Ql5axFC2MNMdbnJWgY4=; b=Sbft8m3zP/3XZa1l
	VxmgbZvYHlrFyq9rJH/qEtP1h2Vh0GCH97Z5n2rx3hpPrpR2LtBE8MtWFwFJ4FLQ
	ejBGjXIq3lI22xWxz3r7/l2hsclH23/KpkmgM7aXFkNV+oeF+UhENIfMUlcJZN04
	6XcpzSZHswNAWGefNt7vIaesgFdnC+19b/OB5PtgCYSxe31TFiNE2/w/TdaZZnLr
	2/rGY79mtcNa0TFBz2rljUqXPQvmVBRg9RtsU4LEwyHIYQJi47f8UXVPFxH7Yi6v
	iObY4R7QIAD2+Y406p+qoFeZto/HkpfwyVjnzjqR3ZnKy6ZqxCETlTa/2UadgzwC
	k8jqnw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5uuweun-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 10:27:17 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 547ARGKI004240
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 May 2025 10:27:16 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 7 May 2025 03:27:09 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Wed, 7 May 2025 18:26:16 +0800
Subject: [PATCH v2 6/6] arm64: dts: qcom: qcs615-ride: enable remoteprocs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250507-add_qcs615_remoteproc_support-v2-6-52ac6cb43a39@quicinc.com>
References: <20250507-add_qcs615_remoteproc_support-v2-0-52ac6cb43a39@quicinc.com>
In-Reply-To: <20250507-add_qcs615_remoteproc_support-v2-0-52ac6cb43a39@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Lijuan Gao <quic_lijuang@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746613605; l=863;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=3/q3xuOtXrFpuM7Qn9xSnqLv3Ug5+jtrJuY3nQcHMEo=;
 b=9rY5JgQQNfG3L97FdubQwB+2Yw4q/pYCcQTE7IkJ4J3SXhVAr2tNxmy5QEvIkuX9h+qsPVtT1
 Z7JsrtjEBqNCA85ihM2o7fbNfbhjVn5DZKltGAVCnACrNbSGmPFVdTw
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=L9cdQ/T8 c=1 sm=1 tr=0 ts=681b3585 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=fTATCmRmxHxWpzn7ftMA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: NMsXvP6_joe0hqdDmXEa69R45pVh7x-Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA5NyBTYWx0ZWRfX+97ctPyRAGmd
 1tZTJ+Lr63jlZtdJnKpDOofjLak4NxjTRZdik9zrZr0XakReoaNtKDoY6bHYHhWZGloCW98y239
 DxRIDLnBUAwYdtCynx+x8B4sJeGCEjwJAccH1GZ18Egi9wvH+/HLXoigxM5ZH2Q/pMV0YADOt5r
 r2NUUpaDw0Ro4wWl9wbgbqRKRcQP14zT8B9/RlbMu30sDBWRbtBHeUYeNViuhTcJ+sqnPu2aikb
 YWUM/+BUdORQiWyndmPriECj3U2R9f3AO8Qs3mpM5H5yyt439kctRosZ8g+KywCFT1upCjIlWlA
 oMo+Unut+VeQ4atwqQWm19TlDpHB8t7BpHGTwakEJCiiZrdamK4WZMfdb28KX8PJD5JcAJKDjm9
 uzGAnfTFD/CQvOKuQggsbmEi4HtjEayHZhMgUaRwPqBtdIzJ2rkF5hfM22KKyVBJt5oeN7bW
X-Proofpoint-ORIG-GUID: NMsXvP6_joe0hqdDmXEa69R45pVh7x-Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_03,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=646 spamscore=0 suspectscore=0 impostorscore=0
 mlxscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070097

Enable all remoteproc nodes on the qcs615-ride board and point to the
appropriate firmware files to allow proper functioning of the remote
processors.

Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 2b5aa3c66867..a6652e4817d1 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -240,6 +240,18 @@ &qupv3_id_0 {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/qcs615/adsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/qcs615/cdsp.mbn";
+
+	status = "okay";
+};
+
 &rpmhcc {
 	clocks = <&xo_board_clk>;
 };

-- 
2.46.0


