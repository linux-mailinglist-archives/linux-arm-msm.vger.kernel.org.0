Return-Path: <linux-arm-msm+bounces-66946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CE5B145C4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 03:32:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AEC6F3BB55C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 01:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A87A1F237A;
	Tue, 29 Jul 2025 01:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N30+kjKD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553B11EFF8B
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 01:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753752754; cv=none; b=Cd4ZccNnwN9jfFBQASZ7qiHF3OsspJ7mvlQ5n27yfvNN6K+v03o/gA7K2oWi0HfnGXs0u6GMtOgnVJYDJNlkwcdy5Nkzy1JXFcUYpaG1X9iCVj45FzUVRFPYGoQmvq57AWCAcF+WNwAVjcyukudCn6EZSNUaVoexkhpmONI199A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753752754; c=relaxed/simple;
	bh=ncKPmwgSmEr89qgOgzsLItVALxMjxOroQZpEdHihBKo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QT9FZBnvx7GofUfN8X6t77OF0+DepzqvfgfGx3zJrcsOk6bBSFQzPrroekKFhyvYIwyaH7/MinCRaG4UX+7GRRtJQwWx8vddcFL+Ml7n7wQDhoNaj46i45+E8px3pwbqSVCPx4EjxbEsa/hnTpOy5SnZkgzmwEihzpGAVPX7Pqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N30+kjKD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SNBH3t012163
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 01:32:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=d4fNwhrQIrZB7y09qwxo0e
	WZIIVbCmq6JxgS3HYU2M4=; b=N30+kjKDYdkXbmVmga+1kX+T0Jexnf5xkARuaM
	2dyRnogy8l63YSF1N8osmQczNo2eX0F7aPgYZomhzKtaOfGdH4CBN+SZQvsH4nAt
	l7k8KlRTJv0LgNd3tInfS+3D1RCGjoda+Iy3bEHR4UtYDse1q08ccHPwoaaKEXMu
	Rx/dGjvnD8rL0qL2v7ULC69bHyB7znEU8FpQTvZAB9cW9miXO25P+YDHPSQL5oEn
	Q5NRcUqvNKu5p8p5ar/tF4PhkuFvCxaYRnhfzkTboTSoUw0Q5JRrahRjoXuttqaL
	o3vcHbprB1gpIVGJVZ479/qSbSa54YMAWRE7jX09sibf9m/A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qsk6bce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 01:32:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2400499ab2fso13445605ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 18:32:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753752750; x=1754357550;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d4fNwhrQIrZB7y09qwxo0eWZIIVbCmq6JxgS3HYU2M4=;
        b=FutoE2uhSyfA5fON0+KhHSbmoeUcVjxtYx9kmCunGif9qtiQt5Ow57VKcwXlJMasGl
         LYZ9OEV7QjW0QWAVf1EJXDW0j774PqqnDlUzqGOvmNwkzwnBBUY33injH0RkxameZ4Nh
         kX2+Wh1Sdk0bOfj92ubLn74YRNtgO3fwMyIe22IzWH34aIh8i3TTRt/txVBzYAs+lhV7
         pacdWXgU13c+KjQJN1n8JH/1i04BYMubkrmVTVRSlq7jgguKS56j7G2kF1xngVxinXPY
         bMP4RcS8ZmV6feVv3+FDtcq+ZeEX9HkDFDVPIw9IhxQ5i24iDKKzPKiXuVpOpcGDRQpf
         Bp/g==
X-Forwarded-Encrypted: i=1; AJvYcCWRApR6Io+v05K3Nr/RO/p1FBtchCwi5P/jpmdtml81tc5TedRx5ZPm+tAz8tdv3slW8M8jzYr0uOt7smKq@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9N86x3+ymNCJmA4IM94cZjPP6oVb1MZvzZsYta7bszbb1slVM
	3QzmX6zSC4SZztHPMHiLyQx9DlSNeBA4C1pFIXgoHXXaG4sHjwu2v8GTpjisntycHCxci5x8Ws/
	VdrAjb4FRHxFfbPMUIFTsF0T0u1yddMuHVscC4rl2qbKM/3Mj0aGjCP+1rQYGol4/5dWt
X-Gm-Gg: ASbGncuKIgSQZO6SfFS8ZaB1xwHqr3KXz8rgGUvq0tZxV6AAGrMf9gfhNiguPdJKwr1
	S8xu4DmoNdLTbf/rmmgT74blHxVHNz47QZjFNZeXl0pNvIiZQQyzzX9xeaT3L2sZUzhK2sByOpf
	+JP7kU5VMo2xWkZ4coB+ciDnXCe8E3cPCo5OsZgVeANTqv2By5Se19rEAiRC4asdj2PIsEVJPkJ
	MWnWaiWPmS2k+T8MjB5oDlBzwNiP7nhj2kO4DF7YC5cjO4Gi8r2rjWEI91mlUxZlnLihfCOknNq
	jFHLkh4e91NuKXHOzhINDws9Hjll75lVzc5a2gdQcUudl5efJlNHp1ip6vObWfJuW0KTnGeO3qN
	BacWTlRM7oBhDU+QveomL2BqPoEAtaCx3KA==
X-Received: by 2002:a17:903:4b27:b0:23f:dc6f:a53e with SMTP id d9443c01a7336-23fdc6fa7c1mr116142615ad.6.1753752750234;
        Mon, 28 Jul 2025 18:32:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwu0N7vgBpFskMOYwhIRitMVLgQ3ZTwvf1sccT27bStJNJbm1fJzO6X0iYxbATcu+xLi6M9A==
X-Received: by 2002:a17:903:4b27:b0:23f:dc6f:a53e with SMTP id d9443c01a7336-23fdc6fa7c1mr116142225ad.6.1753752749715;
        Mon, 28 Jul 2025 18:32:29 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2405bca90ebsm11210625ad.6.2025.07.28.18.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 18:32:29 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Subject: [PATCH v3 0/4] Initial support for Qualcomm Hamoa IOT EVK board
Date: Tue, 29 Jul 2025 09:31:56 +0800
Message-Id: <20250729-hamoa_initial-v3-0-806e092789dc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAI0kiGgC/32Q3WqEMBBGX0Vy3SzJxCS6V32PUsrkxxrY1W7iy
 pbFd2/UFhZrexP4yHxnDnMnycfgEzkWdxL9GFLouxzEU0Fsi927p8HlTICBZIqVtMVzj2+hC0P
 AE2XWaSaU06A5yZ2P6JtwW3gvrzkbTJ6aiJ1tZ8pS/p6L/nLN64Z1eJ20/fkchmPR+dtAl5WaK
 zKD2pCGPn4uniNfGus/4xulkVNGUWhnpDKlLM1zn9LhcsXTTD/kZxb4ge+VG9VIx5oauRK/y7P
 NCI8G26OMkCGiAlWWjgE6/McAdss1N4zZqgLH+R8G4sGAyy1EZIhuoK5QggVV70CmafoC80NKT
 P4BAAA=
X-Change-ID: 20250604-hamoa_initial-0cd7036d7271
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Yijie Yang <yijie.yang@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753752745; l=3532;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=ncKPmwgSmEr89qgOgzsLItVALxMjxOroQZpEdHihBKo=;
 b=l+TZS86j+lrsMpggbR5bxXljDFx8P/U8Rptng5KmY6yuT2wjiTZjQn7VbD+BO8pjHyi+0j0yZ
 FTGbY8f6GlgBQDvouOfAljpW9XShtInm+GTeM6u6ofr7w11O7a4WapN
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Authority-Analysis: v=2.4 cv=KdDSsRYD c=1 sm=1 tr=0 ts=688824af cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=YFZS1bbaIU900xy4DYIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: ID8oGQT1q8emic9-6FrmDkdSb-RnMHGq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDAwOCBTYWx0ZWRfX/nE82s1RBcRf
 RvGgwSpUZzN08eSplXXNnwDuC7YPXadtFDkjkH0tIuDC6f7kFR3BF8aBcCNpqZfN/PRrWM5tsul
 pwXXbkn/vA7gHk+6MEBDR+vEjWeLc5Ftddum6zajs28lcvMgaCgs/cuF9njYreFwzUmgzgZpp2a
 mdAiLhLzI5+Vfj8WPvIL+JVkaYHuFH2DvbIbADyL4hLFV/vodAX9Y16xoy7kPOJe7X5OWwWyVsi
 tjt7U9Kf52JDD5Q02oO/zlY5UZ/x/s8VzzfSD9jYltym8ODBYzF4Q56UyVzYn/3dlogBaHnmXgg
 kB4GegeC9PTnDl5JCb9TZf/IXUpRfPcXiutLYySaJmzjrkDiY4R1y2+eSmeOBFYtJ79O6YidL/E
 Iu6KUWYW1FGiskf0nhETkWvUpvYEiQS6a2mhoofqOsfYzMFLeMnxMh7wJRQLYsNO3YhK7PpV
X-Proofpoint-ORIG-GUID: ID8oGQT1q8emic9-6FrmDkdSb-RnMHGq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_05,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 mlxscore=0 spamscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507290008

Introduce the device tree, DT bindings, and driver modifications required
to bring up the HAMOA-IOT-EVK evaluation board—based on the X1E80100 SoC—to
a UART shell.
This patch set focuses on two key hardware components: the HAMOA-IOT-SOM
and the HAMOA-IOT-EVK carrier board.
The HAMOA-IOT-SOM is a compact System on Module that integrates the SoC,
GPIOs, and PMICs. It is designed to be modular and can be paired with
various carrier boards to support different use cases.
The HAMOA-IOT-EVK is one such carrier board, designed for IoT scenarios.
It provides essential peripherals such as UART, on-board PMICs, and
USB-related components.
Together, these components form a flexible and scalable platform, and this
patch set enables their initial bring-up through proper device tree
configuration and driver support.

Qualcomm SoCs often have multiple product variants, each identified by a
different SoC ID. For instance, the x1e80100 SoC has closely related
variants such as x1e78100 and x1e001de. This diversity in SoC identifiers
can lead to confusion and unnecessary maintenance complexity in the device
tree and related subsystems.
To address this, code names offer a more consistent and project-agnostic
way to represent SoC families. They tend to remain stable across
development efforts.
This patch series introduces "hamoa" as the codename for the x1e80100 SoC.
Going forward, all x1e80100-related variants—including x1e81000 and others
in the same family—will be represented under the "hamoa" designation in the
device tree.
This improves readability, streamlines future maintenance, and aligns with
common naming practices across Qualcomm-based platforms. 

Features added and enabled:
- UART
- On-board regulators
- Regulators on the SOM
- PMIC GLINK
- USB0 through USB6 and their PHYs
- Embedded USB (eUSB) repeaters
- USB Type-C mux
- PCIe6a and its PHY
- PCIe4 and its PHY
- Reserved memory regions
- Pinctrl
- NVMe
- ADSP, CDSP
- WLAN, Bluetooth (M.2 interface)
- USB DisplayPort

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Changes in v3:
- Add compatible string and dt-bindings for SOM.
- Restore PMU-related regulators to comply with dt-binding rules and enable kernel-level power management.
- Adjust commit description accordingly.
- Link to v2: https://lore.kernel.org/r/20250724-hamoa_initial-v2-0-91b00c882d11@oss.qualcomm.com

---
Yijie Yang (4):
      dt-bindings: arm: qcom: Document HAMOA-IOT-EVK board
      firmware: qcom: scm: Allow QSEECOM on HAMOA-IOT-EVK
      arm64: dts: qcom: Add HAMOA-IOT-SOM platform
      arm64: dts: qcom: Add base HAMOA-IOT-EVK board

 Documentation/devicetree/bindings/arm/qcom.yaml |   6 +
 arch/arm64/boot/dts/qcom/Makefile               |   1 +
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts      | 992 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi     | 609 +++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                |   1 +
 5 files changed, 1609 insertions(+)
---
base-commit: 4d088c49d1e49e0149aa66908c3e8722af68ed07
change-id: 20250604-hamoa_initial-0cd7036d7271

Best regards,
-- 
Yijie Yang <yijie.yang@oss.qualcomm.com>


