Return-Path: <linux-arm-msm+bounces-63546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D45AF7AB1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 17:16:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31C34188F64A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 15:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3B692F0057;
	Thu,  3 Jul 2025 15:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HpEUzjFl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205492F0029;
	Thu,  3 Jul 2025 15:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751555400; cv=none; b=s8EQZUfHKHCsGf9oM9kl6HKJLZOAdLPcME8/8ZHUiTnLRZcqZX1R2XIxMzB7CW7j+rKo4cXpfvgHQPMSBsq/LLTi89Cv2e58TrYR/H81JgpLFtjc4pJO4ORwCo4dJ9LaMRViaeu+on1b4uRjuEpfxS7scPJ9hzo+BQY/+jLktAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751555400; c=relaxed/simple;
	bh=zTku1qs4JIIGkOFtq8oa8v38TQt1vRMpsQ/2691hIGY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=qREz+79rkuV3VKxOZGXpuOKfWPwHTZ2tSNGA51NXzDSarLnTrJYFg/1Q9c61vyYuCywuBo+0nyxuOu9Sor6xboyfP8n/X53lJ0sXteUnux55iCuHpJWoTBEMBUh6FYLIFCo9YEot61OCHGdcJwtmEghT2FV30kyRxQFqD/n2D5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HpEUzjFl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563F510O018851;
	Thu, 3 Jul 2025 15:09:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LmXiOI8vOU2lyyejBQcoBsRwaMM2OwOn2Ab/DYO8Nnc=; b=HpEUzjFlb3iciWI2
	3Hmvs0xqntTFUB/SIbK7KqRIyLMRBTMhy0oKPd3Qejpj/Fea4oacIXgw/M3z6sdG
	36x8KxISQBQKSxUO3+DQy+sAax2yl1w5csg0scIHW8noLB28fDXKsKjQ80Is9LN5
	pj2hAWEvqfi/nsyKMRHwzPTHntzlUY54j90D0VbSXQGU7jakqpxMhEIazXS6pLRE
	U09+f2aPzkFJPtEiKlVZwrg62KQywBwwNj5sW4UkU3jI7ubQL0gqS/t1na/pnvPc
	IBJ749aQdXMGENhRTzrJIYHmLemJfqVfrfueVCxMgFGP2lwVbd2OyGcElncGnUuv
	TIhurA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxs01c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 15:09:55 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 563F9sVr006172
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 3 Jul 2025 15:09:54 GMT
Received: from hu-vpernami-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 3 Jul 2025 08:09:53 -0700
From: Vivek.Pernamitta@quicinc.com
Date: Thu, 3 Jul 2025 20:39:42 +0530
Subject: [PATCH 3/5] bus: mhi: host: pci_generic: Read SUBSYSTEM_VENDOR_ID
 for VF's to check status
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250703-sriov_vdev_next-20250630-v1-3-87071d1047e3@quicinc.com>
References: <20250703-sriov_vdev_next-20250630-v1-0-87071d1047e3@quicinc.com>
In-Reply-To: <20250703-sriov_vdev_next-20250630-v1-0-87071d1047e3@quicinc.com>
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vivek Pernamitta <quic_vpernami@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751555387; l=1105;
 i=<quic_vpernami@quicinc.com>; s=20241114; h=from:subject:message-id;
 bh=6+0BQkQFzRYtsrXYx2NHL7wCq+lQ0TFAQYa/jS9rza4=;
 b=QgAkjpkWC5dEZVtLR+ch0rrpgHnU/tjp2NeaWc21XkQT0nfwTkSYJkCXlNrkjme8kwOv76kK1
 vkNKheawaeIB3arCmOLx7nqZ++SlTBOrIjaY1sU8yE+HJITuOhVQ9ui
X-Developer-Key: i=<quic_vpernami@quicinc.com>; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDEyNyBTYWx0ZWRfX+Ky9rTj3cUSv
 /syiYAzeHcRGqcUCU5+EXZZJorzSAwxaYmqRjw0jqzOvqK/8/Q0+pejhK+5PvloqK1rRPvOOEbt
 QK07lRbz+JQRHIP7gO1ZINFNJHE3lYUn+S3U2p04JPYcHjx62CgQ9k0+UwZ2YNMDKTFSHbEsP5V
 DvLVnipik4JhwfJ3ga5c/iGSqnqY5TU9uKg9RVW6AGHiGsz/gIbdCe0s1vdbrE/ZqMlPup2AxYU
 CFOfMaTxyJeQAHYk8wnTTJqrAbZbkvt/YnRNT8ptlAUrFR41LOAlt2oo2lfNAzkhgunbbt/yTwW
 Y8u2RsEespPT9YvZ/JtlDh9I8cCPDDwyTjdOQo7IbpR1d3mJh+2EZFmkLKIPPKjBPh9D7s6audX
 1U3zkKDnDkaUhvwAIZBtsuB4rrf1gpq0We7ZQxfjbT2xQykanTIi382CA/u3HsNtWDUoKBFN
X-Proofpoint-GUID: 8M6gvPhp7lZqT-thgp4OBcb9tULrK_Ip
X-Proofpoint-ORIG-GUID: 8M6gvPhp7lZqT-thgp4OBcb9tULrK_Ip
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=68669d43 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=41Swp6Qei03CjfpCrlAA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030127

From: Vivek Pernamitta <quic_vpernami@quicinc.com>

In SRIOV enabled devices, the VF DEVICE/VENDOR ID register returns FFFFh
when read (PCIe SRIOV spec-3.4.1.1). Therefore, read the PCIe
SUBSYSTEM_VENDOR_ID to check if the device is active.

Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
---
 drivers/bus/mhi/host/pci_generic.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 22de02c26ceb946fb618d962ac8882d2db1be6b4..938f37d306a18b9a47f302df85697f837c225f0d 100644
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


