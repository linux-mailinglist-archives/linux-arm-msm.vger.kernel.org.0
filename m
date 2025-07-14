Return-Path: <linux-arm-msm+bounces-64752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0847B03717
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 08:31:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13F313A491A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 06:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F4892248A4;
	Mon, 14 Jul 2025 06:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XhAP8100"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED88BE4A
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 06:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752474682; cv=none; b=icRnBL105rPGm9BahPdie5srwoqOwFPsBPK+GAI09QWjPe+diRA7nB8urzNbkrrWIuVoIxvKZdE/+bxPErkMcyGOq4Q59WxUOnHl4kDHLTbs0hqQTbaUrEMfA8KPWqKI1ZV+0PzDR+XCgWu0CUl4QfWPGtLaVfiDO2Owb2AQiqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752474682; c=relaxed/simple;
	bh=+wPOWYKwugoIf8mklL3U53Tn8gBLZL7yLlWIIj4mpnw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fH2kBL0m/DTXQE7TAxQrWrsdFar68LGvlWnkrYx5QOnnR1vjdhufSZixoRUhcfjcizZ1OTyyL7JNrv3hHTE601apsd0it3R1LFoi9uyoDboPWceI26gzzvR3HfkE8BQdlbxHk/7tdXjCdDsxhGthq0vGmXZD/XjAQOQGBFM4qLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XhAP8100; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DNphtw004347
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 06:31:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0wqXPJCmIO0vUREoCEbzWcWX5UzhT3+oWJ/
	3YK7SaqA=; b=XhAP8100rPlBQ50pSDQ+lHvfwHFkb6Xjs//lS5nBhJig58p/NQJ
	tLektCMGsNISv8FI8PfXqecQ+u4Pis2ZpCbAJSVmqnmYkBqjDTC4NaO5YeUT9LOv
	X7IL5F9NZiMGzHYaloCMbUYTs742r+5JcwtHEvznLVre9IGhylOVRKq6JTP+clin
	6a9t0Y5scbsiznIU8VK/reUGVNp57qeFf76jimiVkyw9g7PxR7mnTAvuztGjA2w8
	bGJR4GY5vYU8a7JX1AoRrCVOMmXiPanziqGoIdLxKTHoaKHfqYMSo07NToSbKnsR
	ejmjqQhn/3ZqPeH9tSgeCJtvO/A28TfyQow==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxauh43-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 06:31:18 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2356ce66d7cso68799075ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Jul 2025 23:31:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752474678; x=1753079478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0wqXPJCmIO0vUREoCEbzWcWX5UzhT3+oWJ/3YK7SaqA=;
        b=VzoNfhWc62sbEmR5VAQj8BF2t1Jp5Dqgz4JKq98z/QkYNsyW3PT8GoqzHYDlHEuv8o
         /nwRhIIrowmTAnhTQwq53+x5PTSe7k5jli5rZrcJvp2BBe09pHQaCIDSrpyRYdSjTvtv
         dDRFRSRjSLKj7Dd/AE3VmiMFqiCJgHrKKraasDUAvE8vnOWl1JTWpoAjPaxlBLl/uyC+
         x6bUTgZUkAW+aBPkiAj9CSl+LSsZh+1FThEuFxOkrkdcNODKQnI20UEU0IWxoIuMwRUI
         8w/JxKvjD7rRWkmdPEgyxvQPu9T8TZO03Vkft5HuyZREVxLIWz3kmHckVzEJcwbMc6Ut
         VrIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIwFgVaCRfToH7YSh18OyHMDRUsvobibFQaUgLB3wl9/rcEeJ3h1gPFjoeAB9sTB2DR+U3XD6SFPtUg+E2@vger.kernel.org
X-Gm-Message-State: AOJu0YyGP0VXedjERujD0b0rusuPLOn7th9IOldlRNE89XzXJcvZJw7a
	U4I0eY452tnsAoBm0NNoeOhktVJnUO6IdxsQgaotVDursACHSgorhaIDmdB8XcFdeUn4nzI96ah
	I6mW/6t+9C+SAncp7uqK+You08J9PpPhH0axuIA3zhjL1ec/fE3aEY5qC+j44Ip0fAxHQ
X-Gm-Gg: ASbGncuxmC+0D97ScVlHA6GCpffFyj7FZsy1hyIKbrol+U6bheLF6Bw4ERgfDNifDi4
	lYSG/ELoXhDMBRI/Ba6bHtWdzTNGZjiz4rgwmcCrFh0UHds+cwIHGS6hV0yHWgn/F5xnFIr+5xI
	d34/g3AWcxjmRnveco0u5MuzEPXFT+3qx7EkiWtful2jodmXFPaxocgeVLW7A6TjQZA/2q9lRCK
	fWAxMJYz0ckXZ13B+s4vUzVKJ3IJNE7+JMrUUtbc0PzPLa+8Pv210m0qL2TG08U+dVoSYwsskJu
	Cn/uhTyx85u99fW921+7156Kg5D9PcESFOHPMEbEW9+y/Lt3NB2BCZtPjFOOzjq4PL1YM7eZxfX
	m8d6p79fY0mYxRe5hzoRL
X-Received: by 2002:a17:902:e54d:b0:235:f078:4746 with SMTP id d9443c01a7336-23dee263c53mr150587495ad.42.1752474677609;
        Sun, 13 Jul 2025 23:31:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPLKAuifJqLzIISS3WOtiE7PpBWt3Y0U9Des4cLciVFaSNQhBO1Bz9VSSEWj3nEmc8jMwwxA==
X-Received: by 2002:a17:902:e54d:b0:235:f078:4746 with SMTP id d9443c01a7336-23dee263c53mr150587005ad.42.1752474677123;
        Sun, 13 Jul 2025 23:31:17 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4334005sm86138255ad.158.2025.07.13.23.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 23:31:16 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        Jie Gan <quic_jiegan@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 RESEND 00/10] coresight: ctcu: Enable byte-cntr function for TMC ETR
Date: Mon, 14 Jul 2025 14:30:59 +0800
Message-Id: <20250714063109.591-1-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ozTs6DqdMK_9WObBUvs-kwWGFz6NvkSP
X-Proofpoint-ORIG-GUID: ozTs6DqdMK_9WObBUvs-kwWGFz6NvkSP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDAzNyBTYWx0ZWRfX7RscXotmca+T
 6wSQIbIGp1SxbaCI9doTQoFHhMBOAN4DpaHdbZf5xWjNAK7kZoySGnWAtQOmxiRnD0nnItewX2T
 oRmBPQBSPJbK/Mo8IMKyDSzlS9p3f2buKoZW4QKeGtE/xU2gjL/WhxJOPYQOcoXwdwaZxHghf7B
 kgoUwoa3dMdXiqEFxZ6O5ZqzjdIDON5JDzs1v6hEq/lN/GzUvuJEesg1t5JUCDPJ/epOiEDWn+x
 KPam7voIE2PgkBo5zlAE8EkLuRuio0LLp5xXttPsz1R0aEii2ZNjys9TG+XUFNspizgSCsaXUU3
 Q1w83XAfCm2Ds4fDO1j+3V9zzFSdBGs2kNhlnp8lIJDQ6TLzJyYJzy37GKfSvbZqoWFMMqJELJA
 ZSHdcyfVDn147uSnAv735vQBzIgq09xDbMoxpbDA28XrIu9Ni2iwekNIdZgj5XK468IK0gyj
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=6874a436 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=nBcv9sv72UtkhE4thMQA:9 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140037

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
echo 0x10000 > /sys/bus/coresight/devices/ctcu0/irq_val
echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
echo 1 > /sys/bus/coresight/devices/etm0/enable_source
cat /dev/tmc_etr0

Reset the BYTECNTR register for etr0:
echo 0 > /sys/bus/coresight/devices/ctcu0/irq_val

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
 drivers/hwtracing/coresight/coresight-ctcu.h  |  49 +++-
 drivers/hwtracing/coresight/coresight-priv.h  |   4 +
 .../hwtracing/coresight/coresight-tmc-core.c  |  70 ++++-
 .../hwtracing/coresight/coresight-tmc-etr.c   | 270 ++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h   |  29 ++
 12 files changed, 688 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
 create mode 100644 drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c

-- 
2.34.1


