Return-Path: <linux-arm-msm+bounces-70162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C00B2F8F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 14:55:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2BE867AB18B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 12:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8630531CA51;
	Thu, 21 Aug 2025 12:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pEqrPoSN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA675315761;
	Thu, 21 Aug 2025 12:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755780946; cv=none; b=gJJDC9wTr/2idIDLn4yIxDWVALmKPVoMnNuQodnuHf8KV9mY7fuaX5XPtkWIExpYriClBnM9KT+Lwh2G/yoLxOaTmnAUrGczUr5Rbpr4SEFLChTZs5ybQan+ArYk9uFD/PXzG80TBx4bFV/mDpGhrgTqHlkS7O6Cc3i3YPAenhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755780946; c=relaxed/simple;
	bh=Gkb/Or9/K+XSIm1EfgKraWEy0lq1WQ6igaNLTUTm7Hw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=rLq1d3jr9x1fJbLkob8XBy7sgK7UV1iiEBhVmogzk064//4TF4cbIv++9AIb6GOfLLaOMzJm1H2peznBTBFNUVLzRbZzcdwqK8GR8n6nmPVxfWzsTGc4u6CqMNtxoYt+fr93mb91IycExj+zyQKm5I3ZtQgC8898nHYLvLyjY4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pEqrPoSN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9b8sd015119;
	Thu, 21 Aug 2025 12:55:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9WEQjImC18XEdt45p3pw+z48yX2xWpuNa/J8s3/LsKo=; b=pEqrPoSNrwWhA1BH
	geCmQ3N49xpsw1Y2RGmxCjJ2WKragrGrHfecNagfDQ3rD6JAP8rUB960FovHn0F8
	28FuMNE9Gb+xwgAoYQdDl6teSXo+1FrveYtwqWJHn2pqkrvb1El/GPNJG0yDF1YY
	MxX/hIPkwnovKGSuRziOh/oI+J/s0zlGuXbULhZwMWrIGl3X+MjAoO62+SmhlmlC
	0GWBnQr3ZCnkhaUny996D+YtRx1X5HREPX+EzogXHErLN5IZVdQf5YrS5C6v3BSX
	Ro5ljNio7E6CI21BpxAIWp5Oym3WxUZ53QqygQQd3ikVd4Jq4mUxWzFshWRqe1yE
	so2oLQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52cnevs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 12:55:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57LCtfMl016785
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 12:55:41 GMT
Received: from hu-vpernami-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 21 Aug 2025 05:55:39 -0700
From: Vivek.Pernamitta@quicinc.com
Date: Thu, 21 Aug 2025 18:25:33 +0530
Subject: [PATCH v3 1/6] bus: mhi: host: Add support for separate controller
 configurations for VF and PF
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250821-vdev_next-20250821_sriov-v3-1-e1b017c48d4a@quicinc.com>
References: <20250821-vdev_next-20250821_sriov-v3-0-e1b017c48d4a@quicinc.com>
In-Reply-To: <20250821-vdev_next-20250821_sriov-v3-0-e1b017c48d4a@quicinc.com>
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vivek Pernamitta <quic_vpernami@quicinc.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755780937; l=2099;
 i=<quic_vpernami@quicinc.com>; s=20241114; h=from:subject:message-id;
 bh=t7UT8CnbB86GIL1QFCRbzyIa/VpBOYeyFC3EECq0s8I=;
 b=+MygFHpXs9YmQc9Hk+bBeb+jVP6PxNHgkcY4pzIQoMIT7hbyfche+91he8XjJIjCQuciVZGjk
 9cvkz0MYFyzA7cowBxP9baE/QqYwBhrV9ikkGdb7gm9Ix5+dyJjZGnC
X-Developer-Key: i=<quic_vpernami@quicinc.com>; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8_rxufDSX2vShYMsrA-2OFNzIe_e6jZm
X-Proofpoint-ORIG-GUID: 8_rxufDSX2vShYMsrA-2OFNzIe_e6jZm
X-Authority-Analysis: v=2.4 cv=Xpij+VF9 c=1 sm=1 tr=0 ts=68a7174e cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=8tVK0NU1EB3xojDYR3gA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXwI3zvJb25Udj
 O2i3ejZU/2teCDNDgsGyOiMn3/TWjxzDaqmleKZmG1LuLdkRebrqRKdSAHeREJKYmeCkz4EMUS+
 0nURUKr3sXjF5YhaRS6anvH4AvKnEnhhv/ZBDNWPQ5z4sA0Cor5zcieEAxnCXysj1vyVOctiQ5d
 o1Jc9KdwBa5AHNmkY+vOGjdqjDk7G0yL7W7H/LjnLGGPfs7HwLqiNOZyhOXKmZNVZxKECfSfwiT
 oMso0f1B6z2TQyQYRaT0y9yxg/XN0F5K4Y+1nvFlxvIl+tk9AuxB4KrrOYIKOJE1sLoj9+9fmvM
 C+oF8xkLMlFPhKuJzA+aZdjhDMmjf1D+g9O82lqjTZN1FNBnOodu5L9JQZ7CaDZzgTXNiH4CP4B
 raro2U0YSX0DEIG7VrbTsoUkySWN7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

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
index 4edb5bb476baf02af02aed00be0d6bacf9e92634..2967ed4cec29d1c1eeb581ed44cf9afcea90f533 100644
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
@@ -1311,9 +1313,14 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
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


