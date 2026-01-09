Return-Path: <linux-arm-msm+bounces-88203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AF9D07AB5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 09:00:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E86003036C94
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 08:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62DAB2F9985;
	Fri,  9 Jan 2026 08:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tg5Jkn34";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UEAynr56"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A59F2F6590
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 08:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767945604; cv=none; b=A3igb0FwW2KUwDd6OWZeOzBksN2/xtpqaSNkIa5mZvrFSJStX/bdzC8aKZ5mxbP+NLsBnbTISn3p6pY3ZGeaztokAKgU3+Y4jb+BMgyYwEj7kYKkhABNd8Vf9NMdYMxvHFdnNEYrOZ+yZCffsLzWwsftnvd7O10f1iRwu6NMICk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767945604; c=relaxed/simple;
	bh=TNMwj0w5Q5SfwPHpyUxl640AxQh8MESbcA/FXNdIwI8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=uFc3LVL8CfVgm1UiOE7Ye27KDQZYxfb4paOPFqaDacU++0qHkczT7LIm9SwlevN7Jj+Iy4bKz2wSAARliXtVWJ4LaqkwCRrf18MCGc6YlZym0voPGfReVTvjPpec8Xi0OARuzf5ZaCZIPTwXna655MDbE2CY699xk/97mOMtQXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tg5Jkn34; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UEAynr56; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6094vk3g409484
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 08:00:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OCALrOCtTbJnG9HYOckAkG
	2t/IwFExzqSTmJr8CdjC0=; b=Tg5Jkn34N0m+R+8krFdOGLOke8v8IKysqPqM35
	mlVjN1As4Q2eaw0JNnivmOxLRIZcEiUv3WHrR4YqVtOl2o60PsgOrpzeoWggQRav
	nZEScfNLcDpph7gzwgRtTIxphBdixRUr95gVWEJPej0VjZxuV0CX/8KLjhmwBh7x
	oAFl6gYviZHnAb4S7O0Ayiduc2/pmPk741nYeAimuj0yqC5KFP9X06QuWvihVY+I
	Z0zVLAOApC+7KWQo5ZixPV/X9q8s/UpS4ndCK2wQpayw37GDA1yb/YbHORoH2csh
	vQkYs2JPV4DbiP3Wl699+7XTMAEsnUt1R0yn783nopgt0fEg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjb39ue4a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 08:00:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f13989cd3so92849895ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 00:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767945601; x=1768550401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OCALrOCtTbJnG9HYOckAkG2t/IwFExzqSTmJr8CdjC0=;
        b=UEAynr56ShTIYhsaVw87bNG6xPpsBNfZuTMMCfb6hg6mT+a+eSUZPx+wGXgtoJFH3S
         UCU1Vcshp+lPgWdB58WYuP/WzTuPRuV9yUL/AldOIp9+Uf0dRPVEefX64KTg9jd5Y7uS
         xuvjFNHhBc2j2GkJsU5dYFsmMeI3SSu2iIIYEVvboWUwIkots1Izdm1IiJsBmCaeTcQX
         0py/Z4JqCRLSqNn7rYE7HOhby/An9BjunsRCjb2LxI96rUQCNPbpewT4G+LxXfjjYElF
         KFgpRRrVbhIAed7+3tOb8nGitEiX8bD91HDz1+NG3WvciCZJg5wdjKUScbFsAJ1DiRgZ
         nncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767945601; x=1768550401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OCALrOCtTbJnG9HYOckAkG2t/IwFExzqSTmJr8CdjC0=;
        b=lUkQN/HCPf4JNbDKTCmzLHLoVPwVH1/ATm9EqkYVqIgC+675P8B1b1svAYG72C5Gvx
         0ZT1KD5oaslbolbK67frSLqcW/Lrk4hZ5JJy3UkhLNXdEFMaFiebWtE0Xke1vcreR5mB
         Hyc4p8ZiZVAP8ND/G743CvbI7zN8rVI49i6LTdT9mrcFcdNvjUhLUkSYWhddDA3dT92A
         yLWyRIFYncv3CO3ENpSBk6jxi0P2FvY6jarFNAx3b2ke9BRfnQ5yT2EYAcJFJKKCPYWn
         05HEvYF4IkvKclPX9tLC1bwi9B1XsXLQxB5+Vm9QTR+seAoGkgDSvYnQBCe09Fx8M8+C
         kPLg==
X-Gm-Message-State: AOJu0YyyETPJRysBJSgVlJ85oLXUypDpSqnoEB94ajpZE0tzvOPphnV7
	C6zjTxlyhN6b/NoRGVNMsOHf3b2PmOKa4C//k/aF0Ft4n834yZzVNJ8khfTf9l+RJ2SMM+shYmj
	JP84oE7oUVcy6kGihQ1EOaulkUAu6FBprhiaDHcogexSVWq/fnggdbgvLa5HUliMocXEW
X-Gm-Gg: AY/fxX54HwZrjKKxJbUVRDOP5TzXdhZZBIcT90IEWxoKNhBsCbhNZfJdcJMhGZED8e7
	Ig486tIwLdzmS2+Shxz0uFrqYrFzpmh0EUYiXR7M2XCaFuI2bfvv6MQJIGjCNdmNF6thgchFZel
	5oGk5z+gpWaN5mO3yq1oC5kDpqbTbbu8b1fFuIVQSr4Fa5tIpXfC5+nWvrjCZqez2fI5Ydr6AfJ
	mZAfyXQfoDQYs03A0Jgb1vH0U/NuFdMqRaNacU1L0TSZ4e+lorHOVnfNjhbDHd9x8tMi4+hVdNh
	SOB+VBZ4+ZZdjX7wOxjDl6xQeTGjw0fp+J/U7yP28sbhw4ehSqLsmgZR/0sf0g66yWak7UtN7Uq
	Yle+eQaKcehROhOhWbRcupO6/vXqFl7UFISE9y7Opv3R68IHQlM/Zd+CbB10HW3pmywz/Lphvls
	I=
X-Received: by 2002:a17:902:e552:b0:2a0:de4f:c96 with SMTP id d9443c01a7336-2a3ee4290famr84535655ad.18.1767945600724;
        Fri, 09 Jan 2026 00:00:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGFSK+Lku1ZSX+jQhjpLO5QfKKpxzvZHLY9XBYT3Bk1LV+uUP1O6CYHVtBlEnSQXQM0N12anQ==
X-Received: by 2002:a17:902:e552:b0:2a0:de4f:c96 with SMTP id d9443c01a7336-2a3ee4290famr84535405ad.18.1767945600191;
        Fri, 09 Jan 2026 00:00:00 -0800 (PST)
Received: from yijiyang-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a56bsm96808445ad.20.2026.01.08.23.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 23:59:59 -0800 (PST)
From: YijieYang <yijie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, yijie.yang@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com
Subject: [PATCH v2 0/4] Initial patch set for PURWA-IOT-EVK
Date: Fri,  9 Jan 2026 15:59:50 +0800
Message-Id: <20260109-purwa-v2-0-f39ee10684cb@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20251113-purwa-907ec75b4959
X-Mailer: b4 0.15-dev-56183
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767945329; l=2690; i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id; bh=aOH3bXRekoCLDNLFUKzyXEeZAT1Eqc2C/tBCqc66vw8=; b=yWNxT9luVsGQSoQq767+JP6gsuQJzEWneFltAVU6FJFIZ7/jHbQWkOytsT2KVfukeCRezJQcF /OxKmK0L1O7BitXmE7ONQU8bsnJ8YgWbJosGgGLEF7j5eRAZwugwGqY
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519; pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: vFXnkzp9iVGsQquY-gOju9tqeOXemT8i
X-Authority-Analysis: v=2.4 cv=X7Jf6WTe c=1 sm=1 tr=0 ts=6960b581 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Jn1IuHGNbmyHqfI9sl8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA1NSBTYWx0ZWRfX8O9iU8FfoAsi
 rVnClW+J1y6it312d8x1ULqqWDlsNdceZlketZHaHxtJFAbFtxDdplN8EmcUPatqtwD+IuJK9DQ
 krR5nSIKhXyvKcdAExjwvI9cLTwdE5xPpaTfncqh6XB9QEOi2B+8k7cfHSz0RxP4DZiwebuS2op
 PeJ6qjOBLSA/kTcDAGm/QCqDlK5+3qZtRgXEdcPj34Ml0Z4ZjUTc90j1SgifiTUr/QVbuei582+
 02JvVievEjKX5rl7XtVzgEnDK14zxsY6stGOxbkatTxRG9bSQK6EbcKXjb8LQS591jFujJ0S6uV
 gonN+uXUPxTUUaSvUPlLlTlic74P3F57Ye6K2AJBORMAzaudTGmzwyt1+BAaSdbE4BrNfUm5aDT
 /NPip6Fp0crnhp6773Ev3CILjrMVxkZ15RPRBaAzVLKdZpDOlcVmPcIofoXjmoqHGUZBXQt7IrX
 wJprUgD5WzA+GbWL0IA==
X-Proofpoint-ORIG-GUID: vFXnkzp9iVGsQquY-gOju9tqeOXemT8i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090055

From: Yijie Yang <yijie.yang@oss.qualcomm.com>

Introduce the device tree, DT bindings, and driver updates required to enable
the bring-up of the PURWA-IOT-EVK evaluation board. Focus is on two key
hardware components:

PURWA-IOT-SOM — A compact System-on-Module integrating the SoC, GPIOs, and
PMICs. Designed for modularity, it can pair with various carrier boards to
support diverse use cases.

PURWA-IOT-EVK — A carrier board tailored for IoT scenarios, providing
essential peripherals such as UART, on-board PMICs, and USB components.

Together, these components form a flexible and scalable platform. Initial
functionality is achieved through proper device tree configuration and driver
support.

The PURWA-IOT-EVK/SOM shares most of its hardware design with
HAMOA-IOT-EVK/SOM, differing primarily in the BOM. Consequently, the DTS files
are largely similar. Both platforms belong to Qualcomm’s IQ-X family. For more
details on the IQ-X series, see:
https://www.qualcomm.com/internet-of-things/products/iq-x-series

Hardware differences between HAMOA-IOT and PURWA-IOT:
- Display — PURWA uses a different number of clocks and frequency compared to
  HAMOA.
- GPU — PURWA integrates a different GPU.
- USB0 — PURWA uses a PS8833 retimer, while HAMOA employs an FSUSB42 as the
  SBU switch.

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
- Graphics
- Audio

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
Changes since V1:
- Update the GPU firmware path.
- Update the description in the cover letter.
- Reorder the patches.
- Use separate DTS files for Purwa and Hamoa.
- Update base commit.

---
Yijie Yang (4):
      dt-bindings: arm: qcom: Document PURWA-IOT-EVK board
      firmware: qcom: scm: Allow QSEECOM on PURWA-IOT-EVK
      arm64: dts: qcom: Add PURWA-IOT-SOM platform
      arm64: dts: qcom: Add base PURWA-IOT-EVK board

 Documentation/devicetree/bindings/arm/qcom.yaml |    6 +
 arch/arm64/boot/dts/qcom/Makefile               |    1 +
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts      | 1313 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi     |  614 +++++++++++
 drivers/firmware/qcom/qcom_scm.c                |    1 +
 5 files changed, 1935 insertions(+)
---
base-commit: beff4beeeb2760405ad49de2a6a1bdab8fb1aec3
change-id: 20251113-purwa-907ec75b4959

Best regards,
--  
Yijie Yang <yijie.yang@oss.qualcomm.com>


