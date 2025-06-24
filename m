Return-Path: <linux-arm-msm+bounces-62150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DDFAE5C6C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 08:04:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C836517D1FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 06:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DADB62343CF;
	Tue, 24 Jun 2025 06:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BXlVNVWe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0055422258C
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 06:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750745089; cv=none; b=D79rQuOhjjHGNKXvSHWHupMeqehEARXXqYuFMCYnY3P+P5fPVwj3adT02/Cbc9Ep5gUno4bML4DAEGVQcJoa+mkdmm9ZMctlA3Qge4K1yanbN9dWt7rjWJi1EznMqvetzGEBB6Pcu1496g4CbkTLK3b9iYXpcz0a4P677ayACKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750745089; c=relaxed/simple;
	bh=5PfRKrG2GQlwzmgsaLI652rauEwE9lVAADzU9VRGpTQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=duBaqBpG5afws43mQDTfKZhI2bu3z+6ZGg9O0V5BwWetdxvmiJRa1/qbNFYhTsRzNkGwaard34wgdruAwDp6cCeEQEabI8NmujlVjXe2wJ3uhz+ZlqDtNnJsovDH4ydT98k7FZyKEPw8elAb9cfYemCbFW++I+2MwKaydV60XBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BXlVNVWe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NKlxGo013337
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 06:04:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=AACehQz66jGML8jtfQhLKZ7tYZLo0nJOPda
	zO4YxUuc=; b=BXlVNVWesgxqUOvTjzPCQ5ZJc0msLInU21qKJ6fyiUXhjLVIIhP
	c3hcKCqPBLHhzDttiiXg4HPozL1j9XKvZKHbhBBhTXu1TAI20yxMu5DtKNOj4tYS
	qMubIzjPlAWZGyVIut/q8hxuwDzJ8szxkFcChh46iaGCvTcQ9auDRpIwjqY2IvJS
	nqixzPlfMjCjE24qnjwshfqsuQaj89wjz6HzwWFPzK90zTAIqL0DWlQ9E+MxcWdi
	7NGARuzl7Mr8KG3BJ+owZI/MSpkLZOP0EA+mJg3INS1KNyVP/L0LAyFTuhU2lcNw
	joltiArW7Nztmi6GObE2GBXfzQ9awoKrtKg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm1sfba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 06:04:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2365ab89b52so484145ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 23:04:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750745084; x=1751349884;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AACehQz66jGML8jtfQhLKZ7tYZLo0nJOPdazO4YxUuc=;
        b=KIVT3BWZkYlPk2+CEJtyUu/ViZtyO+1Clc8n9fFtGTJYB4klBTlHVBWhf07kqI4bfI
         XcOB/ly303EqSsBCU22Ij0sSEuiEzSP28TGYxxzwmhciojbldwHY1dYIeS8BDBkaPuA4
         JKXlTAJjNcIQ785bFLB2auaGFC6gHC12NuU+5U9vTSz1n9LHwVTT9fl8GX7eS6j8HiaY
         Ostu3V7byPnM5dvu/ZX1LhvEsScHAQcjMs9/qLpy2tmYcttqg6WTGxnGizsfbFkKyXGN
         zt0EHPvhedNVtsGKYqycxMOzr5xmyFlR+Xho51yUZ1+9ttGE50vQ/bNqbpxnnTHdMY/B
         3+og==
X-Forwarded-Encrypted: i=1; AJvYcCU89DK9mFHeZW98lBEYZrD58Zw0UU72/YrAIVux3XfpcWcKgwlCubCe9krzFYPmJ7NT1oVBpeyGfrbfIhwN@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw7U1gsig7NdLQxVjWC2yQ1kIkJx6JFaqujcCp+d9hGtaroQ76
	fH3+uPbGnTvl7TOl10bUNSHPvD5fF4T7dzme+GcUB5sRRzgRhn+oDhUsDaqdyx+irJdA84OGfLz
	/iUVzqga4Lw8yw5pUz6sFsDuScoQOPczykItfLErKbZN6BJ9L330GQosgQcRfpSsZF3xU
X-Gm-Gg: ASbGnctC8h+zLpyxaLPtYqDa9Sh05NVCbME37wETgY+0GUNHufWpTRMbpYcboQr2AgA
	L1Hw3Tg5jAfUFWs+J5989I2n6LbecUJIMxtlbf7AMLHGRHHe5HcH6n7Bn+2AGAbt/B3Pr1+5NMZ
	Fkfu9/8vL+gA/YsyWSzAUrHL90sGTa8S9ve2KhcTHdZuo4i/JB3DjXFegI81fMVl+vK6ktMWcOZ
	MvwLfvW+gJWkDqBdhpY5TUw+ZFRAx8qI/TyYLm/nfXg3Ei3YNcGoITvfIwoJS03ideJJneHShoo
	MByO+CSeDqvAX4ukRS75v8nyDGSl4WXqewOJrg42ci2GseoJzeU4h3ziesf1ZXKU5L01sc924VE
	82w==
X-Received: by 2002:a17:902:ccc3:b0:235:e1d6:4e45 with SMTP id d9443c01a7336-237d98f3c69mr197464725ad.25.1750745084291;
        Mon, 23 Jun 2025 23:04:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhyCnnLv+KHyzd+4i525LIpKE8PA1HCFGX9nqqpvvzEsPVeUBt24MhWCwVB6lZ0lyOe2GQDA==
X-Received: by 2002:a17:902:ccc3:b0:235:e1d6:4e45 with SMTP id d9443c01a7336-237d98f3c69mr197464415ad.25.1750745083875;
        Mon, 23 Jun 2025 23:04:43 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83937b1sm101371455ad.52.2025.06.23.23.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 23:04:43 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jie.gan@oss.qualcomm.com
Subject: [PATCH v3 00/10] coresight: ctcu: Enable byte-cntr function for TMC ETR
Date: Tue, 24 Jun 2025 14:04:28 +0800
Message-Id: <20250624060438.7469-1-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685a3ffd cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=nBcv9sv72UtkhE4thMQA:9 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: TN_WIqT-jExrNSHgC7shhSM3f0zN1td9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA1MCBTYWx0ZWRfX67dg0nAu+af8
 JKw8eT72BjCL1lY8mJc0ZTq+Q3YzaHE7RPPQ5FpVpy35J23iN67XoXDsV6rhY6q2VKZ4jVravCr
 wVApbKYRWCWPDp2jvVBTBUsFgiXWCNZ0WGO9banBQkmMxlWhA2owlhubwrzcvdrPAg1wzW4o4bO
 33R4XqLEGPcZC/22z2hjBsiwi6LFMuISdttyM9jh36WlPJwgQGyPq1drB/rNWAjRqgoCe1lbmLU
 NGFU8K1q1sO7Bv3Po1oM/AZvka9dzTA6FuRC3vHY0Qspu1uINP4mgCozHsD9oAPrNEr7WmiCXZB
 jYj64pqzu94LIE6ZLGVdOA2z8fYvOvXAIAoXOob8PNE9gRcJfPgIcV+kea6EkclHTKttCKsZqmF
 W0wtPT0+WSjAfDCHMMLFYPevaUP6eyn6Z846hkUek7Sgv4ETtGEi9pCli1xMuXveAXeNVcbJ
X-Proofpoint-ORIG-GUID: TN_WIqT-jExrNSHgC7shhSM3f0zN1td9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240050

The byte-cntr function provided by the CTCU device is used to count the
trace data entering the ETR. An interrupt is tiggered if the data size
exceeds the threshold set in the BYTECNTRVAL register. The interrupt
handler counts the number of triggered interruptions.

Based on this concept, the irq_cnt can be used to determine whether
the etr_buf is full. The ETR device will be disabled when the active
etr_buf is nearly full or a timeout occurs. The nearly full buffer will
be switched to background after synced. A new buffer will be picked from
the etr_buf_list, then restart the ETR device.

The byte-cntr reading functions can access data from the synced and
deactivated buffer, transferring trace data from the etr_buf to userspace
without stopping the ETR device.

The byte-cntr read operation has integrated with the file node tmc_etr, e.g.
/dev/tmc_etr0
/dev/tmc_etr1

There are two scenarios for the tmc_etr file node with byte-cntr function:
1. BYTECNTRVAL register is configured and byte-cntr is enabled -> byte-cntr read
2. BYTECNTRVAL register is reset or byte-cntr is disabled -> original behavior

Shell commands to enable byte-cntr reading for etr0:
echo 0x10000 > /sys/bus/coresight/devices/ctcu0/irq_val
echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
echo 1 > /sys/bus/coresight/devices/etm0/enable_source
cat /dev/tmc_etr0

Reset the BYTECNTR register for etr0:
echo 0 > /sys/bus/coresight/devices/ctcu0/irq_val

Changes in V3:
1. The previous solution has been deprecated.
2. Add a etr_buf_list to manage allcated etr buffers.
3. Add a logic to switch buffer for ETR.
4. Add read functions to read trace data from synced etr buffer.
Link to V2 - https://lore.kernel.org/all/20250410013330.3609482-1-jie.gan@oss.qualcomm.com/

Changes in V2:
1. Removed the independent file node /dev/byte_cntr.
2. Integrated the byte-cntr's file operations with current ETR file
   node.
3. Optimized the driver code of the CTCU that associated with byte-cntr.
4. Add kernel document for the export API tmc_etr_get_rwp_offset.
5. Optimized the way to read the rwp_offset according to Mike's
   suggestion.
6. Removed the dependency of the dts patch.
Link to V1 - https://lore.kernel.org/all/20250310090407.2069489-1-quic_jiegan@quicinc.com/

Jie Gan (10):
  coresight: core: Refactoring ctcu_get_active_port and make it generic
  coresight: core: add a new API to retrieve the helper device
  dt-bindings: arm: add an interrupt property for Coresight CTCU
  coresight: ctcu: enable byte-cntr for TMC ETR devices
  coresight: tmc: add etr_buf_list to store allocated etr_buf
  coresight: tmc: add create/delete functions for etr_buf_node
  coresight: tmc: add prepare/unprepare functions for byte-cntr
  coresight: tmc: add a switch buffer function for byte-cntr
  coresight: tmc: add read function for byte-cntr
  arm64: dts: qcom: sa8775p: Add interrupts to CTCU device

 .../testing/sysfs-bus-coresight-devices-ctcu  |   5 +
 .../bindings/arm/qcom,coresight-ctcu.yaml     |  17 ++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         |   5 +
 drivers/hwtracing/coresight/Makefile          |   2 +-
 drivers/hwtracing/coresight/coresight-core.c  |  54 ++++
 .../coresight/coresight-ctcu-byte-cntr.c      | 102 +++++++
 .../hwtracing/coresight/coresight-ctcu-core.c | 113 ++++++--
 drivers/hwtracing/coresight/coresight-ctcu.h  |  52 +++-
 drivers/hwtracing/coresight/coresight-priv.h  |   4 +
 .../hwtracing/coresight/coresight-tmc-core.c  |  70 ++++-
 .../hwtracing/coresight/coresight-tmc-etr.c   | 270 ++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h   |  29 ++
 12 files changed, 691 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
 create mode 100644 drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c

-- 
2.34.1


