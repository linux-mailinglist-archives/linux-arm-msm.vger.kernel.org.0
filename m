Return-Path: <linux-arm-msm+bounces-63950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A001AFBD1A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 23:03:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FF191BC22E6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 21:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87176285C8F;
	Mon,  7 Jul 2025 21:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="A42x3HTs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E5727FB22;
	Mon,  7 Jul 2025 21:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751922212; cv=none; b=m7Y4e7rjHjxrnn1rH6t/2v4n1eUixZUUWxnlNkVnRT8/MH+QWqQsoc4dyOySv/d3/eIXEJ1fECKFhXFFENbI3jPydGAzqYKt+nuWnPc95SlFCM0xMWhOVeVsVOwaVOBP1xY57fQijbSAwH/jmVKK5yExwtbWYZkYd61p57JShRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751922212; c=relaxed/simple;
	bh=prmkReR6X1rCikz/4fQYls8Mi+PLZqThIUT9KBwDeAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cjOpBAGGn4It7iFWL3BFti5fq5J7zUPBk6beVROaAscRh/iDDRG+KxHwIE1Y8+9dnSPe7P6pTE/pZkPm16dUJyGWohJyRDsm9uwWiirr1vz6BdEo4ZbjaIdnVdCozLB8F4bzYZgD3OHckOZQ96ZwKMHMNjLMCax7yiLn4p95Fik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=A42x3HTs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567K94hD020968;
	Mon, 7 Jul 2025 21:03:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=weRgXgF1Sp0
	jgbf+58a4kZnYiwE5HpWdmMJIJ85haTs=; b=A42x3HTs+gnLKP3WsznfP6gF/hS
	FMkMxkiOydkRUBBdii/B0weSDZ6sS42tWHIi+63sQF0C8j5PHCIHUdKuvfxlsxA/
	RuRRESY2rVe+X+xRUvtu7tTHD2h671SyF6bShI6eb0COzXA5T0lLvf6EGW2mERyh
	So8r9+pNgvK2QqZTaqrOtIV63ofWuhj8BjbOZDRtsiZfsOmBUdpAZbZ443s92shd
	kjKZMmA2/zKVNN1pFMsVvI2aOKSjoAs4N69mIXnk0I4m+g2VXhezeRrBCF+C4rrN
	/BuJuCV7XSzJi8PjDDOKNFXltWwyBMYaBX3R/IpEZBhsvwiE8YkESakK4pA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvtkg4mw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 21:03:08 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 567L34fN015136;
	Mon, 7 Jul 2025 21:03:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 47pw4knn25-1;
	Mon, 07 Jul 2025 21:03:04 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 567L34pq015131;
	Mon, 7 Jul 2025 21:03:04 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 567L33bO015130;
	Mon, 07 Jul 2025 21:03:04 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 75E3857186C; Tue,  8 Jul 2025 02:33:03 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, bvanassche@acm.org, avri.altman@wdc.com,
        ebiggers@google.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, "Bao D. Nguyen" <quic_nguyenb@quicinc.com>,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V2 1/3] scsi: ufs: ufs-qcom: Update esi_vec_mask for HW major version >= 6
Date: Tue,  8 Jul 2025 02:32:58 +0530
Message-ID: <20250707210300.561-2-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250707210300.561-1-quic_nitirawa@quicinc.com>
References: <20250707210300.561-1-quic_nitirawa@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDE0MSBTYWx0ZWRfX9xvS1MDgA4Sd
 ckttkqQ1yB6wU3GnduDll75xlD3euY93Ek2GzBu+aIafSPcB0n+i0Kecn30LYJXspszA03WKkM5
 l7f7/ulkHEuH+BHoo0dQdLzmwHtgIBaGDLQYadstYdA5RTTGQxlZKKdGWPiwZ48wnN52YQK2cHL
 PewsaNKv21vRkk260dzLW9d9Gaqe5BzET7vrawBQ9ji/8NOJ5sZClbGSFNh+0dcV6OaxgId3QDR
 gFPkyMbUkT5gRXOWZkwhnqTjXq7dSiSYGCeTtRStt7WmQjyw3ZFJ0HFy65Jibngig8/l/kwUQx6
 KvRuAHLwzFctRNnFiBb83xB6f+je4sdubbAh7J3RgPmYqDJHxpwIryu04t5sjL1aeUKwnNwBBPA
 mSNhfdBgDkQI2tCuPrpKp+R661U01iYothDcz/8yRaXBwDvar1OZDxW9ENQXc5ANaZWFHNmK
X-Authority-Analysis: v=2.4 cv=Vq0jA/2n c=1 sm=1 tr=0 ts=686c360c cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=lUlEUqtdP5ObSgJ12z0A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: CJqGhgtGr1-x0Ao-QCoxHY5x0b7Sdbuk
X-Proofpoint-GUID: CJqGhgtGr1-x0Ao-QCoxHY5x0b7Sdbuk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_05,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1011 mlxscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507070141

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


