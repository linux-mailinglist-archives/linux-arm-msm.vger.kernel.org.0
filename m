Return-Path: <linux-arm-msm+bounces-67929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B1EB1C925
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 17:46:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9617D565AC3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 15:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA08B2980A4;
	Wed,  6 Aug 2025 15:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="k4sMBTU3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C592951DD;
	Wed,  6 Aug 2025 15:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754495048; cv=none; b=lXFySC75HUG87DdZYFrA73xmxgED85N0aPTIgNhL12qyKSqonJbIJ/l5iRtMrQZjZ/v+jdofgXLoLsyU1yqOCcG7uGF20D77drCoBFC19k987iq18RVxL7skXssAZ3UOen7btF9qztrare5HWXyHN1j4tXPuDY8aCHv2V1mOV+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754495048; c=relaxed/simple;
	bh=VbUOgrDEWkhn97zyjHr+OAFotKVG25Mi4hgwcNkpU7A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GTVqKfJLqW9tcFAMG5O8mT+4p8E4oBOAJ8eg77r1uYrSxfSVhTXFvy151cd2qwvUcZTDuccUfSRLC1fInI0y3kTT1n51gnS/Trp4aYvg9ZGNCf10pApa4bq9sRHclGcnVUfXP4AFzQXho29fdq9aEogD7mMQ9x39S6QSU/R/M0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=k4sMBTU3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576DxnPf017396;
	Wed, 6 Aug 2025 15:43:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=LqpSPln97LrahdHxRB1JPKa8uvBPxzjRN+S
	AKgg47IM=; b=k4sMBTU3C7hlgGjBnsIpeZPyWhVPOPyoBXQFzpquZAgECKXcoHF
	sFupm5kDadOv3BI+/QWNvkS8bFun8WG8YGHnoOysCbGjWDqg5mst89IKbPCZZL1n
	Ns5dp/d73SQ1bj4dWQeiRXEbGLEe9hxf3z9egffPZb7Lrl+axHLospnggVQzmQjf
	Gg7QPCkGwfGUskUiSmQM+2VYZD3a4WTRT3jMySe6auO8pC7O0cG5pSnDtX8qciHL
	pCeG/I1ZyT1hZx1V8nXUuwwR20zb4EY7LKWleegxNBH3SOQGiQYUuEcXCrWtjsmn
	KgQQuUS3Hv1R9+2h2QZjS49YBUgzfn3UvbA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpvvu8h1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Aug 2025 15:43:46 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 576Fhhdg022927;
	Wed, 6 Aug 2025 15:43:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 489brkx9u5-1;
	Wed, 06 Aug 2025 15:43:43 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 576FhhqP022922;
	Wed, 6 Aug 2025 15:43:43 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 576FhgiM022921;
	Wed, 06 Aug 2025 15:43:42 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 11032571922; Wed,  6 Aug 2025 21:13:42 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, mani@kernel.org, conor+dt@kernel.org,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, konradybcio@kernel.org,
        krzk+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V1 0/4] Add support to configure regulator load for UFS QMP PHY
Date: Wed,  6 Aug 2025 21:13:36 +0530
Message-ID: <20250806154340.20122-1-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
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
X-Proofpoint-ORIG-GUID: HE5WUHhspQYMBI8K5wb3WXZ387c_0ach
X-Authority-Analysis: v=2.4 cv=GttC+l1C c=1 sm=1 tr=0 ts=68937832 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=2OwXVqhp2XgA:10 a=0ZrUP_scgLWD7QagsokA:9
X-Proofpoint-GUID: HE5WUHhspQYMBI8K5wb3WXZ387c_0ach
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX3Q6iMSTSyy3Z
 k4HNESXeh90Qy6iZ4iLWTywhBlEjMqTYoOxpP5KmOwDW3LyQvoK1MRjhunHjdXFZ17yyhxGrM5t
 6lQPiN2c4/dzwz1XeeeIXBPJ3lcfwqoT6VUQZtHlJmCBWAF8LJ+1/cK34N47wv97izFz0cT2QeL
 haIdQKI1p5CvMTIkWYNW7rNNuFI8RfW45CodzmWRShzdPLyu1/BrPW3TNqbVTzayKe9msSz087y
 92w+SZAcLyVqaJopJr2kOuW89ce0ctsskZdhV0dqqd5ZrARnzbcqlmCAX9pbqNkC/lv+TzblDDX
 d9nXJZYdy02xpmSv8S3D3umA53Kdj7WheZuNH61pKS9+mIT03xVQcCwb8HveZOHBGRWgi++TE2H
 d0eUO0Ma
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

Add support in the Qualcomm QMP UFS PHY driver to configure regulator
load using max-microamp values from the device tree.

Patch introduces two optional properties in the SC8280XP QMP UFS
PHY binding.

These properties define the expected maximum current (in microamps) for
each supply. The driver uses this information to configure regulators
more accurately and ensure they operate in the correct mode based on
client load requirements.

This change is tested on m8550-qrd, m8750-mtp and sm8650-mtp.

Nitin Rawat (4):
  dt-bindings: phy: Add max-microamp properties for PHY and PLL supplies
  arm64: dts: qcom: sm8750: add max-microamp for UFS PHY and PLL
    supplies
  arm64: dts: qcom: sm8650: add max-microamp for UFS PHY and PLL
    supplies
  phy: qcom-qmp-ufs: read max-microamp values from device tree

 .../phy/qcom,sc8280xp-qmp-ufs-phy.yaml        | 10 +++++++++
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts       |  2 ++
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts       |  3 ++-
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts       |  2 ++
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts       |  2 ++
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts       |  2 ++
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       | 22 ++++++++++++++++---
 7 files changed, 39 insertions(+), 4 deletions(-)

--
2.48.1


