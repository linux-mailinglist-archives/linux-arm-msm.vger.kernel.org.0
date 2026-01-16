Return-Path: <linux-arm-msm+bounces-89372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24879D2FB8F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 11:43:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A43DF30B6820
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 10:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8311F35EDC6;
	Fri, 16 Jan 2026 10:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XfmiVc80";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IYiGgbis"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5B43612FE
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 10:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768560099; cv=none; b=PVH67Jy9zJ97nASvVNKBUAKFdK9JOxZ3CJECUE0gOQf+R14miCNnDeyea9uotGSKRKJ7KShDycc80DRoM/4Yb8UrBCIijhntlhGJcEh7c3717+wzakaiPQRIwqm7sDDVNnNn5v3tTpWWhIhdLgVil9IEoXvWji84vj8Mk6W79Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768560099; c=relaxed/simple;
	bh=kNFY4y3BJgBAIb/8HajuqovArpbmQ7msBXNVYmgfD7Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ktGxPBK2nnGcnWJuj7ho5EPgWTHiJDlGqkddAbZVNATqrYX+ceYTx1f9RMm1of/g5qzIIZ0MoK3aAewQ4InXBn2wPmftL6CsVza3a2CTh6pd2QD9zRlKRLjIa4N9r62e9oancqRUt/YMji7hDWTuw6laTrtZJoUiXz80ey93PNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XfmiVc80; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IYiGgbis; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G83Wi73192152
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 10:41:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nX5FGzCE6dK8Wb+oarVcRa
	JxjrO5dtPhfxYccNa3LAs=; b=XfmiVc80OiJ8S2fiDhTu1fswSViNlYMYkNgjQ1
	fblOavII5ZsZPuxyFIfDOdgsNWCVik7XUwYSAXet5dHEmNsgO8NXEbHjkPXZt0An
	k+m/xlQ2n4evtsIfStD3i+0peLchGXdhBIWjGkDdjNotGe9PzTTLl29gq0yfnXGU
	OtW07pMmAnVhkoc5emNozeqamkoHUW6i/q6XYOgStI3tDOqqX6e6VtRkyQ5rHtaU
	nNiuctMP3TaVzXcIiq/cMSo5h6KLqRgkQiRW1oxdk5+Jsf5fIhcMmjzNgLxMNs6a
	6E6hYQ0gry0Y3iZDpcZo7zRtX7SGyt9DZ/Hz4sAeYiIpdo8w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq968hukk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 10:41:37 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0fe4ade9eso18654215ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 02:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768560096; x=1769164896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nX5FGzCE6dK8Wb+oarVcRaJxjrO5dtPhfxYccNa3LAs=;
        b=IYiGgbisaBtJIB/Ar42roDZVKS1u8YJsAgZW9Purm84V0AjPK4q6Mcdzp8m7+MisKv
         2h1plqgriobdU/k5SStN6DVeU7ck9uxQZ1OnXhroqJmK12Vo4kX/p1HMtKr6oGGU8dcr
         t/UdYXgy5DK0kyvsyjrWap+/z2GtpD4x+u9Yai2djz2Pt9olw3Vfdc54cWKILVQJrWPy
         8MsDDDvgXX95TR70hIKSbGobW2jyff6oVo4LHsK+I892/2Z45VMKrgua7Jv+Djbfp0FB
         HGWClspYbduZLbAcJbHkHGjxqkjngBU2HHNOZ18uGOrqU4SgeRhH+dNxMGNKP7Wri3GU
         k+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768560096; x=1769164896;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nX5FGzCE6dK8Wb+oarVcRaJxjrO5dtPhfxYccNa3LAs=;
        b=F51y+3jRj7YwPHS8djKZQ+N5uSxVCFUQLYH7bivuk+5Rym7csI68A3n2Qk2PL7Kjm/
         g9AF/8o1OSoAaS/GyStQ+Ju9D5pihynv44ayf20KRbs8J2/DnGDGCO8BZtTMVS2tgT3Q
         c7ViBoQyUPDtLznBZtx4ItDfYJ9mKvT5/rupcDBuqarU6PBaITphB2g1LH6MnUjFICQQ
         x8IzxPe42K6Akex5Qa903bgXX+fuBieo01A1fr1Vj3fDpJJwBX0YsWo4TdOILyTOLK5t
         mspsjjGsBuiVrPX0mqI5sgh8Wj3h9REtRG6sGUiQIoesPwLcKb4jYTnGN41XvFNd0Lh3
         /w+A==
X-Gm-Message-State: AOJu0YzyjQqmoQq0ZP1xqeF4+JmCPKvknCFJ/yJWQjQd8LyKPqJ6CVn6
	KhqL1N9yyV3YI75y8bGt4V/oWYcOIYmHvanGaHQrBwV3oKsrixwMyUOkTxmWHn8VRlM2Xv/ADiu
	xrwl5hk5tW7OgsFt7FFyutrIYx/yyYsubl/68eD8u2lKrOrwVIbf9QNxuAHFqsWdjPFL8
X-Gm-Gg: AY/fxX7UnPnu3HerkBazruGn04uAjDVeno8IFlrV/tu1ywZiEfFYeiMKZt/n06cVEtc
	AhJoPusmhMmTt1O7h8uMTg++ZrZq2q8k5xcruLRXgpz5O8NBwfu5nafecnYiPvJsbIc6nxZuuZb
	kZgmnbFoGnxerR8Yp/NEfzedxRTqnAnjVACY5hc2Uul5jK1OJrJ7lGImu/T2EtBWEclW4fWF1lc
	YNunqT7u2hYJ3fByH17QeAV03tvAWd+cqBG78AMrmyi+rlP8vtIMCrPu3U2n3T39BH9cnwAuKop
	Wjm+cdlpQVhnMsxVFYgT1GWjmzAtxV/OxPA2g5EiSlH796K4MWH4/SBiMblY68wr4N0ESaVB8ZE
	8c/pjVltT0uYV5IhNJtqBImzWQqTWn9L1WRZ75XL3bcfSj9jZBqUbzgXboJITy7jd9o4UofGveW
	k=
X-Received: by 2002:a17:903:144f:b0:2a1:388d:8ef5 with SMTP id d9443c01a7336-2a717545072mr23645065ad.19.1768560096503;
        Fri, 16 Jan 2026 02:41:36 -0800 (PST)
X-Received: by 2002:a17:903:144f:b0:2a1:388d:8ef5 with SMTP id d9443c01a7336-2a717545072mr23644795ad.19.1768560096010;
        Fri, 16 Jan 2026 02:41:36 -0800 (PST)
Received: from yijiyang-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190aa340sm18009215ad.3.2026.01.16.02.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 02:41:35 -0800 (PST)
From: YijieYang <yijie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, yijie.yang@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 0/4] Initial patch set for PURWA-IOT-EVK
Date: Fri, 16 Jan 2026 18:41:26 +0800
Message-Id: <20260116-purwa-v4-0-89b2adae9f09@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768559617; l=3521; i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id; bh=kC2UTIKqYA2ekUH5dbD8qQExiPGzqcCyqASk4qiVtXA=; b=5VE3EvBgz33tevroEFQNPcCBsfnyNV1o6WLb2SD1mnYUh7PMT5BYprhHRhppXJpbYXG+87/JG bAQdwvwr8JwC/egQMi+WzkCKxbU193/uptM6DOB9yyUTc9oc+39EmAz
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519; pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JNg2csKb c=1 sm=1 tr=0 ts=696a15e1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=fQR9YXze8387tbXS17IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 5SaYPcVUHpdjvClpFySI-3Hl-Qic116D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA3OSBTYWx0ZWRfX8YZ4Q/bRHfA3
 vtcpvrs01f8yPlnGWqK5OCDzBFhNrd+t7lwJt2rV7qoVpSPz2lExifB24SCn1i4xLk93VzN2t2n
 2IRoAnM38YrQQuGoBhL4BGQ6qLa/NJwebsNqcEmgdJTy/7fD+JbpL0nVba3rmPxuCdyZay2dpOh
 tVPgOPG/5TLHo1pEBkMRkymHBnKwBR6yUUCf7NomxjVbTHO2rn/bbw9z49LEYY0gQIR/xc3pW6G
 Yiue8ydY/lfEEHIJVchNC3KRnjByXmBXFJehwV8BXoLGABD8T8zD9wOWGSGysudgfGBR+BWkGMU
 UsyExRKrDSOlEC++c3ANJ5PlbOxqE6s2/C4Ytdn78b0ASKNveLEdA/DK4CDdtGP2fA41A7a2LOe
 DiWmyJnEnYTEuPKoa3I3PP/wLJJX9mXZ77QxvbrbJrJ+7fRe812moMP35dJ4eBbYocsWYfHa7Go
 H9PQqSkA/F8aQSpcDsQ==
X-Proofpoint-GUID: 5SaYPcVUHpdjvClpFySI-3Hl-Qic116D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160079

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
- PCIe3, PCIe4, PCIe5, PCIe6a
- Reserved memory regions
- Pinctrl
- NVMe
- ADSP, CDSP
- WLAN, Bluetooth (M.2 interface)
- USB DisplayPort and eDP
- Graphics
- Audio
- TPM

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
Changes in v4:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v3: https://lore.kernel.org/r/20260113-purwa-v3-0-16eefacbdce9@oss.qualcomm.com

Changes in v2:
- Update the GPU firmware path.
- Update the description in the cover letter.
- Reorder the patches.
- Use separate DTS files for Purwa and Hamoa.
- Update base commit.
- Link to v1: https://lore.kernel.org/all/20251222-purwa-v1-0-14ab9316e5ff@oss.qualcomm.com/

Changes in v3:
- Delete unused PMIC and thermal nodes.
- Add WiFi node.
- Add display backlight node.
- Add connectors and VBUS regulators for USB3 and USB6.
- Enable PCIe3 and PCIe5; add PCIe ports along with reset and wake-up GPIOs.
- Link to v2: https://lore.kernel.org/r/20260109-purwa-v2-0-f39ee10684cb@oss.qualcomm.com

Changes in v4:
- Enable TPM.
- Update the descriptions for video and the USB OF graph.
- Link to v3: https://lore.kernel.org/all/20260113-purwa-v3-0-16eefacbdce9@oss.qualcomm.com/

---
Yijie Yang (4):
      dt-bindings: arm: qcom: Document PURWA-IOT-EVK board
      firmware: qcom: scm: Allow QSEECOM on PURWA-IOT-EVK
      arm64: dts: qcom: Add PURWA-IOT-SOM platform
      arm64: dts: qcom: Add base PURWA-IOT-EVK board

 Documentation/devicetree/bindings/arm/qcom.yaml |    6 +
 arch/arm64/boot/dts/qcom/Makefile               |    1 +
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts      | 1549 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi     |  685 ++++++++++
 drivers/firmware/qcom/qcom_scm.c                |    1 +
 5 files changed, 2242 insertions(+)
---
base-commit: 377054868ffa544991cc491ecc4016589fc58565
change-id: 20251113-purwa-907ec75b4959

Best regards,
--  
Yijie Yang <yijie.yang@oss.qualcomm.com>


