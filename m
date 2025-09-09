Return-Path: <linux-arm-msm+bounces-72679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1BEB4A199
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 07:52:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EBD64E5447
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 05:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B0292FABE0;
	Tue,  9 Sep 2025 05:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lVR7YWBE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7232E2DCD;
	Tue,  9 Sep 2025 05:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757397148; cv=none; b=XSjkon3kFjV/a6h1FiEGiM7W+WGugyenC/dXYKaMwT6vm8Ojv0qFR+VDr+EAvGxYrRL0Vrbeowm79j0B1J4amvnxHadOab+++H3U9Qm2YcqJ66TYGqslQ3iCBbZzIcQYpI0HYp5ysegoU0ZZIlw7lVbFtJOi3GBJ7NeMNioy2UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757397148; c=relaxed/simple;
	bh=l54sxJkmkSY/QyoOv0I5VGBqXVCiBtJ4v8pcpoReZm8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QaZgVpft/e2beyMhavIQDPHF6Wpd0i9klCrN7ixBW/OFPm09jbFR508z2S4etED6B26upKvetaxGVfOTU3BPY8eoZnDQzdEd+0RhI/FdXTLQm2HKEShErB1Kj8YcR4/pShW4KFhiyX1lVE7qzwS+L/p7vRzELAigfrQF+tVWZ0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lVR7YWBE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5895aSOT023688;
	Tue, 9 Sep 2025 05:52:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dL7GsDVtQdKBDAIxeDsqKf
	qpcFjCr5FEGhlA0nhfbtk=; b=lVR7YWBEBBqWX86kDAekYldFKJOd3q3gJebzen
	XMTfnkqwZ6oQJig6obAI272SVK8V8HQRa703KigsLisPTKBSON8AQ3dXZFgwrejD
	b61Ir0jF7irHTfxjUUerekaEaca8QrsEND1bLzhNKgt8HdONlkhchQvIP3MgOHvL
	HEIvZezGgTL2F8KdVStQRUmrXWI/haRPCz/nqM36D2prN1RKTNDD+txvWMfp1nC9
	wmFpA1z2KuJgDPrDfaxPYQU/9fxOKdHw9PLrX3J8zPdWEQMXsW5sKETkD+RMFE0c
	7x9HZZD0WWnj0TuYs7WSCzoANvOX05I8JS/KmuoSz5FMkoqQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4kxxcw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 05:52:21 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5895qK9F015700
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Sep 2025 05:52:20 GMT
Received: from hu-pkambar-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Mon, 8 Sep 2025 22:52:17 -0700
From: Palash Kambar <quic_pkambar@quicinc.com>
To: <mani@kernel.org>, <James.Bottomley@HansenPartnership.com>,
        <martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_nitirawa@quicinc.com>,
        Palash Kambar
	<quic_pkambar@quicinc.com>
Subject: [PATCH V2] ufs: ufs-qcom: disable lane clocks during phy hibern8
Date: Tue, 9 Sep 2025 11:21:49 +0530
Message-ID: <20250909055149.2068737-1-quic_pkambar@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX3Wu+PJYJ0Ja+
 QFbpA/QPLGIkC5fHmx0OLvQ0vWYiDVTACpaD/5C7kAaiqwuPu3PR5wWFPvrMBTG9xCHbj6fpfeI
 kILzUNAoLIn7RMVeTEfEVO7xNVZCzaeKhIjgKMJO7dYU3+PU+7FuvGYp7DwkBHo7DXuYX0JmIZ/
 m66IHZ1U0Cra2ZhgRWJF9TxJTEQrreOmwxSkBZG7oTLc0+LFd//wiU4QTeoFiR6OW2OVfeGECsW
 d7dokuh8Qc/CUXbSCPNxYcu1ag9/ZClaJSS378hYFO1nQtEfuDa1OUeF0Y4OAlqcIeqwbayfNZI
 pFeX3rxqtrMmQN1Sspo8gjac6mGH99M7+XgeAPxP/Hjr/g7HMaLjXPfbFZGHHQSjymboAJw72o8
 cD/7ObwY
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68bfc095 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=kiAvM8UDZNGtL6xdIh8A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 8AhqXpoW_ZwHXbrVECxR2_9DafHjHQ29
X-Proofpoint-ORIG-GUID: 8AhqXpoW_ZwHXbrVECxR2_9DafHjHQ29
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038

Currently, the UFS lane clocks remain enabled even after the link
enters the Hibern8 state and are only disabled during runtime/system
suspend.This patch modifies the behavior to disable the lane clocks
during ufs_qcom_setup_clocks(), which is invoked shortly after the
link enters Hibern8 via gate work.

While hibern8_notify() offers immediate control, toggling clocks on
every transition isn't ideal due to varied contexts like clock scaling.
Since setup_clocks() manages PHY/controller resources and is invoked
soon after Hibern8 entry, it serves as a central and stable point
for clock gating.

Signed-off-by: Palash Kambar <quic_pkambar@quicinc.com>

---
changes from V1:
1) Addressed Manivannan's comments and added detailed justification.
---
 drivers/ufs/host/ufs-qcom.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index c0761ccc1381..83ad25ce053d 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1092,6 +1092,13 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
 	case PRE_CHANGE:
 		if (on) {
 			ufs_qcom_icc_update_bw(host);
+			if (ufs_qcom_is_link_hibern8(hba)) {
+				err = ufs_qcom_enable_lane_clks(host);
+				if (err) {
+					dev_err(hba->dev, "enable lane clks failed, ret=%d\n", err);
+					return err;
+				}
+			}
 		} else {
 			if (!ufs_qcom_is_link_active(hba)) {
 				/* disable device ref_clk */
@@ -1105,6 +1112,9 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
 			if (ufshcd_is_hs_mode(&hba->pwr_info))
 				ufs_qcom_dev_ref_clk_ctrl(host, true);
 		} else {
+			if (ufs_qcom_is_link_hibern8(hba))
+				ufs_qcom_disable_lane_clks(host);
+
 			ufs_qcom_icc_set_bw(host, ufs_qcom_bw_table[MODE_MIN][0][0].mem_bw,
 					    ufs_qcom_bw_table[MODE_MIN][0][0].cfg_bw);
 		}
-- 
2.34.1


