Return-Path: <linux-arm-msm+bounces-63426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A401AF5C78
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 17:15:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2CA84E3633
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 15:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B606030B988;
	Wed,  2 Jul 2025 15:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OdRblgbu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282332D3732;
	Wed,  2 Jul 2025 15:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751469309; cv=none; b=djoPLHp7JVZe6z6JbP//6YyE2Px1SZFBETRpTtjJ1oup03yiXT5xZg06gwukR+OzwoWE04aqm1eKVYwpHlwR7KUgjQpfSO97z+g9c1KPgSlpSjt88iMs4jGdtB2eXia0Yt7gGlPtJWjQM8oo2uKWzhKSkNB5PsmYo0rgLLUQtqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751469309; c=relaxed/simple;
	bh=prmkReR6X1rCikz/4fQYls8Mi+PLZqThIUT9KBwDeAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SSVwEVRqZ/yKKA8Czk6WjYF+mXPAsh0zeXT5jOIgEXROHsBSaSnHCBZSwgwWFoK3riJMbcnOT0fpqi/T4YU35lbZKJ7ZZK0KoUWx3F8Et6wDSlVJ2vYHhYX6Oxg++bCwWVDYaMbiA54IPTwPE/uuGMn6sMYAg/jUhQNjK+dBUcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OdRblgbu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562Cnmkt000438;
	Wed, 2 Jul 2025 15:14:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=weRgXgF1Sp0
	jgbf+58a4kZnYiwE5HpWdmMJIJ85haTs=; b=OdRblgbuU3dsEr7ZrrGYMka7mqz
	WZUtJ4gUiDbdBJzbYWLcop9L+ElEh2EilPubcrv7oreGwyyFSTGtjrP5iMQdmhzL
	sY5w7vpc17ur3XXupND30qJiN86ejYIem5DUTro7DbPqELXeJXTxN9z0+e5f52WR
	S6OVhY0WTnOSexYkySl69N9uLzcSEBqIl+O+JKuAlg4EUkTaXraVgn0i1By3BcTk
	GQk5uQq2HLyvkwMEm++Z9MNMX7sN57iF6pNAXlibIC1RyOqtUgPIY66MpZWL5/zb
	r0RImbjNmHWb2TtwkCrsitf+TG7PTny9iEyzyqnmUR9QmmkrlPr1D3s13nQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qmd0np-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 15:14:47 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 562FEiYm025526;
	Wed, 2 Jul 2025 15:14:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 47j9fm57ps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 02 Jul 2025 15:14:44 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 562FEh9c025517;
	Wed, 2 Jul 2025 15:14:44 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 562FEhbk025516;
	Wed, 02 Jul 2025 15:14:43 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 3777B61C6C6; Wed,  2 Jul 2025 20:44:43 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, bvanassche@acm.org,
        neil.armstrong@linaro.org, konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, "Bao D. Nguyen" <quic_nguyenb@quicinc.com>,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V1 1/2] scsi: ufs: ufs-qcom: Update esi_vec_mask for HW major version >= 6
Date: Wed,  2 Jul 2025 20:44:40 +0530
Message-ID: <20250702151441.8061-2-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250702151441.8061-1-quic_nitirawa@quicinc.com>
References: <20250702151441.8061-1-quic_nitirawa@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=68654ce7 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=lUlEUqtdP5ObSgJ12z0A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: DiFRwVAK-WZZchm57VRzkzAMpJw_Bq_G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDEyNCBTYWx0ZWRfXy1v/fR/1jKFu
 tgmfivri7AIyVK99hSHVisgAFxvdrz3Xoj+K2bsGjBJQUlnD1gEGVk+UU19N5qQzcOb+jdcX4aL
 4AdhFH240OQpuYqzldcgsWr69mRk3PfTJyhWfrRrnPIfW28qhhf0ZMCMMrZcu4AAgamTLOJmq+v
 yRxYrBi85pTCcwE0WiY1VP8JiAbGx/z3mmkiV9rp5dtttnh7SmemFm0Df5w5On9mBOwAaqYNYHr
 EWAcWqvEnfDe9hrCiFnsNPDnPoJHjpoWd17NuoPajrG7Fo6RCWZh1CQSDzF+JVYTOxtJmVAwfce
 qXnPqUVR60qxamUzfS3QUs/2KjG4POdEhQWjX9MVgnYt3EHp//uSQG2HhHE0GroVuNHRDCJ4eU/
 oX4CsC4YkLM+A8JVNhJaZPcVGhZ9+LP9Hh3zoX36rQTXZlln3KNZ9b2nY8643tvYBk8f9+qs
X-Proofpoint-GUID: DiFRwVAK-WZZchm57VRzkzAMpJw_Bq_G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_02,2025-07-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020124

From: "Bao D. Nguyen" <quic_nguyenb@quicinc.com>

The MCQ feature and ESI are supported by all Qualcomm UFS controller
versions 6 and above.

Therefore, update the ESI vector mask in the UFS_MEM_CFG3 register
for platforms with major version number of 6 or higher.

Signed-off-by: Bao D. Nguyen <quic_nguyenb@quicinc.com>
Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 318dca7fe3d7..dfdc52333a96 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -2113,8 +2113,7 @@ static int ufs_qcom_config_esi(struct ufs_hba *hba)
 
 	retain_and_null_ptr(qi);
 
-	if (host->hw_ver.major == 6 && host->hw_ver.minor == 0 &&
-	    host->hw_ver.step == 0) {
+	if (host->hw_ver.major >= 6) {
 		ufshcd_rmwl(hba, ESI_VEC_MASK, FIELD_PREP(ESI_VEC_MASK, MAX_ESI_VEC - 1),
 			    REG_UFS_CFG3);
 	}
-- 
2.48.1


