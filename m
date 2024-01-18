Return-Path: <linux-arm-msm+bounces-7562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EF6831D10
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jan 2024 16:57:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4C8A28419C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jan 2024 15:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A6D928DB0;
	Thu, 18 Jan 2024 15:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mTahI4Vi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9A62C194;
	Thu, 18 Jan 2024 15:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705593466; cv=none; b=RNb50nnDMqUM9mcC+4VoIBflmAwjqJQ/aYf1EKHlaCBIN1mSuf7KfceOvs1gP/6+pfiZ+br49VJiPW+FBUz3WBehHOjnAsTvr2Mp2Jo7DKuk0EKSeX73hv+upIRMTAynlVnxilOw4qoCRSJ7pDt6wR440ZCj2vhWAnfylLOxfxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705593466; c=relaxed/simple;
	bh=ujmT7stPCKfSLVaJLN4v/5WuxTC7Y3boCc07t+YaJoI=;
	h=Received:DKIM-Signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-QCInternal:X-Proofpoint-Virus-Version:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details; b=i8LYREUC7nxVN5vv0UDYfaHNJZvklGhD8FUsm7HONhzODFDwn6CG4y5TCLXwk+orbe3UMx6UX2Nj5HlFs5FXN0Nm2Bv3WhW6N9gC6wiW7yO4iv5dcwRFYdRbWpC/9Dazw6YzLvIXd2d7zxwHcF8zf9ky5Lbu3XeQiLTfla2II/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mTahI4Vi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40ICPtIL011210;
	Thu, 18 Jan 2024 15:57:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=7GBvf+v
	Fj+0SXE5Pm6Lmtpw4ZYnmUpJ53mUUuWb6ZXM=; b=mTahI4Vij6ndSnl939sGlFP
	wAYatpzYlhEDZUphHA7diGTg/kShnX9X2ESruwTLnz2LwDlbzAd4HArK2GwJTXQN
	5Y3B+P8uvSIXDT9nqRvxZKjaiMqxpBX38pRQuUJFTRdk8PhVJBR0LzfgW2GnftvT
	3+ZJbQmawPpdtUF2A7yTue2AYn/+W1ItRV9TYNIC8tvwpHaiQkOIgWzh1bGPoGyS
	6yfaO8dCB/pwaZdXOkPhF7zya3VzDCT6cEK9Nbhi7/hRBwW/ZNPfROnbpIqMq2fC
	bmGYaLHJR1D3BawysMpG1VIgKKf21HRcfgbW7GP0J+yfSqdcK/V6/EV7UQ8lmww=
	=
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vq403gfe9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jan 2024 15:57:40 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40IFvdRb031602
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jan 2024 15:57:39 GMT
Received: from hu-ninanaik-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 18 Jan 2024 07:57:33 -0800
From: Ninad Naik <quic_ninanaik@quicinc.com>
To: <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <quic_psodagud@quicinc.com>, <quic_kprasan@quicinc.com>,
        <quic_ymg@quicinc.com>, <kernel@quicinc.com>,
        Ninad Naik
	<quic_ninanaik@quicinc.com>
Subject: [PATCH] arm64: dts: qcom: sa8775p: Add new memory map updates to SA8775P
Date: Thu, 18 Jan 2024 21:27:11 +0530
Message-ID: <20240118155711.7601-1-quic_ninanaik@quicinc.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: md85JSkaoBfiMxQi9vEzVbT_ot1tw4oD
X-Proofpoint-ORIG-GUID: md85JSkaoBfiMxQi9vEzVbT_ot1tw4oD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-18_08,2024-01-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1011
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 phishscore=0
 spamscore=0 adultscore=0 mlxlogscore=540 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401180115

New memory map layout changes (by Qualcomm firmware) have brought
in updates to base addresses and/or size for different memory regions
like cpcucp_fw, tz-stat, and also introduces new memory regions for
resource manager firmware. This change brings in these corresponding
memory map updates to the SA8775P SoC device tree.

Signed-off-by: Ninad Naik <quic_ninanaik@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 103 +++++++++++++++++++++++---
 1 file changed, 94 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index a7eaca33d326..20b16fb5f537 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -356,13 +356,18 @@ uefi_log: uefi-log@908b0000 {
 			no-map;
 		};
 
+		ddr_training_checksum: ddr_training_checksum@908c0000 {
+			reg = <0x0 0x908c0000 0x0 0x1000>;
+			no-map;
+		};
+
 		reserved_mem: reserved@908f0000 {
-			reg = <0x0 0x908f0000 0x0 0xf000>;
+			reg = <0x0 0x908f0000 0x0 0xe000>;
 			no-map;
 		};
 
-		secdata_apss_mem: secdata-apss@908ff000 {
-			reg = <0x0 0x908ff000 0x0 0x1000>;
+		secdata_apss_mem: secdata-apss@908fe000 {
+			reg = <0x0 0x908fe000 0x0 0x2000>;
 			no-map;
 		};
 
@@ -373,8 +378,43 @@ smem_mem: smem@90900000 {
 			hwlocks = <&tcsr_mutex 3>;
 		};
 
-		cpucp_fw_mem: cpucp-fw@90b00000 {
-			reg = <0x0 0x90b00000 0x0 0x100000>;
+		tz_sail_mailbox_mem: tz-sail-mailbox@90c00000 {
+			reg = <0x0 0x90c00000 0x0 0x100000>;
+			no-map;
+		};
+
+		sail_mailbox_mem: sail-ss@90d00000 {
+			reg = <0x0 0x90d00000 0x0 0x100000>;
+			no-map;
+		};
+
+		sail_ota_mem: sail-ss@90e00000 {
+			reg = <0x0 0x90e00000 0x0 0x300000>;
+			no-map;
+		};
+
+		aoss_backup_mem: aoss-backup@91b00000 {
+			reg = <0x0 0x91b00000 0x0 0x40000>;
+			no-map;
+		};
+
+		cpucp_backup_mem: cpucp-backup@91b40000 {
+			reg = <0x0 0x91b40000 0x0 0x40000>;
+			no-map;
+		};
+
+		tz_config_backup_mem: tz-config-backup@91b80000 {
+			reg = <0x0 0x91b80000 0x0 0x10000>;
+			no-map;
+		};
+
+		ddr_training_data_mem: ddr-training-data@91b90000 {
+			reg = <0x0 0x91b90000 0x0 0x10000>;
+			no-map;
+		};
+
+		cdt_data_backup_mem: cdt-data-backup@91ba0000 {
+			reg = <0x0 0x91ba0000 0x0 0x1000>;
 			no-map;
 		};
 
@@ -433,14 +473,44 @@ pil_video_mem: pil-video@9fc00000 {
 			no-map;
 		};
 
+		audio_mdf_mem: audio_mdf_region@ae000000 {
+			reg = <0x0 0xae000000 0x0 0x1000000>;
+			no-map;
+		};
+
+		firmware_mem: firmware-region@b0000000 {
+			reg = <0x0 0xb0000000 0x0 0x800000>;
+			no-map;
+		};
+
 		hyptz_reserved_mem: hyptz-reserved@beb00000 {
 			reg = <0x0 0xbeb00000 0x0 0x11500000>;
 			no-map;
 		};
 
-		tz_stat_mem: tz-stat@d0000000 {
-			reg = <0x0 0xd0000000 0x0 0x100000>;
+		scmi_mem: scmi_region@d0000000 {
+			no-map;
+			reg = <0x0 0xd0000000 0x0 0x40000>;
+		};
+
+		firmware_logs_mem: firmware-logs@d0040000 {
+			no-map;
+			reg = <0x0 0xd0040000 0x0 0x10000>;
+		};
+
+		firmware_audio_mem: firmware-audio@d0050000 {
+			no-map;
+			reg = <0x0 0xd0050000 0x0 0x4000>;
+		};
+
+		firmware_reserved_mem: firmware-reserved@d0054000 {
 			no-map;
+			reg = <0x0 0xd0054000 0x0 0x9c000>;
+		};
+
+		firmware_quantum_test_mem: firmware-quantum-test@d00f0000 {
+			no-map;
+			reg = <0x0 0xd00f0000 0x0 0x10000>;
 		};
 
 		tags_mem: tags@d0100000 {
@@ -453,8 +523,23 @@ qtee_mem: qtee@d1300000 {
 			no-map;
 		};
 
-		trusted_apps_mem: trusted-apps@d1800000 {
-			reg = <0x0 0xd1800000 0x0 0x3900000>;
+		deepsleep_backup_mem: deepsleep_backup@d1800000 {
+			reg = <0x0 0xd1800000 0x0 0x100000>;
+			no-map;
+		};
+
+		trusted_apps_mem: trusted-apps@d1900000 {
+			reg = <0x0 0xd1900000 0x0 0x3800000>;
+			no-map;
+		};
+
+		tz_stat_mem: tz-stat@db100000 {
+			reg = <0x0 0xdb100000 0x0 0x100000>;
+			no-map;
+		};
+
+		cpucp_fw_mem: cpucp-fw@db200000 {
+			reg = <0x0 0xdb200000 0x0 0x100000>;
 			no-map;
 		};
 	};
-- 
2.42.0


