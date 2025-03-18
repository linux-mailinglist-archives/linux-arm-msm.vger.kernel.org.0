Return-Path: <linux-arm-msm+bounces-51747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B768CA676D4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 15:51:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12D0F1778F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 14:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E12CF20FA8F;
	Tue, 18 Mar 2025 14:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NR3mQ3Cy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AD520F09D;
	Tue, 18 Mar 2025 14:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742309404; cv=none; b=q0GvlbiPDVm4kgmYBERieQ/DcFNAXB3x5WkZiFLkFl6xJT3v+AtFBKSHtcB+Tnjq5YEaQBNCw8CkqlovLg8+/jE83o44VUCWGVOaBpI0qP6UzKW2tYKMZjnUzODY1pxKD9AX2tHEspjTzHwrx7gXyNUsjltfMaLATaIvGHMcXSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742309404; c=relaxed/simple;
	bh=9MIsWUNVTUSuIYMJblDTPruxQ2h8+GQsOW72qK6KBRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SLUvH5VwrAbuEqOlv2p1zqgv3jDvQX3gDHTpKL1sJDJJMi+9GpV04lGDnY6U7WDcr5nNUt2RzSDNp7S+I4PfaphNZiNifj4iD8N9bMqEw/kfBUuLaWXT1dYfeg93m3+9hSkzD/zE8eNIZTD74PW1JONJ7jYU2S8MUE9dl2FG2Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NR3mQ3Cy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52I9KWQ3025504;
	Tue, 18 Mar 2025 14:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=10njL3lD/yON20tg7J1kRbyFtcoW9+l+SbB
	UuimWpa4=; b=NR3mQ3Cyh6fxLNfwGhs0rNjQzSyAaSeRMF8mcRS4ezcJv9QN8Rz
	0nmOxpo2xgaCoRrVaujOwwGUJyE9ybpKxnPzkOmObOHjNz6tTXFRq8oelEsU6qOS
	Al5+g2azZScHrWh2FZHvXR2fyedwe/HCLjnGaXqIe9QTHlpwgCJ10c6IO0NBX5Op
	pWUJh/85wsX9VJG5LAypw5GKKf9O9Kdg4DTU21Wsq56I3a7ffbjrzkpu90sTv732
	WGHFNQ4jt6pRSX0LTnmUKAo1DGL1uYR7+nlNOsQG7jeiVq4nxpsWPr1jp1Mzb+aO
	ppLIJL+FVPFeZLSGZl45XUrMCFrcDxESAbQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1tx8jmy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Mar 2025 14:49:50 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 52IEnlVm004267;
	Tue, 18 Mar 2025 14:49:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 45dkgmfv85-1;
	Tue, 18 Mar 2025 14:49:47 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 52IEnkEV004259;
	Tue, 18 Mar 2025 14:49:46 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 52IEnkke004255;
	Tue, 18 Mar 2025 14:49:46 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id D2F92501582; Tue, 18 Mar 2025 20:19:45 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        konrad.dybcio@oss.qualcomm.com
Cc: quic_rdwivedi@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V2 0/6] Refactor phy powerup sequence
Date: Tue, 18 Mar 2025 20:19:38 +0530
Message-ID: <20250318144944.19749-1-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=W/I4VQWk c=1 sm=1 tr=0 ts=67d9880e cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=E6LSWowjyhIgIrQ5V_0A:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: _uIPXnO38hNz-sGS245cFA1VJYz77Khq
X-Proofpoint-ORIG-GUID: _uIPXnO38hNz-sGS245cFA1VJYz77Khq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_07,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 spamscore=0 mlxlogscore=724 mlxscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180109

Refactor phy_power_on and phy_calibrate callbacks.

In Current code regulators enable, clks enable, calibrating UFS PHY,
start_serdes and polling PCS_ready_status are part of phy_power_on.

UFS PHY registers are retained after power collapse, meaning calibrating
UFS PHY, start_serdes and polling PCS_ready_status can be done only when
hba is powered_on, and not needed every time when phy_power_on is called
during resume. Hence keep the code which enables PHY's regulators & clks
in phy_power_on and move the rest steps into phy_calibrate function.

Since phy_power_on is separated out from phy calibrate, make separate calls
to phy_power_on and phy_calibrate calls from ufs qcom driver.

Also for better power saving, remove the phy_power_on/off calls from
resume/suspend path and put them to ufs_qcom_setup_clocks, so that
PHY's regulators & clks can be turned on/off along with UFS's clocks.

This patch series is tested on SM8550 QRD, SM8650 MTP , SM8750 MTP.

There is functional dependency between ufs-qcom and phy-qcom-qmp-ufs
and hence both the patches should be part of same merge window.

Changes in v2:
1. Addressed vinod koul and manivannan comment to split the phy patch
   into multiple patches.
2. Addressed vinod's comment to reuse SW_PWRDN instead of creating
   new macros SW_PWRUP in phy-qcom-qmp-ufs.c.
3. Addressed Konrad's comment to optimize mutex lock in ufs-qcom.c
4. Addressed konrad and Manivannan comment to clean debug print in
   ufs-qcom.c

Link to V1: https://lore.kernel.org/linux-kernel/20240112153348.2778-1-quic_nitirawa@quicinc.com/
---
Nitin Rawat (6):
  phy: qcom-qmp-ufs: Rename qmp_ufs_enable and qmp_ufs_power_on
  phy: qcom-qmp-ufs: Refactor phy_power_on and phy_calibrate callbacks
  phy: qcom-qmp-ufs: Refactor UFS PHY reset
  phy: qcom-qmp-ufs: Refactor qmp_ufs_exit callback.
  scsi: ufs: qcom : Refactor phy_power_on/off calls
  scsi: ufs: host : Introduce phy_power_on/off wrapper function

 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 141 ++++++++----------------
 drivers/ufs/host/ufs-qcom.c             |  92 ++++++++++------
 drivers/ufs/host/ufs-qcom.h             |   4 +
 3 files changed, 106 insertions(+), 131 deletions(-)

--
2.48.1


