Return-Path: <linux-arm-msm+bounces-56984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8988EAACB2C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 18:38:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 035961C07142
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 16:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96C49284B5E;
	Tue,  6 May 2025 16:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EhpirLcY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91A5284B5B;
	Tue,  6 May 2025 16:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746549466; cv=none; b=n+d5QQ4UbJ+It012APu0n+jZfVslTfu+8kZMx4ppFyXDfiM1D3upyI9zVRmnZiOpuK4Gyu6oyjaA6uhSXLlu4NR3492I1Ph3EbOcqsxt1+9NGm44gdud/al/QzyZbZGpbUHefxm/EJR3CjtCCa7Ae3JNT/e2E0gOk9q/ZghNldg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746549466; c=relaxed/simple;
	bh=ZZLYZRqalGJH9EAXC5H7UDkMrkHsVeFSxTdaPceNAig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ChrPE4rujm7NYC3zm37Vi/NUefWSd7hhhDXA3gB9WSC//IQ2o5h9Vf+9bsMi/GT5TNwStlOCTad6vQPgUdD9oAVcsJt426MfWdiLEx2qKxbGzyvt/Nk/Ann/TsH30gL7PSbxtnRXRgFAHEupNHXhIYpARgGlmHLFauK76Wos3c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EhpirLcY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5468npYU007245;
	Tue, 6 May 2025 16:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=yc2RUdCvkXOSy1TyTmx0o2WlO+CFm9kYTZ9
	ABmGDDAk=; b=EhpirLcYCFJa8yPw7UeNefeozzx4MGSJma9LK+C+Dy+5uQiv9km
	krajxdCWNg30p3xY4idzqKukLW/35uI//F5Q0c3NxoSxaM2Y6WDyLmqFFE7xFgAL
	XIKmrsmsVqed54pil7v4mTk/7nNKdvQVxdyf4B4F9DMl3gVfUlYge3tWR4lwQSMD
	D8qX+8HKKevm7tYYxLY29Dv/MvlRAJtnj7NQkwBGc2/apJNaTtRZnorV0q1LTfAU
	HWFiTvv/dS6H5C6knVBd4l5TJaRZ3euehNI6ouCfvFmMzLQdE84lSgpYujjoSGg6
	TCfIq+gl4ftW84zDUV5GTDzyVvHziwBZ5Qg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5wg2w12-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 16:37:12 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 546Gb8TQ003105;
	Tue, 6 May 2025 16:37:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 46dc7kx4m1-1;
	Tue, 06 May 2025 16:37:08 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 546Gb8Yw003100;
	Tue, 6 May 2025 16:37:08 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 546Gb8jb003099;
	Tue, 06 May 2025 16:37:08 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 7CA6A5015A9; Tue,  6 May 2025 22:07:07 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org,
        krzk+dt@kernel.org, robh@kernel.org, mani@kernel.org,
        conor+dt@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, beanhuo@micron.com,
        peter.wang@mediatek.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V2 0/3] Add support to disable UFS LPM
Date: Tue,  6 May 2025 22:07:02 +0530
Message-ID: <20250506163705.31518-1-quic_nitirawa@quicinc.com>
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
X-Proofpoint-ORIG-GUID: b2DvvsqmjbUmr2U_S87zoWaWCBXfa1ic
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDE1NyBTYWx0ZWRfX4T/A3BJQPQx8
 XMS4V4Z/adm2zLYd5FQ1pK/UVbXv+e2lVi40tjct3iC3aD64TKyC/IbM+9PkAaMgxjF6Wz7Vu4U
 ydZEFtzY4xss9WdIgaXc50M5wNhUiRGaTDGMURT5E7FGFKbyOTqv6+Kjz4khezwonyVdNqtPjMf
 P/rGpoj/oevWrvA6E13DvvJcxaT/LJJP4SmS2mmZKPlv8vPqW1JT5sKY2vr2K4Gw7Q2iOPhKdVS
 WAYvFH2YC+5N0zun69dHlFd2KqfrGYCUCs2wupedsvMWd2LIgslxrx67FUlsAtnGNYHACbdlywN
 iLKsWCDHa/RevUwrJ+NxDQUUdfuKyxdcnzq1d+ZjQyoIBryoeRUE8oilc8eTQMLYZudA0t5Eq1z
 Tgc+CUIwfUz/psL7jYm0O4th96brcaSDPk6VIgHtNCjdjIKArWJAWZUejww4roFT8XPBLhKQ
X-Authority-Analysis: v=2.4 cv=dPemmPZb c=1 sm=1 tr=0 ts=681a3ab8 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=DcltoM30VHtk37mhClIA:9
X-Proofpoint-GUID: b2DvvsqmjbUmr2U_S87zoWaWCBXfa1ic
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_07,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 mlxlogscore=942 priorityscore=1501 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060157

Add support to disable UFS Low Power Mode (LPM) for platforms
that doesn't support LPM.

Changes in v2:
1. Addressed peter wang's comment to exclude write booster from
   ufs lpm check.
2. Addressed rob herring's comment to remove ufs lpm debug print
   in ufshcd-pltr.c

Nitin Rawat (3):
  scsi: ufs: dt-bindings: Document UFS Disable LPM property
  scsi: ufs: pltfrm: Add parsing support for disable LPM property
  scsi: ufs: qcom: Add support to disable UFS LPM Feature

 .../devicetree/bindings/ufs/ufs-common.yaml         |  5 +++++
 drivers/ufs/host/ufs-qcom.c                         | 13 ++++++++-----
 drivers/ufs/host/ufshcd-pltfrm.c                    | 13 +++++++++++++
 include/ufs/ufshcd.h                                |  1 +
 4 files changed, 27 insertions(+), 5 deletions(-)

--
2.48.1


