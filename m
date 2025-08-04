Return-Path: <linux-arm-msm+bounces-67617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11534B199E5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 03:37:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FEF01747D2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 01:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18D021EE02F;
	Mon,  4 Aug 2025 01:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HKgnTZ4y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDFB632
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Aug 2025 01:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754271468; cv=none; b=k0t51s1m3+BgorkWonsMD3yyB1Zf1lwhbNuOkPo7Wpc/OUHec1iFgXQjL0tLkSJkNEpdTkMHQNUidrvrzKbzUpaV2uhcLqLTkQuyh2WAr8vF9Rkf0A4Aw205AL98omZh4Xd39u4hdMBl/qDlLLzpL6KSJRrdwy0MVUMCV7dTqzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754271468; c=relaxed/simple;
	bh=B3m27CiiP8VRQK1H6LDGR07T40ERxpt+CuirW/DrWrE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ICT8FGgibXVBY7ZQeYQvFa7IqmgkDuMBGIgmhm7wi3mMMuKE0CRl8A64DRbIJLpWsfB6V6Q8bq3ZJEM4ddc/Nmn6T60OhnesUj2sXH/VwFeqvZo6aTmNm/KYovyUHBIEOheu/iLjJrvC1P8TCY7qGGFeIbxyHZsjzJF8M6s2vYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HKgnTZ4y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 573M0hx7005890
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 Aug 2025 01:37:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SepGJpcxl/2BRlRzhP0GAG
	KSumIK8J4ufDmvTazrW5E=; b=HKgnTZ4y2fXUW9ELUPtvxDpGUfymUM0Aq+Rqxp
	Ybb/iN2YWqF3VXXmqUZqd4HWcjhUMwFySEvcc78bgp0wRVHeP4qlivCj4+/eWXLu
	RPdMjynkWpwZufNWFBqU/FWG1FMGkw1pYXk6/6Or0VycIl9b/nXNzPno62FUwMrM
	alidM/mDdZnaCtDnKQzlPWas7/09sqKGaNW/ODQKpMt+FZRAeslEhxvqS1fqR8vS
	TPkciEsumcIXY9varJpEl0ukrShA9CRG0Hliq0hR7ysO7JDWY4NRGM0ZzLjTguLN
	1A4snMnW3yCqqlxdYq2o4wm8JXZhVLrxokP9YvVCXwKptLzw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489bek32nd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 01:37:44 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76bfb082331so741228b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Aug 2025 18:37:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754271464; x=1754876264;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SepGJpcxl/2BRlRzhP0GAGKSumIK8J4ufDmvTazrW5E=;
        b=PsyzPT8YLGUdOvyb1H64cJmSmrp4RitpITYV+o22Ay04CerTW4sWKzv7QvIj0pW9rY
         GnQXwMitTTcH2h7BtHctIUKcY9DQDVRHFXRf9fcMsaDEIw8C4DbbfkrIKGMz1WGyUAKW
         RL7LQ4an376XwnBDQlHpG1Y2LfEguStPCKwXx4Ck28P4PBDglYp7f0KcJD87xjkc8xrc
         mI95O3ou5KZDdFr4fTKwOZnp9RuplRZAZOYrar90bAS/uQT/Bk+cajUO2Om9zOeOVvbS
         WyJ7ggzShLGptO45l/WfurSOPD80v9l0r6wPue4FzFlcf9wN/Q1CFCUDQyvxKVhwysN0
         JEqA==
X-Forwarded-Encrypted: i=1; AJvYcCVaGoHh2e80qzWtmS8jEKKHIJCWJr4+tiXdfruR+SIH75+X86D4z2v4Eyu5zVWC/XR6zeOcrJHkdaGqOJkU@vger.kernel.org
X-Gm-Message-State: AOJu0YwV/dniYRkDDfmLs0Gkv4u49xaKl99b4l7UlNi6mYlZ1T4/ofLU
	lXkGCZnk2/g9BdaUfbM2YI88jkQSKJjFqyYcXISulJtPqTt6SbtWxcuJQ7uERu9ix2w0f7M5bXF
	DK+DPUm69LkO/Ff03yZx91CLC0N+oiP7UZMP0aGaTf/COJZF97fS6iwD5Hrcl8dOKxzxX
X-Gm-Gg: ASbGncue1ZKCLzdqqPbC2pSTIafLWONjBu6Xu3SkyIJJa+jg9TlnJXjiSiJItvCvZ69
	evZJlcPE9/RtYEu1Bd6fSm74Fv3vSQoa1VARXwZdrDoGaxnI+d7U6yVYfuGy8o7ugyKb1LLUnq3
	0VUSufde7EM6649QIXsm4mHZvySvYcHMtCAEFd+g98Yggd7f5Pdy1GmB4qfIiRv1RJNIMr+ZoUw
	BvOwHPfKCIb1IMsLReeXYbyfxKtFwKCZ/qx1DRQWuVhHVvwyeUzSlzjrskhifmugEH0HuZA5MiI
	/pCpbRg30+oxxTrG3EIUex11lNf+tHYUJSb5kNeEiFnLob1RvAkG+TG/l3RR+5y9N71eErckUVa
	13n1AsC72yrRDF59PcMvxxxfqFj6+P4eZAQ==
X-Received: by 2002:a05:6a00:80e:b0:76b:f8f5:2806 with SMTP id d2e1a72fcca58-76bf8f53e1dmr5166739b3a.22.1754271463808;
        Sun, 03 Aug 2025 18:37:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzqIda4I7Rw+UA0O+nZaklPEC5+gBpGLm5UMLjfYkRfEXYGDLgTVDDxilFiEIZt1r0+n890w==
X-Received: by 2002:a05:6a00:80e:b0:76b:f8f5:2806 with SMTP id d2e1a72fcca58-76bf8f53e1dmr5166710b3a.22.1754271463379;
        Sun, 03 Aug 2025 18:37:43 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfd8ebbsm9208626b3a.102.2025.08.03.18.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 18:37:42 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Subject: [PATCH v4 0/4] Initial support for Qualcomm Hamoa IOT EVK board
Date: Mon, 04 Aug 2025 09:37:03 +0800
Message-Id: <20250804-hamoa_initial-v4-0-19edbb28677b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMQOkGgC/32QYWuDMBCG/4rk81KSi8ZExtj/GGOcSZyBqq2x0
 lH63xfjPpTW9UvgyL3PPXcXEtzoXSBVdiGjm33wQx+L/CUjpsX+21FvY02AQcEky2mL3YBfvve
 Txz1lxpZMSFtCyUnMHEbX+HPifXzGusbgaD1ib9qFksJ/faM7nuK4aW1eO83QdX6qst6dJ5pGl
 iJxOxcCJpkqe10/IKfdMDvq7IG63h4G30+BzpwKKg0WUisOSqj3IYTd8YT7hb2LzxtZxFofpmH
 8SXvPPBmsWMbvVoxERlGUti5knRd5/UBcBNcwl1vhRjaFZY1GLsVjeLGZ4dbg/sgzRIhQIPPcM
 kCLTwxgM6x5zZhRCizn/xiIGwNe3ENEhJQNaIUFGJD6mYHeCismHdNQKm3NhsH1ev0F9URyGIs
 CAAA=
X-Change-ID: 20250604-hamoa_initial-0cd7036d7271
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Yijie Yang <yijie.yang@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Yingying Tang <quic_yintang@quicinc.com>,
        Shuai Zhang <quic_shuaz@quicinc.com>,
        Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754271458; l=4095;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=B3m27CiiP8VRQK1H6LDGR07T40ERxpt+CuirW/DrWrE=;
 b=k4Zx9u7dJi6nQYYLlMZ9vUmgGAGApZM5gdMwopxyhVWVpc0fswbpQp7GjMOHs1u9BKBL/IRNn
 xPLdg5HQgmECIet9PX6+RJRQsey7JnrsqnLhUDvRyogl4FOx035qE64
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Authority-Analysis: v=2.4 cv=M7tNKzws c=1 sm=1 tr=0 ts=68900ee8 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=gWuG99rYYzh1ZzfbfFIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDAwNyBTYWx0ZWRfX9MkUlbpevNqI
 KHtTA7bWmoQGHAOZu+4SFEi3jYH15VuEVEJSBxxo45UcpqDkXGab5M+2m0l/liNRgJvCEkTz38v
 SiIn6Klkvy9INAXB4rXTw26bGzfRxk116fW2mwMMVQ+UxOEVYBqYloG0UL40Uk95wQbYhxNe2nz
 G0niNVImKjDkRwE9yTXtK/2sJARfuDG4BnZeaviY5j9vJwEbjXUVZ4G/e+5bHcFCO0bH//k/DYz
 M9qBAehs4eTcmpfIcVMRtKasy4bfnq10SO67ibMbD90C1cKJkayi/YSDNiEAusxks/x0LPOsqhq
 57u7WjxcfyQg41VZVUgc2RSItN1beU+O9OKv+tgubvEcdEQuHnKu0vX3/UlGIu/o09yH7Qy594G
 mIIvQqoT7C4ztHcA8SQ2/MYFvr5tSj7+XOGn1C7mlhDjw6oh8QAcE11Y7mxtfJ6OOhB4Mzhh
X-Proofpoint-ORIG-GUID: 7KcnOYvqsNrgnLgtYfuSDF9b-5iATQbU
X-Proofpoint-GUID: 7KcnOYvqsNrgnLgtYfuSDF9b-5iATQbU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-03_07,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508040007

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

DTS Dependency:
https://lore.kernel.org/all/20250724-move-edp-endpoints-v1-3-6ca569812838@oss.qualcomm.com/

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
Changes in v4:
- Update commit messages.
- Update base commit.
- Update the format of the node mdss_dp3_out.
- Add comments to clarify certain nodes.
- Update the configuration of regulator-wcn-3p3 from regulator-boot-on to regulator-always-on.
- Link to v3: https://lore.kernel.org/r/20250729-hamoa_initial-v3-0-806e092789dc@oss.qualcomm.com

---
Yijie Yang (4):
      dt-bindings: arm: qcom: Document HAMOA-IOT-EVK board
      firmware: qcom: scm: Allow QSEECOM on HAMOA-IOT-EVK
      arm64: dts: qcom: Add HAMOA-IOT-SOM platform
      arm64: dts: qcom: Add base HAMOA-IOT-EVK board

 Documentation/devicetree/bindings/arm/qcom.yaml |   6 +
 arch/arm64/boot/dts/qcom/Makefile               |   1 +
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts      | 988 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi     | 609 +++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                |   1 +
 5 files changed, 1605 insertions(+)
---
base-commit: e5955126d3836714f2071a86329e682e3f75872b
change-id: 20250604-hamoa_initial-0cd7036d7271
prerequisite-message-id: <20250724-move-edp-endpoints-v1-3-6ca569812838@oss.qualcomm.com>
prerequisite-patch-id: c536bf9ec7fd22af9b05b695272997615dfd675f
prerequisite-patch-id: d513e5a08d3be585b9b6a737ef3a1ad275d7caad
prerequisite-patch-id: 605ef6f89dd84f810df11be9d11ee6803a6bf289
prerequisite-patch-id: 2ab2430624acbdd9011f6c0c2a77469fd19fc75a
prerequisite-patch-id: bfbb562513763ce75f2bb5da7f12e7b54ff3919d

Best regards,
-- 
Yijie Yang <yijie.yang@oss.qualcomm.com>


