Return-Path: <linux-arm-msm+bounces-76917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40567BD130D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 04:11:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 501AA3BD725
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 02:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 718EF2F547C;
	Mon, 13 Oct 2025 02:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e1i0y/bH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0A927F4CA
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 02:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760321357; cv=none; b=Ot3tqd3TE6GfDje6xKjCB6sDUgaYDFimNdSH5VjisDOm/xAK0U3XiONccpBX7l1Kp3mVrjI0l0hQRbYkDkILUdlmLMj79YeQmX7PaMHy0PZjyMWWhy/Yto5C1G4xKeVAsmQo4IuUbbRT85yPl3edsRM99N5EGWedKKGmHWeoca4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760321357; c=relaxed/simple;
	bh=Vp/ykzgKhfedpHBRbN7YilOuy87M0W8I3NU/Zs/Wn5c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PcVZvtnYA+IDyPiLXj0a0mQsSCDsBv/VJ1bLUIDh+o9UOz/XvJX8Lkh06JY2+PsU/Ye70FM+DErJ6sbXcLBHd8VpsPCjLcSPzubg8W6P5ifnXt7MzOa3dGG3LC3Cyp65j81hhEKt+Tla6O4B7EIAh7Af0DFWrxOgQ1wv7STE5sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e1i0y/bH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59CMmmIN005045
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 02:09:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ctamzewqOXOp6USHp3dTDRf2YyPP8/Km6zYRt+SqkZ8=; b=e1i0y/bHANz4Qo23
	ZVXN/YfLFEL6AqRZoY3o9rdDPWELvkj2aKUhiPClpSpYY4ynLhJEBf9Jqrsc6Hmw
	gh5p9PDAYSaCjtxorNQ5KHWsZ8Uo7AAMR64F4cuDxbunOaV9VClqa00GTV9oHCGM
	0rr+BTJoWXtlXWjnW5L+Al3eS4Sa6GLc2efEe/YJtj2q/ilrYXmyDN4gThBXhtFZ
	/K8nvbukV14zrT6AY0eqxlHQJFZOBbcrxM9cK4iHGPHdBK0E/oPsEnxIMSMNeRyW
	12RMMJhJT/T31nPISN4bNN6m/JzTUPQJGcGlJdM+EodLrAOc34W8BHuqLb8D+sr9
	Twuhkw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa82xph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 02:09:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-827061b4ca9so1875683685a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Oct 2025 19:09:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760321353; x=1760926153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ctamzewqOXOp6USHp3dTDRf2YyPP8/Km6zYRt+SqkZ8=;
        b=mt46n/wXNZnLZf6QmsGe8+WkDOzocgtTeEiE44XUeoadoeRPI+dDX2Cvc2faIodXr8
         bl7lTOyHirsgjLUOp5wX3qQBmiQvVGdXvJQ/bkO84GAOsptEnicseAucys0CmSGnI5nf
         Fu3ak2jZdR9un1pHbOEcO9ODJE1/sAPiqWvoaEqJOyi34nt46IXbTD2yaEhJqPz3tbZk
         ls8/FTh07L0ia0U/ONXfaTPHpQXql89WG75MtZODUjwGyD5GN9SmOHytKJN2Qdx2hNlW
         DvfOZMfLjPM+LXJSYwHoi7UQhrtYLGxde8xcFGiDcF0NFIoQr3kJLLgVcEpxImaDm3mV
         Fdqg==
X-Forwarded-Encrypted: i=1; AJvYcCXiv18vIMB90yBf7e3fUZr7LKNsS6OuXpDEE1X9cIYrVwGDLbQFNwVVnDswI3yAzm4bSD7kxYNqBGvyTo9K@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj6jVeseu/DrLgt7M1jdRgPjV4D7q66QVgnFmI7hp96vxhsQJY
	HTXFC1TDnfZDVS+SHU6DRoLKFVHzaxexJkmv3pm+Q4sUTvwR9kUStp/Zj1BZZdNnZzWR3h+UgOO
	YhCw4msweedJfEi98Py+1RWEDarmb/3QMzho7lAzKfPi8aPbD+0V8b49RIHMLz4s28Ktv
X-Gm-Gg: ASbGncu1FZ6hftDlqBW7L/7DbQqTet+v0X+w1MKvq0GYjciKcUDpovULkKSUDcNLr1A
	X63VELTU3+nrDyHW1TV5/KqeEHqaOB+sp3+ijUvkCQ01ZsLQAYpJXvrB/OBoWSzgeBhLbXh+XH0
	J0oAoCd49LGToDCCMPgFm8Sd+QyC8ZkdgV3c4HMwIpsa5njHd+gk+UA1EgFvDTkBnX1AaztXkH4
	Ep06oik10GrEMgeEoe3Q90LYdhVBeRLHGGLNzB6acm6j+FGiOwl2woVKa3Xnqy5Wpr4HsfRr8H+
	6i8JtT5EfEH8YgLHMz5rtZNxs7bH/la/GOka8Q3GeuoJWSa3diZ5Hw42EICrirVa+P0k55zH0Ac
	82fIMYVr5oxygbRcM/V7jAJ6tCP1leuH58E8LoRDECTWLP4Rts2k5
X-Received: by 2002:a05:620a:1a83:b0:85e:3ab2:9627 with SMTP id af79cd13be357-88353b2a836mr2680154885a.60.1760321352583;
        Sun, 12 Oct 2025 19:09:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEj0BXQKCxddmLt52w+2YWNLCNIqpg5mFTrg3PhAaGu8+XAjRniTdGYKr4vTlXFjn9QLc6ixw==
X-Received: by 2002:a05:620a:1a83:b0:85e:3ab2:9627 with SMTP id af79cd13be357-88353b2a836mr2680152785a.60.1760321352081;
        Sun, 12 Oct 2025 19:09:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4f99sm3563419e87.7.2025.10.12.19.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 19:09:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 05:09:01 +0300
Subject: [PATCH v3 7/8] media: iris: move common register definitions to
 the header
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-iris-sc7280-v3-7-f3bceb77a250@oss.qualcomm.com>
References: <20251013-iris-sc7280-v3-0-f3bceb77a250@oss.qualcomm.com>
In-Reply-To: <20251013-iris-sc7280-v3-0-f3bceb77a250@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8281;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Vp/ykzgKhfedpHBRbN7YilOuy87M0W8I3NU/Zs/Wn5c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo7F852VY8ZzICC8m3ZLzbaSBh/FnPr688CSzzX
 aLBmgYVTHOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaOxfOQAKCRCLPIo+Aiko
 1VKHB/9mAf7nWFfPN4lMK1JX67k5zhUsORN7xlYt85z/U0VcptRwbdowFWF+rXarDUjkW2I2pke
 4QVyxTdfUnrLelO8Y6wJG/GWz/EGD0sT+TzV6d7o3UtE9gDHwTcRLDC20D8tKYKoFaQH3bjXFIn
 Yp2ejI8Uvg8E/KyoUyDx50v/IZM2rRN98oE6hPqEPDhOaiDJvjSwUnS3J+tY6HznGbHvP8zwSdg
 bxc1SXJqwGf9x1IU7I1rMJVbMxt8z4VkqwNUIR5lj699C2dntd2yWDdpiRlbrbY34uf/SJO9xdO
 7RnPjHFyDfjX54uJtNazujq7vJpMTRsXxEeFtdGmtZJdOT+T
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: S5lnOGQO-y2HB7MYRBeoVaW0DMT0HBF1
X-Proofpoint-ORIG-GUID: S5lnOGQO-y2HB7MYRBeoVaW0DMT0HBF1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfXySKAk8DG98jD
 QLVa+kuHlUAEpzW6si+B9fD4F+s59MxGOFFgq+Yt1EWIlx3J8WYbuEHX3RzYZiugBawk2UmTgL7
 RT7malsyq15oVDSrnnYNaa51a/VntH3qeC5pGBqv1O9d2FvapNiABzr/TKlThFgpZ/bl3RxIli4
 a+KLq9dSRyFx/oetFBg3El4qQun5OySAnaM5iLVbUuU0ltzwwxOWYuNkpeUuXP0J8TN3+j34pcb
 O7nFjY0B34mdNkUvlVZX554A5eLogFteg+ou7L8xll8vDk8va2JqKWOQS/tnREaMi/HVma0LpmA
 hGOA6NJ/G+FGATiYfli9RdNANJpsSNg2JGJBf75Dg3FmTdDDBgi23aodg7lt9BRjK+vGb0puvkF
 GCcOavr30ZwJbf4/JhyS7iHJTKvgKw==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68ec5f49 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=qUPVcWiRufo_Kb4lI7EA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017

Simplify adding new platforms by moving common registers definitions
from VPU 3.x and "common" file to the header with other register
defines.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 35 --------------
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 43 -----------------
 .../platform/qcom/iris/iris_vpu_register_defines.h | 56 ++++++++++++++++++++++
 3 files changed, 56 insertions(+), 78 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index 339776a0b4672e246848c3a6a260eb83c7da6a60..78aede9ac497abafc0545647c34a53c63c595f72 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -11,48 +11,13 @@
 #include "iris_vpu_common.h"
 #include "iris_vpu_register_defines.h"
 
-#define WRAPPER_TZ_BASE_OFFS			0x000C0000
-#define AON_BASE_OFFS				0x000E0000
 #define AON_MVP_NOC_RESET			0x0001F000
 
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
 #define AON_WRAPPER_MVP_NOC_RESET_REQ		(AON_MVP_NOC_RESET + 0x000)
 #define VIDEO_NOC_RESET_REQ			(BIT(0) | BIT(1))
 
 #define AON_WRAPPER_MVP_NOC_RESET_ACK		(AON_MVP_NOC_RESET + 0x004)
 
-#define VCODEC_SS_IDLE_STATUSN			(VCODEC_BASE_OFFS + 0x70)
-
-#define AON_WRAPPER_MVP_NOC_LPI_CONTROL		(AON_BASE_OFFS)
-#define AON_WRAPPER_MVP_NOC_LPI_STATUS		(AON_BASE_OFFS + 0x4)
-
 #define AON_WRAPPER_MVP_NOC_CORE_SW_RESET	(AON_BASE_OFFS + 0x18)
 #define SW_RESET				BIT(0)
 #define AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL	(AON_BASE_OFFS + 0x20)
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index bb98950e018fadf69ac4f41b3037f7fd6ac33c5b..2d6548e47d47967c1c110489cb8088130fb625fd 100644
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
index fe8a39e5e5a3fc68dc3a706ffdba07a5558163cf..9955367a9f8179d2e364c41dcfe8ad445a0a13f4 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
@@ -9,9 +9,65 @@
 #define VCODEC_BASE_OFFS			0x00000000
 #define CPU_BASE_OFFS				0x000A0000
 #define WRAPPER_BASE_OFFS			0x000B0000
+#define WRAPPER_TZ_BASE_OFFS			0x000C0000
+#define AON_BASE_OFFS				0x000E0000
+
+#define VCODEC_SS_IDLE_STATUSN			(VCODEC_BASE_OFFS + 0x70)
 
 #define CPU_CS_BASE_OFFS			(CPU_BASE_OFFS)
 
+#define CPU_CS_A2HSOFTINTCLR			(CPU_CS_BASE_OFFS + 0x1C)
+#define CLEAR_XTENSA2HOST_INTR			BIT(0)
+
+#define CPU_CS_H2XSOFTINTEN			(CPU_CS_BASE_OFFS + 0x148)
+#define HOST2XTENSA_INTR_ENABLE			BIT(0)
+
+#define CPU_IC_BASE_OFFS			(CPU_BASE_OFFS)
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
+
+#define WRAPPER_INTR_STATUS			(WRAPPER_BASE_OFFS + 0x0C)
+#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
+#define WRAPPER_INTR_STATUS_A2H_BMSK		BIT(2)
+
+#define WRAPPER_INTR_MASK			(WRAPPER_BASE_OFFS + 0x10)
+#define WRAPPER_INTR_MASK_A2HWD_BMSK		BIT(3)
+#define WRAPPER_INTR_MASK_A2HCPU_BMSK		BIT(2)
+
 #define WRAPPER_CORE_POWER_STATUS		(WRAPPER_BASE_OFFS + 0x80)
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
+
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
2.47.3


