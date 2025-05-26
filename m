Return-Path: <linux-arm-msm+bounces-59451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E855AC4270
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 17:40:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACB6017AA94
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 15:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACBCB21A928;
	Mon, 26 May 2025 15:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KQfU6yq0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1ED218858;
	Mon, 26 May 2025 15:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748273938; cv=none; b=p4wqGeEP+8TOo41jcvOpTMZugUt0tFeiUSRAhetViWNhvBmaXxi/Dhbzw3RIG1K/rFODX9lqW8qZTzOfnJPD+GTZF+XBpctfu2lOieLeOhbGFJhr/jdTwPGROpK8KgOfpzD9e+ekQPENwxRobC2/WwGdcWktRCFglNW64LgtdcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748273938; c=relaxed/simple;
	bh=5lAp4wbEyrKWdqiL1ZH+0TvdNsSNuxx0kGakE//b4JQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uWx89uCp7Lw0mbCfLGWxHF0gST6gWCyUhbIhBwoIxshBLd/ejnsYlO2euMgzCb81AO8MOuafQWBb0zv4xSqlhavvhy0u3KVFu3wDM2FWNGCX/aK9PEq+4j1EVnlwlmolI50M5unM1o+IGyAGxeLiGAyS1O5pq0+kJEvn+LjLfkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KQfU6yq0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54QAOMIM004744;
	Mon, 26 May 2025 15:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=RKJ1uQGO53UeDW+tiWM3x0JDBVQ0sZZomwD
	JKe6Mg3I=; b=KQfU6yq0qis7OnCrYwFtkK/cYrPN38Ir5Zz7kw0PEgPfGr7TPmT
	YcWZZ+laZDuOJkvH3kCvmlO/sOAEQAjg4tH+xN9G3Z4QzJ2lkOK+KoWgfKgOW8LV
	lzjMulUjPpJ6vl7EZjTies7V84TTjqRqSPBD7eUNV2Rl6A4E2GzuaNCwETme2JJC
	Z8fUTa5YjwxzRUXiQHjGX0reQVTlw2yo9nMce2tnhV4KksEe8JuZPQCF/0vkQ2yy
	W2ieKuRrBpV7l7+YDCTrgNWQq5O4aNMXyXoF2+IOeELS5TnrcNAjbOj/SxhYBUZa
	9GBucSDxMemoejsq4JvVige+9wozUoAgLDg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5ejvhsk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 15:38:27 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54QFcOWe032411;
	Mon, 26 May 2025 15:38:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46u76m73fn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 26 May 2025 15:38:24 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54QFcOOZ032404;
	Mon, 26 May 2025 15:38:24 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 54QFcNET032402;
	Mon, 26 May 2025 15:38:24 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 135FD602733; Mon, 26 May 2025 21:08:23 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Cc: quic_rdwivedi@quicinc.com, quic_cang@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V6 00/10] Refactor ufs phy powerup sequence
Date: Mon, 26 May 2025 21:08:11 +0530
Message-ID: <20250526153821.7918-1-quic_nitirawa@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=GIgIEvNK c=1 sm=1 tr=0 ts=68348af4 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=D06968NiBJqSOUjID_UA:9
X-Proofpoint-ORIG-GUID: jpYMOcDrtfNcwjZQ09zfBSvQlnpQ8n0e
X-Proofpoint-GUID: jpYMOcDrtfNcwjZQ09zfBSvQlnpQ8n0e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI2MDEzMiBTYWx0ZWRfX7EvZQV+WS3oN
 6x1MZWI9gbvvHQJVDv/R8QpH7RyV/mGmF7zDclfbwGX9yDxiM7MnSzHn4qIdlUQdSvE8JRIUuHT
 eXwysn6EG1ThDCUL1stUfsm1FZl8TxYRoI45ZiGKJrfsdZ44Q6MUPj8Ttn0j185y2MrQLl7N6RJ
 D5MgcRmw3S1Ndsl99Re56lDCsERdr3DdPQyp/P/5pMjHiSphsMie73EF9t71q403RTpJlJDoeQE
 Y8eYOCa3pOcdSlnMK/yDbYa+ZIFf4DuSWI4FjUivlxEs4BmtJMk2uccR35IP5Pi3IAcSTA/wuV4
 JxjZDiNeJAz1Ygs7WHfqU4JqgoAwmci+YlV2KnfVhPtPAuNA8PolYsaCLtzPiupaJ/oPIF7FPJz
 SgmNd+mxkJninY09Cvf/omxjS6DgHB59mwlgTAENDAwbjJKD8bRqMP7EsoNwOKMUlVHwq93x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_08,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505260132

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

Note: Patch 2 of this series is a requirement for the rest of the PHY
      patches(patch 3 - patch 9) for the functional dependency and
      Patch 1 is a fix for existing issues, which doesn't have any
      dependencies on any other changes.

Changes in v6:
1. Addressed Konrad's and Manivannan's comments to move patch11
   of v5 to start of the series so that it can be applied
   separately if needed.
2. Addessed manivannan's comment to improve commit text for few patch.
   and remove few trivial comments and minor code improvement.
3. Removed patch 10 (Introduce phy_power_on/off wrapper function)
   of last patchset as it is not needed.

Changes in v5:
1. Addressed Dmitry's comment to inline qmp_ufs_exit into
   qmp_ufs_power_off
2. Addrsssed Konrad's comment to improve code identation and updating
   kernel doc to update the info regarding controller and phy clocks
   being managed together.
3. Addrsssed Konrad's comment to update commit text for patch #10 to
   improve explanation to maintain separate ref_count in ufs controller
   driver.


Changes in v4:
1. Addressed Dmitry's comment to update cover letter to mention patch1
   as a requirement for the rest of the PHY patches.
2. Addressed Dmitry's comment to move parsing UFS PHY reset handle logic
   to init from probe to avoid probe failure.
3. Addressed Dmitry's comment to update commit text to reflect reason
   to remove qmp_ufs_com_init() (Patch 7 of current series)
4. Addrssed Konrad's comment to return failure from power up sequence when
    phy_calibrate return failure and modify the debug print.

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

Nitin Rawat (10):
  scsi: ufs: qcom: Prevent calling phy_exit before phy_init
  scsi: ufs: qcom: add a new phy calibrate API call
  phy: qcom-qmp-ufs: Rename qmp_ufs_enable and qmp_ufs_power_on
  phy: qcom-qmp-ufs: Refactor phy_power_on and phy_calibrate callbacks
  phy: qcom-qmp-ufs: Refactor UFS PHY reset
  phy: qcom-qmp-ufs: Remove qmp_ufs_com_init()
  phy: qcom-qmp-ufs: Rename qmp_ufs_power_off
  phy: qcom-qmp-ufs: Remove qmp_ufs_exit() and Inline qmp_ufs_com_exit()
  phy: qcom-qmp-ufs: refactor qmp_ufs_power_off
  scsi: ufs: qcom : Refactor phy_power_on/off calls

 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 141 +++++++-----------------
 drivers/ufs/host/ufs-qcom.c             |  69 ++++++------
 2 files changed, 77 insertions(+), 133 deletions(-)

--
2.48.1


