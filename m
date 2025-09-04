Return-Path: <linux-arm-msm+bounces-71986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F92B43484
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 09:49:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5620B17FC93
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 07:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7D7F27B335;
	Thu,  4 Sep 2025 07:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MABDf/rw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111861F4168
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 07:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756972153; cv=none; b=R15LVA138y9lXSiDWYBqkA2eHSpyqB+hl5DF3p/xWkjnpfyvZfL9U1IQXT95KdbOQUaSa1rZ7PNPcVPGATMocH77FpjZFm0zjT9DhFCtLqyxyFO5DCjDLNVUN2/A0GG+ZmTYTwU6GgT+a7sJTr8P4ZYXE+dsWJoPshhET3zkWXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756972153; c=relaxed/simple;
	bh=O98jTQnfeUzVZZSfPpAzHUVtE0kj2LrvSBUzUr1CZWI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OilM5GfS7hwp52m4uz4+USh32LnB56eS8bLUk0wkJejbSGQ05owBqpGoMUGAp5B/ZI/iHGhE1HZoNPqIvmlWPGdvH2VUAAVnRQM70gUsByiMMOrOdvCfpvUpFSWRIWnwJCT0MrocYe1JHAMNTnwPeDXIlivNAA2XlrcxiwxYOvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MABDf/rw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5840RtL2007957
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 07:49:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fqRhy+yGkSgsfxSMyzrwS6
	oVEVDjsCskmzrVC099Vz8=; b=MABDf/rw+Em8fK2AnDMddVAChJKJHM2iD+pJPc
	wSlg92tlWY5c67JsrZk6zyLq2O5wLscN8t/0vfgsONoAcx9i+P6OhwLHTJ2GmE4G
	zjT3W1SqvlNJ7XhW0pd7qs+dbcuHgZhgZlHha8QE2Y4RmvjefEverF98Fv9SGCje
	my2lfOnT/7qiNZaBwVSHz5OAqdDv1I91lGRzbTmyYNBxBTK/HOeIeIfFt1MuUGu7
	QaJTEQs8Ko6j9IZQV/beDKculHholopTEm0AXOvJy7DcT7vcU3xMRIIQZolYB9ia
	lAR7KuHnGNL0wr3XkZwbttlVOF4g4Mo+smNaEM6baM4s0VLg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wyajmw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 07:49:10 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b4fba5799c7so909309a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 00:49:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756972150; x=1757576950;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fqRhy+yGkSgsfxSMyzrwS6oVEVDjsCskmzrVC099Vz8=;
        b=FHBwe3Yo3Zfy0mai6q2JEx96gbYka1uk1bcwNpo47ATyrEVbtL/WMeccZ+huNp7p4W
         bdxtuxCiVG8g5C//hk+FPpCRsq5M8SSTVu/6vmUHtXXWBSjPr7ZMVMZwZri9hduIDSZo
         JjUZaMdBUA3GBp/j41lBCEZclYwBftPz7gubs98Q9XoUUnXeQkVI4Scjzu0T1vWTXvvr
         fIDgVqhFNH6U1XNeDKY5tn5zKrKNI2MOXMiLdB80hU8FoGRbSPN6WEpgt8UTgbnCnVc5
         ZRiNSC39ZsrIwf4sTDN3tl/uJTLdmx0uKzMbLw3UDCquhSlOIEwq6TMn1Or1CDstwjBD
         4JRQ==
X-Gm-Message-State: AOJu0Yw61V+EGktmrDw+kuFMknWONT4aCZisboPALGKOqs7pbJI3H0JT
	kW44higwbcgcPGpAXl0Zg0fL8dyb1TlojCZijJJzGDxqsALE3M9KyjjZ/HE2IR2IdUXD7uFzOXD
	RpITjjpNC5fbTPeSi4MxlDKQuuCBSGKqflfVsR9Tf2H2bvEn46jWahbDOYjGyhFcyswU5
X-Gm-Gg: ASbGnctpOa3cxvhNZ/ZYdF2/IDPWehtxKx9FhlpJAI9CY9yoANfX4l6ZcObcuFUdsEV
	7w/LqQtyBe8P10sxmSOIUarpSagpQLtdsLuYNQTU/H3UHHnAeyXKyvq4QWEK21J27BzC+klaM9E
	MypHXfuzMWBQ4wjVfR6M6x+f3BwS1a9D2s1kXaQEwF0/A5TZ9wkjrx4AiuJ+B6srHWR4ucWNEbC
	ZnWmQ3gTr/KeAWNtPsFb2ZgIsXMYbaD2CTsqD2T+iYUjavQlCoEdKvjvx0rKMesyVcpzl/sxXFQ
	erd0PZdF74hyVfFpueUI+2+dANtDxvAHAjwAAxCRST1toPplYeKRuFNm9PHtKhJSUATlqjPrhiC
	q3GOthwj55B7hEtPMjrhKowScDj0wyzyxlA==
X-Received: by 2002:a17:902:e783:b0:242:bba6:fc85 with SMTP id d9443c01a7336-24944b75a04mr254803345ad.56.1756972149611;
        Thu, 04 Sep 2025 00:49:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtGuXFCF92xrfjJfatFqZDRyJgm/Lz06G1IFxukJgJ7ZWIbGwVvosAZpu8Es8WA30lxFM9TA==
X-Received: by 2002:a17:902:e783:b0:242:bba6:fc85 with SMTP id d9443c01a7336-24944b75a04mr254802815ad.56.1756972149089;
        Thu, 04 Sep 2025 00:49:09 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-249065ad5b7sm182194525ad.128.2025.09.04.00.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 00:49:08 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Subject: [PATCH v9 0/3] Initial support for Qualcomm Hamoa IOT EVK board
Date: Thu, 04 Sep 2025 15:48:31 +0800
Message-Id: <20250904-hamoa_initial-v9-0-d73213fa7542@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFFEuWgC/32S22qDQBRFfyX4XMOc41zz1P8opczNOpBookZSQ
 v69M6ZQ8ZIX4eDZa5bbuWedb4PvssPunrV+CF1o6jiot11mK11/+zy4OGdIkBFOaF7pU6O/Qh3
 6oI85sU6QgjuBArKYObe+DLeR9/EZZ6M7n5tW17ZKlDH8t9f6yzUe1z+Xn5u2OZ1Cf9jV/tbn4
 5ESMUugKnR90/6MngOMifG9IDBTGiAnuS6EM4wbyqh5b7puf7nqY6Lv4yMJPMPA18IlL5kjpdL
 Ai2U42Qw4NZiXMmCEFBI5pY6gdvqFAa6GFRhCrJToADYMiokBsDmkiBBRopKaoUWuXhmotbAk3
 BOFQipnNwzov4FcdkAjBJR3xqDkQpgNCJtAYAFhyQSEVpZ76ajYgPAJBBf3gacu0FNPQLP4Yzc
 gYgoRc4hI90IZCY5xGr9pAyKnEDmHyAixyoEoYu2arRX7eDx+AUHyE4uUAwAA
X-Change-ID: 20250604-hamoa_initial-0cd7036d7271
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-5bbf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756972145; l=5111;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=O98jTQnfeUzVZZSfPpAzHUVtE0kj2LrvSBUzUr1CZWI=;
 b=0AHWxHwY89exZcZSCRjokyG0WBXGpQeBrnB+NmWWrsa2sIsJLUZcmvsm3Wbi2Y2bfbUnQjcuO
 AjJq02Y8X+yAkvnl0ADcM0kKofP8paypoRB4Lch9kVqyJ0nK+wO2GOU
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b94477 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=SVuyu6wvmbTLjiTTrX8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 4GcnXkfrOPllu2QrUcswPCkYqnbZBn8P
X-Proofpoint-ORIG-GUID: 4GcnXkfrOPllu2QrUcswPCkYqnbZBn8P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX91hh8dRHBa8L
 u64vfSCbGhtKeLY9EeiTBc6skOsWgmkj5Y7zxjZfT631eLHch/09NmcwRgIBq7PQR6VMEMYVLVz
 /USYh4Y2+DjsdZp2kyEczy9wNvZe30HP+5GuU1dsa40xQPyHsHh3VqtAS9hLil59sFfL6b+I/bx
 PpCGjVUaZupsiCjzAPbmyW0ZkK5uMrrGoL8Z5iXEQ21XivitMK6xcyL6Jwm3KEEpBMTglkXtpCX
 gQ4LTBV2sa7ErOFDjGM2lJe/fVOzf0nBAKh/6g6ZKvFebb1gLDLCCKgBQGMmgFETLGQDxOpD4QM
 pfC8y6bEREEUPURgwe27YpNqPf+NZrZG9klHF5cQbobz2EzDssV1uetenjHK4kY/e/lcd3Ga09w
 NHRZjX1m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101

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
- Graphic
- Audio

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
Changes in v9:
- Sort the nodes within the root node in alphabetical order.
- Add WLAN control pin to the PMU.
- Link to v8: https://lore.kernel.org/r/20250828-hamoa_initial-v8-0-c9d173072a5c@oss.qualcomm.com

Changes in v8:
- Change the style of how collaborators are listed.
- Link to v7: https://lore.kernel.org/r/20250827-hamoa_initial-v7-0-f9b81d564bb2@oss.qualcomm.com

Changes in v7:
- Configure the EDP regulator to boot-on.
- Change back to a year‑less copyright statement.
- Update base commit.
- Link to v6: https://lore.kernel.org/r/20250821-hamoa_initial-v6-0-72e4e01a55d0@oss.qualcomm.com

Changes in v6:
- Restore the full change log for each revision.
- Merge the changes related to Audio and Graphics into the patch series.
- Link to v5: https://lore.kernel.org/r/20250814-hamoa_initial-v5-0-817a9c6e8d47@oss.qualcomm.com

Changes in v5:
- Update base commit.
- Drop an already merged patch:
https://lore.kernel.org/all/20250804-hamoa_initial-v4-2-19edbb28677b@oss.qualcomm.com/
- Link to v4: https://lore.kernel.org/r/20250804-hamoa_initial-v4-0-19edbb28677b@oss.qualcomm.com

Changes in v4:
- Update commit messages.
- Update base commit.
- Update the format of the node mdss_dp3_out.
- Add comments to clarify certain nodes.
- Update the configuration of regulator-wcn-3p3 from regulator-boot-on to regulator-always-on.
- Link to v3: https://lore.kernel.org/r/20250729-hamoa_initial-v3-0-806e092789dc@oss.qualcomm.com

Changes in v3:
- Add compatible string and dt-bindings for SOM.
- Restore PMU-related regulators to comply with dt-binding rules and enable kernel-level power management.
- Adjust commit description accordingly.
- Link to v2: https://lore.kernel.org/r/20250724-hamoa_initial-v2-0-91b00c882d11@oss.qualcomm.com

Changes in v2:
- Merge the compatible rules and remove the compatible string map.
- Align the ADSP and CDSP firmware paths with other x1e80100 platforms.
- Remove the regulators on the M.2 card, as well as those managed by UEFI on this board.
- Merge another patch series that enables USB DisplayPort functionality on this platform: https://lore.kernel.org/all/20250723-x1e-evk-dp-v1-1-be76ce53b9b8@quicinc.com/
- Link to v1: https://lore.kernel.org/r/20250716-hamoa_initial-v1-0-f6f5d0f9a163@oss.qualcomm.com

---
Yijie Yang (3):
      dt-bindings: arm: qcom: Document HAMOA-IOT-EVK board
      arm64: dts: qcom: Add HAMOA-IOT-SOM platform
      arm64: dts: qcom: Add base HAMOA-IOT-EVK board

 Documentation/devicetree/bindings/arm/qcom.yaml |    6 +
 arch/arm64/boot/dts/qcom/Makefile               |    1 +
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts      | 1248 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi     |  609 +++++++++++
 4 files changed, 1864 insertions(+)
---
base-commit: b899981540841e409e496083921f2e5c4c209925
change-id: 20250604-hamoa_initial-0cd7036d7271

Best regards,
--  
Yijie Yang <yijie.yang@oss.qualcomm.com>


