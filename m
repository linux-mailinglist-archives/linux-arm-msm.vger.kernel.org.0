Return-Path: <linux-arm-msm+bounces-40279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B78829E3D67
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 15:54:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77017281589
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 14:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1FD620B81D;
	Wed,  4 Dec 2024 14:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kzvavOIH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A3A20ADF2;
	Wed,  4 Dec 2024 14:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733324022; cv=none; b=fbWPOjHMZV2+sqaTRu8cUCcjKMDvVx4RcMYW71H8oQZrUXhh+Zp3RiygZJ1Vhwsx8caJIBDoToanuI8zO2jbIwYgcggvI58e4ScE8rR/TVvm14K6lNHbddvCxOEOryoDyxQ19MP1TFxaeo50cx+Z35aY2L4TCWXvSlnak2w20XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733324022; c=relaxed/simple;
	bh=+s1Akq84IIyT8pCTQiEDo6Zt/nb8OW5mR9Yly7SUG9E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=nVHWO7C/hnl7H4I3Ia/kwH9YTBU2XNCqBv5HrHtnqxxJRcyKOtlKpm9D13egADTSLSoE4qpBZSLhquZTZWzVOU+GvgVPPrvBQeyL+n27DqnG9HHvl4jLAWJHARpSmmYD6WY5Ah9FLLg3kUZOFwDTeK7OvkfjswYX5yFvAQkxyIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kzvavOIH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B46kg8i023340;
	Wed, 4 Dec 2024 14:53:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	drtWFiFON4ugZEisuLBAAdelrnN5zG/TKJ/SOlfxmBU=; b=kzvavOIHoE4mzbHc
	DXfXYwBfJA3COVAMrVF7Wd4o8FqJdfmal1FzKY91z2Tl0Pd04PIIQSUSlyV2pdPi
	8RnbWCTGOxsKa0K+dzdlI10KDzsCZMQ/W7dPwwPWBmFmeODXWHJ3LHxyy4nIVtQd
	0d0kegbC5DP8rf4udn0rORwq2WTvfj+yPwMRX54sp6MyEEcl8z8kte7Nzpn46NyL
	MHgDddWp2na0phwCqy5zCHrMgy0/dT+RAUrEBz7iBab/VWKrig+9NmuMY3j5CmV4
	syp1Oem279wu0vWGNpa/Miq8o3Knh4d7NbV6a3t6zhiPfdzhK4ZBTyqpugxKIByq
	B+fXEw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43aj4298gj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 14:53:27 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B4ErQF0022114
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Dec 2024 14:53:26 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 4 Dec 2024 06:53:06 -0800
From: Lei Wei <quic_leiwei@quicinc.com>
Date: Wed, 4 Dec 2024 22:43:57 +0800
Subject: [PATCH net-next v2 5/5] MAINTAINERS: Add maintainer for Qualcomm
 IPQ9574 PCS driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241204-ipq_pcs_rc1-v2-5-26155f5364a1@quicinc.com>
References: <20241204-ipq_pcs_rc1-v2-0-26155f5364a1@quicinc.com>
In-Reply-To: <20241204-ipq_pcs_rc1-v2-0-26155f5364a1@quicinc.com>
To: "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Lunn
	<andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King
	<linux@armlinux.org.uk>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_kkumarcs@quicinc.com>,
        <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_luoj@quicinc.com>,
        <quic_leiwei@quicinc.com>, <srinivas.kandagatla@linaro.org>,
        <bartosz.golaszewski@linaro.org>, <vsmuthu@qti.qualcomm.com>,
        <john@phrozen.org>, <linux-arm-msm@vger.kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733323958; l=960;
 i=quic_leiwei@quicinc.com; s=20240829; h=from:subject:message-id;
 bh=+s1Akq84IIyT8pCTQiEDo6Zt/nb8OW5mR9Yly7SUG9E=;
 b=7YteXcZv/ctSOIsE3AdT1lqxh+/M/SxN8cIw2hfMO1otCAm3vzx/JmIYsyKecS0i7fBqq1kSx
 wHDb6e7i2UfCTH66c6Zs6oSWX+4IZID1sJMsagrmEn5pAMT+WmfBjVC
X-Developer-Key: i=quic_leiwei@quicinc.com; a=ed25519;
 pk=uFXBHtxtDjtIrTKpDEZlMLSn1i/sonZepYO8yioKACM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Z_nexa7FyoPQDzAXntihMYC8E41nBBV3
X-Proofpoint-ORIG-GUID: Z_nexa7FyoPQDzAXntihMYC8E41nBBV3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=828 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412040114

Add maintainer for the Ethernet PCS driver supported for Qualcomm
IPQ9574 SoC.

Signed-off-by: Lei Wei <quic_leiwei@quicinc.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c27f3190737f..c76348387326 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19164,6 +19164,15 @@ S:	Maintained
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


