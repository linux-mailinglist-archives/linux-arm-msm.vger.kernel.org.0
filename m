Return-Path: <linux-arm-msm+bounces-71742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 151DBB41729
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 09:49:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACEC8189425F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 07:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDC182E2EF2;
	Wed,  3 Sep 2025 07:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f9MHhEzK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4678F2DFA32;
	Wed,  3 Sep 2025 07:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756885711; cv=none; b=BR9Daqtt6A9IyhsMJD7/+NRVk/5+HfZAZXRh5q8RGY3zFOJX2lDEhhFBAgmKBe+unIUGY0HcJhdW3l7H+WCF3rH1tFYLBLLax/7ht+zowGISmhw7JcvX9cxgQ8ToIQIwAPf7W13GcJtCaLnX65WnPu3N+mHtHYs0SUBm+H4cRtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756885711; c=relaxed/simple;
	bh=ekV89ztcUUM04r/EH7Ns10zAuWI+BWjAkTrTpxo9IgI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RxsxHkBs6Ils9w8VdVsWqbMad4h41i8ni1zg8VTptqshB9GmZJQl8qlHcL55DmPRU0fe15Rzmn+HPf8Muf3GTI/tLSNwTCU3I7RPo6Tgfv5qvCKNlDG0TjYxBGPhBtmMJpiH0AMB4XnOVQhJCKy/17mc+uroxPVKTacz2o37mCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f9MHhEzK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583226mj010160;
	Wed, 3 Sep 2025 07:48:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=c6gSvhUD4QNOxBE8w00jNIVNkEQ2p6oZEqB
	J+wRDybw=; b=f9MHhEzKouQiX1yHrGorPCNfKFxhJhw4L66DLnL6ukqxmxiSkQ0
	ZuJdhfaaqUMA1H6DwR83PIy6wV8qk8/h++ixMwUtBeib56LACs6d8pnJIPVIDjmK
	CbE79yke9FDoS4juQ1c2w1Qbdjx9TwFtOfzVvHeu2vZTDOGI+387BvKvh+2qXXm2
	/4+OBP9N5z7bEohEl/kP+j88JEtZMg5WgUhYqILq0PxU55DlpGEm5zZ/bZFVRMo3
	4GAoPEXyWNtolGeO1arhRj/Rqt16DRpnamL3YIBKDiyQ0Hmz8O58pYoBpiUWJFiS
	30iT+GgtrDvBZjvlGvu5TJ8bcBUw+0UmpCQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0ejt9h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 07:48:21 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5837mInO002086;
	Wed, 3 Sep 2025 07:48:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 48utcm5cxy-1;
	Wed, 03 Sep 2025 07:48:18 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5837mHG1002078;
	Wed, 3 Sep 2025 07:48:17 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 5837mHCv002076;
	Wed, 03 Sep 2025 07:48:17 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 9C8C9600A0D; Wed,  3 Sep 2025 13:18:16 +0530 (+0530)
From: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com
Cc: krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Subject: [PATCH V4 0/2] Simplify MCQ resource mapping
Date: Wed,  3 Sep 2025 13:18:13 +0530
Message-ID: <20250903074815.8176-1-nitin.rawat@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
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
X-Proofpoint-GUID: qcFuh5dOQz_Jzh3-gWmqKzSmCWD2rWSp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX+9ZbaBfT8sbi
 E+qzfcQlWervnS5Yd0z1G0WZOKEQ/3kPPMLKDdmqItj+K4OGJRSxETyw80DMEe4Lmavh74Rq8S7
 8RhjqtrOtyaL5QcU/wMSi3pTgKFWa0HqF2iJ+dBvGupAoHf/KkZUDVveYqqDbYYs7Co3YHf/Z/t
 oq1X899Iw0tnpHy+Aay/aBOBp8vwwUmZz98blKIATPklK5R8FzlNqKEiisnujnJKZYT+0i/hgoL
 Gxa4Ghxf/TedCdZMTsR9NJxggVh0ZNYmeqzylX1RhW02SC/txK98u5Z97hdWPpuPIN9WlrqmThI
 VYVAB6xCu21H6rkpnPTOmuRLRIqDVAyft6Kpl7xEaayeXAuGQSYBcRthWfkmLoaJbXimDEmiJrH
 FIsA1G8u
X-Proofpoint-ORIG-GUID: qcFuh5dOQz_Jzh3-gWmqKzSmCWD2rWSp
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b7f2c6 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=wVAk1EbIBTWD6_sQaNMA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1011 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004

The patch series simplifies the UFS MCQ (Multi Circular Queue) resource
mapping in the Qualcomm UFS host controller driver by replacing the complex
multi-resource approach with a streamlined single-resource implementation.

The current MCQ implementation uses multiple separate resource mappings
(RES_UFS, RES_MCQ, RES_MCQ_SQD, RES_MCQ_VS) with dynamic resource
allocation, which increases code complexity and potential for resource
mapping errors. This approach also doesn't align with the device tree
binding specification that defines a single 'mcq' memory region.

Replace the multi-resource mapping with a single "mcq" resource that
encompasses the entire MCQ configuration space. The doorbell registers
(SQD, CQD, SQIS, CQIS) are accessed using predefined offsets relative
to the MCQ base address, providing clearer memory layout organization.

Tested on Qualcomm platforms SM8650 and SM8750 with UFS MCQ enabled.

Changes from v3:
1. Addressed Krzysztof comment to separate device tree and driver
   patch independently in different patch series. This series caters
   driver changes.
2. Addressed Manivannan's change to update commit text and remove
   redundant null check in mcq code.
3. Addressed Manivannan's to Update few offsets as fixed definition
   instead of enum.

Changes from v2:
1. Removed dt-bindings patch as existing binding supports required
   reg-names format.
2. Added patch to refactor MCQ register dump logic for new resource
   mapping.
3. Added patch to remove unused ufshcd_res_info structure from UFS core.
4. Changed reg-names from "ufs_mem" to "std" in device tree patches.
5. Reordered patches with driver changes first, then device tree changes.
6. Updated SM8750 MCQ region size from 0x2000 to 0x15000


Nitin Rawat (2):
  ufs: ufs-qcom: Streamline UFS MCQ resource mapping
  ufs: ufs-qcom: Refactor MCQ register dump logic

 drivers/ufs/host/ufs-qcom.c | 174 +++++++++++++-----------------------
 drivers/ufs/host/ufs-qcom.h |  26 +++++-
 include/ufs/ufshcd.h        |  25 ------
 3 files changed, 85 insertions(+), 140 deletions(-)

--
2.50.1


