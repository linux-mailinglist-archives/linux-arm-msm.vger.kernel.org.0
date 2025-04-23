Return-Path: <linux-arm-msm+bounces-55098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B0DA98543
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 11:19:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA0474415C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 09:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C8172673BB;
	Wed, 23 Apr 2025 09:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Nf/VvFSG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0447D266EE8;
	Wed, 23 Apr 2025 09:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745399910; cv=none; b=sXaLtObc3kMH8AynahTf/swX6AKw84Kde/wvgVRAZsT1EVnNf6KoM2qcwmeTMPf7pWCiHxDaDumQUAk3cuofEubAXgAzB39H1u/IrKbghzYSw9Mwe5TA1eCXhEm3YSjW9yTZK/HJxnn16x2DJX9Imw0fOE2+4Bf0ckt1qMds9jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745399910; c=relaxed/simple;
	bh=75PfEjxIScHC0TUs9Q3X0fjKZOWhGzAErbm4INPTqMc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=agJw8sxgu1vYAiaX2fONxef6rOZ+DslKnaT3TtuTZJEus0X2lNYeZk/e/xJCs8E3yAtxsbDNfYS1sPbVqAu9C6W3ccAFhwmod4tJNCCMkfycfLSbzAoANhagmnVDZkUksMCcHhW0uM50OTJRK2bYsY/V+zrGttW+sVYzZfg3RZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Nf/VvFSG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0iJHo003811;
	Wed, 23 Apr 2025 09:18:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E4Ivh1GRlpo3KbZKu3GCKwgDqXGdBOa9DVDOUw96hn4=; b=Nf/VvFSGigDRMXr7
	mmm9AbI1M1EM0nbXwyinIm8JLBi8cCCr5WByUN3u59jcfXK9SnUBUMhHILJCEbLK
	zQoplXB0nSKVhGqQIOo3kwV48V+m7edjEahlAy0CEiNgqCaoOuRN3atogJ8xDgnz
	xmNEX0cdGLiPzK2A5dRi52zb2q51onw78+ME0zEZhY+qxVRrDvyAwGJsa/F1oBG8
	OwlT6b9C9KkE+nkidfOcYsNkQjCwutpIQs2SUyOSBUsNlvofmJOkdGSwWmQp+I4y
	a7X1CXuVtx/sesdmP2iSZMcyGeUeKYjAZfDAbnNX2sYU7b4k1zNI7o/cipztAMlx
	91LDgA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy1jr6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 09:18:25 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53N9IOvW025515
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 09:18:24 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 23 Apr 2025 02:18:18 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Wed, 23 Apr 2025 17:17:42 +0800
Subject: [PATCH 6/6] arm64: dts: qcom: qcs615-ride: enable remoteprocs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250423-add_qcs615_remoteproc_support-v1-6-a94fe8799f14@quicinc.com>
References: <20250423-add_qcs615_remoteproc_support-v1-0-a94fe8799f14@quicinc.com>
In-Reply-To: <20250423-add_qcs615_remoteproc_support-v1-0-a94fe8799f14@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745399877; l=855;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=75PfEjxIScHC0TUs9Q3X0fjKZOWhGzAErbm4INPTqMc=;
 b=uHcc+cyxlJ4Jyo2vDYxmdBlg4KGZfhaxhZlF9sC8AGaqFbaxgnZ+4l3TaC+LiXjsN/1MaOPQa
 Ap3qWQImspWCd6PnlP4t0fPbLMk0WfnUHMFvtX/2wchD5k8NCGi0EEw
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA2MyBTYWx0ZWRfX153zP1+jE3um gAhyzcwNpL2XL2YvKFtReP7bcaqOUOdCnRWN7Tn+UEDJ+2j5jCE8NpSU3pqoGb7KP8p4H1SRIop +q+I2hBoSVHC2dTWChEOiZWxT/2t63GSgJ47+BMz0AC2bYtiNoyWJTjFJFu8AMXgoSOCVGcGQwu
 e3vyq4eAZEotWM00wFLzYKo48mkUwQLeOaNFPRmI/71Z3Svl/ELi9nztV+IevoVynDJsxJHw9bu y+aHR/zKdDkJ8QutRghX3urcWC4fjEoUTXIUxCE/GjDd2Uppo6Cs4XR2XbxjYGU+tLO5lq+zYmc UAaNJrUvALVwGzEy/b1PK9tEeCURgdzsl4s9Ww2ZmSF4Gl2vj4rceG7rxEEGuaBOWMfjbF6IHMr
 T6iOAeyWKTSOaLAY0QwnI5OtDPmh4/XZ4xkWAHM0dSw14I9na3dcDfLxRMBGCcmMUR4nqGab
X-Proofpoint-GUID: boU0j5uLfmhVmml9cnAMFxina56S5qeC
X-Proofpoint-ORIG-GUID: boU0j5uLfmhVmml9cnAMFxina56S5qeC
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=6808b061 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=fTATCmRmxHxWpzn7ftMA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_06,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=650 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230063

Enable all remoteproc nodes on the qcs615-ride board and point to the
appropriate firmware files to allow proper functioning of the remote
processors.

Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 2b5aa3c66867..b0db2c3ad409 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -240,6 +240,16 @@ &qupv3_id_0 {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/qcs615/adsp.mbn";
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/qcs615/cdsp.mbn";
+	status = "okay";
+};
+
 &rpmhcc {
 	clocks = <&xo_board_clk>;
 };

-- 
2.46.0


