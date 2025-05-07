Return-Path: <linux-arm-msm+bounces-57068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C0BAAD680
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 08:53:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E07D93B622C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 06:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BD1621767A;
	Wed,  7 May 2025 06:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="L6M8bcvT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7C9211A3F;
	Wed,  7 May 2025 06:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746600696; cv=none; b=WWgH+W2rSqCMQF5fEWq79xVD+oBDdythDrRjDy1t7jAOe/1HHW8DIvJRBnS4m5CYtrq3OV2PBJVBsXkZTHda2/c9l1DjZoX2ChZ5tftZZvrvZZDzCxw58444Xnnu/LuQlFyXeyR3tXFP1cblTiDgfrHCAO1PvZXoPBr9A8cdD2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746600696; c=relaxed/simple;
	bh=abetyqtm1ZQseXM7W2DQyMKgotx8rETqIz0Qf2m+h+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kQthRabtlq6wyDqfWOlJ0y8LqSmTp8b9swjQvhaucj9iHql+LtkJdR2W0/xQdyBeh0M6POTftcdwA2pY+KdmQz1ygpHPBRg42qb9JKy0iBwkaDVjy5V8UrgEax+XtHzlgRPJhEm1qpkp2yuT2nie6bJhsMHZd6Pb5ngxB8Ufgeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=L6M8bcvT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5471H0Hc009589;
	Wed, 7 May 2025 06:51:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KEVA8tkja5h
	P6w+lj9h8Yxu9KfSEbDdchdVCpe3ALeY=; b=L6M8bcvTU4SuJMPQjOWybN3J2Q/
	EvjV473OvLmFtoQrdXyamTpo9WpgxtbfAz0bWISuHSG6qBAzRmOl7aifwuR1CHjh
	vO2qZHlpNg5TklBTE48asTD/oiOpzb5bbSYc0tQN6pLR5knVkhDJxSQAOi+hvspA
	AodpMleIKn4bHYq48yipWGxjG4tC9si5FKAGWzf7oSsoz7PmGOMiuVo1LOYHZbxo
	g2r5SAXUorUPEuL/YEZqU8U8X46FfrjizraTYK+oq4A2Uf5LjxupD1bYkOJpBX7g
	xiQ2dh/IX6zlzz8oGrdpmE4Ya7n4blyz42I/9lNZTOyERNCqjXsQtrn9g/g==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46fnm1hwau-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 06:51:29 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5476pPC2009492;
	Wed, 7 May 2025 06:51:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46dc7ms9ra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 06:51:25 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5476pOZw009457;
	Wed, 7 May 2025 06:51:24 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5476pORI009449
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 06:51:24 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id 362045B0; Wed,  7 May 2025 12:21:23 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        kernel@quicinc.com, kernel@oss.qualcomm.com,
        Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [PATCH 2/8] arm64: dts: qcom: qcs9100: Remove qcs9100 ride board
Date: Wed,  7 May 2025 12:21:10 +0530
Message-ID: <20250507065116.353114-3-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507065116.353114-1-quic_wasimn@quicinc.com>
References: <20250507065116.353114-1-quic_wasimn@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LByxpJquQJOPx-6wEMRV_B98KGjk5wtP
X-Proofpoint-ORIG-GUID: LByxpJquQJOPx-6wEMRV_B98KGjk5wtP
X-Authority-Analysis: v=2.4 cv=bLkWIO+Z c=1 sm=1 tr=0 ts=681b02f1 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=5gmEkoZ9zv_KgDvHB8kA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA2MiBTYWx0ZWRfX41eudXDmiXNY
 6B+bSz02EcTESEIO6HkWgvdvG2PvONdAcWmbxl5d7Sj9310PSW326uxWpA0ypHtM6WP+n7D1AfZ
 +K8I858vyd3Xr0uxmRNiZioqkbijWd2oSZM7Zppptpx7uHRYVtrZ4nzWci0dzpIuCSuc15f/q7T
 nRdahHp6/ozJMSifYMy/5T/UnK5Yh/cme1DFUS9XCAIPuxMupRqoGNwlmB5GiNrRNabbEECLu76
 VlZSe/DkN+xv9hlcw+xFUGsRd2virj9P2CRCU16V8TPOsp3bHKbkUMJcWUxgdUPFEMsTp5VzwJ+
 BBYHOzMe5GSr2GXfahUFg+cKuQptK9fkpUWZ1ZkRv1E4BY+5BWL1/LxVYdA0yvpHPc/MHq5ydDi
 z3J+k2YijUNIC4R7o3Dt5dcGJZunTJfjH2UFmuhSCdGS3iv+dQkmGpZr1tlXVd6lbcVo5dWr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_02,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070062

Remove qcs9100 ride support as HW is not formulated yet.

Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
---
 arch/arm64/boot/dts/qcom/Makefile         |  1 -
 arch/arm64/boot/dts/qcom/qcs9100-ride.dts | 11 -----------
 2 files changed, 12 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/qcom/qcs9100-ride.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index adb4d026bcc4..162d9c1b5a0f 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -122,7 +122,6 @@ qcs6490-rb3gen2-vision-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-vis
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-rb1.dtb
diff --git a/arch/arm64/boot/dts/qcom/qcs9100-ride.dts b/arch/arm64/boot/dts/qcom/qcs9100-ride.dts
deleted file mode 100644
index 979462dfec30..000000000000
--- a/arch/arm64/boot/dts/qcom/qcs9100-ride.dts
+++ /dev/null
@@ -1,11 +0,0 @@
-// SPDX-License-Identifier: BSD-3-Clause
-/*
- * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
- */
-/dts-v1/;
-
-#include "sa8775p-ride.dts"
-/ {
-	model = "Qualcomm QCS9100 Ride";
-	compatible = "qcom,qcs9100-ride", "qcom,qcs9100", "qcom,sa8775p";
-};
--
2.49.0


