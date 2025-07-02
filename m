Return-Path: <linux-arm-msm+bounces-63356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E15AF1176
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 12:17:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DA1D97A3B55
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 10:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCDB31DF27E;
	Wed,  2 Jul 2025 10:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cMJh4pC+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EDF24C692
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jul 2025 10:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751451467; cv=none; b=TZLFJ1SdXdOFu4YZnMoIzUQcEX/UoB409BlxwrBA9AmNc4yD+S2HUZ4dePn+SIA2lSFMRrrJgWQVplaQ21iUfOJxCPTJGtjD3dr4iF9t1Z6poLbRDOHlS9zDrno7KmNECUMxgyva21BNTzgtJ8lQrCEfn4O59FiTVcrCeqBN+Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751451467; c=relaxed/simple;
	bh=+6A6wyU6zI45xM0J89Nwmzn/yIxfMgM9fnnSnd48Y0g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Jtmbeyz59wMBcAsjNdvoXKL8c0RR8FlyLHbMkKelz1Z2R+JIyLtHb4pCMKRm8RYKS2INunQ12K+zjRlor9pwnp2VxF9Dps3bAgchGrVKEsslwNNyA/II2eIaj+WnAJh8qwXE/uRsTzcJMVHZPIjN7xpmBMkPQ+jdz9+abfqvWKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cMJh4pC+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5626aVWH025373
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Jul 2025 10:17:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=B+WepaBZTOBX8Yn9x8dvlB
	2T3GbomLkPCorGKitur4Y=; b=cMJh4pC+PNVm0o51RMxvflOV79/RjJyhxQ/elg
	hT1wSVyxuVrOPQB9NhivyZkg2Bxvbtphy9m5w82nqOU373+M/NZ1TNmVtyULaFKw
	f/CbLIkJ36aj66mdvfpcKH/aaY2VrAylPhYuQ85XWxkOhXGV55GuDkLAYoJ9t9c5
	rEC3eY8eh1P9Y1sE50XYd7dQsXmu7712pop3Yi3OhPsqJ6Fyq3UAR97n0pwr6p5b
	+criASfoZggk1gwjzdnUXoYotmW9xihUBJzwVEj4rBJN/kKpvRqinMKz88vNzbPZ
	ihFAotRB4F8mwQpm/GYWMwlImgEbx4QpwsSNirhSI8DanO0g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kd64sdtf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 10:17:44 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-748e6457567so6126735b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 03:17:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751451464; x=1752056264;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B+WepaBZTOBX8Yn9x8dvlB2T3GbomLkPCorGKitur4Y=;
        b=YHJkQNspm27tBuvob7AkyW4VkqUquRJkHM1QkvOHvUG7PRcPlebU0hPjZ+SVTaI6sO
         rEO0bCAmCSHgXWQWDOodL+6xvSl2Le1sqRi0V20+5fJaOM0iS5VEYzZjQU7H3710P1Bo
         0/lVNxIYkUc44pUYZ1VFKgJieuE9B+xoSPqJInuri37Yod7/XFkDreNbBJjE9Iu6j4o+
         3+D41iLkpyERgUEhNlZ3p8jIkgIUN41ZBIkRQhDRN/E6nqvcJ0DmbS/Vp9Avb8RR+HbP
         9Uj+E7P3SG2SXKMFlfiSJzfyVpUcwOGVd31cEG4qE6Js6957r7Knb0/MuwrDGKkNhg9I
         sHKw==
X-Gm-Message-State: AOJu0YyPMMTkoe5MAVHTHwmQC8XNMz/jMKZ9/Ih0Iwm1dIvel7+6vCjz
	9TD648+mJHFzlPqEySLTzPYbns4gXKc2sENdw9ieSB3jGlgLvkh49ezcZJ4ByQSnO0yNLSr6IDJ
	wXS9ngoAaysa3jXMDLTDD8XxwO5ncQsjRxZdPm2kjv/J84X7GIzgME/dw09KBrTQSeHOk
X-Gm-Gg: ASbGncuv0teNiNh71uz+c4iTJWy168u5d5nN7Zy0ncx+y0fN6NX54VRNo7YdXXjRo4S
	YV1i3/UTchh4TaQRkZBjsxSoKdl3dgvtskKZORv6OanEEo6iqE0vAq8oIrv1SoMu5UGJDXOSwht
	1Ox5oSolKP0ctzfgZbIXOKfbWM96XbPvG6Uz3fazRmarm0Kny7n3Wg1EwF4YR9iYDa9pwR3xI6M
	xJ+Ej6RfJHyEwG7sURRhTfdD+5eX0dv3jYvruYNPK4BglgY3iIE4qmyo7DPUHEMDKpIRKVyCtEf
	WI/OttVDvjRQn1tr9QN9hKpRjFDIz7hpYow9jCXD4M/IR9RcRFmPC+qfcNRQoBs/Sp7wCnf9Y2b
	8rxUv99JvExY/nltWzwfrwdhbNaDnq2vipRVpitaEHVElaTp9RrJXVbXcnQ==
X-Received: by 2002:a05:6a20:734b:b0:220:8ccc:2feb with SMTP id adf61e73a8af0-222ecfaf13dmr3665849637.12.1751451463630;
        Wed, 02 Jul 2025 03:17:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKvznRZf+yAxKwVacb6nCker3LzQt3QaRDf4NSJfZpVLxTxkqKzyh96xEJjXaH0nxt4iv2yw==
X-Received: by 2002:a05:6a20:734b:b0:220:8ccc:2feb with SMTP id adf61e73a8af0-222ecfaf13dmr3665811637.12.1751451463214;
        Wed, 02 Jul 2025 03:17:43 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af55749b9sm14486315b3a.73.2025.07.02.03.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 03:17:42 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH 0/7] Describe the IMEM present in Qualcomm IPQ SoC's
Date: Wed, 02 Jul 2025 15:47:32 +0530
Message-Id: <20250702-imem-v1-0-12d49b1ceff0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADwHZWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcwMj3czc1FxdS3NLy8RUcwszQ3MDJaDSgqLUtMwKsDHRsbW1AKoczRV
 WAAAA
X-Change-ID: 20250702-imem-9799ae786170
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751451459; l=1973;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=+6A6wyU6zI45xM0J89Nwmzn/yIxfMgM9fnnSnd48Y0g=;
 b=r2KB83+Y4w26tgvDWJQfsbypajKxJr2qc1F1ZPIaEewOD5Q+unDAtBr8Z9FqQdMKOYcLpd1Ep
 EeMfULVm+4FAXSRsgKaNviPfZGBRwgvqOO+B4muiRYraj3C/T2HxcCD
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=Z+PsHGRA c=1 sm=1 tr=0 ts=68650748 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=EPM6MFIlYUcrubcLGAcA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA4MyBTYWx0ZWRfX6MVizBPMLx0t
 qu8FVpsIdzQNX1NqzjntxFEnUEHrDYGVsU+pT+RhC8/pM98DsaSqtrcgDRWVnxDKYAw+EcoQLVW
 1c/jFtaeWP8HD3L8343+EoJ9hXWxPoTW6hHdBcobMgo0l4tusqJfhcv4vsZOQ2E1WXRKjSnVvmd
 JQUaGGeGK8v+G9ai6Ob5QhIPrB/lf27B2uvLQU3UnJdY0k0uLo20LgqFasIBWXPqhWINrOFtoKA
 P1ORvOJQiM9qJy84xFvVDKSJYpaROX/BSWUxegW/Zuh7xIfTVawoC72ceHza+8HnQ3T3khRLclU
 6CuxP3fdHbNKmejJRSKhqi/l+pmDW2IjDNhNwg3vtvmBhSipD3JmZoP7XG5MtgWI9Jp4kBPnp0e
 Qu3Te6asQBKweez/kZdxNl5jThqS1YI4skPeXvs9qOXY19pNROMGjH4JA0o4qT+CZV9qsAkU
X-Proofpoint-GUID: kAtOU8PaRm9lHr5lxBHj8ESTY4fGM1nB
X-Proofpoint-ORIG-GUID: kAtOU8PaRm9lHr5lxBHj8ESTY4fGM1nB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=469
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020083

Qualcomm IPQ SoCs also have the IMEM region and used for the various
debugging purposes like storing system restart reason and so on. As a
preparatory work, first describe the IMEM region and susbsequently add
the required features.

In IPQ8074 and IPQ6018, IMEM region size are 0x5FFF and 0x7FFF which are
little weird. I have cross checked with HW docs as well.

Across all SoCs, only initial 4KB can be accessed by all the masters in the
SoC, remaining regions are access protected.

DT binding patch and IPQ5424 DTS patch are from the series[1]. Dropped
the Rob's Ack from the binding patch since new entries are added.

[1]
https://lore.kernel.org/linux-arm-msm/20250610-wdt_reset_reason-v5-0-2d2835160ab5@oss.qualcomm.com/

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Kathiravan Thirumoorthy (7):
      dt-bindings: sram: qcom,imem: Document Qualcomm IPQ SoC's IMEM compatibles
      arm64: dts: qcom: ipq8074: Add the IMEM node
      arm64: dts: qcom: ipq6018: Add the IMEM node
      arm64: dts: qcom: ipq5018: Add the IMEM node
      arm64: dts: qcom: ipq9574: Add the IMEM node
      arm64: dts: qcom: ipq5332: Add the IMEM node
      arm64: dts: qcom: ipq5424: Add the IMEM node

 Documentation/devicetree/bindings/sram/qcom,imem.yaml | 6 ++++++
 arch/arm64/boot/dts/qcom/ipq5018.dtsi                 | 9 +++++++++
 arch/arm64/boot/dts/qcom/ipq5332.dtsi                 | 9 +++++++++
 arch/arm64/boot/dts/qcom/ipq5424.dtsi                 | 9 +++++++++
 arch/arm64/boot/dts/qcom/ipq6018.dtsi                 | 9 +++++++++
 arch/arm64/boot/dts/qcom/ipq8074.dtsi                 | 9 +++++++++
 arch/arm64/boot/dts/qcom/ipq9574.dtsi                 | 9 +++++++++
 7 files changed, 60 insertions(+)
---
base-commit: 3f804361f3b9af33e00b90ec9cb5afcc96831e60
change-id: 20250702-imem-9799ae786170

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


