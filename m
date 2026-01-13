Return-Path: <linux-arm-msm+bounces-88682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B59BD172D4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 09:03:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BB37308603D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 08:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74E0E36BCFB;
	Tue, 13 Jan 2026 08:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a/Io43aU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UYVLgVdG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C1E36BCC4
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768291295; cv=none; b=QP3q4Gvy6oigV2vyDSP3bD08C3JNmwwUXu8wD3mKtO8WBwEc+i6Cg4WAr4mZyYupGVaG97DlbX0TApow2p3S5mSfHpbXhTqvJMTQot3xe1bf1r/kvGDiiN3cRK1ab3ePfqvoY66bU6ZOgmOlTwbPAVxRmfLBSWd2WD4Wcz9ZN0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768291295; c=relaxed/simple;
	bh=XK8gpOPgN9rwsWFcr91jX5z+ISqBvoVw62l63nwUkhI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OTTyhZcYkzOgKarL08L9T05w68OQRpg+YdCjZHR46YyqVQ7+W8KQnbes5o3e/wkpfXecue5IYuQCB7KP/C4nqXiJ3hUzD/lPJXh1wyrdzv1T8jU7Hzor+Sc+A5NhRle7GWFmD5tQNFGyfYW2NdtmSBqAecgqySRM4pE9SfL6Fik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a/Io43aU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UYVLgVdG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D7DDP8175801
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:01:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QAjCo0V1My5
	AY/MhuD/dD54xGY8gMH823+BlsIXPwOY=; b=a/Io43aUbWDAjLUSqa2jHZsqcMf
	Yvt40pKtbp8u1GosQzXugCwsrX5A26EVssjLwP2KGALx6GR/b5pOKZvE5KnUNnIc
	9imc4YUMpFluhGDvivbEC/dFr04fy/H89ls2PHSATaXDZIudYBneAsvPnwzZrP/3
	2nDtJdfWsz6bmlM+u1L9E5mXCXWXd4UkcTml7eWBPfwM6nUmfDa+aeWgPtHMgHJn
	KB7UQ/+8T18ejx+GMO4oTgJPQYrGErMIYU6fDeWCQRz4K1PXS/UtBYb2oNTMyvH9
	3bxTCJaI7ZaAEQGT5vLCgu2Gq5HLJ2oguqak8ZM7RxA0SyhsX23Dw+ZMh1Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn52f2asx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:01:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a351686c17so75962455ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 00:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768291277; x=1768896077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QAjCo0V1My5AY/MhuD/dD54xGY8gMH823+BlsIXPwOY=;
        b=UYVLgVdG5DhUvyr98Ni5/NV7YqBJFtuyusLjcady8NxtT+jEtwd4aqoSPk4abSZR9s
         ebJef1x+8F2VGMTdGGS7UW4txxwolG/Dm6XskfbYwW4D0qLWdy8GNByH2awDkO9Ui294
         9Rb1R599Ujz549A46H6sEcA29Dy/0zehoqk38CMqU+kQsdY8HY14ZKZoDXwZ1VX5bk/f
         bBiLzhYE2oVsb0VsHj8J71AkHf9hp6TSi/9jG+BMJu1YJVsGTEOjDeWZXa9rt9xyZdiW
         jC+o1jR8DmV8fQTN0sDK8e1YNUN5IWEggWCO9SRvbRX5aQUWi5ZqnnzQqSKxMAqhyCYf
         4W6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768291277; x=1768896077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QAjCo0V1My5AY/MhuD/dD54xGY8gMH823+BlsIXPwOY=;
        b=USRk9qHUMYbek1AwZgInyD8R7Y7ddaubsQo5UiBCTwwglJlbEPiI1FJZ/MDyzeon60
         kgUUyoUiKVMQmBrl1gQoEMgnPLWYWqCVRt61oR2O5XSnrTRMqaKt5rRu1dWdAtfhnMDh
         28f6Tef/1FBL0twDiRdO1sDqzAt4MYcZUvEZs27eVfBm+y2Cj0YR4z7xQpvCcHIlhAhV
         vYO/TIsFlzXCbl0Hrrjre/F95aBVOIG+joCDU6mpOAqnpZUY8vlvK1WQDAsux9LbVcVv
         dl3Cr55yFtjbVLHw526Ajc4O+OsKpfGBVH/FWi6CYLFQrGtb3zi0rMGecGQCGtrHYeg1
         eIhw==
X-Gm-Message-State: AOJu0Yzez4qDfmXnP1fPwdm672x0MKsSDkpxnjFfAg3nCT1vMXl94Txq
	BmmsJHPBB3e7BT2aTBNnV55zZO8DNJgfZxlPqm8MjDvEj/zhMN+vkbcCpm/ZYiUPyVw0snNeTvq
	PWeeLqTeOMATq4oyTFLKMLBVnqz0yY/gTtasuHBIanNjL3KjjJ3YWIUQK+fGGZNyMgZgg
X-Gm-Gg: AY/fxX64084xzygzdc6dxeWTo+l45icEGvfYaOqzwhlWwxdpDE9iW3AldOX4xJ2WqeL
	k9k1GEsbVTIKiwtjFYqIMEmXJ2Pnj+7bjQyRMqd9/LWpsPH/lsiJ3ugoF1GmDsEl7w+1X9UxxXk
	u7cCpAR46NIHkxaIc+iqaQ85O1tPiHXtrKr8Wh5e/LCGy39K1o9kt+uRubsg0CzO7BAkVfwrvUQ
	MSR8bntyJgVSbprI8gpNPpKV89dMFpxUOUPpJhHcozzDIX2PWqp62kTQ3AYtNRBgws7RZx1Uds8
	bnIXC+UEBfdoPAO42eUmikLCuvn0bmWtAQW2KWfz3iUM6yoprtBYe3i0UfsBk/HU5BMXW78qZjH
	EwjizsuKWdTX/kibnzu6dGIO+Pkn7UgFqqaaWqWLZ
X-Received: by 2002:a17:902:c406:b0:2a0:9923:6954 with SMTP id d9443c01a7336-2a3ee48fbf3mr175858925ad.27.1768291276920;
        Tue, 13 Jan 2026 00:01:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDpZkrucyrRCmXeXMPckJQy7yAmhXICk1uU3T0FskJTRg50++uCHNweWpQjhc6hAOTflTUaA==
X-Received: by 2002:a17:902:c406:b0:2a0:9923:6954 with SMTP id d9443c01a7336-2a3ee48fbf3mr175858595ad.27.1768291276426;
        Tue, 13 Jan 2026 00:01:16 -0800 (PST)
Received: from hu-rdwivedi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c48c15sm191132725ad.27.2026.01.13.00.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 00:01:16 -0800 (PST)
From: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
To: mani@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
        bvanassche@acm.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, ram.dwivedi@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V5 3/4] scsi: ufs: core Enforce minimum pm level for sysfs configuration
Date: Tue, 13 Jan 2026 13:30:45 +0530
Message-Id: <20260113080046.284089-4-ram.dwivedi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260113080046.284089-1-ram.dwivedi@oss.qualcomm.com>
References: <20260113080046.284089-1-ram.dwivedi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA2NiBTYWx0ZWRfX4ecOSvafrt71
 eCW8lxs8B3eyX58IZEDNbclruhE9yHLgmMmp+M2W6/GiZqfpf0SbXdWfiB7pDKxfZrP/bQ1pLb3
 I8fbByqp2OcdUtPD3y16jT0ONCaT0DU1SAoAXzDPwmT2YyhcbrJI3xv597pR5Li6+La3J5YwkIB
 hzSbWUXOWkKs7jXBKYrtTMlCqDsJsg63nMMXje3mb4j1SFQVGXs22B+9mcj7Xn5Ncyeh0maJ7/X
 hEGoal9XbEW5chV9ds3pd8bQnpExZO2IrpmiqAm3bthb8LMFTbvMnkzWavU0r0bcn7ilMkZrQgz
 BSxmYYJt2VzODrrg2ymnMSsP41R26Kt+QI0t3PL09J4AbruBzla4r3M+YbDXRKmUdUHfDFtQZcn
 hBwUGrPEPSzGuL2x/b8avBnnnKDqHrvkY5y/imbZUbtR/C78W/Bn+riZ8Q+JHPhBJO+RWwUh8vE
 Y0iEL2akkRuE/Z+eUPA==
X-Authority-Analysis: v=2.4 cv=TcCbdBQh c=1 sm=1 tr=0 ts=6965fbce cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=chdQYeBgf-UdQiD2u_cA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: XMalxJ8AsoEpN9oTaC5pS3DZ0BjgMRpS
X-Proofpoint-ORIG-GUID: XMalxJ8AsoEpN9oTaC5pS3DZ0BjgMRpS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130066

Some UFS platforms only support a limited subset of power levels.
Currently, the sysfs interface allows users to set any pm level
without validating the minimum supported value. If an unsupported
level is selected, suspend may fail.

Introduce an pm_lvl_min field in the ufs_hba structure and use it
to clamp the pm level requested via sysfs so that only supported
levels are accepted. Platforms that require a minimum pm level
can set this field during probe.

Signed-off-by: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
---
 drivers/ufs/core/ufs-sysfs.c | 2 +-
 include/ufs/ufshcd.h         | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufs-sysfs.c b/drivers/ufs/core/ufs-sysfs.c
index b33f8656edb5..02e5468ad49d 100644
--- a/drivers/ufs/core/ufs-sysfs.c
+++ b/drivers/ufs/core/ufs-sysfs.c
@@ -141,7 +141,7 @@ static inline ssize_t ufs_sysfs_pm_lvl_store(struct device *dev,
 	if (kstrtoul(buf, 0, &value))
 		return -EINVAL;
 
-	if (value >= UFS_PM_LVL_MAX)
+	if (value >= UFS_PM_LVL_MAX || value < hba->pm_lvl_min)
 		return -EINVAL;
 
 	if (ufs_pm_lvl_states[value].dev_state == UFS_DEEPSLEEP_PWR_MODE &&
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index 19154228780b..a64c19563b03 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -834,6 +834,7 @@ enum ufshcd_mcq_opr {
  * @uic_link_state: active state of the link to the UFS device.
  * @rpm_lvl: desired UFS power management level during runtime PM.
  * @spm_lvl: desired UFS power management level during system PM.
+ * @pm_lvl_min: minimum supported power management level.
  * @pm_op_in_progress: whether or not a PM operation is in progress.
  * @ahit: value of Auto-Hibernate Idle Timer register.
  * @outstanding_tasks: Bits representing outstanding task requests
@@ -972,6 +973,7 @@ struct ufs_hba {
 	enum ufs_pm_level rpm_lvl;
 	/* Desired UFS power management level during system PM */
 	enum ufs_pm_level spm_lvl;
+	enum ufs_pm_level pm_lvl_min;
 	int pm_op_in_progress;
 
 	/* Auto-Hibernate Idle Timer register value */
-- 
2.34.1


