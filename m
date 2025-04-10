Return-Path: <linux-arm-msm+bounces-53779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 439C0A83DB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 11:02:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 353F37B4226
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 09:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C00A20F063;
	Thu, 10 Apr 2025 09:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Gf7j3NVd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C9220E018;
	Thu, 10 Apr 2025 09:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744275693; cv=none; b=tWU+ftdq229mEVeUyj4cUasEk4AR7lsNxokd9Ax8VaoMYKNqWt8v8mzEvhrLYoLbgpNnoc3t9gv42AicD/aaUPRVqtmMv3honhQY07zyV5W/WlRhUfGI0Bpjl5nn/CzvbHuvzbgtEPxnnnwcnlxPVeYKi+JLxW7bIbTl6jzNueU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744275693; c=relaxed/simple;
	bh=tUQSUKhYffdLgwD+Sou2TYeZGd04K9nQry3dPSESS/k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fvXrNR2X2mur4N98ga9FcAPokEZ+1OAp/hph9FplWVcdoA2/NJURn2reTEkJC0dWqwq7YjVXRyiNDFKCKxtF56gdzISDV4kdvP2xNCKcgB2VKfprMzkR+Qomkd2C/G/+4lRKuuPZaxt70ZjEarNtg0ezPxK8Bi8hYWSyEF+2rR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Gf7j3NVd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A75IrS018659;
	Thu, 10 Apr 2025 09:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=H8hPxM5O+sBAlK9eOu7/1PBcvJNikE21va2
	FDb02X8s=; b=Gf7j3NVdPu2eiEQuwvJtsDvrWmfCp4IdS2l78ihNcB8GdUd5Fme
	U7T1wXqp+NK874shI6p860RAOoe8VPtQvQHqzK1nEcTKD8C9JsbJrwpoD42tH87q
	cvljbvg+EXFQX+zyc6IlXNPcygLg4dE9xepnk0h0cYUBZUtemimQt8Jv5RInDsEe
	RaOLu3AbieHy5y2bNNhDcSN9XvPI8TiJFPCR4W8dhsxWhE0kkWwjDAK7MexhaY+w
	dR8uml32OPA460V0Ira5E3iUCJJJ25R/lsz27sqK2NTygCHjd/YDD04qhr2rPT7B
	0OS4Q6plcx2Twfw1sjx7yDqmggIzPruyjSA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twdgpcjj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 09:01:08 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 53A9154I008740;
	Thu, 10 Apr 2025 09:01:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 45ue7g3rb8-1;
	Thu, 10 Apr 2025 09:01:05 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53A9147U008733;
	Thu, 10 Apr 2025 09:01:05 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 53A914Ju008731;
	Thu, 10 Apr 2025 09:01:04 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id ED7F950158F; Thu, 10 Apr 2025 14:31:03 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, bjorande@quicinc.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: quic_rdwivedi@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V3 0/9] Refactor phy powerup sequence
Date: Thu, 10 Apr 2025 14:30:53 +0530
Message-ID: <20250410090102.20781-1-quic_nitirawa@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=PJgP+eqC c=1 sm=1 tr=0 ts=67f788d4 cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=E6LSWowjyhIgIrQ5V_0A:9
X-Proofpoint-ORIG-GUID: xaGVPQTkn7gLvBa3GWJNQj3nKJanIqSA
X-Proofpoint-GUID: xaGVPQTkn7gLvBa3GWJNQj3nKJanIqSA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_01,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100067

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

Changes in v3:
1. Addresed neil and bjorn comment to align the order of the patch to
   maintain the bisectability compliance within the patch.
2. Addressed neil comment to move qmp_ufs_get_phy_reset() in a separate
   patch, inline qmp_ufs_com_init() inline.

Changes in v2:
1. Addressed vinod koul and manivannan comment to split the phy patch
   into multiple patches.
2. Addressed vinod's comment to reuse SW_PWRDN instead of creating
   new macros SW_PWRUP in phy-qcom-qmp-ufs.c.
3. Addressed Konrad's comment to optimize mutex lock in ufs-qcom.c
4. Addressed konrad and Manivannan comment to clean debug print in
   ufs-qcom.c

Nitin Rawat (9):
  scsi: ufs: qcom: add a new phy calibrate API call
  phy: qcom-qmp-ufs: Rename qmp_ufs_enable and qmp_ufs_power_on
  phy: qcom-qmp-ufs: Refactor phy_power_on and phy_calibrate callbacks
  phy: qcom-qmp-ufs: Refactor UFS PHY reset
  phy: qcom-qmp-ufs: Remove qmp_ufs_com_init()
  phy: qcom-qmp-ufs: Refactor qmp_ufs_exit callback.
  scsi: ufs: qcom : Refactor phy_power_on/off calls
  scsi: ufs: qcom : Introduce phy_power_on/off wrapper function
  scsi: ufs: qcom: Prevent calling phy_exit before phy_init

 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 145 ++++++++----------------
 drivers/ufs/host/ufs-qcom.c             |  96 ++++++++++------
 drivers/ufs/host/ufs-qcom.h             |   4 +
 3 files changed, 111 insertions(+), 134 deletions(-)

--
2.48.1


