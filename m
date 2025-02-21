Return-Path: <linux-arm-msm+bounces-48815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2CCA3ED72
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 08:41:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C95F19C2CF2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 07:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1F2C1FF610;
	Fri, 21 Feb 2025 07:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AljqLxiL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC1A1FECC2;
	Fri, 21 Feb 2025 07:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740123679; cv=none; b=h9Rzddp5PaS4DIb4KD4c3UOyuCIy1hOz6CkX7v6YsY8wAfsJ7AOo1798mgwlF7sQnOU/BsD0861QQpxk1NAGFeApc2tho2stGkOcea2XzHWSKXbZzJKjfG6Sayqeu/JcqMIX2a8yF+GG70HL4idg9hHKQfaE4CcStrHpJz4qzRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740123679; c=relaxed/simple;
	bh=XW4UHrh7HZ65gOBiK4D+fnUhL+XuV9zJ6mBUr0s6TPs=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=pHkaRyWZuRx1C4t8s/yKp2A9CkB3RSpwQyZzEt7hyiJzQ4w934AxCFnHiI5eOC53i4tbSd4arn1sNuvD9s/vchtw2wWD3iDW6XUgWs4xhCtHtLOcIpBvpO6RzM0Zhtyr8G9/Bb41bij8LCAnLCCuGFwE515BFD/rWkwJWBIcCus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AljqLxiL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51L6msSx020007;
	Fri, 21 Feb 2025 07:41:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Q7+bDsxdyRDdKRX4DGKhUC
	cDG8sXToF7lW1Nv6/3e34=; b=AljqLxiLgXZetudRYiYhuZjzlTGBUzbIK0y/Rg
	4UoIXeIAbZPc+M8vBPByu3sZHQKX0HTVIfNHNr1FlEAmrrJ3zwXA6fEcWMSzT0pz
	84vHiIHW68BfwxpRovEWLDzhGjMjyTLigGcwdcHfpm93mEfDL6EokvhhmD4fwjX+
	feoqgtqLyxIDsV0NpBOtqBk2T1mVFiXXXACsMAo9Zlkiadvwq+UCxEKZy5zRcY7f
	4OrZiUKjdIplxbBp2OP3HUK6DJa6t735zYCOFkoKvgI5W1dG+fwsOKj4TaLHZOv5
	qwRabmkZTJWRkNvOj4Ex0rNYLt61XpsyBSRGTr6HxPqPAKdA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44x06t3mm3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 07:41:04 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51L7f3dU008560
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 07:41:03 GMT
Received: from yuanfang4-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 20 Feb 2025 23:40:57 -0800
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Subject: [PATCH 0/5] coresight: Add Coresight Trace NOC driver
Date: Fri, 21 Feb 2025 15:40:27 +0800
Message-ID: <20250221-trace-noc-driver-v1-0-0a23fc643217@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOstuGcC/2XNwQ6CMAzG8VchPVuzLhDQk+9hOOBWpQc37XDRE
 N7dQbx5/H9Jf50hsQonOFYzKGdJEkMJ2lXgxiHcGMWXBmtsYyxZnHRwjCE69CqZFQ/cNr7tiOr
 rAOXsoXyV90ae+9KjpCnqZ/uQaV1/mDX/WCY0SKt38XXHZE/PlzgJbu/iHfplWb50aXezsgAAA
 A==
X-Change-ID: 20250212-trace-noc-driver-9e75d78114fa
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <kernel@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740123656; l=3447;
 i=quic_yuanfang@quicinc.com; s=20241209; h=from:subject:message-id;
 bh=XW4UHrh7HZ65gOBiK4D+fnUhL+XuV9zJ6mBUr0s6TPs=;
 b=OPsE4juDVYhn2asaoRFGGW0UvCXS1V1+BCpKS/PUY/fBh3M8FBunGAgak+aUCxJZF4RsayU/C
 O9kMAwhYVWaDDnT6CZUZjTiFufviWVyeIzfhtFG5IOvX7U57dsXrvX/
X-Developer-Key: i=quic_yuanfang@quicinc.com; a=ed25519;
 pk=ZrIjRVq9LN8/zCQGbDEwrZK/sfnVjwQ2elyEZAOaV1Q=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 08eeltVRhGKc7fS_NkH7AfScUY60poQq
X-Proofpoint-GUID: 08eeltVRhGKc7fS_NkH7AfScUY60poQq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_01,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 clxscore=1015 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210056

The Trace NoC is an integration hierarchy which is a replacement of
Dragonlink configuration. It brings together debug component like TPDA,
funnel and interconnect Trace Noc which collects trace from subsystems
and transfers to QDSS sink.

Compared to DL, it has the following advantages:
1. Reduce wires between subsystems.
2. Continue cleaning the infrastructure.
3. Reduce Data overhead by transporting raw data from source to target.

    +--------------+                                         +-------------+     
    | SDCC5 TPDM   |                                         |  SDCC5 TPDM |     
    +--------------+                                         +-------------+     
           |                                                        |            
           |                                                        |            
+----------|-------------------+                                    |            
|          v                   |                                    |            
|  +----v----+     Dragon Link |                                    v            
|  |DLNT TPDA|     North       |                         +----------------------+
|  +---------+                 |                         |    TRACE NOC AG      |
|       |                      |                         |                      |
|       v-------------+        |                         +----------------------+
|                     |        |                                   |             
|              +------v-----+  |                                   |             
|              | DLNT Funnel|  |                                   |             
|              +------------+  |                                   |             
|                   |          |                                   |             
+-------------------|----------+                                   |             
              <-----+                                              |             
             |                                                     |             
             |                                                     |             
             v                                                     v             
    +----------------+                                      +---------------+    
    |     QDSS       |                                      |    QDSS       |    
    +----------------+                                      +---------------+
    

Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
---
---
Yuanfang Zhang (5):
      dt-bindings: arm: Add Coresight device Trace NOC definition
      coresight: add coresight Trace NOC driver
      coresight-tnoc: add nodes to configure flush
      coresight-tnoc: add node to configure flag type
      coresight-tnoc: add nodes to configure freq packet

 .../bindings/arm/qcom,coresight-tnoc.yaml          | 107 ++++++
 drivers/hwtracing/coresight/Kconfig                |  10 +
 drivers/hwtracing/coresight/Makefile               |   1 +
 drivers/hwtracing/coresight/coresight-tnoc.c       | 401 +++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tnoc.h       |  57 +++
 5 files changed, 576 insertions(+)
---
base-commit: 92514ef226f511f2ca1fb1b8752966097518edc0
change-id: 20250212-trace-noc-driver-9e75d78114fa

Best regards,
-- 
Yuanfang Zhang <quic_yuanfang@quicinc.com>


