Return-Path: <linux-arm-msm+bounces-54749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A7EA93815
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 15:48:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5B5F173877
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 13:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D03C288D6;
	Fri, 18 Apr 2025 13:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="B/w9QXaR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768868F64;
	Fri, 18 Apr 2025 13:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744984108; cv=none; b=uvxk/B56UW7CuP7TrBVSdUTGFG803wtadjMKzeinX6JE162EOPM4rHFYrlOH5lhmbwUJNn7ChctR62MN5w7aIocqQ5ngSkm3MAHa8dcmy549rT2guZsrOcAr24Bu/+UhUCmJCurnH4LRT+icKsJpUJ1pDD65yGnf9+oJmwdjnRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744984108; c=relaxed/simple;
	bh=6B1CKiXxAZkdN7WWlm2JMzsnzBbNc1tTRxVI2i0AV4I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=gh0SVbuBoro3PPPyvc4yI14WpJippzdYSHczR+mm/rl21LqJyDTbfK9SSGxTsEQuk6F2MebIPg+ySaQ8kRqlD+Vk8oaDYVnZbwf3MCXxOz96pusjFay2zz15CVRUvixYAQcwYa4x3x7aEZE/bEuI8EI7X1VLnTPQLIPdYRT11rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B/w9QXaR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I26ack012766;
	Fri, 18 Apr 2025 13:48:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=l65fv0IrjUsupjWI9vZJKA
	qavb08y/m7vLChm8fESfk=; b=B/w9QXaR4xduM0Ca3/TvCqRvhvFS7mcdJNpBNB
	JjaOA813x/xFVxC1g19SKOyzZN5GiP8Dv0BRe1i5WXQ+1T/sI4AyQdyi1QfXx1qL
	SVefPfJ8wt5xR94AbP4FodpUZWicHdgjnlWVVuMRqAQ8H0QA0em+jbhNq7SoF3Vh
	FuC9tVAvExTBqjQBZ9ycbdmwCkPujqSbQrtj0GJmkqMUCgbfRbQh++L0PEKHlFzf
	VzkCl31IIqPmfxNImYDqI6JDsHm7qdMLvyzxUv0TDtygwooiNxKvOcCPGuDXbFzy
	oPePUohZfUbOk8l3ujDn4RKbvdGUB87dylPX54Q0QTT5Atdw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf4vt7a9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 13:48:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53IDmN1c016722
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 13:48:23 GMT
Received: from [10.213.96.82] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 18 Apr
 2025 06:48:21 -0700
From: Vivek Pernamitta <quic_vpernami@quicinc.com>
Date: Fri, 18 Apr 2025 19:18:18 +0530
Subject: [PATCH v3] bus: mhi: host: pci: Disable runtime PM for QDU100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250418-vdev_next-20250411_pm_disable-v3-1-0175b691de61@quicinc.com>
X-B4-Tracking: v=1; b=H4sIACFYAmgC/43Nyw6CMBCF4VchXVtDL1x05XsYQ0o7yCRSsMUGQ
 3h3C3GhK91M8p/FNzPx4BA8OSYzcRDQY29jiF1CdKvsFSia2ISnPEslkzQYCJWFaaTviVVDVxn
 0qr4BzYTJgCltZAYkGoODBqfNP19it+jH3j23d4Gt679yYJRROOQiL4p4tDrdH6jR6r3uO7Lag
 X965S+PR48XxpRGCtGI+ttbluUF6sH/PhwBAAA=
X-Change-ID: 20250414-vdev_next-20250411_pm_disable-53d5e1acd45e
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vivek Pernamitta <quic_vpernami@quicinc.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744984101; l=2807;
 i=quic_vpernami@quicinc.com; s=20241114; h=from:subject:message-id;
 bh=6B1CKiXxAZkdN7WWlm2JMzsnzBbNc1tTRxVI2i0AV4I=;
 b=UJmYOZvJeMJ6ihPqinHK15hEGgKgD1F2+Wrwe9ISpNwCGayPQQdL/K6359oO5H8KXI35fYD3+
 35zabAUjVkNDsk4BIVh4dwziZF23IHaCUbSqKWSaYaFyOLdy1m3qUSr
X-Developer-Key: i=quic_vpernami@quicinc.com; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: zHvbwSiber6akR9sSaGAy79GPNuoHAD-
X-Authority-Analysis: v=2.4 cv=IZ6HWXqa c=1 sm=1 tr=0 ts=68025828 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=dNNGETbyopK12yFIz90A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: zHvbwSiber6akR9sSaGAy79GPNuoHAD-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_04,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180102

The QDU100 device does not support the MHI M3 state, necessitating the
disabling of runtime PM for this device. It is essential to disable
runtime PM if the device does not support Low Power Mode (LPM).

Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v3:
- updated variable to no_m3 from pm_disable 
- Link to v2: https://lore.kernel.org/r/20250418-vdev_next-20250411_pm_disable-v2-1-27dd8d433f3b@quicinc.com

Changes in v2:
- Updated device from getting runtime suspended by avoid skipping autosuspend.
- Updated commit message.
- Link to v1: https://lore.kernel.org/r/20250414-vdev_next-20250411_pm_disable-v1-1-e963677636ca@quicinc.com
---
 drivers/bus/mhi/host/pci_generic.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 03aa887952098661a488650053a357f883d1559b..df80f3f62278d2cf96066c04926ce1ce58700d1b 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -43,6 +43,7 @@
  * @mru_default: default MRU size for MBIM network packets
  * @sideband_wake: Devices using dedicated sideband GPIO for wakeup instead
  *		   of inband wake support (such as sdx24)
+ * @no_m3: M3 is disabled (optional)
  */
 struct mhi_pci_dev_info {
 	const struct mhi_controller_config *config;
@@ -54,6 +55,7 @@ struct mhi_pci_dev_info {
 	unsigned int dma_data_width;
 	unsigned int mru_default;
 	bool sideband_wake;
+	bool no_m3;
 };
 
 #define MHI_CHANNEL_CONFIG_UL(ch_num, ch_name, el_count, ev_ring) \
@@ -295,6 +297,7 @@ static const struct mhi_pci_dev_info mhi_qcom_qdu100_info = {
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
 	.dma_data_width = 32,
 	.sideband_wake = false,
+	.no_m3 = true,
 };
 
 static const struct mhi_channel_config mhi_qcom_sa8775p_channels[] = {
@@ -1270,8 +1273,11 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	/* start health check */
 	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
 
-	/* Only allow runtime-suspend if PME capable (for wakeup) */
-	if (pci_pme_capable(pdev, PCI_D3hot)) {
+	/**
+	 * Disable Runtime PM if device doesn't support MHI M3 state
+	 * and Allow runtime-suspend if PME capable (for wakeup)
+	 */
+	if (pci_pme_capable(pdev, PCI_D3hot) && !(info->no_m3)) {
 		pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
 		pm_runtime_use_autosuspend(&pdev->dev);
 		pm_runtime_mark_last_busy(&pdev->dev);

---
base-commit: 01c6df60d5d4ae00cd5c1648818744838bba7763
change-id: 20250414-vdev_next-20250411_pm_disable-53d5e1acd45e

Best regards,
-- 
Vivek Pernamitta <quic_vpernami@quicinc.com>


