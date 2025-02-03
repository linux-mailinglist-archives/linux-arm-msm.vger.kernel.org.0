Return-Path: <linux-arm-msm+bounces-46705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F23A253F9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 09:15:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE7211881171
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 08:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E948207658;
	Mon,  3 Feb 2025 08:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="C1/ZZc3v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25301FCCFB;
	Mon,  3 Feb 2025 08:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738570315; cv=none; b=SY31kSUdCSthH6UkDAHyHPR/UMeK6OeA7EHiTNqGKf+7EVKsHE0rAGFVw2V0pEw0ekKqZOAffRPe8nsJ64NLJNdpC9zKPVYVHZFVXuMYU6o5wyFVdLDPVGZ7foRYGsacHl7xHupE2dSTbvJZ4+j3LAEbCN3UhNsfm3QjVV7ifNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738570315; c=relaxed/simple;
	bh=RchZ7Z4LdwylAoZF9HmlrUVJfPPWcTziUh4pImjfkAU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=TbNuNAq2GQAX0FAO7DwAXCnhSVi3OU2BUeNYjn7QVWFO/mNEqz9gBdk77PZEu0aU3ZJGVXGSEUy10za/ngKG2vp9HSzOerkvGDGyFUyk94TtFK/tIoDDly1KhqGJbUrr56Oto7kY4ARua80uNt73BMSqXrYIBK0zHpxlEnifDTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=C1/ZZc3v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 512KqXs6022506;
	Mon, 3 Feb 2025 08:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uOeb8efLQiEOJZxiEbHRsS
	qxowE6l9kgH/W2YzzMtQE=; b=C1/ZZc3v5CjA1wgv7weTJ5RZgZgySsE3wk5LLD
	55Fs8rFAIWbV+tDm4l5JoD2Bmb4J+iOtbP59vXjr2m0xUx0np8sa0bQNIZUZTddl
	nKPRXgnxzWuy++9fLUXH8VtFh4hKAxdPGQ3NIvUA53QQwD+bjtAyvwEAoGeFDssi
	4grgDIDoyoVkVZ00URQjvfpPUhcXvHsm60BNN1qpJX+Fl41hKfSZ3bp82Bkx4joq
	gBa/QwJUXAlw//EKlcB1VHh0pFIo4VLpoq5yvYVjgB+p0UetEy7pPLECKXyiFYkF
	XRaJqUr+RHrybHmxVLCuRj7lTeDrm2ch3cmFAHTEhwPExbaw==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jd429238-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 08:11:23 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5138BJxr013123;
	Mon, 3 Feb 2025 08:11:19 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 44hcpkhs9n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 08:11:19 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5138BJoB013118;
	Mon, 3 Feb 2025 08:11:19 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 5138BJC7013114
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 08:11:19 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id 0FD1A40BFE; Mon,  3 Feb 2025 16:11:18 +0800 (CST)
From: Ziqi Chen <quic_ziqichen@quicinc.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com, quic_ziqichen@quicinc.com,
        quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
        quic_rampraka@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support:Keyword:mediatek),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support:Keyword:mediatek),
        linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support:Keyword:mediatek)
Subject: [PATCH v3 0/8] Support Multi-frequency scale for UFS
Date: Mon,  3 Feb 2025 16:11:01 +0800
Message-Id: <20250203081109.1614395-1-quic_ziqichen@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ugiwuoD0R0Q0RPMlmh3RWsC-Co_GUm0y
X-Proofpoint-ORIG-GUID: ugiwuoD0R0Q0RPMlmh3RWsC-Co_GUm0y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_03,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 malwarescore=0
 spamscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030065

With OPP V2 enabled, devfreq can scale clocks amongst multiple frequency
plans. However, the gear speed is only toggled between min and max during
clock scaling. Enable multi-level gear scaling by mapping clock frequencies
to gear speeds, so that when devfreq scales clock frequencies we can put
the UFS link at the appropraite gear speeds accordingly.

This series has been tested on below platforms -
sm8550 mtp + UFS3.1
SM8650 MTP + UFS3.1
SM8750 MTP + UFS4.0

v1 -> v2:
1. Withdraw old patch 8/8 "ARM: dts: msm: Use Operation Points V2 for UFS on SM8650"
2. Add new patch 8/8 "ABI: sysfs-driver-ufs: Add missing UFS sysfs addributes"
3. Modify commit message for  "scsi: ufs: core: Pass target_freq to clk_scale_notify() vops" and "scsi: ufs: qcom: Pass target_freq to clk scale pre and post change"
4. In "scsi: ufs: qcom: Pass target_freq to clk scale pre and post change", use common Macro HZ_PER_MHZ in function ufs_qcom_set_core_clk_ctrl()
5. In "scsi: ufs: qcom: Implement the freq_to_gear_speed() vops", print out freq and gear info as debugging message
6. In "scsi: ufs: core: Enable multi-level gear scaling", rename the lable "do_pmc" to "config_pwr_mode"
7. In "scsi: ufs: core: Toggle Write Booster during clock", initialize the local variables "wb_en" as "false"

v2 -> v3:
1. Change 'vops' to 'vop' in all commit message
2. keep the indentation consistent for clk_scale_notify() definition.
3. In "scsi: ufs: core: Add a vop to map clock frequency to gear speed", "scsi: ufs: qcom: Implement the freq_to_gear_speed() vop"
   and "scsi: ufs: core: Enable multi-level gear scaling", remove the parameter 'gear' and use it as return result in function freq_to_gear_speed()
4. In "scsi: ufs: qcom: Implement the freq_to_gear_speed(), removed the variable 'ret' in function ufs_qcom_freq_to_gear_speed()
5. In "scsi: ufs: core: Enable multi-level gear scaling", use assignment instead memcpy() in function ufshcd_scale_gear()
6. Improve the grammar of attributes' descriptions in “ABI: sysfs-driver-ufs: Add missing UFS sysfs attributes”
7. Typo fixed for some commit messages.

Can Guo (6):
  scsi: ufs: core: Pass target_freq to clk_scale_notify() vop
  scsi: ufs: qcom: Pass target_freq to clk scale pre and post change
  scsi: ufs: core: Add a vop to map clock frequency to gear speed
  scsi: ufs: qcom: Implement the freq_to_gear_speed() vop
  scsi: ufs: core: Enable multi-level gear scaling
  scsi: ufs: core: Toggle Write Booster during clock scaling base on
    gear speed

Ziqi Chen (2):
  scsi: ufs: core: Check if scaling up is required when disable clkscale
  ABI: sysfs-driver-ufs: Add missing UFS sysfs attributes

 Documentation/ABI/testing/sysfs-driver-ufs | 33 ++++++++++
 drivers/ufs/core/ufshcd-priv.h             | 15 ++++-
 drivers/ufs/core/ufshcd.c                  | 76 +++++++++++++++++-----
 drivers/ufs/host/ufs-mediatek.c            |  1 +
 drivers/ufs/host/ufs-qcom.c                | 62 ++++++++++++++----
 include/ufs/ufshcd.h                       |  9 ++-
 6 files changed, 160 insertions(+), 36 deletions(-)

-- 
2.34.1


