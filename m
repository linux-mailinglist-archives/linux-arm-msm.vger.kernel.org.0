Return-Path: <linux-arm-msm+bounces-84043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B0584C9A5CD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 07:44:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C740734456C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 06:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13A7B30215D;
	Tue,  2 Dec 2025 06:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="beALRJ+C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JenUS+/p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29D13019C3
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Dec 2025 06:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764657808; cv=none; b=g2LD9vlEAnQpr+RT5+VrTBNBPs8QHP4p23o+iiFbCXhsWEcFgpd/Cl11YHuQMWWOGV7rDdWeDRkfmsqqwbzjkl1WMRj/St2rzW+sx/rkP6FmRAmP2D+WClk9LEg3ISlyKWlum+rO8GLCho97JDLtDIoACqOBqlx1qt4dGbfl5KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764657808; c=relaxed/simple;
	bh=PtB0BtXlP5YVfymzMpYmNBA2P6kWUJMFu7WMeMPHIHQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oXK85etN7S9918tYfrTM2XvH4NxTXKBvepJJNfUu1xGq1k9jhFzsvsKkLsniRf26yYbA2ZrURw79sT51of8Qsby7RDh77TcdDljGMFmFVC58NiPbcLuOIUjjsUUesp7gY11zuTrIETg4YAEpRW276wLPRnXVwR+U5Z3W7MUuB4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=beALRJ+C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JenUS+/p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B23ivaM979248
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Dec 2025 06:43:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+IspkF7gTDoWesqXAkpx7IlgCLV6iSsek/5vNIm3b+g=; b=beALRJ+CIEbo3zYy
	5KYtQwAAbedqgzTiIcPYIJA02/DW5gWA680Z9K1BlJhZ7MrYNqysNDnzZ+oawHN4
	kRrR1aQ2kJoluUo+PWciLjY4NLfeEHjHiSHAJuIqCT89NeEsC6nqESbtWTTLMYvT
	SahgBLEY7oGUHPGB9dua9RfNby0Md/zIvtzrhxSgQYVW26s8zla10afloMnT2WFg
	cjWijjm9aQvldAnGCOF0lwc/5POsEVieGQYvMyQ+tlmHbBvbtOyd/b3dngK8GmRG
	BMFzd2G2Dg0hnvHLDOV5oaWfdigvWEX4rwqO/rlYsJTlQ/JVL1OaW6PHjA1ZbqDt
	9/nhMA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asgpkt0cp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 06:43:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29845b18d1aso92665605ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 22:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764657804; x=1765262604; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+IspkF7gTDoWesqXAkpx7IlgCLV6iSsek/5vNIm3b+g=;
        b=JenUS+/p5g0N5bO9RoM2cZZUfv48o3NEVXllwi1OQeaWgGba/8jxzJqVPfqQAT3KBp
         k6iRKWcRv3qSNZLODCxA70D9mjRNPbFFgtFhomTanqqZ1AoOUB4MIhdfhFcmn+hfmgjr
         VX18y96she/1CtP/HyGYIxh94cdOMp7Z2Vm8D2WfeelAxLaEWn7U0zLqi+3Ap2zJ1/mX
         tAvMoNiswS2AAIGbCZO14mDOh2+3eAczZLkQNJ70A27VI2zp3xlzcTcHsA76QvbAFlld
         XYWmrHRx4nsHKXcndXZ0Vs3RT1A53r5su49mX4vtLSwJ6S+B1vZtn8hqPsZyoaJYXI81
         goSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764657804; x=1765262604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+IspkF7gTDoWesqXAkpx7IlgCLV6iSsek/5vNIm3b+g=;
        b=N9aPvRaAZdDzzP3uNTvy13X60cwzC+seI0z0rvenBTPVQrxkVHR9wvo1GoU4OP2qAx
         Vl6GIZGGZVMQD/yHbONmIgAsvRowgYgH13joRtm46VJx/60RKb2sfGMhezPP2Bq004L4
         tPcmBpjJJLbOwVqjITPPgPpX7hyyiEaTLGWUTcrZuR9vOH/YdhO+FnG3tKilB7QFrZTW
         8soATGRCsR2pEMSpYe2x3P0nzjXEVngQnKpYgraNtV5hyUjqpFnzusZ7bnhBv/bahQob
         NhtMnTf/REk+wYH/F2jC4lkQbXZuXtOZipA/VitwdmpaiWm3VEQ2rxHRacyOLsjQpQUM
         t72Q==
X-Forwarded-Encrypted: i=1; AJvYcCUkTgTHwtvv33tB76ZwZwvck9V+8+e3YvLxAcaGNz+4qsPqbfPX+xPqpFRYy65wJ4q9JPDu3oczz9lHKCxe@vger.kernel.org
X-Gm-Message-State: AOJu0YyUoEqh1Pw2LVXHDfKoyfwCa7tSrk7miq2Dx9efvcLvOysXpxhV
	zBLymeMNvgeN42266zeYvCEXHQel4nQALgSppa4J4OtuwKJQTD7QcIRV8U4Y7JdGw5ThTRGTX3R
	hZaqPDiVMDXkty6Y8VsL0wlVyojM3bGorMzVqZHSq1WiQJszVP2B93tDuI6pT3E/oPiZY
X-Gm-Gg: ASbGnctPQ+pvUNOn372ODgic2+kjxev3WJNiWfAZl49r0VmUcvTCjyCzxLzTLryJ7mE
	PiH4XQqlXfwpsnqW773wcGLbN9xKmcJrzcsIUb05cqBolpWJhRuEcGmcGb2gwxjbSEHoxbastOC
	mAvWg721rouvratB+STpdBCTjjqnvV8BFG64SHeCO82bca5W+fbgwI/HdMCVKNNw59DsfO/8IiD
	QuQ4SSgt/G2KX5XnONYvfo+o572ZquKIZ+945s//isxn5zL7H5sRPR0rNhQxkj3zbGFZ6S7uhEd
	Ng0BNco1tav28X31BBbDtnSXomO+lPcM5/Kwpt/bOruktVHU+YkiFhKmg32/aP2iSOnAGJZFp1h
	byrvOqpGvxpwEiXzBSs2GJnBSXoozeNcGcpMmanzPvmdGbNzaJL2vhsw8rqoGBHvcX1wcK8pH2E
	IWIg==
X-Received: by 2002:a17:903:198c:b0:297:ddb6:ef81 with SMTP id d9443c01a7336-29b6c3e83d7mr430776465ad.16.1764657803630;
        Mon, 01 Dec 2025 22:43:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFHb5ciFmPEoqBg+z5rwGbm61VuIgxrFXhOrfGSvp5tLruUPs03mWmDRDKKG7XFtL7HoMHtIg==
X-Received: by 2002:a17:903:198c:b0:297:ddb6:ef81 with SMTP id d9443c01a7336-29b6c3e83d7mr430776235ad.16.1764657802933;
        Mon, 01 Dec 2025 22:43:22 -0800 (PST)
Received: from jinlmao-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb450cfsm141821675ad.74.2025.12.01.22.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 22:43:22 -0800 (PST)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Date: Tue, 02 Dec 2025 14:42:21 +0800
Subject: [PATCH v6 2/2] coresight: cti: Add Qualcomm extended CTI support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251202-extended_cti-v6-2-ab68bb15c4f5@oss.qualcomm.com>
References: <20251202-extended_cti-v6-0-ab68bb15c4f5@oss.qualcomm.com>
In-Reply-To: <20251202-extended_cti-v6-0-ab68bb15c4f5@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, quic_yingdeng@quicinc.com,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764657791; l=23700;
 i=yingchao.deng@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=PtB0BtXlP5YVfymzMpYmNBA2P6kWUJMFu7WMeMPHIHQ=;
 b=UVyOeBFEV08wvIIQRSnaoExP1F6ybAw2v+2hTVK+BHAOn/LIXHWnMoIrIpa9/zxCjQCJ85Fvp
 JL8QPKnoRyvDWryfvohnbAvxuKgQBozIDdUgouAQKn9zQVOfZW/JZiA
X-Developer-Key: i=yingchao.deng@oss.qualcomm.com; a=ed25519;
 pk=QWvd9DuX5YKvc7/VfWGCElGNr3HbCyig5bEb+lUUohg=
X-Proofpoint-GUID: WBr877vsBYKTyenwJIOeV_A43cDq3EoY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA1MSBTYWx0ZWRfX0c04myeJHBJ5
 n6i+mhI6FFBf6wVrFX2BJW7bxuvEDQHTbJzgOQrSnST5z0UMmrX9yaXcjX5lJUA6SqM0h9ea7rX
 z2v62jsDtYg7CJ2CHc/5ZS3PxLSztCDc+CI8Kt/o1jIQxDtVB5ffscPzg1cynUtk5cBLudaRtdY
 9D07zy7+bEMyGJsjQVbvzTGmCSrfw5trnPENDqqqjUl5PpNlfTi51tXv6k5QJUZsrsJAwSJaQiv
 F5/169+wwpcvKxDblgxDLQB5O4iHIwZBVGg5LN8HVGAq4eaP6nPp/uh2lemBE+UQTOPwOZRGp+y
 HCDg7XWUBseN0jMBv820W6p0Fn0GwxDDeJhoMtezbMuJAQSalC/PEgRiEJnfxs67d2ojIQ0Yafk
 MxpxZnIGK0WJ3B/O68zfwqS1/OROZg==
X-Authority-Analysis: v=2.4 cv=Vcf6/Vp9 c=1 sm=1 tr=0 ts=692e8a8c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=MyaKAwSpj8bC-vdJwaUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: WBr877vsBYKTyenwJIOeV_A43cDq3EoY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020051

The QCOM extended CTI is a heavily parameterized version of ARM’s CSCTI.
It allows a debugger to send to trigger events to a processor or to send
a trigger event to one or more processors when a trigger event occurs
on another processor on the same SoC, or even between SoCs. Qualcomm CTI
implementation differs from the standard CTI in the following aspects:

1. The number of supported triggers is extended to 128.
2. Several register offsets differ from the CoreSight specification.

Co-developed-by: Jinlong Mao <jinlong.mao@oss.qualcomm.com>
Signed-off-by: Jinlong Mao <jinlong.mao@oss.qualcomm.com>
Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-coresight-devices-cti    |  11 ++
 drivers/hwtracing/coresight/coresight-cti-core.c   |  95 +++++++++--
 drivers/hwtracing/coresight/coresight-cti-sysfs.c  | 177 ++++++++++++++++-----
 drivers/hwtracing/coresight/coresight-cti.h        |  43 ++++-
 drivers/hwtracing/coresight/qcom-cti.h             |  29 ++++
 5 files changed, 304 insertions(+), 51 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti b/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
index a2aef7f5a6d7..9478dfcee03b 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
@@ -245,3 +245,14 @@ Date:           Aug 2025
 KernelVersion   6.18
 Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
 Description:    (Read) Show hardware context information of device.
+
+What:           /sys/bus/coresight/devices/<cti-name>/regs/ext_reg_sel
+Date:           Dec 2025
+KernelVersion:  6.19
+Contact:        Mao Jinlong <jinlong.mao@oss.qualcomm.com>
+Description:    (RW) Select the index for extended registers.
+		QCOM CTI supports up to 128 triggers, there are 6 registers
+		need to be expanded to up to 4 instances:
+		CTITRIGINSTATUS, CTITRIGOUTSTATUS,
+		ITTRIGIN, ITTRIGOUT,
+		ITTRIGINACK, ITTRIGOUTACK.
diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index f9970e40dd59..51b3644e97c4 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -21,6 +21,55 @@
 
 #include "coresight-priv.h"
 #include "coresight-cti.h"
+#include "qcom-cti.h"
+
+static const u32 cti_normal_offset[] = {
+	[INDEX_CTIINTACK]		= CTIINTACK,
+	[INDEX_CTIAPPSET]		= CTIAPPSET,
+	[INDEX_CTIAPPCLEAR]		= CTIAPPCLEAR,
+	[INDEX_CTIAPPPULSE]		= CTIAPPPULSE,
+	[INDEX_CTIINEN]			= CTIINEN(0),
+	[INDEX_CTIOUTEN]		= CTIOUTEN(0),
+	[INDEX_CTITRIGINSTATUS]		= CTITRIGINSTATUS,
+	[INDEX_CTITRIGOUTSTATUS]	= CTITRIGOUTSTATUS,
+	[INDEX_CTICHINSTATUS]		= CTICHINSTATUS,
+	[INDEX_CTICHOUTSTATUS]		= CTICHOUTSTATUS,
+	[INDEX_CTIGATE]			= CTIGATE,
+	[INDEX_ASICCTL]			= ASICCTL,
+	[INDEX_ITCHINACK]		= ITCHINACK,
+	[INDEX_ITTRIGINACK]		= ITTRIGINACK,
+	[INDEX_ITCHOUT]			= ITCHOUT,
+	[INDEX_ITTRIGOUT]		= ITTRIGOUT,
+	[INDEX_ITCHOUTACK]		= ITCHOUTACK,
+	[INDEX_ITTRIGOUTACK]		= ITTRIGOUTACK,
+	[INDEX_ITCHIN]			= ITCHIN,
+	[INDEX_ITTRIGIN]		= ITTRIGIN,
+	[INDEX_ITCTRL]			= CORESIGHT_ITCTRL,
+};
+
+static const u32 cti_extended_offset[] = {
+	[INDEX_CTIINTACK]		= QCOM_CTIINTACK,
+	[INDEX_CTIAPPSET]		= QCOM_CTIAPPSET,
+	[INDEX_CTIAPPCLEAR]		= QCOM_CTIAPPCLEAR,
+	[INDEX_CTIAPPPULSE]		= QCOM_CTIAPPPULSE,
+	[INDEX_CTIINEN]			= QCOM_CTIINEN,
+	[INDEX_CTIOUTEN]		= QCOM_CTIOUTEN,
+	[INDEX_CTITRIGINSTATUS]		= QCOM_CTITRIGINSTATUS,
+	[INDEX_CTITRIGOUTSTATUS]	= QCOM_CTITRIGOUTSTATUS,
+	[INDEX_CTICHINSTATUS]		= QCOM_CTICHINSTATUS,
+	[INDEX_CTICHOUTSTATUS]		= QCOM_CTICHOUTSTATUS,
+	[INDEX_CTIGATE]			= QCOM_CTIGATE,
+	[INDEX_ASICCTL]			= QCOM_ASICCTL,
+	[INDEX_ITCHINACK]		= QCOM_ITCHINACK,
+	[INDEX_ITTRIGINACK]		= QCOM_ITTRIGINACK,
+	[INDEX_ITCHOUT]			= QCOM_ITCHOUT,
+	[INDEX_ITTRIGOUT]		= QCOM_ITTRIGOUT,
+	[INDEX_ITCHOUTACK]		= QCOM_ITCHOUTACK,
+	[INDEX_ITTRIGOUTACK]		= QCOM_ITTRIGOUTACK,
+	[INDEX_ITCHIN]			= QCOM_ITCHIN,
+	[INDEX_ITTRIGIN]		= QCOM_ITTRIGIN,
+	[INDEX_ITCTRL]			= CORESIGHT_ITCTRL,
+};
 
 /*
  * CTI devices can be associated with a PE, or be connected to CoreSight
@@ -70,15 +119,16 @@ void cti_write_all_hw_regs(struct cti_drvdata *drvdata)
 
 	/* write the CTI trigger registers */
 	for (i = 0; i < config->nr_trig_max; i++) {
-		writel_relaxed(config->ctiinen[i], drvdata->base + CTIINEN(i));
+		writel_relaxed(config->ctiinen[i],
+			       drvdata->base + cti_offset(drvdata, INDEX_CTIINEN, i));
 		writel_relaxed(config->ctiouten[i],
-			       drvdata->base + CTIOUTEN(i));
+			       drvdata->base + cti_offset(drvdata, INDEX_CTIOUTEN, i));
 	}
 
 	/* other regs */
-	writel_relaxed(config->ctigate, drvdata->base + CTIGATE);
-	writel_relaxed(config->asicctl, drvdata->base + ASICCTL);
-	writel_relaxed(config->ctiappset, drvdata->base + CTIAPPSET);
+	writel_relaxed(config->ctigate, drvdata->base + cti_offset(drvdata, INDEX_CTIGATE, 0));
+	writel_relaxed(config->asicctl, drvdata->base + cti_offset(drvdata, INDEX_ASICCTL, 0));
+	writel_relaxed(config->ctiappset, drvdata->base + cti_offset(drvdata, INDEX_CTIAPPSET, 0));
 
 	/* re-enable CTI */
 	writel_relaxed(1, drvdata->base + CTICONTROL);
@@ -214,6 +264,9 @@ void cti_write_intack(struct device *dev, u32 ackval)
 /* DEVID[19:16] - number of CTM channels */
 #define CTI_DEVID_CTMCHANNELS(devid_val) ((int) BMVAL(devid_val, 16, 19))
 
+/* DEVARCH[31:21] - ARCHITECT */
+#define CTI_DEVARCH_ARCHITECT(devarch_val) ((int)BMVAL(devarch_val, 21, 31))
+
 static int cti_set_default_config(struct device *dev,
 				  struct cti_drvdata *drvdata)
 {
@@ -394,8 +447,8 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
 
 	/* update the local register values */
 	chan_bitmask = BIT(channel_idx);
-	reg_offset = (direction == CTI_TRIG_IN ? CTIINEN(trigger_idx) :
-		      CTIOUTEN(trigger_idx));
+	reg_offset = (direction == CTI_TRIG_IN ? cti_offset(drvdata, INDEX_CTIINEN, trigger_idx) :
+			cti_offset(drvdata, INDEX_CTIOUTEN, trigger_idx));
 
 	raw_spin_lock(&drvdata->spinlock);
 
@@ -479,19 +532,19 @@ int cti_channel_setop(struct device *dev, enum cti_chan_set_op op,
 	case CTI_CHAN_SET:
 		config->ctiappset |= chan_bitmask;
 		reg_value  = config->ctiappset;
-		reg_offset = CTIAPPSET;
+		reg_offset = cti_offset(drvdata, INDEX_CTIAPPSET, 0);
 		break;
 
 	case CTI_CHAN_CLR:
 		config->ctiappset &= ~chan_bitmask;
 		reg_value = chan_bitmask;
-		reg_offset = CTIAPPCLEAR;
+		reg_offset = cti_offset(drvdata, INDEX_CTIAPPCLEAR, 0);
 		break;
 
 	case CTI_CHAN_PULSE:
 		config->ctiappset &= ~chan_bitmask;
 		reg_value = chan_bitmask;
-		reg_offset = CTIAPPPULSE;
+		reg_offset = cti_offset(drvdata, INDEX_CTIAPPPULSE, 0);
 		break;
 
 	default:
@@ -895,6 +948,7 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 	struct coresight_desc cti_desc;
 	struct coresight_platform_data *pdata = NULL;
 	struct resource *res = &adev->res;
+	u32 devarch;
 
 	/* driver data*/
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
@@ -981,9 +1035,28 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 	drvdata->csdev_release = drvdata->csdev->dev.release;
 	drvdata->csdev->dev.release = cti_device_release;
 
+	/* check architect value*/
+	devarch = readl_relaxed(drvdata->base + CORESIGHT_DEVARCH);
+	if (CTI_DEVARCH_ARCHITECT(devarch) == ARCHITECT_QCOM) {
+		drvdata->subtype = QCOM_CTI;
+		drvdata->offsets = cti_extended_offset;
+		/*
+		 * QCOM CTI does not implement Claimtag functionality as
+		 * per CoreSight specification, but its CLAIMSET register
+		 * is incorrectly initialized to 0xF. This can mislead
+		 * tools or drivers into thinking the component is claimed.
+		 *
+		 * Reset CLAIMSET to 0 to reflect that no claims are active.
+		 */
+		writel_relaxed(0, drvdata->base + CORESIGHT_CLAIMSET);
+	} else {
+		drvdata->subtype = ARM_STD_CTI;
+		drvdata->offsets = cti_normal_offset;
+	}
+
 	/* all done - dec pm refcount */
 	pm_runtime_put(&adev->dev);
-	dev_info(&drvdata->csdev->dev, "CTI initialized\n");
+	dev_info(&drvdata->csdev->dev, "CTI initialized; subtype=%d\n", drvdata->subtype);
 	return 0;
 
 pm_release:
diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
index a9df77215141..12a495382999 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -172,9 +172,8 @@ static struct attribute *coresight_cti_attrs[] = {
 
 /* register based attributes */
 
-/* Read registers with power check only (no enable check). */
-static ssize_t coresight_cti_reg_show(struct device *dev,
-			   struct device_attribute *attr, char *buf)
+static ssize_t coresight_cti_mgmt_reg_show(struct device *dev,
+					   struct device_attribute *attr, char *buf)
 {
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cs_off_attribute *cti_attr = container_of(attr, struct cs_off_attribute, attr);
@@ -189,6 +188,40 @@ static ssize_t coresight_cti_reg_show(struct device *dev,
 	return sysfs_emit(buf, "0x%x\n", val);
 }
 
+/* Read registers with power check only (no enable check). */
+static ssize_t coresight_cti_reg_show(struct device *dev,
+				      struct device_attribute *attr, char *buf)
+{
+	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct cs_off_attribute *cti_attr = container_of(attr, struct cs_off_attribute, attr);
+	u32 idx, val = 0;
+
+	pm_runtime_get_sync(dev->parent);
+	raw_spin_lock(&drvdata->spinlock);
+	idx = drvdata->config.ext_reg_sel;
+	if (drvdata->config.hw_powered) {
+		switch (cti_attr->off) {
+		case INDEX_CTITRIGINSTATUS:
+		case INDEX_CTITRIGOUTSTATUS:
+		case INDEX_ITTRIGINACK:
+		case INDEX_ITTRIGOUT:
+		case INDEX_ITTRIGOUTACK:
+		case INDEX_ITTRIGIN:
+			val = readl_relaxed(drvdata->base +
+					    cti_offset(drvdata, cti_attr->off, idx));
+			break;
+
+		default:
+			val = readl_relaxed(drvdata->base + cti_offset(drvdata, cti_attr->off, 0));
+			break;
+		}
+	}
+
+	raw_spin_unlock(&drvdata->spinlock);
+	pm_runtime_put_sync(dev->parent);
+	return sysfs_emit(buf, "0x%x\n", val);
+}
+
 /* Write registers with power check only (no enable check). */
 static __maybe_unused ssize_t coresight_cti_reg_store(struct device *dev,
 						      struct device_attribute *attr,
@@ -197,19 +230,39 @@ static __maybe_unused ssize_t coresight_cti_reg_store(struct device *dev,
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cs_off_attribute *cti_attr = container_of(attr, struct cs_off_attribute, attr);
 	unsigned long val = 0;
+	u32 idx;
 
 	if (kstrtoul(buf, 0, &val))
 		return -EINVAL;
 
 	pm_runtime_get_sync(dev->parent);
 	raw_spin_lock(&drvdata->spinlock);
-	if (drvdata->config.hw_powered)
-		cti_write_single_reg(drvdata, cti_attr->off, val);
+	idx = drvdata->config.ext_reg_sel;
+	if (drvdata->config.hw_powered) {
+		switch (cti_attr->off) {
+		case INDEX_ITTRIGINACK:
+		case INDEX_ITTRIGOUT:
+			cti_write_single_reg(drvdata, cti_offset(drvdata, cti_attr->off, idx), val);
+			break;
+
+		default:
+			cti_write_single_reg(drvdata, cti_offset(drvdata, cti_attr->off, 0), val);
+			break;
+		}
+	}
 	raw_spin_unlock(&drvdata->spinlock);
 	pm_runtime_put_sync(dev->parent);
 	return size;
 }
 
+#define coresight_cti_mgmt_reg(name, offset)	                        \
+	(&((struct cs_off_attribute[]) {                                \
+	   {                                                            \
+		__ATTR(name, 0444, coresight_cti_mgmt_reg_show, NULL),  \
+		offset							\
+	   }								\
+	})[0].attr.attr)
+
 #define coresight_cti_reg(name, offset)					\
 	(&((struct cs_off_attribute[]) {				\
 	   {								\
@@ -237,17 +290,17 @@ static __maybe_unused ssize_t coresight_cti_reg_store(struct device *dev,
 
 /* coresight management registers */
 static struct attribute *coresight_cti_mgmt_attrs[] = {
-	coresight_cti_reg(devaff0, CTIDEVAFF0),
-	coresight_cti_reg(devaff1, CTIDEVAFF1),
-	coresight_cti_reg(authstatus, CORESIGHT_AUTHSTATUS),
-	coresight_cti_reg(devarch, CORESIGHT_DEVARCH),
-	coresight_cti_reg(devid, CORESIGHT_DEVID),
-	coresight_cti_reg(devtype, CORESIGHT_DEVTYPE),
-	coresight_cti_reg(pidr0, CORESIGHT_PERIPHIDR0),
-	coresight_cti_reg(pidr1, CORESIGHT_PERIPHIDR1),
-	coresight_cti_reg(pidr2, CORESIGHT_PERIPHIDR2),
-	coresight_cti_reg(pidr3, CORESIGHT_PERIPHIDR3),
-	coresight_cti_reg(pidr4, CORESIGHT_PERIPHIDR4),
+	coresight_cti_mgmt_reg(devaff0, CTIDEVAFF0),
+	coresight_cti_mgmt_reg(devaff1, CTIDEVAFF1),
+	coresight_cti_mgmt_reg(authstatus, CORESIGHT_AUTHSTATUS),
+	coresight_cti_mgmt_reg(devarch, CORESIGHT_DEVARCH),
+	coresight_cti_mgmt_reg(devid, CORESIGHT_DEVID),
+	coresight_cti_mgmt_reg(devtype, CORESIGHT_DEVTYPE),
+	coresight_cti_mgmt_reg(pidr0, CORESIGHT_PERIPHIDR0),
+	coresight_cti_mgmt_reg(pidr1, CORESIGHT_PERIPHIDR1),
+	coresight_cti_mgmt_reg(pidr2, CORESIGHT_PERIPHIDR2),
+	coresight_cti_mgmt_reg(pidr3, CORESIGHT_PERIPHIDR3),
+	coresight_cti_mgmt_reg(pidr4, CORESIGHT_PERIPHIDR4),
 	NULL,
 };
 
@@ -258,13 +311,15 @@ static struct attribute *coresight_cti_mgmt_attrs[] = {
  * If inaccessible & pcached_val not NULL then show cached value.
  */
 static ssize_t cti_reg32_show(struct device *dev, char *buf,
-			      u32 *pcached_val, int reg_offset)
+			      u32 *pcached_val, int index)
 {
 	u32 val = 0;
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cti_config *config = &drvdata->config;
+	int reg_offset;
 
 	raw_spin_lock(&drvdata->spinlock);
+	reg_offset = cti_offset(drvdata, index, 0);
 	if ((reg_offset >= 0) && cti_active(config)) {
 		CS_UNLOCK(drvdata->base);
 		val = readl_relaxed(drvdata->base + reg_offset);
@@ -284,11 +339,12 @@ static ssize_t cti_reg32_show(struct device *dev, char *buf,
  * if reg_offset >= 0 then write through if enabled.
  */
 static ssize_t cti_reg32_store(struct device *dev, const char *buf,
-			       size_t size, u32 *pcached_val, int reg_offset)
+			       size_t size, u32 *pcached_val, int index)
 {
 	unsigned long val;
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cti_config *config = &drvdata->config;
+	int reg_offset;
 
 	if (kstrtoul(buf, 0, &val))
 		return -EINVAL;
@@ -298,6 +354,7 @@ static ssize_t cti_reg32_store(struct device *dev, const char *buf,
 	if (pcached_val)
 		*pcached_val = (u32)val;
 
+	reg_offset = cti_offset(drvdata, index, 0);
 	/* write through if offset and enabled */
 	if ((reg_offset >= 0) && cti_active(config))
 		cti_write_single_reg(drvdata, reg_offset, val);
@@ -306,14 +363,14 @@ static ssize_t cti_reg32_store(struct device *dev, const char *buf,
 }
 
 /* Standard macro for simple rw cti config registers */
-#define cti_config_reg32_rw(name, cfgname, offset)			\
+#define cti_config_reg32_rw(name, cfgname, index)			\
 static ssize_t name##_show(struct device *dev,				\
 			   struct device_attribute *attr,		\
 			   char *buf)					\
 {									\
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);	\
 	return cti_reg32_show(dev, buf,					\
-			      &drvdata->config.cfgname, offset);	\
+			      &drvdata->config.cfgname, index);		\
 }									\
 									\
 static ssize_t name##_store(struct device *dev,				\
@@ -322,7 +379,7 @@ static ssize_t name##_store(struct device *dev,				\
 {									\
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);	\
 	return cti_reg32_store(dev, buf, size,				\
-			       &drvdata->config.cfgname, offset);	\
+			       &drvdata->config.cfgname, index);	\
 }									\
 static DEVICE_ATTR_RW(name)
 
@@ -356,6 +413,46 @@ static ssize_t inout_sel_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(inout_sel);
 
+/*
+ * QCOM CTI supports up to 128 triggers, there are 6 registers need to be
+ * expanded to up to 4 instances, and ext_reg_sel can be used to indicate
+ * which one is in use.
+ * CTITRIGINSTATUS, CTITRIGOUTSTATUS,
+ * ITTRIGIN, ITTRIGOUT,
+ * ITTRIGINACK, ITTRIGOUTACK.
+ */
+static ssize_t ext_reg_sel_show(struct device *dev,
+				struct device_attribute *attr,
+				char *buf)
+{
+	u32 val;
+	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	raw_spin_lock(&drvdata->spinlock);
+	val = drvdata->config.ext_reg_sel;
+	raw_spin_unlock(&drvdata->spinlock);
+	return sprintf(buf, "%d\n", val);
+}
+
+static ssize_t ext_reg_sel_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t size)
+{
+	unsigned long val;
+	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
+	if (val > ((drvdata->config.nr_trig_max + 31) / 32 - 1))
+		return -EINVAL;
+
+	raw_spin_lock(&drvdata->spinlock);
+	drvdata->config.ext_reg_sel = val;
+	raw_spin_unlock(&drvdata->spinlock);
+	return size;
+}
+static DEVICE_ATTR_RW(ext_reg_sel);
+
 static ssize_t inen_show(struct device *dev,
 			 struct device_attribute *attr,
 			 char *buf)
@@ -389,7 +486,7 @@ static ssize_t inen_store(struct device *dev,
 
 	/* write through if enabled */
 	if (cti_active(config))
-		cti_write_single_reg(drvdata, CTIINEN(index), val);
+		cti_write_single_reg(drvdata, cti_offset(drvdata, INDEX_CTIINEN, index), val);
 	raw_spin_unlock(&drvdata->spinlock);
 	return size;
 }
@@ -428,7 +525,7 @@ static ssize_t outen_store(struct device *dev,
 
 	/* write through if enabled */
 	if (cti_active(config))
-		cti_write_single_reg(drvdata, CTIOUTEN(index), val);
+		cti_write_single_reg(drvdata, cti_offset(drvdata, INDEX_CTIOUTEN, index), val);
 	raw_spin_unlock(&drvdata->spinlock);
 	return size;
 }
@@ -448,9 +545,9 @@ static ssize_t intack_store(struct device *dev,
 }
 static DEVICE_ATTR_WO(intack);
 
-cti_config_reg32_rw(gate, ctigate, CTIGATE);
-cti_config_reg32_rw(asicctl, asicctl, ASICCTL);
-cti_config_reg32_rw(appset, ctiappset, CTIAPPSET);
+cti_config_reg32_rw(gate, ctigate, INDEX_CTIGATE);
+cti_config_reg32_rw(asicctl, asicctl, INDEX_ASICCTL);
+cti_config_reg32_rw(appset, ctiappset, INDEX_CTIAPPSET);
 
 static ssize_t appclear_store(struct device *dev,
 			      struct device_attribute *attr,
@@ -504,6 +601,7 @@ static DEVICE_ATTR_WO(apppulse);
  */
 static struct attribute *coresight_cti_regs_attrs[] = {
 	&dev_attr_inout_sel.attr,
+	&dev_attr_ext_reg_sel.attr,
 	&dev_attr_inen.attr,
 	&dev_attr_outen.attr,
 	&dev_attr_gate.attr,
@@ -512,20 +610,20 @@ static struct attribute *coresight_cti_regs_attrs[] = {
 	&dev_attr_appset.attr,
 	&dev_attr_appclear.attr,
 	&dev_attr_apppulse.attr,
-	coresight_cti_reg(triginstatus, CTITRIGINSTATUS),
-	coresight_cti_reg(trigoutstatus, CTITRIGOUTSTATUS),
-	coresight_cti_reg(chinstatus, CTICHINSTATUS),
-	coresight_cti_reg(choutstatus, CTICHOUTSTATUS),
+	coresight_cti_reg(triginstatus, INDEX_CTITRIGINSTATUS),
+	coresight_cti_reg(trigoutstatus, INDEX_CTITRIGOUTSTATUS),
+	coresight_cti_reg(chinstatus, INDEX_CTICHINSTATUS),
+	coresight_cti_reg(choutstatus, INDEX_CTICHOUTSTATUS),
 #ifdef CONFIG_CORESIGHT_CTI_INTEGRATION_REGS
-	coresight_cti_reg_rw(itctrl, CORESIGHT_ITCTRL),
-	coresight_cti_reg(ittrigin, ITTRIGIN),
-	coresight_cti_reg(itchin, ITCHIN),
-	coresight_cti_reg_rw(ittrigout, ITTRIGOUT),
-	coresight_cti_reg_rw(itchout, ITCHOUT),
-	coresight_cti_reg(itchoutack, ITCHOUTACK),
-	coresight_cti_reg(ittrigoutack, ITTRIGOUTACK),
-	coresight_cti_reg_wo(ittriginack, ITTRIGINACK),
-	coresight_cti_reg_wo(itchinack, ITCHINACK),
+	coresight_cti_reg_rw(itctrl, INDEX_ITCTRL),
+	coresight_cti_reg(ittrigin, INDEX_ITTRIGIN),
+	coresight_cti_reg(itchin, INDEX_ITCHIN),
+	coresight_cti_reg_rw(ittrigout, INDEX_ITTRIGOUT),
+	coresight_cti_reg_rw(itchout, INDEX_ITCHOUT),
+	coresight_cti_reg(itchoutack, INDEX_ITCHOUTACK),
+	coresight_cti_reg(ittrigoutack, INDEX_ITTRIGOUTACK),
+	coresight_cti_reg_wo(ittriginack, INDEX_ITTRIGINACK),
+	coresight_cti_reg_wo(itchinack, INDEX_ITCHINACK),
 #endif
 	NULL,
 };
@@ -740,6 +838,7 @@ static ssize_t chan_xtrigs_reset_store(struct device *dev,
 	config->ctiappset = 0;
 	config->ctiinout_sel = 0;
 	config->xtrig_rchan_sel = 0;
+	config->ext_reg_sel = 0;
 
 	/* if enabled then write through */
 	if (cti_active(config))
diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
index e7b88b07cffe..fdd6d8892a95 100644
--- a/drivers/hwtracing/coresight/coresight-cti.h
+++ b/drivers/hwtracing/coresight/coresight-cti.h
@@ -57,7 +57,38 @@ struct fwnode_handle;
  * Max of in and out defined in the DEVID register.
  * - pick up actual number used from .dts parameters if present.
  */
-#define CTIINOUTEN_MAX		32
+#define CTIINOUTEN_MAX		128
+
+/* Qcom CTI supports up to 128 triggers*/
+enum cti_subtype {
+	ARM_STD_CTI,
+	QCOM_CTI,
+};
+
+/* These registers are remapped in Qcom CTI*/
+enum cti_offset_index {
+	INDEX_CTIINTACK,
+	INDEX_CTIAPPSET,
+	INDEX_CTIAPPCLEAR,
+	INDEX_CTIAPPPULSE,
+	INDEX_CTIINEN,
+	INDEX_CTIOUTEN,
+	INDEX_CTITRIGINSTATUS,
+	INDEX_CTITRIGOUTSTATUS,
+	INDEX_CTICHINSTATUS,
+	INDEX_CTICHOUTSTATUS,
+	INDEX_CTIGATE,
+	INDEX_ASICCTL,
+	INDEX_ITCHINACK,
+	INDEX_ITTRIGINACK,
+	INDEX_ITCHOUT,
+	INDEX_ITTRIGOUT,
+	INDEX_ITCHOUTACK,
+	INDEX_ITTRIGOUTACK,
+	INDEX_ITCHIN,
+	INDEX_ITTRIGIN,
+	INDEX_ITCTRL,
+};
 
 /**
  * Group of related trigger signals
@@ -149,6 +180,9 @@ struct cti_config {
 	bool trig_filter_enable;
 	u8 xtrig_rchan_sel;
 
+	/* qcom_cti regs' index */
+	u8 ext_reg_sel;
+
 	/* cti cross trig programmable regs */
 	u8 ctiinout_sel;
 	u32 ctiappset;
@@ -181,6 +215,8 @@ struct cti_drvdata {
 	struct cti_config config;
 	struct list_head node;
 	void (*csdev_release)(struct device *dev);
+	enum cti_subtype subtype;
+	const u32 *offsets;
 };
 
 /*
@@ -235,6 +271,11 @@ struct coresight_platform_data *
 coresight_cti_get_platform_data(struct device *dev);
 const char *cti_plat_get_node_name(struct fwnode_handle *fwnode);
 
+static inline u32 cti_offset(struct cti_drvdata *drvdata, int index, int num)
+{
+	return drvdata->offsets[index] + 4 * num;
+}
+
 /* cti powered and enabled */
 static inline bool cti_active(struct cti_config *cfg)
 {
diff --git a/drivers/hwtracing/coresight/qcom-cti.h b/drivers/hwtracing/coresight/qcom-cti.h
new file mode 100644
index 000000000000..3c46317dd81f
--- /dev/null
+++ b/drivers/hwtracing/coresight/qcom-cti.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#define ARCHITECT_QCOM 0x477
+
+/* CTI programming registers */
+#define	QCOM_CTIINTACK		0x020
+#define	QCOM_CTIAPPSET		0x004
+#define	QCOM_CTIAPPCLEAR	0x008
+#define	QCOM_CTIAPPPULSE	0x00C
+#define	QCOM_CTIINEN		0x400
+#define	QCOM_CTIOUTEN		0x800
+#define	QCOM_CTITRIGINSTATUS	0x040
+#define	QCOM_CTITRIGOUTSTATUS	0x060
+#define	QCOM_CTICHINSTATUS	0x080
+#define	QCOM_CTICHOUTSTATUS	0x084
+#define	QCOM_CTIGATE		0x088
+#define	QCOM_ASICCTL		0x08c
+/* Integration test registers */
+#define	QCOM_ITCHINACK		0xE70
+#define	QCOM_ITTRIGINACK	0xE80
+#define	QCOM_ITCHOUT		0xE74
+#define	QCOM_ITTRIGOUT		0xEA0
+#define	QCOM_ITCHOUTACK		0xE78
+#define	QCOM_ITTRIGOUTACK	0xEC0
+#define	QCOM_ITCHIN		0xE7C
+#define	QCOM_ITTRIGIN		0xEE0

-- 
2.43.0


