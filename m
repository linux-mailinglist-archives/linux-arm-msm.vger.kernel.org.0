Return-Path: <linux-arm-msm+bounces-70125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C9EB2F501
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 12:17:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D56AB1C284D8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 10:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 328A12EFD97;
	Thu, 21 Aug 2025 10:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oaT58RzG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D952F0C40;
	Thu, 21 Aug 2025 10:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755771404; cv=none; b=u8EUc93a+nCGYv4F+nxPpDxoRJoS1EpaLKo2NVulF3CZf451NPfGrOnZxt9GyOC/KZlnXyONBV1+On9pHJ7o6lV8Rcqkb189mK9kQ1L+7panZeNADlcQp0rBS6OlHaj6gTf+S5AmzOW/wHdXnHZUCCQSSXC8o6SYmGNL3y67vxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755771404; c=relaxed/simple;
	bh=sfAhUgeS5s0r1RIkkZlzAowK+T0GKo6mu/F3FrB2y+E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LxxhluDLs7oBG8Q0bn6inqYnwUMfE+ttUlAHfbRFBTgqz/KE321s1+C48aAJdWktmYpjR/iJVEkeiRIhT61NacDbkmlG+abowRgHDY3Sb7fhpYpalaLiQskvwufHRw4k85Sbb0QwrUkSRpoM4LRJgOJsxWbCVpr1++W98Q9hTe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oaT58RzG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9b8X4003637;
	Thu, 21 Aug 2025 10:16:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xO17CGSm7MfGPLbc4UydaG
	gv98jwTBkBtyeXnZH5mNA=; b=oaT58RzGkEi9hR0KRRk78qOkPi9TZdrtGoOYus
	wY3ulim3+n2SsZS4h6kc7BSwfhwtv/WX/iaoxKUs08UN6k4TKscWjrKJn7UGxQSL
	qpHcIgQzW5eH4+Q/KSHcCHz6StuqG2YER5GYhuct+lHGj0oDVLxVa8bqErAvqCok
	CuJeeoySJiWC/J2PZOHImwHJjwjqHmq0KAx6ddpHVenERK/oPZSInb8oBc7CjAhm
	//OjGgM+iDlYxGuPNiOmfOwCeDbDDedpzKXV+xV8k+p69KwzftKFqvg1kx6R0aQ9
	sLpvWhiyUok5q3IxMlD6dgVhUVZpxW46pmOV6bgs0Qx1ZC5Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ngtdjvtc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 10:16:30 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57LAGTkj014313
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 10:16:29 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 21 Aug 2025 03:16:24 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <mani@kernel.org>, <alim.akhtar@samsung.com>, <avri.altman@wdc.com>,
        <bvanassche@acm.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <agross@kernel.org>,
        <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH V2 0/4] Add DT-based gear and rate limiting support
Date: Thu, 21 Aug 2025 15:46:05 +0530
Message-ID: <20250821101609.20235-1-quic_rdwivedi@quicinc.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=LexlKjfi c=1 sm=1 tr=0 ts=68a6f1fe cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=P4RA78Fcj83t06hIkt4A:9
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: xC_B_8Q-S0mhTOggwtpkYcu8Q7z-ZaEN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEzNSBTYWx0ZWRfX6sVydOZPw2en
 jcnaZ7tOwwS/UkhVVqO6iJ1MIKe+TnI4su/aQ7n8Lzq+LivQ2GYpf4eJndY6b9N3xca5LQDn4Dw
 fH4b3oBmNpQvT31Jzvnl1jajudBxm/JAzLmhJC6J1nFHJ+K5YkRiQq/Zf2qsv2DyXzlSX2DrQo3
 1A+vlZW7OBVgRCTx2nbyFsHCVYpAh+pKhhsTvDgjaFiQZSD9KZT8wsYs38uEtYbXMPGO+3MWa8A
 3n8Xi84zx+wT9IT6ND+wPZ+STRiBRSvpPMQTn2/WzBS02ANkqhyuFMNvk3GaBziBycxSCLbKeUy
 IJdHMeiUsGC6lLDxDk11U+ZxxJI+kGrLn1mFziNwd0h2RLmOi2YsxMDYa1a40Ew7+4o3Uj4SEm4
 xfLfow0NL0iRRNUeP1m8zijXV/losg==
X-Proofpoint-ORIG-GUID: xC_B_8Q-S0mhTOggwtpkYcu8Q7z-ZaEN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200135

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

Ram Kumar Dwivedi (4):
  ufs: dt-bindings: Document gear and rate limit properties
  ufs: ufs-qcom: Remove redundant re-assignment to hs_rate
  ufs: pltfrm: Allow limiting HS gear and rate via DT
  ufs: ufs-qcom: Add support for limiting HS gear and rate

 .../devicetree/bindings/ufs/ufs-common.yaml   | 16 ++++++++++
 drivers/ufs/host/ufs-qcom.c                   | 21 ++++++++++----
 drivers/ufs/host/ufshcd-pltfrm.c              | 29 +++++++++++++++++++
 drivers/ufs/host/ufshcd-pltfrm.h              |  1 +
 4 files changed, 61 insertions(+), 6 deletions(-)

-- 
2.50.1


