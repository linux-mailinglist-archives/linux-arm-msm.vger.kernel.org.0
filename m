Return-Path: <linux-arm-msm+bounces-47161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A71DA2C82F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 17:00:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F116165AC5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 16:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C6BB23FC70;
	Fri,  7 Feb 2025 15:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="byed9zhr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED18F1EB18D;
	Fri,  7 Feb 2025 15:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738943955; cv=none; b=aOauz6zYIHy5Qb6hy1ORs7VjVwb6tpW0sQHen1lwtfelGxWUQj6nmhWf7YkjB/wcY1Ol8wuZqzWxHhQFgigMRIMyARJewyyjmrWl5cZuJ10zcM9dkSn8oGWJ4z0dbC+j+o6ZD2UR2o6O07aH02DYmC+pHajqL6Ts+Vdrn8pfe7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738943955; c=relaxed/simple;
	bh=HpFqvIT+cfFtpH+ABRHpXGMzJbwYFkCkvBI+O9Njk7I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=NJvqUAUVPcF2SajMSILrLJkA7+L+kRBG/RLjd3NYrffNMmMYaSCDWBXJ8tBn2b5N0baNQ8/NUYFgYVKt9Osp83GK/72aAQDZ8SPg3WUY8mlzg3+hjbdRx71AKXAgKfyFtZYbsLYTiv2ygvuNjAJFp0XF0p4xTSTgvlo1qMgRBOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=byed9zhr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51770SKi016630;
	Fri, 7 Feb 2025 15:59:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	btt4RdEIIBJit2kN1ZGw58yZ2tYbo1VWqyU39sDoZ30=; b=byed9zhrpfHTTQ/X
	LfH+jwBFDCMq3fX98IR5AUybDQ14ORpb7PPMbTUnTwfWnbpWiZcjMSK5DOhIUxJ0
	uPmxtugUXK0XXmVDbS91rG2fjWhBRNTtjQQSWKJfp3RJoJnsoRs4qdOo3WB4ZtOc
	sRCauJVK257buDaWy638BZOx8OYGagO1sYyHn2MOjdLjGSMk/Q30k+O6fcx8EiXH
	RwaMNs1hdpzHXIZ5k0xJy9dMSNH85pZ/9R2R8zcQoHX59Pq4+sxFjFwXhiL8XiUl
	WNqAAsymidUEcvxj5+5Vx3k2boomnxo3yfwVQMh6dHvkUVkwvqAemr72mIb/ygmU
	B/ZsFA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nddh1bxx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Feb 2025 15:58:59 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 517FwxUw007384
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Feb 2025 15:58:59 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 7 Feb 2025 07:58:54 -0800
From: Lei Wei <quic_leiwei@quicinc.com>
Date: Fri, 7 Feb 2025 23:53:16 +0800
Subject: [PATCH net-next v5 5/5] MAINTAINERS: Add maintainer for Qualcomm
 IPQ9574 PCS driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250207-ipq_pcs_6-14_rc1-v5-5-be2ebec32921@quicinc.com>
References: <20250207-ipq_pcs_6-14_rc1-v5-0-be2ebec32921@quicinc.com>
In-Reply-To: <20250207-ipq_pcs_6-14_rc1-v5-0-be2ebec32921@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738943908; l=960;
 i=quic_leiwei@quicinc.com; s=20240829; h=from:subject:message-id;
 bh=HpFqvIT+cfFtpH+ABRHpXGMzJbwYFkCkvBI+O9Njk7I=;
 b=VSf5SDGe+EnzqQXbNcX0ZedQX9iLRui2ne1AO4awX8E7tUkqeORxShAC4dsbxOx3N9vUvaoaj
 cvqD6OL5v74D1zuNfctv9XjqfM+PNLpLq7JYEMjArAWFapZ/nPs3zzI
X-Developer-Key: i=quic_leiwei@quicinc.com; a=ed25519;
 pk=uFXBHtxtDjtIrTKpDEZlMLSn1i/sonZepYO8yioKACM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rHfawhoiJifVUufzwZsZwbfmp-crgsGk
X-Proofpoint-GUID: rHfawhoiJifVUufzwZsZwbfmp-crgsGk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_07,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=814 lowpriorityscore=0 impostorscore=0
 mlxscore=0 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502070121

Add maintainer for the Ethernet PCS driver supported for Qualcomm
IPQ9574 SoC.

Signed-off-by: Lei Wei <quic_leiwei@quicinc.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 896a307fa065..60c340a2de5e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19525,6 +19525,15 @@ S:	Maintained
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


