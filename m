Return-Path: <linux-arm-msm+bounces-62673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DE1AEA0CD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 16:37:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7300A7A83D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 14:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E2F52F0E59;
	Thu, 26 Jun 2025 14:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="g9A3ZDMb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CE32F0E53;
	Thu, 26 Jun 2025 14:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750948370; cv=none; b=fZ+OHJoB1j+zAyTR2dgEjWxqKHWckABf2SV7wuETgA1KFUIAFoWQa6e1tY0a2o0gLTpxz1050NPRTfaGIm6npurXHsy8kMbbFxBcw901uDdyUg65GGXC4UuZVlmRq4KDyzX2LWDLh6U37TvRzif3R2wvwelN4aifNk8EH+k+uUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750948370; c=relaxed/simple;
	bh=ONPWX20WA6qg25+gxiS1uLXoDdNaK1ZJN5gPDyCRy0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=iMbD5iAQDwSSYDbYAdCOIGhWdeFpRRVyyw46kJli/TNiT/SXXjuGPabDpn0B4IGi9lVHBcR7+XnCGfUdYCmx98hmzVuYq/CI+xKIzD1Tjk0gdlZ8T0PSkTo4ZD3SJKqQVg6dFaWwRzJdWZ8TpXQ/BsAUARTFWRnHA1S0Sp8EDlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=g9A3ZDMb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QA3nm7013542;
	Thu, 26 Jun 2025 14:32:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m4+dSjQjm1WnKHruCfwC33TXgveKpDKLK/3NL0lhC/E=; b=g9A3ZDMbG5qmXP/P
	4UDmBJtfhmZFlfrE1YIGRa12kqpc2MCMRK3HOwrWR0HkYlRKjw3FQ82bTrDKPk2Y
	sWiVixvSSwBBF61O5yCwYlqyt9n5wfbcO6eqoGMUY9idoSIuOLPEYQ4YLbKlmkw3
	17I8gWp0JKNfrlpIlFCy9ERtLzvX/ZcLM93Vq50Eh1EitGznBTDvgU9L6BKzAYd2
	fp9KoEEjoPcEpzpK36yyU7++hUvFTdAW7qQY1auDbbe78532iCCD2ye5DBDwURn2
	VmV+5FZmN6a5+pqHlkcKFBkScm2rTPhhUHTyqrLB1nJxYLLVO1JVJG5B4I7IBd7s
	DWIp8A==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgkm4d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 14:32:35 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55QEWYjS006413
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 14:32:34 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 26 Jun 2025 07:32:29 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Thu, 26 Jun 2025 22:31:13 +0800
Subject: [PATCH net-next v5 14/14] MAINTAINERS: Add maintainer for Qualcomm
 PPE driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250626-qcom_ipq_ppe-v5-14-95bdc6b8f6ff@quicinc.com>
References: <20250626-qcom_ipq_ppe-v5-0-95bdc6b8f6ff@quicinc.com>
In-Reply-To: <20250626-qcom_ipq_ppe-v5-0-95bdc6b8f6ff@quicinc.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal
	<quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>,
        "Simon
 Horman" <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Kees Cook
	<kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "Philipp
 Zabel" <p.zabel@pengutronix.de>
CC: <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_linchen@quicinc.com>,
        Luo Jie
	<quic_luoj@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750948277; l=880;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=ONPWX20WA6qg25+gxiS1uLXoDdNaK1ZJN5gPDyCRy0w=;
 b=PLjLC6sQFruHl8j/3TntePCRC7EQJQScnEWxZ+aCmcSaCtqC+g9PFt6J5GAm750eIW5dZrg33
 FBnwpywC+lfCxEKJF0TvieRquNiIRtDPCyUCbKsqmLb8MvzlA3Um+bq
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: fTR6SmECYJPksb_WsP5iDm2hT-ftFmmK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDEyMyBTYWx0ZWRfX8lcFdAsZM/cM
 X4s/zIQtsYMinr0AXVd1VPfdem6WeWgUN9ZHsRcqiVkY1MHBWtyRG0rzzgfs0NG1OmdKG3P9ihR
 sY1j9Hb4/118mplOKF5oUROBnoSC1Q9VufFHzxLMIphdCJj0p7z2dtrjPYg4A5hn9kMy2oGWvV0
 TfXnXQQME0rcZcwTA/FSPXP32wbFAw1e3/cQAMUATgtEsLSbJx2gczDVCi3e6CoxNYz6eYS6AE8
 nInLljof0X+hk9aPnR9ZvrJeCX/tOGOx7gi4bUW9s4ZVdkpCrNpmEBuZXWr3N0lgXWn9EpKa3JZ
 0XGmsFrvFqiWjx3np5OC36uM+JfIYFUbmtUWUcxTKLUflg1OHjGdSi2v+0cfMs6mxepMyOCBD5z
 2npzP4rkAWXg+286ETvly/jw8EAzBUrItInKNN2C6RiNORJQbZqQIoFA+SfCmf9cxwdoCQri
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685d5a03 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=-_PooAnB-Ua2z9syxaEA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: fTR6SmECYJPksb_WsP5iDm2hT-ftFmmK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=683 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260123

Add maintainer entry for PPE (Packet Process Engine) driver supported
for Qualcomm IPQ SoCs.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b9e58aa296e0..3a4b58352c28 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20523,6 +20523,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
 F:	drivers/mtd/nand/raw/qcom_nandc.c
 
+QUALCOMM PPE DRIVER
+M:	Luo Jie <quic_luoj@quicinc.com>
+L:	netdev@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
+F:	Documentation/networking/device_drivers/ethernet/qualcomm/ppe/ppe.rst
+F:	drivers/net/ethernet/qualcomm/ppe/
+
 QUALCOMM QSEECOM DRIVER
 M:	Maximilian Luz <luzmaximilian@gmail.com>
 L:	linux-arm-msm@vger.kernel.org

-- 
2.34.1


