Return-Path: <linux-arm-msm+bounces-38171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9409D09B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 07:46:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 59018B21394
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 06:45:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37CAF13CA95;
	Mon, 18 Nov 2024 06:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WUEp8mDB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABC81803A;
	Mon, 18 Nov 2024 06:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731912353; cv=none; b=HfpOqw/caW65Q9JZXewc9mhCPjtitfyjuZNDWU8GeVKncC1nzmdK/aELePpZc+3fcwYI6a/UdBT6HCL+jUAwyG2U4Y7VGaXfjaolvtFzV2OJorl2U/JfVWAuo9wgekh2kpSPHIbSxp8F4re1bG3J6qAUqycHtNSN7+ha1iv1+DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731912353; c=relaxed/simple;
	bh=awN9igyNGVeBjdGAA4jfwmBWzN9n/H2nAYHa+saIunQ=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=r74hQa1M3Tx3ilArqyzzTQhsvr+/D4FSFP8SWK7nNFKZXmqNsGIYVUFTSWn7y9tp5mHJ7ZR1/4VbsdTe+H1QfBunuMTlHujsRL2Y+xcJ7OzcKWvUISbZZ4kcPZYAP+/ZuseqadbF1GiGBLfzavAwWZgaRTGEX1TGmZFIj5ZM5HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WUEp8mDB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AI5Slv2022121;
	Mon, 18 Nov 2024 06:45:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=c0czzM6k85cS3smUG2XgN2
	NJPg3YEEhu0UdKfmZR6hk=; b=WUEp8mDB3Attdh+69oVVi0hg2so2ls92YPmBUf
	vQwn7V5zSbX+bT71x8DLoWtOAhtJIydkODhvT3+7TJxjGivkbRsng49i5rUZtBsP
	IQey2phO1fWoBRmZWvwBKB+dwMEN0NOY3yEFHKe6sU6TU1LP20ylxPguaZOubgMN
	0NxER4vMRi6ZpIDYGQM0voSwnTx/GFmSycPRFVU28JGoryoTuQCrkrlyVa/RCQHp
	nEMKZipgXvwsXG+EafokYm2C6SqFEGo2Zrvq5ZNvdeDkf/1W4xrLQHdlGektXd0Y
	zknUrF5rtuAuoVgXt+MS0SSswNhocn1DmgvBMxCVYFgdANSg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42xksqknmy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 06:45:43 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AI6jgMx009796
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 06:45:42 GMT
Received: from yijiyang-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 17 Nov 2024 22:45:39 -0800
From: Yijie Yang <quic_yijiyang@quicinc.com>
Subject: [PATCH v2 0/2] Enable ethernet on qcs615
Date: Mon, 18 Nov 2024 14:44:00 +0800
Message-ID: <20241118-dts_qcs615-v2-0-e62b924a3cbd@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADHiOmcC/62RzW7DIBCEX8XiXCpY/yqnvkcVRQTWZQ+2G6AoU
 ZR372IuuTYqt4H9ZhbNXUQMhFEcmrsImCnStrKAt0ZYb9YvlORYC1DQaT7SpXi62DjoXo6tUqg
 n14ObBAPfAWe67mafR9ZnE1Geg1mtLxaY/InpMukppi3c9tSsy3wNUFo9B2QtlVT9DOM8GNu59
 uPyQ5ZW+263pfj8HSp7ZXhOHGW0HhcjMzAILah5mJzVMPxTWvvi/3a4exV+1EIC8m2kVFuplfD
 7QunQrHhNsharNBOPX3BUONYOAgAA
X-Change-ID: 20241111-dts_qcs615-7300e18d52d8
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran
	<richardcochran@gmail.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        Yijie Yang
	<quic_yijiyang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731912338; l=1295;
 i=quic_yijiyang@quicinc.com; s=20240408; h=from:subject:message-id;
 bh=awN9igyNGVeBjdGAA4jfwmBWzN9n/H2nAYHa+saIunQ=;
 b=io7sEG4Bkv+LVaWF4YhF9uduMQQJivfUx+MCw9MSnu1GgyC/n8I9H4ZKvo4rHSn6KParghNec
 LVuy3CzNQNPDPFj5st79nYTasYOQeVB9G0zpgTrTw/ZsBRdIZPCdurK
X-Developer-Key: i=quic_yijiyang@quicinc.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -WaAwVABC32gWAThzwwQQQEzXcCJWaaT
X-Proofpoint-ORIG-GUID: -WaAwVABC32gWAThzwwQQQEzXcCJWaaT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=808 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411180055

Add dts nodes and EMAC driver data to enable ethernet interface on
qcs615-ride platforms.
The EMAC version currently in use on this platform is 2.3.1, and the EPHY
model is Micrel KSZ9031.

Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
This patch series depends on below patch series:
https://lore.kernel.org/all/20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com/
https://lore.kernel.org/all/20241118-schema-v1-1-11b7c1583c0c@quicinc.com/
https://lore.kernel.org/all/20241118-schema-v1-2-11b7c1583c0c@quicinc.com/

Changes in v2:
- Pad the address to 8 hex digits with leading zeros.
- Make clock names a vertical list.
- Refresh the dependencies and update the base-commit.
- Link to v1: https://lore.kernel.org/r/20241010-dts_qcs615-v1-0-05f27f6ac4d3@quicinc.com

---
Yijie Yang (2):
      arm64: dts: qcom: qcs615: add ethernet node
      arm64: dts: qcom: qcs615-ride: Enable ethernet node

 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 106 +++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs615.dtsi     |  32 ++++++++++
 2 files changed, 138 insertions(+)
---
base-commit: ec29543c01b3dbfcb9a2daa4e0cd33afb3c30c39
change-id: 20241111-dts_qcs615-7300e18d52d8

Best regards,
-- 
Yijie Yang <quic_yijiyang@quicinc.com>


