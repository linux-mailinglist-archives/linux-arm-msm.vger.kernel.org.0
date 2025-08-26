Return-Path: <linux-arm-msm+bounces-70908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB12B36D5B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 17:13:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BFE81B614C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 15:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6117C270552;
	Tue, 26 Aug 2025 15:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SuKX6X7L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A0F26B2D3;
	Tue, 26 Aug 2025 15:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756220975; cv=none; b=h4W+phTBIS7LrQ/8dibqSiLvAAXjT7R8H0PGtzqSjKcMy1QgdQ+dXMNJBvqdYbCIro5iFAKvb5FO5023BnihZBSS7KVO38h3qgyPdYxFqrh0Xig+bFiAWRnG4dffPcZMHMW6hxtY6v0mIuZ7nR2mah7I8eHo+71L2WIB2H2Tasg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756220975; c=relaxed/simple;
	bh=LiRm3JnD7zV9uP2ebUl5C1ABnohC7yc8bPjlcK/S+lQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=o0CHeoB2lCbA5+YLAyMAdMCFXV0AH0s6HmBj0d/vYB8qfIzgYWUTyCLQdWlk1/KhWVC+GUEt45GYKRCsLk7YroaSh5I5H8/yzGgEby150B19lJofMAPKBKFrGGoNUAedVh0sDoiFiXogizf4STeV60cKDzmKYQ5Mo/Lf+1fkY58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SuKX6X7L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QCe1Wb007038;
	Tue, 26 Aug 2025 15:09:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Dhpj00zvXPBTW/6EgUMMHu
	oUwMjPOdfjlJh+IsuagMg=; b=SuKX6X7LBhbH7y6M/yEYKgQzWtSKbdSg+MSlbW
	jM4pGMZ/NHgjnD3sCkHbXB1Dc1pLJlGDVcMl/c7uFUkfLVcBGsGSz7ncCr84xBgz
	BM8maQsoThlMmM4Y+4DoeFmCBIt4AnFW2RcBz85AJpoAL+zPelUcO9TBUWdyTQEV
	7J278ODfuT0YR/J0x97gy1VdLFza9F57MaOs90Wh1Luq//kThOzmTMfZe+apX3aH
	WugCRhh51q/mzobnVaf9Cgw2sy6kMdS4h9UXRsrE3XYxcoebgOvyjLaqXpHXSpqQ
	DlZFmLdqOVa6vdnj3JDWpROPmXG6VWOS9+JCinl1cjDety1A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5um9cjt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Aug 2025 15:09:14 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57QF9DlB021228
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Aug 2025 15:09:13 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Tue, 26 Aug 2025 08:09:08 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <alim.akhtar@samsung.com>, <avri.altman@wdc.com>, <bvanassche@acm.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mani@kernel.org>, <James.Bottomley@HansenPartnership.com>,
        <martin.petersen@oracle.com>
CC: <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH V3 0/4] Add DT-based gear and rate limiting support
Date: Tue, 26 Aug 2025 20:38:51 +0530
Message-ID: <20250826150855.7725-1-quic_rdwivedi@quicinc.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68adce1a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=G5li5t1DEtNkI_zgAAMA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX5/zLzjm6Ptq0
 hPxu8VCvxR1DieFLNyQiyE5uXj9Ums1CtgV69gk8nme+DNTNdun9fu3qFm4mg7y0pIkzy8V4eWf
 0VapOKga20QlOAR5Pbi2xq1leq2XDexWPtPTD4VKn4Rpm2L1qGPsvJtSqfiwJx8PYh898m/E4JE
 EHMmTbHc5gOuPTXPEO7c5ZJPS7CcI9rFTvPb4eyQYOq5/7l1HMkzdoWaPNq4k90HkTdj+ZIEpa+
 OKlNFP3QZkI6/az7s4mfKkFrTzK2N2GlPtFCMZa12TzvUHcho9tXbuU2IgWamZHfT6YvT9apT4Z
 khNIq9KdHAu3WlkrtY7GnbX7sR2miAhzFJfIF5jYZPvVSDzIanQDM1y1ptj3EcpDC8bykm3/slr
 NexSp8My
X-Proofpoint-GUID: POur-VShFsNzTrSIczxdzRy86C5f_kYH
X-Proofpoint-ORIG-GUID: POur-VShFsNzTrSIczxdzRy86C5f_kYH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032

From: Ram Kumar Dwivedi <rdwivedi@qti.qualcomm.com>

This patch series adds support for limiting the maximum high-speed
gear and rate used by the UFS controller via device tree properties.

Some platforms may have signal integrity, clock configuration, or
layout issues that prevent reliable operation at higher gears or rates.
This is especially critical in automotive and other platforms where
stability is prioritized over peak performance.

The series follows this logical progression:
1. Document the new DT properties in the common UFS binding
2. Clean up existing redundant code in the qcom driver
3. Add platform-level parsing support for the new properties
4. Integrate the platform support in the qcom driver

This approach makes the functionality available to other UFS host
drivers and provides a cleaner, more maintainable implementation.

Changes from V1:
- Restructured patch series for better logical flow and maintainability.
- Moved DT bindings to ufs-common.yaml making it available for all UFS
  controllers.
- Added platform-level support in ufshcd-pltfrm.c for code reusability.
- Separated the cleanup patch to remove redundant hs_rate assignment in
  qcom driver.
- Removed SA8155 DTS changes to keep the series focused on core
  functionality.
- Improved commit messages with better technical rationale.

Changes from V2:
- Documented default values of limit-rate and limit-hs-gear in DT bindings
  as per Krzysztof's suggestion.

Ram Kumar Dwivedi (4):
  ufs: dt-bindings: Document gear and rate limit properties
  ufs: ufs-qcom: Remove redundant re-assignment to hs_rate
  ufs: pltfrm: Allow limiting HS gear and rate via DT
  ufs: ufs-qcom: Add support for limiting HS gear and rate

 .../devicetree/bindings/ufs/ufs-common.yaml   | 18 ++++++++++++
 drivers/ufs/host/ufs-qcom.c                   | 21 ++++++++++----
 drivers/ufs/host/ufshcd-pltfrm.c              | 29 +++++++++++++++++++
 drivers/ufs/host/ufshcd-pltfrm.h              |  1 +
 4 files changed, 63 insertions(+), 6 deletions(-)

-- 
2.50.1


