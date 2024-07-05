Return-Path: <linux-arm-msm+bounces-25374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF12928856
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 13:58:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 26CF5B21DAE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 11:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7448A14A097;
	Fri,  5 Jul 2024 11:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JFkkYB4x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B39E146A96;
	Fri,  5 Jul 2024 11:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720180715; cv=none; b=rQjdY2vfX+CKZ1Oh9Juv2ofRJWwfOWzHWBpJIixr9nh3ml8TEiz+FFo/uAHqjVYAx1/VqLTYl/D0HIJWkgRv98zdIiKfhqwZvYMjhPYis8n9zmZvc5CKRCEQlv702SJzWC/70r1AGw7qMBaZy6D7l6WjWB5OmKxgC8iPKae2oHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720180715; c=relaxed/simple;
	bh=fWMVZ0gm+Bgakml5ZJ8UwTNTxYDzsvMS6AqPtXGEW5A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IeJCnMQe53M8AvJXJK6Cw3Cb1tDTi84mdDR+9xs+qAy5FYFBaMYLV9Htb4EDVMCMtPTuH6znLqRdeLXZ/ujZkWiQ/GnI/bWndMz3GyxtKu4Im39aiT4rucTp+r+1lBCD7dwA8IeaPy4sITrXxgRnVLW6CMT3ymyEYRVI3xC1g+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JFkkYB4x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4659l2I5013369;
	Fri, 5 Jul 2024 11:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bpC6HvErzFkRareH0SSb9B
	2p2WLpvDYa6doJZOtKovc=; b=JFkkYB4x6XIK39dl3jEXZHAUT8zf79jxd8Hx75
	K0dECbiBv+uezDjUqENw4EaURf6kmc3Jp1qqiarr4o7YcRyGpJ4fi74wXX6kBCby
	fQYrs1c3MqXisgO0Wf/C96fippNEmVfbELmdhXDJfIDDOu8x7tt7gUisKHFxEIwN
	C76hRsWF6yUVG9vXmlDqyCHLxngg5KjOXf9tmL/32VuwFqkZqGGRpMDS8M7FVnUd
	yZumKvcyJ+d3xz/mK7tWvgYJxW+CBjLXwjOLOTglXmSPmL8IkEe4Vsvq4uMe3T+J
	gZ3XYCETul5f3Rzw4BXzqBvqym1beDwC1wTjWwvk5y8Axhsw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 405dbe4fey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Jul 2024 11:58:29 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 465BwSJj023555
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 5 Jul 2024 11:58:28 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 5 Jul 2024 04:58:25 -0700
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Mukesh Ojha <quic_mojha@quicinc.com>
Subject: [PATCH] arm64: dts: qcom: sc7280: Enable download mode register write
Date: Fri, 5 Jul 2024 17:28:14 +0530
Message-ID: <20240705115814.1422995-1-quic_mojha@quicinc.com>
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
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: n1HJ2gaPbxmpfO-C5297CNmaHhGIKawH
X-Proofpoint-GUID: n1HJ2gaPbxmpfO-C5297CNmaHhGIKawH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-05_08,2024-07-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1011 suspectscore=0
 impostorscore=0 mlxlogscore=747 mlxscore=0 priorityscore=1501 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407050088

Enable download mode setting for sc7280 which can help collect
ramdump for this SoC.

Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index fc9ec367e3a5..e17c4c2401ac 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -710,6 +710,7 @@
 	firmware {
 		scm: scm {
 			compatible = "qcom,scm-sc7280", "qcom,scm";
+			qcom,dload-mode = <&tcsr 0x13000>;
 		};
 	};
 
-- 
2.7.4


