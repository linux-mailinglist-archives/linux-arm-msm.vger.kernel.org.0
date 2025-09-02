Return-Path: <linux-arm-msm+bounces-71668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFD6B40AF8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 18:49:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4908F4E2009
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 16:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E55C30DD3C;
	Tue,  2 Sep 2025 16:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AXysRbc+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A80C22FAFD;
	Tue,  2 Sep 2025 16:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756831769; cv=none; b=onDXwQfKde5R1jtaaYbNige5cUsY8gDLq8bBRcGGT+S+MgjJmBvvYdPA6AU+Ul4f/Haasr5VofTlIQ4aHwr/TTudrqbsRaIeBvs4OzM8VtvDdb3Rjbp72DIr5lIivUf6GQ9sI3Cjs7xnUBGHXUKxvkSJQ7xZLCGRE0RvwXED8vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756831769; c=relaxed/simple;
	bh=oQFIN9AebsE8ST/ev5YRnLX78yfmp+RKTeCZkLug9iQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PijI33DVX7HBg9AyMF3lIzE4jiMkrt+SzH4EuOAWfD5nOapQ+KRhHpuQIg8wgefbwKpyR1HS0vmMKhXup9OzRAPZiDSEHi/YwrwwLrq5fFTVd+LkAL/gd3fqzewGo6l2DjAdsaVEMTs0jqGD8GORQY+OhSS181kdTrOSV6msPSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AXysRbc+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582EqCph021298;
	Tue, 2 Sep 2025 16:49:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sEg+xqBQJzXD93KUZNS98T
	1nBchCmrmi8D9BtDbXhmY=; b=AXysRbc+34QGwhrTEedFURYENmXN5wF5qLOK2+
	vQIKYVUShnfw0JYx+q/piUJchnTw1ZENI3D/O+i29Tiqh2RtgUVLM9H2WBKiRVHr
	g99KwikBsxwAOIXJEIp/WpIFEizwEcXLHPIz4UNXFVubHDX7/K2Wz6WsOW8BXb+s
	fzLg6y2XuFhhLZu7R8OvIaz/Z7bI7Tag6s1ovFb2Oseo6pN87N4TLDgoLLn58pRA
	B6GnTQ5Bw3lkY3eHmdMC1XZusfZPF/EsYH2WnhOsT4KRKRvllgqJmlUIlKh13r8c
	rLYajFZHnFTpisCtaihN3zWregOnP9d/tS6MhN7s1iz/DzJQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8s0np1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Sep 2025 16:49:14 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 582GnEih031536
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 2 Sep 2025 16:49:14 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Tue, 2 Sep 2025 09:49:10 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <alim.akhtar@samsung.com>, <avri.altman@wdc.com>, <bvanassche@acm.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mani@kernel.org>, <James.Bottomley@HansenPartnership.com>,
        <martin.petersen@oracle.com>
CC: <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH V5 0/4] Add DT-based gear and rate limiting support
Date: Tue, 2 Sep 2025 22:18:56 +0530
Message-ID: <20250902164900.21685-1-quic_rdwivedi@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfXz/3ITCz8kvOD
 JWGrDJNmpPr6KChRgwS8phZxWKc4VDb9hp7hYM7NGqBHxHHPwQJkOyCGT5nBCQbsemI838FEyOK
 J9Tdla9MECVkDD4nel/hWcxBdPfRaOLYz19xxc4y7OWX8wZOC83wOWLd9+kakFqita22P0MbzmT
 IsT/cD84wRvz3Qq2tK4nc0JNhjspv0nNoKk6Pn2Bg/cy65f5Zn5twOqXDuxvUa358qOQdAp4iR4
 d2UuWWu3BvLxn/PaJYpxYOqW/ehEfpYe1xLSX+FvOc5gnjeubUx5Wr8uSOO+PD6G1Lfq/If6/l2
 PRLUizYIOt/sqSA5htZGGUBFp2Hcpm5hJRladBjMQPhDLzzt6lxS07zt2gEg3KHM21uKZNGVfPz
 sN8SHxkK
X-Proofpoint-GUID: -IdNNT1ZeSewDzNSOX_bg1SNAyh3D8cH
X-Proofpoint-ORIG-GUID: -IdNNT1ZeSewDzNSOX_bg1SNAyh3D8cH
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b7200a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=G5li5t1DEtNkI_zgAAMA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019

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


