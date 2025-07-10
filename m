Return-Path: <linux-arm-msm+bounces-64315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D42AFFD6E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 11:04:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16D8B3ADE2F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 09:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7133D29553A;
	Thu, 10 Jul 2025 08:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FcnFMUfN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CEC2951CB;
	Thu, 10 Jul 2025 08:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752137947; cv=none; b=NTRtTU66cutTLUFDeSCA/8ahLmt606NZQKQsDw7oMTSHUBKDs15gBqL3XA/gkFmdVxjGROp16pvDjL8nJwAqGJDiwbsLKWamGljzibNrxxz3rpIfUiwvopO2ZYDHZYVrGAYxrlkKcqIxbB7KdhsmcCduXwLeUupnaNM38kGhVjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752137947; c=relaxed/simple;
	bh=y0TUvBxhtPy4ytXIYhG3Sa3Texe43hqNII5xmVCtBm4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=YHKqaM1kQm93SByigI5uXw9bfYAMVEip0NHgTlySbVb5ENeYUzlM/yNsDl7BYz26S3FpTHam7dYuntv/xcc1WyV9NV9c/oJxEqrBRq6lqmKNAN2IJ/a9pgwBmoIdm9VGi7I/XSYbNNtg3THUZy9G6m24RreTfmSvgx9BwGRTGqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FcnFMUfN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A1Zklq012548;
	Thu, 10 Jul 2025 08:59:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8BARQKabZ/XlRchA8+/iGLDqIL2jxB8sM0b3TUEZIwY=; b=FcnFMUfNWhihlmkj
	uO1iWJvtAILux9As+5u60Mmqd8FnDTpDXfodedv+77sqDoNCCXsHv09SyxGPXBaG
	+fcnZVLomhZ+gKm12Kul5b3orqmqALLSYOeMO4tDhgJ7Y7luLTU1llyBLAnexu+G
	nhFoh39uMIzzFp2GkFWPlcZvsxoAiI8IYL36JY2qPv0IVWn7VBJ3n5nPtWCZqU72
	oyvGAZ/JeEZ3kqLp3v2J+E4beR76tGDeXGNY49CltBXeNB5FCtl0qsQW7axhKcbr
	1Ecs20NEMem47rIF5jPAjvDEuWma8C8ehEOUX7PdW+K2Mo2Q8hfYSqP7eyZikZzt
	CFUMFw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucn7tcj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 08:59:02 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56A8x1tc004753
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 08:59:01 GMT
Received: from hu-vpernami-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 10 Jul 2025 01:58:59 -0700
From: Vivek.Pernamitta@quicinc.com
Date: Thu, 10 Jul 2025 14:28:32 +0530
Subject: [PATCH v2 1/5] bus: mhi: host: Add support for separate controller
 configurations for VF and PF
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250710-sriov_vdev_next-20250630-v2-1-4bd862b822e8@quicinc.com>
References: <20250710-sriov_vdev_next-20250630-v2-0-4bd862b822e8@quicinc.com>
In-Reply-To: <20250710-sriov_vdev_next-20250630-v2-0-4bd862b822e8@quicinc.com>
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vivek Pernamitta <quic_vpernami@quicinc.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752137937; l=2099;
 i=<quic_vpernami@quicinc.com>; s=20241114; h=from:subject:message-id;
 bh=LPW38fPn7QDddY4JLCGcPSm8zifjVRlGT/fFj57BoAM=;
 b=yfHtXz+hMMBzKgY9hIr4nAqs2bsGm3LetjmMuKZKFQMxa9twtg4Xzin6JGvlm0FjNZEWcqNTZ
 4AT+3V2sBWTActso8Vu6nF7ibjtdQiVIEsCkCxhFGLAONp1YyLlU4f/
X-Developer-Key: i=<quic_vpernami@quicinc.com>; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=686f80d6 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=8tVK0NU1EB3xojDYR3gA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: eNNu9QCpCFBZZwp--h2X-ECX2WnHLDT8
X-Proofpoint-ORIG-GUID: eNNu9QCpCFBZZwp--h2X-ECX2WnHLDT8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDA3NiBTYWx0ZWRfX6sF/1xjtUIRE
 5nd5R+FnQCr2UWliGNEGBbmFKs40rE2ua+1dtOhg6+9lhbIMwrkAVLl7a4gdO5xrCVGAxlbxBqW
 rUBo+VVqHqRBQeB964xb3ZURI5FFAxTuNXPioPTd3geErfT9UZlGG05ZdhqjuFCc3J02x5HpnSw
 gPMkWvtmrHcITP9rDhrowB+L1dOGELVW0TqGhGXCkPgbIF5sGw0HvRoPuwLWq8C/loJbdSxih2M
 ZRlVuTC4mh2fZ7zvyZQOeLCSaPaVV7yuqPNzqssuIoMIJDewihGiRewgWFFVCjhmVQUm9l7S9vA
 fwYlGRS8ae1yH08kj7Yj9pG+HjLNkF+N/NIfwh8qceYnFEhUNo4anEyguTsVJiwcFR5aHi2W/nW
 AVK5QL3SdDoA4dsT5M6CZKwTqCRz32WnsqWdGx7g8IAYxqVMEqyScvcjj+fa0swVAvEypLIn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100076

From: Vivek Pernamitta <quic_vpernami@quicinc.com>

Implement support for separate controller configurations for both
Virtual Functions (VF) and Physical Functions (PF).

This enhancement allows for more flexible and efficient management of
resources. The PF takes on a supervisory role and will have bootup
information such as SAHARA, DIAG, and NDB (for file system sync data,
etc.). VFs can handle resources associated with the main data movement
of the Function are available to the SI (system image) as per PCIe SRIOV
spec (rev 0.9 1.Architectural overview)

Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/bus/mhi/host/pci_generic.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 5c01c23d0bcfedd23f975e99845d5fa88940ccde..7d0ac1c34ddf95ace2a85e5f08884f51604d9b0f 100644
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


