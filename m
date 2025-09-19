Return-Path: <linux-arm-msm+bounces-74236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DFDB8AD35
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 19:52:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10E661CC634F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 17:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93A87322A2E;
	Fri, 19 Sep 2025 17:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ohk+ioKN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D695A309F06
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 17:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758304232; cv=none; b=B6YKiR64CtKfjnHiJLQYo+l/m5duyXr3NoPL2bnX6DOXQ+nwFtRheGANmU8X7paWKXizeXz8DSLT+iM0Yg2mkenTosJWqeSIGDIpQl7a/gyh1JzO42uL4wgu5nJNShhvDxYitQaby05owPlvIT7mH1kqdCycUM0wLSR95qS2+Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758304232; c=relaxed/simple;
	bh=/mPo8lPIeMUbMiGlkP38hUb5Wg6RHjHPXXFrqZymSjY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oRIlBzxH5ogUtpHre3kHBYqvMDX89p8K7d66/vsv8GLlqpuAl8V5nY1MywIMUUgiBIwxc9ak5OzZEBjd5qRMWyY15aceZvsAqKUi9mM7ZZDfb9VON8NgFReOwPXX5YstoxDSqVKeHIBno0PtTk3dff3nDmS+xY+o2Hp14RUbmDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ohk+ioKN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JEl942021413
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 17:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=lUVhA5pzXz07jeB/n45m2bQF4wRz5z2cLhx
	Sd7PJcPQ=; b=ohk+ioKNN2W3E6EOYRZBoPo4r3rQDfby/DuHAxFp6dCus+XrWMv
	Pi1/LekuSehpupAOj1hi52L3UpgJ7UCpt6MQ2ITe0TRGoazdcUn1Le+Da+Y2ngSS
	AgIB59giKn0RBQZ1WR+wVZQ3mTrRb6k8xfGd619saGYQJb+5IGR04lZvhZfK0vim
	p23uD/9DBKVnBwhCimf9lQCE/hvo6jWg9ODvF5Fy4Ta8OIqeZjlqM+xZDcenl0xS
	jJKgK/NK8xaQau+qaVIyG0N4jTsHAGtLFYun7HOcbDeOcbQxP44Y5qt/ML5iANby
	jWZ1ognNFU5IWzBufFlvwL/nempJvjWKZ9Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy5kc82-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 17:50:29 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2681623f927so24003735ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 10:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758304228; x=1758909028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lUVhA5pzXz07jeB/n45m2bQF4wRz5z2cLhxSd7PJcPQ=;
        b=hZbYMSQd17vX5u9VYGEZIfD/GgG0sKXOhEutMAvi0sLebMz7/bNhJ5DYngS6AgLwjo
         9w4LAlisKKii90kbTziTUK2caDW+uBIc/cAvjboktkxPKbuPeRQVw6ld/mR8mihG/W8i
         D+TNb9r9L8j8JLu3PyG4pIqeY++vzCQ0IlQ+6gYq547YIC9QVqmK5ObE3peltsRgR4p0
         spqgoCJ9PBBt2SxAi5YVQ/++Amxhg04/xyRi6ZBUO/S4JYk0obTLGox5ypCt5P445tHa
         7NN/kSYtM0HCk+Io3In119atGoEjkhWuBGb9AagO95jpFU1M2DmA0vBmh7hurnip1Kj5
         7SBg==
X-Gm-Message-State: AOJu0YwpvewgUYPokZjCc9rpPMHJXkwQwdcI5Ror/1gt1UTHWWVAKfrE
	wdWQRQCzVHd9TXsbdW7MsK+/FsdsIYJJJtqtc3d5o5QXLF8S/XEMttUNWhs3FuQnCniiym2w+h6
	2ZAM6e8ceN7Nsssd/o5xV5kpjwCbL82F7ozmXqmZsn3dUgPs+amei1hTWY87dOD2l6lnT
X-Gm-Gg: ASbGncupLXKqVJIZxGBMxDEqwVehJxaRtxh1hLsz6k809KKk8y9eXEDDIcZiMSsusn4
	hhtV9GtwDK7RWe3a4MwraKfdsiVzSE+FI8FBPTLpsKOuIHgp/LZyoknYVfX3yawWKGM024x6wuM
	q90DZAkWcsIDKyqfRPzTytimYfcc3aet6g6wXvyAGVIzBstEWhJ/ynygEPxjHPIkpODvcPVDHyL
	tzAgVVlwKkv6i1dYuqyIUoN+rk7R0l3QIGlsmuh+kBalLyEtr964nBQJ95hKa9qNTLXFaUc9ewf
	bQ+ogpb17cGrVTuVNNu7/h3VbL0r4R0jWXngEeR3fFqPdc9uk3cchmrtT+AkIVn8/RoU40/nZO5
	MuS3AmebYPn27abwwWSJnU1SGlc8=
X-Received: by 2002:a17:903:1b6c:b0:261:1521:17a8 with SMTP id d9443c01a7336-269ba43dfffmr64056335ad.16.1758304228074;
        Fri, 19 Sep 2025 10:50:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7Kzie8oSdOEBS90XbtwiLTvrynMSVegeI/TKZ5eJjg06eMYGr2szW6HyTo08NoA0zM8CkGw==
X-Received: by 2002:a17:903:1b6c:b0:261:1521:17a8 with SMTP id d9443c01a7336-269ba43dfffmr64056025ad.16.1758304227603;
        Fri, 19 Sep 2025 10:50:27 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ed26876ffsm8970468a91.3.2025.09.19.10.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 10:50:27 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] soc: qcom: pmic_glink: Add support for SOCCP remoteproc channels
Date: Fri, 19 Sep 2025 10:50:25 -0700
Message-Id: <20250919175025.2988948-1-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: coE8d2y5Qz5CGU23fBVwWxl9W1kQ34mf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX4LbAFWMOpSNj
 clQ+59ZEagcJ0trfOQGid3T/MdXA7s+NPBajwTsT7ztBPFGihFPAumJaPCVLkiE7T3dJ35F+56A
 XNUoYNVHO2tuNrypZkRzwbO1Uy+Q1cuCUB8wuYh1DODITzwlgmRWs9TgWuKYg5HSCgwulDIAYjg
 HoPrL2fEOCTfmk0JmnSqn1GSk/FB5Cr+MjZaqX71mWIGfMgYuXMj2FFhxnDHSvnuPVWRJF+wUiZ
 zSYR4qNJXEMUMSFpjwVHI6ao9NiQ81GmNfYPFQTpxZPIYQ2VqUN2z2RvM0z9InLmdMbNtb4qG6J
 LoztnvXbQdJErHAKTRQmqvwZrH/NTjQUo1vEdSVB2aFVrvSLwXUvSevJjK6E28ipDm9zwVw0lg8
 qIs8aHLn
X-Authority-Analysis: v=2.4 cv=Y+f4sgeN c=1 sm=1 tr=0 ts=68cd97e5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=U2TDSMueiEXJ_JPGoVUA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: coE8d2y5Qz5CGU23fBVwWxl9W1kQ34mf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202

System On Chip Control Processor (SOCCP) is a subsystem that can have
battery management firmware running on it to support Type-C/PD and
battery charging. SOCCP does not have multiple PDs and hence PDR is not
supported. So, if the subsystem comes up/down, rpmsg driver would be
probed or removed. Use that for notifying clients of pmic_glink for
PDR events.

Add support for battery management FW running on SOCCP by adding the
"PMIC_RTR_SOCCP_APPS" channel name to the rpmsg_match list and
updating notify_clients logic.

Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
---
Changes since V1:
  - Updated commit message
  - Removed enum defintions and isntead using booleans
  - Simplified logic by setting pg->pdr_state directly if pdr is not available
---
 drivers/soc/qcom/pmic_glink.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
index c0a4be5df926..627f96ca322e 100644
--- a/drivers/soc/qcom/pmic_glink.c
+++ b/drivers/soc/qcom/pmic_glink.c
@@ -39,6 +39,7 @@ struct pmic_glink {
 	struct mutex state_lock;
 	unsigned int client_state;
 	unsigned int pdr_state;
+	bool pdr_available;
 
 	/* serializing clients list updates */
 	spinlock_t client_lock;
@@ -246,9 +247,12 @@ static int pmic_glink_rpmsg_probe(struct rpmsg_device *rpdev)
 		return dev_err_probe(&rpdev->dev, -ENODEV, "no pmic_glink device to attach to\n");
 
 	dev_set_drvdata(&rpdev->dev, pg);
+	pg->pdr_available = rpdev->id.driver_data;
 
 	guard(mutex)(&pg->state_lock);
 	pg->ept = rpdev->ept;
+	if (!pg->pdr_available)
+		pg->pdr_state = SERVREG_SERVICE_STATE_UP;
 	pmic_glink_state_notify_clients(pg);
 
 	return 0;
@@ -265,11 +269,14 @@ static void pmic_glink_rpmsg_remove(struct rpmsg_device *rpdev)
 
 	guard(mutex)(&pg->state_lock);
 	pg->ept = NULL;
+	if (!pg->pdr_available)
+		pg->pdr_state = SERVREG_SERVICE_STATE_DOWN;
 	pmic_glink_state_notify_clients(pg);
 }
 
 static const struct rpmsg_device_id pmic_glink_rpmsg_id_match[] = {
-	{ "PMIC_RTR_ADSP_APPS" },
+	{.name = "PMIC_RTR_ADSP_APPS", .driver_data = true },
+	{.name = "PMIC_RTR_SOCCP_APPS", .driver_data = false },
 	{}
 };
 
-- 
2.34.1


