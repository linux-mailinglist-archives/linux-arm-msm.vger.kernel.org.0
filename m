Return-Path: <linux-arm-msm+bounces-63545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0055AF7A84
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 17:14:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D30375853A1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 15:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC5EC2F003A;
	Thu,  3 Jul 2025 15:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="M9H2t7WN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C032EFDB5;
	Thu,  3 Jul 2025 15:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751555399; cv=none; b=PhojyPw0tRgu2mLs10suIxAa2HQZUfpyzk+3AAUz30WZ68wSsEv/NzJtDpNVXB0OCgeie8S05FBJG3xnJFrMsW31bZ2tY/YJiTX5KO2XNLGRAQgmZNSQYZTxeJdZfsADBqURhzX4EtHmu+Pyylkt7RBGnWwzVf2hSXqp9MysiJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751555399; c=relaxed/simple;
	bh=H8ysR/lRSq8c5+13PEkKDSmhMXEANB2ZdaqTf6BSqlk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ZPJJ9rvs+Bnq8cMQZK9mLPrPJqUsAs9NPWb9wnDWv+KotbU2Aa5ljKzoCPbo7p/cMGW6kALmnTSCySbIcI9ew3HiZoJ4e14coAmq+nzmnzled/1hFDI7keXnehVHgGESVYyN19LWlfzfj/zI0JpoXffFkg7FGdzt6dJe0Yq4PpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=M9H2t7WN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5638gSg0032399;
	Thu, 3 Jul 2025 15:09:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OlpxALEan4bWtwvj8P51CoKXOXUSP3qVQibeaqMkAFg=; b=M9H2t7WNr18apk3N
	MS2GiP/PMmnbqKOXqlOVv3wdwmM2hPzbwh4e+1osyk/XQGOGUame04Q0Cce+jcIK
	46pGnR9qUqeH0Yeez+TS0eUARnrukXYBISeSq9IMxGCfLiaT7DwW2q3OZBMb1hZx
	DLH3TM7LrOu6mDHCcC+8gF4jluew9pZyBZ0YaYLCqMxofBf/gjIFGseqmsd0lQIe
	T7Oj7+l5nzlkMLwNUp/0xwTf/0DL8h+N3bXlQyE617Gt+nfdC7ooE5AbDbBeSQbV
	v86hZ6TWQIw90YzyZsz/wtUFXpO6SPDOmKenja7uzh0Wlk3/m8blondTITXxYBKY
	x8kWDQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63kh5tw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 15:09:53 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 563F9qfc002510
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 3 Jul 2025 15:09:53 GMT
Received: from hu-vpernami-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 3 Jul 2025 08:09:51 -0700
From: Vivek.Pernamitta@quicinc.com
Date: Thu, 3 Jul 2025 20:39:41 +0530
Subject: [PATCH 2/5] bus: mhi: host: Add support for separate controller
 configurations for VF and PF
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250703-sriov_vdev_next-20250630-v1-2-87071d1047e3@quicinc.com>
References: <20250703-sriov_vdev_next-20250630-v1-0-87071d1047e3@quicinc.com>
In-Reply-To: <20250703-sriov_vdev_next-20250630-v1-0-87071d1047e3@quicinc.com>
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vivek Pernamitta <quic_vpernami@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751555387; l=1932;
 i=<quic_vpernami@quicinc.com>; s=20241114; h=from:subject:message-id;
 bh=ynV4r34hLqHTRvLqx4d3dXpJqRk+MHQfLvFdVr8fsB0=;
 b=pDHnj4lsfpWAlgvOVvDQc7l0cMzZkqzwxwpPcsIJstyMZIi5T3DRYnQwqvN3mncHyisFSP38P
 OLL/EL6RzqcBtL0IjGNqGpTnL70LK+9lrpBPZwPnjKMurhb5uyCoW8E
X-Developer-Key: i=<quic_vpernami@quicinc.com>; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=68669d41 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=v7AmYJ8y467wbwUiuX8A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDEyNyBTYWx0ZWRfX3xR1cVlSQnjI
 sQqpvfScqH+LTtsyB1AKwKnZ8KvXXCLdq+DLUPPt6JU6mzGcRGd0uM9+V+GKEA3AUQXnZjfkvNE
 0C3X7MnMwzTp312YyhykM0l4eb2TI+/81BY+wwhueLVWM11MSYfb1Z4lLTPvHqUNh57NpM3Hgzv
 dbSfGFENokl7QYZJl7qzNVa85to7U/Vc463v9kck2tuMvIt96+SvrniBb03feOW/MWvdNRJqX5q
 mFzZvrh/4t23BZT5HhbbHklMmvY8NWRBno6c5+IUdsEovGPGc/sryokwqsy0ndvYgqaWtBNILGg
 E39GXF1PGBzjq5FctN3Rlctdf9zMDGFONOjU5OiNEcfx4CuaREgNOof/NpUKBwExskYJkcEA3A9
 biN/kHKq2oXG3EKgfr3fDW0KUoTNhIuFsLxMrcHCffHcB/BaMOTunrfkGcYMmvhhYk5f+Dt3
X-Proofpoint-ORIG-GUID: p9OKn6VMI6eWv0parFwEt9DuAsAKw1mO
X-Proofpoint-GUID: p9OKn6VMI6eWv0parFwEt9DuAsAKw1mO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507030127

From: Vivek Pernamitta <quic_vpernami@quicinc.com>

Implement support for separate controller configurations for both
Virtual Functions (VF) and Physical Functions (PF).

This enhancement allows for more flexible and efficient management of
resources. The PF takes on a supervisory role and will have bootup
information such as SAHARA, DIAG, and NDB (for file system sync data,
etc.). VFs can handle function-specific data transfers, such as data plane
or hardware data.

Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
---
 drivers/bus/mhi/host/pci_generic.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 3e6e2d38935927cf3352c039266cae7cadb4c118..22de02c26ceb946fb618d962ac8882d2db1be6b4 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -34,6 +34,7 @@
 /**
  * struct mhi_pci_dev_info - MHI PCI device specific information
  * @config: MHI controller configuration
+ * @vf_config: MHI controller configuration for Virtual function (optional)
  * @name: name of the PCI module
  * @fw: firmware path (if any)
  * @edl: emergency download mode firmware path (if any)
@@ -47,6 +48,7 @@
  */
 struct mhi_pci_dev_info {
 	const struct mhi_controller_config *config;
+	const struct mhi_controller_config *vf_config;
 	const char *name;
 	const char *fw;
 	const char *edl;
@@ -1242,9 +1244,14 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		return -ENOMEM;
 
 	INIT_WORK(&mhi_pdev->recovery_work, mhi_pci_recovery_work);
+
+	if (pdev->is_virtfn && info->vf_config)
+		mhi_cntrl_config = info->vf_config;
+	else
+		mhi_cntrl_config = info->config;
+
 	timer_setup(&mhi_pdev->health_check_timer, health_check, 0);
 
-	mhi_cntrl_config = info->config;
 	mhi_cntrl = &mhi_pdev->mhi_cntrl;
 
 	mhi_cntrl->cntrl_dev = &pdev->dev;

-- 
2.34.1


