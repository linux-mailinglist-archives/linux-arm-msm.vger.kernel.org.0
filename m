Return-Path: <linux-arm-msm+bounces-10136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CE484DA1E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 07:29:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B302E28A622
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 06:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E453F67E77;
	Thu,  8 Feb 2024 06:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d1m24PZc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5937967E62;
	Thu,  8 Feb 2024 06:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707373740; cv=none; b=ALJhg82e9C4lSWQDFeHgDgHRWATQOV1giaZkc30IdP3FU5+ik8gmWR+44bA9fbCpRhj7KRDFAhI9YKEPNRWd4j7cDyUt+H5ugCQeBOwCc04XlzoloUQa9Gxgpzt8cw934WFTkkeX9+pAXSiYx4zGE7RDSdLBM9tBcXHoINf8UqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707373740; c=relaxed/simple;
	bh=Xil7KBhIZOzMZcPF+/CBDhaBElAT0dkrT7nmq8pUTWI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j4fMJERy4Mm5y6NMHg1TJyRZPoCJAETcz2UtgrEnZQziD0PnyNbsdgM+zPwssS3gNsIUfBUegx8hsZc8nLnXKOB8SfYtaZuaEgXBlYT6OvbLpBho6UEuw0sjesHykUyb7vgI6Ck1kMVRrW61F4/bB5pYM+Fr/wfKiSp+Z89cK4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=d1m24PZc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4185VNId026580;
	Thu, 8 Feb 2024 06:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=2b57wkokE3uxhgK5j61N
	gNqEG8fmYeTiAROVX9XuB9Y=; b=d1m24PZco7KBV2yWPKT32bEBnVvb2nUSBe8M
	Dj7CNzgKkbhFkZXFJpuUI30qm4C50VirgLXgadL1rrippvrEdGQ38FDb7geVTMqs
	Kz9st3ARQu1C5YmQtsxre8NRPkcUguMotxSknmqMo/GFATUDeWzUL3FetnyFnGpw
	GIA/XsM30Jyl7dVzSZ/+OQ0SU4RgzNOjc/gSKS5jRwQc0HPCW8IeAHCBEA5aSR/C
	U3mhtCMwUYexnpbFbaiw0SZzOCQgp3oIsHC+YJiZ9psEOCvTLxQg7QAvsX+gjSM0
	KoIXgVA1G2LSumYdMq9Jhr+jcYkgWvrASJgl+3YQMBD35bE4qg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w46r82g1q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Feb 2024 06:28:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4186Ssft029666
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 Feb 2024 06:28:54 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 7 Feb 2024 22:28:51 -0800
From: Taniya Das <quic_tdas@quicinc.com>
To: Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?=
	<mturquette@baylibre.com>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH 1/5] bindings: clock: qcom: Add "qcom,adsp-skip-pll"  property
Date: Thu, 8 Feb 2024 11:58:32 +0530
Message-ID: <20240208062836.19767-2-quic_tdas@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240208062836.19767-1-quic_tdas@quicinc.com>
References: <20240208062836.19767-1-quic_tdas@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9wpJHi6ZVlLwQwMnjqNB-TsH5qRfvJ4t
X-Proofpoint-ORIG-GUID: 9wpJHi6ZVlLwQwMnjqNB-TsH5qRfvJ4t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-08_01,2024-02-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 adultscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402080032

When remoteproc is used to boot the LPASS the ADSP PLL should not be
configured from the high level OS. Thus add support for property to
avoid configuring the LPASS PLL.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 .../devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml   | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
index deee5423d66e..358eb4a1cffd 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
@@ -49,6 +49,11 @@ properties:
       peripheral loader.
     type: boolean

+  qcom,adsp-skip-pll:
+    description:
+      Indicates if the LPASS PLL configuration is to be skipped.
+    type: boolean
+
 required:
   - compatible
   - reg
--
2.17.1


