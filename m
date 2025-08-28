Return-Path: <linux-arm-msm+bounces-71079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E4DB3960B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 09:56:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54F9C1C20EBF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 07:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FFA12D7394;
	Thu, 28 Aug 2025 07:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F5BxorN2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73EC2D3738
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 07:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756367760; cv=none; b=tVGpyzL1wHBVgxl7D7CFSg+9aB1fWOHJS1atCx66Y6+RzQR/Qas4hX7ykpDMW3RWirao/B8WdYCr7ClrAo/kliytPSavHOQsg+j/Oa/677mE9nTSspKlemE/3gy3IDGC1XAH7VAoD/qCDdHS3AfwahedThr8JN+7+SiMV6X9CxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756367760; c=relaxed/simple;
	bh=0H4B6/wnQyWhKc04n8w05M9ADN7Eyb8jMn+ZmbV/gtQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=X/9sOcDdrDJOyNSenC76HQSVj0HsBnaKY8rS5EDa5OOkHjVXVwVluTDOJ7QNFIUDh6KF0ipLtJ/FK0S2ERfBAbKV7AWXxLWpRYy7TDhx/KnAmFGpYKvR3gV1Tgmv7oARIfaizaEvtGJmgDSyL5TX06DChwU21c3uT6tOuDMwzjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F5BxorN2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S5umsZ016186
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 07:55:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bBC6W9JnECBJI7fZ7UEMXy
	l/iD3qDlwniyIZoRzi26E=; b=F5BxorN2A+9FgxKiII2U3aAAuPytqR5XMZisuY
	EmpJtWjvqRIyRrHRFML8q2s9xOToYhZpMYp5zQ8/tT1PpgtfVHrZIqIiW3n1iZkE
	KkQuPHtu5NOhWJLKSh2hfZ2eCuoooeLWG0+h6HDBWTBv8fvQMeE//1MP1BgT6RfO
	MX9gpyliPkO/1c9BQLEQRFwV6LLgJ+YDA89kbOxpeAuyluCmMzHKW7hbjNm4dtSV
	kX7KouylD1L1O7Jyc+wHYxjmVk7j2VwbauKLU7WXhyT6dYWZKB78fRZycKWNpS7D
	ffP1hzgzGevOod9nU8qjKwgGlURPwvxG4MuXSfB0mxTVouFw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48rtpf1qp2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 07:55:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2461907278dso9340025ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 00:55:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756367756; x=1756972556;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bBC6W9JnECBJI7fZ7UEMXyl/iD3qDlwniyIZoRzi26E=;
        b=VeTOuCFmJMZMkJoBvKf8IlbwInv/AzpeaZnUl+KszookDFFw1a03As+o3FdGPJcp2L
         2Cf3fuyhEj+zCmZVTq7VIfEbHAddu1zHD/TUl5anN3aqtom3uChbzfSdnI0SKRwnxJAA
         NbAPZ+H2koFIbmO3wh9tyHqLdrE5telHMXD5TXUqF4RZrVbxZLxVc9qLZ39O5gGR0bqi
         l+WtnY14E8Qh25HLCXCi+8l0PFjxT4GDF9cNmOiY5aQ8cjx9Gfb8Pulf5sibWnCDA3AO
         CGunco+KvgG5dv+y1NcTT7CnJWEea6OH4DotiuyzFEGv4L5qetQn17oI8NwTkHVuxIIH
         Olvg==
X-Gm-Message-State: AOJu0Yz18Yucl1V9ye/nbvvKfOGsjz9KqgOuOMj10tjMgik+mzHcriPI
	0EkvPRPBNL+PRHtT3ckJystBhr2DkbJJ3CsvRFbyWrXQ0cD/Am9qqz8JzfoR53ZJBoZVsQrmLFC
	+G+pTHTh44cgNnwcMy8I59sOToHDWecx7Y6rdX0Au21v9eu2Mj3PHsF6SH7csY7RbaZFp
X-Gm-Gg: ASbGnctfKIFDphHfitEITyS/EQ5b5g+G4nBLjox7EhT5JOmDXtAVMs9RjgH0f2etbmk
	hoI0FeROJIRcMkDr0adeY3A5rtbjLHEf2/fT3Dg5IDseAXvQTc8QEM/uHk8OPGEGpfPqFLz7am0
	ZJKUgavhBeTAWc1uOGe1fUYrPbx0CC2U/voKygedjydcsoFNiT+a9gzWsWDN7KQ8gyin06+JPVX
	BG4wUWpwuroK1TWAOglAtSA0YwwGfa2q8awb2tQazNtIi/gPe22Qz+sRphyA0FFrjHRhGNl6ijS
	K9y3T1PMM6gBYDgQ715SQPjmdy3xfX6GZhfJazqfvP9Z37HHLh16gGZJKdFOQ0hPW0hxDKGKGIw
	08vaCPV6vyBQtSXvqSimc+2+5sUhRX5Xf9iOHBcsRb4+BEJ8JCG2HuzNdEV0T+s19chckF5oqai
	U=
X-Received: by 2002:a17:902:ef50:b0:23f:adc0:8cc2 with SMTP id d9443c01a7336-2462eeabf5amr288499385ad.27.1756367755755;
        Thu, 28 Aug 2025 00:55:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGa/KrLOg+padB8zxItZz6ZlcodozcmFOglriMBwzOlyMkNQFA4/ZG4ySDSBCvPSPQbqLiWlA==
X-Received: by 2002:a17:902:ef50:b0:23f:adc0:8cc2 with SMTP id d9443c01a7336-2462eeabf5amr288499075ad.27.1756367755229;
        Thu, 28 Aug 2025 00:55:55 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-248a0238408sm35472495ad.118.2025.08.28.00.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 00:55:54 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Thu, 28 Aug 2025 13:25:31 +0530
Subject: [PATCH] arm64: dts: qcom: ipq5424: Add support for emergency
 download mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-ipq5424-edl-v1-1-d6a403800023@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHQLsGgC/02OQW7DIBBFr2LNuiMRDAT7KlVUDTC0SLVxGGq1i
 nL3usmmy/el//RuINwKC8zDDRrvRUpdDzi9DBA/aH1nLOlg0Epb5bXHsl2t0QY5faKPXjvSlKf
 JwfHYGufy/bC9Xp7c+Pp1SPtzhEDCGOuylD4PPiY75mAUjcrYs8vkXaDJ2/zHyUZrgyIe4X/MP
 DxSzmpCagtuEgvKj3Re3hoLd407r6k2bBxq7YLGRa+UMZRjnveTgcv9/gu6V+V09wAAAA==
X-Change-ID: 20250828-ipq5424-edl-8c826a2af996
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756367751; l=2558;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=0H4B6/wnQyWhKc04n8w05M9ADN7Eyb8jMn+ZmbV/gtQ=;
 b=5b8q6LZgiwQ2P+RhxRAHanaVk6I/Bs7cE1KA9CvzQqkiDYCCOx7MFmrNiSfKwYoe0QVDQhKm2
 rNDFSOKU6/ICBDqoev/w7LqrNi2enBxgmHnq9hZZ1Fev/+lnp1IyOfT
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: ft5yreuIUNlPruXxy_4JHPkWRz1ejV12
X-Proofpoint-ORIG-GUID: ft5yreuIUNlPruXxy_4JHPkWRz1ejV12
X-Authority-Analysis: v=2.4 cv=Hd8UTjE8 c=1 sm=1 tr=0 ts=68b00b8d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=cPK0JmkEVUuaBPUXAAcA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI1MDE0MiBTYWx0ZWRfX9Eh1iFqE/nbt
 7a8JqVhIOGUg7YznPvD2KEWBj8WnxxTBAfZBrBa6ZXdbhDhSSWcYQTYhv3+GjWZFsR9pnJyrYSe
 nA2slzQJzJUcdx2puiMY6X6d/EtbuPLxGj07rdM04BPI7NupLixAi5IfKSobXVGFhqF2S45enFl
 apvCaDwe4Eea6m/o0thLLx1MwlxwbbO2s2IAT6gVtLHrvvnbZaNfIfApbN1P6Sp49dC7RxdsSGz
 Xe9ncO3khfyJdGtvHq81ed45+KdTrjH9NeIqzVd25vF8LKZGFRvqOyllbnXZEGzoPEe/XngpAYI
 1+s14GIrRdsSfKyfk41e0JCMf5QpzLy3WXS7iVi+jYIwxl70jDEEyNr4/+aa4Zq4H7f8yLFHWi1
 qPL1mrkI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508250142

Enable support for the vendor-specific SYSTEM_RESET2 reset in PSCI reboot
modes. Using "edl" as the reboot mode will reboot the device into emergency
download mode, allowing image loading via the USB interface at the Primary
Boot Loader (PBL) stage.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Depends-on:
https://lore.kernel.org/linux-arm-msm/20250815-arm-psci-system_reset2-vendor-reboots-v14-10-37d29f59ac9a@oss.qualcomm.com/
---
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 6 ++++++
 arch/arm64/boot/dts/qcom/ipq5424.dtsi       | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
index 738618551203b9fb58ee3d6f7b7a46b38eea4bf4..b47b0be41a61438c922b1e29d9a2ebc37fca2d70 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
@@ -108,6 +108,12 @@ &pcie3_phy {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
+		mode-edl = <0 0x1>;
+	};
+};
+
 &qusb_phy_0 {
 	vdd-supply = <&vreg_misc_0p925>;
 	vdda-pll-supply = <&vreg_misc_1p8>;
diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 67877fbbdf3a0dcb587e696ed4241f1075000366..8f2ee755d2cc406374faf9e76b0d409d159a7b12 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -184,7 +184,7 @@ pmu-dsu {
 		cpus = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 	};

---
base-commit: 8cd53fb40a304576fa86ba985f3045d5c55b0ae3
change-id: 20250828-ipq5424-edl-8c826a2af996
prerequisite-change-id: 20250709-arm-psci-system_reset2-vendor-reboots-46c80044afcf:v14
prerequisite-patch-id: 38f76a48b6b824f3fa8d8cbc05ae76b43ce79556
prerequisite-patch-id: ae7ae183210708f64fb3ff4f097de3c8af31680a
prerequisite-patch-id: 5ba323084ac74aa744696b54ff0c17d34e26b7de
prerequisite-patch-id: 3a2cedabc1bff24067dc224b2c077373c08b39a0
prerequisite-patch-id: e30b97929026120277585907cde2dc000a25a621
prerequisite-patch-id: e3ff400e6c72e835612b733b5573b01b045e7336
prerequisite-patch-id: 50e081a2a21166aee74af428934bc3b52d3cf43b
prerequisite-patch-id: a0148031385883a309dc165fac299d3eb5d4bcd4
prerequisite-patch-id: 3c0f5c0e93261f6dab1d9e7293a1a28ef64e2a66
prerequisite-patch-id: bb68380b11f9e868eacb0db9f97cc5f3ae8aa29a

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


