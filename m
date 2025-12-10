Return-Path: <linux-arm-msm+bounces-84930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6C8CB3D26
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 20:07:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D7E87312497E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 19:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC49C72623;
	Wed, 10 Dec 2025 19:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OWbHn0kz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y5LtHSnp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6BD23EAA3
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 19:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765393382; cv=none; b=BcPIq90R6QxMgXvOZnCnZzPlxk6Nxi6U0Z8+yMXiVZhqvhHcm2bW1i/01HsrHsFKXBXrygY+UIHALyARgS3tmjwaBgN9sBtph6P3CsmWO1GbQdUNuJu+oqU0NMu0q28hBTZXZxLJuZt/1N13DqxiTLp5DfbmaDrowB6H/+6yEiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765393382; c=relaxed/simple;
	bh=Njk4lTxac6wfGFb81GjhYAuNTxQsW3FJ66/36VTBzdI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l39jwy0yFk4mX84hESSDgGLBfqgcBjlH0h6BvXrKRihC3yXxxwIBLloq4SmGGIR0f4tPgQ01t6Bok0p64CXjePxDCuJFLLwGejqn6AtVFyOl3XLvH6w/Kgqgz93Q8FWz8TBIvICPWUwAp0sN54Zk4zg4CqunCGdVSAV/0kZ/dVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OWbHn0kz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y5LtHSnp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BAIR4kI3754315
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 19:02:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	td0VzW7o41POGrX5w5apOp+GwTPefU2LMgQyzYja1BQ=; b=OWbHn0kzizn8NzrF
	fXGBxrCXmDX3Y/Qsi0M7T8yGb+AU3bfk5OrvKH3gwyMYRqr8ky6QvkdLMQIBODwh
	XwbZtIFY68K0bH2/jyOYMntoS+l+J1Nnl/X7iCJifO1pAnC5qGGHMhdPrkcW9O+h
	XsVLYNY09MmWAq6azJLfa91acrDEErBpxOHhMbbz8JgzofGDPdta+QvcG7e1Mx8g
	srsf+kNKo4AHDNw4Scz4vDDhpqhqj/A8u1tspmYN/DQFQpOkhsDbtcEeMAZWip6g
	iY9+gRW7WE/k9ru/YsoybohVq7Qamv1LT8vJ4oxZk9fgxvswer4pYIM8N5o0ZZSg
	ka4pvg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aybhp8up3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 19:02:59 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c0c65e5f688so1234a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 11:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765393378; x=1765998178; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=td0VzW7o41POGrX5w5apOp+GwTPefU2LMgQyzYja1BQ=;
        b=Y5LtHSnpTA98drtuf18BnzHFuhY33/La3wxDTOi8wF5ArMmNzaNsHKdEuQnpWV5vCs
         MjPbeofQrz06gSsTS63pknGOCXXqOLWiIGYBFzPCYxO/xCnrk+6p7MgZYSvulhA0AjfK
         yafzdMht6/5TJi+E3HOklI/PxmOWQKHxv5nlkYaVZc1nZmdcDuJK2G0j7GNd/pu+yKBk
         S3S/FpmerGNCQA1maElGZ0kzFTZnRqagaMR1wyML7Wv9j0tjmPA1rTx8fxV0iXaVzWm4
         PK4zBz1l8FMUn/u+qnAKfx+3IqRsoQAIC2Tv5aXXVUAb68q5NfVPNZsxHr4t+glAIw3v
         AIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765393378; x=1765998178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=td0VzW7o41POGrX5w5apOp+GwTPefU2LMgQyzYja1BQ=;
        b=WtRVjjglboY+qP52ha16akllAGPC57xOzn7HDsYeAn+lTnRsAvksgHoHp3776HDhNZ
         lE0KfO0IRpgt2taKKkxHnxj89IKHZ4e1gL/CBGMeGTVkWMouOL/yAymDhPYXQPFE2LVx
         MTvgkDca0G14SRcXCJ6/+bOHrqvI5OYSfe6hoFiwALSRvpNIjSRefhB942YGCab/j8Ne
         nHlBYzTijJh/9epe0Uty0HtEEVSWnf3DqRhA3QrZOaTo/C+gBW2ATIBGa3kdXyVAlN3s
         WBxWb0uyCUCI9F8h2QDvGOfWZZBVYkgRUPqqNSSF96cv+fz4Y+jdiE90fpFrgC6lQMGy
         E0Cw==
X-Forwarded-Encrypted: i=1; AJvYcCXWQpzECKHS6Oi9hbz200RCvXIb0LcCKOXByEvCIhEQsGXWnti/yyxv8qF3F5+zcPStr97fb917AwVMM+XG@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6RXvuTd4xPQI3tVMgcss5OEfbQO82j0ysiqx4eqoUjjt28Aks
	nQMMXW6rCcPiM1mNlTlkG6/obBjHGlc2yx7c6rSYGsQ5u43y5qdzKfElXlN/WU0nXEYdhwKjqru
	JGcRs1/G3OHqGc4B95eeZ2CNz3fv3JM6yhiMaF15KmPg0nO+fiSR5QlVP87iNcB28hWLh
X-Gm-Gg: AY/fxX5uEs59bBMGp/GozknGgNhbTy47t0fmAKctuk1b8bLQpToC6LXQazye8ZU5nF0
	jtvIQYkmFRXkqJ2R2kU182bknt7hvb10wON/hXx1GfSC4pIn/0nAT74YaL92+95+O16IXpsKRxM
	y9CuJR0Zef2gg+JmFoWPwlb28kFC78jPB6NmIrxQRXKQqtwf2S/i/ADNbcVufEDtpu2aeT+bpFp
	h/XqLA/7pNGK87LgWYfqD+SCYj/JoaZyECpyCFADjD3NKzbfW+4s4/hzFRDQErQIZ96Hk09/yKF
	Ha5YuM1WNZWDlo+2z8RdYYx0WGzINqg+K/SWdp5igH3MbUXaA5wEUV6rhjCmfObRk7zNLwC7yjm
	vFiHCDfr8oVdaKSyLZBf6pXXi6wBNM+gjpmiopJ0l
X-Received: by 2002:a17:902:ce89:b0:298:360:1662 with SMTP id d9443c01a7336-29ee7007e03mr3338555ad.1.1765393378213;
        Wed, 10 Dec 2025 11:02:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGx0LI6XpTdjeda3I2G2PJF1wpjSOKHBokw37DmTTjk8eVAbBc1jgwKOEszkrbPDBn2YBEG5w==
X-Received: by 2002:a17:902:ce89:b0:298:360:1662 with SMTP id d9443c01a7336-29ee7007e03mr3338225ad.1.1765393377651;
        Wed, 10 Dec 2025 11:02:57 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea06b49csm888225ad.95.2025.12.10.11.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 11:02:57 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 00:32:24 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: SM8750: Enable CPUFreq support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-sm8750-cpufreq-v1-2-394609e8d624@oss.qualcomm.com>
References: <20251211-sm8750-cpufreq-v1-0-394609e8d624@oss.qualcomm.com>
In-Reply-To: <20251211-sm8750-cpufreq-v1-0-394609e8d624@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDE1NiBTYWx0ZWRfX2Z17ud3S3AQ3
 gOzxCw5PC/thkmwSNLQh4OGGLVapNnl3LQ3Kh0ze22qIkL5EcsVAGB2NcST/PG8z2ts182nH61s
 LBqr6v1UqjWTRYZYPFj2e2Zos6XDFqoaXUxiaSZUzJ9oRcrvQAkeW1ZN51cWDA5CONyqWInEoCI
 nXIFnDzx/hRnTHKqgANXzMGB3Kf6DXN2klhcW2N9hd6ZxeY8VOJlOKh6ueE5kA9Uwnero5Ved6X
 fnOPNMtcFx3W+xUlgAUuUx4bqVA5Uu6J3yvlT0b0SbKnUdhrLZ1g8CZOGordc/9ueRntzZIWQie
 4kOWJDHoxyzxhh6Np5OxluN2fZ4b5wTesVIrxb+JNfV2QSmiZQyevgLdhEjQqmHok095hUYW2K5
 4tq55mBUvKCDDmv9sXu6Ou50I8jgWA==
X-Proofpoint-ORIG-GUID: qlEzXW2bsXeO_dElFKi9v7MSnmTMca_4
X-Proofpoint-GUID: qlEzXW2bsXeO_dElFKi9v7MSnmTMca_4
X-Authority-Analysis: v=2.4 cv=LJ9rgZW9 c=1 sm=1 tr=0 ts=6939c3e3 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=yPp0gT2-jTIv1Hu-STYA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_02,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100156

Add the cpucp mailbox, sram and SCMI nodes required to enable
the CPUFreq support using the SCMI perf protocol on SM8750 SoCs.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 73 ++++++++++++++++++++++++++++--------
 1 file changed, 57 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 3f0b57f428bbb388521c27d9ae96bbef3d62b2e2..ae4d768b68721c5e35aa80d1aa63a02289b72ce6 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -35,8 +35,8 @@ cpu0: cpu@0 {
 			reg = <0x0 0x0>;
 			enable-method = "psci";
 			next-level-cache = <&l2_0>;
-			power-domains = <&cpu_pd0>;
-			power-domain-names = "psci";
+			power-domains = <&cpu_pd0>, <&scmi_dvfs 0>;
+			power-domain-names = "psci", "perf";
 
 			l2_0: l2-cache {
 				compatible = "cache";
@@ -51,8 +51,8 @@ cpu1: cpu@100 {
 			reg = <0x0 0x100>;
 			enable-method = "psci";
 			next-level-cache = <&l2_0>;
-			power-domains = <&cpu_pd1>;
-			power-domain-names = "psci";
+			power-domains = <&cpu_pd1>, <&scmi_dvfs 0>;
+			power-domain-names = "psci", "perf";
 		};
 
 		cpu2: cpu@200 {
@@ -61,8 +61,8 @@ cpu2: cpu@200 {
 			reg = <0x0 0x200>;
 			enable-method = "psci";
 			next-level-cache = <&l2_0>;
-			power-domains = <&cpu_pd2>;
-			power-domain-names = "psci";
+			power-domains = <&cpu_pd2>, <&scmi_dvfs 0>;
+			power-domain-names = "psci", "perf";
 		};
 
 		cpu3: cpu@300 {
@@ -71,8 +71,8 @@ cpu3: cpu@300 {
 			reg = <0x0 0x300>;
 			enable-method = "psci";
 			next-level-cache = <&l2_0>;
-			power-domains = <&cpu_pd3>;
-			power-domain-names = "psci";
+			power-domains = <&cpu_pd3>, <&scmi_dvfs 0>;
+			power-domain-names = "psci", "perf";
 		};
 
 		cpu4: cpu@400 {
@@ -81,8 +81,8 @@ cpu4: cpu@400 {
 			reg = <0x0 0x400>;
 			enable-method = "psci";
 			next-level-cache = <&l2_0>;
-			power-domains = <&cpu_pd4>;
-			power-domain-names = "psci";
+			power-domains = <&cpu_pd4>, <&scmi_dvfs 0>;
+			power-domain-names = "psci", "perf";
 		};
 
 		cpu5: cpu@500 {
@@ -91,8 +91,8 @@ cpu5: cpu@500 {
 			reg = <0x0 0x500>;
 			enable-method = "psci";
 			next-level-cache = <&l2_0>;
-			power-domains = <&cpu_pd5>;
-			power-domain-names = "psci";
+			power-domains = <&cpu_pd5>, <&scmi_dvfs 0>;
+			power-domain-names = "psci", "perf";
 		};
 
 		cpu6: cpu@10000 {
@@ -101,8 +101,8 @@ cpu6: cpu@10000 {
 			reg = <0x0 0x10000>;
 			enable-method = "psci";
 			next-level-cache = <&l2_1>;
-			power-domains = <&cpu_pd6>;
-			power-domain-names = "psci";
+			power-domains = <&cpu_pd6>, <&scmi_dvfs 1>;
+			power-domain-names = "psci", "perf";
 
 			l2_1: l2-cache {
 				compatible = "cache";
@@ -117,8 +117,8 @@ cpu7: cpu@10100 {
 			reg = <0x0 0x10100>;
 			enable-method = "psci";
 			next-level-cache = <&l2_1>;
-			power-domains = <&cpu_pd7>;
-			power-domain-names = "psci";
+			power-domains = <&cpu_pd7>, <&scmi_dvfs 1>;
+			power-domain-names = "psci", "perf";
 		};
 
 		cpu-map {
@@ -206,6 +206,21 @@ scm: scm {
 			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
+
+		scmi {
+			compatible = "arm,scmi";
+			mboxes = <&cpucp_mbox 0>, <&cpucp_mbox 2>;
+			mbox-names = "tx", "rx";
+			shmem = <&cpu_scp_lpri0>, <&cpu_scp_lpri1>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			scmi_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+		};
 	};
 
 	clk_virt: interconnect-0 {
@@ -3743,6 +3758,13 @@ opp-403000000 {
 			};
 		};
 
+		cpucp_mbox: mailbox@16430000 {
+			compatible = "qcom,sm8750-cpucp-mbox", "qcom,x1e80100-cpucp-mbox";
+			reg = <0x0 0x16430000 0x0 0x8000>, <0x0 0x17830000 0x0 0x8000>;
+			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <1>;
+		};
+
 		apps_rsc: rsc@16500000 {
 			compatible = "qcom,rpmh-rsc";
 			reg = <0x0 0x16500000 0x0 0x10000>,
@@ -3954,6 +3976,25 @@ frame@1680d000 {
 			};
 		};
 
+		sram: sram@17b4e000 {
+			compatible = "mmio-sram";
+			reg = <0x0 0x17b4e000 0x0 0x400>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x0 0x17b4e000 0x400>;
+
+			cpu_scp_lpri0: scp-sram-section@0 {
+				compatible = "arm,scmi-shmem";
+				reg = <0x0 0x200>;
+			};
+
+			cpu_scp_lpri1: scp-sram-section@200 {
+				compatible = "arm,scmi-shmem";
+				reg = <0x200 0x200>;
+			};
+		};
+
 		/* cluster0 */
 		pmu@240b3400 {
 			compatible = "qcom,sm8750-cpu-bwmon", "qcom,sdm845-bwmon";

-- 
2.34.1


