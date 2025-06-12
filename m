Return-Path: <linux-arm-msm+bounces-61091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30498AD6C0C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 11:22:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C82647A34CC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 09:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6B0C224B10;
	Thu, 12 Jun 2025 09:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="J9iywj6e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1A71DDC1B;
	Thu, 12 Jun 2025 09:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749720135; cv=none; b=HpgGJiM00Kgodi2Yd3NaHPf13tU08pBXbx/QraN0NGBOcrUYSkm5ASH5bG1RfVNtU9A42X1YPr/TsK1+XRFzyViGqZ+rpj2QLE7AaXYSkxls6P+nQwnsfj+/wM0wNHrhLXvw0X7YcpCsI7emEpKwAUFRG/YRjppZFXDC1r7nIMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749720135; c=relaxed/simple;
	bh=csdVaR13d/wScxApjumsCps0/lUheL7VO5t19sO1IxQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bIOq3rSPXp5+RNUAMhoTEAhvGzDlYZEftwWRl8NkD+iPSXYN0FRGo5objbJemGzYamUQOXpZWgBg9tVsdsS9JFcW7gX3qGZiirs3YE+mCDm5/8l4CHOPAnzmvVsGM4CfYPw54s00PD0hgGMD7I1IO/e8/itqelAGKzdL+tPKz/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=J9iywj6e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55BM9dPk002508;
	Thu, 12 Jun 2025 09:22:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=ddg27i+DGtDxyoqA+T6jMDHRlbegr4YcOVGp72z3dUU=; b=J9
	iywj6eKU2ncwZlulKf75MPFQTyrbzY1udcTNIMbnLwLeDRazY+Vi8Jl+om2Tjvtu
	vILnN3L4FTjLLjpQbvWUXWUkjP1m9o7K3B86ODmxy0M4gAAqORtcuWN7Ah7h2XWS
	PhsvQ68UyI8JsNCkh5p6h6DbBqReBvx9IGv5hddkTUxCBsP4zMl98jh50/6HudIJ
	ZmEhAWwnrZAmuoIeYi7+/vKCYMM1GvSaCoKLjnXWhr+uOGuZcfzRvqqwxVikaRXj
	fsT5okKfqIHnm8Wk3jtrr23Vi+fnTL4ta0gdrWBBp7ylT0VbVwxo/Cr9bF1XxVO9
	ja5A7VQRA9XOs9jDxIDw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 477jbphfqk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 09:22:10 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55C9M98f008176
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 09:22:09 GMT
Received: from hu-sayalil-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 12 Jun 2025 02:22:06 -0700
From: Sayali Lokhande <quic_sayalil@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mmc-owner@vger.kernel.org>
Subject: [PATCH 0/1] Add eMMC support for qcs8300
Date: Thu, 12 Jun 2025 14:51:45 +0530
Message-ID: <20250612092146.5170-1-quic_sayalil@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PcqWjn7XBugI1haU2i1Dcc7XWfTU3Avm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA3MSBTYWx0ZWRfX5zW8TNempoHJ
 JuEaQ+zaInoZBN7q11ek6rr4GZKS3K6ztsKPQv30WXYHiU65SM+967QxRW5a1tWVMV6qaa78gYR
 MJ9YABdALxGcVZBFiXCp66tfWQPN/6GyKOTu1iNIf/AstTCZAoTyq3NwYuHNLcC5SyapGz8xSWy
 KMmT6NB5v0CJJ0qh8uClt2Zw42hcFaTIz7LW60GfUGBrutOELxswTMm4w5x0tFM/9D4dlVwfmbb
 02rT/s63ZDQWtq7I0wW6GQWolMbhZvG0QT1VrMmlzw1ecHrMN8p1BvBTv9VxXGiaJramUAYsr5X
 I3IlFC9HFo6tUJO4UGBkYrMT7Z/8Z9yQob74tY0ggBjC2bggRRZ4T1glOGhMjckdplL7ozUGCLo
 tM4sRJ034jUdy30KrDZlNRILWLe8PPjU1UvWrNT0pif94eK/1fMZEGkgYzss2rNhZH0jGM5Z
X-Proofpoint-ORIG-GUID: PcqWjn7XBugI1haU2i1Dcc7XWfTU3Avm
X-Authority-Analysis: v=2.4 cv=OLgn3TaB c=1 sm=1 tr=0 ts=684a9c42 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=7Is_6JkwcPGrsfUxyFUA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_06,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 mlxlogscore=433 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506120071

Add eMMC support for qcs8300 board.

Sayali Lokhande (1):
  arm64: dts: msm: Add eMMC support for qcs8300

 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 33 ++++++++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi     | 97 +++++++++++++++++++++++
 2 files changed, 130 insertions(+)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


