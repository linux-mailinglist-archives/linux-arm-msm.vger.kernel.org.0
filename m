Return-Path: <linux-arm-msm+bounces-64316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 613CBAFFD65
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 11:02:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AABD95A6F40
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 09:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF6232D1309;
	Thu, 10 Jul 2025 08:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JHClymtG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F92F295DB4;
	Thu, 10 Jul 2025 08:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752137949; cv=none; b=Fl9Ywh71be2FR71qi4XzlfDpOuwdwRUQrHe/KvkE9NNz+dVbILh/B0Y501leV6R91FhMt2AihNF25X1C0mKQ+JdUewOsbHs40DOPaE86FmhFlSV7QSOC5/Kgqr7ey1CX2KYi60HpM6XkbztlfsRAUoYbWsW6F7msD/DTBRI5A0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752137949; c=relaxed/simple;
	bh=yAf2rA1IIKANliNfmE/OExQlsx1bQvsJkFIxVQxUDZA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=lFPcC8zqwU9LnKxQVS//ODjdlTB/1P2dIb4CUT3SGYtGEFl7/6wuiwKyps1+e1BrIsVnpV65Sxs8dVCO2MBWtTVr6KwThzxEbGTkdMBTvqYS65R6Y74HXESazd0cYhJw2K5BIOVCHplnGNOA86PumIa/eSn5bxwuWpUnltlqk2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JHClymtG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A1QY7N011308;
	Thu, 10 Jul 2025 08:59:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	98iR4+XG6LU0N4Gdwi8xCdguhWob6gsOPpIQMqImt+0=; b=JHClymtGB6MVF1Dr
	eW6BdfZWsrVB1Jvpl04Qebs6l/HmRfxV4XCGiFxU8ewC/u5yvHmcDYzDrLDnpKO+
	QKK1qu0N9wD8xBYTL7mSQHuJpBz9oZXLjiFG6r4XGpsDggyTSO04aZKHp8VYD3Rm
	hnXtt/jIw/0+zgwNWZfDtHNQQU7D+NURZkXw6LTskni79wFwTyl+CGagYec9aqKJ
	xrOVPiS04fuTXi2peMMnD4DsKxnC47bdi/p6TlpaemFKFoDFhJgMvalzOROYPvXN
	rHtamzdZBF843G45cPPuGkSS/RhG72Xn962/ZTvCBZZtUElHx5dsxp5mX6Ohe22k
	x4ldZQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smafm8av-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 08:59:04 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56A8x3UW009773
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 08:59:03 GMT
Received: from hu-vpernami-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 10 Jul 2025 01:59:01 -0700
From: Vivek.Pernamitta@quicinc.com
Date: Thu, 10 Jul 2025 14:28:33 +0530
Subject: [PATCH v2 2/5] bus: mhi: host: pci_generic: Read
 SUBSYSTEM_VENDOR_ID for VF's to check status
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250710-sriov_vdev_next-20250630-v2-2-4bd862b822e8@quicinc.com>
References: <20250710-sriov_vdev_next-20250630-v2-0-4bd862b822e8@quicinc.com>
In-Reply-To: <20250710-sriov_vdev_next-20250630-v2-0-4bd862b822e8@quicinc.com>
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vivek Pernamitta <quic_vpernami@quicinc.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752137937; l=1180;
 i=<quic_vpernami@quicinc.com>; s=20241114; h=from:subject:message-id;
 bh=3+L6Z0L+50YdtNp1sIodLp+kjeAdbCal810py0bygFM=;
 b=3iazpuJUIKZey37dz7SAieXRWU47MxrZTvbDsFtA2C3EvAstH1O+WRrJuf5UlMSMOF7PtPY+9
 VSfz++NTTMIBQaYhWTCHcgX6TZGEkULLiylec3LAUIz46zRq87Uc4n+
X-Developer-Key: i=<quic_vpernami@quicinc.com>; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ZJ/XmW7b c=1 sm=1 tr=0 ts=686f80d8 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=MXGvhfJtNsboA4ndukAA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 8YDRYmrnZRRNeM-CyCtInfQUIVuWV8fK
X-Proofpoint-GUID: 8YDRYmrnZRRNeM-CyCtInfQUIVuWV8fK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDA3NiBTYWx0ZWRfX64+7sk5waZvd
 8Y5E41UkSS+1hOFRdSc0ErRgIJcVtCG3up6ltDpJOnN7Bo0TgguhTDf23nJl8RxDE4+2DJf5EFD
 4f+1wlzTMBlptoMWU2EWJKAiMvEIdlm0P/oCus9fvDFPW4TFPFS++5LARyZodvtTeTGScXzf6t2
 8g2o/Zc4CMMDWbJw7a+217iighrRgKU8I2hyxOYGUZEChV06KRYtNx/ssivPIMf1qObs3/vF7fO
 GdW+mdNGxtjJAx7Ngcx709WuLkB0/QbjQwAryfjJXau65NME27iatMbwRBn8699znqpq4Oe+JNA
 cof08PMG9YIKl2+Lo8jCJF88mUBEmz1o3JmwtLwHeAb6k4/CmSiHY7wbJ5yMwv5ocKfmRNfqK+i
 Sv5GJNc/Fb1Nje+G+X5bLUHJ71h6luua6UA0z/9f8d/ouuiiAK6u61CivWmHsSIgRQ/HO8ey
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 impostorscore=0 spamscore=0 adultscore=0 clxscore=1015
 bulkscore=0 phishscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100076

From: Vivek Pernamitta <quic_vpernami@quicinc.com>

In SRIOV enabled devices, the VF DEVICE/VENDOR ID register returns FFFFh
when read (PCIe SRIOV spec-3.4.1.1). Therefore, read the PCIe
SUBSYSTEM_VENDOR_ID to check if the device is active.

Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/bus/mhi/host/pci_generic.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 7d0ac1c34ddf95ace2a85e5f08884f51604d9b0f..4bafe93b56c54e2b091786e7fcd68a36c8247b8e 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -1025,8 +1025,10 @@ static bool mhi_pci_is_alive(struct mhi_controller *mhi_cntrl)
 	struct pci_dev *pdev = to_pci_dev(mhi_cntrl->cntrl_dev);
 	u16 vendor = 0;
 
-	if (pci_read_config_word(pdev, PCI_VENDOR_ID, &vendor))
-		return false;
+	if (pdev->is_virtfn)
+		pci_read_config_word(pdev, PCI_SUBSYSTEM_VENDOR_ID, &vendor);
+	else
+		pci_read_config_word(pdev, PCI_VENDOR_ID, &vendor);
 
 	if (vendor == (u16) ~0 || vendor == 0)
 		return false;

-- 
2.34.1


