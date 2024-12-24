Return-Path: <linux-arm-msm+bounces-43170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DDA9FB8DB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 04:08:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB0A91884F7F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 03:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A20C949641;
	Tue, 24 Dec 2024 03:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EOC6Bu5J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BAC17996;
	Tue, 24 Dec 2024 03:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735009692; cv=none; b=pn0ZmAcwlLLSSEi4r7WnrrEWDsTESHR7t0izLDG4WEFUkBMsZKF4ybA70PXKUF4XALGgwaTuLLlu16mpvG7tKIX2YI99HwU6+PJVDu7TZympNktx4QM7g9OsQz94aIdCaIoLLRmJ3qsGWuY6yUnTqT8myV9kwCkDsuTx4OknkPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735009692; c=relaxed/simple;
	bh=V1zGyQmYhn1B3R0aP6noecmZ+tYMiaOEfL5LiuDtAuQ=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=U6rQfi4hAhgEzrBU7GFX3YABNJK3ARSLnXqdjxGIQu2ohVfykYfuHfqfiLBwryK+SYwrqBlGPRtzVM+8jK3tfn08AI7CN71xqNICOKwLyzKZZ04MV75hYsCuQDc7CKx4oufMJbC2eaXvPffbv9bKwc5JaA6ETf0rEsAHCrbph8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EOC6Bu5J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BNNTYBd013037;
	Tue, 24 Dec 2024 03:07:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wMZoz9EsR7ePQZtOUEnxMQ
	EqwmOfNV6YCxuM9WMR5ks=; b=EOC6Bu5JnzVPzTD6l85NCKthQbR4LysUp4WSwU
	VH41PRk8bHfzOAC23wBUVk1hXL5jnlvoccL1zDc+xuHQJhraDzurv49wArVWmgDA
	JAIGzYZ2Ym39MqugT4K57XVYGqqY06m5PdWkE+gIF0lpV1p7EDHsAgcg9eP4X7Hq
	gMkbHNJFAd8zyl61CbUVtD8GTJgw4A5YiVbPca+vw5/ZRtRg7xnIM6nsT7tgy1Sv
	EhdwboKVKOI4wNfrvC6XT+nWx9BdPyqrFsOM0PfayPSzwfI4jTnHE5QkfS889ykM
	7mQDkdJ2nt7mHy9p7ch4IPy0uh/4kUPGbRN8ikct7r3Kb+nA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43qhk60fj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 03:07:41 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BO37eIQ010620
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 03:07:40 GMT
Received: from yijiyang-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 23 Dec 2024 19:07:34 -0800
From: Yijie Yang <quic_yijiyang@quicinc.com>
Subject: [PATCH v2 0/3] Add standalone ethernet MAC entries for qcs615
Date: Tue, 24 Dec 2024 11:07:00 +0800
Message-ID: <20241224-schema-v2-0-000ea9044c49@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFUlamcC/1WOy26DMBBFfwV5XUd+xiar/EfVhZkMxQtMaxOUK
 uLfOzxSldld6Z575skK5oiFXaonyzjFEodEQb1VDLqQPpHHG2WmhDKSjhfosA/c1dI6VwslWsu
 o/JWxjY916P2DchMK8iaHBN2Cb9RezPh9J9G4tbcqDH0fx0uV8DHyTSY8W5a6WMYh/6wfTnIl9
 mfU65lJcsGN8WdnQ+Nrc7uSAGKCE80u0h3wB0DKxoG0XoOAA7BYJ/XfpP9ARaBW59BqY3UI7RG
 c5/kXcfy2Q1IBAAA=
X-Change-ID: 20241111-schema-7915779020f5
To: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David
 S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro
	<peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>
CC: <quic_yijiyang@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        <netdev@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735009653; l=995;
 i=quic_yijiyang@quicinc.com; s=20240408; h=from:subject:message-id;
 bh=V1zGyQmYhn1B3R0aP6noecmZ+tYMiaOEfL5LiuDtAuQ=;
 b=iEN0aQA+fbBlJbyinT4oTHXLhJpGSTXCeREt86FPbzelipctnYMpOhtUdAINO5U/fBryetUY1
 IDC4GW8y4bFCV8HY1h9dkx70wnuMcmo5Sp9m2IvA/YZAw0FRfVRBvj+
X-Developer-Key: i=quic_yijiyang@quicinc.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7Fp3y0zv5LQdjJWuF1eOXv_iFRKNJRYt
X-Proofpoint-GUID: 7Fp3y0zv5LQdjJWuF1eOXv_iFRKNJRYt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 adultscore=0 mlxlogscore=664 priorityscore=1501
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412240024

Add separate EMAC entries for qcs615 since its core version is 2.3.1,
compared to sm8150's 2.1.2.

Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
Changes in v2:
- Update the subject for the first patch.
- Link to v1: https://lore.kernel.org/r/20241118-schema-v1-0-11b7c1583c0c@quicinc.com

---
Yijie Yang (3):
      dt-bindings: net: qcom,ethqos: Drop fallback compatible for qcom,qcs615-ethqos
      dt-bindings: net: snps,dwmac: add description for qcs615
      net: stmmac: dwmac-qcom-ethqos: add support for EMAC on qcs615 platforms

 Documentation/devicetree/bindings/net/qcom,ethqos.yaml  |  5 +----
 Documentation/devicetree/bindings/net/snps,dwmac.yaml   |  2 ++
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 17 +++++++++++++++++
 3 files changed, 20 insertions(+), 4 deletions(-)
---
base-commit: 3664e6c4f4d07fa51834cd59d94b42b7f803e79b
change-id: 20241111-schema-7915779020f5

Best regards,
-- 
Yijie Yang <quic_yijiyang@quicinc.com>


