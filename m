Return-Path: <linux-arm-msm+bounces-66674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0ADB11BC8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 12:10:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8ACD116B46F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 10:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BE702D9EFF;
	Fri, 25 Jul 2025 10:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CNJ504A+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C412D97AB
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 10:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753438099; cv=none; b=AK55TpF5u9/ZYqmcs39SPBi4iBPqXSkDN4Rbcvy6FiQcumnzK32RmWNE5AwoKn7Tuq39nBhDJ+Ix+TFyZO7AIvt5ziv3IqEa3/HcuC+gxo//en3CffVRcE5eFFlfR6eapDSF1qZB9QHccBwbxF1HSU0uztkAhZbXMS03k3LiEDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753438099; c=relaxed/simple;
	bh=IlswOXw/RTcT0slyrcVOlRkPyNua54MAWCCNfnpi6y0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=d6WthdhHuhqHUus+40F1M2GyQa4poVO+9kVRONXGk4JLxk2+/W9/4sPGd05ZNrlUDeRIZodtxEpzT57jVdd467eYEgCsDZG1X8MqQNoTaKuK6SNTYI/4c9sMuNIHR3Pde/zxanXEqaiVympZsku9ktUlz5h/0UKq6oaKsByJp4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CNJ504A+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P9Dafl015901
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 10:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=6EBHc56iB4SgkIrGWkMoVed7ialO6Hu91Fg
	rEoulgGQ=; b=CNJ504A+r23mg0+9FgdE5QuAZ8FjXBbGOsVLU5VmGg8AfN4rxPl
	Dib+f/XqaltETQ27Rk97zohFGYJv3IBf6YA6vk8+ErR9zlOJ5ousaz/7FI+3by9T
	IKI6ayd6+9Byq6ARw8eKDeBxMyyrtFpjL7TDyF909e5SbjSCZ5LnjZPQAU/zVeT/
	YnVdGaj4eJ80OCMRl7BnarG+z/TOzmsrBs/wEm4a6UVosISAt7ZoUY8XltPsvBXB
	3RTu0NzigctUUhGR9DxyxnrQsjLlg6D/IeihOqMimddTMIWNsk5pOlc9sN4MVBUF
	LU8xpgCZNIsmKg4KPZlPrIGeM6ZVVG9CT0A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w501nne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 10:08:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2356ce55d33so33154465ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 03:08:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753438093; x=1754042893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6EBHc56iB4SgkIrGWkMoVed7ialO6Hu91FgrEoulgGQ=;
        b=KoBg3TnxJ19vs1we6K8hWdqcUIKOEX0sHDx2GaWmb10Uf9kFwecmJ3whQmgJZJyEhm
         KitZdsKQrqlstKBJfAqPTmk/pqLN82k/U9YB1BpEVM1HlJERDk15Hn2yOW0Gk+jpiJXK
         WqWB9sGxK5HhsdXPGiMDCWZOWifVzEK3lCYAEkDPI/C2PknTLTSh/ZB3iqcrAaYkiW7D
         5yWH56+CBTUkrC+m7wHbSyYABVFbQ9kzo6xlTy17Ea5AkouB61DMacAj+RPB3hhjxy13
         D3n3UEamkwSo6T+5V5RtSeX9jYT/wyZ0N0l4492vXy0JV1pu2gdIvXHK7IYGP6leckyi
         pY+A==
X-Forwarded-Encrypted: i=1; AJvYcCVkb5KvvaMfZdrqZTK93lxL4crzSyF8dmpWXsxHeuh9gGRzs2lELmXsFMO/+Nd0Q3KqgYhJf3pnO2J54wE1@vger.kernel.org
X-Gm-Message-State: AOJu0YzxLtMbQ/cFanYH67H/dkquirCpA8yLD7V4IFwLTyV+HjQDRk4k
	CUmSLTzSpjhU6LedG1aQyXvuZJyTtTu2SaaVQbkBp37OW6cZP1fqNk1zITB0GmwJHzjcM7MqbXM
	got1lGOp7emHGf2YqWMprwspckPC5+Axpv15cLbv5sFRQjAcIrxDwm7a+TY+sgjOKdb9Au/BQ7g
	LF0Mc=
X-Gm-Gg: ASbGncsdreiN4Qgjf4hECQfV3XzKROPiM8txPCEhadPj9gsEbAbZtpS9m+Fedr0Zv0G
	dYijxIbR5ZWnEqZG9O3UWlo4SFXerVFWOJMW1+4eW2Wg911Od0kUeX1/uQ+JEzJXVZUAQmSQF1V
	9pIZpiVmxJLXn2JHttOpI00JkdCbS16MRpGeWuBb9V8cAMIt3HaJQdZfBjmXxbVRWh2YnZIAQmd
	cgSnRn1pGx+k8uR6sOg1ul7BW6/KdMnDkgd1s5zKXVJvEzG1creVSh1QrUeZxkTVVx2kZaUz92z
	oFiPgxI2f/iCBSz1ngQ0yjqSDXnsnwCMfqrapMDukQvCFpgfiILQtbhALTOT4QnuD912TyKz72w
	xE4Y1PbZhFtww3A9o2Qs=
X-Received: by 2002:a17:902:f68e:b0:234:8a16:d62b with SMTP id d9443c01a7336-23fb308080cmr22580645ad.12.1753438093397;
        Fri, 25 Jul 2025 03:08:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiwVDJYSX1y11czEmaF5LFxL17hgu0Lb2lAPb7Ue/TpYcJeCl2AQGCWJYInJsEyxe1YPp2QQ==
X-Received: by 2002:a17:902:f68e:b0:234:8a16:d62b with SMTP id d9443c01a7336-23fb308080cmr22580135ad.12.1753438092796;
        Fri, 25 Jul 2025 03:08:12 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48fd29dsm33641435ad.176.2025.07.25.03.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 03:08:12 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <quic_jiegan@quicinc.com>
Subject: [PATCH v4 00/10] coresight: ctcu: Enable byte-cntr function for TMC ETR
Date: Fri, 25 Jul 2025 18:07:56 +0800
Message-Id: <20250725100806.1157-1-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9Nt7BkhA9WPBnLh5eF8llUArjZF1ICCD
X-Proofpoint-ORIG-GUID: 9Nt7BkhA9WPBnLh5eF8llUArjZF1ICCD
X-Authority-Analysis: v=2.4 cv=bKAWIO+Z c=1 sm=1 tr=0 ts=68835790 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=URa5TLP9FqKrhjsjdTUA:9 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDA4NSBTYWx0ZWRfX/ivqZ6Vu0Z6S
 ErsBolP/QFkaeKrzoPm66Z9H7gbHiOxpvshKfZZIYHht2jFjWBLzdjOxMWrSI2mJ1u704vWoPgx
 laiUuO1eoQcZR4HEKmFcPmVz9O8aYea2tk76gNgptUEI3gXk+/4/Lv/EeM0ZnKQNvcx8Dla/Ups
 T3jh835QATNisHGPTxZ4IPfTh7Rj45AFgcYq+Lh/ByfcVHO/P0tixUaAW71wgeeLXDA8vNMzEBR
 AJfSCw1DaglbD9GjIELqhJMckOnYdHpVR5aoNBJxNFAnPac4z1Sm/0hppK/lGNNUQvYJbUYZuIn
 zy8i3WoZ4sBUtHAGiz10uAyEV58RE7V5yGfr4RVGWv29VFFw+BOY+02nKv9i9cl7zdxNc5xnHnh
 88xUvS41Rt2tLqM2JZRsJzF0osJjVbpjdeOnWCXBZdD++HItQi/5ICCkwbAvyw59sR0BJw/O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 mlxlogscore=999 clxscore=1015
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250085

The byte-cntr function provided by the CTCU device is used to count the
trace data entering the ETR. An interrupt is triggered if the data size
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

The byte-cntr read operation has integrated with the file node tmc_etr,
for example:
/dev/tmc_etr0
/dev/tmc_etr1

There are two scenarios for the tmc_etr file node with byte-cntr function:
1. BYTECNTRVAL register is configured and byte-cntr is enabled -> byte-cntr read
2. BYTECNTRVAL register is reset or byte-cntr is disabled -> original behavior

Shell commands to enable byte-cntr reading for etr0:
echo 0x10000 > /sys/bus/coresight/devices/ctcu0/irq_threshold
echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
echo 1 > /sys/bus/coresight/devices/etm0/enable_source
cat /dev/tmc_etr0

Enable both ETR0 and ETR1:
echo 0x10000 0x10000 > /sys/bus/coresight/devices/ctcu0/irq_threshold

Reset the BYTECNTR register for etr0:
echo 0 > /sys/bus/coresight/devices/ctcu0/irq_threshold

Changes in V4:
1. Rename the function to coresight_get_in_port_dest regarding to Mike's
comment (patch 1/10).
2. Add lock to protect the connections regarding to Mike's comment
(patch 2/10).
3. Move all byte-cntr functions to coresight-ctcu-byte-cntr file.
4. Add tmc_read_ops to wrap all read operations for TMC device.
5. Add a function in helper_ops to check whether the byte-cntr is
enabkled.
6. Call byte-cntr's read_ops if byte-cntr is enabled when reading data
from the sysfs node.
Link to V3 resend - https://lore.kernel.org/all/20250714063109.591-1-jie.gan@oss.qualcomm.com/

Changes in V3 resend:
1. rebased on next-20250711.
Link to V3 - https://lore.kernel.org/all/20250624060438.7469-1-jie.gan@oss.qualcomm.com/

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
  coresight: tmc: add etr_buf_list to store allocated etr_buf
  coresight: tmc: add create/delete functions for etr_buf_node
  coresight: tmc: Introduce tmc_read_ops to wrap read operations
  dt-bindings: arm: add an interrupt property for Coresight CTCU
  coresight: ctcu: enable byte-cntr for TMC ETR devices
  coresight: add a new function in helper_ops
  coresight: tmc: integrate byte-cntr's read_ops with sysfs file_ops
  arm64: dts: qcom: sa8775p: Add interrupts to CTCU device

 .../testing/sysfs-bus-coresight-devices-ctcu  |   5 +
 .../bindings/arm/qcom,coresight-ctcu.yaml     |  17 +
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         |   5 +
 drivers/hwtracing/coresight/Makefile          |   2 +-
 drivers/hwtracing/coresight/coresight-core.c  |  59 +++
 .../coresight/coresight-ctcu-byte-cntr.c      | 364 ++++++++++++++++++
 .../hwtracing/coresight/coresight-ctcu-core.c | 148 +++++--
 drivers/hwtracing/coresight/coresight-ctcu.h  |  60 ++-
 drivers/hwtracing/coresight/coresight-priv.h  |   4 +
 .../hwtracing/coresight/coresight-tmc-core.c  |  99 +++--
 .../hwtracing/coresight/coresight-tmc-etr.c   |  81 ++++
 drivers/hwtracing/coresight/coresight-tmc.h   |  40 ++
 include/linux/coresight.h                     |   3 +
 13 files changed, 828 insertions(+), 59 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
 create mode 100644 drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c

-- 
2.34.1


