Return-Path: <linux-arm-msm+bounces-25390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95345928BBD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 17:33:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B78F61C212DA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 15:33:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2686114C59C;
	Fri,  5 Jul 2024 15:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gtzYRb6W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBDD18AF4;
	Fri,  5 Jul 2024 15:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720193604; cv=none; b=ON52AdsunB39Livn6fW2Zi9iXkJAmxrJsMaPeKJo/7GJh6miV0oeeQJG3hxcOORK6FbduGdivav3G7NwJZSkK4so+gonDxCV77C5022uzZDX2RwiiAWfzE2qolojuhcXP+2Od1nSH3qUu67/lADsNFe8FLyq7zoV1QvVfQM03m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720193604; c=relaxed/simple;
	bh=OWqU8ZNa1MY59Tpy97hjV0Bl/iQtxL0IG0IYOpW8W0Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YZVbIGjCAEvk/SFNWcc0At1iHjeYRNL9JQYeuhXs0Z0tF+stRc0i7aOe06Qq3AhZIm7fqW93hiBZOgxa+g50RhfnH4S9rAkagymQ4XEafeIUCysVHoi5xPOFE6YV39E/RUCfd+Vl0z1/qXc5m19e+RVDIr3JJ4U+PfakpjBK2Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gtzYRb6W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4659odKn006945;
	Fri, 5 Jul 2024 15:33:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=l6KgHAu3vGzP0I7lheGdGd
	7iX4kpuMaTeLn06NcxnSI=; b=gtzYRb6WiVJdAUL274oVzanwEAoKvuwbo/03bl
	fD4HJvmgrQBehgURuR/EMj3BbAS1juDG6403UC8FD456Z6L3ZE9r/zqPGDVkcvAK
	gO74oociBw5/hldjwKs0ITWq6fuBFTQ8dPmwLU64O9AX/cReqOAQPGj+nZ7gQKlm
	e4UEL61MqusdWEvh4lKl6HpBpsFJX/7CZFi3KBBf3+AidePNSGVU+6lgBe5CVzrC
	YA8JtLQh9nmfNXf4FkMFV5oC02ymRs3c9Tsxlome1bIm2nZ/9NbzEevvVa7eyMQR
	5XkPujdGuA5vWhTu4zxx+2T7LNvJ9vQoFWJF1TdqScl/xgRQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 405cg2d3kk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Jul 2024 15:33:08 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 465FX71G029517
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 5 Jul 2024 15:33:08 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 5 Jul 2024 08:33:04 -0700
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Mukesh Ojha <quic_mojha@quicinc.com>
Subject: [PATCH 1/2] dt-bindings: mfd: qcom,tcsr: Add compatible for sa8775p
Date: Fri, 5 Jul 2024 21:02:51 +0530
Message-ID: <20240705153252.1571814-1-quic_mojha@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: um64UVA3MqxIQMwSHoMR5E_nv5p6Yy-3
X-Proofpoint-ORIG-GUID: um64UVA3MqxIQMwSHoMR5E_nv5p6Yy-3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-05_11,2024-07-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 spamscore=0 mlxscore=0 bulkscore=0 mlxlogscore=885
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 phishscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407050112

Document the compatible for sa8775p SoC.

Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
---
 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
index c6bd14ec5aa0..7d0b0b403150 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -21,6 +21,7 @@ properties:
           - qcom,msm8998-tcsr
           - qcom,qcm2290-tcsr
           - qcom,qcs404-tcsr
+          - qcom,sa8775p-tcsr
           - qcom,sc7180-tcsr
           - qcom,sc7280-tcsr
           - qcom,sc8280xp-tcsr
-- 
2.34.1


