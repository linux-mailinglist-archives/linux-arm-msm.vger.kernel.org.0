Return-Path: <linux-arm-msm+bounces-65182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AA0B07145
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 11:11:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97D15506D6A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 09:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42D1C2F237C;
	Wed, 16 Jul 2025 09:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lR7qYW7/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839DC2F2362
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 09:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752656968; cv=none; b=rHC1eQ4NqKy9Wt8Af5yj8y+w8gajR4HV4Xh+9P1MIyJh9V/SRl0+PmUp9tz2sUNrKp78nmmnMIJIbiciBQ9aiRPgeCVh70VIU/0M+w4aQibBHTuGd5ME2OzkRjf7YOQNptUCS/2ZEY8LmAem6j8mfmchyA89DVVsjoD3WGoGvBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752656968; c=relaxed/simple;
	bh=E2yE+9Nv7BLKm6qUe/2mO7codsrDcFi+y6F6O46xBrc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sPopxz2lUgp+oj85NCAqKaWahmW+XIfmieKljGqivC2jsg7AdfM2Da8XYG+7e0GCyysPRfi9f7Tx7hPKim6hH1xV6z8WH9ejwidCa925g5rpzOrpxMzT0j12ddbIqs3Ug1sS89j07GZXOCHi3UAJbwMZ6QNGNU66Earcl3c8nH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lR7qYW7/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G5o1RN003442
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 09:09:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Inqvtfl9OShg17aGwZeZQy
	+EahwDz4RdL7DIjDaQJoM=; b=lR7qYW7/oKk8/HGDLhr95L1nSN4DL5lfWRu4B4
	LseeCb7dSaS7ZTOFeCT4JGylHsovAQVKVvb198YKK8dcSjp9To7UZ4JLphx2KPaH
	NMY/nb/sb3sSsV9Sq8rYDV423Ax8QO70qury+fReDNNh4taPAnHO7k6oKKrR7C11
	DgygRP8z/+DYs2SV6Gu0rtcBRAD3DwPIDFa7eGn1SSe7Q1uF9nRfA2IqcANDs7tG
	XaMjqc6x6qYYTZNgoJC3gQnSEjvEfNPWnL4e6k/qS6pEDKjRP7OZwXEZT9rOi0P2
	0j362cSI1p7/hi7MQyzH4LJliciPYVGpu0vryvsE96xjbCSg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5drp6ef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 09:09:19 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b34abbcdcf3so4755142a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 02:09:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752656958; x=1753261758;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Inqvtfl9OShg17aGwZeZQy+EahwDz4RdL7DIjDaQJoM=;
        b=ZC75Vnpy9lCLzln1IxOJoKZ7t+xMD7qfxA8D4VkJMVPahFw050qz+eoBJFZ2DwXa5c
         IxSF6ifOFRaLDP7idnilrPLloYrgGM9JKzwIcJyJ6C+Qa5JDuo6GxVVhtG+sObER4Ffz
         t85D+FqoOFcaGrS/+I6+fszxlwAYWqeq06vqi8VWHulbeUJD1gSkfqcuS06WIknUyqhq
         TZDlQG50FjAgQJbTgbrEA/s4O+CKkDfVaevqfxbIrKI0KmZcMjj2dWJa+vrhe61d66+q
         sGrXAXYvgSVmrkBIFh/DVgvY8YY4/gy2manOOg9DzquHqoNpHCI+Rv1OJQZeK6QcBz1H
         JzGw==
X-Forwarded-Encrypted: i=1; AJvYcCW5CVrGvqLsW2SfTQ8uUJhjqCZCfPIme79tBa9RnhPIdNb/dB+B3Zl3F4DVm1pdFBxKbzWRgOfNfd139bd6@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/rDKSbJM1FoDedf/NAHf3M9U/BsWVXTfB/nqoMiaTAg5wOvaE
	hUDuc+wcjQBUInReTeqGpQH6JsCGCPyVnDveOjFOaBp9iUx0ar9XH6VDB8bB1Voblktxi9b6fV0
	GaeCuFxqS0IavvZgw2W8HFXeQe/+K7SRK4nAdh3/0Q3wEjNJ1lpB3Jn3bwugSm/78YUpwbUdoHV
	lN
X-Gm-Gg: ASbGnct6Dp/zDYjWCUWWiO6bMwbMpgY1VUaI7BF+fG7Mvf8kf+ni0/9rmFf+ac8FROh
	dzlvPiX+Z9gep3NxyqA1hfeM538NX7funEzjRs3aqjufwfkLDGZibXl4SaYRz+9/x//kSK3UCev
	5P0Zo2u8C6y5Gv9MNZ5A2RqfhT6Oyn71xrJIKvwrqJnIEDdxe9Go1745qUDAdqYAxG/DjofCQbZ
	zpEmUsEbDZ5NLrzg/DeJAdpOM+eefbkgKdP6jAdfW7j2b3CAw49XKQp2uwAJTXjVxFhYg9qn+Gu
	pQT9Mu4XRa+EWm19E0a+Mnpy71g0jl8qukBb0BAlHroaVWimsRgpOi3H5XaLLe907yxUKdDXkdM
	fClSs52tJwjzK6bNP6ZlGs8J5Gwhi7gbohw==
X-Received: by 2002:a05:6a21:6f06:b0:234:86ce:9de1 with SMTP id adf61e73a8af0-237d5a04ad2mr3750678637.17.1752656958544;
        Wed, 16 Jul 2025 02:09:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEx99Cveh+s5nC7YY3FmH/g8Q2nSuMinm7HmdUGIH9MouHAPNWahDybpUmzqAHA6j/q+j6o0w==
X-Received: by 2002:a05:6a21:6f06:b0:234:86ce:9de1 with SMTP id adf61e73a8af0-237d5a04ad2mr3750643637.17.1752656958129;
        Wed, 16 Jul 2025 02:09:18 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd6022sm13926375b3a.8.2025.07.16.02.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 02:09:17 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Subject: [PATCH 0/4] Initial support for Qualcomm Hamoa IOT EVK board
Date: Wed, 16 Jul 2025 17:08:38 +0800
Message-Id: <20250716-hamoa_initial-v1-0-f6f5d0f9a163@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABlsd2gC/3XP22rDMAwG4FcJvp6LD0nc9mrvMUqRD10Ejd3aq
 ekoefc57gYlbDcGYf2fpAdJLqJLZN88SHQZEwZfCv7WEDOA/3QUbamJYKJjPWvpAGOAI3qcEM6
 UGauY7K0SipOSuUR3wnv1Pg6l1pAc1RG8GRalhn/6orveyrjp2fzsNGEccdo33t0nWkcqxskCD
 ZimEL/qnpnXxO//aqXMKaMgldVdr9uu1e8hpc31BudF35Snglm8Iuu7siiI3Iq+bS0TYOEfRL4
 gvFsjsiDqJHZb6IQR/e4PZJ7nb0mUXM2EAQAA
X-Change-ID: 20250604-hamoa_initial-0cd7036d7271
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Yijie Yang <yijie.yang@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752656952; l=3210;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=E2yE+9Nv7BLKm6qUe/2mO7codsrDcFi+y6F6O46xBrc=;
 b=U4H7BSyiUGJquC92P5NAO/glGvs2iYuQVX+/UZIw/K7PnleVr9rRVxxD7SKUuvvlrS6R/T+16
 IYArvaWHmBLB6acJ4VhnkkGtjhzl6qkkK1Oq02LfbttbGc+QuaTOjaW
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-ORIG-GUID: u48l0aI5mnVC4rl-IEE6Kts-TD67Hxp-
X-Authority-Analysis: v=2.4 cv=D4xHKuRj c=1 sm=1 tr=0 ts=68776c3f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=gWuG99rYYzh1ZzfbfFIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: u48l0aI5mnVC4rl-IEE6Kts-TD67Hxp-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDA4MSBTYWx0ZWRfX16d3OqfpXVr3
 FYdA7XwoD7hQOBetLhiLwTwxjbH9BJXJcPGmW0iVnGCqRUDk+7gOwgw1apGMDFRWWoND6EtALoy
 L+szZ+94XuPeaiCcU4RFWVaCg3rnzuJosygd2eJRErPWeujreVAww8j4MzvckkC3uhH3i0DtnyZ
 4Z848jbdlmD9AqjpJEmymwZszFhJh254BbN/RGssnKB8yj3xTusIs2mumI9U3/eLhujdRPZNgq/
 PN2swieBBB0/xezj9XVrcXuPhjmDupHztuPmxtFvCehE8uOfRfPJpMO2ZzLhjMdDVdVqRyyGrFG
 VrZhMeTMMXp3JeO0EC/NWctfMJiCJQbcE9Y2p6nfOo861v3q5M3L/UFOelGQBAChm/Ap763ivNt
 hyErUV8OeIHkeBC/iogyKJVWPUXQWGwPbh7o6Qr+CJHovLOJDs4EeUorlC8wTqXINp2wxenn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160081

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
Yijie Yang (4):
      dt-bindings: arm: qcom: Document HAMOA-IOT-EVK board
      firmware: qcom: scm: Allow QSEECOM on HAMOA-IOT-EVK
      arm64: dts: qcom: Add HAMOA-IOT-SOM platform
      arm64: dts: qcom: Add base HAMOA-IOT-EVK board

 Documentation/devicetree/bindings/arm/qcom.yaml |   9 +-
 arch/arm64/boot/dts/qcom/Makefile               |   1 +
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts      | 835 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi     | 607 +++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                |   1 +
 5 files changed, 1451 insertions(+), 2 deletions(-)
---
base-commit: bf66a1ba8e378d23fde984df2034d909215f5150
change-id: 20250604-hamoa_initial-0cd7036d7271

Best regards,
-- 
Yijie Yang <yijie.yang@oss.qualcomm.com>


