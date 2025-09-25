Return-Path: <linux-arm-msm+bounces-74924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A199B9D95A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:29:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CF07D4E04C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 06:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF83E2E7F3C;
	Thu, 25 Sep 2025 06:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UidNiLz7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE852A1CA
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758781742; cv=none; b=mtZSnKvNd1liBWXx097chfKoOZgwfhX2l/bpsKGqatg1jgT+xT3GaledjItcovpuJn3vk5LgLwr1TxfScTH5M9DkGomsHjSH+LKN7p78/qrEA9Di2Kg4RWYUR8oO7IyNT38mjuiwD56L6/kvsrdqftDNo0yxAeBcyPKk+mZ3eL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758781742; c=relaxed/simple;
	bh=g002zII8ryIrM+gjeb8Vgoy0X1d4D0aOjVNavadHVoM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=E2AIiHo8LwkBPNKQkDoinMklTYbc88wT0X7NQLEOTi+3G5YOOFKryi2Nnl4FEw2iZ4rJbDTZyALGreMXzXXBklGdIz4Rz1+/Puq6g0NLrUQGiCYwt8PWLcUvrvA9g0hIqzwZ44Ftvvm8bTTgp96mRzMtONCyVjHr8Fflh9ux3QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UidNiLz7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P03Gqp024230
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:29:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cNt1TLcS4m9izDRmZoXK5g
	6RHmlF1d2NYo/LqKY52K8=; b=UidNiLz71PLoSA6hut78ymnOYNV3/9bLHprEK9
	05d0gniaRKLuAknceCneFciGe/jGes92uMK4/gpKpkp4HhD30D3Xw6FNkSQDTiYr
	qnaTCEjnaaDxbV+086+bQWOYHnaWm8w8069Op/xsj8CdOc9mKpmudihzeewLoY+x
	LySEDp3QgED+sPvizFTpzc0urBBEdJTY76RJ5PXQG2wvwVPN9G0g/c4O54iF6eWD
	gt+9l15HtxwFdy6UpdNbuOvQt3Ldr9D0/BuzjQe/ruFsquzYTNk+2NfUwgOdRFUE
	HTRJcbmuQFhupbpU9eqP0sKAh9VBPZRsuBY88zH79wf9HS6A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bwp0e1sa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:28:59 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-78105c10afdso250706b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:28:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758781738; x=1759386538;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cNt1TLcS4m9izDRmZoXK5g6RHmlF1d2NYo/LqKY52K8=;
        b=TJzHbMdDwih4yaEPT8A6nIGNj/56a/6ltR0mevuwRyvINik+Z6dRaqi8+kheHOy9Hx
         bBLS24N4kOIKgdUWdZw55YNvM7bwhjgbe+dMBbmXCAJDNQqxfO6QU/DetgnaLsmD1lYq
         ruL0BI53kVD2Xh4mcgImc/s47Txx8ZMEBY6taGI2WNgqHl/dgJps1YuNDF8YVVD5Z/p6
         qPagRVn8XAsfOaWNwze7dDzRVIHgnXF/f7msQhhisYmRAwRhWyDEPkUVKI24Oz/YBprw
         ApEP/gPX0yEswey22/qHsz9R4+5kdmmQD/4SaOUkXB8D+OKvkHuA3T6d63G1/sMq4TJX
         tX0A==
X-Gm-Message-State: AOJu0YxjYcYe0VZcLwDXEffsiHLq1U7KYSnIzTJLGWdIe78tvzHcxBIS
	GpGrgmU0rY9A2TPSX2Eb9nHHjCDnHJWSJt1twsmcenaxlonOmlQxxIy0grQeMHL019xSMjxFLLE
	KKXNFlEymrk8+rxn/T4FoRyweLRNmKknwKIpHWW1nueLmLC7QH4zIaPgzNoumHiTD4Fb0
X-Gm-Gg: ASbGncv1vw0P0p8+YMinuU4YcbkEPEOLZpDBpArEtWO4FPFpKslCJS4m+ICJWVq/PX1
	N+/RB5GNxw68BfBxbpsT2PYK0u2A0FvHPzFb38Kse8GQANHPO/W/6j8v6GJxYJH3Ql1IOozpuum
	vpOTcJq/79K9CZjn9JNbs4wb3agGwCUpzEHqs7nonFFjRYgYIBUGxgzYg7jyhw2Z1Fb+zq0suzf
	4J8H5C7CmZSXbY+kw8rexcAJP63HFKPTOkj0K/TWMZ5EWZA9avXqWLnwKQS48Mb1Zq72uwXUOxZ
	479LztbguhPi2asJLhBJcXzWE4iItYEPUPFyADmYVIenNyxi5S4xRJxe9p2/uigq92jVuLNe+In
	qxEq0Isux616k4WSodHrYLus4ajgGqB5tj+4XP0osUI/xLQolO6vw46dj5I3J
X-Received: by 2002:a05:6a00:26ed:b0:781:2ba:ef14 with SMTP id d2e1a72fcca58-78102baf1e4mr1158891b3a.25.1758781738296;
        Wed, 24 Sep 2025 23:28:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmc1lRrjF0GX0FTZdvEgtpnM0X8A7pOVQS499wn8lg+ECAN7T4zpvZzryputV6ldQneFagzA==
X-Received: by 2002:a05:6a00:26ed:b0:781:2ba:ef14 with SMTP id d2e1a72fcca58-78102baf1e4mr1158860b3a.25.1758781737768;
        Wed, 24 Sep 2025 23:28:57 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810239136dsm952962b3a.5.2025.09.24.23.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 23:28:57 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Subject: [PATCH v2 00/24] arm64: dts: qcom: Introduce Glymur SoC dtsi and
 Glymur CRD dts
Date: Thu, 25 Sep 2025 11:58:06 +0530
Message-Id: <20250925-v3_glymur_introduction-v2-0-8e1533a58d2d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPfg1GgC/3WNwQqDMBBEf6XsuRGzaaztqf9RRELc6oKaNtFQE
 f+9qdBjLwNvYN6sEMgzBbgeVvAUObAbE+DxALYzY0uCm8SAOer8gkpEVbf9Msy+5nHyrpntlCa
 CEA0pWxalQUjjp6cHv3fxvUrccZicX/afKL/tT6n/KaMUudAnqUyppTzb4uZCyF6z6a0bhiwFV
 Nu2fQA54EouwwAAAA==
X-Change-ID: 20250923-v3_glymur_introduction-e22ae3c868a2
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <taniya.das@qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=KNxaDEFo c=1 sm=1 tr=0 ts=68d4e12b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=qC_FGOx9AAAA:8 a=9ajADY_X5n7qQr6QzggA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: ABgmAxsfH5dncmLucXJOtUZduqzYyXga
X-Proofpoint-ORIG-GUID: ABgmAxsfH5dncmLucXJOtUZduqzYyXga
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDEzOCBTYWx0ZWRfXyN0a/006sfer
 L8BIzLxw/QGY7MJxxgqBfpbBePEd4t7xGFK0OYkfg3u4f3xKvMu2DurlLU9S7zpKZIILiAw3iAe
 KJNyi6SpKMfuEMv7Uov7hlKJ7r1NjoFSzCFEHqCfs/wGhJhiCFRyBc6509Y3xs5ZoCQ10tDa1bW
 Bs23MyTgIdvgp3HMLTcMLCn0bUMgiKadqkVbpkTXF2c/uDw939qqWuT8Wztu2/fDIxiW1eprwTf
 eFC+YrCHWq+mlfK6VrePMyDQOvrIAIYYvnLsWI6iud5Srq5e5XleRCWpKSbB2TWFEzvQHKNW2qy
 pjBjhDAfMrYev2OIvZjJ1CWhFtNdnFHIu7E2y3c6QRgqutrJMKtJdMiDaA31SPjHj02ZeWW8soA
 2vaIKvNm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230138

Introduce dt-bindings and initial device tree support for Glymur, 
Qualcomm's next-generation compute SoC and it's associated 
Compute Reference Device (CRD) platform.

https://www.qualcomm.com/products/mobile/snapdragon/laptops-and-tablets/snapdragon-x2-elite
https://www.qualcomm.com/news/releases/2025/09/new-snapdragon-x2-elite-extreme-and-snapdragon-x2-elite-are-the-

The base support enables booting to shell with rootfs on NVMe,
demonstrating functionality for PCIe and NVMe subsystems.
DCVS is also enabled, allowing dynamic frequency scaling for the CPUs.
TSENS (Thermal Sensors) enabled for monitoring SoC temperature and
thermal management. The platform is capable of booting kernel at EL2
with kvm-unit tests performed on it for sanity.

Features enabled in this patchset:
1. DCVS: CPU DCVS with scmi perf protocol
2. PCIe controller and PCIe PHY
3. NVMe storage support
4. Clocks and reset controllers - GCC, TCSRCC, DISPCC, RPMHCC
5. Interrupt controller
6. TLMM (Top-Level Mode Multiplexer)
7. QUP Block
8. Reserved memory regions
9. PMIC support with regulators
10. CPU Power Domains
11. TSENS (Thermal Sensors)
12. Remoteproc - SOCCP, ADSP and CDSP
13. RPMH Regulators
14. USB 

Dependencies:

dt-bindings:
1. https://lore.kernel.org/all/20250918140249.2497794-1-pankaj.patil@oss.qualcomm.com/
2. https://lore.kernel.org/all/20250918141738.2524269-1-pankaj.patil@oss.qualcomm.com/
3. https://lore.kernel.org/all/20250919133439.965595-1-pankaj.patil@oss.qualcomm.com/
4. https://lore.kernel.org/all/20250919140952.1057737-1-pankaj.patil@oss.qualcomm.com/
5. https://lore.kernel.org/all/20250919141440.1068770-1-pankaj.patil@oss.qualcomm.com/
6. https://lore.kernel.org/all/20250919142325.1090059-1-pankaj.patil@oss.qualcomm.com/
7. https://lore.kernel.org/all/20250920113052.151370-1-pankaj.patil@oss.qualcomm.com/
8. https://lore.kernel.org/all/20250924-knp-pmic-binding-v1-1-b9cce48b8460@oss.qualcomm.com/
9. https://lore.kernel.org/linux-arm-msm/20250924183726.509202-1-sibi.sankar@oss.qualcomm.com/T/#m46501fe9edb880fc11f69442eaf4d2855f7e4608
10. https://lore.kernel.org/linux-arm-msm/20250925002034.856692-1-sibi.sankar@oss.qualcomm.com/
11. https://lore.kernel.org/linux-arm-msm/20250924144831.336367-1-sibi.sankar@oss.qualcomm.com/

rpmh-regulators:
1. https://lore.kernel.org/all/20250918-glymur-rpmh-regulator-driver-v3-0-184c09678be3@oss.qualcomm.com/

PMICs:
1. https://lore.kernel.org/linux-arm-msm/20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com/ (Patch 8-11)

PMIC-Glink:
1. https://lore.kernel.org/all/20250919175025.2988948-1-anjelique.melendez@oss.qualcomm.com/
2. https://lore.kernel.org/all/20250924232631.644234-1-anjelique.melendez@oss.qualcomm.com/

spmi/pinctrl:
1. https://lore.kernel.org/all/20250920-glymur-spmi-v8-gpio-driver-v1-0-23df93b7818a@oss.qualcomm.com/

PCI:
1. https://lore.kernel.org/all/20250903-glymur_pcie5-v4-0-c187c2d9d3bd@oss.qualcomm.com/

Remoteproc:
1. https://lore.kernel.org/all/20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com/
2. https://lore.kernel.org/linux-arm-msm/20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com/T/#t
3. https://lore.kernel.org/linux-arm-msm/20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com/T/#t

USB:
1. https://lore.kernel.org/all/20250925005228.4035927-1-wesley.cheng@oss.qualcomm.com/T/#mb7879fdba16496554a53c3726d90f94b6063dd09

Linux-next based git tree containing all Glymur related patches is available at:
https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/tree/glymur?ref_type=heads

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://lore.kernel.org/r/20250925-v3_glymur_introduction-v1-0-5413a85117c6@oss.qualcomm.com

---
Jyothi Kumar Seerapu (1):
      arm64: dts: qcom: glymur: Add QUPv3 configuration for serial engines

Kamal Wadhwa (10):
      arm64: dts: qcom: glymur-crd: Add RPMH regulator rails
      arm64: dts: qcom: glymur: Add SPMI PMIC arbiter device
      arm64: dts: qcom: Add PMCX0102 pmic dtsi
      arm64: dts: qcom: Add SMB2370 pmic dtsi
      arm64: dts: qcom: Update pmh0104 dtsi for Glymur CRD
      arm64: dts: qcom: Update the pmh0110.dtsi for Glymur
      arm64: dts: qcom: glymur: Add PMICs dtsi for CRD
      arm64: boot: dts: glymur-crd: Add Volume down/up keys support
      arm64: dts: qcom: glymur-crd: Avoid RTC probe failure
      arm64: dts: qcom: glymur: Add PMIC glink node

Manaf Meethalavalappu Pallikunhi (1):
      arm64: dts: qcom: glymur: Enable tsens and thermal zone nodes

Maulik Shah (1):
      arm64: dts: qcom: glymur: Add cpu idle states

Pankaj Patil (3):
      dt-bindings: arm: qcom: Document Glymur SoC and board
      arm64: defconfig: Enable Glymur configs for boot to shell
      arm64: dts: qcom: Introduce Glymur base dtsi and CRD dts

Prudhvi Yarlagadda (1):
      arm64: dts: qcom: glymur: Add support for PCIe5

Qiang Yu (1):
      arm64: dts: qcom: glymur-crd: Add power supply and sideband signal for pcie5

Sibi Sankar (3):
      arm64: dts: qcom: glymur: Enable pdp0 mailbox
      arm64: dts: qcom: glymur: Enable ipcc and aoss nodes
      arm64: dts: qcom: glymur: Add remoteprocs

Taniya Das (2):
      arm64: dts: qcom: glymur: Enable cpu dvfs for CPU scaling
      arm64: dts: qcom: glymur: Add display clock controller device

Wesley Cheng (1):
      arm64: dts: qcom: glymur: Add USB support

 Documentation/devicetree/bindings/arm/qcom.yaml |    5 +
 arch/arm64/boot/dts/qcom/Makefile               |    1 +
 arch/arm64/boot/dts/qcom/glymur-crd.dts         |  795 +++
 arch/arm64/boot/dts/qcom/glymur-pmics.dtsi      |   19 +
 arch/arm64/boot/dts/qcom/glymur.dtsi            | 7445 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmcx0102.dtsi          |  179 +
 arch/arm64/boot/dts/qcom/pmh0104.dtsi           |   84 +
 arch/arm64/boot/dts/qcom/pmh0110.dtsi           |   66 +-
 arch/arm64/boot/dts/qcom/smb2370.dtsi           |   45 +
 arch/arm64/configs/defconfig                    |    6 +
 10 files changed, 8644 insertions(+), 1 deletion(-)
---
base-commit: fdcd2cfdf0db0a8b8299de79302465f790edea27
change-id: 20250923-v3_glymur_introduction-e22ae3c868a2

Best regards,
-- 
Pankaj Patil <pankaj.patil@oss.qualcomm.com>


