Return-Path: <linux-arm-msm+bounces-42347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5B89F31DD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 14:45:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4141F1884D3F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 13:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CD742066DE;
	Mon, 16 Dec 2024 13:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pj8luyPK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871A62063F3;
	Mon, 16 Dec 2024 13:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734356571; cv=none; b=iDSsRe1J/rLzD2x/xdZGzf5Nm221UBjh/GGZSe91ZdbLKJu2U4jQPucJ1uRtgqnSr7wk4qxnaksHlVlYC7VTc8kxw9xjZkdJ3/C1ioFqSp66YMlc+qCT8VkuURUzvYI4rOwl5Czoifp/tZkfliLe/z2+hdgskJlAhzElc9JrOls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734356571; c=relaxed/simple;
	bh=63arimq/oo2IlPmsEYAg8gJf+87rPBhCjMDw7DnSNGU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=PaRPsazpT29t9o3l5c6DPJiXy1F+aQnQiN+5RvIipAfQLrkHBM12DwnRrxF5Q1vD5bzFZ+meLG9mIaeh3ziSooMVBo+HEgjKi3tJb3BBtThiNHN1jFC+tnbtHP64iN9+EI2Pi9vNMM++MkUiq+mKXavgi3CfJo0xjRb+0MKP9TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pj8luyPK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BG86dH9008575;
	Mon, 16 Dec 2024 13:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0nZpHmpRyudFmzgYM94xkg6Kt/g8rgGoz/uBAW153tI=; b=pj8luyPK40OaaKo/
	ewOQkbjWu65i2r8owjGv125sidvZEmds6M6+Si6RzHFIyqo2Tz6uJvfldjZiiZYe
	wp9GCecK1Au4WkU6495AEz9TSka5ZLMQLUIR+xskjUOG5hDSRE6gP3u25YXuODD6
	eAnZOxgRWKtVnHblgs+mIXDzUtdRBb1ldF8XZ0YS53lTdJAdnwEJbkssyNUc52WP
	xiLULk2gFgJkr9i9AsOMfNc0gdb8HCgBrnpevRZXI8hm89CTKld197V2VvfBSJP6
	WPgO0nZ/2Dn+oXy6I9HyLaLWBbTTQzvhMPpsM4AW+cPz+TZNhDb7gh28C4d3+uzB
	0lQ5mw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jgdj0xf6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 13:42:37 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BGDgakL010688
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 13:42:36 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 16 Dec 2024 05:42:31 -0800
From: Lei Wei <quic_leiwei@quicinc.com>
Date: Mon, 16 Dec 2024 21:40:27 +0800
Subject: [PATCH net-next v3 5/5] MAINTAINERS: Add maintainer for Qualcomm
 IPQ9574 PCS driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241216-ipq_pcs_6-13_rc1-v3-5-3abefda0fc48@quicinc.com>
References: <20241216-ipq_pcs_6-13_rc1-v3-0-3abefda0fc48@quicinc.com>
In-Reply-To: <20241216-ipq_pcs_6-13_rc1-v3-0-3abefda0fc48@quicinc.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit
	<hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_suruchia@quicinc.com>,
        <quic_pavir@quicinc.com>, <quic_linchen@quicinc.com>,
        <quic_luoj@quicinc.com>, <quic_leiwei@quicinc.com>,
        <srinivas.kandagatla@linaro.org>, <bartosz.golaszewski@linaro.org>,
        <vsmuthu@qti.qualcomm.com>, <john@phrozen.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734356525; l=960;
 i=quic_leiwei@quicinc.com; s=20240829; h=from:subject:message-id;
 bh=63arimq/oo2IlPmsEYAg8gJf+87rPBhCjMDw7DnSNGU=;
 b=4cRd1KvooQmo2b2gTAWKi38ghifwy4O8ZwxXKm2esQAScWN2pwzeaZfqlm8E9lLFHIBBxZart
 8bIKb1S0nJiCIOzBfF3t8sNie9PCPV61HkxZLIp5A18JgRpYAz0Q+h1
X-Developer-Key: i=quic_leiwei@quicinc.com; a=ed25519;
 pk=uFXBHtxtDjtIrTKpDEZlMLSn1i/sonZepYO8yioKACM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6AWeZMzUbYKYMxfHZnDH-DsCNDNnTHvT
X-Proofpoint-ORIG-GUID: 6AWeZMzUbYKYMxfHZnDH-DsCNDNnTHvT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=824
 mlxscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412160116

Add maintainer for the Ethernet PCS driver supported for Qualcomm
IPQ9574 SoC.

Signed-off-by: Lei Wei <quic_leiwei@quicinc.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1e930c7a58b1..81e9277fb0c3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19351,6 +19351,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/regulator/vqmmc-ipq4019-regulator.yaml
 F:	drivers/regulator/vqmmc-ipq4019-regulator.c
 
+QUALCOMM IPQ9574 Ethernet PCS DRIVER
+M:	Lei Wei <quic_leiwei@quicinc.com>
+L:	netdev@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/net/pcs/qcom,ipq9574-pcs.yaml
+F:	drivers/net/pcs/pcs-qcom-ipq9574.c
+F:	include/dt-bindings/net/qcom,ipq9574-pcs.h
+F:	include/linux/pcs/pcs-qcom-ipq9574.h
+
 QUALCOMM NAND CONTROLLER DRIVER
 M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
 L:	linux-mtd@lists.infradead.org

-- 
2.34.1


