Return-Path: <linux-arm-msm+bounces-66435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBCCB1032F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 10:17:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A6AF1889C8D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 08:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78B022749DF;
	Thu, 24 Jul 2025 08:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wr7Ewlk8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA92A2749CE
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 08:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753344961; cv=none; b=YlZYmLmbBdlge+oiLCoWxyN3aruP3CUzyxBpY6qNuSbkILj5hl3EV+Wo0P5I5M6EzcqKtMhd3++CGDCWorkWCqyVWyJhkMp/XYy7Grk+foKIlxaEZVpf9UsuNZi2VJVCOO1QF7ehCmVCH77ZaTedpayJVDjpRbZIejASIdampiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753344961; c=relaxed/simple;
	bh=pPE0dthHBTBntcNT9hyg2AS4PevetqvtiTysAuX6epw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=h17EW8rUfiN2Bc5wtSl6T3pNajg2jQkEe2oOK8seegQ+tqvONpAwV2wFLpBW8g0VpO/Jk8ZuFvEDelZ8MljMqOWK/K83zgOcBqWp/oL2Sutw59zORrWwjDiLFuhX2S9duANuireZBEhi4ahF341tG0LwcC9MfiP9jXRB6yH+cQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wr7Ewlk8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NMXHct028536
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 08:15:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NiT/91ijwaCIS7LiIPcST4
	HlLUuH+EIp+iWbJrHOT5g=; b=Wr7Ewlk8DirsbcU5bfLlfD5ZdxYdkhcG28X5cd
	o19sP+Jo6nnqo8tWB8JcAMIsJ9tuF5McTN0CcGjWIRrTD3LHYU6C6RFfDRX+ZRI0
	R/74bAeGO+BqV1WJvsWsysFkTztHNtjZGy7DP0tbKNwsHWgu55/69AIYszeUp7Jm
	yraWS5vo0tVizFofqRVt64KhWJaCmVIuLN5JmnC6HNM2MeHiyu7E0D936RLeDPEM
	saqQs8RZue4EBIje8S1NfjhS4nepI6QUyANcGKw6evAXA5LVz3FnUz/guXiuif01
	eB7Jb1r93MRHjmCdYpJdWYx2C6yzeFgExcn8sMsEy5icKAtw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4826t1f985-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 08:15:58 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-312df02acf5so2002631a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 01:15:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753344957; x=1753949757;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NiT/91ijwaCIS7LiIPcST4HlLUuH+EIp+iWbJrHOT5g=;
        b=axZnobqAHlVEFMcCsLNj2p9wbb2/CwXjNCPtgqqICl+urGXavGAf5UGvMEaVGgDchh
         kaxzFD9L3Okjooehip5RdIw/Ht9nIOipg7BlAiMEoxMTS5EIFxC3L5ZobcyeuSnZ8CQc
         rG8xJWVwHxm2i7QpMSeM9Ps9UmWH2STqvJInEEUftsZlT3k+NupJx38OFznSDEJJEGzY
         sDaoz/0tyc0JdMz/YRxC4yqIxO3Uk/6nLsf12CEOAY61UmnR1OiZ1HJbMbVyYVvKTbvk
         Zw0vmZGUUCYu4g34eeJkQ6KO6BFP/Ly5HJzEw8tXQSdnPF/ocDn8ElP79d0+6sNX1LI6
         zkuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhQXVrsoAw/xOARzYNkS24HqtU8EkLmK1TjQaM+UIcwgc+lH91D1nGey5NOHBI5LtEOlTEX17BEbBK7Ngy@vger.kernel.org
X-Gm-Message-State: AOJu0YwWTkXk5di3Pqg674inw6nI/uc5HJQnZKueXnVm7D0s0xp5++Te
	WY8SRjwB6FHZ5zU/yD1OWi67MUoBH4Qxr6q0czlMFGJ8QjsYgQzxfp8drIV+AMgCJ5rU1Z2xtIj
	m/TYkXaaDCX7E7PfpJtIgZif8MFjlTILG+ugsfACjtPpzfieSEgY6oEac9EFssYe4pYegaJAp9c
	Fk1IU=
X-Gm-Gg: ASbGncvpxZSvUJQ2/8dbPQqjjOWD3WMhOPqG6edjV89g5hLq/2ysrNB6yVDpHaDPRZF
	1UujojlxRwazCgBIa+eulEDnT+hLcGGC7DSNPzUpw8OL27JYvgh+KN9SpiKIjGf4GUPFb/6bC9n
	5ip7EnZD8yXlzQw1lbzjG6erz+qHB1wxG1i5bJWCKre2HUVKSIk9ki4IvKZgNLbxQPxY3Ytypkg
	s2JjLbt5hogePlksltTg+dfKPZacaRkeA9gev98/mdWJ4bTAn0ahKVMCP4mN2MurZ3DOU5DK7fA
	8yrc2Q5RSXPM1U+dkwMHRW4fQoZfKVZbFXjObYls3Z+esMtTPZDCSooHLxPN3nYVP8RYOR/enV4
	4nb8fPfC48d9hapDYxVKC5Zeqa9s3O8/lwg==
X-Received: by 2002:a17:902:e948:b0:215:6c5f:d142 with SMTP id d9443c01a7336-23fa5d5ec54mr18729675ad.20.1753344956831;
        Thu, 24 Jul 2025 01:15:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0rYQPN7kY4fiz//JYFRHF/cZGa/em+fXLWQb5iFkEEBlK4P/Xyw0TACKiX4Fa1q3XMhJUDw==
X-Received: by 2002:a17:902:e948:b0:215:6c5f:d142 with SMTP id d9443c01a7336-23fa5d5ec54mr18729415ad.20.1753344956389;
        Thu, 24 Jul 2025 01:15:56 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa476eb07sm9770595ad.65.2025.07.24.01.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 01:15:55 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Subject: [PATCH v2 0/4] Initial support for Qualcomm Hamoa IOT EVK board
Date: Thu, 24 Jul 2025 16:15:22 +0800
Message-Id: <20250724-hamoa_initial-v2-0-91b00c882d11@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJvrgWgC/3WQwWrDMBBEf8XoXAVpZUlxTv2PEsLakmtBLCeSI
 1KC/72y3UJw08vCsDNvh32QaIOzkRyKBwk2uegGnwW8FaTp0H9a6kzWBBhIplhJO+wHPDnvRod
 nyhqjmVBGg+YkZy7Btu6+8D6OWdcYLa0D+qabKUv4xxfs9ZbPjat5dTZD37vxUHh7H+lyUnNFZ
 lDn4jiEr6Vn4kti3TO+qZQ4ZRSFNrVUdSnL+n2IcXe94Xmm7/KYC/zCX4Vb1UrD2gq5En/Dc5s
 Ezw22T0mQIWIPqiwNAzT4D0Q8QbjcQkSG6BaqPUpoQFUvINM0fQP86KEhwQEAAA==
X-Change-ID: 20250604-hamoa_initial-0cd7036d7271
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Yijie Yang <yijie.yang@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753344952; l=3734;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=pPE0dthHBTBntcNT9hyg2AS4PevetqvtiTysAuX6epw=;
 b=q/GXc8dKKUJZGF0TNSuLJcXFRs94bn0hTkYdnTPYRmw40hrwclfkkrzKd67yBxivc+Bv8zBgb
 WZWFuoR9fEuARYdtIifbw6D4Ff6Hh9Wb2rMdlST0BOskpxlwi/a0kLa
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-GUID: -GZpFqwSYiEOa02872pI78egnnol4t5e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA1OSBTYWx0ZWRfX5TUynSFw2tnD
 mvSapnFraOL1JcHEj291p+EZle9Z2hPkJFqQTQamyWA8K6ctQX6xnEwqT2BJMAdMdbKFmtrUSKn
 AqXx+c4yhxriDyizJibxiv87CElR5uB4Sg+eGTBhq+dBIsb8Rc3fjB8Jca1fSgmfHBTIpqj8en2
 gIYyJffTLh+MxwB65Dry2XczOOO1qhyS2f5QMQT+j8B80tRNh0+7+Nndi8P7agCy87fHZdx3m7k
 Ahq2SjITXgn+IS0p7Nk6CbAQTcRq/geuZI5fUxMRLNj9nLOzHdE00isCUAcxvX2KKjmgu/qQV46
 HYP+iIXJU8H1JyUcsv9d7ZWseluDW1wTMpKsmBk1c2gnLVO0MNsWy0dWsk9eIWq2w88xXWPvt1/
 3dPzX+vrcAdDWMyR2jSX7RQ75+x6cZpLFJMpWYgTcjbTxzgyp+pTS0hC+pz7dzas8wHG9Fo+
X-Authority-Analysis: v=2.4 cv=E8/Npbdl c=1 sm=1 tr=0 ts=6881ebbe cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=gWuG99rYYzh1ZzfbfFIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: -GZpFqwSYiEOa02872pI78egnnol4t5e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_01,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240059

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
Changes in v2:
- Merge the compatible rules and remove the compatible string map.
- Align the ADSP and CDSP firmware paths with other x1e80100 platforms.
- Remove the regulators on the M.2 card, as well as those managed by UEFI on this board.
- Merge another patch series that enables USB DisplayPort functionality on this platform: https://lore.kernel.org/all/20250723-x1e-evk-dp-v1-1-be76ce53b9b8@quicinc.com/
- Link to v1: https://lore.kernel.org/r/20250716-hamoa_initial-v1-0-f6f5d0f9a163@oss.qualcomm.com

---
Yijie Yang (4):
      dt-bindings: arm: qcom: Document HAMOA-IOT-EVK board
      firmware: qcom: scm: Allow QSEECOM on HAMOA-IOT-EVK
      arm64: dts: qcom: Add HAMOA-IOT-SOM platform
      arm64: dts: qcom: Add base HAMOA-IOT-EVK board

 Documentation/devicetree/bindings/arm/qcom.yaml |   1 +
 arch/arm64/boot/dts/qcom/Makefile               |   1 +
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts      | 915 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi     | 607 ++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                |   1 +
 5 files changed, 1525 insertions(+)
---
base-commit: 4d088c49d1e49e0149aa66908c3e8722af68ed07
change-id: 20250604-hamoa_initial-0cd7036d7271

Best regards,
-- 
Yijie Yang <yijie.yang@oss.qualcomm.com>


