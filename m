Return-Path: <linux-arm-msm+bounces-53378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E8145A7E0FA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 16:21:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA6AE7A14BE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 14:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A1831DB37B;
	Mon,  7 Apr 2025 14:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="byaxT9wZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4025200B0;
	Mon,  7 Apr 2025 14:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744035691; cv=none; b=C9rxTbukEneLJGrakyjX0chzviOcmRGCFkqB01pTXUtrs4GftjE8s10ATEXdTDU0NAQl2L3v9DrHJ4GDOhJqrODMuUk8LVOocXYsZ40ZUtF6Z0lJxUvQBDpocMF0+M5s1WLMZODHfVt6yHvN1zM5tGNNWy1Yv+aAJFyMvutZZkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744035691; c=relaxed/simple;
	bh=J3Ouex5t/BJuRLsIVAdTtEOT1UXLXYJ0kbwTkxBPXuY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hzG103rL4yQNN6QBGcKHYvpj7lQkG23zqomfvLFPJW2uqqjbrjijNKxpOgcozZybjy1ONepss9/KtMhs3kdPQwXdZaWeHZn7ZxSuqtf8EgrNoRyqvHKHTs1y+iH0GN/9YjyTnzPRNoQsIsQ8flcSkKDG+2t4RAnl/yWJ7yYZR6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=byaxT9wZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378doGJ009987;
	Mon, 7 Apr 2025 14:21:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=wQ1d5nGMf8Kmroqoy9X4+2r9PBxPFkf0SoFNOYlqaQo=; b=by
	axT9wZfcNsqiCAOYLoLFMD3P7h5UjCGKKfx/olD/hutEq3++dQ3uL0m2nxenoZ6s
	clz8GOnxIDUQyV4K2lA965Y1JbUjYJfLH9uR2Utjut1z/figqlGqQ++Lvz3fMWHw
	4+HFytBbBPR+R+nYzkCYyPqbovrzZQYNgaQs+aSiglPigGxlOJFQvUrp336zbFqk
	w7vskK/mhSpS2qGDHHrlCNL+OqRFqPRNac4wk2aSOfPJ235GDeIO1mO7VlyTb3+X
	NOnSOu4GfSrTGVBpFZC/TFvxhdi7zAgvNjmmNw7Ou/R6S0JyZ1+QUFzzv2GtKGP+
	wIRWXuYurhsJ4VeC3Dyg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpm4dy2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 14:21:24 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 537ELOX6009006
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Apr 2025 14:21:24 GMT
Received: from hu-mapa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 7 Apr 2025 07:21:20 -0700
From: Manish Pandey <quic_mapa@quicinc.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
	<martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_nitirawa@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <quic_rampraka@quicinc.com>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>
Subject: [PATCH V6 0/3] scsi: ufs-qcom: Enable Hibern8, MCQ, and Testbus registers Dump
Date: Mon, 7 Apr 2025 19:51:07 +0530
Message-ID: <20250407142110.16925-1-quic_mapa@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PkFux5rJi8qye3-mRhqAHa5n9zwXHz1V
X-Proofpoint-ORIG-GUID: PkFux5rJi8qye3-mRhqAHa5n9zwXHz1V
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f3df64 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=pyQEGUW01KN_hzJh80EA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_04,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=292 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070101

Adding support to enhance the debugging capabilities of the Qualcomm UFS
Host Controller, including HW and SW Hibern8 counts, MCQ registers, and
testbus registers dump.
---
Changes in v6:
- Added ufs_qcom_dump_regs() API for MCQ dump due, as SoC vendors explicitly
  allocate MCQ resource.
Changes in v5:
- Addressed Mani's comment and used cond_resched() instead of usleep().
Changes in v4:
- Addressed Mani's comment and used kmalloc_array() for testbus mem allocation.
- Removed usleep_range from ufs_qcom_dump_testbus.
- Updated commit text.
Changes in v3:
- Addressed Bart's comment and Annotated the 'testbus' declaration with __free.
- Converted the switch-statements into an array lookup.
- Introduced struct testbus_info{} for handling testbus switch-statements to an array lookup.
Changes in v2:
- Rebased patchsets.
- Link to v1: https://lore.kernel.org/linux-arm-msm/20241025055054.23170-1-quic_mapa@quicinc.com/

---
Manish Pandey (3):
  scsi: ufs-qcom: Add support for dumping HW and SW hibern8 count
  scsi: ufs-qcom: Add support to dump MCQ registers
  scsi: ufs-qcom: Add support to dump testbus registers

 drivers/ufs/host/ufs-qcom.c | 142 ++++++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.h |  11 +++
 2 files changed, 153 insertions(+)

-- 
2.17.1


