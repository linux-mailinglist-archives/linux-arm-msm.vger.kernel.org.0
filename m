Return-Path: <linux-arm-msm+bounces-52046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 52907A69F96
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 06:56:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CB0F189B1B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 05:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A4781E5B6A;
	Thu, 20 Mar 2025 05:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aZVU9P25"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E0A1B4138;
	Thu, 20 Mar 2025 05:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742450126; cv=none; b=HAqvmYEzVDlxf9Faa1PszjbO9ydyTN0D6btlAzsbyMvg1D686JIhrWIK/gCTiyB48x/pnVSo4wkkuNdC1RGMUYWqcNrGX35XmMdcQIwYDsyTPBZRIwlga/79tCJpupvMqHgndTLRpLjXyUZvGVWRGzQIzXsRb2fF4SSQ39o+1sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742450126; c=relaxed/simple;
	bh=UoDHUQot7aiNel/dWXZ8sdBjPYxDl8QjepsC4kj2KLk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fmFAW115j1V5QE4r4GUAA5kibyprmZCD57X28jMhiPqy3fEmyMD0HBbZ5UxqrvaDE43tNfIUup7HRGTSgb+ktjO+53f1fip4LA+takw4mhpHme7uf36rSJ1Th9N1x8LRne41Y/IU+QnPNbZPHY+FpH/OyM98pO2hADohxPyOaB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aZVU9P25; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52JKFall013765;
	Thu, 20 Mar 2025 05:55:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jltmC+5S8tP
	5VPksVdaHGC5AUJ0IOzcb691QfMXchVc=; b=aZVU9P25B9UMawEMyMiIhNxU0WN
	egMwJuzjMCd6oqCfNMD/nbsCq992WYQ0LEVlfJIlRMFWvekwRhjWn9uoYApQ2pFn
	4E23O9mTGMZvpwfA41QrXwAE1/IZqKif3ugubIWLDkalSg6Vuy5mt5cYXp5wRiXT
	R9OxJhYoPrvGmGjSnZaAgdOnu20e81HTZf8OkNH6dAVsyzYxbUMyYVR8wA0Ydf34
	GkpD/4iiPPIKEz88UrHRsQvY03qmQN4hcp24M03zQ7QCBdsu7Sr+5I7yCMHrsOoJ
	XnOf96lM3ukgUCfpaGshuKtJdV1y7i68AX77MpIWxkG5bsvKzGNsfLyVraw==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45g4t414ea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 05:55:10 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 52K5t8HU014352;
	Thu, 20 Mar 2025 05:55:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 45dk529f4h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 05:55:08 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 52K5t8ta014233;
	Thu, 20 Mar 2025 05:55:08 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 52K5t7gj014058
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 05:55:08 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 4635958)
	id AB95C40BF4; Thu, 20 Mar 2025 13:55:06 +0800 (CST)
From: Wenbin Yao <quic_wenbyao@quicinc.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        catalin.marinas@arm.com, will@kernel.org, quic_qianyu@quicinc.com,
        sfr@canb.auug.org.au, linux-arm-kernel@lists.infradead.org
Cc: quic_wenbyao@quicinc.com
Subject: [PATCH v1 1/3] arm64: defconfig: enable PCI Power Control for PCIe3
Date: Thu, 20 Mar 2025 13:55:00 +0800
Message-Id: <20250320055502.274849-2-quic_wenbyao@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250320055502.274849-1-quic_wenbyao@quicinc.com>
References: <20250320055502.274849-1-quic_wenbyao@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=HMPDFptv c=1 sm=1 tr=0 ts=67dbadbe cx=c_pps a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=8J9pHfFvgnT8GwhQ4KkA:9 a=yqDflvYcuAT_gElW2OLv:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: bk8VECaIQ6SlL6RWqqhmOHBW6cRNrSIQ
X-Proofpoint-ORIG-GUID: bk8VECaIQ6SlL6RWqqhmOHBW6cRNrSIQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_01,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxscore=0 clxscore=1011 bulkscore=0 impostorscore=0
 mlxlogscore=769 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503200035

From: Qiang Yu <quic_qianyu@quicinc.com>

Enable the pwrctrl driver, which is utilized to manage the power supplies
of the devices connected to the PCI slots. This ensures that the voltage
rails of the x8 PCI slots on the X1E80100 - QCP can be correctly turned
on/off if they are described under PCIe port device tree node.

Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 85ec2fba1..de86d1121 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -245,6 +245,7 @@ CONFIG_PCIE_LAYERSCAPE_GEN4=y
 CONFIG_PCI_ENDPOINT=y
 CONFIG_PCI_ENDPOINT_CONFIGFS=y
 CONFIG_PCI_EPF_TEST=m
+CONFIG_PCI_PWRCTL_SLOT=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_FW_LOADER_USER_HELPER=y
-- 
2.34.1


