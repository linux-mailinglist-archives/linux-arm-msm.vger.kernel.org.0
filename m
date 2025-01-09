Return-Path: <linux-arm-msm+bounces-44540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D6CA07268
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 11:08:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECECC3A81E3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 10:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DFFA21576D;
	Thu,  9 Jan 2025 10:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="H481ERyk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94ADD2153E0;
	Thu,  9 Jan 2025 10:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736417312; cv=none; b=CwHGJkWSWQ8U1iMmdtcpf9RCFEqp+bQZOZXOr1hO3EBnbMGr+HlZ4DZD1wcc6H4BbcFhfcbgwh3i0eEFxp3MH9L7US5WRoLDv9pHTja+Dxi/7gwiYVn8CHCYEAx2fJcy0mAlGsMGBEEgcNfeo/JoDnQUArkz0ucoHRjoJereJl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736417312; c=relaxed/simple;
	bh=izjbaM3hQbL3U+nLXOAtQgYLmwlHJjYrBF4w22frZUk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EygmoT8bIXjK4E9Zmuj2zsca7MHAqcDHhhVH27xuqKhzzdTCJUeIFC+p6r7x3M0PHKZ8Iu32ZBxcrgswP8eXWe75ggvQwvQEQGPWyCQcBPX2GAz0GBqqL/6EoniiGqmJ4rKxkKNSGvr9y60iqsPDKJWaRnVvEso6519WCmdQp9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=H481ERyk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5099vc97031506;
	Thu, 9 Jan 2025 10:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8K0iKp8/RG5PAqHXjaDSdr
	Pnyr3iqLYp5vRuy+zH59s=; b=H481ERyksVHRt6kHUXKCd7tum0MjFhidE27W+t
	9VousyagdjeqI28rwN1SsIQWl1ANYH7ubUASKiSMPbU0sMu59RARocGXGoAaCNhF
	2TWQCrheSv4hIt4kXyb+3elAbRh3aDSYG9lNt3QfuN/bzsX5XQZhvdgjxtIq4slw
	EpgOKzBufSzBxNRg6OhUMGsOCJV8hZ6GCiWov/Vk35plk6RaNWdg8aEq+ELpk0W3
	QvRim9xGhXugZ3EyPYfc5MotjfiPIupOygQJKguXyhv0QhYIcDcbMv5uiRkZQrbG
	Vm5+yQ4xj97nPsQQqQk21eO7aE4beda6xj1xTzf0j0/PMTwA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442c9k80wm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 10:07:57 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 509A7vqP027876
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 10:07:57 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 9 Jan 2025 02:07:53 -0800
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: <vkoul@kernel.org>, <kishon@kernel.org>, <quic_varada@quicinc.com>,
        <dmitry.baryshkov@linaro.org>, <quic_viswanat@quicinc.com>,
        <krishna.kurapati@oss.qualcomm.com>, <mgautam@codeaurora.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v1] phy: qcom-qusb2: Set drvdata before pm_runtime_set_active in probe
Date: Thu, 9 Jan 2025 15:37:41 +0530
Message-ID: <20250109100741.3117652-1-quic_varada@quicinc.com>
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
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ZrCX3hjlK9b2vXeRbXk3MPcXsbSm0edN
X-Proofpoint-GUID: ZrCX3hjlK9b2vXeRbXk3MPcXsbSm0edN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 bulkscore=5 lowpriorityscore=5 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090082

From: Vignesh Viswanathan <quic_viswanat@quicinc.com>

The commit 891a96f65ac3 ("phy: qcom-qusb2: Add support for
runtime PM") added support for runtime PM to the qcom-qusb2
driver. However, pm_runtime_set_active is invoked before driver
data is saved into the 'device' structure. Randomly the runtime
PM ops seem to get invoked between pm_runtime_set_active and
dev_set_drvdata resulting in the following crash.

Hence do dev_set_drvdata early in the probe.

	Unable to handle kernel NULL pointer dereference at virtual address 00000065 when read

	[ . . . ]

	PC is at qusb2_phy_runtime_suspend+0x8/0x164 [phy_qcom_qusb2]
	LR is at __rpm_callback+0x3c/0x110
	pc : [<82780018>]    lr : [<40523ff0>]    psr: a0000013
	sp : 410dfe88  ip : 00000000  fp : 4015eb68
	r10: 00000003  r9 : 00000000  r8 : 410c8894
	r7 : 405222f0  r6 : 405222f0  r5 : 00000000  r4 : 00000000
	r3 : 82780010  r2 : 411088c0  r1 : 410c8810  r0 : 410c8810
	Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user
	Control: 10c0383d  Table: 422a806a  DAC: 00000055

	[ . . . ]

	Call Trace:
		qusb2_phy_runtime_suspend+0x8/0x164 [phy_qcom_qusb2]
		__rpm_callback+0x3c/0x110
		rpm_callback+0x50/0x54
		rpm_suspend+0x23c/0x428
		pm_runtime_work+0x74/0x8c
		process_scheduled_works+0x1bc/0x2b8
		worker_thread+0x260/0x2e4
		kthread+0x118/0x12c
		ret_from_fork+0x14/0x38
		Exception stack(0x410dffb0 to 0x410dfff8)

Fixes: 891a96f65ac3b ("phy: qcom-qusb2: Add support for runtime PM")
Signed-off-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index 1f5f7df14d5a..e08d9c5b409b 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -1025,6 +1025,8 @@ static int qusb2_phy_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	or = &qphy->overrides;
 
+	dev_set_drvdata(dev, qphy);
+
 	qphy->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(qphy->base))
 		return PTR_ERR(qphy->base);
@@ -1135,7 +1137,6 @@ static int qusb2_phy_probe(struct platform_device *pdev)
 	}
 	qphy->phy = generic_phy;
 
-	dev_set_drvdata(dev, qphy);
 	phy_set_drvdata(generic_phy, qphy);
 
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);

base-commit: 6ecd20965bdc21b265a0671ccf36d9ad8043f5ab
-- 
2.34.1


