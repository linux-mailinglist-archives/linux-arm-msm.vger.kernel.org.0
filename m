Return-Path: <linux-arm-msm+bounces-35692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8408B9AE6BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 15:36:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12DCB1F27418
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 13:36:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B35C61FAF07;
	Thu, 24 Oct 2024 13:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="g7TZRW8B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0F21FAEE6;
	Thu, 24 Oct 2024 13:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729776725; cv=none; b=gXBak+MsmN1dYnirHDhwq1IxJnQ+w1WBHLx8d3xTafMB4obysclflWTxD36EF5XDcTG0HwG6blq+d1oGYTxTm0kfhTloIVCQW0zlNWNAIBSIxmzjwKlJ72aO8QSY7Kv6MsKlrLX7LPzDNrMUUDCDhoxOC0gRlDb1WcecVcNSYN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729776725; c=relaxed/simple;
	bh=QrmDZY0SDirSQ2QlceieUOUsvSfAmkruLasL2/14RRI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=a9Iw9qZmGobeK204JF4QxufPcjEG3o7BHC6W8MGK6ws1nsG0bwbRGScKmu76pdqqycMXBnN0KWQwgX7ROrncwxmO0mEV6+5kBNgAnZxVmANu5UYA18abn5Hlmy4F0IKYJkzP74ReMSxwjEfTiWojRReADW8sDS/RYP+hhAmjkOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=g7TZRW8B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49O91cfQ016165;
	Thu, 24 Oct 2024 13:32:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pbpiSh4Ks9Ramrrqx/D4PwL9AEXsEgEuNPf33gZ+uuo=; b=g7TZRW8BkYG7vKFC
	n/V3pu2TvrF5PSZAk8eovs0iHbt/2vI6n1OZ5TOQecjCZ4vWA5sfy/zFnlAc4708
	/cHZyYjHrv1uC8srqapQOrCNEBJ6V/v+ZWDgzUzKJDzZzqm/Ou3zLPgSiszkz4xj
	UbiVROxc2pzwG85w3iZfqJ/LCmKQqM4IxdKoTRn6xbxR53dXy7Cwz46hbhS5N7gx
	nBxzC5IPSUC1XMxXst9qeyerf5CQ9CgnKM6O7H1eP5yDn9r2lG9hdOXDYFdQV0cO
	kVCMVs86jAyRxYUaNPWw+Bm02mW07RoDZmwa3bvlXBNfj6HgNSUmGzoMfGoE6YjZ
	bHLHvQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3xnsg5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 13:32:00 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49ODW0WM010743
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 13:32:00 GMT
Received: from hu-imrashai-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 24 Oct 2024 06:31:55 -0700
From: Imran Shaik <quic_imrashai@quicinc.com>
Date: Thu, 24 Oct 2024 19:01:18 +0530
Subject: [PATCH v2 5/6] dt-bindings: clock: qcom: Add QCS8300 video clock
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241024-qcs8300-mm-patches-v2-5-76c905060d0a@quicinc.com>
References: <20241024-qcs8300-mm-patches-v2-0-76c905060d0a@quicinc.com>
In-Reply-To: <20241024-qcs8300-mm-patches-v2-0-76c905060d0a@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>
X-Mailer: b4 0.14.1
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: L3MfINXTqvBWlz1RfTh-Cdv-_y7Defl6
X-Proofpoint-ORIG-GUID: L3MfINXTqvBWlz1RfTh-Cdv-_y7Defl6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=981 malwarescore=0 priorityscore=1501 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410240110

The QCS8300 video clock controller is mostly identical to SA8775P, but
QCS8300 has minor difference. Hence, reuse the SA8775P videocc bindings
for QCS8300 platform.

Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
---
 Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml
index 928131bff4c1..07e5d811d816 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml
@@ -18,6 +18,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,qcs8300-videocc
       - qcom,sa8775p-videocc
 
   clocks:

-- 
2.25.1


