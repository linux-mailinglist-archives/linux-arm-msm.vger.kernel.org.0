Return-Path: <linux-arm-msm+bounces-68809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3ACB22A61
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 16:27:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D2A03B1F90
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 14:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D1DE302CB4;
	Tue, 12 Aug 2025 14:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XqE1sexr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E8A2EA721;
	Tue, 12 Aug 2025 14:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755007934; cv=none; b=tXwEOP4ZbyVHtdn0CXKd3kSUpppt6ufIrl7Qo4VHGgvY5E0Q01JWpnl/appx7QuLmS7Yc9vML6qzASnl7j09Bup1c3gl5ILh8hHVFZkt2LLXy4UMWCpC4czYPD3QYJ2QC0NpiOCXFczMUftQiosutMKO40WKiuwhNM5nYkmgofs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755007934; c=relaxed/simple;
	bh=PJRh77BlqVsEpKRGUextThdX92CPAbJt12XhrYigNZc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=jubENxFZSnwfEHkTTKcDeCc7oO+n/sEJBPntD/d3Vsax5L8++EoQJqqKuuBI3WyZFUYyayMGHAyHhyQVDflP/8T7Tr7v1J1Ua5AATuK7eXCCkhelct3Dj8LwmLvAb0Ip8DOPt7N/UWgXmbS41TwaE6VsWt2sZ4CtT0u1tB6tobY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XqE1sexr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CAwi8E025631;
	Tue, 12 Aug 2025 14:11:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dMh9F/zW3ltk/+W9kfI6XSfIFxsE1lXA2GRM0pTwl34=; b=XqE1sexrZQEHCWtt
	TtdEAR//dSyvEl4PGQOxxxvK8QdVyl9n//axIEN4i2CLiXMHsu/dd5/w3LJAv+fm
	/b9XU3mj5gRSUehPmdu+IeUPOIuQ0IY2VfLXW6QDRfcNrYC/eOiRI6djphYcJap4
	wyJla+bvl9PmKXE3kh01jIyGtcIEp6n0usBqSP/pkjLY2vG6hA5yN2H6yE+7D02Q
	r6ZDt78UhysrN/uJaStQ86aAB1It4vRfvLCb3HBw3mW97SWSxkG7VyQwL/Ty2h6y
	XTJw66gJXfyYdAP1/8Eh8ZdP0tOFmS9CE5EbuWcy+IjX2u3mWDMnf79yn8NYqeYV
	TbHtsg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9srka7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 14:11:58 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57CEBvbn029825
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 14:11:57 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 12 Aug 2025 07:11:52 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Tue, 12 Aug 2025 22:10:38 +0800
Subject: [PATCH net-next v7 14/14] MAINTAINERS: Add maintainer for Qualcomm
 PPE driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250812-qcom_ipq_ppe-v7-14-789404bdbc9a@quicinc.com>
References: <20250812-qcom_ipq_ppe-v7-0-789404bdbc9a@quicinc.com>
In-Reply-To: <20250812-qcom_ipq_ppe-v7-0-789404bdbc9a@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755007841; l=898;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=PJRh77BlqVsEpKRGUextThdX92CPAbJt12XhrYigNZc=;
 b=KfHO01pLn3Yb/4AY90A9qSPRVYZGnXYwTQ+VXn+LrPflqznhIG3aL9ZyQoA5iZTO+yVmsS8le
 W8XLgjIEP17DOO2zeyiWexoSerNoy8yybF9KsUIvKnatlpKOHJfn2hT
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689b4bae cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=-_PooAnB-Ua2z9syxaEA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ifEkOtMyIBd0Sbtl52OoNEFz26zP2EOh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX/FUod6/49Bh+
 NknTj+COarb+8/JUHSokfDXveTag+4TmETaj/qTYMhXv3S07msJQi+DNXG+hfWOg93RClk6mXOK
 51Gzm+kI5Cqd1BgZJq19BIU6DRtZ+FoAVRAz23MSoQwdKcNkPJuiUki97d3z4CYir+BUr3XUmkw
 vLXHRto0Mwms9R8XZhe5nIkHtpDolBcAv5iZlf8o6DSPexzv3N3NjD9e8lwks4pGzLbaaqI55C7
 lcq318ZswPjtwOyRsyiEmdvkq1cgGJh/1J90XqHyt+JKwfe2rGo3Dyj+JKtQCCZaBiABAHMfi6M
 wu5N/QQaHE5l0SdLYiHmNmxz3Ocmxf9dJpOvDN0RJhrkeeUo7MirtFhugUTt9idx/S6fTxCtaSj
 YsGiubPG
X-Proofpoint-GUID: ifEkOtMyIBd0Sbtl52OoNEFz26zP2EOh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_07,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015

Add maintainer entry for PPE (Packet Process Engine) driver supported
for Qualcomm IPQ SoCs.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bd62ad58a47f..bcab0192f39b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20837,6 +20837,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/power/supply/qcom,pmi8998-charger.yaml
 F:	drivers/power/supply/qcom_smbx.c
 
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


