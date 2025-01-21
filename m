Return-Path: <linux-arm-msm+bounces-45651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AED5BA178DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 08:56:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0065C3A166B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 07:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 129931B4220;
	Tue, 21 Jan 2025 07:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ATT7p46b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EE61B3922;
	Tue, 21 Jan 2025 07:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737446174; cv=none; b=eqJ6k/owljUZqyOAdDIKTGnq8JRgQLkS5xpfV+Z0h3jlkULY8AVsKngr6xxvyDQdcqpf7U/Ll5sRTenOfiY9B0k6QB7FKrywYvbn4sp60vqGaeNWpFfP53BeqyjUrSCikIpJRqTjGqLwA+zG5tfeEpfUQOPERxfJcSSKK7HpJWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737446174; c=relaxed/simple;
	bh=K52foD8ZKSNBEteF20ZbKzww8kLNTvLjACSr0XSUutE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=q6MSkJ8fg1dlW3+VEyLY1qa7objzFe/p/WpWeMwb7dlpM4/DWoXKzW8jJlaD9+ak7q+7ALsLbJMt0+PYY2sq6Infz2Jtwhw2Isw9IscFQkE4XKg43ZcpsaTuhvwDkr6Iq7VqWnxLOKYWIbKc/YbUNcMn5wBPQdelyOLFZby6kGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ATT7p46b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50L4gufD025163;
	Tue, 21 Jan 2025 07:55:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L3vMMHxUNrPj1M0U05TPvZCtPp3piwaRKsCsLbd47dw=; b=ATT7p46b6j4ZWXv8
	svIBOOEUS7ZnQ1iD+nIR83Hf8LL55KsQ1K7hIK9+vPc61YLx09TYTPjwnr4o43Oj
	unpUwm/I59ofAdb2tBxhoA6t0u0FwvJMnMGSeYFlw0rf52bKYk9fKVibsB5DM8nn
	6lIRhxpWh0KcNa85o9ndqjgyMC2cruEL7VopgteMnHa90FUeGbTnn2TjrQvQaRyy
	XpCYJX77bD6NORjbSNSQd9DWi9AAisN7jijh3kfmDwEHFGmpjolXWWygJmmy0UJ6
	5qYajKRQGnrGNqteCzVnG2/pt3xW88+ewh/4w5AkscYe+eqVXp8rgZ9uFRd/33qT
	bCXvmg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44a4t30dxw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 07:55:54 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50L7trjb014818
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 07:55:53 GMT
Received: from yijiyang-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 20 Jan 2025 23:55:48 -0800
From: Yijie Yang <quic_yijiyang@quicinc.com>
Date: Tue, 21 Jan 2025 15:54:53 +0800
Subject: [PATCH v3 1/4] dt-bindings: net: ethernet-controller: Correct the
 definition of phy-mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250121-dts_qcs615-v3-1-fa4496950d8a@quicinc.com>
References: <20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com>
In-Reply-To: <20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Yijie Yang
	<quic_yijiyang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737446142; l=1025;
 i=quic_yijiyang@quicinc.com; s=20240408; h=from:subject:message-id;
 bh=K52foD8ZKSNBEteF20ZbKzww8kLNTvLjACSr0XSUutE=;
 b=wNc3fkiR5pXFQ7Rplbxsxn17PwRWqOrVYg4NCvr9qpQnw9edC1DroW/PA8n1Jd7J1GHDqZf+t
 f1l1aVaV2cDBz5AG5GbKHRAJrtshNtpykIUH+VWMlc46iBqtoZEtdeq
X-Developer-Key: i=quic_yijiyang@quicinc.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LYjBZENH2x8EcNGJrpw9ab81HOvLdx3-
X-Proofpoint-ORIG-GUID: LYjBZENH2x8EcNGJrpw9ab81HOvLdx3-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_04,2025-01-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 mlxlogscore=713 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501210064

Correct the definition of 'phy-mode' to reflect that RX and TX delays are
added by the board, not the MAC, to prevent confusion and ensure accurate
documentation.

Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
 Documentation/devicetree/bindings/net/ethernet-controller.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
index 45819b2358002bc75e876eddb4b2ca18017c04bd..d56f1a2e79c4656762c7397dc96408bdde19c52b 100644
--- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
@@ -74,7 +74,7 @@ properties:
       - rev-rmii
       - moca
 
-      # RX and TX delays are added by the MAC when required
+      # RX and TX delays are added by the board when required
       - rgmii
 
       # RGMII with internal RX and TX delays provided by the PHY,

-- 
2.34.1


