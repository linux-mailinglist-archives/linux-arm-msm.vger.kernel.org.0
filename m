Return-Path: <linux-arm-msm+bounces-58094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BD291AB8C53
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 18:27:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C372A3AAA33
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 16:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC28121FF33;
	Thu, 15 May 2025 16:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IjoqxH6M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2255421FF26;
	Thu, 15 May 2025 16:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747326473; cv=none; b=fWz8PwvElhRlVbK5QFVxah7EoAK224VjXfaBL+DKbj4szpJPlGzpilBYcWjfXr6hOfzrf4nFiggPjnlouBi6YOKgpHGtBHF8o18/s1UNs6xHTG3t4TuKf1eMeYXn8kHbp9maakMKcGk6QB1zaUQFplwUnbek84HQZrJgGcJ7m2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747326473; c=relaxed/simple;
	bh=Tp6j8s7B8rKOVUi2wSmpBr5sOLIQkAj3HU0RtTFq0OM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aH0FMFjrZxLPMS9otAhcnx2Bd1WVoBla8nrU9nhAuAKS+cHH5vIo55jIOFThzIsqNgZu37VLTq4BqAWYJRcVO/n+4T63vuHA8nlZGU8PJS0zUTu5Oo72Qry4z5i6tH7mcUUFDlRGjz0habGbbhbm1B6FbUdrSfuEFvZ7BQNilWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IjoqxH6M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFBjn014558;
	Thu, 15 May 2025 16:27:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=21P27QP8dWWsKUv/wFl+YXaQneJvh/hoTQQ
	xvSGm0HM=; b=IjoqxH6MnUnjhztq9vxHNooRzEG1Ghldk19WRROlUV1vaaXmbRP
	7ZV5BPU65OzsxMAWoz15pPsv3xJ5pWnYO/rRqSJTysWI5Cv3mqo+cPGi9YubTM8S
	Hq7x9Xb79sMc9A+/nUIXEapYcXNCZiZvEOYwvUF07In/OofxcfkH2Nj4mUiCMkxg
	fVUxDhrH63wved2mzPTNTYQnscsGjY9uSHlxPDrnuxC2MWYmngowEeRhHZ/E2Lt9
	7qZ4qM3eGXOgaJVL+Q5CKhRPdBVTl26L4iFRYd6UbZY53VKd52GeZ6mNyf7uuxA9
	U6g838ahfR9yY00ClQVstmaw9tzh+QWsh2Q==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcpeyxb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 16:27:28 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54FGRPej023534;
	Thu, 15 May 2025 16:27:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46hyvmvnmy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 15 May 2025 16:27:25 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54FGRPSh023527;
	Thu, 15 May 2025 16:27:25 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 54FGROGj023525;
	Thu, 15 May 2025 16:27:25 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 37BB05015B0; Thu, 15 May 2025 21:57:24 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Cc: quic_rdwivedi@quicinc.com, quic_cang@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V5 00/11] Refactor ufs phy powerup sequence
Date: Thu, 15 May 2025 21:57:11 +0530
Message-ID: <20250515162722.6933-1-quic_nitirawa@quicinc.com>
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
X-Proofpoint-GUID: LbgDew2x7Op_sIUadXoZc0OCR0D4Trrr
X-Proofpoint-ORIG-GUID: LbgDew2x7Op_sIUadXoZc0OCR0D4Trrr
X-Authority-Analysis: v=2.4 cv=cO7gskeN c=1 sm=1 tr=0 ts=682615f1 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=D06968NiBJqSOUjID_UA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE2MyBTYWx0ZWRfXzHjHJB2zhqAR
 L81ddum1HG6XXwN0eNB4i5qM3N+6jabYYYGe58BAX0oi2zFfj82GpwiwKqj5EQRAnCEODkIotpb
 wvn9KxPdWG2v6+jbmbVF3lrsx1h8sTGkcBosriYmJ1erDBjVpYLKa9WPN8cchBPTdJFQrdNOy1V
 TJx21RYz/bMZ5XU7pl9j6OXzaJ8RtkA0TcI35d2kAckiz6eARccEE/bNV+a7KtPRO6OUlCzj/4Z
 dDxTpsxO4ehSqAVJkNSMkKfBI7yizbwDXNZPG0ze0DE1T7whr5r7KpwcID7BsWbdwDEtNgpeG3f
 k5JFex78O/+fnjV7SNlby55ySZJQQjGtfpdSblR/Nq865UU/cKWatiBryUxYnFP67FkPH8N0YVc
 NdUdxWfqKmWWfNBny0ODVA3WGJRQSvlnhmzguYBhphr9gcXx5S9S6d6AEJmmobFUt02YlTf9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_07,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150163

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

Note: Patch 1 of this series is a requirement for the rest of the PHY
      patches for the functional dependency.

Changes in v5:
1. Addressed Dmitry's comment to inline inline qmp_ufs_exit into
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

Nitin Rawat (11):
  scsi: ufs: qcom: add a new phy calibrate API call
  phy: qcom-qmp-ufs: Rename qmp_ufs_enable and qmp_ufs_power_on
  phy: qcom-qmp-ufs: Refactor phy_power_on and phy_calibrate callbacks
  phy: qcom-qmp-ufs: Refactor UFS PHY reset
  phy: qcom-qmp-ufs: Remove qmp_ufs_com_init()
  phy: qcom-qmp-ufs: Rename qmp_ufs_power_off
  phy: qcom-qmp-ufs: Remove qmp_ufs_exit() and Inline qmp_ufs_com_exit()
  phy: qcom-qmp-ufs: refactor qmp_ufs_power_off
  scsi: ufs: qcom : Refactor phy_power_on/off calls
  scsi: ufs: qcom : Introduce phy_power_on/off wrapper function
  scsi: ufs: qcom: Prevent calling phy_exit before phy_init

 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 145 ++++++++----------------
 drivers/ufs/host/ufs-qcom.c             | 102 +++++++++++------
 drivers/ufs/host/ufs-qcom.h             |   4 +
 3 files changed, 117 insertions(+), 134 deletions(-)

--
2.48.1


