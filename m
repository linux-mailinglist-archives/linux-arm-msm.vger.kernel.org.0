Return-Path: <linux-arm-msm+bounces-65178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F00B070E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 10:51:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF0D7189BBBC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 08:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D6952EF67E;
	Wed, 16 Jul 2025 08:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="E3H3MdSt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4292829B77C;
	Wed, 16 Jul 2025 08:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752655912; cv=none; b=BqEz9okK1c4v8SKjOJuOWMAUS69mse5HtltwH8QcsW/pV2pjSrjWVod7CigDKPY6FBN8nMvFtGBIHaOmwNysE9eN0CV6r4N1jp/TbzoeQXc0d2VT/FUj1/yTXYCWXFYP0VTQlG50VHUmDcv2LUVqq+KkJF4BNQRu6gvkE8VB7Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752655912; c=relaxed/simple;
	bh=C8wk5wd2vdrmCGfvTUy7P+izwKxAI9vCGu3v73GLvNc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DKtBRQpSpyzSzzeHofotCI43TtNisQFTqmEFoeMLjYi/quMGldqry+sDC9nV1aVVeif5sQBTMt6+c+h6/U16e2Zk4F5DXiX0xKXGlaLFLdhmekVwI/O2JM+f16MPD9iQc71yeoVgpnto/mmg5T0AFSR82Az3PUvKDmmKjBN4c6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=E3H3MdSt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G6ThGB031273;
	Wed, 16 Jul 2025 08:51:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=JAfesH9/TPqW8YiL1mT2tzTzG+h7ZmwO6fSXKlIFXXU=; b=E3
	H3MdStvdVs8Bt9VQvPHzX1lrHtDgAXQg7jC1hZ2PhJ0YiXN6kIEtmpFem0INgasN
	1XptolWAOeqG8HyrH4B8MJ7ltGfx2HVXWw/IeBFuqemRbFKzCmvGTxSpI7JOHvS5
	32clrY+4/qLQaxfo4e712iDZu2WNi/17hsLBoVV1l9YxzbeEAEmG/CBNLigU/ic3
	eHOFOOVvSjbvJhtpPvxnzD6RKyi3I3M+JMono0gmYcD96rZZqTwB+pyqNx30WpAb
	lP5wioFkbhl7tCCxAxMUQ9H82vfdygbqSkK4MgSAcdyIcm1Pf0wvsaQN+1S4fphA
	/HTt/rrt07Ymwp4phGKA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufutb3gg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Jul 2025 08:51:47 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56G8pkMC003852
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Jul 2025 08:51:46 GMT
Received: from hu-sayalil-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 16 Jul 2025 01:51:43 -0700
From: Sayali Lokhande <quic_sayalil@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mmc@vger.kernel.org>
Subject: [PATCH V4 0/2] Add eMMC support for qcs8300
Date: Wed, 16 Jul 2025 14:21:23 +0530
Message-ID: <20250716085125.27169-1-quic_sayalil@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=e7gGSbp/ c=1 sm=1 tr=0 ts=68776823 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=Ihs08mxtZF4EWRPjB5cA:9
X-Proofpoint-GUID: evbOKAPL0ZBY_UEiFShYECoFOPfWyXED
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDA3OSBTYWx0ZWRfX0c5zrLQeCztb
 m+lsbJUfL27hl5lhXohYMZdMnNsI/wm0lPCjQaMIloWED2+vli2zo1S6nkBn+XETFn1seoIHTma
 OBbMlP1mEOD7VH3AiN98SIxONTbTTx3y1KHjVn2IC8ULEIDGmgGpsy3CUSCTSTacKh3Za/AL/wf
 3v1NA82DLJxwFXAN8+IkN3PmmUPH0xNEH4yRGalcCxMIpQef0Tz54SpUHOCqspm8t9VYZn9ZRHz
 ZaeaOPYD4Dh7VLpeVCNhCV67QVt8oTa0qaCfUtwpyVJ+i39XH6oJFi242MtDHIOuMhlc2xIz9Z/
 Y+Xb17xUL/Iwc2On2YtYNXtubD4vnVIaRyQfNRu85Lnacp18xh0NkNO+hJtbLnFJF4XS6F6RADJ
 8RKQ6qcucqUEUrTbRdaTYUwHem9Mx79CcLEzDDWKDr4HvS6UmxzokX3DDwK5f+/L21ILd/fQ
X-Proofpoint-ORIG-GUID: evbOKAPL0ZBY_UEiFShYECoFOPfWyXED
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1011 adultscore=0
 malwarescore=0 mlxlogscore=554 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160079

Add eMMC support for qcs8300 board.

- Changed from V3
 - used correct name for SLAVE_SDC1

Sayali Lokhande (2):
  arm64: dts: qcom: Add eMMC support for qcs8300
  arm64: dts: qcom: qcs8300-ride: Enable SDHC1 node

 arch/arm64/boot/dts/qcom/qcs8300-ride.dts |  21 ++++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi     | 113 ++++++++++++++++++++++
 2 files changed, 134 insertions(+)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


