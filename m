Return-Path: <linux-arm-msm+bounces-86511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7772CDBBE1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 10:07:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 478033005ABF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 09:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6949A32E738;
	Wed, 24 Dec 2025 09:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lDJJ94Bj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qlh0uQTM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C432BD01B
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766567226; cv=none; b=WG+T9vc2tg6kpAu/suxJfkunlNYOAZ0d87SOZkL8NDK9r73I5YPGUC26OqZDI2p5CoBr2NNHQQ3TaxI47DaMmAqzT+l23BCss9DxgTBiMvHE+ecl4v4vHaJxX9uaWg0Z0yuRWdrVuLEnXzB0cbTm1WWksICIjxybup0KBXdkfkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766567226; c=relaxed/simple;
	bh=gI0GMnFsxeTTlemFx0xkofKHL1cWQfurlLnq0A452OA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EG5xddoBmy+XgTGyn2oB4lQ0jXU2ex2Gip+YJiGHTvz9xc8XulAN8ikWWxiGzYBH/OJMq0NvMht4NXvA3FnYBpsGanM1DHfPNB/V+xvVfzoR1GgKaCBcMrM8CUbTBtU3pwxG7oi78vHWLGatQFwILrYsxggwU0i7k/Vk6RMcduY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lDJJ94Bj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qlh0uQTM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO87eiF721508
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ia6/OStjyKiLP7Zh6BePpi
	GWv1JXPdcS3s+P0J7BOq8=; b=lDJJ94BjtOQ+Xvpc7KrRiRT4Q6bkv9tJlypToz
	cWmSrgr4yxiSI5DgE7iTZz0mX8qGFS9bFaEFxG7NB6JoggXhGvUBp1MAw3cVsyg5
	YY4BPHhJZPunVHjCZ0eO6ZRhtVlM70WcBqIvL0YXcvgnAQgS7scwKWZJ/5x0Ev18
	DbMmuDvACE+M8HnuRVwG+1RCSG1+K7KAFt8fxR7dVsVtV/ZLl8v2CSi2uQ9NV6uG
	f3gJtzMP8++fAvSznBQxuTAGCTB1gGoraNr6gvG6Ax2W+md+N8S4YzTLzpGCKmJz
	ab1XVqcVgsMMgdSrU44sTpxR0Q4iEBuLbQW/hzsttf8jgMTg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b81mt9r4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:07:03 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a31087af17so92346225ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766567222; x=1767172022; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ia6/OStjyKiLP7Zh6BePpiGWv1JXPdcS3s+P0J7BOq8=;
        b=Qlh0uQTMimldaTxPENkQSdKYwpkjG0O/o/xBcSIopRYVmSxZFdUOlHWnSqkriBsW1B
         qd57ujRQF1HiKsoyAneIGN5E4pyGStX7cx3Qgn2NaNJa+ctPk677E9J1FLscmdbYW0Z/
         SYI9zX09O28CUHTLqrKlf0i++gsjjbR3Yzatb0V29lgEkFdAG+kKZLDi6Aj5ugp51FXa
         Pye7dwg7+wk7ua/DAaKq28teWtDkCZ7YF4zHeepZh2a0140Xzknry+g67EAL1sdzB2jF
         M5e4tS+cCnpYEfgkbxHV3AD+OpFsqKPx3D76uny3N+rTbDWC9OuoqeOg3qRd8awogbRd
         SgjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766567222; x=1767172022;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ia6/OStjyKiLP7Zh6BePpiGWv1JXPdcS3s+P0J7BOq8=;
        b=Hqn7HrjwUEBh3139g+YeY9WeCQgkXtLYjGoHkEPa4KhBlmofWGDiYtdbHlpmOBZqrc
         +lyBocH0iZoIzlkUq9Ucn2xQ9BTSanHoTLqMmWBO7XncQFX1OkxAXUesI09ieu+MQaoz
         /yhlYxXm28ByjE6UjO91liObSL0UD1whl3qMjE2MiVRbMD865DC9qPMKHfCFwqL9FzFc
         Kj0+fHihsjXBBKQRphIbw/W035z4q3eCKMlJtTcp7iWGnaXUvQJUMegjZGTb2PP31QLb
         XlReE5gZ1SSDmiQhvvQUbaCe3L+c7Dll1SIXx24tS2mQ2ikTA4fO3skLNT5/fE8/i7t4
         4m0g==
X-Forwarded-Encrypted: i=1; AJvYcCXdy+XDVKIl/qlAzg3v/DIzgMzLcZcjSe91KLbPahmvgqgvJqW7pLQQGnFWbFWXrzO1HhHVN4RcEwkzD8Gx@vger.kernel.org
X-Gm-Message-State: AOJu0YyOi919LrqmN3oCYgNJbGxmfK4NmIe0Xs2rxj0nm8Vh+WA2qdUi
	A7/ULe7LEfzPL+BMSFf0UXEX+vgusdU6aqEDuaG48DxD6LjWPzrcgfmzNZe4Y6eIjOGQyWfoFYq
	GKT4NwWAw3j5IgZMWhvKnzkDGs99srk3DGUGo6ErP2kDyM9XQxtYS/QVzlWXgLwk7aMaReNfSwJ
	jw
X-Gm-Gg: AY/fxX7m0IQVI+IrM2p2iGVYwrnMyJGR6fAvj1hZPGSOQzWmuNxb6SSl0nMubWYWaiT
	apYG8DbcUMo27aQ00kVJFh1CXYl9kMV1a0f3e9D+LI15/74ICIZ76llXrg8eZoJx/cY9FC/PKC3
	+k2bgzbENmluVMNbWBXOG8Z4Zc4jrn5foGbbWSXP2/WPRWUxeWl1ar9/ioMfiuaOW6IbswW6Srr
	QBde5NKSE4Lj/SOIYyc6ZSNAGoFnaAaz8nt2JbKyJuOzRT3hhpc/OQZwO4Kf9KbY0gtBfI2lw5c
	LKyhF8kvvaVC+aaptP51/9H+zMT7y7CtlVAR3eVf7Sic85S7i4saBtsspRNd7rmt5/RnG1umSm5
	R5jk73eBLwWiMVR6vWZOwxxBozn4cHg04nhaSOpLqnP1CYZpODwQ6ECoxH6s4ruEI811wWZbx
X-Received: by 2002:a17:903:18b:b0:2a0:a793:3357 with SMTP id d9443c01a7336-2a2f283f1f2mr157208205ad.43.1766567222038;
        Wed, 24 Dec 2025 01:07:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEPEqFqsmbosV7lRizL3DCjWOa/+dXuC4bhQL+3UWcYhgtl1QY7daIUl5qIu6Tn1ils27yN+Q==
X-Received: by 2002:a17:903:18b:b0:2a0:a793:3357 with SMTP id d9443c01a7336-2a2f283f1f2mr157207905ad.43.1766567221478;
        Wed, 24 Dec 2025 01:07:01 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c666d5sm148418095ad.21.2025.12.24.01.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 01:07:01 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v9 0/8] coresight: ctcu: Enable byte-cntr function for TMC
 ETR
Date: Wed, 24 Dec 2025 17:06:10 +0800
Message-Id: <20251224-enable-byte-cntr-for-ctcu-v9-0-886c4496fed4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAOtS2kC/32NQQqDMBREryJZ94s/qRC76j2KiyT9qQFN2iRKR
 bx7U+m6m4E3MG82lig6SuxSbSzS4pILvkB3qpgZlH8QuHthxhveIm8EkFd6JNBrJjA+R7Ahgsl
 mhladtZSWW9IdK/tnJOveh/vWFx5cyiGux9Uiv+3PivjHukhoQBByawUK7PAaUqpfsxpNmKa6B
 Ov3ff8AzBr7jskAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766567215; l=6411;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=gI0GMnFsxeTTlemFx0xkofKHL1cWQfurlLnq0A452OA=;
 b=rr7NBF5v4yRqTN0cHqwBoJ6aimVZ9gdjrBvW+xivl3gv35onwrqriVrscwsK4NNgTEM85Vv7f
 qKYSMI5bewfAF2/0BDB0VXKcnmIKfL58LepkGJwfNKblpowPXLdQnoL
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=e/ILiKp/ c=1 sm=1 tr=0 ts=694bad37 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=VhXNoj4JT-yUwxqwOhYA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ELg8-kpDgywbCa-C0Y2iVzhEhuO4hiHW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA3OCBTYWx0ZWRfX1CgH9nr8/o2A
 HW5Ljr9+aXYkI7EaMLDJjP9wrV1UkA7EMfmZ5DmTMUUCyBnLKo6DLENZRyhwAiVZiyWflO3dE/3
 wgb9NUQ5Z1Gs3MQcg73K9111gKkJXyrGBJ5cHQ7DXhM9CLKayMwIGHX176T+0EcHL6NgNCQj8gd
 f5PocQ8uBooycZPwfgCowKehAF8dTTAQGFvOEgX1FcxASeopf8pyJwUor8Tw/RG9aNLEdhOBO/E
 r1z76sQnAcm2Rh6np56b8MfBudc2GwQVZtbnDVMOA7WaTP2OOiPUzmOUBYXRU57yw/g1r8TTIf4
 ah/s70Tp5G1nFo7iHsTanoQ7LUDhVivkkBgvPd+Q1gYl5pLVw/93CL14VYq7LEOhkUhCl5LqSIM
 4OOeI79FYP2ZJZFwi1tpkxY1kW8rddj9WjIxw27AzSNjwWlGh7XmuNkim/bkgisWD656RWZtZGt
 XQIHjQnR08Zl6CwJDxg==
X-Proofpoint-ORIG-GUID: ELg8-kpDgywbCa-C0Y2iVzhEhuO4hiHW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240078

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
echo 0x10000 > /sys/bus/coresight/devices/ctcu0/irq_threshold0
echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
echo 1 > /sys/bus/coresight/devices/etm0/enable_source
cat /dev/tmc_etr0

Reset the BYTECNTR register for etr0:
echo 0 > /sys/bus/coresight/devices/ctcu0/irq_threshold0

Changes in v9:
1. Drop the patch: add a new API to retrieve the helper device
2. Add a new patch to refactor the tmc_etr_get_catu_device function,
   making it generic to support all types of helper devices associated with ETR.
3. Optimizing the code for creating irq_threshold sysfs node.
Link to v8: https://lore.kernel.org/r/20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com

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
      coresight: tmc: add create/clean functions for etr_buf_list
      coresight: tmc: Introduce sysfs_read_ops to wrap sysfs read operations
      coresight: etr: refactor the tmc_etr_get_catu_device function
      dt-bindings: arm: add an interrupt property for Coresight CTCU
      coresight: ctcu: enable byte-cntr for TMC ETR devices
      coresight: tmc: integrate byte-cntr's read_ops with sysfs file_ops
      arm64: dts: qcom: lemans: add interrupts to CTCU device

 .../ABI/testing/sysfs-bus-coresight-devices-ctcu   |   8 +
 .../bindings/arm/qcom,coresight-ctcu.yaml          |  10 +
 arch/arm64/boot/dts/qcom/lemans.dtsi               |   3 +
 drivers/hwtracing/coresight/Makefile               |   2 +-
 drivers/hwtracing/coresight/coresight-catu.c       |   3 +-
 drivers/hwtracing/coresight/coresight-core.c       |  24 ++
 .../hwtracing/coresight/coresight-ctcu-byte-cntr.c | 366 +++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c  | 122 +++++--
 drivers/hwtracing/coresight/coresight-ctcu.h       |  77 ++++-
 drivers/hwtracing/coresight/coresight-priv.h       |   2 +
 drivers/hwtracing/coresight/coresight-tmc-core.c   | 104 ++++--
 drivers/hwtracing/coresight/coresight-tmc-etr.c    | 144 +++++++-
 drivers/hwtracing/coresight/coresight-tmc.h        |  40 ++-
 13 files changed, 833 insertions(+), 72 deletions(-)
---
base-commit: 47b7b5e32bb7264b51b89186043e1ada4090b558
change-id: 20251203-enable-byte-cntr-for-ctcu-5a4b88f2feb9

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


