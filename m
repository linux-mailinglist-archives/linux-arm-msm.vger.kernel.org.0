Return-Path: <linux-arm-msm+bounces-70164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6BBB2F8FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 14:56:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 776BB4E6027
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 12:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF257321F53;
	Thu, 21 Aug 2025 12:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XXAeiA1t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3027D320CCB;
	Thu, 21 Aug 2025 12:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755780950; cv=none; b=ThSkrxk6LnsbPuNQ7M5bIzUuuJRUyyoqHw1bKhPgjWrQSwc890RNvlxwcq1q6rcHQLoJf9YhomB2cVpLarnSADNE7GCPrM/9G9Jcsp+38xm1paZCsuXkelcHL1VcT2HhSZu6/E2jRyzgEoFxiqs4DlwVq7atg4h860YWQlTZ45Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755780950; c=relaxed/simple;
	bh=5vUW2GlsPzFfBXJQw/VVGvyh64s2/8oHxeSKexb7Xss=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=eR6JUb9N4WFm3YS3w/M+zgrlwfHQMfGvkzwwxwxan7UUB+c9MtMKzVEvQrPDqsPgBCK3FfW1wLJfMYkLuqV8GCuOlr/e11kdXu4w7gfiqJuH5qfAwapnjJPqL2T/DpW+BJLf53E5jBC1KAgChKo5FcHqtxhtyLoGXA/CJWoNX+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XXAeiA1t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9bOL7024578;
	Thu, 21 Aug 2025 12:55:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0iOHAKh21XqxUu4UMlzAypExsLHhTh9CCcI1YJL+5X4=; b=XXAeiA1tfVI6eaS5
	OcuaSlQ0hTYNQii2nf7uX5scEGCnsdTdB9Vf0lOiGiOgkrQk/AAVPLdJigukPNTs
	u6t2+EFZLGc+KTVVZ36hw3/rhAWYlJhDVyBzFuCTbhe/2kP6/Dh519fPrJXO8Nd7
	/9jSs0whbPsREKEkTixUX4WluGLTAPtj7iN+bT8FA9sQK0gCe2y9xhRbj4gPw30J
	wY/1T3twhdn3xQpxe5CLC9hFMiC0/uHNZDXOwYldpUXT+JYK7wwaVjNrTyrc/PpO
	RcIscLoog8TT2uRc03m6S/BrVGfb/tM2HjNFw4cYiVGrkAGTyPh3zXEaNuceXLzn
	TI4A2Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52adfst-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 12:55:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57LCtjH3021404
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 12:55:45 GMT
Received: from hu-vpernami-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 21 Aug 2025 05:55:44 -0700
From: Vivek.Pernamitta@quicinc.com
Date: Thu, 21 Aug 2025 18:25:35 +0530
Subject: [PATCH v3 3/6] bus: mhi: host: pci_generic: Add SRIOV support for
 PCIe device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250821-vdev_next-20250821_sriov-v3-3-e1b017c48d4a@quicinc.com>
References: <20250821-vdev_next-20250821_sriov-v3-0-e1b017c48d4a@quicinc.com>
In-Reply-To: <20250821-vdev_next-20250821_sriov-v3-0-e1b017c48d4a@quicinc.com>
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vivek Pernamitta <quic_vpernami@quicinc.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755780937; l=1027;
 i=<quic_vpernami@quicinc.com>; s=20241114; h=from:subject:message-id;
 bh=qr8Ef9ehxO8OfmV7ut4wJdhdstC+ERVhGTfP4QqsrVY=;
 b=YQxtiyrsRtTppZujJir2Kx/kLHmMWOynD0kCkuL1ZdRIzSMhOgo6y2FWx4yaPRMfj8QoJjsX7
 NWz6zHIEGQRCQ7td9hG07ROZhHLTeqdofjZ91/iQE8Cd1W0oUoPp08C
X-Developer-Key: i=<quic_vpernami@quicinc.com>; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: qjbHVTChXNnj0uYCbGJdMdxdqFHVHK1R
X-Authority-Analysis: v=2.4 cv=B83gEOtM c=1 sm=1 tr=0 ts=68a71752 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=1E9kmim99rDzh7857o0A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: qjbHVTChXNnj0uYCbGJdMdxdqFHVHK1R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX1JPO6DUcmNJV
 9koe1fdpUCdtPFYLiu2NuHhIV9AIxz0m7/yNxTbRBXcLL5LCTafJXq9vnx+Bgx/LneCyVMd4Imt
 mEUuSer9WHLS2wQBrAQUp7vUHK4kUc6798LWDx7Piz4usVOl0jxkX5JBv8HQ1kZYqgCqMv4sR9i
 jT9ubGdifgOWOwjJHzQ+OmYE2cmO5ojjVzbsVeBxwE4Y9U+bI9s98kZk4Z8RJl9IhU6tOU/hTeG
 qdHDnFBOOL17zWAPfVginVozQ6IfHANzAJlQGQIJzchHEOWJoF5W+OqjcTaD0ZbH6vgsrnwJfUL
 r08YiOqVEWl+/FIwXhV60vwM6EdSvjCvqiVL0H7ytBZmS78QeWjxEoVzygdKtnHn3YzCEbudm+N
 qzmZLt6i9t66/0d5o1YQ0omUeVl29Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

From: Vivek Pernamitta <quic_vpernami@quicinc.com>

Add SR-IOV support for PCIe devices.
pci_sriov_configure_simple() will enable or disable SR-IOV for devices
that don't require any specific PF setup before enabling SR-IOV.

Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/bus/mhi/host/pci_generic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index df18627a9feb4f2d53ba1ca6a4e8087dc23c7873..351b177cdf84057fb5a4e2f5b52279d7f1da41c2 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -1696,7 +1696,8 @@ static struct pci_driver mhi_pci_driver = {
 	.remove		= mhi_pci_remove,
 	.shutdown	= mhi_pci_shutdown,
 	.err_handler	= &mhi_pci_err_handler,
-	.driver.pm	= &mhi_pci_pm_ops
+	.driver.pm	= &mhi_pci_pm_ops,
+	.sriov_configure = pci_sriov_configure_simple,
 };
 module_pci_driver(mhi_pci_driver);
 

-- 
2.34.1


