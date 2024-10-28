Return-Path: <linux-arm-msm+bounces-36121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D6D9B29D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 09:07:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FEA7285A20
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 08:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E3981CC8BA;
	Mon, 28 Oct 2024 08:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gJ2mln8M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139621CC882;
	Mon, 28 Oct 2024 08:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730102661; cv=none; b=dCLgOCxgRTcy7A8ursWcEeOMxdCbdwY4XtmpEvuNUAihIWAvSQcNGFFVkNH8rHHzafVbnvvSnZLSUQWrBKPfdkXuoFtknSHj/cDJNL3M9/blz4GcOawLNMYEXNGyqDhTXb+6L6wO9T+X9P/lKova/DFFO1WwGjWu0bQ7pT323f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730102661; c=relaxed/simple;
	bh=X+GPxqAmxx6Y6mslfBHSqblqsRdeWt8fgylC2cfj8S8=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=Xa8HXhSRM29OXOTsfvJUHgmBE402nZdHGk6LkHllp9O9PTx3gP9qoPUjN3oivzwPEmX3GNdJDM0A1XWg49ud3yacD4vUfYmwVfojnyuJHAO192kmQDuA9pndbauDLbgzOp2fv8iNv01Fwv0wOCB62oWD8A6USUz354H6qLJ+1V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gJ2mln8M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49RMuLej022812;
	Mon, 28 Oct 2024 08:04:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9C0KseqbJ5AyDfAtXHp0sH
	WJdy8J3aD+es4MmJTCbaA=; b=gJ2mln8M4OKnsDLFQTQ1wYJYvKplgOgbne5hAj
	ldRsX6IGwDSur/u2gGLDWeo5UCexOY4/jZOOuEIXIKevDSHnncsw/I45c2JglKOb
	avtOEQZw6mvqZVh7+eujutwKKInTpfAY/TmbktAMyouVhSgsdEah1o/2DJBECstb
	yuORECOZ6pmoNjcToO3iSX/ClwTylJzG7JQfblrhKxTMcL69Z1dRoTlhgytGx1vO
	tsAMTsey9fxcofJeAsyNIsfB7ybxYPVQvaAee53gkpuVZIYiAXb+KrZl49WA4wWR
	L0HwhuKk/be4HdCo9/eWFolUcgeP7PH7dfKAwALXY/w1VQqg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gqe5v3bx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 08:04:15 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49S84EVQ011679
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 08:04:14 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 28 Oct 2024 01:04:07 -0700
From: Tingguo Cheng <quic_tingguoc@quicinc.com>
Subject: [PATCH v3 0/2] Adds SPMI bus, PMIC and peripherals for qcs615
Date: Mon, 28 Oct 2024 16:03:23 +0800
Message-ID: <20241028-adds-spmi-pmic-peripherals-for-qcs615-v3-0-f0778572ee41@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE5FH2cC/62RwWrEIBCGXyV4riWORk1OfY9Sgo7aFbpJVrOhZ
 dl3r+6Wlj0UutCDhxHm+/6ZOZHsU/SZDM2JJL/FHOepFPyhIbgz06un0ZWaQAui7aGnxrlM87K
 PtDykS2lfdj6Zt0zDnOgBs2QdZdL7jjPVG+VIYS3Jh/h+8Ty/XOvkD8eiW6+fP7ahqS7WAlTXG
 Ke4RvM25uOyzGkdi2T8kgB0MkhhegQxbKJ6rMme4rzfx3VonO+5lkw7C9YE65lRLeqAgodWIjo
 nWy6FBVIT7WJe5/RxWcTGLpHunHljlFGrlApBKxY4PpUBMU74WALVcNe5GLuH1wunQToWHPpfe
 OIenuw6b5RxgRn8D542HKVyuua84dWdbvC9x3LPP3OhcAPIcjQQ3Ep+yz2fz5+RUNiwtgIAAA=
 =
X-Change-ID: 20240929-adds-spmi-pmic-peripherals-for-qcs615-16ee53179a7d
To: <quic_fenglinw@quicinc.com>, <quic_tingweiz@quicinc.com>,
        <kernel@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Tingguo Cheng <quic_tingguoc@quicinc.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730102647; l=1830;
 i=quic_tingguoc@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=X+GPxqAmxx6Y6mslfBHSqblqsRdeWt8fgylC2cfj8S8=;
 b=j7TWmJEfX1xTcG35IHFacH9BBWHQLmt9FeaiDmaXrm005YRKyKmQfIXYX+1Q2UiWmrmQI4S5l
 XuC1VPE5X79C7rOjZjkC/SN/MXRVSabTMLL2GhZeUm8Mr+HIwwNpZnk
X-Developer-Key: i=quic_tingguoc@quicinc.com; a=ed25519;
 pk=PiFYQPN5GCP7O6SA43tuKfHAbl9DewSKOuQA/GiHQrI=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: r2jL-lgYWTbGgpZCsIfGTwBegQQthpyd
X-Proofpoint-ORIG-GUID: r2jL-lgYWTbGgpZCsIfGTwBegQQthpyd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 mlxlogscore=837 malwarescore=0 adultscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410280065

This patch series depends on the patch series:
- https://lore.kernel.org/all/20241022-add_initial_support_for_qcs615-v4-0-0a551c6dd342@quicinc.com/

Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
---
Changes in v3:
- Fixed comments from the community in V2.
- Split the patch into 2 patches(SoC:qcs615.dtsi; Board:qcs615-ride.dts). 
- Link to v2: https://lore.kernel.org/r/20241024-adds-spmi-pmic-peripherals-for-qcs615-v2-1-f262ba243b63@quicinc.com

Changes in v2:
- Include "pm8150.dtsi" for QCS615 PMIC instead of creating a new
  qcs615-pmic.dtsi in the case that pmm6155au is a variant of pm8150.
- Fixed comments from community in V1.
- Link to v1: https://lore.kernel.org/r/20241014-adds-spmi-pmic-peripherals-for-qcs615-v1-1-8a3c67d894d8@quicinc.com

---
Tingguo Cheng (2):
      arm64: dts: qcom: qcs615: Adds SPMI support
      arm64: dts: qcom: qcs615-ride: Enable PMIC peripherals

 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 15 +++++++++++++++
 arch/arm64/boot/dts/qcom/qcs615.dtsi     | 23 +++++++++++++++++++++++
 2 files changed, 38 insertions(+)
---
base-commit: de938618db2bafbe1a70c8fc43f06ccdd60364b2
change-id: 20240929-adds-spmi-pmic-peripherals-for-qcs615-16ee53179a7d
prerequisite-change-id: 20241022-add_initial_support_for_qcs615-2256f64a9c24:v4
prerequisite-patch-id: 09782474af7eecf1013425fd34f9d2f082fb3616
prerequisite-patch-id: 624720e543d7857e46d3ee49b8cea413772deb4c
prerequisite-patch-id: 04ca722967256efddc402b7bab94136a5174b0b9
prerequisite-patch-id: ab88a42ec69ad90e8509c9c5b7c6bdd595a7f783
prerequisite-patch-id: 918724fafe43acaa4c4b980bfabe36e9c3212cd1
prerequisite-patch-id: 3bd8edd83297815fcb1b81fcd891d3c14908442f
prerequisite-patch-id: fc1cfec4ecd56e669c161c4d2c3797fc0abff0ae

Best regards,
-- 
Tingguo Cheng <quic_tingguoc@quicinc.com>


