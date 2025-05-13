Return-Path: <linux-arm-msm+bounces-57688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2034CAB50D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 12:04:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3421718857D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 10:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 755F5253925;
	Tue, 13 May 2025 10:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gSibRF26"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE22E2522AC;
	Tue, 13 May 2025 10:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747130410; cv=none; b=uld7/yUHBiEP3obqpvZqw5ukGLPpYIwfPFKQFBu+GSY1dHWIT3fMGpT6VpMY2RO5+/2/cYzbfKy+TqPq6kBM0dcgJOZL9XovQM5q36Y/waxxIg1Td9Qgf4OkAwfEyXJmlrEYiy/sjBU2SU2Vs2pM9VGJ//4UKNLAqOGw24MCtGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747130410; c=relaxed/simple;
	bh=AJF5DL3Pt5AO0mBUIrRPAreWbf8FJCsW/TNx0q0i4bI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=UfEIBfWmTFK7VI8zDawwHOMSjPo2p9qVUdN9q6qp04JYkTGIMoZk90+SdULBpXIVsz42S1g/jWbvNhnxC1qttjxRtAY4CAfZ7Z5g/5OkjlzIXfUJwohOm//PRmDwq3relDAA2EJn0TdEkNqYeadZd/mMGzOen+SRp/OoB5cW2wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gSibRF26; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54D6W0Yx023765;
	Tue, 13 May 2025 09:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HkVtmIZ7z/sdEG12eKr6XekXbRRZ0uSQPinlKqmirv0=; b=gSibRF269Z2jU1WB
	4hftfLFhmly3mH51RwELcqwMS9k5dSqh4juUA3O926LrZ7AIU+G0lLxy8z2UmSux
	X9rDHJK87ZmnMUByvVWmp2Lch6PKB3EOAQuNlplIuaCOH+VUTdL8t29myGQgfKUv
	+iP5dSsL/qQEddcoS2gy6uvEzpACrvHbfnreb+Zrz/cIYDcjgqx1H5awia5gnrGB
	34mareFAhIA4NXulaSmDS6yFQkLWPAQ0ZisamJFuijaOc4Bjc7+wSNISy1/L/akk
	QlNyfFks9SQCDHNbYRqz26XyYpxH/aCEvNuFX95icGy8j+Mvpi5yTrOaHofHnNUV
	iAKWzw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46kdsp3gjc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 09:59:56 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54D9xtRk005027
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 09:59:55 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 13 May 2025 02:59:49 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Tue, 13 May 2025 17:58:34 +0800
Subject: [PATCH net-next v4 14/14] MAINTAINERS: Add maintainer for Qualcomm
 PPE driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250513-qcom_ipq_ppe-v4-14-4fbe40cbbb71@quicinc.com>
References: <20250513-qcom_ipq_ppe-v4-0-4fbe40cbbb71@quicinc.com>
In-Reply-To: <20250513-qcom_ipq_ppe-v4-0-4fbe40cbbb71@quicinc.com>
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
        <srinivas.kandagatla@linaro.org>, <bartosz.golaszewski@linaro.org>,
        <john@phrozen.org>, Luo Jie <quic_luoj@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747130311; l=880;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=AJF5DL3Pt5AO0mBUIrRPAreWbf8FJCsW/TNx0q0i4bI=;
 b=Uvsb5TY99W4dS757PWHK/7KdqU97PSzVnlBvKNygAqQyNcY6M72ntVfdllzM3LUmcOOemvKij
 H+pYIbQvRD2ACuv1FRd7afd+tAfkL/jO4q3ptXyeYqUGAnddxXGnTig
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VoRkG00_7tTZT3bthaLPoKQz7m-3N92E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDA5NCBTYWx0ZWRfXyYsy4uDMWCzV
 KBOgN+rSnHL0za7kEphXAqeDu3XOf1YXuE0B9OWVjm3/pPqPss8OXD1hIrrMRvHGUAOj2rHzWls
 yuBRB+ZKFwHpO8eaTSsV/GwXSGerMXjP8DmAijnn3mac15Np1Uk4Wbpqh3hfkmu54uXEpTzHdem
 CCrdz9CU51I0fESQHtubrcX9ehsWwt+X2xXBnAqUgkrrqdByDsnHE/8eNdO/cBWBjk0XTQTacA3
 3cs2ernB3pCGeMzo9cFmx+jkoXV4RTfWY//OQ2FInQZw6NwLIueQzKZRWdeeJPJyRnX8/yoWpId
 Tg697l8xxGOMctnICnsApQb9ny62TB4QdAR3km1BAB51ketVP8ScclrrRo0Z/2s5atX3KfLuIr+
 D/GRUOGrtaeZfknTKQsWHREzoQi/XkQrg1u/LHZPakdqFGRiuYSMELoKphksr51VyvRn0ab6
X-Authority-Analysis: v=2.4 cv=TrfmhCXh c=1 sm=1 tr=0 ts=6823181c cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=0j1aX1m3PaPPFVcKZKQA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: VoRkG00_7tTZT3bthaLPoKQz7m-3N92E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0 mlxlogscore=686
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505130094

Add maintainer entry for PPE (Packet Process Engine) driver
supported for Qualcomm IPQ SoCs.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 873aa2cce4d7..57c00f9d7753 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19576,6 +19576,14 @@ S:	Maintained
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


