Return-Path: <linux-arm-msm+bounces-93650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMmcMu0mnGl1AAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 11:07:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 747751748AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 11:07:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6E8CF302E57E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 10:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 820DD35B136;
	Mon, 23 Feb 2026 10:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VcCTdIKJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAAE35D604;
	Mon, 23 Feb 2026 10:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771841195; cv=none; b=ibUTcfI14Hc9a9feacgDOCywHF8U0QFFGLOSzTC036xMXnP2uJHMwfzHRh2hctq1UdoJjzaWfsdRKk028+fm0hlM5FCFlCA9IiViF4HTIlqgCeBXHd1uFtVxJiAEKCrntbLjzFuSwSSckLjiz54PdR1nzcPRYbnx4i0CM5faM+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771841195; c=relaxed/simple;
	bh=46zP8/3uEhKDHAy2w48I/5c52vWncvOYIr9i+27DwMQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SD9wAuw5fiNtRiK8c1+3g7eZSbmfKm7qZe0bgC0fZrjdaujg60GbqPVoDe6mNE/8Y1J2OUpYcslAWd/MV2MtaJAvXtAA+c+RHHj7sZixJ2N5OfFnqGepAz4VXcmfyTYqFc4XCsB9tWYbwwxcVFwjbqnuIkTfjqCY0MRJNX3vA98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VcCTdIKJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N98Gpl2146284;
	Mon, 23 Feb 2026 10:06:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HWdwbEI9gST7ypPT44xlET97rSwA/nShW0m0ohLfjP0=; b=VcCTdIKJM3jUvWlW
	MIHmIEIM6uFJVbqbycvQgyX7hNYFh8HQ1AHp2mxguM8SnaBWYjGhfY/2WzjqU3+U
	LQ6moX4LfA6ErnHNJnKriJIJse44+CNoqKNKk7VR1UqRFdfZmPmrBroIqU6UxU/Y
	/Zr93J85WG4IqyaL5ECwy1UUmZQhO/orMgm/2ctZki/jSkxR5X5jLS36YM0FTFX2
	KTqjHP2a6uGtznLBNJ173DH5VDp5hy98AExB0WMsSEzckdWUd7oVmCrSg5vaMFQN
	v87sxibVsFZdawK+GKdtE8dHJGU9Amt90SKGYA4PIKSWxdlNLKjkt7XESX3lhAY8
	E+rDNA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wyv9us-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Feb 2026 10:06:31 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 61NA6Uue027248
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Feb 2026 10:06:30 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 23 Feb 2026 02:06:27 -0800
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_mdalam@quicinc.com>
Subject: [PATCH v5 6/6] arm64: dts: qcom: ipq5332-rdp442: Remove eMMC support
Date: Mon, 23 Feb 2026 15:35:52 +0530
Message-ID: <20260223100552.1050303-7-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260223100552.1050303-1-quic_mdalam@quicinc.com>
References: <20260223100552.1050303-1-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4NiBTYWx0ZWRfX44vbbYaHYIm0
 v36D0eVZOUgpB8PcqGiqsWp+I+pU9oyDrkKvwAg5RZOiJPIezYlbTI4FMG5QW6X+MlAGBNWHcZZ
 /lqKIkOczRvdqJGSJ3YBsxg+63VgfsUxn8Ccj2alRp9kcMM5tWTS33GxkOwQq4HKE1cg51LDM86
 eQJ1RWVkkreVFOczBZrYhnLUDqTd2UVu7dG6M9Knc0yh/TA2q7hk/u0pgS8mRPFAwcwh608CFs5
 CyIvtMPksY5hUeLdBE7dUb/8N/es80RqccrGF8pJ7SBS9nvr1uKrckFWhw/A3J5KfkraBrlQIme
 N/4sEe6cJLPmeJLn5idH7XhgOSF10oFBMBE8MzYVl+r4c2+fCTIt/C3U1ri+0JMjFuR0zMO0o6e
 3M9oUueZEy8i0WzhPLaMh4deaD1Du44e4IVfojWvq0XCqliwkIJ84WS6LS5YZryQTJGV/tl+H9T
 0CHenGNBuvR2VOZzbAw==
X-Authority-Analysis: v=2.4 cv=UO/Q3Sfy c=1 sm=1 tr=0 ts=699c26a7 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=fuWxvNZPvO_ztXA3lyEA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: mTyMAJDmtS25_IyZsfgM6L2KYUefPUie
X-Proofpoint-ORIG-GUID: mTyMAJDmtS25_IyZsfgM6L2KYUefPUie
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230086
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93650-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[quicinc.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,quicinc.com:mid,quicinc.com:dkim,quicinc.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[quic_mdalam@quicinc.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 747751748AF
X-Rspamd-Action: no action

Remove eMMC support from the IPQ5332 RDP442 board configuration to
align with the board's default NOR+NAND boot mode design.

The IPQ5332 RDP442 board is designed with NOR+NAND as the default boot
mode configuration. The eMMC and SPI NAND interface share
same GPIO

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---

Change in [v5]

* No change

Change in [v4]

* No change

Change in [v3]

* Added Reviewed-by tag

Change in [v2]

* updated board name commit message header

Change in [v1]

* Removed eMMC node

 arch/arm64/boot/dts/qcom/ipq5332-rdp442.dts | 34 ---------------------
 1 file changed, 34 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332-rdp442.dts b/arch/arm64/boot/dts/qcom/ipq5332-rdp442.dts
index ed8a54eb95c0..6e2abde9ed89 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332-rdp442.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5332-rdp442.dts
@@ -35,17 +35,6 @@ flash@0 {
 	};
 };
 
-&sdhc {
-	bus-width = <4>;
-	max-frequency = <192000000>;
-	mmc-ddr-1_8v;
-	mmc-hs200-1_8v;
-	non-removable;
-	pinctrl-0 = <&sdc_default_state>;
-	pinctrl-names = "default";
-	status = "okay";
-};
-
 &tlmm {
 	i2c_1_pins: i2c-1-state {
 		pins = "gpio29", "gpio30";
@@ -54,29 +43,6 @@ i2c_1_pins: i2c-1-state {
 		bias-pull-up;
 	};
 
-	sdc_default_state: sdc-default-state {
-		clk-pins {
-			pins = "gpio13";
-			function = "sdc_clk";
-			drive-strength = <8>;
-			bias-disable;
-		};
-
-		cmd-pins {
-			pins = "gpio12";
-			function = "sdc_cmd";
-			drive-strength = <8>;
-			bias-pull-up;
-		};
-
-		data-pins {
-			pins = "gpio8", "gpio9", "gpio10", "gpio11";
-			function = "sdc_data";
-			drive-strength = <8>;
-			bias-pull-up;
-		};
-	};
-
 	spi_0_data_clk_pins: spi-0-data-clk-state {
 		pins = "gpio14", "gpio15", "gpio16";
 		function = "blsp0_spi";
-- 
2.34.1


