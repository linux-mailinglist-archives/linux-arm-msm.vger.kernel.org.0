Return-Path: <linux-arm-msm+bounces-30461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 454859693D2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 08:37:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B8A7EB207AF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 06:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C8D41D1F63;
	Tue,  3 Sep 2024 06:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Z1mYGaP8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0982F2E3EB;
	Tue,  3 Sep 2024 06:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725345451; cv=none; b=gkE4qrBLC3zOCX6EgOvs6uX4Wp7DuG6lEcvWLkbDtVVsu7I1eTNAaLz0M9NSKHIHzRKfmpc6j1Hh/dHy0fLO2GO8grm9dQ+u8t4limj3Je9id1rffr7m+nk/g3Qpak4FZUVH8/CgNvTyUbu4PrCGkUWpmCTDSttV9Sd1HTAYMUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725345451; c=relaxed/simple;
	bh=Vb2ayZcxVYJI7Oj9Q+AdxHY/5Iq8m3iAdvArdzNkNEo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ujJH4BaAVIaGdPJ6WtNpDnntnYunQKXM9C9N7KKP72T+OMQ0wSUxhT/8HfZJnbrnOIDiAOE7Jb2RBydiU33ElTUPpNf/lgjhg7Y8GgRElMI6nWSYNQ4z88US0k/2VRI3PcgcMHQrY2DKXcZiorFmxi5d0q36YKPkoGYrgNPFalI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Z1mYGaP8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4831LiJs001041;
	Tue, 3 Sep 2024 06:37:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=oiQkwmuVOshle+cB69tX4B8eAUbAPjYvOD/Pld37iA8=; b=Z1
	mYGaP8QwbPi5x3Tpsx1W6CRz2qSAQCz9uTeRC9KLJZcl+FFqZpREVAr4EZVe7dvE
	jfZ7fuB1cnqFt0CSAg3rL1uEscPLEQwtFY/y3O7GqmkIpXUf2X6hNpLVjuAth9bJ
	UETIErKw26rm7CWS5cApZw+v2qQU80qCUgRaSo6kCL9ZjfHFZa9nmFg/kIzQtwQA
	0gngKO215hgeA7aNMTLE2SAcfjXLzZPYIxhxpXVuVRQXTmXecbpMthyj24xRYbRf
	0+9XNU6RfYmjSHYbbuduDq24JxQU9fH1wZSDJQg+SH3+ecOR0Gs+OsR48K5NsTcB
	fYPjQfKCAfMrpb7OmwHQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41drqe0j1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 06:37:26 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4836bOuj008257
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Sep 2024 06:37:24 GMT
Received: from hu-mapa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 2 Sep 2024 23:37:20 -0700
From: Manish Pandey <quic_mapa@quicinc.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
	<martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_nitirawa@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <quic_narepall@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_mapa@quicinc.com>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>,
        <stable@vger.kernel.org>
Subject: [PATCH V6] scsi: ufs: qcom: update MODE_MAX cfg_bw value
Date: Tue, 3 Sep 2024 12:07:09 +0530
Message-ID: <20240903063709.4335-1-quic_mapa@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OZ4-rYUq8lpixTI0qUy7JQKqfkJI7qzF
X-Proofpoint-ORIG-GUID: OZ4-rYUq8lpixTI0qUy7JQKqfkJI7qzF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-02_06,2024-09-02_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2409030051

Commit 8db8f6ce556a ("scsi: ufs: qcom: Add missing interconnect
bandwidth values for Gear 5") updated the ufs_qcom_bw_table for
Gear 5. However, it missed updating the cfg_bw value for the max
mode.

Hence update the cfg_bw value for the max mode for UFS 4.x devices.

Fixes: 8db8f6ce556a ("scsi: ufs: qcom: Add missing interconnect
bandwidth values for Gear 5")
Cc: stable@vger.kernel.org
Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
Changes from v5:
- Updated commit message.
- Added Reviewed-by tag.

Changes from v4:
- Updated commit message.

Changes from v3:
- Cced stable@vger.kernel.org.

Changes from v2:
- Addressed Mani comment, added fixes tag.

Changes from v1:
- Updated commit message.
---
 drivers/ufs/host/ufs-qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index c87fdc849c62..ecdfff2456e3 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -93,7 +93,7 @@ static const struct __ufs_qcom_bw_table {
 	[MODE_HS_RB][UFS_HS_G3][UFS_LANE_2] = { 1492582,	204800 },
 	[MODE_HS_RB][UFS_HS_G4][UFS_LANE_2] = { 2915200,	409600 },
 	[MODE_HS_RB][UFS_HS_G5][UFS_LANE_2] = { 5836800,	819200 },
-	[MODE_MAX][0][0]		    = { 7643136,	307200 },
+	[MODE_MAX][0][0]		    = { 7643136,	819200 },
 };
 
 static void ufs_qcom_get_default_testbus_cfg(struct ufs_qcom_host *host);
-- 
2.17.1


