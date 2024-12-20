Return-Path: <linux-arm-msm+bounces-42926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6429F8CFE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 08:01:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85071161073
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 07:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF74D19994F;
	Fri, 20 Dec 2024 07:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fKWkaPkU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4567133086;
	Fri, 20 Dec 2024 07:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734678096; cv=none; b=qhRZMZ13/m1qByFSF1tGtpB1vJ0GGrXBtbHJBu8XORjVC68lFiAgu2UMM9Hlgz1f3IUddyMxZONiYq6gejD9c87KVS+1tPoleYFX/eHMLFtXqQ8xxN62Uu7WAekBxVN1yCVdzurzit2iuuUACBOsUobIUmyqEKXfMqPdJaUU+z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734678096; c=relaxed/simple;
	bh=jMBu9uzOfw8/9QHTkOAtPF99n+ZRkpqIwdx8UPPSHDc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DZklZoBQAOo4O0Vbz/Fm2LPoX65aA9Shr4N4e+pSCcZ2pgy44uxP9PVBsmAnpzMBy/XUQplBvB8dFUfQZPYKl+Jpi2E+peGHwJi6DB9UxdxRCiprFQ+brX8H95VaJaAcTzSvHZoDMTuA6ah/3fM2qmPOxvlAmctBLafH84xAa6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fKWkaPkU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK5eltf005101;
	Fri, 20 Dec 2024 07:01:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SFsnKjfsyLrxU6X2X8vV9PknPd80fqHcwW7PddMf35c=; b=fKWkaPkUEkfavy2k
	JkIonNyVJqP3VKu0eDhWgS5/9BuUpbcYx5GR8vuzL1wufYcKvi98QmDFa4YPW1PC
	C4+AYTxXkCAp3cbq01IUFli0xRc6asPZwOf/6C70EHiSWhFJv5Xbak6K17AdhxHl
	+6Iks8kgzfF1FoTSmy2cBGgQ9hIo4u/lLxHdSLqmYN5uIbVQfAk2sog1XVXOg2XE
	08GxNEz6FfbiSOO3TVNUtvEygDo/KzF0zUbRuXwm0sgSH/arkonU604ZDWbsB/IW
	RdIOZ/8/He4OTP98PQG2MReSDJQdJMH69jq2L1rg99sa6Q34niaUHx1C/iHUEaSh
	uPrn/g==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n2n5r68b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 07:01:31 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BK718at010760
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 07:01:09 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 19 Dec 2024 23:01:04 -0800
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <herbert@gondor.apana.org.au>, <davem@davemloft.net>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_mmanikan@quicinc.com>, <quic_srichara@quicinc.com>,
        <quic_varada@quicinc.com>, <quic_mdalam@quicinc.com>
Subject: [PATCH v2 1/4] dt-bindings: crypto: qcom,prng: document ipq9574, ipq5424 and ipq5322
Date: Fri, 20 Dec 2024 12:30:33 +0530
Message-ID: <20241220070036.3434658-2-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241220070036.3434658-1-quic_mdalam@quicinc.com>
References: <20241220070036.3434658-1-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0jh4ejkhuI4W8u8mvtrnIKtedgTxvLAe
X-Proofpoint-GUID: 0jh4ejkhuI4W8u8mvtrnIKtedgTxvLAe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 mlxscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200058

Document ipq9574, ipq5424 and ipq5322 compatible for the True Random Number
Generator.

Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---

Change in [v2]

* Added device tree binding change

Change in [v1]

* This patch was not included in [v1]

 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
index 2c959162e428..7ca1db52bbc5 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
@@ -24,6 +24,9 @@ properties:
               - qcom,sm8450-trng
               - qcom,sm8550-trng
               - qcom,sm8650-trng
+              - qcom,ipq5332-trng
+              - qcom,ipq5424-trng
+              - qcom,ipq9574-trng
           - const: qcom,trng
 
   reg:
-- 
2.34.1


