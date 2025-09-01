Return-Path: <linux-arm-msm+bounces-71415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A6AB3EBA6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 17:58:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D423617B150
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 15:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FC792D594B;
	Mon,  1 Sep 2025 15:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NevggUdZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBAE1C1F05;
	Mon,  1 Sep 2025 15:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756742307; cv=none; b=ci6dOlcQAwzTVwZVj3G4xaY7TBPdysxA9Hdt91KLwl5ayeuHyYEydwMjKj9PVQpmAhKYjNH1BhUxZvQV5HysRe2h/+45+lWiQJwoHFPQlo7/VtKy1XR+jFWVm4WdwNoHeExbvh8SEkty9kMya0qngCXmy/y0/foAPardXT+jo2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756742307; c=relaxed/simple;
	bh=5jo+jH5ROgku+mraL+zpx7nXOX6GVnpDyJdlihi1SGE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SgrSfgJvTMVGSdkIaZb/T9O8WKmIJaFRjm5i1rZmGe4A3VeOE/LmHeu/EO8hSwlZOYFBA5qzYGeBeG11sq8Z8HW5zH5jGz2DQzWJG+8xP07mDSKOhdGaGxeQnZcR3AFT/8sDIYr6IN0zWFgt3U3VIPtuJySgo0hfJvVz4uPFVgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NevggUdZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 581B42U9016470;
	Mon, 1 Sep 2025 15:58:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XFJC1xZv2owkzrqKsJBOco
	m34IodyyWELb7xBcZojVg=; b=NevggUdZvzOU78DcozwlUkwRVtnHE7Y6ht9zx4
	O9BIVai17k1R8KkBMTkqI+ogWwt9dXHhQNjKY6JBxlxJtVBMHGe8F0tdmsItLAS3
	rkpLx7cBHZ3SQ4F8mLQ5zZn/q04aG9GZO5ECQTOC2l38wPm8623w0Pa6q8v2pyu1
	dZkL5stTKyxJmgCxgNEy2G7+a5wSsI6zoj6Nsh+DPaehcezEJTfHZLKWKEl41qj1
	kLhpHBV2nOjEcz+BILb48W45qix2io6QdkNqoI52hQUBjS17DycbJ9+T4+y268QS
	CddijrCYrlQ8pJCMPP171/IU27OB9vd6ccwrZ9v/Xp6JxiNQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush2w6xk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Sep 2025 15:58:16 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 581FwFS8013167
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 1 Sep 2025 15:58:15 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Mon, 1 Sep 2025 08:58:11 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <alim.akhtar@samsung.com>, <avri.altman@wdc.com>, <bvanassche@acm.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mani@kernel.org>, <James.Bottomley@HansenPartnership.com>,
        <martin.petersen@oracle.com>
CC: <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH V4 0/4] Add DT-based gear and rate limiting support
Date: Mon, 1 Sep 2025 21:27:56 +0530
Message-ID: <20250901155801.26988-1-quic_rdwivedi@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfX+iHaYOpvc/zd
 /9HQKrOLOgmbGcxezceJN80kGzTodaPyPmQ0VAHoaaTxv7Alh4eRs1ABGXdCrHZ7CA85Azs6Ayi
 cZtRGoO1V1T6mdVkHpadb0E2EhkK+skdi5R8CY3jqKXnuJrlfq2lsIKp/tnLKSVTVCfQjTF+4+u
 mbdotIR085RCGdGdXVtjMGecbCnfDVaTgCxUWFo9/nSquASkIO147pH0HOn2LUXcQ+xX2J8OygZ
 x+8VgWz2Z9fWTJWj1PaAjfuHdQcIY1kztnuHofAmEo7P+wKmfj2raQpvMhTBXTxLVFTLX/5sH8Y
 ptU/97epAB0tqKhbRk0e8jqoVqz2vCgbBPCGCFAyAdI6lMocBynw5lGkiZzb6j+nkJ9erO9jerj
 JS+FCt+V
X-Proofpoint-ORIG-GUID: q04d7wl-rH4vcCep-SzRrTCSZeHmBVO5
X-Proofpoint-GUID: q04d7wl-rH4vcCep-SzRrTCSZeHmBVO5
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68b5c298 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=G5li5t1DEtNkI_zgAAMA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032

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

Ram Kumar Dwivedi (4):
  ufs: dt-bindings: Document gear and rate limit properties
  ufs: ufs-qcom: Remove redundant re-assignment to hs_rate
  ufs: pltfrm: Allow limiting HS gear and rate via DT
  ufs: ufs-qcom: Add support for limiting HS gear and rate

 .../devicetree/bindings/ufs/ufs-common.yaml   | 16 +++++++++
 drivers/ufs/host/ufs-qcom.c                   | 21 +++++++----
 drivers/ufs/host/ufshcd-pltfrm.c              | 36 +++++++++++++++++++
 drivers/ufs/host/ufshcd-pltfrm.h              |  1 +
 4 files changed, 68 insertions(+), 6 deletions(-)

-- 
2.50.1


