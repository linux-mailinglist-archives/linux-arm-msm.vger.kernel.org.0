Return-Path: <linux-arm-msm+bounces-64318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80694AFFD68
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 11:02:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D008D5A7428
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 09:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 017D72D3226;
	Thu, 10 Jul 2025 08:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Hz+cwjxH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57ECC2D1F40;
	Thu, 10 Jul 2025 08:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752137952; cv=none; b=vDOPAO/E8hbkH2WcMCK0D+gGRUNgpM1v8BzjzFTnYkLXkdgXunl4fnvIjuHe4emN35A/h3wTk0aPX+qLi7ibFcen+YxHmS43Z5CRSQHUJ0u44QesMQQC1aQccGsL6YVvWhmSq3oD2w9zl74mDIsEpkbN+X5hqqGMnWfZGk800Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752137952; c=relaxed/simple;
	bh=ND7wZoW4SfAEJrh8cBq38SEmtb4u56R7nuLL95cmZ58=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=amSU3OoTcJqvHNBzPKDBxK76HY4iIarHQN4clIKKVoPEWF2cTdewkP/O+CC+SEyVTtO7V/9syiTT1ysWutWSU8TaxAKVpwyUkLiBdBgygZMQTiCS23DITBG/mepwafMPjIceIAWpia1jQ8klaQHVY28Udy53CoKarfUlPYUSVgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Hz+cwjxH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A1MVUr031802;
	Thu, 10 Jul 2025 08:59:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eq6dLe73JDqzqA1+CfLEaddzO4z76o3cj0Sq+G0fVQU=; b=Hz+cwjxHRSFpIxXx
	27WSLV+bkwW06vqHC7QPCIObmXQ2StsMqwEIQNacMe0FgxdMCvnBvxH3eprwZNZv
	ufqiiRGx211AJ3T6QvkbHgFfLLYwDVnihQKsFbgJXGm8oE7hXU9iUseWzXFIFlXX
	P8U5SHlwKNuSu3ssJUJYWRp1SNyy651zsew3Nvy4tqKpUcVAqrLelSgZ+1sKVbDY
	Wp6fhMMDPMSI7At1YTVYoTSWrsl88IJQsmnsUOAmiGQIz4hZNi8pIO12TMtmztiP
	p4VBhtLDaw3dJ73fdImcB7X0KfHkt/7gOtrh3psfwelB6sR/CNez+k1xMwLLYl9U
	TxMYyw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pw7qxwg2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 08:59:08 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56A8x8ps009866
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 08:59:08 GMT
Received: from hu-vpernami-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 10 Jul 2025 01:59:06 -0700
From: Vivek.Pernamitta@quicinc.com
Date: Thu, 10 Jul 2025 14:28:35 +0530
Subject: [PATCH v2 4/5] bus: mhi: host: pci_generic: Add SRIOV support for
 PCIe device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250710-sriov_vdev_next-20250630-v2-4-4bd862b822e8@quicinc.com>
References: <20250710-sriov_vdev_next-20250630-v2-0-4bd862b822e8@quicinc.com>
In-Reply-To: <20250710-sriov_vdev_next-20250630-v2-0-4bd862b822e8@quicinc.com>
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vivek Pernamitta <quic_vpernami@quicinc.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752137937; l=1026;
 i=<quic_vpernami@quicinc.com>; s=20241114; h=from:subject:message-id;
 bh=hWNvqw1z7e1aVXdEVeVAQyEsNOgEtVonyoDz7Pv1XfU=;
 b=G/riRL69E8bWWQRFJgdudJuCFUk/GuX3nzePwIszpqrFr0sdA0ybhqpupCterb5i+7iHyBA1w
 nM4RyUtuEoXA1KSuslHjfgSdJU/SPgULihKLnjCW7rKSHZctAZgi5f5
X-Developer-Key: i=<quic_vpernami@quicinc.com>; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDA3NiBTYWx0ZWRfX5jH3xZ728i+6
 buT87OFuDYmoOEcMYzVf6IQXV57NWfu5euZst0+jXRyGH3WN2w4dPABSTC6Z6o7Y72ToeVedzK6
 jI+OyJ7F+L+31JPOcsSOzypAZjo2i9Q0Z1gLthSAIn4cFu+DQpCsRS8oyY1et/tF+VUvR1+fSGv
 DekzYimC3cv/0ZgVdoG+CHP3fEmNnYGATP+9HsaVZSrFl5rBcnKKSVb9JqC0IxFPfTRjWGsG2cg
 A2QObZXX1zSbLDbHLr5NWQ5DuLEFqBQ3Igut+w4MJBnC+qU82E+NmwZ+TZ4CmGpLJQc6HoqybXb
 1+LMwhp8HDSM0Q1ijdSPMaZ859Mg4Gg5vvHx5uRKIMYU0XCqerckMlPv89hOZosUa58BwGBg/+a
 41liPSb9uuxgIqBVfgIgC9GHQBTgJ5cHTET2tBizEo3pGOlNubhvydob4H+DIWJcKC3LujAf
X-Proofpoint-GUID: taFeOCf6qc-p0mUoNRADB5PgdrWy61UY
X-Proofpoint-ORIG-GUID: taFeOCf6qc-p0mUoNRADB5PgdrWy61UY
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=686f80dc cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=1E9kmim99rDzh7857o0A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=928 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507100076

From: Vivek Pernamitta <quic_vpernami@quicinc.com>

Add SR-IOV support for PCIe devices.
pci_sriov_configure_simple() will enable or disable SR-IOV for devices
that don't require any specific PF setup before enabling SR-IOV.

Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/bus/mhi/host/pci_generic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 2d1381006293412fbc593316e5c7f0f59ac74da8..a64b5c365c920ef2edfebc994e82d6385ad7ddbd 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -1640,7 +1640,8 @@ static struct pci_driver mhi_pci_driver = {
 	.remove		= mhi_pci_remove,
 	.shutdown	= mhi_pci_shutdown,
 	.err_handler	= &mhi_pci_err_handler,
-	.driver.pm	= &mhi_pci_pm_ops
+	.driver.pm	= &mhi_pci_pm_ops,
+	.sriov_configure = pci_sriov_configure_simple
 };
 module_pci_driver(mhi_pci_driver);
 

-- 
2.34.1


