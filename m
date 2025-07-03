Return-Path: <linux-arm-msm+bounces-63544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0B7AF7A7D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 17:14:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2818B4A7A4B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 15:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D0E32EFD97;
	Thu,  3 Jul 2025 15:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YWpslB1w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44362EF9C2;
	Thu,  3 Jul 2025 15:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751555397; cv=none; b=FCkB04FwTK4BySwAF3Yme0iN3tMPmEjy76LBYs4DIL3AL9FF7YsXx1dtsjQI6n7tYkdELFEyI7QE5Q8Vv4QoGrTBJ7F98Gd+pMkH1iSynEfYoueCcVlUvGKYHxYmxBOnkxTCvxeD4/P5TnGVP5jdsJkegvxosFpEvtrJC2ttlxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751555397; c=relaxed/simple;
	bh=qc6h21sKqtrfI3mC5nB8lOxjrHzXZwfR9BvThwS9dsI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=WLlmQ8BVwL0XB+ujHc75ELKTQpzyFmOHk0X6x5s7gq+RtP4bJ2K0xHyDxjuaes5t9kMf1/Vxi2HAaKmQpv31lbCHny/f8DjaCYW6rfT7FmEv8BPJYoX6VA3jnh37SojH/LYTBJPwBNT5yobo3HtagK4sjpCU42D8hOuzsGtgim8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YWpslB1w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5638aWgK022019;
	Thu, 3 Jul 2025 15:09:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YpMgQLlIsx5Qg4GfLBC3ROu71w4u6BpqxbZfnmSzJfc=; b=YWpslB1wz2nuhXbN
	qe70XmO3AB1m3fCdj7vBGt8qm9KG2LFGPTqJwMKSlZTI73jPg8nGH8xKWp7/Hmhb
	G0D47YlB7h1cWkRVc9UiLg3oBR+z3yuItWOLY9+3ETYV0M1vtc6TOHuBNmaW8u4b
	UG5C039AUyQJw/c09wcNqrfj5CvfIv94iJDmxAAqDjMhGl5ZNbk4nkS+yYtfMNTq
	iog83mLX3kb6tuVRCrMsalvDO73eBKoVfXZQTFro0NAInkc3ff8RhkfS4+zGliB3
	I+ujt6dcQQ2DfiyqItsFMCt72uLT3vMwLfdtJpbg0jdfNnkunXewanS6L0MfxexH
	ksIHbw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxs016-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 15:09:51 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 563F9peB009746
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 3 Jul 2025 15:09:51 GMT
Received: from hu-vpernami-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 3 Jul 2025 08:09:49 -0700
From: Vivek.Pernamitta@quicinc.com
Date: Thu, 3 Jul 2025 20:39:40 +0530
Subject: [PATCH 1/5] bus: mhi: host: pci_generic: Add SRIOV support for
 PCIe device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250703-sriov_vdev_next-20250630-v1-1-87071d1047e3@quicinc.com>
References: <20250703-sriov_vdev_next-20250630-v1-0-87071d1047e3@quicinc.com>
In-Reply-To: <20250703-sriov_vdev_next-20250630-v1-0-87071d1047e3@quicinc.com>
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vivek Pernamitta <quic_vpernami@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751555387; l=812;
 i=<quic_vpernami@quicinc.com>; s=20241114; h=from:subject:message-id;
 bh=jW7Tf+WyIKjFJb4AcgacCEBAZ5dX1ysoJaJxAcRRGGA=;
 b=m3V0aoZ3c+2e2XiasKNmUp9UM3j2hkVU17isgHr72uM4kI+aK0nz2o42sbKBT4HvCh/gQY96e
 IpxzQbiszHXBAZGtyvt0gGRLWSfH53koMCOOi022Y0xoHb7nr911fsq
X-Developer-Key: i=<quic_vpernami@quicinc.com>; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDEyNyBTYWx0ZWRfXwbZF4kY+X0o7
 emoHm9/80kOR1kOi+yu7mNH5nZ3qWMniYV9f7cnA28MYkt4VFPz9LjtMK35lcewTBn4SNu5aoKj
 Z8x7AG7IengvoeTf82Nh3iYeYofcvd/U6JBSNbHxv3nPBAv81p53vngZ9uIO7UUqs35UZAd5S4W
 ItzMHxungLhonqki88nAmuN5z3aVYFD2f+KNYvIEQIdPbkM94jOYHc2LSYxLSorBmB3IIHktbxo
 ciiaCXVBEr7cGAkncdDQHMtfPtIbA855aZplFp3SPBHaXwc6sAeCPEOrBs8maRkhhkCmKRukldN
 OraB6z6/p5gMM3P1l5F9a2YokTJujlcoj0W/cF+yH2r6NGTCSiFhUp+KEHRuXFahY8HuLO5xuAl
 q6DJ0RU/KR+FgGSMta95f/8EgB5qAmwRE/iDjT2hJMvlobFKtT4aYxH2SOI2yO9ppE0HbHxM
X-Proofpoint-GUID: 2Rcs0cbTtcBlJa_EnYnFf1THS5SJDTcO
X-Proofpoint-ORIG-GUID: 2Rcs0cbTtcBlJa_EnYnFf1THS5SJDTcO
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=68669d40 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=hzwDMOxQQ8u7MIoiZ2AA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
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

Add SRIOV support for PCIe devices.

Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
---
 drivers/bus/mhi/host/pci_generic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 5c01c23d0bcfedd23f975e99845d5fa88940ccde..3e6e2d38935927cf3352c039266cae7cadb4c118 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -1607,7 +1607,8 @@ static struct pci_driver mhi_pci_driver = {
 	.remove		= mhi_pci_remove,
 	.shutdown	= mhi_pci_shutdown,
 	.err_handler	= &mhi_pci_err_handler,
-	.driver.pm	= &mhi_pci_pm_ops
+	.driver.pm	= &mhi_pci_pm_ops,
+	.sriov_configure = pci_sriov_configure_simple
 };
 module_pci_driver(mhi_pci_driver);
 

-- 
2.34.1


