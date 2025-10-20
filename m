Return-Path: <linux-arm-msm+bounces-77950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D50BEFA37
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 09:18:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A7F914EF660
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 07:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3970D2DECD3;
	Mon, 20 Oct 2025 07:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ey5a+Xjz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A392DCF5D
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 07:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760944367; cv=none; b=JzFdEUHWiCi6EsHfwmqhw4wBadm6zgQRCrf11mdyIMTwMbLTKEJj/k4DndotSRyacWVwzFSZRiDwGEaBdA37xJOii0Y1337YEm+UWaHjS417EiRZNG1j2XBn5IuitKwfpWvkuUC0xdNSPGtCY8myGKwEb5AShqbBOQhVg8f2Tac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760944367; c=relaxed/simple;
	bh=LxkSswmq7/VzbgD4niKaHouj75CQbpqGu6h5wzMgXi0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KJ2TPpeAP+Gh7lODaI3fw3+MMas8h8tY5cAI54SVQ9NqjNUS5KVc0XfeEdk1kMtkqB+9afuIjEMLwoY3eBU99fiomMp3oE5wddJRXB7jY5iKKoEcUarKs8oQSK+zTF/hONtYiS5C4HSo83g9QJDKcXlNzTlYZSag8cSchRd3U8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ey5a+Xjz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59JNawBg001556
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 07:12:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z9zjS+B0bKFXep+R6zDrcgRU9GSpkkJKTWsSnW1MCMg=; b=Ey5a+XjzRpvN+i0X
	YcX/hl6ZsSTs5kYVN3dZg/hBqxpn2OdzWbuFAsgVzVvF2hzMDwhNaaXkGMfoyFbw
	ZdBM1crbqPTWMI4A7QLl4cXN1E4p2mh2otQWKvZ/3rkBfY7fNMyhAyfnwf1E5h+F
	OuOkRGhVzmpFquHde5iLauqoiSsi+psOXj8oJ2h3gxjOnkDoSZesReTggQaqzBvu
	hLyIi8MKEkTXVja3lReKwQLHc+A7nsnYrgijUybjhQtcWdDOu90w9oPGQPi/akWZ
	L5fyu+S7hpyP63Ha0m5anhPsReb60wtfdepJ3ukakXyEQ+SIFjAYLaaB1kjMS3Q/
	KcOn6w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v42k3tkt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 07:12:43 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b632471eda1so3425753a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 00:12:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760944362; x=1761549162;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z9zjS+B0bKFXep+R6zDrcgRU9GSpkkJKTWsSnW1MCMg=;
        b=uHfyI1R1AwN2UIY0a0kUznc3PqV+y60PaFuQkgVUgsiS06TwJMOpcug2iL+GOCRTg2
         OCWZh7fWzGQBEqzDnJDhSghd6ZEI3I2o73xXshUHhcLzeDe2IgKle5BlgH7MurDIBlvQ
         I6AhA+J2HQH9m2B5tLkgj88L1Hmst5jfScUwYrsf1e7lkBi++eBncU4XUQgZTaIYucHz
         ZoYV8IC45lvk6W7/j3ilOyNbfIrs/v4huG9ZisBM94dL25cr5LWAcYuXVPgqNXJp4+Km
         TywtWauKVwKxLVfbh+3RTZ5zawUmWIH82hxO5wK15iJ9PV7SJHJpSZpZVBh1VAay1CdO
         7S0g==
X-Forwarded-Encrypted: i=1; AJvYcCX7VGr8R2aPBGKPgbSYwvrSQMLSO/e+lvCytb7cqbxUcQPmIsuYjKnhguQz5yS4RGaekRi/cXEVz7h5uHiY@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8strQ7dA0qt3BXTpkCFBIpdWw5HUK72Y0MoQGn68PrVqqM4tA
	hhDARWMZzVQbBF+6K9RV8tMWkeIasUR87lwq4yPH3d7g3bOKsMsaukupeGXhq9t3RbWTc2V5Dl5
	kHDERzkJ8/wIINlcldDUK78CoZNUN2OihgakT3GnuMzZUpJjrOIXSRX5SHorm8MtP9v9UnZoeqb
	Kh
X-Gm-Gg: ASbGncv75A2cjqGEy0vfLWRlbJI/e/8wucB7sW23DcKyQcLtN6ihKKAnbL6HevsXAtg
	elcAahE+LaJlKY0he2FYiWw2Jc0RRcW+hMZmIRHTKANMftgRQsk9AcGpcDqPFdRIi8OJW1o62Xx
	rHTWwqahj5yobkC/NDLaOsy2yMxBwxi30S5gcv6Cgi134/AxUHepLRJ9MtyUqYt2j/X4v4TTNv4
	iaq4xmZ/JLm/QHHs4Y+UJjOSSmuGFeINc1cENgKM4NF7jkjEq/U1O8f0nrxlFMpTcsk0c7Dj1UA
	xkWmyoojeTedijhPMF0yln4NSW2QmrEJCzNZLMz+kCCzYkylhZF4uwjGbN7bMG9e8DQbEoGTreX
	tgFfwXq7/UQ56AoCE1o4RYX1CZTpjN4JA/fJjJy0GAquMk4NbxLznWMx2vcetLHkKo7w=
X-Received: by 2002:a05:6a20:a108:b0:32b:725a:d684 with SMTP id adf61e73a8af0-334a8621568mr16830757637.43.1760944362087;
        Mon, 20 Oct 2025 00:12:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcLNmfQIv+9bdMhVWkIigX8PDxLykVnzV+NvkdkmwyWmrl7ATozrY4TKcz4vrwamVwEGXl3Q==
X-Received: by 2002:a05:6a20:a108:b0:32b:725a:d684 with SMTP id adf61e73a8af0-334a8621568mr16830713637.43.1760944361498;
        Mon, 20 Oct 2025 00:12:41 -0700 (PDT)
Received: from jinlmao-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff34b8bsm7421705b3a.22.2025.10.20.00.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 00:12:41 -0700 (PDT)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 15:12:01 +0800
Subject: [PATCH v5 2/2] coresight: cti: Add Qualcomm extended CTI support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251020-extended_cti-v5-2-6f193da2d467@oss.qualcomm.com>
References: <20251020-extended_cti-v5-0-6f193da2d467@oss.qualcomm.com>
In-Reply-To: <20251020-extended_cti-v5-0-6f193da2d467@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        quic_yingdeng@quicinc.com, Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
        Jinlong Mao <jinglong.mao@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760944348; l=21915;
 i=yingchao.deng@oss.qualcomm.com; s=20250721; h=from:subject:message-id;
 bh=LxkSswmq7/VzbgD4niKaHouj75CQbpqGu6h5wzMgXi0=;
 b=TObmKpueRXIml1UdJYQUR21Vm42VXCkVmzq+jubBBHfdpSxy+WaQH8wKjyHKwGP60XzZI7cvl
 qNdF+r8iOnfB98YWkNPsVTEp9DfSnsZDM2IrsXg8HyTwhprmL1drlDi
X-Developer-Key: i=yingchao.deng@oss.qualcomm.com; a=ed25519;
 pk=1zkrZnKgKCu3VxiiiGfzpW3KL9RNP/qun1frl0ozUIc=
X-Proofpoint-GUID: Y7B3mYhat72LlGg-yHRBWCQ4EyyrCvav
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMSBTYWx0ZWRfXwf0EKrXaZG5P
 Z5+m1GY9lKfM13xkeSuoc66v45L225lREVyf4OGur181e7YBbN8W655uFiCHEID4SVCf6Nj4Llx
 /ElVW23ZHVRAx4EJMFmuBnE3OCRUAov2RHTkUu0RObw0hJKuxQVHrtL+H7MLfZeLOOasX00x8lN
 9RyPwhhBGhE3gl054g48SvI/NU1T8JJ0BFL+mNOMFph3UK0VGtyndr/W+jFLgFBRKnbld6vGzG0
 GxhzDfsZg+FE5VfQM6GnHmt4E4/tB3sidaj4L80mSLTKmkCjxLHtMhCtTNmKDtmTatCbjinx78d
 jMkdO8pbDtwrGi0HmozAuGSyhN7+djXSbo2dlBouveyl7oYy5iXZejls/Lwl8xF/MQ76cx+axkV
 O04IRAX9reTCwiQB4xrfJfJyVD4rRA==
X-Authority-Analysis: v=2.4 cv=QYNrf8bv c=1 sm=1 tr=0 ts=68f5e0eb cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=z5wmrBwRF2HVXruN5psA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: Y7B3mYhat72LlGg-yHRBWCQ4EyyrCvav
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180031

The QCOM extended CTI is a heavily parameterized version of ARM’s CSCTI.
It allows a debugger to send to trigger events to a processor or to send
a trigger event to one or more processors when a trigger event occurs
on another processor on the same SoC, or even between SoCs. Qualcomm CTI
implementation differs from the standard CTI in the following aspects:

1. The number of supported triggers is extended to 128.
2. Several register offsets differ from the CoreSight specification.

Signed-off-by: Jinlong Mao <jinglong.mao@oss.qualcomm.com>
Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-cti-core.c  |  86 +++++++++--
 drivers/hwtracing/coresight/coresight-cti-sysfs.c | 174 +++++++++++++++++-----
 drivers/hwtracing/coresight/coresight-cti.h       |  43 +++++-
 drivers/hwtracing/coresight/qcom-cti.h            |  29 ++++
 4 files changed, 281 insertions(+), 51 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index 8c9cec832898..5330db7eecf1 100644
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
@@ -894,6 +947,7 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 	struct coresight_desc cti_desc;
 	struct coresight_platform_data *pdata = NULL;
 	struct resource *res = &adev->res;
+	u32 devarch;
 
 	/* driver data*/
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
@@ -980,9 +1034,19 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 	drvdata->csdev_release = drvdata->csdev->dev.release;
 	drvdata->csdev->dev.release = cti_device_release;
 
+	/* qcom_cti*/
+	devarch = readl_relaxed(drvdata->base + CORESIGHT_DEVARCH);
+	if (CTI_DEVARCH_ARCHITECT(devarch) == ARCHITECT_QCOM) {
+		drvdata->subtype = QCOM_CTI;
+		drvdata->offsets = cti_extended_offset;
+	} else {
+		drvdata->subtype = ARM_STD_CTI;
+		drvdata->offsets = cti_normal_offset;
+	}
+
 	/* all done - dec pm refcount */
 	pm_runtime_put(&adev->dev);
-	dev_info(&drvdata->csdev->dev, "CTI initialized\n");
+	dev_info(&drvdata->csdev->dev, "CTI initialized %d\n", drvdata->subtype);
 	return 0;
 
 pm_release:
diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
index a9df77215141..88fd1c9c0101 100644
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
@@ -189,6 +188,39 @@ static ssize_t coresight_cti_reg_show(struct device *dev,
 	return sysfs_emit(buf, "0x%x\n", val);
 }
 
+/* Read registers with power check only (no enable check). */
+static ssize_t coresight_cti_reg_show(struct device *dev,
+				      struct device_attribute *attr, char *buf)
+{
+	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct cs_off_attribute *cti_attr = container_of(attr, struct cs_off_attribute, attr);
+	u32 val = 0, idx = drvdata->config.regs_idx;
+
+	pm_runtime_get_sync(dev->parent);
+	raw_spin_lock(&drvdata->spinlock);
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
@@ -197,19 +229,38 @@ static __maybe_unused ssize_t coresight_cti_reg_store(struct device *dev,
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cs_off_attribute *cti_attr = container_of(attr, struct cs_off_attribute, attr);
 	unsigned long val = 0;
+	u32 idx = drvdata->config.regs_idx;
 
 	if (kstrtoul(buf, 0, &val))
 		return -EINVAL;
 
 	pm_runtime_get_sync(dev->parent);
 	raw_spin_lock(&drvdata->spinlock);
-	if (drvdata->config.hw_powered)
-		cti_write_single_reg(drvdata, cti_attr->off, val);
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
@@ -237,17 +288,17 @@ static __maybe_unused ssize_t coresight_cti_reg_store(struct device *dev,
 
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
 
@@ -258,13 +309,15 @@ static struct attribute *coresight_cti_mgmt_attrs[] = {
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
@@ -284,11 +337,12 @@ static ssize_t cti_reg32_show(struct device *dev, char *buf,
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
@@ -298,6 +352,7 @@ static ssize_t cti_reg32_store(struct device *dev, const char *buf,
 	if (pcached_val)
 		*pcached_val = (u32)val;
 
+	reg_offset = cti_offset(drvdata, index, 0);
 	/* write through if offset and enabled */
 	if ((reg_offset >= 0) && cti_active(config))
 		cti_write_single_reg(drvdata, reg_offset, val);
@@ -306,14 +361,14 @@ static ssize_t cti_reg32_store(struct device *dev, const char *buf,
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
@@ -322,7 +377,7 @@ static ssize_t name##_store(struct device *dev,				\
 {									\
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);	\
 	return cti_reg32_store(dev, buf, size,				\
-			       &drvdata->config.cfgname, offset);	\
+			       &drvdata->config.cfgname, index);	\
 }									\
 static DEVICE_ATTR_RW(name)
 
@@ -356,6 +411,46 @@ static ssize_t inout_sel_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(inout_sel);
 
+/*
+ * QCOM CTI supports up to 128 triggers, there are 6 registers need to be
+ * expanded to up to 4 instances, and regs_idx can be used to indicate which
+ * one is in use.
+ * CTITRIGINSTATUS, CTITRIGOUTSTATUS,
+ * ITTRIGIN, ITTRIGOUT,
+ * ITTRIGINACK, ITTRIGOUTACK.
+ */
+static ssize_t regs_idx_show(struct device *dev,
+			     struct device_attribute *attr,
+			     char *buf)
+{
+	u32 val;
+	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	raw_spin_lock(&drvdata->spinlock);
+	val = drvdata->config.regs_idx;
+	raw_spin_unlock(&drvdata->spinlock);
+	return sprintf(buf, "%d\n", val);
+}
+
+static ssize_t regs_idx_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf, size_t size)
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
+	drvdata->config.regs_idx = val;
+	raw_spin_unlock(&drvdata->spinlock);
+	return size;
+}
+static DEVICE_ATTR_RW(regs_idx);
+
 static ssize_t inen_show(struct device *dev,
 			 struct device_attribute *attr,
 			 char *buf)
@@ -389,7 +484,7 @@ static ssize_t inen_store(struct device *dev,
 
 	/* write through if enabled */
 	if (cti_active(config))
-		cti_write_single_reg(drvdata, CTIINEN(index), val);
+		cti_write_single_reg(drvdata, cti_offset(drvdata, INDEX_CTIINEN, index), val);
 	raw_spin_unlock(&drvdata->spinlock);
 	return size;
 }
@@ -428,7 +523,7 @@ static ssize_t outen_store(struct device *dev,
 
 	/* write through if enabled */
 	if (cti_active(config))
-		cti_write_single_reg(drvdata, CTIOUTEN(index), val);
+		cti_write_single_reg(drvdata, cti_offset(drvdata, INDEX_CTIOUTEN, index), val);
 	raw_spin_unlock(&drvdata->spinlock);
 	return size;
 }
@@ -448,9 +543,9 @@ static ssize_t intack_store(struct device *dev,
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
@@ -504,6 +599,7 @@ static DEVICE_ATTR_WO(apppulse);
  */
 static struct attribute *coresight_cti_regs_attrs[] = {
 	&dev_attr_inout_sel.attr,
+	&dev_attr_regs_idx.attr,
 	&dev_attr_inen.attr,
 	&dev_attr_outen.attr,
 	&dev_attr_gate.attr,
@@ -512,20 +608,20 @@ static struct attribute *coresight_cti_regs_attrs[] = {
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
diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
index 0bd71407ef34..034d6fd1590b 100644
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
+	u8 regs_idx;
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
@@ -234,6 +270,11 @@ struct coresight_platform_data *
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
index 000000000000..eaa551ff118a
--- /dev/null
+++ b/drivers/hwtracing/coresight/qcom-cti.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
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


