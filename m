Return-Path: <linux-arm-msm+bounces-8185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFBA83B939
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 06:53:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B02D21C22DB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 05:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04C7D101CE;
	Thu, 25 Jan 2024 05:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pdSTxKV6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8287610A17;
	Thu, 25 Jan 2024 05:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706161976; cv=none; b=n957TRf9YNKeQCujnm7nr6JzdbC+JvphMtE35SZ/4DvnGMvzVL3oUePR9pr1mDeEHv//TDolCZqhKJO5Perp7aRT4SoujthCyUKaAzUubhmc5JJkh4ehicv5OtnngzAGwluuBYLnT3NKSclsOJ1J2H02XWotdWg6rdRHATBmCDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706161976; c=relaxed/simple;
	bh=//AKPjJhAYAm79LX5CH9SLqFP0MhPUBZ8jgfb+4QM+U=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VqutVIWBMu+x1wyyaHDsfivIrcYvETW8y06e8u5bRb8XlHoTWQEohJiIY3a8YvNDPrmdAzQmg1NvbYHpeDSFCuPwTmUzOxCgFOlxIlngNTRdPb6CekVr19EgIIAjn0R7LHET4uvpCgcULXmLSR1Dyfnpi4TrcDBWGGs/7lrtDck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pdSTxKV6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40P50D3T016059;
	Thu, 25 Jan 2024 05:52:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=IWv7K92
	EKSN1Fe+DgcJl4giZa3TeteYEhXQJsNe/U/w=; b=pdSTxKV6WW4F0lTGoHWys7k
	mFKVVrF2D9xhaGdvSSiXSSTfBkztPPXAee1bP561tG3aIIc65oX3xGaxdmZOwqRH
	awLxLM3/Cle+Ksqnm8Ul9KeD7sTBD7EQjio3KG3ilOZltzHrdKfq5uf2vxt9J4hP
	O7c39aiZRrH/2skzxE0sZucDMqXVu4q/Xe4WwgTFB6L65k/+19jdfy0blnJ+xPme
	5uLPN2ws8IHBCZqi5sDQNcGv8vOJ/VnHLij17ieUCyd4RMq7LC4UKhElV8xcpnZL
	RDWvYORcNrbsS5Ji/WNuY5rFZdHjWwyCvMZHY4O99yaEdYkrdHOuRV0rBZWvE+w=
	=
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vu6j2sgqw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 05:52:51 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40P5qp71020952
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 05:52:51 GMT
Received: from hu-ninanaik-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 24 Jan 2024 21:52:45 -0800
From: Ninad Naik <quic_ninanaik@quicinc.com>
To: <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <quic_psodagud@quicinc.com>, <quic_kprasan@quicinc.com>,
        <kernel@quicinc.com>, Ninad Naik <quic_ninanaik@quicinc.com>
Subject: [PATCH v2] arm64: dts: qcom: sa8775p: Add new memory map updates to SA8775P
Date: Thu, 25 Jan 2024 11:21:34 +0530
Message-ID: <20240125055134.7015-1-quic_ninanaik@quicinc.com>
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
X-Proofpoint-ORIG-GUID: -U6hL3YSOfdyWsdlQ7CUtLTRzNT0-Lxc
X-Proofpoint-GUID: -U6hL3YSOfdyWsdlQ7CUtLTRzNT0-Lxc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_02,2024-01-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 malwarescore=0 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 adultscore=0 mlxlogscore=685 spamscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401250038

New memory map layout changes (by Qualcomm firmware) have brought
in updates to base addresses and/or size for different memory regions
like cpcucp_fw, tz-stat, and also introduces new memory regions for
resource manager firmware. The updated memory map also fixes existing
issues pertaining to boot up failure while running memtest, thus
improving stability.

This change brings in these corresponding memory map updates to the
device tree for SA8775P SoC platform, which currently is in its
development stage.

Signed-off-by: Ninad Naik <quic_ninanaik@quicinc.com>
---
Changes since v1:
- Updated commit message.
- Fixed reserved memory node naming, by replacing underscore with
  hyphen.
- https://lore.kernel.org/all/20240118155711.7601-1-quic_ninanaik@quicinc.com/
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 103 +++++++++++++++++++++++---
 1 file changed, 94 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index a7eaca33d326..2e9606c80381 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -356,13 +356,18 @@ uefi_log: uefi-log@908b0000 {
 			no-map;
 		};
 
+		ddr_training_checksum: ddr-training-checksum@908c0000 {
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
 
@@ -433,13 +473,43 @@ pil_video_mem: pil-video@9fc00000 {
 			no-map;
 		};
 
+		audio_mdf_mem: audio-mdf-region@ae000000 {
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
+		scmi_mem: scmi-region@d0000000 {
+			reg = <0x0 0xd0000000 0x0 0x40000>;
+			no-map;
+		};
+
+		firmware_logs_mem: firmware-logs@d0040000 {
+			reg = <0x0 0xd0040000 0x0 0x10000>;
+			no-map;
+		};
+
+		firmware_audio_mem: firmware-audio@d0050000 {
+			reg = <0x0 0xd0050000 0x0 0x4000>;
+			no-map;
+		};
+
+		firmware_reserved_mem: firmware-reserved@d0054000 {
+			reg = <0x0 0xd0054000 0x0 0x9c000>;
+			no-map;
+		};
+
+		firmware_quantum_test_mem: firmware-quantum-test@d00f0000 {
+			reg = <0x0 0xd00f0000 0x0 0x10000>;
 			no-map;
 		};
 
@@ -453,8 +523,23 @@ qtee_mem: qtee@d1300000 {
 			no-map;
 		};
 
-		trusted_apps_mem: trusted-apps@d1800000 {
-			reg = <0x0 0xd1800000 0x0 0x3900000>;
+		deepsleep_backup_mem: deepsleep-backup@d1800000 {
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


