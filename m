Return-Path: <linux-arm-msm+bounces-68691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCD4B22196
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 10:46:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A3AD6245BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 08:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 367F22E4245;
	Tue, 12 Aug 2025 08:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eIHbKDV3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7692E283F
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 08:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754987862; cv=none; b=bUwWIE3/ihsMNVZYf8zNUyqyicnYZSfgS8OTkHYlcL78s9h7aEf05Ywr/j2m3XWewB6Na0yu0OLB0k6xenxv6G4awFeF93BZ66XDPOULSle3kwjwlDJs6pcg6Z5aqeUI/gusR208bnNoMIBuP6Vl9+/p/QSzgsDtCWHZ7SeiKIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754987862; c=relaxed/simple;
	bh=0VCd99O6LrGYwRbWbx4pM+c1MroHvq/q4GBW97EYiik=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Qb8lTQG/b8WMIghncqnCJuIuclWu1OOvAvAQgTZMZXLEXCu9Q4gBAsfzV4jNogDT00RMpzrRtN5HFQGK1ZTECuyeRO+M4TPPfSQgramRzlePL6qT5qXbCQdNjf/QcPCG6a5brxkLAWCBqn2a9AsfDwWcmC8g3WwxmWHWif8vLQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eIHbKDV3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C5XoQ8025283
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 08:37:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Z1Lt7mTUh6uvsmhgYSXEZ76GSYjAMP1zqmi
	O1GoGrtI=; b=eIHbKDV3MjUzxC43bePYJ/T1dIk7iaXT8Y5ENuelPQWIoOpzngn
	VJEqyLVOBpnlpQyDIaCahVunB/E0SlDHfmHA/X52SCyDNOqzu7EWlOuquqTGCUZK
	8gq9MgRMQJT5HB2EDth+k/jkZDvYQ0SWn7NJzEZT1bAVF0iw9RqsI5Id+wkI0Uaf
	yFkWHrBhpVqkVh8jRwdg1z/gaxmzNGkrqYwrKtIPoSf2E+EywWYnoQdKzIkO4FCt
	ZYZmQFsI6oKLNm3fMgZ09Q+VCfQJI0KsfltOZImL+ioB0iFnZ69E5YjNJ0tRB//1
	ad36gw/6B0qd5GrmHuOFqmbdLB1cFsOHWNQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxj47drf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 08:37:39 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b42a54b7812so3086065a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 01:37:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754987859; x=1755592659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z1Lt7mTUh6uvsmhgYSXEZ76GSYjAMP1zqmiO1GoGrtI=;
        b=RZMlbKjbFKLWetJtcR/cCH/twjxkMEqDLDEAUe6zLxhrAaggSjhwq/89ca4ynLzRmF
         znvVXsDsgbweLFjHNBMvXMpXa8RKkTqtgvRtDP2W55gDyPKT/e53dKkDCjvvhlB3Y3Kr
         gSdG7bgkaHbHVYsYj4VpbB5iTzs3ul8AyIr0bD5NF3EHyHLIT9QE/xtckr9RieK+g62N
         9OB+jREYki/2yNoTkMwnO1Xpjy8KheeR5JRQxbQevFZsDqivZDrpVaIW1SiuuO07wgwS
         ku4MQpQzIPBp2OiNWRYbVwj0tOicGdIneOU0GNP+2gruIPQC3c08XZsIXfW2aDn0HeJE
         P5XQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7PXjZ2KSWko9vosiKfLT2lbRd/G8UJY561sgzQGYDgo5p9jcomxFx7AOf0RsZbdgB2oL/wS6IEBHxi+ym@vger.kernel.org
X-Gm-Message-State: AOJu0YxsIs+OUHLY21ynNiclvc6rQ/zoEpxzHaDGVVwQBTFvZ6lidsFZ
	pzMneX/u1guzUOatfBtEILhsmv0iPG3kHVkHku88AxYZTD7uknfVuG2Q8nAV+pEz42paiTb9UHW
	rlxQp/EVSRjVcyqRTrVYvh1QVedi5VFAKKdSm14UlxxARPQIgW9/ITqrj1bxxRQ5NkpQs
X-Gm-Gg: ASbGncseQAqtjzwFhxb57sNIhvFymrtMQqLh35C3waN9DArmVjAj8+g+YvQlKmNmnai
	EMNH6Mg9dLL3tB68D8fB0kL6iv4v4/1b635tUwdYqLAXQJZA7sSlaojoKXlnW8JTZgs3N0EJ82n
	IYWWwIOJtMX56jYsaap93VDtUm8KEdSOazU09Mf22/SbDEuCEsfoEJjaSWa0OR41SCT4Eu9ZgZq
	nAQ7Z08x9bgufWezRCaFjmZJ8nXlVE7TAXIuKfldI8BqjBYsDOFBgp0WIr31BROqOZJY5eqdCgf
	IGJmQ/sFkzIh0j0J/fE6kqvZw9Dm7bKWiOs7PtbiYDjSqh0jxr/m2K3pTg3N6OkXLk/JvC5mwC5
	2Nc1bQcGnd3j4KObTCQY=
X-Received: by 2002:a17:903:1b06:b0:242:c66f:9f87 with SMTP id d9443c01a7336-242fc36f96emr37851165ad.51.1754987858539;
        Tue, 12 Aug 2025 01:37:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOIW2no7OJ6os97Vg5PQyYasdcSRJg5XoXMAC1vlcjWlUPX3TpM4GpyxqBcIUwLHq/CN1fyA==
X-Received: by 2002:a17:903:1b06:b0:242:c66f:9f87 with SMTP id d9443c01a7336-242fc36f96emr37850735ad.51.1754987858089;
        Tue, 12 Aug 2025 01:37:38 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-243086849b3sm1915345ad.175.2025.08.12.01.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:37:37 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        Jie Gan <quic_jiegan@quicinc.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v5 0/9] coresight: ctcu: Enable byte-cntr function for TMC ETR
Date: Tue, 12 Aug 2025 16:37:22 +0800
Message-Id: <20250812083731.549-1-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNyBTYWx0ZWRfX+rsLwqhYhavn
 VFlUZ/kIYs765heOF25pzqQaErqOyjC4P8lUv1NFdKCYtlTM2xJlQeUIok5uUufk3eQmU7AByWi
 l45rmlD7ri/hk6QJeTuuphktHvRriTiYzvUm2LUp4cyBsPPH0f2CY1M8ZLJ7t1vD5GFMXRQ5zPD
 ORS0IRPdNDnHvLoJpkW6I5f623OR0kF4CO7ZerNAdBVsJdeZ2EVawJGmKfxK74plGhErUNU5+hx
 orHvZA4QaaUciRIGzUbf28/BpLf2UI89ga0hrqbFYBRMVojnhUXhcko6+PvX7tJgyZFNJ6WPxIj
 oyADnT0nDG8HIbjJJNeGSc8+VHgxleQBV9IOGvXaFCed3cL9cujbK5nRGEon74d4sk1RaKUNsVA
 bE6NzYHI
X-Authority-Analysis: v=2.4 cv=fvDcZE4f c=1 sm=1 tr=0 ts=689afd53 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=4JJaRIKzVo7dG1xzKtwA:9 a=_Vgx9l1VpLgwpw_dHYaR:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ohewxpfmWxBPdNoPKA7lGhCnGypAlGJY
X-Proofpoint-GUID: ohewxpfmWxBPdNoPKA7lGhCnGypAlGJY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090027

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

Changes in V5:
1. Add Mike's reviewed-by tag for patchset 1,2,5.
2. Remove the function pointer added to helper_ops according to Mike's
   comment, it also results the patchset has been removed.
3. Optimizing the paired create/clean functions for etr_buf_list.
4. Remove the unneeded parameter "reading" from the etr_buf_node.
Link to V4 - https://lore.kernel.org/all/20250725100806.1157-1-jie.gan@oss.qualcomm.com/

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

Jie Gan (9):
  coresight: core: Refactoring ctcu_get_active_port and make it generic
  coresight: core: add a new API to retrieve the helper device
  coresight: tmc: add etr_buf_list to store allocated etr_buf
  coresight: tmc: add create/clean functions for etr_buf_list
  coresight: tmc: Introduce sysfs_read_ops to wrap sysfs read operations
  dt-bindings: arm: add an interrupt property for Coresight CTCU
  coresight: ctcu: enable byte-cntr for TMC ETR devices
  coresight: tmc: integrate byte-cntr's read_ops with sysfs file_ops
  arm64: dts: qcom: sa8775p: Add interrupts to CTCU device

 .../testing/sysfs-bus-coresight-devices-ctcu  |   5 +
 .../bindings/arm/qcom,coresight-ctcu.yaml     |  17 +
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         |   5 +
 drivers/hwtracing/coresight/Makefile          |   2 +-
 drivers/hwtracing/coresight/coresight-core.c  |  59 +++
 .../coresight/coresight-ctcu-byte-cntr.c      | 368 ++++++++++++++++++
 .../hwtracing/coresight/coresight-ctcu-core.c | 108 +++--
 drivers/hwtracing/coresight/coresight-ctcu.h  |  62 ++-
 drivers/hwtracing/coresight/coresight-priv.h  |   4 +
 .../hwtracing/coresight/coresight-tmc-core.c  | 104 +++--
 .../hwtracing/coresight/coresight-tmc-etr.c   | 110 ++++++
 drivers/hwtracing/coresight/coresight-tmc.h   |  39 ++
 12 files changed, 824 insertions(+), 59 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
 create mode 100644 drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c

-- 
2.34.1


