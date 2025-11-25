Return-Path: <linux-arm-msm+bounces-83152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A46C833E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 04:33:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 691AA34C2AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 03:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5905264602;
	Tue, 25 Nov 2025 03:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BUslbNRv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E14257851;
	Tue, 25 Nov 2025 03:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764041608; cv=none; b=fbkJknSQfFAd9q23LPhvPR0PNWB1Lxb7AbXgy+91OmwPhKI3xtMIvKNRP72ChUARIawgBYW5SFNTZRqbl1YSN6I2I+i1UXWwbbCVIYHQSjPtDsNL+H9Tofn1/7n/QCPbscfozZVBzsKhDq/96X8qerO/K0iT+mBSqOtxFp76WcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764041608; c=relaxed/simple;
	bh=4Jc9GshMBUVsskPmqPkiqhBJ1f1ql57E2TvfjSms1AY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UPdJi/5FOXJnckjEsMCS/is50LgnLHlL5AcR6ZxkKxVglx6SDUtDQEv3E4kL488WEpZR4WEZogRl+GSd5bcsR55X32AQJI0hX658oFDiqTrjuwqaBR0d2+Yb1SLPIrWx4tnsXApnPxYfWPiVUAEnuHCbnExs3UONf6pR0Sp7OLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BUslbNRv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP2geoN1687811;
	Tue, 25 Nov 2025 03:33:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=MgwAUNdb/GotuNhbaf+os9ZDQBhGIEFW6uB
	YXplJc+I=; b=BUslbNRvgkWF2/T5pgW6l26zQIpMpD9c9R62twqpKlNCklxiONs
	u1dJvW32Nrrwf+c3FecGrELGkROpe6/+rNlYSNJhHFQOt7oVauZnwuSdrOCzagBY
	WbCvreKsAwS3EeEb6su1NNugBbaWHrGNleF4NcS5H3e5fZLo75sM9s1cPOND0AU/
	Gimb1pw1WT0WwUZTEjz6ypXAeX3Jh4+WxqICa32M/xmBLHe/lqhQBzujhLg/5zZH
	LPFZ3X27EvlQIFpWGAdIm4VfbuiNOPiaazyqolmnimK66RCNsas+CAk1Cm+t5uad
	8VjWqjkkkLzu/UXmO5OA/HeJK9Ex1WX30Gg==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amrv6a0r6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 03:33:24 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AP3XLR4014096;
	Tue, 25 Nov 2025 03:33:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4ak68m5451-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 03:33:21 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5AP3XL8n014091;
	Tue, 25 Nov 2025 03:33:21 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (cse-cd01-lnx.qualcomm.com [10.64.75.209])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 5AP3XKjE014089
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 03:33:21 +0000
Received: by cse-cd01-lnx.ap.qualcomm.com (Postfix, from userid 4531182)
	id C220F225DA; Tue, 25 Nov 2025 11:33:19 +0800 (CST)
From: Le Qi <le.qi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        Le Qi <le.qi@oss.qualcomm.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: QCS615 Talos EVK audio support
Date: Tue, 25 Nov 2025 11:33:09 +0800
Message-Id: <20251125033311.254869-1-le.qi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDAyNyBTYWx0ZWRfX89jkIYKn78KQ
 Vn2X0YHB8cxeLDqdGvvYqeOwiyb7VNKvx4O5GPHZ7rUZQvJHSh4wseOQT4/NTK1tjwMwHnGvUoT
 SoCqCrVA7oAn32iSL4Gn5OblYwnXKZsN58qRj/xHRNNksMC4dl4MO1gIkC0b7qQycdz1Vua17MT
 g371q29odsdnVrfiihJnE6/JEfGo/HvWZ6ya8VKNNfgZNPL/2rbEIwxemsAZOCD0w2q1258XYet
 wJ3Gbns1xeQPg7ckWH4KgDU5djtTs/OJKacYS68dgWPeEI7e27tLDtYFweRgqxt6dIaNwDgVoT4
 lbZE7i1azNHxPrIyW8rUOjjuRKRu2JKAk9FH+BcgxqnRMtR4IMeIpsOdljzDLO1pH2X5B/qkqUE
 hXxfE/eGS5drMNyqOA2i72sV5PWLRQ==
X-Proofpoint-GUID: R29TaQVK52-x8tz1AWa7KiD7QEoUQG4o
X-Authority-Analysis: v=2.4 cv=f7BFxeyM c=1 sm=1 tr=0 ts=69252384 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=y3ks6BNNZynTcr9YtwwA:9
X-Proofpoint-ORIG-GUID: R29TaQVK52-x8tz1AWa7KiD7QEoUQG4o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250027

This series adds initial audio support for the QCS615-based Talos EVK
platform. It introduces the GPR (Generic Pack Router) node in the SoC
device tree and enables a sound card node with the DA7212 codec on the
Talos EVK board.

With these changes, playback through headphones and capture from the
headset microphone have been tested and verified to work.

---
Changelog:

v2:
  - Address Konrad's comment to modify the commit message and
    group GPIO pins together into a single entry, moved to the
    SoC-level DTSI for reuse.
  - v1-link: https://lore.kernel.org/all/20251024023720.3928547-1-le.qi@oss.qualcomm.com/

Le Qi (2):
  arm64: dts: qcom: talos: Add GPR node, audio services, and MI2S1 TLMM
    pins
  arm64: dts: qcom: talos-evk: Add sound card support with DA7212 codec

 arch/arm64/boot/dts/qcom/talos-evk.dts | 54 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/talos.dtsi    | 47 ++++++++++++++++++++++
 2 files changed, 101 insertions(+)


base-commit: 422f3140bbcb657e1b86c484296972ab76f6d1ff
prerequisite-patch-id: 065fda916d7faca61113e1230fcc0ce3916442fe
prerequisite-patch-id: 930d1d066a4020db880cdf5c470e03808aa21e0c
-- 
2.34.1


