Return-Path: <linux-arm-msm+bounces-55557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6681CA9BFA0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 09:19:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 21DD57A80A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 07:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A25E22D4F9;
	Fri, 25 Apr 2025 07:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hAmIe/Gg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A09442A83;
	Fri, 25 Apr 2025 07:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745565587; cv=none; b=W4n5d6SCGn1j3+gpLuFDiJ7iJCKMfEbAvcASBZ6/Zaz1y27d9F9PWcCne6imdjxf58oh9v6bm07BkVbu58J7JMP3T/OQKAFosFJdyWPOFxJIrdzMPkPIZWzjAuSS7QPcrinzKcKIuPxPDsf5qhwxwB98gLuPLlPX5kcvmsEkLd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745565587; c=relaxed/simple;
	bh=8NMMOhzyHx53nvFH0SHkVGO4bas49qy9M/TY62aWLMg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=SqN5OobiOzWUncw6VZg0ka2vI65I1ldeows9wsFoSFYZiS2Am8iBQO0d4tZCPqtFM32ZWPPEZiZyolUpYSh29TK2ue1O05eneA+tGjypzacNMT7DBW3whe6IzR4jzcwNhVygkBxv/vEMEG0EDud3NpudOtq4inyhECH03c0TfP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hAmIe/Gg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P17Cuf004387;
	Fri, 25 Apr 2025 07:19:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Gc/Lf+G+cUaKXx3gebwXGe
	RPxSrscOo5XoQn1EOU3tw=; b=hAmIe/Ggjswy+Aw+6HJt50JX/OjSa18KoXtvEP
	/QWTYRpLzPGZJwuFOPY3qn7O0tx0dN0h/CNXOuAqcicnsGHNUDhH5mU/IyjPe5Xz
	qiEtgRvEVKkwxwrn3qv9qExJeVAkkWCvOlbibu+zEFxhVbFfMC4TgIbSCJu3MYtO
	tihj87qOUKPpzd34n6qdwAWqMQ9ejRQmMj1GOAxG78cvd4d+eREAZ3vgGf4Y8Xz6
	antGSoSeYmW/vg7/jVjpP6m6mpr6XgTo0Jy+/Iuqn0jJgrFtcI60oWjJYGigJ1UB
	8yVf0CqP15qxOrt/3Jtzad7zAJThK1/mErkosTWePve94mjg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh17yjy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 07:19:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53P7JesY023804
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 07:19:40 GMT
Received: from [10.213.96.82] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 25 Apr
 2025 00:19:37 -0700
From: Vivek Pernamitta <quic_vpernami@quicinc.com>
Date: Fri, 25 Apr 2025 12:49:31 +0530
Subject: [PATCH v4] bus: mhi: host: pci: Disable runtime PM for QDU100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250425-vdev_next-20250411_pm_disable-v4-1-d4870a73ebf9@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAII3C2gC/5XNTQ6CMBCG4auYrq1h+gPoynsYQ6AzyiQKSLHBG
 O5uNS40LtTNJO+3eOYqPPVMXqxmV9FTYM9tE8PMZ8LVZbMnyRhbqETZxICRASkUDY2DfE5QdMc
 C2ZfVgaTVaAlKh8aSiEbX047Hh7/Zxq7ZD21/ebwLcF9/lQNIkLRMdZpl8bhyfTqz48YtXHsUd
 zuoVy//5qnoqQwxR6P1Tlefnv7L09FLILNVugSkFN69aZpuayu/imwBAAA=
X-Change-ID: 20250414-vdev_next-20250411_pm_disable-53d5e1acd45e
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vivek Pernamitta <quic_vpernami@quicinc.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745565577; l=2915;
 i=quic_vpernami@quicinc.com; s=20241114; h=from:subject:message-id;
 bh=8NMMOhzyHx53nvFH0SHkVGO4bas49qy9M/TY62aWLMg=;
 b=6Eeaa+kR0gv4pzH5+xx6jAfAXAEKbd3p8Eett9nUkkz6CRDT0CS15kO6LiL1QsKFJlIfcqp63
 cggx2KNVvcdB/OTlAnUOuKnwYi6mJP6lqK6R9nn3dCxVlYPM/BqKt3o
X-Developer-Key: i=quic_vpernami@quicinc.com; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mbQPUpZCvjZHTqpAJr6FMpQDOxkNfV6P
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=680b378f cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=dDV4axfZkvFAPaIAjLgA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: mbQPUpZCvjZHTqpAJr6FMpQDOxkNfV6P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA1MiBTYWx0ZWRfX36qowkrzfLv+ GssPt2YS8xS7Z9BC1MwyWxDV5vWG+/5/TKaYhcwRoXP1zPVkyruSIfS1BhTOdYCVzklBeMuKBP9 /gAJ1yczxB5qFvqaViTq3rdgrlwJvOAZFsOsUblfMYVoTuqNBwFgbnE2CwbYEOqdVCSANveGyJ/
 weqtMx1Y3giB7fk4V3CUpiLg5hWyxMIZGjocjyO93IjeNjjed0gYv4kmpPMBNzbUEYvzI6wt5k5 nFntLnPMmRut3NAhS7Gme/zjoozHDNyVUyxCnR65XAEqM+9nh7nnpyQggJvrCL9dMBKKer39xJ3 9H6fr28wgOEDOu9B/4UD2CbBSPVV38BK6a2GfjNos+tKc9JDmkn19KwMf+CWzprMWPwHKCCxnQM
 C3VBFytbrAejaVo+UjwBNXyvG2dUDh/SXsjAAGZlkwTJBnzydko2fbAkv6t9KJIyjLqY3jDM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250052

The QDU100 device does not support the MHI M3 state, necessitating the
disabling of runtime PM for this device. It is essential to disable
runtime PM if the device does not support M3 state.

Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v4:
- updated commit test from LPM to M3
- updated comments in code
- Link to v3: https://lore.kernel.org/r/20250418-vdev_next-20250411_pm_disable-v3-1-0175b691de61@quicinc.com

Changes in v3:
- updated variable to no_m3 from pm_disable 
- Link to v2: https://lore.kernel.org/r/20250418-vdev_next-20250411_pm_disable-v2-1-27dd8d433f3b@quicinc.com

Changes in v2:
- Updated device from getting runtime suspended by avoid skipping autosuspend.
- Updated commit message.
- Link to v1: https://lore.kernel.org/r/20250414-vdev_next-20250411_pm_disable-v1-1-e963677636ca@quicinc.com
---
 drivers/bus/mhi/host/pci_generic.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 03aa887952098661a488650053a357f883d1559b..49910b502d7c0b912f1dfba2c1ed6daa7b5583ef 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -43,6 +43,7 @@
  * @mru_default: default MRU size for MBIM network packets
  * @sideband_wake: Devices using dedicated sideband GPIO for wakeup instead
  *		   of inband wake support (such as sdx24)
+ * @no_m3: M3 is disabled
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
@@ -1270,8 +1273,8 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	/* start health check */
 	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
 
-	/* Only allow runtime-suspend if PME capable (for wakeup) */
-	if (pci_pme_capable(pdev, PCI_D3hot)) {
+	/* Allow runtime suspend only if both PME from D3Hot and M3 are supported */
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


