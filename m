Return-Path: <linux-arm-msm+bounces-64969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EEBB05577
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 10:53:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C565188D9D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 08:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECA132C3262;
	Tue, 15 Jul 2025 08:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Uo55ei8x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E2A274672;
	Tue, 15 Jul 2025 08:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752569594; cv=none; b=bqPJk2NF2o9xtj8Ju2jLdT5se+L6L0qKmhW9tfquf6H5sCw+E9TFCDUgBBvZZzTjfFCRxasScJEc/azanF981QkQeV0gUMcbMen/pkHfxjVUxi6kplLgBwgIZlqcVYWPIPaz/3OKqdesBhh0rCsgtiFVubExOfQFtf68oZhsk5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752569594; c=relaxed/simple;
	bh=m69eBpowmMuNvTB6Apw+JQZp8W3Cx09oDdHKlO4Ttzk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SyJtIvpmYELfVeM+HkB2w5Mz5URn2xGchUSRfK6KpF1XzrvcZ6F+GWLk2jkvEt8tI33eynNkBp5GEbaArLhFIud6QDx2OplZO5gada6bWUGW6cub1oil5jozV48LH/qV3l3rZxCQ8cPb7ShPwH9GyS+dKy7CICmDKlV54uCm6KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Uo55ei8x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F8ksaQ027658;
	Tue, 15 Jul 2025 08:53:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4AliyRKzkx1UpYngLzabBdK8VVN1l5cX3s5tZAsft8Y=; b=Uo55ei8x77iyDmHR
	cKnLRPvxVR+Jx2vPMNVhaK8/ibJPHZ9ahSAOs3opnrwnHBzIe+fx90xN1vEWHsQB
	avCKYmc9KVqkXoHbW3BnW8+HxI6FcqLw6R0CrPhTIb50zZH02iBuC3q7+u4xdmEU
	5mnRe7QeVU0h53WKE6VKDME0O/4MzdlPkzLOJwWEUOC2Fh5vX/zBlDnh0mT9QYvS
	h3yCWb8G4W4B3H3jnEp7gRs2pN3fzfdCNPnCt7e9CI5ERAe8jZNOcpP/ZcEKYdZu
	dxcNJwD/p6IbOCP+rIN3qqosmpVh1YKRqNaVzsyt91PuUuEBmn1Z8FBXVB8nPo1Z
	+B7Tng==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wkrug0ty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 08:53:01 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56F8r0f9017513
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 08:53:00 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 15 Jul 2025 01:52:56 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <srini@kernel.org>, <amahesh@qti.qualcomm.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <arnd@arndb.de>,
        <gregkh@linuxfoundation.org>
CC: <quic_kuiw@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        Ling Xu
	<quic_lxu5@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v8 1/5] dt-bindings: misc: qcom,fastrpc: Add GDSP label
Date: Tue, 15 Jul 2025 14:22:23 +0530
Message-ID: <20250715085227.224661-2-quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250715085227.224661-1-quic_lxu5@quicinc.com>
References: <20250715085227.224661-1-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4-IeGZQHoy1N3R8-O0TEg0rg49txDRzU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA3OSBTYWx0ZWRfXwh/t+dXwnscT
 1wbmDjDA8gDA5Q+/U8qTGDrs9I0/zzzLBgC035YDvXeqjgajqpJZ1DSkw4gw7hn7Rd9cmxdM1gT
 mLEbhOokRbq9mGXQlUZRgQ6erdg0iwWKvBMACmxOUzk1fZJDQOdkR0faVlvhKvAhaPazraKfEhS
 FqRjZsGXeQZ704HuyZdw2Y41BqTk8Mo3VSkYV227clhLz3jI83cN+MLfaMArPg+uafoqvUygYBX
 9H1F77gXsXRrO/Mn32Mt32zklXgSNzySXqUe1y6zjTrPv6FULyIS2pvTz5Lx1NsO0L2V5CSdogH
 6OgNUbm9V66iOUyeyGYdbmJBYxVG5jI/+dHlK42wXztvHUTWTRpbpwup/lS/ylTtou38gVEToYa
 KsSu6wxlFy+A2WIEr/jdWineHzNoPMbw4Lk8yhX3cOwyExNRliamMxAQ9Ft/+sfq0tDrOgxG
X-Authority-Analysis: v=2.4 cv=WqUrMcfv c=1 sm=1 tr=0 ts=687616ed cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=y9j2seIhk4up1NT0-iEA:9 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 4-IeGZQHoy1N3R8-O0TEg0rg49txDRzU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150079

There are some products which support GDSP remoteprocs. GDSP is General
Purpose DSP where tasks can be offloaded. There are 2 GDSPs named gdsp0
and gdsp1. Add "gdsp0" and "gdsp1" as the new supported labels for GDSP
fastrpc domains.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index 0840a3d92513..3f6199fc9ae6 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -27,6 +27,8 @@ properties:
       - sdsp
       - cdsp
       - cdsp1
+      - gdsp0
+      - gdsp1
 
   memory-region:
     maxItems: 1
-- 
2.34.1


