Return-Path: <linux-arm-msm+bounces-47320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61119A2DE8F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 15:35:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B0E507A1EFB
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 14:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBFA71EB18D;
	Sun,  9 Feb 2025 14:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WksFCWSE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD0F1EB185;
	Sun,  9 Feb 2025 14:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739111488; cv=none; b=dx3w5/qVCAAglCaTy35LneSzxTvavOzApd82G7DgQ5ZQf/7AygZ8C63BcBAyO915vQqgJsd8Y2AtF4T2GJl/vfrctmQPcbGImBBhKtqTY5xg56wJ7l+Cj2BQ1XwhlY90pY86IaqC1yAz4QIVc8hmnm36A+ZV4aPSxgczy/eg1IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739111488; c=relaxed/simple;
	bh=AJF5DL3Pt5AO0mBUIrRPAreWbf8FJCsW/TNx0q0i4bI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=UjPKKeClDFenwCo8MUd5/O0lX4ERWmSyOMbPFdMzd7WG/bARzoxIrvjtyGbtdRn3oYUdWm2l/plKUGQ3tNrVoAFWo21VifaBNdyCpaHkw9D2JEEohTzBpX7QE8H5IRonRnnBez7p95yqDEnW5c8gjyHSyCpE9R+MkJqYemg/mic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WksFCWSE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5197mQVg006632;
	Sun, 9 Feb 2025 14:31:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HkVtmIZ7z/sdEG12eKr6XekXbRRZ0uSQPinlKqmirv0=; b=WksFCWSEnPptvANM
	3y8u2b4QKIbV+rfbQ+l7z8NwRI7smGW7PlsZkt8LbUpn2RYi93428YGsZ741PZrB
	xpqfsNBR7OQELmjT+q5dX5YYNalOJ/Dy1j1teJ9UTPGasc56DsK0rEl52jkR2eRw
	cA4+o74XvPL39UC2oAnYwQ6dpaQzUWKCc+fOlxYYitHv0anZPzAki2k1FbmdBT2y
	021F632dFhBSbGhWpdbQtBJfNu4R6+yu5CorXmtVXVJgPW5z5tlK+aIYG64vPjaw
	f7wRb8IH+Uo9fvSXfnBIUF26QSEgr6/3q1y7mjJ2LRucdy1oeMbAn/j/Jd2YvVzo
	OovkHg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0dxj3km-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Feb 2025 14:31:13 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 519EVCH4027994
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 9 Feb 2025 14:31:12 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 9 Feb 2025 06:31:07 -0800
From: Luo Jie <quic_luoj@quicinc.com>
Date: Sun, 9 Feb 2025 22:29:48 +0800
Subject: [PATCH net-next v3 14/14] MAINTAINERS: Add maintainer for Qualcomm
 PPE driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250209-qcom_ipq_ppe-v3-14-453ea18d3271@quicinc.com>
References: <20250209-qcom_ipq_ppe-v3-0-453ea18d3271@quicinc.com>
In-Reply-To: <20250209-qcom_ipq_ppe-v3-0-453ea18d3271@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739111388; l=880;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=AJF5DL3Pt5AO0mBUIrRPAreWbf8FJCsW/TNx0q0i4bI=;
 b=BE4rNkb37rmvXoMYO5+ofb7YHeLdRUbEeeWOpvbyq87upZv+/U2WfKtWIKUd253kMDLIJAuYP
 EmEc6C2fXB2C+P4V9HgfgG5aW9B7qiD4237kwIF64ib39Kf9iG3idnP
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IWbTVWoGjkTWL24kuPHCxAo50ZkDK6Mz
X-Proofpoint-ORIG-GUID: IWbTVWoGjkTWL24kuPHCxAo50ZkDK6Mz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-09_06,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 mlxscore=0 phishscore=0
 suspectscore=0 mlxlogscore=657 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502090129

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


