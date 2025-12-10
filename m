Return-Path: <linux-arm-msm+bounces-84903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D79CB2EB5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 13:38:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 236A93018B9B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 12:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13D482EB878;
	Wed, 10 Dec 2025 12:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LregkCjj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G9tryoI4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D3831A54F
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 12:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765370201; cv=none; b=mN2VzBLrE8Bvt2eGEIwYk1NP3S4aGC3CSPlVaqzpTkr1dyO/xrmCKLwvSeWUrd0zh6VaZ/aB5oY2kwrlb+mq1ZmL9Nrud1KeOxTbtMg78WMN9kD04p0C5BGToliLKMNHMMiNcClpZ4LMfqYjB8xtRqsXtrnj3EmHL9IqPnRFua0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765370201; c=relaxed/simple;
	bh=5KjQNGH1FIUMW9BIdNH0GHLcY0nQuWFLI2Gji6/0cd0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bCvwxy89iwe0wZetdpONMSgnuVfBm8GY313gaW/TL4Pbqc8HVmLu+ZWLMj3W1JtpF8IGcqzfxT8EAm6wXco2rHFIQJpVceOcW8CQp/QqI+sFiOIMt7HAKWDDpuCbn9zL7hvmioHJx+lM2tQNAQmS3oPEjH2CrG0NITEmwUUwKfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LregkCjj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G9tryoI4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA8e1rm1817811
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 12:36:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jS9Dz/jRZnqwwdJk1J7Vvfj+kDTRGL/8Hrd1W/eMhFI=; b=LregkCjjUy+jlPiP
	JdEh5t/qlFkMjg8zoOk9JrwHG06b/sIYa3FYd5/o4Bc6CYJb+wTigqU6g8W0nwka
	DRl3h4U4p8c/dtXERFZspnsZwKZmQoo//BLB9s2HAC3zDkhbNZTRX9UHugLW1esB
	9hlCZBlWGXT2+AoaEvBUtMTJ3RBkTpw2eCS4wfpji+RlhYyv1uwVN9bD0XTBmsQD
	SCTMmckssNcN1JEApO1AvJY8dWIeKPJk4UWWY6IEWCzm+bXNBGpWapu5q5z7RQgb
	Ehk99r0yp66UC3hl9N30pjQkwGxVwUcAIVef7Yaw+gLVhEP9PoRWtyz1NFKA98Mp
	GIgZzg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay2e0h848-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 12:36:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2956f09f382so6427055ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 04:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765370196; x=1765974996; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jS9Dz/jRZnqwwdJk1J7Vvfj+kDTRGL/8Hrd1W/eMhFI=;
        b=G9tryoI4lmepdMC8pA0lQfTMBgr2O4x0WzHmucuSLjBd1SSw7WaLeVsAi9cQlNQLqD
         sCWK5sVsfc7TG5l1WoEnNmbSdysrzHHLEZIBawT6vjAjraKNc+QTr0ZAJXNp9KxeE8P3
         mEV/E70SQZO0WfJ2cBdIH3SSirgv95XFxcLRFWIoJttbTKkFjGUI4G5HZe1U6TBtysTQ
         BUSBagk1KGpPWnKsT/6jmHLKtbVyZDQk29/dMmnGQeAwVAH9lZ3w245SZ/KHxDRNZ856
         Lge4EpMmGftiVYBEReOC41ezGQbmxZIK+GwWHy51IK9Bb0b+H9cVboTXCih8Z6XmCWTC
         v1Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765370196; x=1765974996;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jS9Dz/jRZnqwwdJk1J7Vvfj+kDTRGL/8Hrd1W/eMhFI=;
        b=nVbn996NjmSqqRYHgvYB/ikn/EopyLe/8vWIV+snhTZcRnswBCgZawZnwm51A6Nwpf
         gk8cPZdePgU3lePnfn22T36Qd3lNgP80R5lMGOpqhmExnqGQ2EYidgmViulkpU1D3lGX
         IgCsTFS8H5HKPIzlAlfT1urfFzBi7bmxLU6alBVQ1RqdTqWyGQuAl3w7qI7PpeGiHTJ+
         pnWc2SG2EnVCFv+XqXaLI8lLneXn/HRwaK1Bl+S+zxWLFzkifSs6wzYW3nzg1Furt65x
         75VSHggKklQKKeq1Tx+uHbGul1tEDAhTLaHwLvyIUdk/YE9fvdQBMZVM3fdEZi/S/Eho
         /CHw==
X-Gm-Message-State: AOJu0YwOfWo9HZGQ5ZGENzAItR+DMSGmxKtLvN8T/MWj2oY+2Ue2XRZX
	twfrIWewTFPu6NPTc2DD286sBlPcT6H/xl/vpZ6HZyfMzoKUzNm+Z8hHhq8V5yMe9QYUuriPifq
	07e1huMbURqixw1GJHYWqu7poktZei8Uf8GQfLxriBSmKMWLzSxID7wmt4uc+BnDo5Gtl
X-Gm-Gg: AY/fxX4u2G+w4l+qlYqa1BgBPbP6bX/5RWduobV9PgP8GdVMbf9jbGG575zbB5u9CmB
	p+vyy+8eNkGjgu+Xl3EmRbwfgvpWUHVtcmSmcw4fYNnwUxSdnRNraQr+DmhBTwBwX7fwgTHbLs0
	j9PpPYtH5J/VgtBX0TKtffWkQAits0r79o+XekjW9yZRV6y+7ZUpugpBAjB+7GScBgs4Q5x7Bmb
	4Qwa/CJc7UkJpo7OG2BUZ9X6qrmziV9tC/jFH3Y9/EBeU0CEs9E1byNZZ2oMlOZ8dptewJvLQHK
	9b73C5FVHy+09Lg1EFUcQK+ptp6chsA0rGRNyql5niquFbxmFfr1mPmu825DO4LFZg/JUkjKfKB
	KwamOMvOqNPVHKzFwLR+wLJTDPbSGDD7z8hSnzugwUnYy
X-Received: by 2002:a17:903:2311:b0:297:df84:bd18 with SMTP id d9443c01a7336-29ec2e1dd1emr24825055ad.30.1765370196007;
        Wed, 10 Dec 2025 04:36:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqK/6jVK0EEueJfUCNXSNs3T/14MlK5kU2/kzwFLWdtaSPYMHqqxEXbeu30pIEZFJnRt6Krw==
X-Received: by 2002:a17:903:2311:b0:297:df84:bd18 with SMTP id d9443c01a7336-29ec2e1dd1emr24824745ad.30.1765370195509;
        Wed, 10 Dec 2025 04:36:35 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeaab9c0sm185434615ad.68.2025.12.10.04.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 04:36:35 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Wed, 10 Dec 2025 18:06:02 +0530
Subject: [PATCH v4 4/6] media: iris: Move vpu register defines to common
 header file
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251210-knp_video-v4-4-8d11d840358a@oss.qualcomm.com>
References: <20251210-knp_video-v4-0-8d11d840358a@oss.qualcomm.com>
In-Reply-To: <20251210-knp_video-v4-0-8d11d840358a@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765370172; l=8747;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=5KjQNGH1FIUMW9BIdNH0GHLcY0nQuWFLI2Gji6/0cd0=;
 b=LaqltDRM5Ev/IPI2PEZEzHJIROjknF3Vj6/gw9MlVDPoi4adUl0beBZGoKyV4bg1CIiA6HdSr
 xMzyV8jCJq9D8x7FV+vvfjRg92SUoZZ9ETTFxzdplgBxeL7/Z5fw8f6
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDEwMCBTYWx0ZWRfX42pcLbDBiGyx
 Z/Im9i3q0f+TS+Nqlp4upd3nbbIQ6lQsHuk5uoASNYyz1/F3Ly9C+F1KIITfdomfqPDGbAilPU9
 OYQfWLWHuzWJ+hWohY3F5Ak3xMfK0ACjDVpTV0/CIrE+5N1ZjTj520VM0tvSFJ4DCnSZIc+/1Ma
 yq/feTxG+hYEQMB0QWQFtPd9s50fwdS+X6Wx3C8l/3O73rA+0EXpeaQyyv3RzFJRkbplWVN8/Bp
 t1vyeXUATTU3a5nlJA8AClceyHOaOBn4ozUNkxZr9p/DiND5yXenLPvB6JQjMsbPcAJCGPG6caw
 JHxi30ivkeshMSM+qFh207ddrx/XgU4uXkFypVbW8QtOSukmhfXTE/M2So80LZW5GKhorBW1Dei
 ti2ByKH2GaKA47yIfWZsoLElbqDH9w==
X-Proofpoint-ORIG-GUID: s0pWC95R_rLhbnhyVMpv7zT61tBIsoBo
X-Authority-Analysis: v=2.4 cv=G5oR0tk5 c=1 sm=1 tr=0 ts=69396955 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=qUPVcWiRufo_Kb4lI7EA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: s0pWC95R_rLhbnhyVMpv7zT61tBIsoBo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100100

Some of vpu4 register defines are common with vpu3x. Move those into the
common register defines header. This is done to reuse the defines for
vpu4 in subsequent patch which enables the power sequence for vpu4.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 42 ---------------
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 43 ---------------
 .../platform/qcom/iris/iris_vpu_register_defines.h | 61 ++++++++++++++++++++++
 3 files changed, 61 insertions(+), 85 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index 339776a0b4672e246848c3a6a260eb83c7da6a60..cd53bcda3b3e1d6f234486df49a51150a7ec9799 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -11,48 +11,6 @@
 #include "iris_vpu_common.h"
 #include "iris_vpu_register_defines.h"
 
-#define WRAPPER_TZ_BASE_OFFS			0x000C0000
-#define AON_BASE_OFFS				0x000E0000
-#define AON_MVP_NOC_RESET			0x0001F000
-
-#define WRAPPER_DEBUG_BRIDGE_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x54)
-#define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
-#define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
-#define REQ_POWER_DOWN_PREP			BIT(0)
-#define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
-#define NOC_LPI_STATUS_DONE			BIT(0) /* Indicates the NOC handshake is complete */
-#define NOC_LPI_STATUS_DENY			BIT(1) /* Indicates the NOC handshake is denied */
-#define NOC_LPI_STATUS_ACTIVE		BIT(2) /* Indicates the NOC is active */
-#define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
-#define CORE_CLK_RUN				0x0
-/* VPU v3.5 */
-#define WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0	(WRAPPER_BASE_OFFS + 0x78)
-
-#define WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG		(WRAPPER_TZ_BASE_OFFS + 0x14)
-#define CTL_AXI_CLK_HALT			BIT(0)
-#define CTL_CLK_HALT				BIT(1)
-
-#define WRAPPER_TZ_QNS4PDXFIFO_RESET		(WRAPPER_TZ_BASE_OFFS + 0x18)
-#define RESET_HIGH				BIT(0)
-
-#define CPU_CS_AHB_BRIDGE_SYNC_RESET		(CPU_CS_BASE_OFFS + 0x160)
-#define CORE_BRIDGE_SW_RESET			BIT(0)
-#define CORE_BRIDGE_HW_RESET_DISABLE		BIT(1)
-
-#define CPU_CS_X2RPMH				(CPU_CS_BASE_OFFS + 0x168)
-#define MSK_SIGNAL_FROM_TENSILICA		BIT(0)
-#define MSK_CORE_POWER_ON			BIT(1)
-
-#define AON_WRAPPER_MVP_NOC_RESET_REQ		(AON_MVP_NOC_RESET + 0x000)
-#define VIDEO_NOC_RESET_REQ			(BIT(0) | BIT(1))
-
-#define AON_WRAPPER_MVP_NOC_RESET_ACK		(AON_MVP_NOC_RESET + 0x004)
-
-#define VCODEC_SS_IDLE_STATUSN			(VCODEC_BASE_OFFS + 0x70)
-
-#define AON_WRAPPER_MVP_NOC_LPI_CONTROL		(AON_BASE_OFFS)
-#define AON_WRAPPER_MVP_NOC_LPI_STATUS		(AON_BASE_OFFS + 0x4)
-
 #define AON_WRAPPER_MVP_NOC_CORE_SW_RESET	(AON_BASE_OFFS + 0x18)
 #define SW_RESET				BIT(0)
 #define AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL	(AON_BASE_OFFS + 0x20)
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index fef192a2de48fa47af421632829184c5896326cd..50242fc6b4653a7d74ff64500f40eb8a859a6548 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -11,13 +11,6 @@
 #include "iris_vpu_common.h"
 #include "iris_vpu_register_defines.h"
 
-#define WRAPPER_TZ_BASE_OFFS			0x000C0000
-#define AON_BASE_OFFS				0x000E0000
-
-#define CPU_IC_BASE_OFFS			(CPU_BASE_OFFS)
-
-#define CPU_CS_A2HSOFTINTCLR			(CPU_CS_BASE_OFFS + 0x1C)
-#define CLEAR_XTENSA2HOST_INTR			BIT(0)
 
 #define CTRL_INIT				(CPU_CS_BASE_OFFS + 0x48)
 #define CTRL_STATUS				(CPU_CS_BASE_OFFS + 0x4C)
@@ -35,42 +28,6 @@
 #define UC_REGION_ADDR				(CPU_CS_BASE_OFFS + 0x64)
 #define UC_REGION_SIZE				(CPU_CS_BASE_OFFS + 0x68)
 
-#define CPU_CS_H2XSOFTINTEN			(CPU_CS_BASE_OFFS + 0x148)
-#define HOST2XTENSA_INTR_ENABLE			BIT(0)
-
-#define CPU_CS_X2RPMH				(CPU_CS_BASE_OFFS + 0x168)
-#define MSK_SIGNAL_FROM_TENSILICA		BIT(0)
-#define MSK_CORE_POWER_ON			BIT(1)
-
-#define CPU_IC_SOFTINT				(CPU_IC_BASE_OFFS + 0x150)
-#define CPU_IC_SOFTINT_H2A_SHFT			0x0
-
-#define WRAPPER_INTR_STATUS			(WRAPPER_BASE_OFFS + 0x0C)
-#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
-#define WRAPPER_INTR_STATUS_A2H_BMSK		BIT(2)
-
-#define WRAPPER_INTR_MASK			(WRAPPER_BASE_OFFS + 0x10)
-#define WRAPPER_INTR_MASK_A2HWD_BMSK		BIT(3)
-#define WRAPPER_INTR_MASK_A2HCPU_BMSK		BIT(2)
-
-#define WRAPPER_DEBUG_BRIDGE_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x54)
-#define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
-#define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
-#define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
-
-#define WRAPPER_TZ_CPU_STATUS			(WRAPPER_TZ_BASE_OFFS + 0x10)
-#define WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG		(WRAPPER_TZ_BASE_OFFS + 0x14)
-#define CTL_AXI_CLK_HALT			BIT(0)
-#define CTL_CLK_HALT				BIT(1)
-
-#define WRAPPER_TZ_QNS4PDXFIFO_RESET		(WRAPPER_TZ_BASE_OFFS + 0x18)
-#define RESET_HIGH				BIT(0)
-
-#define AON_WRAPPER_MVP_NOC_LPI_CONTROL		(AON_BASE_OFFS)
-#define REQ_POWER_DOWN_PREP			BIT(0)
-
-#define AON_WRAPPER_MVP_NOC_LPI_STATUS		(AON_BASE_OFFS + 0x4)
-
 static void iris_vpu_interrupt_init(struct iris_core *core)
 {
 	u32 mask_val;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
index fe8a39e5e5a3fc68dc3a706ffdba07a5558163cf..72168b9ffa7385d53d7190265d1c0922ee04a656 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
@@ -7,11 +7,72 @@
 #define __IRIS_VPU_REGISTER_DEFINES_H__
 
 #define VCODEC_BASE_OFFS			0x00000000
+#define AON_MVP_NOC_RESET			0x0001F000
 #define CPU_BASE_OFFS				0x000A0000
 #define WRAPPER_BASE_OFFS			0x000B0000
+#define WRAPPER_TZ_BASE_OFFS			0x000C0000
+#define AON_BASE_OFFS				0x000E0000
+
+#define VCODEC_SS_IDLE_STATUSN			(VCODEC_BASE_OFFS + 0x70)
+
+#define AON_WRAPPER_MVP_NOC_RESET_REQ		(AON_MVP_NOC_RESET + 0x000)
+#define VIDEO_NOC_RESET_REQ			(BIT(0) | BIT(1))
+
+#define AON_WRAPPER_MVP_NOC_RESET_ACK		(AON_MVP_NOC_RESET + 0x004)
 
 #define CPU_CS_BASE_OFFS			(CPU_BASE_OFFS)
+#define CPU_IC_BASE_OFFS			(CPU_BASE_OFFS)
+
+#define CPU_CS_A2HSOFTINTCLR			(CPU_CS_BASE_OFFS + 0x1C)
+#define CLEAR_XTENSA2HOST_INTR			BIT(0)
+
+#define CPU_CS_H2XSOFTINTEN			(CPU_CS_BASE_OFFS + 0x148)
+#define HOST2XTENSA_INTR_ENABLE			BIT(0)
+
+#define CPU_IC_SOFTINT				(CPU_IC_BASE_OFFS + 0x150)
+#define CPU_IC_SOFTINT_H2A_SHFT			0x0
+
+#define CPU_CS_AHB_BRIDGE_SYNC_RESET		(CPU_CS_BASE_OFFS + 0x160)
+#define CORE_BRIDGE_SW_RESET			BIT(0)
+#define CORE_BRIDGE_HW_RESET_DISABLE		BIT(1)
+
+#define CPU_CS_X2RPMH				(CPU_CS_BASE_OFFS + 0x168)
+#define MSK_SIGNAL_FROM_TENSILICA		BIT(0)
+#define MSK_CORE_POWER_ON			BIT(1)
 
+#define WRAPPER_INTR_STATUS			(WRAPPER_BASE_OFFS + 0x0C)
+#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
+#define WRAPPER_INTR_STATUS_A2H_BMSK		BIT(2)
+
+#define WRAPPER_INTR_MASK			(WRAPPER_BASE_OFFS + 0x10)
+#define WRAPPER_INTR_MASK_A2HWD_BMSK		BIT(3)
+#define WRAPPER_INTR_MASK_A2HCPU_BMSK		BIT(2)
+
+#define WRAPPER_DEBUG_BRIDGE_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x54)
+#define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
+#define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
+#define REQ_POWER_DOWN_PREP			BIT(0)
+
+#define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
+#define NOC_LPI_STATUS_DONE			BIT(0) /* Indicates the NOC handshake is complete */
+#define NOC_LPI_STATUS_DENY			BIT(1) /* Indicates the NOC handshake is denied */
+#define NOC_LPI_STATUS_ACTIVE			BIT(2) /* Indicates the NOC is active */
+
+#define WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0	(WRAPPER_BASE_OFFS + 0x78)
 #define WRAPPER_CORE_POWER_STATUS		(WRAPPER_BASE_OFFS + 0x80)
+#define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
+#define CORE_CLK_RUN				0x0
+
+#define WRAPPER_TZ_CPU_STATUS			(WRAPPER_TZ_BASE_OFFS + 0x10)
+
+#define WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG		(WRAPPER_TZ_BASE_OFFS + 0x14)
+#define CTL_AXI_CLK_HALT			BIT(0)
+#define CTL_CLK_HALT				BIT(1)
+
+#define WRAPPER_TZ_QNS4PDXFIFO_RESET		(WRAPPER_TZ_BASE_OFFS + 0x18)
+#define RESET_HIGH				BIT(0)
+
+#define AON_WRAPPER_MVP_NOC_LPI_CONTROL		(AON_BASE_OFFS)
+#define AON_WRAPPER_MVP_NOC_LPI_STATUS		(AON_BASE_OFFS + 0x4)
 
 #endif

-- 
2.34.1


