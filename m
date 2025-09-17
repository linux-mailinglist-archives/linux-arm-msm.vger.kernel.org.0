Return-Path: <linux-arm-msm+bounces-73950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C0BB7FEEB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 16:23:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E4C97210E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 14:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5B422EE608;
	Wed, 17 Sep 2025 14:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="o0fleYSH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0453E2ECE8B;
	Wed, 17 Sep 2025 14:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758118244; cv=none; b=H2MdU3W8lXEMqCZWNNUH0yuFoBn0Fjt7S9OXnoN68IYapQqRE0MFOY5N12yPrT0sXqxeovfOb6rMKw5UTMe6JZRtj0Xt0u9ecbcf9qXMx0sxbnBp97xxjDHusVhrCdOSFNsTKVbWEQjhbLta5sXU/LLAqvuTaq91zJPrsl0SogA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758118244; c=relaxed/simple;
	bh=HP9F9zjq21nomiT1DVIth8OcFE5ruKihf3AGjzjeJy0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=r9zNGwiob/zNq1+qS3k2tK9sYOXSGd0X+8EuSJ3xTAxrrc65ypfUO0WoSDsqqwM2LlhXZ8bt051RZle+lEI4nWKL5JoyaRAk4W830CgfM1AyUxnI+ulpaSWW4INJztpHn9f24K3HsduiO4lijgWxa8e2TByWgmWZ6jlaMe9WOMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=o0fleYSH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H8XXbP029815;
	Wed, 17 Sep 2025 14:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5SpMzJMoQy/74W3vMdO+Az
	y73eeIeOlyZzSCwwTNEDU=; b=o0fleYSHYyYtUs64QGPS1xSgbxzMpniqlVdIX2
	5sEZZRWpbAMn/bYBUK/IsIdZdgn+vt3bRmP6wO0xVFpwm7xt6AHtqFU2LK6PYe0s
	CPofwEqi5cP1yhCDLWPY7M5RaB0NEzGiNZCy8UDafww+68J8eZZ4eYJaQdMCNWqm
	0/R96VgxWhYXKKHw5/yCM8j0BynUgtreFyFXsgmoo/OTlAt9ArTznc3TXaBnBE/P
	h6sAyrh4HBjN63WMuXq1Zz3CPSJ61U5vkSM186CyBTA1sGU2oAfuuj5NrntEtw+P
	rSaa1/KUGfmfdabVLkf8BJMt7CR/jyo1/v4s5rCKT1XTDT1A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxxjnbp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Sep 2025 14:09:57 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58HE9uQ9009608
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Sep 2025 14:09:56 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Wed, 17 Sep 2025 07:09:52 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <alim.akhtar@samsung.com>, <avri.altman@wdc.com>, <bvanassche@acm.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mani@kernel.org>, <James.Bottomley@HansenPartnership.com>,
        <martin.petersen@oracle.com>
CC: <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH V6 0/4] Add DT-based gear and rate limiting support
Date: Wed, 17 Sep 2025 19:39:29 +0530
Message-ID: <20250917140933.2042689-1-quic_rdwivedi@quicinc.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXzNQNt1F8YA9/
 qdY0fSPLD+oOUvCziZdIwXR4sXynoB+mbtiWahmjkd2oYksJxe1LFfVTp4ZAtdgLG2NNewJQ20i
 evuCAOPsIbrPEvC+V4kMsByFtC8yoL92VHibRtVUWXTMhtWbWHIbxHMRJ1E9hcfZ8BGO9nfM8w0
 bzIFmc0SJb328zXSFXlUBSHtYLmJJZJP+VuCW8KAbznRIbehrBpPKgJcoU76sITa/X4jNpplirz
 o/1JRAf/QcibUcp9sEikHto8k9/Mx2/GL5i0MmndtLsspekcHfV+vhQ/dlR++F44E2vFumR4iVY
 dIS//+zA8KbYCm3uzsnp/WBzlNWLs5hhqu5lHYHhK6tzC28deA4m3PDgGjlTBWG81H+LGTLpGMs
 7GQqO0Hp
X-Authority-Analysis: v=2.4 cv=MMFgmNZl c=1 sm=1 tr=0 ts=68cac135 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=hD80L64hAAAA:8 a=VwQbUJbxAAAA:8
 a=D9ZzSPnpY26cw3B9TzwA:9
X-Proofpoint-ORIG-GUID: qwztJ006OZlCzZneo8NXVqWvKTuRfMTq
X-Proofpoint-GUID: qwztJ006OZlCzZneo8NXVqWvKTuRfMTq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

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

Changes from V3: 
- Changed limit-rate property from numeric values 1 and 2 to string values
  Rate-A and Rate-B for better readability and clarity as suggested by
  Bart and Krzysztof.
- Added Co-developed-by tag for Nitin Rawat in 3rd patch. 

Changes from V4:
- Added the missing argument to the error message while parsing
  limit-rate property.
- Updated the maximum supported value and default for limit-gear
  property to gear 6, as per Krzysztof's and Bart's recommendation.
- Renamed Rate-A and Rate-B to lowercase (rate-a, rate-b) as suggested
  by Krzysztof.

Changes from V5:
- Updated device tree property name from "limit-rate" to "limit-gear-rate"
  to improve clarity and consistency as suggested by Alim Akhtar.
- Renamed function ufshcd_parse_limits() to ufshcd_parse_gear_limits()
  for better alignment with its purpose as suggested by Alim Akhtar.
- Renamed function ufs_qcom_parse_limit() to ufs_qcom_parse_gear_limit()
  for consistency with naming conventions.
- Added Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com> to patch 2/4.
- Added Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org> to patch 1/4.

Ram Kumar Dwivedi (4):
  ufs: dt-bindings: Document gear and rate limit properties
  ufs: ufs-qcom: Remove redundant re-assignment to hs_rate
  ufs: pltfrm: Add DT support to limit HS gear and gear rate
  ufs: ufs-qcom: Add support for limiting HS gear and rate

 .../devicetree/bindings/ufs/ufs-common.yaml   | 16 +++++++++
 drivers/ufs/host/ufs-qcom.c                   | 21 ++++++++----
 drivers/ufs/host/ufshcd-pltfrm.c              | 33 +++++++++++++++++++
 drivers/ufs/host/ufshcd-pltfrm.h              |  1 +
 4 files changed, 65 insertions(+), 6 deletions(-)

-- 
2.50.1


