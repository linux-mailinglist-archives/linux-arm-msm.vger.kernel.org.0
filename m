Return-Path: <linux-arm-msm+bounces-59016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B107FAC06C4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 10:14:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 114A47B6116
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 08:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9CBB2620E8;
	Thu, 22 May 2025 08:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TqYCmQGU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CE72638BA;
	Thu, 22 May 2025 08:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747901645; cv=none; b=iMQ7vxpGwEcQuGJqewDDDoxxeWkT6yC7Gl5As8oz5luOSALfG0UqVHVybtUPS0yg0J89kbNhFb7hrJckaDV2zGO/LPEBLagEdgCkYjmB9940R2ewCJQEiA7WcKholDJZx+HUo6sSo+ZGC+65G61zf6WCeuT2kVsTmGEFIgDkmQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747901645; c=relaxed/simple;
	bh=4mgw9km5mFpRuUTgNjBFlEkd7BF74iSHlGGWra4E0Iw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pB4wffo0v/XcQVyMUVkdgViTd5Y6Sz/SXz/9Mh2D46atlXbfDcFeEijLoaHGhxowfphgmfxqv4MU9UwGfrfRuH3wLixnPQhQa7Ej5zxLDR4QLpoBOeI7zs+MwyszJ2Y1IzwBqQSZtfaSPihHEmvHWktA/8c6nQwQFPfDKm7wOW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TqYCmQGU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LIk2ji027677;
	Thu, 22 May 2025 08:13:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=NKZ+l3nSbHSSSKMUKXCppXpZH2g1/C9wrFG
	L5jgW8Mg=; b=TqYCmQGURnW7LQ9Z9VK7VN0I/QXGSSq4HcWLNsqUFqHroRM5YR4
	n/ddJ9gxlkUVQpo11MGTahvGpIOat9oS4yqMCxLU+1HpUH35uOAti+BNgyToSYAH
	W3c062ZKosQX1T8YKqHY8CqFwfhsdc8XMzQH3SL8Hmk+e4v9DWZdlBsfd4mUOHAD
	Tj8nxoCFTVxQDpSts+1sRn1G7a+Ayxiwe7K91G4m99HlXJmgZIAdK3yPIy+R6o5w
	6v1odlte3VIICJNycZmwtqcK+VCnXhOYgau+Kolh5jBwXg0kInsIYRj8BkvT55wc
	c6aD1nPOUF1i78L+gVQCBHEpzniecPC8kjw==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9dgyw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 08:13:01 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54M8CwsH019012;
	Thu, 22 May 2025 08:12:58 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 46pkhn78m1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 08:12:58 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54M8CvFl018990;
	Thu, 22 May 2025 08:12:58 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 54M8Cv97018985
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 08:12:57 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id 0865140CAD; Thu, 22 May 2025 16:12:56 +0800 (CST)
From: Ziqi Chen <quic_ziqichen@quicinc.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com, quic_ziqichen@quicinc.com,
        quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
        quic_rampraka@quicinc.com, neil.armstrong@linaro.org,
        luca.weiss@fairphone.com, konrad.dybcio@oss.qualcomm.com,
        peter.wang@mediatek.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4] scsi: ufs: core: Don't perform UFS clkscale if host asyn scan in progress
Date: Thu, 22 May 2025 16:12:28 +0800
Message-Id: <20250522081233.2358565-1-quic_ziqichen@quicinc.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-ORIG-GUID: 9C0MC_UeV1nAxCF4HPh3PSWJnIC6D4b2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDA4MSBTYWx0ZWRfXwFnff2lWvPTd
 cCtojmX6uUUXDu8ZIw3La3i58J7d643YzsBgZVAHfF1+xbE2zoPP03RDhjalGZ7XP4DCYCfSt63
 /lIACkdAYDrqUhLO0Wp2VXc8dgtuE713YuxXF2jr5Hxo3NconHJJ+5FTEng7vDZB06Y7+4cS/OS
 tb2x+lzq/BXwJPJtvFMFs2tmFc9Gt9IwllG6GnVldnZ0kU7vlqc7N7Yh+hWC9bxLwLRCIEKqRZB
 KAWxxAYSoLXZeKDbEShF8jp0pmenmw+i0dUXI35VrpXGB7T7B7I6BzpJfTUnd4o2CNuLWDHXsxF
 yRgc81RlO78slhqJeGif1nzV88YvlXC18l8dNqlsQrnYte1F01r2V1UFRjAfFTRE5HrCWyR0RiN
 eklM/A2itjjLHWooBVjbVWEcJmtU+rk2KGNUKVLhWGMgYs4UJqwHcLYiqTkK2A7fhdpWdBmA
X-Authority-Analysis: v=2.4 cv=GawXnRXL c=1 sm=1 tr=0 ts=682edc8d cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=N54-gffFAAAA:8 a=2qWgUaWB3xuvrwrepqIA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 9C0MC_UeV1nAxCF4HPh3PSWJnIC6D4b2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220081

When preparing for UFS clock scaling, the UFS driver will quiesce all sdevs
queues in the UFS SCSI host tagset list and then unquiesce them when UFS
clock scaling unpreparing. If the UFS SCSI host async scan is in progress
at this time, some LUs may be added to the tagset list between UFS clkscale
prepare and unprepare. This can cause two issues:

1. During clock scaling, there may be IO requests issued through new added
queues that have not been quiesced, leading to task abort issue.

2. These new added queues that have not been quiesced will be unquiesced as
well when UFS clkscale is unprepared, resulting in warning prints.

Therefore, use the mutex lock scan_mutex in ufshcd_clock_scaling_prepare()
and ufshcd_clock_scaling_unprepare() to protect it.

Co-developed-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
Suggested-by: Bart Van Assche <bvanassche@acm.org>

---
v1 -> v2:
Move whole clkscale Initialize process out of ufshcd_add_lus().

v2 -> v3:
Add check for the return value of ufshcd_add_lus().

v3 -> v4:
1. Using lock 'scan_mutex' instead of checking flag 'scan_mutex'.
2. Update patch name and commit message.
---
 drivers/ufs/core/ufshcd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index d7ff24b48de3..a7513f256057 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -1397,6 +1397,7 @@ static int ufshcd_clock_scaling_prepare(struct ufs_hba *hba, u64 timeout_us)
 	 * make sure that there are no outstanding requests when
 	 * clock scaling is in progress
 	 */
+	mutex_lock(&hba->host->scan_mutex);
 	blk_mq_quiesce_tagset(&hba->host->tag_set);
 	mutex_lock(&hba->wb_mutex);
 	down_write(&hba->clk_scaling_lock);
@@ -1407,6 +1408,7 @@ static int ufshcd_clock_scaling_prepare(struct ufs_hba *hba, u64 timeout_us)
 		up_write(&hba->clk_scaling_lock);
 		mutex_unlock(&hba->wb_mutex);
 		blk_mq_unquiesce_tagset(&hba->host->tag_set);
+		mutex_unlock(&hba->host->scan_mutex);
 		goto out;
 	}
 
@@ -1428,6 +1430,7 @@ static void ufshcd_clock_scaling_unprepare(struct ufs_hba *hba, int err)
 	mutex_unlock(&hba->wb_mutex);
 
 	blk_mq_unquiesce_tagset(&hba->host->tag_set);
+	mutex_unlock(&hba->host->scan_mutex);
 	ufshcd_release(hba);
 }
 
-- 
2.34.1


