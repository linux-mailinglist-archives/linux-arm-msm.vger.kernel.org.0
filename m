Return-Path: <linux-arm-msm+bounces-73339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C303FB54E58
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 14:48:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 78491464A3D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 12:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66272305E1B;
	Fri, 12 Sep 2025 12:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nVKm+wcb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9AC3009CB;
	Fri, 12 Sep 2025 12:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757681300; cv=none; b=lrNdDIrou05ulDoJi3/O9EY06ZlEeb8xJyA4EoL10XeDiwIhVVFx1LDhqaLCJi4fnkWEG9lHg7IWZewch9FYVrsGMaqcPBJKQZCp3s5BBNdBlJa1B6ac6NWaRfZDuUwJhDZ6NIRd54MxRQuEcWyPTKa9g7+yYoxb+zkYt20jl5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757681300; c=relaxed/simple;
	bh=A8gyK/b7FnH631/sjkN75cT4RAPmZ51zNmokOEPbfmc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=nstBjdvVGGwpLgRFSCXt4FR3Dc1W0789Yvaqj3NHJ0IwEPVjA+T/vC+bhL3Js1D5ws8tTvlW7UrUEYjy6Gic2bt/LwLKw/qG8PVnXmIekTMuzOyn6Ky/wZWtcXgnSOTDcquw52KV3P1PKtKqJZU+iBTCmW1KnLlPDpL0yhm3X2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nVKm+wcb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fMPm010866;
	Fri, 12 Sep 2025 12:48:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M/N2VCoxkmJfnyTu9jjJe2fVaQO2YB0d3qkgApe6XaM=; b=nVKm+wcbmS7Fynxo
	zCUdSpMBgYoO5CM+MrqPLjMO5F+B0OCBMgH/ikxwGJumvmAD/BKYZniK6w4jgOo3
	LTKunS0vt+g+A21t/QuxxS4/2rtpzuCIBlWPMLNyL3GwCloTZ0bc9F7BZE0yRMR8
	ZzktXvsNKcJ7gI4UJoOI80si6mTITpFRt8SF3twBWBJfFdqshe1YAtUE1SMw+xlp
	zd4tzdIZgD1rrhW+t5kVwGR7s/UOav5pRsoyV+/SDDKF227CVw+iZzfEyQ6EkVtU
	0QithUfoc0fPR0ExR8Xz7EyopJlAKcMjrheR+D4Okw3lZTtF9Zb11N3xogRb6bo1
	5ZkWfw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4mbff6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 12:48:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58CCmEGj021533
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 12:48:14 GMT
Received: from hu-vpernami-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Fri, 12 Sep 2025 05:48:12 -0700
From: Vivek.Pernamitta@quicinc.com
Date: Fri, 12 Sep 2025 18:18:05 +0530
Subject: [PATCH v4 1/6] bus: mhi: host: Add support for separate controller
 configurations for VF and PF
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250912-uevent_vdev_next-20250911-v4-1-fa2f6ccd301b@quicinc.com>
References: <20250912-uevent_vdev_next-20250911-v4-0-fa2f6ccd301b@quicinc.com>
In-Reply-To: <20250912-uevent_vdev_next-20250911-v4-0-fa2f6ccd301b@quicinc.com>
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vivek Pernamitta <quic_vpernami@quicinc.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757681290; l=2099;
 i=<quic_vpernami@quicinc.com>; s=20241114; h=from:subject:message-id;
 bh=zqF2I+MNJTHJf1rVfjfJ1iJ/E4tvhwf2lHcNDPwdJrM=;
 b=pkEqjtN+GFKi6Oy4Uic8WTXt3IFO7fJu9l7Rgxtuu9PwtHbWkTDsv14X2m71ukx6aw1ZOAWP8
 K+XbKWoHOZlBwRwTfNCByIKiHFItAdSQ/6kGOGRMiI6JjKLDUJWWUpb
X-Developer-Key: i=<quic_vpernami@quicinc.com>; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfXw76Kb61/fONE
 2B8qaIRPP48hYbF4TW1NsbuMPDoTJwl/Nc+qHBdCS3QAjIsAv5cmxloClVW6h3A5FFXjb7xhNUx
 9tV0l2+SkBqzfwKRD0c+cy1+NtV9peiEj55JxVF6ysFshXrMw9PS6c2RQZcmFVK8wDKpOKKpnHr
 bzMilpor6cDGbBKuQKhIZvZi+bFEqc73rru73ly82Z5mzS/vGxynNbUL7qX1NCrOQbA5u6qKX26
 nU6+xeyt3i0FFcWDl0VtOi6Vyf/qVyv24nD6vVgaREJTvFc743rL6rcKm2Rmr7K8+pQ/mNQCBBH
 5ExNBWQIKphEPB7KUt3k/yQtpKVYKr6bYY5ICz7CxYm4CF2rS8OXYM+pC/2XevgdnIwNsZrbw9o
 d9WzvFI0
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c4168f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=8tVK0NU1EB3xojDYR3gA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: HK4Xi-LWLi8CEOxqKxN1NW4z7UVq7WEJ
X-Proofpoint-ORIG-GUID: HK4Xi-LWLi8CEOxqKxN1NW4z7UVq7WEJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038

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
index 4564e2528775ed9f4ee6fe3dcbb2cd90b1966016..8a605cb3b8e1e54ef4e699700f3f2660ad5cb093 100644
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
@@ -1299,9 +1301,14 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
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


