Return-Path: <linux-arm-msm+bounces-80728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0F4C3F43A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 10:51:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7D363A68A4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 09:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7428305942;
	Fri,  7 Nov 2025 09:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FZLMAsnu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OlCwzGDB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89583019CD
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 09:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762509019; cv=none; b=XxNK7JXBiaavCbbtpF7VqgiwsAtStDCeusGZ8KV1UaIF4DJaiYQQLLjoD1be51Mpdwqo+l4Elf5nujf9nQMWsjq8XfyyLs197nB7SRSr3NvTM1V0aZJmwqlKH8TyMOcdnQSLVpS+kQsWOLTi4iY+oU4gEE6xf5WfBk31zcC88Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762509019; c=relaxed/simple;
	bh=8f0mRmi0hUp2NmLu4BNS1QNe53fDlDPPjjxHkdXkkNI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KhuOYVnszlaFWl4wS8bZ5VrMGPzNrYPy+6FZvS0USGQvlERVRdy0W7A0Fvw3plcLZuiazsBT8k5iCYOfNq03RIu4apgLfGtH3CHbV3UDuIgzPcd35NpT9LWU2HZ8ya66P8Ux/f0WFXsX4dC5/31fdw5R1qIQrXexKm3eDSTC3CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FZLMAsnu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OlCwzGDB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A78Hn6Z4131423
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Nov 2025 09:50:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AGl9S6eFUprvzusSsSOqGkrtgg5TtzoJZz06XjMGXp0=; b=FZLMAsnuZoD96vJZ
	8fj9Xq/Pc5F3CR4MHx7NSYaFJuJ9H3gZoE+abHStTOIBtXJUwZKBNhSg1DRD0ir3
	6YN6MFdCU5buInqJCfqNEap2NMhBvZHRdZ20z4gWno+Y0FtKqa0WgXD8M3d/Ynm0
	I9Jtej7ywgI6FHOoyiGpBPHuk3DUUuGdlEPmeULINyMfmFPCWN/PshKkMnNvXOPb
	hDzovjqDfwjgIaKdPdQZLsyifqqVh+Hk1n8Ugbxm+/HXpqzQHez6KnA+leUigHVJ
	NBvFZvC1daN+oO4ICgI56D5bI34nzjoawdFjXvfC5bzPevFzsItCaXeNk4XXemtT
	icWi5A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8u3x3k6k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 09:50:16 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b95d06db747so532053a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 01:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762509016; x=1763113816; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AGl9S6eFUprvzusSsSOqGkrtgg5TtzoJZz06XjMGXp0=;
        b=OlCwzGDBL1OZfL+I7Rhd9Qz/azX1Aqu/ubrPw8cZy5ugOVLpTDr5GVfZLrl6E205tC
         vmm3FMlyZSJ37ax2XbDq5cpHtjaIOThbhADCR2PiWV1gZs0W9dcp2kmJHI5QOGu8gp+/
         8ieTBGMzFA1aG9uDcmzzuMIHVgP6Yka2SVd/aBMEbBIsL7vnmMjwFAQ9HBZ+j9cJuJb6
         3EBp1W9HiL7p+gHPmw+1ybFLiRwX2ZImxN5RvgU1T6VNz4/0k6KiDUZ5CwTGjge6Y4oT
         E2N8dWjEvSaBHenHjAmy1rvBeHWEh18Zy0oW3EkqEj/byhHAl+EzrUbm2khat+jXTzm9
         rd5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762509016; x=1763113816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AGl9S6eFUprvzusSsSOqGkrtgg5TtzoJZz06XjMGXp0=;
        b=KqD0iNuBhYVcOXMgIyT6JFrifk5ICVK6SAyodLOy/WHOvPsKjNys4LI5A4T6Lh0BFw
         dyzkIV2a+d6LXh8nPL3KJvKvA+Z9ydJSB19mIKLrQct4Lvue6lJiusmg9iR+aV8ilNPM
         g2QXMNAYjS7kDZIahQ+Y8x644XXxqwf4s+uhTSjCpEfcvrUeVcax5kLtWyRUJcnv/GAR
         /tcX13uDyYDfL5MOHzHS6qDUFKb0nyxueXCKYUUmo7KNW4fHaX4ecjwmhb25cKebkf7g
         5s8QAmfuXgY5g/Hj5d/w3IJpGT4400H9VKvqhcXI5Vy54oFJy+EMltj7EACxsqyzQ7H6
         p2ng==
X-Gm-Message-State: AOJu0YyQwpnHKUlfTjyk49Cc69SNThsc7T3sfngOURtpj0uM6EGSYmI+
	xZcrfpzYWC2wn0u7v0DhoKM9drm48be/3pg64uVqBqwtEJknCeYCL6qe+8rjis+tqRK6swq3/+f
	iA3b7+IMed4rQcLd/J5vs7VJ3iEmCg22/ZsaR/DoOT+ZxDpcF6j3FyiRKhO6pw4cOKP5m
X-Gm-Gg: ASbGnctVGxn/nOJuKMckWk5GA9GX+7pHPeX1mbZzv/ICnCuJZGCkaMWXCv2tbWvRkR0
	QHjSHNgRQSJNnFPvZn1BG53Vk/P9dbDEGNK789JJt6b/vfnmc5+Y2p57+3FyTuGwMn4x6scgzLd
	ZmY8fs08UE97Ej+aextmKiJ5B25WMqGwzOCpwF/+RQbyho7jJYasDe4tk6Vn8ncq6IFVTgHW39x
	ueUyZJdbv+IOf1Y1O5ds5hYmm8Ia+HBqV7xwAsinnBrUH+k/blIpLyGyxzFpwPcPPBfwDISv+WA
	pwZ/jNeqgkb+2yhB3Ra2ZM3MvSagToPwAEhkXWPpwp7PY7QjaOovCqHHcH216htMxTaKaDjkQnx
	4QS7JBI4RrK0htRIA7uejWqefqIOGnHPfzw==
X-Received: by 2002:a17:902:f60b:b0:295:557e:7468 with SMTP id d9443c01a7336-297c958fe74mr16455695ad.28.1762509016145;
        Fri, 07 Nov 2025 01:50:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2DuNkB2jUtRe9W3nWHPaacKbPsDdPCycjAB2zpUWqgYoyNz6in8DybnZfgoMRJDTBhp+OmQ==
X-Received: by 2002:a17:902:f60b:b0:295:557e:7468 with SMTP id d9443c01a7336-297c958fe74mr16455075ad.28.1762509015565;
        Fri, 07 Nov 2025 01:50:15 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650c5f011sm54975895ad.25.2025.11.07.01.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 01:50:15 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 07 Nov 2025 15:19:39 +0530
Subject: [PATCH v3 4/6] media: iris: Move vpu register defines to common
 header file
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-knp_video-v3-4-50c86cbb0eb8@oss.qualcomm.com>
References: <20251107-knp_video-v3-0-50c86cbb0eb8@oss.qualcomm.com>
In-Reply-To: <20251107-knp_video-v3-0-50c86cbb0eb8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762508991; l=8747;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=8f0mRmi0hUp2NmLu4BNS1QNe53fDlDPPjjxHkdXkkNI=;
 b=SwUSKtsD4tzI6588POYPoUQtGtawm+0UoChn8viu4j5wja/+73LhZON1QVTm7BuX8qEKupw3A
 xLxtzc9ofdaB7RsR4+xc9CZp5BN0j5fZmmWJmm+gjB8QJg19ozcBV/i
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA3OCBTYWx0ZWRfX1YCTpMOZvWU6
 axUaSW4O4k3VcFFqEbpYqGlkxxv2b1bVRZHmw1OHadflWWXqP1tuFXjmHn8gs8p9z1AZD3nmEV0
 dD/zqYJA4wChFjIGwFLRCeSfGkhXxoDxmeZzzX2FNJIK2ZhSB5eRIlI/0DTvWMFC5Qqe/YDhrDP
 FGQAhra9nLTGVgipKZfb51It+gmw6sjOTJS1u8aZcOpzMdSW4dmnDvM0AYshTnG3T9FUQDQ/Chx
 HTfznV049rsxkXrgnSBG0j6fIOGtxkn+U2MPXOn/nqGg6dycpfs7lUp+zYnQ3pWmY+f5HN4IWYg
 zS3lLNOK7BucyhfFyCVbZMfr+kBTAZJCeNNudvzS9Yp8IGMbkuVp+DXKXusOb4ffw4RW7q/sK6c
 yFBfimLVhosF7GFnst+AZGTW0kkcBw==
X-Proofpoint-ORIG-GUID: 7vyT9rjTbcJLU3vSTqV9IQHV_V6FMIBg
X-Proofpoint-GUID: 7vyT9rjTbcJLU3vSTqV9IQHV_V6FMIBg
X-Authority-Analysis: v=2.4 cv=BrKQAIX5 c=1 sm=1 tr=0 ts=690dc0d8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=qUPVcWiRufo_Kb4lI7EA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070078

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
index bbd999a41236dca5cf5700e452a6fed69f4fc922..4e574502d5139eafb13b124172ae6e5b85b72b60 100644
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


