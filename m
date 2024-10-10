Return-Path: <linux-arm-msm+bounces-33761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D481A997ADC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 04:58:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79EB9286D09
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 02:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3DCA194C6A;
	Thu, 10 Oct 2024 02:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bPXDY6W2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBAC192D89;
	Thu, 10 Oct 2024 02:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728529074; cv=none; b=O/pFJDT5fJyfzZPVuPga7mjlNhwBUZ1f9QRysr9/zAsa9E8HwTDPIxs1//rJajU2/ddVecy2IzWGBAYmJ8xAZ3W+3AFoTHakJJcgjqpOsvlNfeWKRlcJAjSHMnvqI8/JDzwMRcN6Csvec5Sa6U20nJ+qEKwMELxtgpTOfNJvqdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728529074; c=relaxed/simple;
	bh=t9zj5alpD8ea8qN9fkeRucITHyNbTGZJwLWk/hXas18=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=jVAi9FnIbAO5IHMmBdeESut+hdBGwvknTBfb+ZHPBNnsexX4LLiF31PGEwgHr6Ura5MC0VsDKt2zoR20md/NjEIhGkdh3MjtX6tVyLmafXqTqpUa+6f80kLVwZKu4HUp8TaL2Uo8wtzBWupILXKU44v3p3410SFE8snlR+HYfPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bPXDY6W2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49A1bJsE023697;
	Thu, 10 Oct 2024 02:57:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FLqx9Ys95mscwmaQauTO/EDTCu5FygrwxUeIvNJKzAQ=; b=bPXDY6W2db+e5tct
	ci1EdCtegnRueA0TYsrZmakdQDqRadz0Iuvv4uQoNXRX5j994OnT2Q5n5W+XCoK4
	ExdA00gcRfqbYajObLgpb0d/yL/HGMDkQLrQINKbWN6BpKEbfO9xzxBy0l5vmg8m
	vZp61djpX9PykrVcdJ5cw/wKqnMsssmaFLHPOCYmYWhucTmW1hRSV33UelRQeCwb
	GP87kUpqYyZ2TBDUl+xuCmb6rnx5sGNM26NrC/1aVg7NZg5KRwXjUN1o42naIHf6
	zyxY66dju5+IzMgkuRVhAOJWh4cQuSalEA2N6UoOKtEWps3AZWSxQ5lj2dnS3WsX
	0fYCwg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424ndyg18d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 02:57:49 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49A2vaO9015367
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 02:57:36 GMT
Received: from yijiyang-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 9 Oct 2024 19:57:32 -0700
From: Yijie Yang <quic_yijiyang@quicinc.com>
Date: Thu, 10 Oct 2024 10:57:15 +0800
Subject: [PATCH 1/5] dt-bindings: arm: qcom: add qcs8300-ride Rev 2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241010-dts_qcs8300-v1-1-bf5acf05830b@quicinc.com>
References: <20241010-dts_qcs8300-v1-0-bf5acf05830b@quicinc.com>
In-Reply-To: <20241010-dts_qcs8300-v1-0-bf5acf05830b@quicinc.com>
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
        <quic_tingweiz@quicinc.com>, <quic_aiquny@quicinc.com>,
        Yijie Yang
	<quic_yijiyang@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728529046; l=697;
 i=quic_yijiyang@quicinc.com; s=20240408; h=from:subject:message-id;
 bh=t9zj5alpD8ea8qN9fkeRucITHyNbTGZJwLWk/hXas18=;
 b=DZl9Q4w70A5LgZdXNanp0socfZ7zvbWjg2RVRFZO/xgeSJV2AwHnQE6VsdCpVvkxNGlTC7maB
 YrYQSswG55XDcNXi1MYjdEvPPOhEgIQ7v8OrVRE9BgCwgq/mSCayAUX
X-Developer-Key: i=quic_yijiyang@quicinc.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8Qh9XbbH5FGgdsBq4q3dxj5sBBQ4JXeo
X-Proofpoint-ORIG-GUID: 8Qh9XbbH5FGgdsBq4q3dxj5sBBQ4JXeo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=864 spamscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410100018

Document the compatible for revision 2 of the qcs8300-ride board.

Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index b40c3d7b63fe..056b27b5492b 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -899,6 +899,7 @@ properties:
       - items:
           - enum:
               - qcom,qcs8300-ride
+              - qcom,qcs8300-ride-r2
           - const: qcom,qcs8300
 
       - items:

-- 
2.34.1


