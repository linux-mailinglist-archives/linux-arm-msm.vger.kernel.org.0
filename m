Return-Path: <linux-arm-msm+bounces-76861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC97BD08AE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Oct 2025 19:39:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 082354E14CE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Oct 2025 17:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A17027B33B;
	Sun, 12 Oct 2025 17:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z6PSS6q7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CE41DF252;
	Sun, 12 Oct 2025 17:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760290743; cv=none; b=eRdmj5P2bLGmAIaGT0+9lziWLyzkWnjIJDUVARmxEaZf9edvUgOzx5NVXPPe6l7bvhQLzi49huf2QwY92Om02yK16cE+VjDv5itb7eBTa00Ss3KISZe2o0oiYzf53g/tCYpCCt5orK7Kk2ddA56C2sGN2ZMfZDse07J4v4UBY3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760290743; c=relaxed/simple;
	bh=5I7ykGiAAOk6BgGy8HWD3BZzlBv59Rkn365TTJ8b+KA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XTk2Knw0J+v00PAuY/PHbWvzeO5p/pREpIDwtHGGk3cJMHqhB8pdixO0poX8HVMIGq/uJ7YEXEV7LXPXrhJS+1qctZsEJbHsWBfynzv/dkND9ua/hzOBFtjhgulgQRlwe/V2WSXd9pcOStV6nrtB1mJ+k/L9DXFMGbI+h2DjaG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z6PSS6q7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59CCUFda003614;
	Sun, 12 Oct 2025 17:38:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=764uBY9ag12bRJrfxTMRZfhol4GFWWG44oa
	B8K1Qi2A=; b=Z6PSS6q7oDAyymmAYdvh2gNcCI0GMXtbnG+QSK0nRqaUn0En4IH
	+6FTHPEj+TZ1jUd/t9an9roaysbkq1VPvXK+YYz6jNRVEnMbGM3ZDkKt0e394k57
	NxxuKFooDJe5nM3TMqJsWMdlrPhXdaSDaqAVLMZgRShXnbtOVWIZMBg8ULEgIJOP
	+0BSRlauZi3hi7VBUsgcWbWcuVrKI30Z1OhkcfJv27qd2wrBJMDsBNMsTS8+GG2P
	F1mOcHQF/kVmrJlNM/CwGgEKkkn05L2/AyF8+Zx0L/Ph/SWAA9W7yTi8OoLlj7BJ
	J2dxGQOyRlI+QASfjaZPuq5PYCyPDzWQg1A==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgh628jd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Oct 2025 17:38:35 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 59CHcVPt007557;
	Sun, 12 Oct 2025 17:38:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 49qgakks6h-1;
	Sun, 12 Oct 2025 17:38:31 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 59CHcVm5007551;
	Sun, 12 Oct 2025 17:38:31 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 59CHcU0x007550;
	Sun, 12 Oct 2025 17:38:31 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 3540B603540; Sun, 12 Oct 2025 23:08:30 +0530 (+0530)
From: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, bvanassche@acm.org,
        konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Subject: [PATCH V1] ufs: ufs-qcom: Fix UFS OCP issue during UFS power down(PC=3)
Date: Sun, 12 Oct 2025 23:08:28 +0530
Message-ID: <20251012173828.9880-1-nitin.rawat@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=H/zWAuYi c=1 sm=1 tr=0 ts=68ebe79b cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=ldyrZXJ3T4YXRkzK03AA:9
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNiBTYWx0ZWRfXwOb+7oYHDYRZ
 GkVtvz60AXbHXxpfuUiSQLOC6KuPp3DSHCxikOnwRh2r0hO1SXJn8mGbOefMNJzkktMXpp9l/ct
 NWghO3LxFGM+4U7DQG7euxrBNnbm+rYJDODc6YeWs9pO91YPctAfl9bmMGVqLmpa8dpmY4+7gUQ
 Nsy6CBXsKWsAwMowYk4I5XXxwdtxnpJGeckn+TW9r3EtkTQlMngqsQxv8X3SDucv/ciDObGrGu9
 JcJ/JEf+2yRwqeK1YJJLHc8EEBzjSyVaLxynmLLEbYKgnD65gP789sLLy2cv1DlCFwtg+AG6zva
 URrLQvoBEZq7UiYt1lDyIKYRWbeXcORZWoIFbEmMdufSUD7tz4cTPpTtRlRb3dXjnJjG5Y4tx5K
 wzqb2+LigHAmsYX0oKZ7EJwVAcktEQ==
X-Proofpoint-ORIG-GUID: t9-cGvjqQYsJIZ1ukQAkVF7_xzYK2pQ9
X-Proofpoint-GUID: t9-cGvjqQYsJIZ1ukQAkVF7_xzYK2pQ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-12_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 clxscore=1011 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110026

According to UFS specifications, the power-off sequence for a UFS
device includes:

- Sending an SSU command with Power_Condition=3 and await a
  response.
- Asserting RST_N low.
- Turning off REF_CLK.
- Turning off VCC.
- Turning off VCCQ/VCCQ2.

As part of ufs shutdown , after the SSU command completion, asserting
hardware reset (HWRST) triggers the device firmware to wake up and
execute its reset routine. This routine initializes hardware blocks
and takes a few milliseconds to complete. During this time, the
ICCQ draws a large current.

This large ICCQ current may cause issues for the regulator which
is supplying power to UFS, because the turn off request from UFS
driver to the regulator framework will be immediately followed by
low power mode(LPM) request by regulator framework. This is done
by framework because UFS which is the only client is requesting
for disable. So if the rail is still in the process of shutting down
while ICCQ exceeds LPM current thresholds, and LPM mode is activated
in hardware during this state, it may trigger an overcurrent
protection (OCP) fault in the regulator.

To prevent this, a 10ms delay is added after asserting HWRST. This
allows the reset operation to complete while power rails remain active
and in high-power mode.

Currently there is no way for Host to query whether the reset is
completed or not and hence this the delay is based on experiments
with Qualcomm UFS controllers across multiple UFS vendors.

Signed-off-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 89a3328a7a75..cb54628be466 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -744,8 +744,21 @@ static int ufs_qcom_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,


 	/* reset the connected UFS device during power down */
-	if (ufs_qcom_is_link_off(hba) && host->device_reset)
+	if (ufs_qcom_is_link_off(hba) && host->device_reset) {
 		ufs_qcom_device_reset_ctrl(hba, true);
+		/*
+		 * After sending the SSU command, asserting the rst_n
+		 * line causes the device firmware to wake up and
+		 * execute its reset routine.
+		 *
+		 * During this process, the device may draw current
+		 * beyond the permissible limit for low-power mode (LPM).
+		 * A 10ms delay, based on experimental observations,
+		 * allows the UFS device to complete its hardware reset
+		 * before transitioning the power rail to LPM.
+		 */
+		usleep_range(10000, 11000);
+	}

 	return ufs_qcom_ice_suspend(host);
 }
--
2.50.1


