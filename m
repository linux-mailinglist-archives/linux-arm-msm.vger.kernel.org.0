Return-Path: <linux-arm-msm+bounces-44282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A21A0511E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 03:52:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACE5A3AA327
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 02:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96EF419F111;
	Wed,  8 Jan 2025 02:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Jso9mnOP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2137019E98D;
	Wed,  8 Jan 2025 02:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736304692; cv=none; b=OTwVoJRtXai8RpDrPymi7F6W09s2R303VEX+woFffuZ729yspcNUhg8eA8RRvi7E5qXPhMiCkSP48slcj8w2PNGUrbA4EGpni5UCZwa2OUEjEDriaBtfWWeI8ianfe3znPF9/FrHxuA727+EG/ZoqdqMwBzX9c+pBxKBgN1EdqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736304692; c=relaxed/simple;
	bh=dRz4tLSSrBn2Lbcv6VRJyMcGSGe2LVxu3/mLOhMcywA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=PIQH3DiZWc8LsXM3G9VhPcrlTA1FCYz/36b2rqmh/XCpzKJ9wQtfyc52/BumATvVJnN9YGYyt7X24UBhA+6mTTg5zLILtBvuOAJ9LNwU+LK/WIBnwP7pX/GFsL7FF4CM2dT6bmQmDR1TYj0oU55pYNcAW/C8cPlPVG+FfJAvTTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Jso9mnOP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5082iUuH013245;
	Wed, 8 Jan 2025 02:51:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J3tT7WtvwQJg6fpE5DpygDrEhuYVNUuzwazfbv3jUIU=; b=Jso9mnOPwXqF0c/u
	v8Rh/tPzQD3v0zyUgKDTAVahlYihJJNaLmfbw/I6mmQ6i44ou8BFSL39B0neTTSa
	uPIM+ZmsGYVHDEuOQYGJIzq3qrQtqtN1zGng7LkC9hJNL7XIpW2dkEJn9cydrB7d
	9+kA2oloAZ4vlM+A+c2ImHulC7iXr8jRGJJkw1VaAPlTphz+UO7y4ctakevoC3F6
	vauldv32b02ogBISqfkAoIRmR6Npu3jx0rNXf9nh6k3itrgvNwdhNoS4XSTWr9Cv
	LxLcGOfpqjQuB+CZRdppmnwIYkNe125gLx/fAbIi6qhwpMOknCVtDHPoFkvWAfVC
	4MfqKQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441guk00gh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 02:51:15 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5082pDam017763
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 02:51:13 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 7 Jan 2025 18:51:07 -0800
From: Lei Wei <quic_leiwei@quicinc.com>
Date: Wed, 8 Jan 2025 10:50:28 +0800
Subject: [PATCH net-next v4 5/5] MAINTAINERS: Add maintainer for Qualcomm
 IPQ9574 PCS driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250108-ipq_pcs_net-next-v4-5-0de14cd2902b@quicinc.com>
References: <20250108-ipq_pcs_net-next-v4-0-0de14cd2902b@quicinc.com>
In-Reply-To: <20250108-ipq_pcs_net-next-v4-0-0de14cd2902b@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736304637; l=960;
 i=quic_leiwei@quicinc.com; s=20240829; h=from:subject:message-id;
 bh=dRz4tLSSrBn2Lbcv6VRJyMcGSGe2LVxu3/mLOhMcywA=;
 b=6mefC867a36s/axmKOmKZ533d+xTpif1gnMvwTU/+VkYlnnT4lSbKdLUMIl0meGuqANIol01W
 aK51ehxLtptDLhkent9LXcf6Az4ueK7DqECsS0gJSrOTz1xc1mj8wZ0
X-Developer-Key: i=quic_leiwei@quicinc.com; a=ed25519;
 pk=uFXBHtxtDjtIrTKpDEZlMLSn1i/sonZepYO8yioKACM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Mn54LVKYnYsguAUA-UOaoqsDV1zwy1H7
X-Proofpoint-GUID: Mn54LVKYnYsguAUA-UOaoqsDV1zwy1H7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 suspectscore=0 mlxscore=0 adultscore=0
 phishscore=0 mlxlogscore=819 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080020

Add maintainer for the Ethernet PCS driver supported for Qualcomm
IPQ9574 SoC.

Signed-off-by: Lei Wei <quic_leiwei@quicinc.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a685c551faf0..11325f6e3103 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19365,6 +19365,15 @@ S:	Maintained
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


