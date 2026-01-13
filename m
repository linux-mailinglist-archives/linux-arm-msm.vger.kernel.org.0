Return-Path: <linux-arm-msm+bounces-88744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D28F8D18088
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 11:31:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2F169306393C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 10:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFEE738A735;
	Tue, 13 Jan 2026 10:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p27/pBFX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ShyLbtEM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C58F38A9D2
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 10:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768300107; cv=none; b=F59e0OUST0Ywg6XJ+abJoZsosJbuClBpfQNUBi++bxkWrUyQlTyBb2hKog710TVRe2OupZzLOUYFtPZUE6UHLiQre1cxrHJk4DIjsdViuzcRvX0i1OszhCnnZDKyMDa7Q8IxrijwmODxZkYTiRgc0Ra3mq9p3yfNcKVAnbCnH1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768300107; c=relaxed/simple;
	bh=317CpRzQY5bbxxs7wD/3IdWL9RDKh7tAjMT60OZ+HOY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=efryVWQR3/uluG8KSncMBiIzzBmFPBX9zNg/wKGoCendnSeC0/WtjZ8JNY2vNEcX6n2bbdfooxtF9hxlyGBH+8zBh+0UkqQ+epMEeh+l01r+EctsrziQq9oR1xWS9q8bUQKOfY3h6bkoXWnJdATzbd1QdunyV+DWRDUEAMylpA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p27/pBFX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ShyLbtEM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D7fDal1934912
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 10:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mPBZzWghrT0TnM/mXYL1+e
	GvrqNOCov2ywjEXIVmx6s=; b=p27/pBFXJkULJ8jnNhz+Vm1IRdpQ3JZhxLxQFC
	zdXKFJ8ILfaaVzwl3zjW85J8oJnqGYr7K6GDajGXzFl7RZNY6w7j/r3uMJ1Z6mdt
	wWHUggp/gOArIu/v8Zfk+RnBAFngFQF7LShc2esrTrtKrfJ9bkqxxrKlyLqNgJmd
	PaIYhnenQzKAZQNXEVkxiguDPgN7LAn9zYn1padmAvPf7Whxursvb3W2UkqnALCS
	sqhdGVptzJgaxFHPdnl7o011/mPTus5R7zRKDY2TEDktJxgz62nsYagGxgcKpJ+7
	2USYFLy8mvrb832O5fAQQRuI/wMOB5ecDZRNILgiqVx2CDIQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn6cnjhg7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 10:28:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0bb1192cbso68738865ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 02:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768300103; x=1768904903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mPBZzWghrT0TnM/mXYL1+eGvrqNOCov2ywjEXIVmx6s=;
        b=ShyLbtEMmgIlcT4BULKTEZpa0jnXxLIKeqMlGyO1TcC+CxTkm9G+eroOOpJPFnJqPz
         wq4DtQrTn1NGN/R5R2oq00Hg6amTztbjmuX8H2pu5dgbgfbHKbIpgFvM28WL4LI0ud/p
         MtWmaePe6EMSHwermoGUkhP+fsLZ4WO7+Fb1zpTugwenEhsJ7YLRfR7sV66zLx13NjmR
         0EdFeBU1fzF/3BnRVkqckehALmksxecdktPLuLtEnZrEadQW5AQf6Uj8sjh0NDEQPtDj
         VTw9jOV1J+//VXNimIX4w38hQzkuYMclUzB0o1WSiK3/5TdQUHK0ZKYTIym3tCUhCZBz
         aFUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768300103; x=1768904903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mPBZzWghrT0TnM/mXYL1+eGvrqNOCov2ywjEXIVmx6s=;
        b=SoK3WK5K9h8OSBwln9mQqYizMnM0SU5DlpkNNO7sh5wTSzJXFtMMuTBj2guYNLkx5r
         l+gko7a2Zs9Zetc7wIZDbGSEiPi4LyoADfhxwIaEHFsbSloHkoJBEa27s5Yx3oBn5ArG
         hAsxtDUx8PWgahqNg5AunBMokEF6DAPUDLcbODD11qKcxp9ZK6CrVVpNeRrpg5BUBU5H
         7GtpxMO5NAiMpu2JwSembFyNgGXiTRQC2MHK+DW90IsbGDhrKrX7pLw5DXaF2TBwpMVF
         jkr2ivLNGjxeGPk1qMrgu00eozPdR3R/a8vU5jnOaKBW6BK1m2OSX9OAPSY/uwRhrGOM
         qDlQ==
X-Gm-Message-State: AOJu0Yxifk90BHa2FsbpihlZDZRG+UJ9bbxA74PmTjstOK6VQAXoIxZ1
	eXkxokVaA1DBTTFWMbtl8JGL2itBx3+/lLt/gF7ha3u3+71VU6IOQ6g3AzlE/Mx84rU7SrnoSvz
	kEIZ3xGDGoiRAtHC9CuJPX7EhJfbPlGWsrK/l6eohXLFXNm+jo1iR31ptRS1rnBz6A5Sl
X-Gm-Gg: AY/fxX7GXImDwx60VXXQsFjhYPgIVg/vSMWMm9tr8atIgE2bleX4amFfT1cHmpqxcHs
	dR6ZasjAzor1IfytU/eybK8WQoOPvhc3qILRCK20xTPJy2j/JRBEuh/ej64WXvx3vuz7DWG6Kcc
	qCJvpjP57BCrFRqb90xxpEOoxxmeE9gZvoY1AZXgzEOVOKVBN6hG6RpAnsUYZ4y0vv+q9LRKWON
	kcOR0W2md1aNRgkJ3zsDfvRo+eZ1FlhK+B5GBxq420mBszTl5wpmKs3joZEPg5S9ioJrUXB8jm3
	LBfsrMWEK2ERt4LCVeQejCCGBYZWjVXPmmLFU7+hpPDtZwu/n18o+aE21u1Bjx1cRpvQO7njRC2
	ET3G8SB0kCwNYlRINYfRiItSlnlEzK0xl9quEkbZtVrMrO+wNVS4KdsCduhyGm9c4NBcOFyRBCE
	U=
X-Received: by 2002:a17:903:2341:b0:2a1:10f6:3c1 with SMTP id d9443c01a7336-2a3ee46f97cmr178464565ad.26.1768300102985;
        Tue, 13 Jan 2026 02:28:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGARZ3gu8/8zeI6iQIhMJEr6QG3SxEdKA2aTjHl5UdfejbxsEsbmVcJwt2b6jiYgVoKUOmDIQ==
X-Received: by 2002:a17:903:2341:b0:2a1:10f6:3c1 with SMTP id d9443c01a7336-2a3ee46f97cmr178464345ad.26.1768300102525;
        Tue, 13 Jan 2026 02:28:22 -0800 (PST)
Received: from yijiyang-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc8d76sm197125265ad.84.2026.01.13.02.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:28:22 -0800 (PST)
From: YijieYang <yijie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, yijie.yang@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 0/4] Initial patch set for PURWA-IOT-EVK
Date: Tue, 13 Jan 2026 18:28:12 +0800
Message-Id: <20260113-purwa-v3-0-16eefacbdce9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768299324; l=3110; i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id; bh=ypZIW9K1S6oqoHbpD4a093duy7tlI3RgGMgr1asoPpU=; b=/1MDY64en6NKfgnrwavUr+MCA0U0bai63N7s86VG+g2GTZU3O93PFFDFw6JvsuFW45SJ6uP+Q s370rl23gtVC0v5p674fVex5TSOq5YWmbgE52f5y1bz9ZeuD2dWdMuS
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519; pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LW-I2jloDBoBALqCsiWoYoI04_D9KQ--
X-Authority-Analysis: v=2.4 cv=KK5XzVFo c=1 sm=1 tr=0 ts=69661e48 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=fQR9YXze8387tbXS17IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: LW-I2jloDBoBALqCsiWoYoI04_D9KQ--
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA4OCBTYWx0ZWRfXzuCsELddhYLZ
 ZWMyupU792j46ri/isAYyOWFy/76c5ZxDubZKMIhVbZQBHS96QA2Plndoo/FhIHb9CFVT+cD8yq
 b9sQQW10FU3dz/dnWP5FCiCWzOwWJE95ON+Kk5eT/lOq9QgMWZhzPm4vFu+zVNQLta3T5NJp4JP
 zPhG2Cw6VflUSzokJhMX4FmKk/EW8TAEVeSSuq1wZM4ZzWdjDqsO2JmipMfptBEAl2FE0Ow3y7/
 iR0StVNk4MVK2Rna1yFAiqnGim0M71bHbU4Dgd9ZwjlmfneAtWo61aFd+3ACIiRSvI7NTj7YSY5
 mtFfUmbyqxPJ7ff7haNrIz/Hu2KCilvXktwiQaeMgBSGLrJGCqTvMMKYXy6LXzKqI53M8s1E5CM
 s2VFQmpStACZtKaQKZRMJ2vcxvXpOCdXXiewz1D/AUUlJoyXQTC1/621askU1p6+jXaN77bcHCa
 FOzExJC7MSgNTO+KoiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130088

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

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
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

---
Yijie Yang (4):
      dt-bindings: arm: qcom: Document PURWA-IOT-EVK board
      firmware: qcom: scm: Allow QSEECOM on PURWA-IOT-EVK
      arm64: dts: qcom: Add PURWA-IOT-SOM platform
      arm64: dts: qcom: Add base PURWA-IOT-EVK board

 Documentation/devicetree/bindings/arm/qcom.yaml |    6 +
 arch/arm64/boot/dts/qcom/Makefile               |    1 +
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts      | 1539 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi     |  685 ++++++++++
 drivers/firmware/qcom/qcom_scm.c                |    1 +
 5 files changed, 2232 insertions(+)
---
base-commit: 377054868ffa544991cc491ecc4016589fc58565
change-id: 20251113-purwa-907ec75b4959

Best regards,
--  
Yijie Yang <yijie.yang@oss.qualcomm.com>


