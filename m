Return-Path: <linux-arm-msm+bounces-70939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BA719B37212
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 20:21:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAFB11B20C34
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 18:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3994368094;
	Tue, 26 Aug 2025 18:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="izeZmhB5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE912356D2
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 18:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756232486; cv=none; b=LDZMHykx7W9WSnrNjWhH4st6Z9eVsBj5CP7z/wXWLzx8R91WCAUupqvGPv1RXxtOkczNg6vEAq8s7H3oxYvbPQrZGAd7O74sdrzvzRKLjQKRM1KJEBA8JY3GUh84Gs1al5VYhTK2ZSeZAIN31Br7MAjF73/uuoOxAuzoMdSrEWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756232486; c=relaxed/simple;
	bh=qzHczj72h4oQbVLmtthjacKx7xf5SfWEL8+jy/CLgNs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VRAsqu0F4dmVe33E+KsfVAO8sJPpUfdhrl1dAtRa9zr3/aJXDJiIlCzr9MmEfSyKQXmOj94iKcl1wRDvqNruZtqazsg3r0gDhcy5euGpTxTKIUvczup6qf7KmyiQzKzHTHoZZ0pvBD9cK391/N7lp5oiHbTMmkm1LIrVhQsuFo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=izeZmhB5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QHLHOs028015
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 18:21:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hPe0HyPY1257DHhbwG0Jod
	JXNJ2pFH3pGUWzM9Lk8eg=; b=izeZmhB5S/2lNjXv9zVR031HQw8TcVAcQoY5nb
	M2TCeDynyI8UGRkrt3pOK5LnFpxXHXymsGXyBjNATsL30XQGd2ysv0pExRbMYdfu
	4ShASPMQxdOaHEGrjgEBdZAfzt9DoPPtpPAMwx4NaTYu4zoeQgE/HSvqFSTDcp45
	o8YG9myaS1Q/Nr4sr12KmpXNIzb02ZmHUADwdkNZIM6Gk5kCKHxXML6pZVuy1Obk
	wPD1PiSLSDvLgEO4FGZYJkhu+WIkmZwd8qPGPxe4fdF8C96kOXTnTIoBaFGzqHlZ
	CBdny7iZn6ERBAsfHpB7OnWzKAUMbGQ2DoxIKWStNHEcvu4w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48sh8ag6aw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 18:21:24 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-77053dd5eecso5548968b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 11:21:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756232484; x=1756837284;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hPe0HyPY1257DHhbwG0JodJXNJ2pFH3pGUWzM9Lk8eg=;
        b=GjGVInJSCKgZSZA61+XtIOIONosasHH8oE4pcv0v7P0WZv7BTEAuR+pPUgNCHnsSB/
         10Uo8YYqoIFztt+4UPi7X7YR0zCAF0ouALBxcXO8fQMblLskRlTYwAaNBc2RM5Nk+rg+
         C2jkbyYus84guMv0+zy5qRHznqhnVzQHpQaSNwEMtmRzGdF7EhafoAy0dZ/JjPlPlIQ3
         fvGPhHXeAMQ9M9tK1OuudftjQGFcf5E8nIK28GIGbv/yxVI7mR8CYGsQvcns8fkDfDZu
         1eqBjCl+fBwkpl30QHu+2mk7uHdsNwf2NQ9LLDTbcSDNM/E4eQqfBrXQNoFo4yvdrGIJ
         g8kQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0ZhEo/sDTpRDrbUlK8rzGn9oeXboZ4WG51F5mWIUUgwbibnbTlofWS4OscyaBtuolcg2AXERlzsL7x0dQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs8ngyD3UYIQOOOxC+RNKyG3CCqUvz6tyWKSM9PVrz5v2Q8OwB
	bQ1VFIYOd68Ui0B6mEz03vgIbeh6Ftmlk+taAFEonYXlQkoHxSYUjwd3P8UeSK/hsY3bkJSejg1
	7RyutHkxwgYwPrNZiF67skfZh0b/KZLYWMo01IsgI4AJzT4pb2gxWJ7mkCPcrfbBxYfW/
X-Gm-Gg: ASbGncsgkKxpxpzTV53/rUH8tog1vkXZTqkhFGNOhD9KuKpTjr8sd9V1Xc4yivKw7bn
	dQaxgyaIUfAw5w+fsoLoIog+mXByQGydxBjZn5oGhD9+4HDPIdjCPgcvNs90rlfHoXTTC8YNYPy
	Sm3ES7L45CCF/8V7uvG8evN3zB/gXrpJ7luKLAF31eGYkLmphICy6JdVU0sW9/rm/olcXYQ0UNK
	rSGTqBZplDaBLmSVYItRlWVoOszl3MJoyCS4pGF0epokpVHgEdh9Hmxp/Ka0D0g1OglzA5UUp66
	HpeHHZvmFzFuKWHZ71A1e0aeOKQ3T/wwipe1s0eOEjozg83t0sCAZ3cRnhFUUziESjj2
X-Received: by 2002:a05:6a21:339a:b0:240:7ed:402d with SMTP id adf61e73a8af0-24340e1c3b3mr23574476637.31.1756232483777;
        Tue, 26 Aug 2025 11:21:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCUTgs+xlc+QQ+t40ZnsGhICVfnXPMX4kzaNskevdgCEI9w2BTmLMj8s+bCulNJADhimXIyA==
X-Received: by 2002:a05:6a21:339a:b0:240:7ed:402d with SMTP id adf61e73a8af0-24340e1c3b3mr23574443637.31.1756232483259;
        Tue, 26 Aug 2025 11:21:23 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77048989fe6sm9881803b3a.51.2025.08.26.11.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 11:21:22 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Subject: [PATCH 0/5] arm64: dts: qcom: lemans-evk: Extend board support for
 additional peripherals
Date: Tue, 26 Aug 2025 23:50:59 +0530
Message-Id: <20250826-lemans-evk-bu-v1-0-08016e0d3ce5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAv7rWgC/x3MwQpAQBRG4VfRXbt1R6PkVWTB+HHD0Eyk5N1Nl
 t/inIcigiJSnT0UcGnU3SeYPCM3d34C65BMhRSlVMbyiq3zkXEt3J8MJ6Z0sFIJKDVHwKj3/2v
 a9/0AhZSuDV8AAAA=
X-Change-ID: 20250814-lemans-evk-bu-ec015ce4080e
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: kernel@oss.qualcomm.com, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Sushrut Shree Trivedi <quic_sushruts@quicinc.com>,
        Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Vishal Kumar Pal <quic_vispal@quicinc.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756232476; l=2170;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=qzHczj72h4oQbVLmtthjacKx7xf5SfWEL8+jy/CLgNs=;
 b=4ggj8MHSr1SwbKvJXc1FvZJaW3gg4AdmaisjjsdsQJeAJ5meP6HPjvSkkegHG04U0Ef9SHmRk
 Zpnr/9l7/v1B4IPhxeVXCNxvwgMo0ERudBzuwcJ0s6NCzdT/FN0Vzq8
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Authority-Analysis: v=2.4 cv=cLDgskeN c=1 sm=1 tr=0 ts=68adfb24 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=TdWL2oi4fdni6beYElwA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDE1MyBTYWx0ZWRfX+DxjplZOpY1t
 CCUR35em2EUZch1N/lTkUHai2m64VGV6+jfuT8D1YkevWcHJDrJRpiAHUevOTSu9LzxldyH31m2
 8tHg6OTyux/CBC/g0UzHs27USxr2ps30MY0TC9TTKgnt4D5TbIB86rkVIFDifa/EfXlw7KfR5zI
 zu/bg+3YVEApi61a4XJopc93ReDBhPoJzqePmqUBzAFUi8M0IvkB3HF+e/lbjwvF2TbJpbQ/swr
 vhrsO+1mXTNyC2flTmcYPy38xN6zvza0Qj75Vmj4b84eUZuG1QJ5s/SgXH9KHcmF11Dr+XP19RD
 fQIS4ai4lcx2ADyTUnLggkfFlzabK5H1w7ozmLlWhxo6PSXwLkyxoegBH7r46o5Jq9D33TNZ+6+
 pmQhz49q
X-Proofpoint-GUID: eiNMP5s2asAhHNT-dyQLLVw5hq4_m8NO
X-Proofpoint-ORIG-GUID: eiNMP5s2asAhHNT-dyQLLVw5hq4_m8NO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508260153

This series extend support for additional peripherals on the Qualcomm
Lemans EVK board to enhance overall hardware functionality.

It includes:
  - New peripherals like:
    - GPI (Generic Peripheral Interface) DMA controllers and QUPv3 controllers
      for peripheral communication.
    - PCIe HW with required regulators and PHYs.
    - I2C based devices like GPIO I/O expander and EEPROM.
    - USB0 controller in device mode.
    - Remoteproc subsystems for supported DSPs.
    - Qca8081 2.5G Ethernet PHY.
    - Iris video decoder.
    - SD card support on SDHC v5.
  - Audio change [1] to support capture and playback on I2S.

Dependency:
  - Revert commit b5323835f050 ("OPP: Reorganize _opp_table_find_key()") to
    avoid regression introduced in linux-next (20250825).
  - This series depends on the removal of partial changes from patch [2],
    which are now part of the above commit and are causing boot failures as
    described in [3].
  - The ethernet PHY QCA8081 depends on CONFIG_QCA808X_PHY, without
    which ethernet will not work.

[1] https://lore.kernel.org/linux-arm-msm/20250822131902.1848802-1-mohammad.rafi.shaik@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20250820-opp_pcie-v4-2-273b8944eed0@oss.qualcomm.com/
[3] https://lore.kernel.org/all/aKyS0RGZX4bxbjDj@hu-wasimn-hyd.qualcomm.com/

---
Mohammad Rafi Shaik (2):
      arm64: dts: qcom: lemans: Add gpr node
      arm64: dts: qcom: lemans-evk: Add sound card

Monish Chunara (2):
      dt-bindings: mmc: sdhci-msm: Document the Lemans compatible
      arm64: dts: qcom: lemans: Add SDHC controller and SDC pin configuration

Wasim Nazir (1):
      arm64: dts: qcom: lemans-evk: Extend peripheral and subsystem support

 .../devicetree/bindings/mmc/sdhci-msm.yaml         |   1 +
 arch/arm64/boot/dts/qcom/lemans-evk.dts            | 439 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi               | 124 ++++++
 3 files changed, 564 insertions(+)
---
base-commit: d0630b758e593506126e8eda6c3d56097d1847c5
change-id: 20250814-lemans-evk-bu-ec015ce4080e

Best regards,
--  
Wasim Nazir <wasim.nazir@oss.qualcomm.com>


