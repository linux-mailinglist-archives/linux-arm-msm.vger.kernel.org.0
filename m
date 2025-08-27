Return-Path: <linux-arm-msm+bounces-70974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9000FB37854
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 04:52:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83BF51B67E90
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 02:53:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67652301014;
	Wed, 27 Aug 2025 02:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RjTniyRa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A79303C8B
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 02:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756263173; cv=none; b=JlFZ+vhkNMxVysOFkrwtiZXy5awCzCbZWzds107f64YSOUlYB29JEfLXAowbggR6f0x20sxGpo06iTlnRS7g9mQ9xFWL82nkzbCSnaKw4fI7FfojT6+IfgSav+r2XwujqloRhYIkujVpiPucrf4NEoEBTX8J1sJ9PjrCC/U/xVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756263173; c=relaxed/simple;
	bh=DCI/imsNApJFlFxStHKcidA4pyGtS+hWKhNfLToB/H0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Nmq1Ry1zY7DXxDS/juajdsmgdtuyalgh+nMocrSywdfAKXE+F4Wq1S9CnaOSvYejvziBxUXKXKmQN00HzDEdN00dS3mNpfSPaxHzRnT2s3V3sBkJH6SLTK3tHNPMDU2+IanDSEps7HeK643UDGYnhQQryMz1QyPDepQF/Kn8Tho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RjTniyRa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QMrVfD031499
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 02:52:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KlhYzjbIVgdoBaYMxqYLjF
	p2t7nqtcjzEryZnKwvMoU=; b=RjTniyRanN3ArGKiJEXB7cpLK4YW3e2LKz7/F3
	ZCVbabvHR8fi75ljygq4eqmMjyYkQLwTVydaiXM8rigz+hVLulbae8qKw1GF6fw9
	2pewwLtjhzVs5sWshzP5BGkdE5jp+ajFRkp+oT7gtwAUqa1qQVozpxOI+vvevd5Z
	NDHzgT9PcUDnpqHpHifnAw5KxwiqvNxr9NMyFYtsrW1cL4HPDtp1AkSyXGBVVwRi
	xtjMJAMuRgUB2FL3GWHkLJzbGBvay8ySNwVC0wU3LHKFXI7ooUb1VPgWeMe4qbPy
	b4SEW4UeEpkbPZ9PjOeUlh47eV9sqfFtw8dXpdzLDHpw9tSQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48se16t6mh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 02:52:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24458264c5aso67908125ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 19:52:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756263169; x=1756867969;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KlhYzjbIVgdoBaYMxqYLjFp2t7nqtcjzEryZnKwvMoU=;
        b=IIrfdirNq0ew7ofYlg/cjQ5WiY1zUGtvRH7OYy6D1C0MNcCvX/gC4NfKvbK5O0dN2s
         8pX+9Vnm2RuIHAwl6gROFqaDLOjdDPkPPiwB9d9NP3mzNtUXZiwbH5GcQ9gE/lgi/0A5
         xrXgGBbGBWDFDB19xP2FeimLL+HRPdO0+w1VHeNqSjTuv5WRaPjMcx6CzWhUZ2aeGM+J
         yepBmzFw5/dbt7bKsUqcgJP/6etVGb20oKfWlda4P9j9T/TIHp3LhkBublQ5hoMZG0PG
         WxafmyszqylVBqClK6zY44Sd+AomHq2i5OHahtu35b46qq/JfuQvgKBmjBPSGJXQE8o7
         D7nA==
X-Gm-Message-State: AOJu0YwM7MnkLC72lWcJGVXUA9uTtK37q9vsm2PpWS8ln8+9275kd018
	QiYZ5wxJWvf/IERCSgp2NjSkU+IKXJABaO+bEwhvWMJPcV/bOLZV05BbEWGJ718WKw6draQnXEk
	Chjw18gK4SQ2scByo/lXkCN3bgCqijMMnve2RBJARntj4kC4LP2mkO5LOWpsB0P78vshq
X-Gm-Gg: ASbGncsv7wX8cx2VJDphyujdGxD+U2L8OQ8y5V5SIjKk+xgH+fTFNkMVHO2aRw9xQjM
	z7/I4XhLUk5D5YHuSe5As6sNUAUYG7Knq5+xNXhl33FbhjMQaaBjvuFyEjeEKHcoXO4JhAhYWZU
	cSpTt8PO0jpCH11zQH0A35hDhK+LftuoZvmVeU/rLxgYXc7MGK2E4o7W+LFnLJNWH0aS9hoPuq5
	82Do5noHVFXWuV2hxImvRl8UNZwrsj5RLoW04u0kKgnycDRzKkqqSAC0UOrqywI50vST8Aku+ZX
	jiAuXNclr3mSiFtbtPSZH7Qk3i5GIC9mjSdk+sAmE83RzrMWen2Vy+DRtRAoU4f6MQqKKr9vIeG
	kwjN4FX8cNxSk/GdiNVwCYhW/93OuAvb51g==
X-Received: by 2002:a17:903:19cb:b0:246:7c47:4b34 with SMTP id d9443c01a7336-2467c476762mr192907295ad.24.1756263169038;
        Tue, 26 Aug 2025 19:52:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHch5D+cTtbyk/AgePB2uEubQaHYK4msVpRGUDwig/dkRfjXpOCGV4OTxqj6464NLcdtddIcQ==
X-Received: by 2002:a17:903:19cb:b0:246:7c47:4b34 with SMTP id d9443c01a7336-2467c476762mr192906875ad.24.1756263168480;
        Tue, 26 Aug 2025 19:52:48 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246687a661fsm109337585ad.43.2025.08.26.19.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 19:52:48 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Subject: [PATCH v7 0/3] Initial support for Qualcomm Hamoa IOT EVK board
Date: Wed, 27 Aug 2025 10:52:17 +0800
Message-Id: <20250827-hamoa_initial-v7-0-f9b81d564bb2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAONyrmgC/32Sy2rDMBBFfyVoXQVprGdW/Y9Sil6uBY3dWI5JC
 fn3Sk6hJrazEQyae+Yw0hWl0MeQ0GF3RX0YY4pdmwv5skOuMe1nwNHnGgEBTgRhuDHHznzENg7
 RfGHivCSV8BIkRTnz3Yc6Xibe23uurUkB2960rimUKfzX14fTOY8b7s33Ttcdj3E47NpwGfA0U
 gGgAmpiGrr+Z/Ic6ZSY7iWhD0ojxQSbSnrLhWWc2dcupf3pbL4KfZ+PInAPU7EWrkXNPam1oaJ
 ahovNCHODx6WMkCGVAsGYJ2C8eWIAq2FNLSFOKfCUbhhUMwPKHyFVhsgatDIcHAj9zECvhRURg
 WiQSnu3YcD+DdRyByxDqA7eWlBCSrsB4TMIXUB4MaHSaCeC8kxuQMQMAov/IMouILBAqOH5YVc
 gt9vtFwmS89IKAwAA
X-Change-ID: 20250604-hamoa_initial-0cd7036d7271
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Yingying Tang <quic_yintang@quicinc.com>,
        Quill Qi <le.qi@oss.qualcomm.com>, Jie Zhang <quic_jiezh@quicinc.com>,
        Shuai Zhang <quic_shuaz@quicinc.com>,
        Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.15-dev-5bbf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756263163; l=4726;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=DCI/imsNApJFlFxStHKcidA4pyGtS+hWKhNfLToB/H0=;
 b=zoESVDIwTtr8LLNkrO+kb/zJiBjFN7gcqL4BCh5RV3lMMa32IqJIse1j9yO2WdUJ7FCwp1OvU
 OUMdHwwn8DkB2J/J1dpdq6dwsawdzYo2QfnW1PsuZGKrsjsKH2A/txW
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-GUID: 9435IXbBDk-SlRU2NhQMEhjRW6hfKzQU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDEyMCBTYWx0ZWRfX100oT3Nxo5Bk
 JFsTzeZbUy/8rshF9R7zOO/nuSzEDvmvIWluSc5iE4os+mk2HkFJaTu1/K7lvkEtI+blLT7eyyq
 Xji2aknjNlFCnZIAAjv66GdVfJlyE3aRwJls1kUxwYM/RBRRGeTrG+kt3eBQvXPBhPWECyFrZXn
 3Br8xMIfx0dC/3wRjzCL+m9/3zxBO8NKWN8RUo5+KZlyRAHaySx8cUoUogvbpSUAzWivSRWPSN3
 o3S0k034KgHG46M15atJR6j6do4D2ai61Ticp1Sy/5njzDexi5Kc4A1gaxTyNByxkifsp1qULfB
 SJsHEx/1I0UKglB5rzAjONl0KcQunTYoVXN4ad8/SvLSNblrhIXSuzHJX+ztTcHV6YGjzt/Q20R
 7oIf3z8J
X-Proofpoint-ORIG-GUID: 9435IXbBDk-SlRU2NhQMEhjRW6hfKzQU
X-Authority-Analysis: v=2.4 cv=CNYqXQrD c=1 sm=1 tr=0 ts=68ae7302 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=SVuyu6wvmbTLjiTTrX8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508260120

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
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts      | 1247 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi     |  609 +++++++++++
 4 files changed, 1863 insertions(+)
---
base-commit: b899981540841e409e496083921f2e5c4c209925
change-id: 20250604-hamoa_initial-0cd7036d7271

Best regards,
--  
Yijie Yang <yijie.yang@oss.qualcomm.com>


