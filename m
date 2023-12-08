Return-Path: <linux-arm-msm+bounces-4014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 145CE80A8FB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 17:31:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45F831C209C8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 16:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9791E38FB3;
	Fri,  8 Dec 2023 16:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SUW1i7iJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C4B01998
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 08:31:47 -0800 (PST)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B8FZ5eZ010556;
	Fri, 8 Dec 2023 16:31:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=0/xFryJYdQtGqhQu7j0ktsPp2eeMwd1xi2TFweVHTyQ=;
 b=SUW1i7iJqGrbn5X1/6N74N/NdhU/HrvkAFgZmt7pz/fKfcCQiqWemwuISLx9m5/ALud4
 X+2A6IuVFuPapX1Vvxs+liOpNDUelvhGk/nwfSz8h5x3ynz0oTkuuVmyqlANjge0zubK
 ksLTxO8dVv6uu1LnIUEobvRKGY1Ocnrc+xtVv/jeudNsoywtjTWHoLGpJhW3bub0+iXP
 +zK8cUzZUlvLCXRQIdpyhAVK7iY2oSWgNacoXHMTURh9/39W4E0TVpH4RWOltnkLmOJn
 9pNbfAEoAyVrI4zl7YLY+pCkYX8U7u6sLO8bvwhRr1ru0WZyJO3t5Xcz16YMYKVsHreO lg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uv5wpg63q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Dec 2023 16:31:30 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B8GVTZ6016675
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 8 Dec 2023 16:31:29 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 8 Dec 2023 08:31:28 -0800
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
        <stanislaw.gruszka@linux.intel.com>,
        <jacek.lawrynowicz@linux.intel.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH 2/2] accel/qaic: Implement quirk for SOC_HW_VERSION
Date: Fri, 8 Dec 2023 09:31:01 -0700
Message-ID: <20231208163101.1295769-3-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231208163101.1295769-1-quic_jhugo@quicinc.com>
References: <20231208163101.1295769-1-quic_jhugo@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cV-CnrrWz-tyOuhKjv8ij5S20HX6ooOE
X-Proofpoint-ORIG-GUID: cV-CnrrWz-tyOuhKjv8ij5S20HX6ooOE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-08_11,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 clxscore=1011 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312080136

The SOC_HW_VERSION register in the BHI space is not correctly initialized
by the device and in many cases contains uninitialized data. The register
could contain 0xFFFFFFFF which is a special value to indicate a link
error in PCIe, therefore if observed, we could incorrectly think the
device is down.

Intercept reads for this register, and provide the correct value - every
production instance would read 0x60110200 if the device was operating as
intended.

Fixes: a36bf7af868b ("accel/qaic: Add MHI controller")
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
---
 drivers/accel/qaic/mhi_controller.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/qaic/mhi_controller.c b/drivers/accel/qaic/mhi_controller.c
index 5036e58e7235..1405623b03e4 100644
--- a/drivers/accel/qaic/mhi_controller.c
+++ b/drivers/accel/qaic/mhi_controller.c
@@ -404,8 +404,21 @@ static struct mhi_controller_config aic100_config = {
 
 static int mhi_read_reg(struct mhi_controller *mhi_cntrl, void __iomem *addr, u32 *out)
 {
-	u32 tmp = readl_relaxed(addr);
+	u32 tmp;
 
+	/*
+	 * SOC_HW_VERSION quirk
+	 * The SOC_HW_VERSION register (offset 0x224) is not reliable and
+	 * may contain uninitialized values, including 0xFFFFFFFF. This could
+	 * cause a false positive link down error.  Instead, intercept any
+	 * reads and provide the correct value of the register.
+	 */
+	if (addr - mhi_cntrl->regs == 0x224) {
+		*out = 0x60110200;
+		return 0;
+	}
+
+	tmp = readl_relaxed(addr);
 	if (tmp == U32_MAX)
 		return -EIO;
 
-- 
2.34.1


