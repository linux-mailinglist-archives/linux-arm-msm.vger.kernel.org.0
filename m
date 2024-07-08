Return-Path: <linux-arm-msm+bounces-25503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6C092A666
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 17:57:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4628A1F2261D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 15:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A409614F9E8;
	Mon,  8 Jul 2024 15:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Zr4xsfIn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF7714EC62;
	Mon,  8 Jul 2024 15:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720454045; cv=none; b=HW24p5qnxsBi2aoXPt9Fcqug2+KBZ0kYjxCMgsP1R5Mrrfg/P+oTrvV6COezu89CA8dMP8mv9KJqLAh94+ZqmFoLoxwru+bLP8Sc4TFmRof48YW08USOMrtJ5LoasPK519pPwkG6cA++DJ5kpHQfa8o0m1/CiZIld2N+mnKU9Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720454045; c=relaxed/simple;
	bh=Jv9Osj1MkLpJnopOQ2p6sePdzmKda/4nq+wQ2oK8DOM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rK7FU4gg0Fkn+Cq7QHTBW/rNNrz1AwkTWigXVTe5i9l3LNN/+Ihn6roB4Y8/+SMlOsKIXcrqUqHMom0H0LzW4StZEuWrlFfGGhgpgt/BO7myg0vIsB4PmUGPUrluRyDnMbIiL/xQucRb7jVpTeWUqBoLPY3gJcEQsUmIjudx8n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Zr4xsfIn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 468Bi7s4031378;
	Mon, 8 Jul 2024 15:53:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ry4a33oM2h+smvuuo7xpH1
	VE6ViBwP9kkXd/cgX2QYI=; b=Zr4xsfIngMqSR3qf5curMx6x88rsFEMvSWLbok
	m8PzMws9NoUELMigsbSnfkAQgPp/6ba/QPp51hq66sHCJ50CLHeiwkp8vk+BxM9+
	l1fvOFniZtcenqi3QVM4xTDyrPHkNThFuUj4kbDZUEJq4LZezUDa53ePoU89CWED
	yGiybw1bFAsxqIuhHWwcJ6PWiqlB95QnNdo3bArTRm2Gwz6j0+UpD3M9WQcZXGJF
	4IibW1FXtIwvx28c8dSXfAFhQ2+dDbVyMVxtk4MTsTT9LaXe9EJOeS0aZdUoGbkx
	hTIKKVFyjug+1Mk6SlL9NBMvmKsQpzYvxKkyThHeWB26xnwQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406xpdkxd8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jul 2024 15:53:59 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 468FrwYV024988
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 8 Jul 2024 15:53:58 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 8 Jul 2024 08:53:56 -0700
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <linux-arm-msm@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <robimarko@gmail.com>,
        Mukesh Ojha
	<quic_mojha@quicinc.com>
Subject: [PATCH v2] firmware: qcom: scm: Disable SDI and write no dump to dump mode
Date: Mon, 8 Jul 2024 21:23:32 +0530
Message-ID: <20240708155332.4056479-1-quic_mojha@quicinc.com>
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
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: j52KZ0MhL9fhPUEACbJQel7hqdiBPTBn
X-Proofpoint-ORIG-GUID: j52KZ0MhL9fhPUEACbJQel7hqdiBPTBn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-08_09,2024-07-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 clxscore=1011 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407080118

SDI is enabled for most of the Qualcomm SoCs and as per commit
ff4aa3bc9825 ("firmware: qcom_scm: disable SDI if required")
it was recommended to disable SDI by mentioning it in device tree
to avoid hang during watchdog or during reboot.

However, for some cases if download mode tcsr register already
configured from boot firmware to collect dumps and if SDI is
disabled via means of mentioning it in device tree we could
still end up with dump collection. Disabling SDI alone is
not completely enough to disable dump mode and we also need to
zero out the bits download bits from tcsr register.

Current commit now, unconditionally call qcom_scm_set_download_mode()
based on download_mode flag, at max if TCSR register is not mentioned
or available for a SoC it will fallback to legacy way of setting
download mode through command which may be no-ops or return error
in case current firmware does not implements QCOM_SCM_INFO_IS_CALL_AVAIL
so, at worst it does nothing if it fails.

It also does to call SDI disable call if dload mode is disabled, which
looks fine to do as intention is to disable dump collection even if
system crashes.

Fixes: ff4aa3bc9825 ("firmware: qcom_scm: disable SDI if required")
Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
---
Changes in v2: https://lore.kernel.org/lkml/20240705120623.1424931-1-quic_mojha@quicinc.com/
 - Modified the commit description to make the problem description more clearer. [eberman]
 - Added Fixes tag and removed conditional operator from qcom_scm_set_download_mode()
   argument. [eberman]

 drivers/firmware/qcom/qcom_scm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 00c379a3cceb..0f5ac346bda4 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1954,14 +1954,12 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	 * will cause the boot stages to enter download mode, unless
 	 * disabled below by a clean shutdown/reboot.
 	 */
-	if (download_mode)
-		qcom_scm_set_download_mode(true);
-
+	qcom_scm_set_download_mode(download_mode);
 
 	/*
 	 * Disable SDI if indicated by DT that it is enabled by default.
 	 */
-	if (of_property_read_bool(pdev->dev.of_node, "qcom,sdi-enabled"))
+	if (of_property_read_bool(pdev->dev.of_node, "qcom,sdi-enabled") || !download_mode)
 		qcom_scm_disable_sdi();
 
 	ret = of_reserved_mem_device_init(__scm->dev);
-- 
2.34.1


