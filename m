Return-Path: <linux-arm-msm+bounces-65787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F5EB0B549
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 13:02:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B69671892544
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 11:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49F532343C7;
	Sun, 20 Jul 2025 10:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BtUQQlRQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8642220C48A;
	Sun, 20 Jul 2025 10:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753009123; cv=none; b=d/zTQlaLTw0g9vgAL7uUFkxIKLKwBi95JMTuRgfYuhk0JkM0+hisIUDNCVfp1tyg0goz+fBO9DHsoVLhGZ8B1zeM1w00i7BtHFettNQXxUOfAvr77M1/PrMukDT+LMUaf7tA52vr37YKSf7KDhCSj0rGIbqXdFxn2t4XLEJbb6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753009123; c=relaxed/simple;
	bh=KR5cSKHbse4WF9oIItyoo1P+gdcxR8Y20MnTAFL4sJk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=cMnyC/UrAN5msvPJ2XePzgpzUwUVN7GtnzrDm1BQ0X4umzHXr/eIOg8iCVmV3UwAoNUNbldWseL/ZtAZlzHK7GaS6OHP5nf8wpakxScjApSOi1uhfs+7PEFgWO/XgQzE0rLm8NUAsbR/DyaolueRnzn5vsEfh8Qt6bdu0KsZOr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BtUQQlRQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56KAunkI013853;
	Sun, 20 Jul 2025 10:58:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RgzVHIbX4TwTgW41kpg3Su1cYJM5g7jJy17SqjOejyQ=; b=BtUQQlRQVnaz7a2t
	Pru1YkBiaw7P/bqXgu+B4ihf1Z/gJUYu9/4fT/2v5U1GKqmhug9JZILpbvHlfzF/
	5Yz84ZKzo5OpVutwMGVtvLemShtAly3uj24swTrO2FMHGPppT0mkoGwVcK2vIl+y
	Ml6KL1jKZ664n6GmOWvgV3mvHlwreFBcF4mf8CoRn6LRQsiJJSZ/xIIufmaokaW2
	bRmzNQLqTilHOPsDmwwxovHaj5OXvhiyjA3ffQiQmnDpv7LFMqZOgb03391plMJf
	6b9verG2JTP8mlTFQo32jv1sNofs6LuhEajFGtaoJpSYmYJvqSqr/bqzTDwArkSL
	uBbo0A==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4804hmj11x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Jul 2025 10:58:31 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56KAwVA0019507
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Jul 2025 10:58:31 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Sun, 20 Jul 2025 03:58:26 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Sun, 20 Jul 2025 18:57:21 +0800
Subject: [PATCH net-next v6 14/14] MAINTAINERS: Add maintainer for Qualcomm
 PPE driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250720-qcom_ipq_ppe-v6-14-4ae91c203a5f@quicinc.com>
References: <20250720-qcom_ipq_ppe-v6-0-4ae91c203a5f@quicinc.com>
In-Reply-To: <20250720-qcom_ipq_ppe-v6-0-4ae91c203a5f@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753009037; l=880;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=KR5cSKHbse4WF9oIItyoo1P+gdcxR8Y20MnTAFL4sJk=;
 b=KWyHWRbki8fg/wAO/EHeajhsXMSXXgSO7M5viZAPSA0ELOr+04ZB2zUx7eHizegpRPReh0DWt
 8J5uJrMmYM6DQdX0+y2Ga+BkfKUW7Dy43ocfHubLuH3UUiNUzC45onI
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: yPDHhvdPDlX-JNegC0c794C7Po7bEbIt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDEwNSBTYWx0ZWRfXwR3kMVGiLxUi
 ZJcXsYyoSptPbrHeRKg/6NJPnaFh90OoFBr69rvk6KGKJ3BisL+ocP2KJvWEBvXBzq+25YnKQ9k
 1DUFYRR2etP0z1Ua9xadvMJidEybV934HKfOkVJbU4P4qPaVKk4hvhfWKs2uXSlMDxISjZxeAUD
 v4VQrnL5wRbP730RlqRuU042ihSiUugBmzf2JAOCiPQ05mej6if+M5fD03YtIKgVOjak9yjjLyK
 gKcqzPDf7td/7zVCYojatG/SlVgKRDZrDlHuy9gYgXT+VaKK7iJgDxr38ID5+YAZMO2X40/AdWJ
 9uxUkw3UjhFe1UbJVeLTgvojgenahmCQiZZyW3PtxcX/wtq23gDRfVZt7Vv67QIxjUSZBPKXRPg
 7wiTsFGb0/MEBvlOhzHtuV0rjLdNkXVa9M6TZJdf/epUG2VsoTORC2ONQkDM/sC+cgLYLmZv
X-Authority-Analysis: v=2.4 cv=Navm13D4 c=1 sm=1 tr=0 ts=687ccbd7 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=-_PooAnB-Ua2z9syxaEA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: yPDHhvdPDlX-JNegC0c794C7Po7bEbIt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=692 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 mlxscore=0 impostorscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507200105

Add maintainer entry for PPE (Packet Process Engine) driver supported
for Qualcomm IPQ SoCs.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1bc1698bc5ae..1caca0fa90c5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20577,6 +20577,14 @@ S:	Maintained
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


