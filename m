Return-Path: <linux-arm-msm+bounces-69585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED815B2A508
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 15:29:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FD7B3A6921
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 13:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF8D5322DB7;
	Mon, 18 Aug 2025 13:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TZ/7ahQ/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A8F27B337;
	Mon, 18 Aug 2025 13:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755522978; cv=none; b=m3T2dRu3L1rOjhqlu0ceQi2HcXucHvpKIJBWB/cOiHTy8P9olCXBzLtuV3Vmw6lCnuOcfwXhJBNgW00nZrAFltUuL0SIDjzLz+E6+nirJtNnX0ykqNDJ4QeCf0o1a1GhZae+M8xpX34oDzQrV41TBJdPF6o0MKcDDTrQBRz1Pvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755522978; c=relaxed/simple;
	bh=KiDPy1cxOdeELjnRkJDjki4GEmLdwlakrZkevLJOoHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=nqyvIjkkPN1BDezfzp5L36ytqcxtSX58iSyQqHCUhjNbCvBIMRUyWY7NXsvy/InxdvOTVEismyZVoBxFCSM7aynMOKPhw0/tCJmO9ZDdNw96qV38ONaXAvuFZX8G7dzdv6Z70nPZoN3Rnh7rlawwKIEBFB85S6N3CvZ+mb6Uj/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TZ/7ahQ/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I8tIoF023680;
	Mon, 18 Aug 2025 13:16:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o2zBJ1kF8rqlydRWoZr48MXsVk6ZGhBtWvLOFfPakRs=; b=TZ/7ahQ/6C6EQeNs
	2Dp4YcV760dkOWlhuPlxCx1883IIsdu2FOikw4hEoHT/sIPEcNeWcFvGUOJAxc19
	nyuwRAy02zi0cq1/E7+rh+ewwU8SiZvqSXlVSxS2SkrVF4jDUQP2qZtfYD6P9F/Z
	l9oJBE/mo+IOK7IAtDrlL5WiSW2qKKGJhdC1OSpPAWFtwAjOqBsm8ylSu7jS2PHx
	eEz1Dt1EzGslx6VKDDJVCDw4MUl4W6/O6C4Kot+CLcSjYkzxhC2jCne1uR+BTtmI
	0MFYc9lBxhsKJ9i9UrJvMg73GVecP7T/6XgelYn22NziOWEOSGKWxICsmTivqrwA
	nQRIpQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk99mp6m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 13:16:06 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57IDG6aL002890
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 13:16:06 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 18 Aug 2025 06:16:01 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Mon, 18 Aug 2025 21:14:38 +0800
Subject: [PATCH net-next v8 14/14] MAINTAINERS: Add maintainer for Qualcomm
 PPE driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250818-qcom_ipq_ppe-v8-14-1d4ff641fce9@quicinc.com>
References: <20250818-qcom_ipq_ppe-v8-0-1d4ff641fce9@quicinc.com>
In-Reply-To: <20250818-qcom_ipq_ppe-v8-0-1d4ff641fce9@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755522889; l=898;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=KiDPy1cxOdeELjnRkJDjki4GEmLdwlakrZkevLJOoHI=;
 b=o/jAb7n5ltBInNmpH4KYTMHYeLmqQnsrkz5K5Oqr72c6AaNLVzal5YbgrlpLgWweagOcHBfKT
 NvpxV/nbz1/BFr+L0Qo2sOAponmU9jM3XlTEijv3DBEfNi/Q9tJfdIN
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4wWyHXU2LbcfTCbT92riSnDsgkgBZ0Zk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0NSBTYWx0ZWRfX7H8oWu8zgt2+
 tB4Ngx9NwTlnweEq3/oJzlzVBAamSGuyfzc/tDFtWGj6+Z6ps7oeJbd/HHSLZsmxU+6h88DBPcp
 pMPqrsJXrmbn3iGimr2GmGDsxZgH9WxwjsgaFkGy3JzUM3+9W0sN87JldDBg52QbgLY2Qrkwy/B
 D14VeYAk0kUXLX5sOhztC5UHnheP9aLe+F2DHqx38jJ7fgLFWkf8ixswVg3zKOraZxMUieJKrj3
 urv7KAXZpskQi4sjiTpnnw4GcMcZt/vlno8DdddLSLf+7+JE+HxHGEFPUITCiRzO2zJzlW5Zb/l
 BplmwenUEt6AvKk4CdAloE9iLiHeyhiUhqvXslMS4uVH9TWdO21h2B4AW3QColb3C+NX1SYjR9G
 nIZzyH/b
X-Authority-Analysis: v=2.4 cv=IIMCChvG c=1 sm=1 tr=0 ts=68a32796 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=-_PooAnB-Ua2z9syxaEA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 4wWyHXU2LbcfTCbT92riSnDsgkgBZ0Zk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160045

Add maintainer entry for PPE (Packet Process Engine) driver supported
for Qualcomm IPQ SoCs.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4dcce7a5894b..aaa306b6b582 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20836,6 +20836,14 @@ S:	Maintained
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


