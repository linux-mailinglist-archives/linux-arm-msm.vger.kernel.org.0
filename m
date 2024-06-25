Return-Path: <linux-arm-msm+bounces-24130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F15916E8D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 18:54:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 243D41F22680
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 16:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F48C176239;
	Tue, 25 Jun 2024 16:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Kq8sKJQ0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922B416C696;
	Tue, 25 Jun 2024 16:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719334437; cv=none; b=M0FgmcvDDdb3D5WH+esgaDg/4qu0B0EI9+C+JQdIh3a1XaGbsdEWPntbwvNcNbtV3F4kJs1qy2Ms9HZ4gPVRyFEQdnoyT4U2nWJejU3h1qF4wKS/rmilOeZ4TyMmcBCE/faXu+1C56RPzjzW37eIMJCMkpar/xXWOfhqXk6VQYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719334437; c=relaxed/simple;
	bh=DwpWLBHt1XJLYjaG/1fFg0b5XgL2jy/41pZOj0cmR+Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=UrDCaeANMryMRFzShGjHGtgwUc18RZtPz+b6ux8UKHI+hQootNoG8kUYv7KNTO4K8blfeQAJBg8A/5SJyI+D4FSwDMdAgBHIjPk1ZWvkR2RMvVS2rnuP+bzPq42U5Dksb1g+jTQyP1j6O+uRMGDxmDMAAj4IHN0RWxlxVNcL++I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Kq8sKJQ0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45P8P6jg008959;
	Tue, 25 Jun 2024 16:53:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=++wbgQplAJePZM1ke3wMP8
	45KHLDRhZef8Xj8nHEiTg=; b=Kq8sKJQ0D/dNYtnnpmCm+NZNk5BzzxYqysqpRS
	jCy1kKV128PNSXoZsRFxCsKBSEPNFdovwnqpnisdyz99fRxaXUw3Xp0YqDPeQgdO
	bNgDvZAeZXESWt2kVAjeBwwAyTuNejKctw/FPKvEyIX0uMhmdPRUlxjU9jsmTOKm
	5ZRjTCeeVxuYK5t1AAZGZeks2dp39EDUf6t5ACd4C4amtsM5DkpEqb7qmDArxOp6
	5N6gowT2LdkZf5hL0BjZj4D9m9h+TmZGdoNQe+viT45W0Z1ATw0kQt/yg3i+OiFG
	NDr15zFAmem9su14jTfQDVVyu0vHpJcZbgmkZLDxiHoY7AXw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywqcef8fd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 16:53:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45PGrkLT007460
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 16:53:46 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 25 Jun
 2024 09:53:45 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Tue, 25 Jun 2024 09:53:45 -0700
Subject: [PATCH v2] scsi: ufs: qcom: add missing MODULE_DESCRIPTION() macro
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240625-md-drivers-ufs-host-v2-1-59a56974b05a@quicinc.com>
X-B4-Tracking: v=1; b=H4sIABj2emYC/32OSw6CMBRFt0I69plSPgFH7sMwKP3Yl0irfdBgC
 Hu3sACHJ7n33LsxMhENsVuxsWgSEgafQVwKppz0TwOoMzPBRc3bUsCkQUdMJhIslsAFmkF2kku
 pm6q3nOXmOxqL62l9DJlHSQbGKL1yh+uFfllhkjSbeMQd0hzi9/yQyqP0fy6VUIK2VdOLuu2as
 bt/FlTo1VWFiQ37vv8AurvH4tcAAAA=
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
	<martin.petersen@oracle.com>,
        Bart Van Assche <bvanassche@acm.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        "Jeff
 Johnson" <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.14.0
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: --qJxBrSpJ1iy7VdyhUHWRYogLSiiCFb
X-Proofpoint-ORIG-GUID: --qJxBrSpJ1iy7VdyhUHWRYogLSiiCFb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-25_12,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 mlxscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=962
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406250124

With ARCH=arm64, make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/ufs/host/ufs-qcom.o

Add the missing invocation of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
Changes in v2:
- Updated the description per Bart Van Assche
- Link to v1: https://lore.kernel.org/r/20240612-md-drivers-ufs-host-v1-1-df35924685b8@quicinc.com
---
 drivers/ufs/host/ufs-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index cca190d1c577..c12004030b50 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1883,4 +1883,5 @@ static struct platform_driver ufs_qcom_pltform = {
 };
 module_platform_driver(ufs_qcom_pltform);
 
+MODULE_DESCRIPTION("Qualcomm UFS host controller driver");
 MODULE_LICENSE("GPL v2");

---
base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
change-id: 20240612-md-drivers-ufs-host-a8a0aad539f0


