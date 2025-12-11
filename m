Return-Path: <linux-arm-msm+bounces-84980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD9ACB4D6A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 07:11:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7C3030102A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 06:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A545280A52;
	Thu, 11 Dec 2025 06:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lZ0vX+Bf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VyD+7yLi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F131F4611
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 06:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765433495; cv=none; b=al9uzjj/9jEUnYV9nciFujXxQbA1e3021RUayjBvWp9SUi5gAM2ZLfwl1diUHgefD0WAprGhztxKacu6n2alTwd1hNwRkrNWVjhfI2MdjZyhVkvVE4TxV05KY2V1AOwljF1a39wIANe5tBa4AQXSLVDDrjEzvRFIP6teAbuOsMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765433495; c=relaxed/simple;
	bh=5BM2CWCRUwDmWsorg4jLpNENuRewNcYdGIPmj8dFZgA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Gzt0Uy82Hd33BNKkeLopTvHjKrPF2sr3SpqaJMvuNv8WjXDRuNdTBr+KMb2BP7Iw6/jMsnSQoYsQJ0EXebRDK1+x3WfKC/8Hhye8ZSsJ7G2ShBR+A7StGHf/L86h5iZiB5RsBI+bpvi+HsDAa918LGcRyaTgQkc5Th8ZbmKVw/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lZ0vX+Bf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VyD+7yLi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BALP3ef4126221
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 06:11:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hhKmlg+dr84Ob9dnVY4ZzR
	u8BFKGqs9p9d9Zofmoi2k=; b=lZ0vX+BfQtEHsz7hGrFjUERmSVxNAzGUw3Kp+2
	a+yyuZKnPb2RbP1c3PhCi1j2yv5sG5nT3SyOmI1d9kTdv5cXusvsCW//YdT9RW12
	xwR36itRdiwfuiuYKDXFwQJVrON70B8NnuK0zmlvrgfnXpsos66r0w5x0WbTLbgB
	ubrTYxo5FD+gHHi2c2QpVf139QMk8KKd0LemKi3/lyoh39RbptIqy0nIN4xHxirv
	zaZwBLPuq+2WcHiJSfI9xJg7T+gcI3pRW5DPUa+5AI4LtPch/WacQmzDSMKI+SNO
	l8fehhR1MplqzcmV0kOCH56HDV3ig3tQwckcvA+kaIhonl9Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aybhpad7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 06:11:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-295952a4dd6so15234475ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 22:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765433491; x=1766038291; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hhKmlg+dr84Ob9dnVY4ZzRu8BFKGqs9p9d9Zofmoi2k=;
        b=VyD+7yLiIiuSgj8+FDoRW/OMYq4GS/MfOQYkGVsFSSNs+8RqZW067UKglHx0cgYD3J
         26gj9G+bQN7i7QhZLxVVkxIiMTwgK1B8KagnCbLAUnXCw/Lp9oU2FY15HyXR1pGiFxkq
         tlnMHNaT67K3qsCuneC3VnBAG6DTnnbgChJgch5KtnOurH0ThjCwSilql0gQWCYWdlJM
         KSabPVj3fqaVJIUJkH6n9Wwhg9TtiNlDkyIkjvJl7h8fck8/+ALESIXBPSCMjTr69RDO
         6gYIujrlmJGMjugcgGWe9VHJEqeXQbtCyZ6whkUD1it8I061GSOYS6d14w0rmfyhGJqV
         L8Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765433491; x=1766038291;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hhKmlg+dr84Ob9dnVY4ZzRu8BFKGqs9p9d9Zofmoi2k=;
        b=jbF85dZ70NGv4CeMPys9cJJ8JsKkvCbwu+3uYJQNTm+1BfnWNk+IifR5QZMvYBu8au
         c4ujInl5rLhKmACW3YcS2gMC8sgpRoL5LWsJBEygTiLFmwAhR64tXlEBAmI/kt+AvWjm
         IpiwoFQ2vDMizzHV6DyNmQuJbgatmdyE8VzCxx50/YcFI+6H3QQeyjRiyHHjRLgmlcym
         JR6kQ8nle+2LpcdiOZi+oBVxt/SR/MQZc0x7+nek3U7Dynw9RsgSHY/TC+sa1HIPg4+f
         SsSFt0u6hZxCwO75ShzdyXshcZk7MKaL12j6OgxZGmYZ1asv2yKvN7YQQzZjmV2aml0p
         CObQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYki6RGL8jLadBLFBHoHJFxfjYWsDe0HRz3OwWJlP6EtdJfNZTgSOhkrfm+alM29VVkwhwKq0aXJgAzMWA@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv6OXg0Bha3BaXVubtH1C/xBpZd+9GHRJFC8qr1mD9db7H1Bz7
	NALqa3YpTjmXthW/ictM3vxrQeFok52aPF6+/8CkRBAeeX4pm0OHKumAHlt00vWgFCPVi+SNzHc
	BENJmWE8ZmVCr2SXIQNgq1qwuE4nwSQ15GERoZAg+QU4lEeKyaJCS0NEhqZYQteH7mULi
X-Gm-Gg: AY/fxX44Mc7TDDT0oNQ8SHMC6vE3OrHNQSL0WGr8LHiU6I9lklzo8knxO+CO+dbUW1c
	1fy4/l9IRyDqGMqQQHHQuJFq+ZNalphIcOJ/fFlVFVtPIiwiTNaHThx9fwAxQ3NOz1nOBsFk63k
	1wIUewAPiiXBCLXA7g9xdu2Xowpd08GFmu2MZ9IU3axClhJot7/0r8DbpnKyZ8tzoSVlAq2MQU/
	lgtSRC+HTxVcR85T+sUF2J8aIkDInEMLguA4+/PF2meXRGdvz42oaeU6ZcJUFk7WvvYS9yFPMZ9
	c7UuP9kss0T6clpEmDROk6uMwgite13tca+Cbhh7Jzpj34c7g9lufqDbFyEgEzvMVS7AzdJazio
	a6Ll5JYFAK0U2toOf7vfmkW2XSgpevu0WogTm3Scspcg1/7u5EDgDlz0ISEEpnviaUIue3YBH
X-Received: by 2002:a17:903:2ad0:b0:297:e6ca:c053 with SMTP id d9443c01a7336-29eeec20c22mr11829705ad.28.1765433490861;
        Wed, 10 Dec 2025 22:11:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEP1MBAmTxcDM3jcF7DZAzVPeroWYEEpD7mILKBfX34r4oPJYP+nwbcPBWJ1vpa5U18NSbUmA==
X-Received: by 2002:a17:903:2ad0:b0:297:e6ca:c053 with SMTP id d9443c01a7336-29eeec20c22mr11829345ad.28.1765433490342;
        Wed, 10 Dec 2025 22:11:30 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea065186sm11725945ad.89.2025.12.10.22.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 22:11:29 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v8 0/8] coresight: ctcu: Enable byte-cntr function for TMC
 ETR
Date: Thu, 11 Dec 2025 14:10:39 +0800
Message-Id: <20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGBgOmkC/x3MQQqDMBBG4avIrDugqULqVaSLJP5pB0qUSSwt4
 t0NLr/FeztlqCDT2Oyk+EqWJVXYW0Ph7dILLHM1mdYMnWnvjOT8B+z/BRxSUY6Lcihh48H13tp
 oIvyDar8qovyu9/Q8jhPjpI+xawAAAA==
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765433483; l=6040;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=5BM2CWCRUwDmWsorg4jLpNENuRewNcYdGIPmj8dFZgA=;
 b=o57wJbiSUpppAVGEDZtAxfZ5CxfdD22rx+Jg53w0YJ28lr9+/IljDW5vy5EFinBdbwsAJIkAK
 ORm0mZ91Oi3BZdIU7ya5Kil0/YdqwFuHb5jD8AowaBvsRvJlYIxRSz/
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA0MiBTYWx0ZWRfX3ufL2XQmVOEi
 pHbB/w0bwQP4PPHoONzKsq1uGxjtUZCOl/SdTRGMUe2/7AP1p9h2mQ3mY6YryaTThPO6t1snaqP
 lREne4KipeiYyR46OURnoF/JEeiDa7De3S3Yn+E7dCXH3+WERYuAMBFfza9e4gkAephRuzbOtFI
 Tv2j2tTx7T67PrdQXo7XCvjp/HkLpzuCRn90m8SVoK5pzQDWJl2vjj4YF5+nPciOsryK+ue6p1l
 f3xdSCCsHvOYtBJvUk4gXdYHfhUCxbXhtwhtKayGyYaIdPbb2zgjSN3GQDNgBIeyBiF7uZigoUD
 CiTQTgZoIEqulqzmwnFlYHQ44kT6ZSbolvqWzTAFirWBiPEloIn/XQQvYSyHWVB/lXWijqSg7re
 tPtEY6LrTohrTSS02aTvBqfxcQFgiQ==
X-Proofpoint-ORIG-GUID: ljHj_0m7Bs1NXW3040IcbSFfnuFqFGJH
X-Proofpoint-GUID: ljHj_0m7Bs1NXW3040IcbSFfnuFqFGJH
X-Authority-Analysis: v=2.4 cv=LJ9rgZW9 c=1 sm=1 tr=0 ts=693a6094 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=4JJaRIKzVo7dG1xzKtwA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110042

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

Changes in V8:
1. Optimizing the patch 1 and patch 2 according to Suzuki's comments.
2. Combine the patch 3 and patch 4 together.
3. Rename the interrupt-name to prevent confusion, for example:etr0->etrirq0.
Link to V7 - https://lore.kernel.org/all/20251013-enable-byte-cntr-for-ctcu-v7-0-e1e8f41e15dd@oss.qualcomm.com/

Changes in V7:
1. rebased on tag next-20251010
2. updated info for sysfs node document
Link to V6 - https://lore.kernel.org/all/20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com/

Changes in V6:
1. rebased on next-20250905.
2. fixed the issue that the dtsi file has re-named from sa8775p.dtsi to
   lemans.dtsi.
3. fixed some minor issues about comments.
Link to V5 - https://lore.kernel.org/all/20250812083731.549-1-jie.gan@oss.qualcomm.com/

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

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Jie Gan (8):
      coresight: core: Refactoring ctcu_get_active_port and make it generic
      coresight: core: add a new API to retrieve the helper device
      coresight: tmc: add create/clean functions for etr_buf_list
      coresight: tmc: Introduce sysfs_read_ops to wrap sysfs read operations
      dt-bindings: arm: add an interrupt property for Coresight CTCU
      coresight: ctcu: enable byte-cntr for TMC ETR devices
      coresight: tmc: integrate byte-cntr's read_ops with sysfs file_ops
      arm64: dts: qcom: lemans: Add interrupts to CTCU device

 .../ABI/testing/sysfs-bus-coresight-devices-ctcu   |   6 +
 .../bindings/arm/qcom,coresight-ctcu.yaml          |  17 +
 arch/arm64/boot/dts/qcom/lemans.dtsi               |   5 +
 drivers/hwtracing/coresight/Makefile               |   2 +-
 drivers/hwtracing/coresight/coresight-core.c       |  59 ++++
 .../hwtracing/coresight/coresight-ctcu-byte-cntr.c | 368 +++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c  | 107 ++++--
 drivers/hwtracing/coresight/coresight-ctcu.h       |  62 +++-
 drivers/hwtracing/coresight/coresight-priv.h       |   4 +
 drivers/hwtracing/coresight/coresight-tmc-core.c   | 104 ++++--
 drivers/hwtracing/coresight/coresight-tmc-etr.c    | 112 +++++++
 drivers/hwtracing/coresight/coresight-tmc.h        |  37 +++
 12 files changed, 824 insertions(+), 59 deletions(-)
---
base-commit: 47b7b5e32bb7264b51b89186043e1ada4090b558
change-id: 20251203-enable-byte-cntr-for-ctcu-5a4b88f2feb9

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


