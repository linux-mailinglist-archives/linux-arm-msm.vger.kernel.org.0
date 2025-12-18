Return-Path: <linux-arm-msm+bounces-85648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA56CCCACA3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 09:10:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D2E8630133D6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 08:10:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A05F62F0C48;
	Thu, 18 Dec 2025 08:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gtifw28w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BzDUdPfh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62A62EBDDE
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 08:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766045446; cv=none; b=KbJPPxm3QkDj2eOGbWK8S6asiYYpVv0QcQ1hFNLp2MraBS3+mdHocatHPrKns0gJSrurIjAvxHX1zli9KkXlNXR6NkGbe3AqrWANOrrSzVSafnaDePRJlX8jqMz1uzl48M/Ymgl4PvU97TAloAzsbaBsjelp4V47y4WrVARbapQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766045446; c=relaxed/simple;
	bh=ejOs6bkbsY8Vz8EZH6d+LncDHIbxehlNOId5lq1k/tU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qJisVE0YpRqLR4LhN0pimLieGGI2AI/4MdePNwbLG3V/aJbjs4DEPs8DLksOTE307R5qBzEvsxeiqIxSB5LNBb849hzt6xZJ5ON5bdCo1gyBEDIkVDjuGBCG7Tmgo/CNnLGFkJAppUNHRxY0Lbq5Yj0WimEhcZjyUoZsVfLefxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gtifw28w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BzDUdPfh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1YTkM237442
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 08:10:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TCHXjv2VZsMwfFYNwJEOSh
	lKvgPdJRBzvcTy9Q4p/48=; b=gtifw28wKHhjmAbOFS666sg0d5Bpp1uSh2lNJD
	KMO5vt5rl9ugqqMhvXO08Cft9Hpcf6FRaY14u9xDXuc+zEY6hBJ/BDJyoHn1p4NL
	j71Iam1DysGrw1oqXDjGn+PH0VpKkMkY1Z90lTyBcxgm3zNqV7UglTyytZIWInwj
	2FpcLSt+t1ADTohBsxnaehtpLPhesLYGmMvpcm4cevt4YOZdSRqZJLOJfEM9ghpw
	fCbOMiN+pkmm1hlWLdDk3ct/7L0VnkdIWf0khexKtePrlU/XQHiARZeT4rvULpUT
	/i7KtxRz6bQaC74kH9T0HZEkizyuQ5wFms2wX/LqFzCI9PdQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b44x3hfyh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 08:10:42 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29f13989cd3so11735915ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 00:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766045441; x=1766650241; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TCHXjv2VZsMwfFYNwJEOShlKvgPdJRBzvcTy9Q4p/48=;
        b=BzDUdPfh014QqpBFtnSxLdqadpEADcZm2pmeIZKODfXbpRsKXuRgxeB1XzsN7hb3dC
         DUsuTX1SRFWf9r+SXLbFekFkEuTMP9Z2bCZ8omxi7ldmkQigB65W5oESX5Y8bHrgV948
         Q7WgiBQsV3X0TpZhfpSExufYWiFVIc5SM03zqMkvx31Hl3TlykTE+LMnwnwhwS0shylr
         nNHMZbyE/d1B2LtqnbC8irCpc8YOM66QeY8c69l39tyzFEUrNplqdOW4i3F9jKx/kyBw
         DWRkDZdRiVJxmmoeCP3/y1mUxXq1lsYWwRRPNJGnDrZoW+n6RraE140fiN4Wy3N/CNoY
         f5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766045441; x=1766650241;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCHXjv2VZsMwfFYNwJEOShlKvgPdJRBzvcTy9Q4p/48=;
        b=Ftx2lKWOIyEe7+X8iKKqVp4cJOTDn1NLCXWzyPYV67Eb4itBRK1UplpOiAiRLKRnIF
         TVM5Ln55sHUmuvnjI5SmJe1j2gmZnd58QyFIiwHEj5mZMnTxmhoxsXTNkqpejYZ77yMV
         99bel/zKW99xu6OCJzf/+RMWqG0ywT6fKE1N/efhEDmxx2tz6exH/ENOkpvzbu7jtCJY
         0zjomlWlQINITF+WeZe0lk7zvCE1UAh70ChGFXGGmO2cPAEM2pbZcbjn5kNnde38eSdZ
         su6eoYwJk2zC7KetmHA9M6siRP58gwm+aLJFT4qRTh6dymJ3pFleNNsUu5quNChqENk5
         TZow==
X-Forwarded-Encrypted: i=1; AJvYcCVQC0xk1DNP2cW+xBwWvNmA9Hwbjt6SkCH3xu3k7ELrCNsNR3M9k3jVPsxhN4qVCDGLmfz9z9s7sljhBUt0@vger.kernel.org
X-Gm-Message-State: AOJu0YwwuDTOq+5BDsLqeb3DLRe9I/VEE+7CCZQEN769f1TPMg989VbE
	GPySaPuZ23sWC55nUNEhZqaYqvgv3dKJDHGHEzAQ7dw96YmjzL6/y9l52ueGdMfo3ftMcHeAIzG
	HRs7LqrdrNfdwD7m6Wzgd0EkgloBoGBLT7pdJNk6rI2bnApmPR99V8+DMmJ2NKVuVL653
X-Gm-Gg: AY/fxX4weXEnuOrjFk3Ofa8yIBvFycGVtlh+CbPaVgvANi+r7ZTR2XXW4FhTj9XV5W5
	gfJ4tE17WeXP1CwluJVgLB8WKOnE3h5optYBiyd+Kogr4DuVBRV164/eIieX+BYrzx2BH9DI/ru
	77oWMhiB59UH41Qqz3/3LE+ne2Wh0hAavSvcptN5XUhqzEoa6eJyiegHIzNw1aVPFCuEQ3miyeX
	TiRp5PS+fiucwYSzJfeXPdOh51xK15ZcwEaEkvdZ0GWJ1Eug0PpYWVtkGYz9i9pIgTzIXLeB1Qw
	oUWch9iU6UBQpClyu7UxS8cGxkQx8GWolEpy+C/NhKK1z+ZY2B+FUYuMovsy9/BQNRa53b2lV/R
	YQvp5jtfoplNSKZWWIFG34rLIdmu+8gjLgvSgrQKxnMroS6pKBo4Iq3hBrNQAdKLGDv4=
X-Received: by 2002:a05:7022:4581:b0:119:e56b:c762 with SMTP id a92af1059eb24-11f34c435c7mr17362402c88.39.1766045441102;
        Thu, 18 Dec 2025 00:10:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEuYMGTp81NLT+B4cET/exVbTTF3Y5dVTJDSM1G5/qDqcjwsi88g0t8I+546Kb64PBfRSO7jw==
X-Received: by 2002:a05:7022:4581:b0:119:e56b:c762 with SMTP id a92af1059eb24-11f34c435c7mr17362354c88.39.1766045440454;
        Thu, 18 Dec 2025 00:10:40 -0800 (PST)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b04e58d423sm2564824eec.6.2025.12.18.00.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 00:10:40 -0800 (PST)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Subject: [PATCH v2 00/12] coresight: Add CPU cluster funnel/replicator/tmc
 support
Date: Thu, 18 Dec 2025 00:09:40 -0800
Message-Id: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMS2Q2kC/3WNQQqDMBBFryJZN2KSppWueo8iItOxBjRJM0Zax
 Lt3Kt12M/A+/79ZBWFySOJSrCLh4sgFz6APhYCh8w+U7s4sdKWtqtRJQswtjJlmTC2EKQaPfm7
 jJAGtqnsuHY0RPI8Je/fa1beGeXA0h/TePy3qm/6k+vxfuihZSaOMtR3YugZ9DUTlM3cj16aSj
 2i2bfsA4vEq/ccAAAA=
X-Change-ID: 20251016-cpu_cluster_component_pm-ce518f510433
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        maulik.shah@oss.qualcomm.com, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766045439; l=5996;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=ejOs6bkbsY8Vz8EZH6d+LncDHIbxehlNOId5lq1k/tU=;
 b=A2enXks82ZeVTKrJJRlTtv7jUD0gAgfNpcuVx2nZoiIaCK4V2y2M5wmxQDrVaMQjFy5ydmz0i
 ixR/yLK/uwkBgdL4n5CJJ/RblbW1X6439cLS6Yun0gtR13fA95nrPbO
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA2NiBTYWx0ZWRfXx/Vot4PBSolb
 NGptJWas47dyLfAFIirNyU9FV3VHGf4UiLX5ZHU7WOwum5uAJ3E0pCMGpZDsXnQpSIPuCy22kuu
 LMGZE/k0Lm5/8Zq4gPKTC+bmz14tBxlaoussr0b1qeNAs9SyRsbGqurzq7MuCf2GnU/tRXIprUW
 No/A7vMzubbttke06zVq6ygT4qSRu2d0TFy3k0nBaIvEvREUi81ieNT/evAm02LdccXTdqxYX9e
 j3YBotF8VkUBAznoYUvXkzr+niI56FY5mk/yZaG7jx62/SDlxs9qUvupAyAh2iildc4xUbwBT7a
 nzEQG3KoUVCv2at1B9SahfIVPrt4ggCjWaLE+/az7xTANbDTcDqeDqV/yETUaTK7GfxVyYu86de
 O5NdxFq3Tv1D5/BnQCk6V6hskHQWRw==
X-Proofpoint-GUID: H38n3j7gpisiCKsLGC0oNCBe1__KZZbx
X-Proofpoint-ORIG-GUID: H38n3j7gpisiCKsLGC0oNCBe1__KZZbx
X-Authority-Analysis: v=2.4 cv=Zpjg6t7G c=1 sm=1 tr=0 ts=6943b702 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=5LP_gHFhwREuHdR0VuEA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180066

This patch series adds support for CoreSight components local to CPU clusters,
including funnel, replicator, and TMC, which reside within CPU cluster power
domains. These components require special handling due to power domain
constraints.

Unlike system-level CoreSight devices, these components share the CPU cluster's
power domain. When the cluster enters low-power mode (LPM), their registers
become inaccessible. Notably, `pm_runtime_get` alone cannot bring the cluster
out of LPM, making standard register access unreliable.

To address this, the series introduces:
- Identifying cluster-bound devices via a new `qcom,cpu-bound-components`
  device tree property.
- Implementing deferred probing: if associated CPUs are offline during
  probe, initialization is deferred until a CPU hotplug notifier detects
  the CPU coming online.
- Utilizing `smp_call_function_single()` to ensure register accesses
  (initialization, enablement, sysfs reads) are always executed on a
  powered CPU within the target cluster.
- Extending the CoreSight link `enable` callback to pass the `cs_mode`.
  This allows drivers to distinguish between SysFS and Perf modes and
  apply mode-specific logic.

Jie Gan (1):
  arm64: dts: qcom: hamoa: add Coresight nodes for APSS debug block

Yuanfang Zhang (11):
  dt-bindings: arm: coresight: Add 'qcom,cpu-bound-components' property
  coresight: Pass trace mode to link enable callback
  coresight-funnel: Support CPU cluster funnel initialization
  coresight-funnel: Defer probe when associated CPUs are offline
  coresight-replicator: Support CPU cluster replicator initialization
  coresight-replicator: Defer probe when associated CPUs are offline
  coresight-replicator: Update management interface for CPU-bound devices
  coresight-tmc: Support probe and initialization for CPU cluster TMCs
  coresight-tmc-etf: Refactor enable function for CPU cluster ETF support
  coresight-tmc: Update management interface for CPU-bound TMCs
  coresight-tmc: Defer probe when associated CPUs are offline

Verification:

This series has been verified on sm8750.

Test steps for delay probe:

1. limit the system to enable at most 6 CPU cores during boot.
2. echo 1 >/sys/bus/cpu/devices/cpu6/online.
3. check whether ETM6 and ETM7 have been probed.

Test steps for sysfs mode:

echo 1 >/sys/bus/coresight/devices/tmc_etf0/enable_sink
echo 1 >/sys/bus/coresight/devices/etm0/enable_source
echo 1 >/sys/bus/coresight/devices/etm6/enable_source
echo 0 >/sys/bus/coresight/devices/etm0/enable_source
echo 0 >/sys/bus/coresight/devicse/etm6/enable_source
echo 0 >/sys/bus/coresight/devices/tmc_etf0/enable_sink

echo 1 >/sys/bus/coresight/devices/tmc_etf1/enable_sink
echo 1 >/sys/bus/coresight/devcies/etm0/enable_source
cat /dev/tmc_etf1 >/tmp/etf1.bin
echo 0 >/sys/bus/coresight/devices/etm0/enable_source
echo 0 >/sys/bus/coresight/devices/tmc_etf1/enable_sink

echo 1 >/sys/bus/coresight/devices/tmc_etf2/enable_sink
echo 1 >/sys/bus/coresight/devices/etm6/enable_source
cat /dev/tmc_etf2 >/tmp/etf2.bin
echo 0 >/sys/bus/coresight/devices/etm6/enable_source
echo 0 >/sys/bus/coresight/devices/tmc_etf2/enable_sink

Test steps for sysfs node:

cat /sys/bus/coresight/devices/tmc_etf*/mgmt/*

cat /sys/bus/coresight/devices/funnel*/funnel_ctrl

cat /sys/bus/coresight/devices/replicator*/mgmt/*

Test steps for perf mode:

perf record -a -e cs_etm//k -- sleep 5

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
Changes in v2:
- Use the qcom,cpu-bound-components device tree property to identify devices
  bound to a cluster.
- Refactor commit message.
- Introduce a supported_cpus field in the drvdata structure to record the CPUs
  that belong to the cluster where the local component resides.
- Link to v1: https://lore.kernel.org/r/20251027-cpu_cluster_component_pm-v1-0-31355ac588c2@oss.qualcomm.com

---
Jie Gan (1):
      arm64: dts: qcom: hamoa: Add CoreSight nodes for APSS debug block

Yuanfang Zhang (11):
      dt-bindings: arm: coresight: Add 'qcom,cpu-bound-components' property
      coresight-funnel: Support CPU cluster funnel initialization
      coresight-funnel: Defer probe when associated CPUs are offline
      coresight-replicator: Support CPU cluster replicator initialization
      coresight-replicator: Defer probe when associated CPUs are offline
      coresight-replicator: Update management interface for CPU-bound devices
      coresight-tmc: Support probe and initialization for CPU cluster TMCs
      coresight-tmc-etf: Refactor enable function for CPU cluster ETF support
      coresight-tmc: Update management interface for CPU-bound TMCs
      coresight-tmc: Defer probe when associated CPUs are offline
      coresight: Pass trace mode to link enable callback

 .../bindings/arm/arm,coresight-dynamic-funnel.yaml |   5 +
 .../arm/arm,coresight-dynamic-replicator.yaml      |   5 +
 .../devicetree/bindings/arm/arm,coresight-tmc.yaml |   5 +
 arch/arm64/boot/dts/qcom/hamoa.dtsi                | 926 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/purwa.dtsi                |  12 +
 drivers/hwtracing/coresight/coresight-core.c       |   7 +-
 drivers/hwtracing/coresight/coresight-funnel.c     | 258 +++++-
 drivers/hwtracing/coresight/coresight-replicator.c | 341 +++++++-
 drivers/hwtracing/coresight/coresight-tmc-core.c   | 387 +++++++--
 drivers/hwtracing/coresight/coresight-tmc-etf.c    | 106 ++-
 drivers/hwtracing/coresight/coresight-tmc.h        |  10 +
 drivers/hwtracing/coresight/coresight-tnoc.c       |   3 +-
 drivers/hwtracing/coresight/coresight-tpda.c       |   3 +-
 include/linux/coresight.h                          |   3 +-
 14 files changed, 1902 insertions(+), 169 deletions(-)
---
base-commit: 008d3547aae5bc86fac3eda317489169c3fda112
change-id: 20251016-cpu_cluster_component_pm-ce518f510433

Best regards,
-- 
Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>


