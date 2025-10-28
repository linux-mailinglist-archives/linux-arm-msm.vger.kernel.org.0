Return-Path: <linux-arm-msm+bounces-79104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C81C13246
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 07:28:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2040B4EE95E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 06:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AB3A2BDC03;
	Tue, 28 Oct 2025 06:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dzDC5idH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36BD29B20D
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 06:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761632896; cv=none; b=QyAfbC1lmWnpNoS7jjp47K1sMOvkk08iGDk1Wev4HOReKyadt3n/lWrF4uVjvt5ZU7CCuCnTD82SKqUyaT1hZo4+Q2djHWoEFnZX2gExpbuvcP+7PvNezNj1P8D4sb6s0FhOSHWFCycDKjvMP/QS3ZIRO3hpzV/XJgEAR+IkLvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761632896; c=relaxed/simple;
	bh=6PnlglbBdA+sT72qw9FSQQcvFbM5sLJUf0oCBFAlNsY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=M0H/UCODBbFplDcDiXRsxjtQ29a87aN0lbJwQ7oscPe9YCB37wgfy/iOiJ7oxU6kBoxaM5nrY26IZYEaIU1DulPRzilHXGmwz5Y0wP+aNa+SwSBznOblAjDjXWEQnreB1zjs7uEoeHMDxJ++vCyCoZO6CVOdnSjHek+1PqOpwPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dzDC5idH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S4p71R591588
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 06:28:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JLnYbqr9msvD1/79xuZ9kB
	CdhSNS4ncRjKXElM3L+tA=; b=dzDC5idHe0Jxo91n7QH8zNFdFHQw4ZgpsTIOv1
	Q0pHCZGi+FzlQQjUK26QRIxsY2drrWPIF9SSqFmZfy35UpyYFD73HJgs4t8l6m1n
	pZ4Vl8O5xqLJgoyNbaK7wtluIydB0eroX4WqEK+3MSTv+01ZyzbbwmjTQeet2kmp
	YVMEQxWppgkrKtzf8rM6mPUqz1MdoRAW8qPiUK52qSlEB2aCMsVjM9PGjV0HSqUu
	zV9i5BvMYbt4xizCzFcsSkfDxhqnzJVQNzCcC8P0KIntjd1/M61Vs8921aL82YZ9
	IJs24ENyZtBkKdt34z3hUcyEwFlsl4G7T9VbqoO2aY2ALBSg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2q5u87fv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 06:28:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2697410e7f9so145480325ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 23:28:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761632892; x=1762237692;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JLnYbqr9msvD1/79xuZ9kBCdhSNS4ncRjKXElM3L+tA=;
        b=E7tsqMt5bP4X6yo3pFUdFSIcMn6YJmI8uJlSzzVOSV5DxYfB1C9rt24MEacky5IcpK
         ly4ErnJjXKYgCsxQt6lHgdYLzJcLl85j08cp+c6KL/0aD7vGg8dd5AijDVGp0mXXI9CQ
         AO91JXfpf2WbjW0mEmLGz/dQwIt7cTiTyCP9RysNfDbQIxl13HgV5R67I1MKtIjPRJbR
         NOmC2zgwCSl8JbDJ5PVtgSv7ywRljPE/I5L4fqeZtxT4yhYMEDxBgLGuG5BM7kA5zq1v
         b9ZzdBjVAL61fYZnjlx4juMu0mO9c7+OxB7EC0JC+tFeOzxLnKhERXRFGXn5T7yyrzmt
         ZUUA==
X-Forwarded-Encrypted: i=1; AJvYcCVFk4Rq0nNBglPPgR4S/ohVm4zls6BsOhJp6ABos5uppzhmgArW5XGtLq3zGY14K6qRTbi65hItbK6moq8I@vger.kernel.org
X-Gm-Message-State: AOJu0YzZu7F/6MTWkwOBYh5ClL2DwpnSmsQPT+2ILzlW8lL7W/7OekhU
	04jKQibHZsEVY4hcRdIL6xHNghJeonJwDCFIQHa+LeCFOFquUpH8y4TyEA6VHoeBrcGPAf3eyjA
	OKncGUym/FmLK+OWuYwdbsfrNE1yrlrkyzlCj6KTk3OdtbY/6aSqivrYni04EbBHtrXOf
X-Gm-Gg: ASbGncu7kJ5S2Ab6hXX4ggk8TxZfXsMqMXFVC1ZSBkrr9xUmc2YIx2Qd7vrwKJK2Ht9
	JRETzhGbdjdDjTg8kbnehPx5usoIc9TdjXTyby9HAjAdfPRfrK2eGwBo1EAiy+AKYWMYlYjo9i6
	fN5B+trDiyu+PNKaEJW1uNk61HdVIBaotofzM7RM87bQNg5iaxwmPQjpzcbhPkU+ZiXG4Ijd9c4
	W0tmMQ8x8a6gYv38+h+5+FYZJD8bJmUdQ+iI2u+oqlNmVxeOnmmW7oGkCrhW5Zood+maCi8HBFB
	5AlorbSxezsknB8EqBwoVSH+4ajikyWS/VJxT5OFRw6qcs1/8Xu5jQ0mY5BJ8E7f4f6VbE2a0g0
	ZP6oOj00iRIwhN9F7YENVEUESzJJTfQvpBFjv6yDWYe143Gokbgbpwjrn
X-Received: by 2002:a17:903:38c5:b0:24c:da3b:7376 with SMTP id d9443c01a7336-294cb3a11dfmr30302185ad.26.1761632892461;
        Mon, 27 Oct 2025 23:28:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkoJ0/BWbeULjwvKLuQumjd4K3ei4AcaGQDzrzd6IcSgDpV2RBGOWAbR62jWKf3T2tuscaCw==
X-Received: by 2002:a17:903:38c5:b0:24c:da3b:7376 with SMTP id d9443c01a7336-294cb3a11dfmr30301865ad.26.1761632892019;
        Mon, 27 Oct 2025 23:28:12 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf359asm102503265ad.12.2025.10.27.23.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 23:28:11 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Subject: [PATCH 00/12] coresight: Add CPU cluster funnel/replicator/tmc
 support
Date: Mon, 27 Oct 2025 23:28:02 -0700
Message-Id: <20251027-cpu_cluster_component_pm-v1-0-31355ac588c2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHJiAGkC/x2MQQqAIBAAvxJ7TsjKiL4SIbFttVAqmhFIf086D
 sxMgkCeKcBQJPB0c2BrMsiyANxns5HgJTPUVa1kJTuBLmo8YrjIa7Sns4bMpd0pkJTs1yy1TQM
 5d55Wfv71OL3vB2Lq3UJqAAAA
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
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761632890; l=5210;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=6PnlglbBdA+sT72qw9FSQQcvFbM5sLJUf0oCBFAlNsY=;
 b=LALf6twg1OIvxPNPoUXNnYLUruCA2bLqVPFCSjxVHlq0x8jHuF1l0snyO9zy7Y4Zt8YntjTkp
 Oh08LcncK+5DapwYzG0b/O8jyAPAEAGclo9D7j34geQ6cr5DLet7C3r
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA1NCBTYWx0ZWRfX6guK7OKtBE4e
 Y5fabrJVhcw2KbdJf9w+219oxCYSJunJAI54jCqQcek6c/ba8nyY5dEFycdstxd2a8gAbxuZ0hw
 YovKne0Jun4z8cdSHc4Ynf5hhYiPB5sOGsSKJD64f8RDA/79dUMeX5l40adeTjFtf2nnKA2bu+/
 8ii9vKZI0dAbhptHk5ViF6C5Eh1JJ5JfDUmP7zQUNU075bEAT0DQjJ0NC7a0/eBgnTZS6yEYUUq
 SuDHp5LacVrxV9xh0uLO9z1CcB9OO2RPnJf8JoraYPSu4UW1wRrKDuGd3OaE+g9Rc1dM32Zvu/P
 XVLA9i/TxS9xwz4QJAfPtpxe2FSTgBlZgy6o0bAuhG3BMzZShjiOZsVLjvXkowHeZrPspFu9FX+
 ep0TkyL91B2MYKaS2eMXQFkYUhghZw==
X-Proofpoint-ORIG-GUID: uvvr9dFtap_z-m_LmWzC9JkVR5pT0rCc
X-Proofpoint-GUID: uvvr9dFtap_z-m_LmWzC9JkVR5pT0rCc
X-Authority-Analysis: v=2.4 cv=c9CmgB9l c=1 sm=1 tr=0 ts=6900627d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=6muaAK4ZDRYgKIjbAQEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280054

This patch series introduces support for CPU cluster local CoreSight components,
including funnel, replicator, and TMC, which reside inside CPU cluster
power domains. These components require special handling due to power
domain constraints.

Unlike system-level CoreSight devices, CPU cluster local components share the
power domain of the CPU cluster. When the cluster enters low-power mode (LPM),
the registers of these components become inaccessible. Importantly, `pm_runtime_get`
calls alone are insufficient to bring the CPU cluster out of LPM, making
standard register access unreliable in such cases.

To address this, the series introduces:
- Device tree bindings for CPU cluster local funnel, replicator, and TMC.
- Introduce a cpumask to record the CPUs belonging to the cluster where the
  cpu cluster local component resides.
- Safe register access via smp_call_function_single() on CPUs within the
  associated cpumask, ensuring the cluster is power-resident during access.
- Delayed probe support for CPU cluster local components when all CPUs of
  this CPU cluster are offline, re-probe the component when any CPU in the
  cluster comes online.
- Introduce `cs_mode` to link enable interfaces to avoid the use
  smp_call_function_single() under perf mode.

Patch summary:
Patch 1: Adds device tree bindings for CPU cluster funnel/replicator/TMC devices.
Patches 2–3: Add support for CPU cluster funnel.
Patches 4-6: Add support for CPU cluster replicator.
Patches 7-10: Add support for CPU cluster TMC.
Patch 11: Add 'cs_mode' to link enable functions.
Patches 12-13: Add Coresight nodes for APSS debug block for x1e80100 and
fix build issue.

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
Yuanfang Zhang (12):
      dt-bindings: arm: coresight: Add cpu cluster tmc/funnel/replicator support
      coresight-funnel: Add support for CPU cluster funnel
      coresight-funnel: Handle delay probe for CPU cluster funnel
      coresight-replicator: Add support for CPU cluster replicator
      coresight-replicator: Handle delayed probe for CPU cluster replicator
      coresight-replicator: Update mgmt_attrs for CPU cluster replicator compatibility
      coresight-tmc: Add support for CPU cluster ETF and refactor probe flow
      coresight-tmc-etf: Refactor enable function for CPU cluster ETF support
      coresight-tmc: Update tmc_mgmt_attrs for CPU cluster TMC compatibility
      coresight-tmc: Handle delayed probe for CPU cluster TMC
      coresight: add 'cs_mode' to link enable functions
      arm64: dts: qcom: x1e80100: add Coresight nodes for APSS debug block

 .../bindings/arm/arm,coresight-dynamic-funnel.yaml |  23 +-
 .../arm/arm,coresight-dynamic-replicator.yaml      |  22 +-
 .../devicetree/bindings/arm/arm,coresight-tmc.yaml |  22 +-
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 885 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1p42100.dtsi             |  12 +
 drivers/hwtracing/coresight/coresight-core.c       |   7 +-
 drivers/hwtracing/coresight/coresight-funnel.c     | 260 +++++-
 drivers/hwtracing/coresight/coresight-replicator.c | 343 +++++++-
 drivers/hwtracing/coresight/coresight-tmc-core.c   | 396 +++++++--
 drivers/hwtracing/coresight/coresight-tmc-etf.c    | 105 ++-
 drivers/hwtracing/coresight/coresight-tmc.h        |  10 +
 drivers/hwtracing/coresight/coresight-tnoc.c       |   3 +-
 drivers/hwtracing/coresight/coresight-tpda.c       |   3 +-
 include/linux/coresight.h                          |   3 +-
 14 files changed, 1912 insertions(+), 182 deletions(-)
---
base-commit: 01f96b812526a2c8dcd5c0e510dda37e09ec8bcd
change-id: 20251016-cpu_cluster_component_pm-ce518f510433

Best regards,
-- 
Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>


