Return-Path: <linux-arm-msm+bounces-72333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09957B45CE1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 17:46:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D64A41898D4B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 15:46:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36D3D313275;
	Fri,  5 Sep 2025 15:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KxJCOcUa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDEE309F02
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 15:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757087089; cv=none; b=ORC3EQXjbaY1b1SSaocDWgwZtZ3FCAjEijTsvXqS8/av9WTuZYDvwMo9gvQZajH5q9d9/GflQK1ir72PAWInnAnE1Yz/i4FM9EFIOET+qemtf/0/gWfV2GNA5mnCxJ2MHfU3OahFf9BczGio3pRqksVaHaoxeF/VPfiQqzKVZaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757087089; c=relaxed/simple;
	bh=Cjy52+rSRRvz3amTrK4YwqzuJwEQTV/P2tzL0E0LFV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jk5DT4K8VM0SJ4TSz53SV/gZvQBE7n2iKC+N1ziFrPnzBV4B33SAMKAJVaVq9Rc4lj0kECa6YQ8CEA4vYEcjuZZXbp1sAxUxHq+pG12qAK2XkXB4SaO7PZcIxxU1wPycpn6QZiYTaW594JlXuCS13eO5EYGZjvzZDHsBrc7d29A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KxJCOcUa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5857FlUX032158
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 15:44:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=K2pu6aXHHMg
	rwRHirB2+Q4ERe85JA0bGoneC1M05bpY=; b=KxJCOcUavzDLNCeF7ONaUzl/U5H
	TT5jWUYH/5CHl3vMsgpe+Y+vwECM6XLFOD/tkV0zCSokQx6RYkVlCP8g4bNcN5cx
	AZfCKSQQ7krx/2oMY69sozwO6Mmorn+R4JccAKyBRuLYLaHqJm88Ol+cjtzwlZyf
	BMVPTPxismLYO4X1cDVvw898vdsC1vxJ/G8Vac3x75A6xEZ4TluxND//F3eREFwb
	sl6DDCIrklmCXQtJzvG7jDmZi1HloiB7Z1Up2Kal2TikjzrQeFyDHkURE0eyfMRM
	0gwbYU6nnoTQ0FiYeAaM60aIJF03S/brsEpCP02VhlwlQxGxZq1g752s4Pg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpkrax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 15:44:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b49715fdfbso72678581cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 08:44:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757087084; x=1757691884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K2pu6aXHHMgrwRHirB2+Q4ERe85JA0bGoneC1M05bpY=;
        b=a9xPu2CC8Cfz5/+a6iHrbKnNrk704kY1ku9aGcEQujOAhef//cA3q3/yVAGljxFXNn
         3FSuSRy5W7CUMCQLV6sJ+uOVStnaBOwDgF+6BO+4r5A3K1kTv/D/QsGJ4f691eqHjU7J
         C2Y1u1aVDptn7KduJhaEKu2+27gQ90cDhEhR960Ynbw+UYaU/oE7GHNpjiXQPKO4cBoT
         JdZ3enqbBMnXNtCfcOMuDVOKfg+lVPi0BEv+sTXvXwWoHrCkVEup8y+IVJhASWirc5Zd
         0U4Irk0bYqYQMsf7NzU5AsfUG6Y7EVGkSPVl2sGcwF/0Nr/FKhp8ssE4tNDbHZdvMlji
         oqNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUclOF9QDn2kSFrQo//q87sP2GkjOv3VWveqB4O8e89MMECSCHidXmZpd+JRealPZFg94gGAmKNSv02ZZuG@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg+31cHzs/6TVpMKgV6EDSjdyukQRdIqA/JHZJ7Xtlj5mvSl9g
	c71qaU+bJ8Q3cfq4UKrx6SjDf1dpgm37kUYRdvCCDbYDIXKCX0mrY7VPQw2g2zp1anYJ0VYFMAC
	er01qXpTqcwAsFIbtYlGiTIiz1HqSZrEpdQClSQXD6GUzo+NvzkdOzjZfM3GsJ+gxbSlf
X-Gm-Gg: ASbGnctugWgmydNCztgli8KPzfnC1zbO7N26QcxuvXnjYUCHimzftQjSEBUq8qHMIWk
	KjeD6ENPr5fL0qOZYkF6xvq0MTA2HS4bfWY+6hQwAIGn79vb8Hu4TciGrfmHxB8sPl0Fn9M4K1n
	YOo4KO2FxXmILu33ohY3nkUnyoTxMAf1wC7mCJhqGXEPBS8KLSPwPgRXcbaUtvwyG/oBML7q4Wv
	6qTpL9zv4qM5CXZMSA4Tl2VsnLwENsm+XfwOhK6rJz5LAyqZHr9AdRfHBv9pT6zPPWZ/Il4bKH5
	mMpHqRTUZieZ7LA7pPuopQFFqjz9Dzj7w1Yg0Daxi9xS90RnN+9sUQ==
X-Received: by 2002:ac8:5fd4:0:b0:4b4:8f9f:746c with SMTP id d75a77b69052e-4b48f9f8a42mr146800061cf.23.1757087083401;
        Fri, 05 Sep 2025 08:44:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZgzTwEaz8RZ2gyWBCs/GRl9dOB+wMEPsneMmfR36D0n91yQ36mwhiHlbNNXR+RAF+oler4g==
X-Received: by 2002:ac8:5fd4:0:b0:4b4:8f9f:746c with SMTP id d75a77b69052e-4b48f9f8a42mr146799461cf.23.1757087082604;
        Fri, 05 Sep 2025 08:44:42 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9bcda91dsm165716585e9.6.2025.09.05.08.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 08:44:42 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        neil.armstrong@linaro.org, krzysztof.kozlowski@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 06/12] ASoC: codecs: wcd: add common helper for wcd codecs
Date: Fri,  5 Sep 2025 16:44:24 +0100
Message-ID: <20250905154430.12268-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250905154430.12268-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250905154430.12268-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: OLfoY2XF20qz8Uc-LlECJgY1_C0MZoHM
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68bb056c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=wa_gl3HYg-BSzEidaMMA:9
 a=sbBvEVo_xVyyD6Se:21 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: OLfoY2XF20qz8Uc-LlECJgY1_C0MZoHM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX1ERGshxToSGb
 UR2bCvmg/6l5TDbJU7Cqb2fSDezQXL02NpKzRkHksUtgzYxKi5U4NytqveGpQzsiP68xTghHk94
 QL7pCLWD17qAdtWfDVFnugfyHgXRV6yAh2ta6fkbuG1tZrrWAB2AGimbtJLQTQLd2r/BHHebRQ9
 Shaiud1lO4vU+irZNXydXWAdCP8vgRp4/bPyXidnb1xGSYvcL2VstUK4GZ1An4BZDyn+/Tz20iq
 UUHQ025+Lp/Um/dIHoQCwOcWsvTzZrDonP3SlxGvczIH7UXxWUNwXT8KpFUWadXFmjbbfic6s+s
 sYtDxYsRjtOo1ABo5H8JXwX5WHaGs0vz8Qr9R899N2VOA7bVEOfwQvfpc4We3YPiEDQ/U24+iNa
 kGQ0vQBr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

All the Qualcomm WCD codecs have most of its code duplicated across all
these 3/4 drivers. This is an attempt to remove those duplicate
parts by adding a common helper library for these codecs.

To start with move all the micbias parsing and voltage settings these
are identical in WCD934x, WCD937x, WCD938x and WCD939x codec driver.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/Kconfig      |  8 ++++
 sound/soc/codecs/Makefile     |  2 +
 sound/soc/codecs/wcd-common.c | 70 +++++++++++++++++++++++++++
 sound/soc/codecs/wcd-common.h | 27 +++++++++++
 sound/soc/codecs/wcd934x.c    | 82 +++++++++----------------------
 sound/soc/codecs/wcd937x.c    | 75 +++++++----------------------
 sound/soc/codecs/wcd937x.h    |  6 +--
 sound/soc/codecs/wcd938x.c    | 88 +++++++---------------------------
 sound/soc/codecs/wcd939x.c    | 90 +++++++----------------------------
 9 files changed, 183 insertions(+), 265 deletions(-)
 create mode 100644 sound/soc/codecs/wcd-common.c
 create mode 100644 sound/soc/codecs/wcd-common.h

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index b8d58d2fe326..f8476914e4ba 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -2251,12 +2251,16 @@ config SND_SOC_UDA1380
 config SND_SOC_WCD_CLASSH
 	tristate
 
+config SND_SOC_WCD_COMMON
+	tristate
+
 config SND_SOC_WCD9335
 	tristate "WCD9335 Codec"
 	depends on SLIMBUS
 	select REGMAP_SLIMBUS
 	select REGMAP_IRQ
 	select SND_SOC_WCD_CLASSH
+	select SND_SOC_WCD_COMMON
 	help
 	  The WCD9335 is a standalone Hi-Fi audio CODEC IC, supports
 	  Qualcomm Technologies, Inc. (QTI) multimedia solutions,
@@ -2272,6 +2276,7 @@ config SND_SOC_WCD934X
 	select REGMAP_IRQ
 	select REGMAP_SLIMBUS
 	select SND_SOC_WCD_CLASSH
+	select SND_SOC_WCD_COMMON
 	select SND_SOC_WCD_MBHC
 	depends on MFD_WCD934X || COMPILE_TEST
 	help
@@ -2283,6 +2288,7 @@ config SND_SOC_WCD937X
 	tristate
 	depends on SOUNDWIRE || !SOUNDWIRE
 	select SND_SOC_WCD_CLASSH
+	select SND_SOC_WCD_COMMON
 
 config SND_SOC_WCD937X_SDW
 	tristate "WCD9370/WCD9375 Codec - SDW"
@@ -2302,6 +2308,7 @@ config SND_SOC_WCD938X
 	tristate
 	depends on SOUNDWIRE || !SOUNDWIRE
 	select SND_SOC_WCD_CLASSH
+	select SND_SOC_WCD_COMMON
 	select MULTIPLEXER
 
 config SND_SOC_WCD938X_SDW
@@ -2321,6 +2328,7 @@ config SND_SOC_WCD939X
 	depends on SOUNDWIRE || !SOUNDWIRE
 	depends on TYPEC || !TYPEC
 	select SND_SOC_WCD_CLASSH
+	select SND_SOC_WCD_COMMON
 
 config SND_SOC_WCD939X_SDW
 	tristate "WCD9390/WCD9395 Codec - SDW"
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index a476d6c45451..8d9bc03ecc60 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -341,6 +341,7 @@ snd-soc-uda1334-y := uda1334.o
 snd-soc-uda1342-y := uda1342.o
 snd-soc-uda1380-y := uda1380.o
 snd-soc-wcd-classh-y := wcd-clsh-v2.o
+snd-soc-wcd-common-y := wcd-common.o
 snd-soc-wcd-mbhc-y := wcd-mbhc-v2.o
 snd-soc-wcd9335-y := wcd9335.o
 snd-soc-wcd934x-y := wcd934x.o
@@ -764,6 +765,7 @@ obj-$(CONFIG_SND_SOC_UDA1334)	+= snd-soc-uda1334.o
 obj-$(CONFIG_SND_SOC_UDA1342)	+= snd-soc-uda1342.o
 obj-$(CONFIG_SND_SOC_UDA1380)	+= snd-soc-uda1380.o
 obj-$(CONFIG_SND_SOC_WCD_CLASSH)	+= snd-soc-wcd-classh.o
+obj-$(CONFIG_SND_SOC_WCD_COMMON)	+= snd-soc-wcd-common.o
 obj-$(CONFIG_SND_SOC_WCD_MBHC)	+= snd-soc-wcd-mbhc.o
 obj-$(CONFIG_SND_SOC_WCD9335)	+= snd-soc-wcd9335.o
 obj-$(CONFIG_SND_SOC_WCD934X)	+= snd-soc-wcd934x.o
diff --git a/sound/soc/codecs/wcd-common.c b/sound/soc/codecs/wcd-common.c
new file mode 100644
index 000000000000..25c0a48ff858
--- /dev/null
+++ b/sound/soc/codecs/wcd-common.c
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2025, Qualcomm Technologies, Inc. and/or its subsidiaries.
+
+#include <linux/export.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/device.h>
+#include <linux/of.h>
+#include <linux/printk.h>
+
+#include "wcd-common.h"
+
+#define WCD_MIN_MICBIAS_MV	1000
+#define WCD_DEF_MICBIAS_MV	1800
+#define WCD_MAX_MICBIAS_MV	2850
+
+int wcd_get_micb_vout_ctl_val(struct device *dev, u32 micb_mv)
+{
+	/* min micbias voltage is 1V and maximum is 2.85V */
+	if (micb_mv < WCD_MIN_MICBIAS_MV || micb_mv > WCD_MAX_MICBIAS_MV) {
+		dev_err(dev, "Unsupported micbias voltage (%u mV)\n", micb_mv);
+		return -EINVAL;
+	}
+
+	return (micb_mv - WCD_MIN_MICBIAS_MV) / 50;
+}
+EXPORT_SYMBOL_GPL(wcd_get_micb_vout_ctl_val);
+
+static int wcd_get_micbias_val(struct device *dev, int micb_num, u32 *micb_mv)
+{
+	char micbias[32];
+	int mv;
+
+	sprintf(micbias, "qcom,micbias%d-microvolt", micb_num);
+
+	if (of_property_read_u32(dev->of_node, micbias, &mv)) {
+		dev_err(dev, "%s value not found, using default\n", micbias);
+		mv = WCD_DEF_MICBIAS_MV;
+	} else {
+		/* convert it to milli volts */
+		mv = mv/1000;
+	}
+	if (micb_mv)
+		*micb_mv = mv;
+
+	mv = wcd_get_micb_vout_ctl_val(dev, mv);
+	if (mv < 0) {
+		dev_err(dev, "Unsupported %s voltage (%d mV), falling back to default (%d mV)\n",
+				micbias, mv, WCD_DEF_MICBIAS_MV);
+		return wcd_get_micb_vout_ctl_val(dev, WCD_DEF_MICBIAS_MV);
+	}
+
+	return mv;
+}
+
+int wcd_dt_parse_micbias_info(struct wcd_common *common)
+{
+	int i;
+
+	for (i = 0; i < common->max_bias; i++) {
+		common->micb_vout[i] = wcd_get_micbias_val(common->dev, i+1, &common->micb_mv[i]);
+		if (common->micb_vout[i] < 0)
+			return -EINVAL;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(wcd_dt_parse_micbias_info);
+MODULE_DESCRIPTION("Common Qualcomm WCD Codec helpers driver");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/wcd-common.h b/sound/soc/codecs/wcd-common.h
new file mode 100644
index 000000000000..42d84e42d40f
--- /dev/null
+++ b/sound/soc/codecs/wcd-common.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2025, Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __WCD_COMMON_H__
+#define __WCD_COMMON_H___
+
+struct device;
+struct sdw_slave;
+struct sdw_bus_params;
+struct irq_domain;
+enum sdw_slave_status;
+
+#define WCD_MAX_MICBIAS		4
+
+struct wcd_common {
+	struct device *dev;
+	int max_bias;
+	u32 micb_mv[WCD_MAX_MICBIAS];
+	u32 micb_vout[WCD_MAX_MICBIAS];
+};
+
+int wcd_get_micb_vout_ctl_val(struct device *dev, u32 micb_mv);
+int wcd_dt_parse_micbias_info(struct wcd_common *common);
+
+#endif /* __WCD_COMMON_H___  */
diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index 1bb7e1dc7e6b..d10b457e6c9a 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -21,6 +21,7 @@
 #include <sound/soc-dapm.h>
 #include <sound/tlv.h>
 #include "wcd-clsh-v2.h"
+#include "wcd-common.h"
 #include "wcd-mbhc-v2.h"
 
 #include <dt-bindings/sound/qcom,wcd934x.h>
@@ -116,9 +117,6 @@
 #define WCD934X_DEC_PWR_LVL_DF		0x00
 #define WCD934X_DEC_PWR_LVL_HYBRID WCD934X_DEC_PWR_LVL_DF
 
-#define WCD934X_DEF_MICBIAS_MV	1800
-#define WCD934X_MAX_MICBIAS_MV	2850
-
 #define WCD_IIR_FILTER_SIZE	(sizeof(u32) * BAND_MAX)
 
 #define WCD_IIR_FILTER_CTL(xname, iidx, bidx) \
@@ -530,6 +528,7 @@ struct wcd934x_codec {
 	struct slim_device *sdev;
 	struct slim_device *sidev;
 	struct wcd_clsh_ctrl *clsh_ctrl;
+	struct wcd_common common;
 	struct snd_soc_component *component;
 	struct wcd934x_slim_ch rx_chs[WCD934X_RX_MAX];
 	struct wcd934x_slim_ch tx_chs[WCD934X_TX_MAX];
@@ -555,7 +554,6 @@ struct wcd934x_codec {
 	struct mutex micb_lock;
 	u32 micb_ref[WCD934X_MAX_MICBIAS];
 	u32 pullup_ref[WCD934X_MAX_MICBIAS];
-	u32 micb2_mv;
 };
 
 #define to_wcd934x_codec(_hw) container_of(_hw, struct wcd934x_codec, hw)
@@ -2168,55 +2166,24 @@ static struct clk *wcd934x_register_mclk_output(struct wcd934x_codec *wcd)
 	return NULL;
 }
 
-static int wcd934x_get_micbias_val(struct device *dev, const char *micbias,
-				   u32 *micb_mv)
-{
-	int mv;
-
-	if (of_property_read_u32(dev->parent->of_node, micbias, &mv)) {
-		dev_err(dev, "%s value not found, using default\n", micbias);
-		mv = WCD934X_DEF_MICBIAS_MV;
-	} else {
-		/* convert it to milli volts */
-		mv = mv/1000;
-	}
-
-	if (mv < 1000 || mv > 2850) {
-		dev_err(dev, "%s value not in valid range, using default\n",
-			micbias);
-		mv = WCD934X_DEF_MICBIAS_MV;
-	}
-
-	if (micb_mv)
-		*micb_mv = mv;
-
-	return (mv - 1000) / 50;
-}
-
 static int wcd934x_init_dmic(struct snd_soc_component *comp)
 {
-	int vout_ctl_1, vout_ctl_2, vout_ctl_3, vout_ctl_4;
 	struct wcd934x_codec *wcd = dev_get_drvdata(comp->dev);
 	u32 def_dmic_rate, dmic_clk_drv;
+	int ret;
 
-	vout_ctl_1 = wcd934x_get_micbias_val(comp->dev,
-					     "qcom,micbias1-microvolt", NULL);
-	vout_ctl_2 = wcd934x_get_micbias_val(comp->dev,
-					     "qcom,micbias2-microvolt",
-					     &wcd->micb2_mv);
-	vout_ctl_3 = wcd934x_get_micbias_val(comp->dev,
-					     "qcom,micbias3-microvolt", NULL);
-	vout_ctl_4 = wcd934x_get_micbias_val(comp->dev,
-					     "qcom,micbias4-microvolt", NULL);
+	ret = wcd_dt_parse_mbhc_data(comp->dev, &wcd->mbhc_cfg);
+	if (ret)
+		return ret;
 
 	snd_soc_component_update_bits(comp, WCD934X_ANA_MICB1,
-				      WCD934X_MICB_VAL_MASK, vout_ctl_1);
+				      WCD934X_MICB_VAL_MASK, wcd->common.micb_vout[0]);
 	snd_soc_component_update_bits(comp, WCD934X_ANA_MICB2,
-				      WCD934X_MICB_VAL_MASK, vout_ctl_2);
+				      WCD934X_MICB_VAL_MASK, wcd->common.micb_vout[1]);
 	snd_soc_component_update_bits(comp, WCD934X_ANA_MICB3,
-				      WCD934X_MICB_VAL_MASK, vout_ctl_3);
+				      WCD934X_MICB_VAL_MASK, wcd->common.micb_vout[2]);
 	snd_soc_component_update_bits(comp, WCD934X_ANA_MICB4,
-				      WCD934X_MICB_VAL_MASK, vout_ctl_4);
+				      WCD934X_MICB_VAL_MASK, wcd->common.micb_vout[3]);
 
 	if (wcd->rate == WCD934X_MCLK_CLK_9P6MHZ)
 		def_dmic_rate = WCD9XXX_DMIC_SAMPLE_RATE_4P8MHZ;
@@ -2517,15 +2484,6 @@ static void wcd934x_mbhc_micb_ramp_control(struct snd_soc_component *component,
 	}
 }
 
-static int wcd934x_get_micb_vout_ctl_val(u32 micb_mv)
-{
-	/* min micbias voltage is 1V and maximum is 2.85V */
-	if (micb_mv < 1000 || micb_mv > 2850)
-		return -EINVAL;
-
-	return (micb_mv - 1000) / 50;
-}
-
 static int wcd934x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 					    int req_volt, int micb_num)
 {
@@ -2562,7 +2520,7 @@ static int wcd934x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 	cur_vout_ctl = snd_soc_component_read_field(component, micb_reg,
 						    WCD934X_MICB_VAL_MASK);
 
-	req_vout_ctl = wcd934x_get_micb_vout_ctl_val(req_volt);
+	req_vout_ctl = wcd_get_micb_vout_ctl_val(component->dev, req_volt);
 	if (req_vout_ctl < 0) {
 		ret = -EINVAL;
 		goto exit;
@@ -2610,10 +2568,10 @@ static int wcd934x_mbhc_micb_ctrl_threshold_mic(struct snd_soc_component *compon
 	 * voltage needed to detect threshold microphone, then do
 	 * not change the micbias, just return.
 	 */
-	if (wcd934x->micb2_mv >= WCD_MBHC_THR_HS_MICB_MV)
+	if (wcd934x->common.micb_mv[1] >= WCD_MBHC_THR_HS_MICB_MV)
 		return 0;
 
-	micb_mv = req_en ? WCD_MBHC_THR_HS_MICB_MV : wcd934x->micb2_mv;
+	micb_mv = req_en ? WCD_MBHC_THR_HS_MICB_MV : wcd934x->common.micb_mv[1];
 
 	rc = wcd934x_mbhc_micb_adjust_voltage(component, micb_mv, MIC_BIAS_2);
 
@@ -3036,7 +2994,7 @@ static void wcd934x_mbhc_deinit(struct snd_soc_component *component)
 static int wcd934x_comp_probe(struct snd_soc_component *component)
 {
 	struct wcd934x_codec *wcd = dev_get_drvdata(component->dev);
-	int i;
+	int i, ret;
 
 	snd_soc_component_init_regmap(component, wcd->regmap);
 	wcd->component = component;
@@ -3054,7 +3012,12 @@ static int wcd934x_comp_probe(struct snd_soc_component *component)
 	for (i = 0; i < NUM_CODEC_DAIS; i++)
 		INIT_LIST_HEAD(&wcd->dai[i].slim_ch_list);
 
-	wcd934x_init_dmic(component);
+
+	ret = wcd934x_init_dmic(component);
+	if (ret) {
+		dev_err(component->dev, "Failed to Initialize micbias\n");
+		return ret;
+	}
 
 	if (wcd934x_mbhc_init(component))
 		dev_err(component->dev, "Failed to Initialize MBHC\n");
@@ -5860,14 +5823,13 @@ static int wcd934x_codec_parse_data(struct wcd934x_codec *wcd)
 	cfg->anc_micbias = MIC_BIAS_2;
 	cfg->v_hs_max = WCD_MBHC_HS_V_MAX;
 	cfg->num_btn = WCD934X_MBHC_MAX_BUTTONS;
-	cfg->micb_mv = wcd->micb2_mv;
+	cfg->micb_mv = wcd->common.micb_mv[1];
 	cfg->linein_th = 5000;
 	cfg->hs_thr = 1700;
 	cfg->hph_thr = 50;
 
 	wcd_dt_parse_mbhc_data(dev, cfg);
 
-
 	return 0;
 }
 
@@ -5888,6 +5850,8 @@ static int wcd934x_codec_probe(struct platform_device *pdev)
 	wcd->sdev = to_slim_device(data->dev);
 	mutex_init(&wcd->sysclk_mutex);
 	mutex_init(&wcd->micb_lock);
+	wcd->common.dev = dev->parent;
+	wcd->common.max_bias = 4;
 
 	ret = wcd934x_codec_parse_data(wcd);
 	if (ret)
diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index b78f37c582ca..5c8faff3976d 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -21,6 +21,7 @@
 #include <sound/tlv.h>
 
 #include "wcd-clsh-v2.h"
+#include "wcd-common.h"
 #include "wcd-mbhc-v2.h"
 #include "wcd937x.h"
 
@@ -85,6 +86,7 @@ struct wcd937x_priv {
 	struct wcd_mbhc_config mbhc_cfg;
 	struct wcd_mbhc_intr intr_ids;
 	struct wcd_clsh_ctrl *clsh_info;
+	struct wcd_common common;
 	struct irq_domain *virq;
 	struct regmap_irq_chip_data *irq_chip;
 	struct snd_soc_jack *jack;
@@ -93,9 +95,6 @@ struct wcd937x_priv {
 	s32 pullup_ref[WCD937X_MAX_MICBIAS];
 	u32 hph_mode;
 	int ear_rx_path;
-	u32 micb1_mv;
-	u32 micb2_mv;
-	u32 micb3_mv;
 	int hphr_pdm_wd_int;
 	int hphl_pdm_wd_int;
 	int aux_pdm_wd_int;
@@ -872,15 +871,6 @@ static int wcd937x_enable_rx3(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
-static int wcd937x_get_micb_vout_ctl_val(u32 micb_mv)
-{
-	if (micb_mv < 1000 || micb_mv > 2850) {
-		pr_err("Unsupported micbias voltage (%u mV)\n", micb_mv);
-		return -EINVAL;
-	}
-
-	return (micb_mv - 1000) / 50;
-}
 
 static int wcd937x_tx_swr_ctrl(struct snd_soc_dapm_widget *w,
 			       struct snd_kcontrol *kcontrol, int event)
@@ -1481,7 +1471,7 @@ static int wcd937x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 	cur_vout_ctl = snd_soc_component_read_field(component, micb_reg,
 						    WCD937X_MICB_VOUT_MASK);
 
-	req_vout_ctl = wcd937x_get_micb_vout_ctl_val(req_volt);
+	req_vout_ctl = wcd_get_micb_vout_ctl_val(component->dev, req_volt);
 	if (req_vout_ctl < 0) {
 		ret = -EINVAL;
 		goto exit;
@@ -2436,22 +2426,14 @@ static const struct snd_soc_dapm_route wcd9375_audio_map[] = {
 	{ "DMIC6_MIXER", "Switch", "DMIC6" },
 };
 
-static int wcd937x_set_micbias_data(struct wcd937x_priv *wcd937x)
+static void wcd937x_set_micbias_data(struct device *dev, struct wcd937x_priv *wcd937x)
 {
-	int vout_ctl[3];
-
-	/* Set micbias voltage */
-	vout_ctl[0] = wcd937x_get_micb_vout_ctl_val(wcd937x->micb1_mv);
-	vout_ctl[1] = wcd937x_get_micb_vout_ctl_val(wcd937x->micb2_mv);
-	vout_ctl[2] = wcd937x_get_micb_vout_ctl_val(wcd937x->micb3_mv);
-	if ((vout_ctl[0] | vout_ctl[1] | vout_ctl[2]) < 0)
-		return -EINVAL;
-
-	regmap_update_bits(wcd937x->regmap, WCD937X_ANA_MICB1, WCD937X_ANA_MICB_VOUT, vout_ctl[0]);
-	regmap_update_bits(wcd937x->regmap, WCD937X_ANA_MICB2, WCD937X_ANA_MICB_VOUT, vout_ctl[1]);
-	regmap_update_bits(wcd937x->regmap, WCD937X_ANA_MICB3, WCD937X_ANA_MICB_VOUT, vout_ctl[2]);
-
-	return 0;
+	regmap_update_bits(wcd937x->regmap, WCD937X_ANA_MICB1, WCD937X_ANA_MICB_VOUT,
+			wcd937x->commmon.micb_vout[0]);
+	regmap_update_bits(wcd937x->regmap, WCD937X_ANA_MICB2, WCD937X_ANA_MICB_VOUT,
+			wcd937x->commmon.micb_vout[1]);
+	regmap_update_bits(wcd937x->regmap, WCD937X_ANA_MICB3, WCD937X_ANA_MICB_VOUT,
+			wcd937x->commmon.micb_vout[2]);
 }
 
 static irqreturn_t wcd937x_wd_handle_irq(int irq, void *data)
@@ -2630,31 +2612,6 @@ static const struct snd_soc_component_driver soc_codec_dev_wcd937x = {
 	.endianness = 1,
 };
 
-static void wcd937x_dt_parse_micbias_info(struct device *dev, struct wcd937x_priv *wcd)
-{
-	struct device_node *np = dev->of_node;
-	u32 prop_val = 0;
-	int ret = 0;
-
-	ret = of_property_read_u32(np, "qcom,micbias1-microvolt", &prop_val);
-	if (!ret)
-		wcd->micb1_mv = prop_val / 1000;
-	else
-		dev_warn(dev, "Micbias1 DT property not found\n");
-
-	ret = of_property_read_u32(np, "qcom,micbias2-microvolt", &prop_val);
-	if (!ret)
-		wcd->micb2_mv = prop_val / 1000;
-	else
-		dev_warn(dev, "Micbias2 DT property not found\n");
-
-	ret = of_property_read_u32(np, "qcom,micbias3-microvolt", &prop_val);
-	if (!ret)
-		wcd->micb3_mv = prop_val / 1000;
-	else
-		dev_warn(dev, "Micbias3 DT property not found\n");
-}
-
 static bool wcd937x_swap_gnd_mic(struct snd_soc_component *component)
 {
 	int value;
@@ -2848,11 +2805,7 @@ static int wcd937x_bind(struct device *dev)
 	wcd937x->sdw_priv[AIF1_PB]->slave_irq = wcd937x->virq;
 	wcd937x->sdw_priv[AIF1_CAP]->slave_irq = wcd937x->virq;
 
-	ret = wcd937x_set_micbias_data(wcd937x);
-	if (ret < 0) {
-		dev_err(dev, "Bad micbias pdata\n");
-		return ret;
-	}
+	wcd937x_set_micbias_data(dev, wcd937x);
 
 	ret = snd_soc_register_component(dev, &soc_codec_dev_wcd937x,
 					 wcd937x_dais, ARRAY_SIZE(wcd937x_dais));
@@ -2920,6 +2873,8 @@ static int wcd937x_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(dev, wcd937x);
 	mutex_init(&wcd937x->micb_lock);
+	wcd937x->common.dev = dev;
+	wcd937x->common.max_bias = 3;
 
 	wcd937x->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(wcd937x->reset_gpio))
@@ -2939,7 +2894,9 @@ static int wcd937x_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get and enable supplies\n");
 
-	wcd937x_dt_parse_micbias_info(dev, wcd937x);
+	ret = wcd_dt_parse_micbias_info(dev, &wcd937x->common);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get micbias\n");
 
 	cfg->mbhc_micbias = MIC_BIAS_2;
 	cfg->anc_micbias = MIC_BIAS_2;
diff --git a/sound/soc/codecs/wcd937x.h b/sound/soc/codecs/wcd937x.h
index 49e5dce6f8c9..0f96b7108a7e 100644
--- a/sound/soc/codecs/wcd937x.h
+++ b/sound/soc/codecs/wcd937x.h
@@ -550,21 +550,21 @@ int wcd937x_sdw_hw_params(struct wcd937x_sdw_priv *wcd,
 			  struct snd_soc_dai *dai);
 
 #else
-int wcd937x_sdw_free(struct wcd937x_sdw_priv *wcd,
+static inline int wcd937x_sdw_free(struct wcd937x_sdw_priv *wcd,
 		     struct snd_pcm_substream *substream,
 		     struct snd_soc_dai *dai)
 {
 	return -EOPNOTSUPP;
 }
 
-int wcd937x_sdw_set_sdw_stream(struct wcd937x_sdw_priv *wcd,
+static inline int wcd937x_sdw_set_sdw_stream(struct wcd937x_sdw_priv *wcd,
 			       struct snd_soc_dai *dai,
 			       void *stream, int direction)
 {
 	return -EOPNOTSUPP;
 }
 
-int wcd937x_sdw_hw_params(struct wcd937x_sdw_priv *wcd,
+static inline int wcd937x_sdw_hw_params(struct wcd937x_sdw_priv *wcd,
 			  struct snd_pcm_substream *substream,
 			  struct snd_pcm_hw_params *params,
 			  struct snd_soc_dai *dai)
diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index f8d7bf27a6ed..c8b6e543986d 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -22,6 +22,7 @@
 #include <linux/regulator/consumer.h>
 
 #include "wcd-clsh-v2.h"
+#include "wcd-common.h"
 #include "wcd-mbhc-v2.h"
 #include "wcd938x.h"
 
@@ -155,6 +156,7 @@ struct wcd938x_priv {
 	struct wcd_mbhc_config mbhc_cfg;
 	struct wcd_mbhc_intr intr_ids;
 	struct wcd_clsh_ctrl *clsh_info;
+	struct wcd_common common;
 	struct irq_domain *virq;
 	struct regmap_irq_chip_data *irq_chip;
 	struct snd_soc_jack *jack;
@@ -169,10 +171,6 @@ struct wcd938x_priv {
 	struct gpio_desc *us_euro_gpio;
 	struct mux_control *us_euro_mux;
 	unsigned int mux_state;
-	u32 micb1_mv;
-	u32 micb2_mv;
-	u32 micb3_mv;
-	u32 micb4_mv;
 	int hphr_pdm_wd_int;
 	int hphl_pdm_wd_int;
 	int aux_pdm_wd_int;
@@ -1974,15 +1972,6 @@ static void wcd938x_mbhc_micb_ramp_control(struct snd_soc_component *component,
 	}
 }
 
-static int wcd938x_get_micb_vout_ctl_val(u32 micb_mv)
-{
-	/* min micbias voltage is 1V and maximum is 2.85V */
-	if (micb_mv < 1000 || micb_mv > 2850)
-		return -EINVAL;
-
-	return (micb_mv - 1000) / 50;
-}
-
 static int wcd938x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 					    int req_volt, int micb_num)
 {
@@ -2019,7 +2008,7 @@ static int wcd938x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 	cur_vout_ctl = snd_soc_component_read_field(component, micb_reg,
 						    WCD938X_MICB_VOUT_MASK);
 
-	req_vout_ctl = wcd938x_get_micb_vout_ctl_val(req_volt);
+	req_vout_ctl = wcd_get_micb_vout_ctl_val(component->dev, req_volt);
 	if (req_vout_ctl < 0) {
 		ret = -EINVAL;
 		goto exit;
@@ -2067,10 +2056,10 @@ static int wcd938x_mbhc_micb_ctrl_threshold_mic(struct snd_soc_component *compon
 	 * voltage needed to detect threshold microphone, then do
 	 * not change the micbias, just return.
 	 */
-	if (wcd938x->micb2_mv >= WCD_MBHC_THR_HS_MICB_MV)
+	if (wcd938x->common.micb_mv[2] >= WCD_MBHC_THR_HS_MICB_MV)
 		return 0;
 
-	micb_mv = req_en ? WCD_MBHC_THR_HS_MICB_MV : wcd938x->micb2_mv;
+	micb_mv = req_en ? WCD_MBHC_THR_HS_MICB_MV : wcd938x->common.micb_mv[2];
 
 	return wcd938x_mbhc_micb_adjust_voltage(component, micb_mv, MIC_BIAS_2);
 }
@@ -2975,28 +2964,16 @@ static const struct snd_soc_dapm_route wcd938x_audio_map[] = {
 	{"EAR", NULL, "EAR PGA"},
 };
 
-static int wcd938x_set_micbias_data(struct wcd938x_priv *wcd938x)
+static void wcd938x_set_micbias_data(struct device *dev, struct wcd938x_priv *wcd938x)
 {
-	int vout_ctl_1, vout_ctl_2, vout_ctl_3, vout_ctl_4;
-
-	/* set micbias voltage */
-	vout_ctl_1 = wcd938x_get_micb_vout_ctl_val(wcd938x->micb1_mv);
-	vout_ctl_2 = wcd938x_get_micb_vout_ctl_val(wcd938x->micb2_mv);
-	vout_ctl_3 = wcd938x_get_micb_vout_ctl_val(wcd938x->micb3_mv);
-	vout_ctl_4 = wcd938x_get_micb_vout_ctl_val(wcd938x->micb4_mv);
-	if (vout_ctl_1 < 0 || vout_ctl_2 < 0 || vout_ctl_3 < 0 || vout_ctl_4 < 0)
-		return -EINVAL;
-
 	regmap_update_bits(wcd938x->regmap, WCD938X_ANA_MICB1,
-			   WCD938X_MICB_VOUT_MASK, vout_ctl_1);
+			   WCD938X_MICB_VOUT_MASK, wcd938x->common.micb_vout[0]);
 	regmap_update_bits(wcd938x->regmap, WCD938X_ANA_MICB2,
-			   WCD938X_MICB_VOUT_MASK, vout_ctl_2);
+			   WCD938X_MICB_VOUT_MASK, wcd938x->common.micb_vout[1]);
 	regmap_update_bits(wcd938x->regmap, WCD938X_ANA_MICB3,
-			   WCD938X_MICB_VOUT_MASK, vout_ctl_3);
+			   WCD938X_MICB_VOUT_MASK, wcd938x->common.micb_vout[2]);
 	regmap_update_bits(wcd938x->regmap, WCD938X_ANA_MICB4,
-			   WCD938X_MICB_VOUT_MASK, vout_ctl_4);
-
-	return 0;
+			   WCD938X_MICB_VOUT_MASK, wcd938x->common.micb_vout[3]);
 }
 
 static irqreturn_t wcd938x_wd_handle_irq(int irq, void *data)
@@ -3200,37 +3177,6 @@ static const struct snd_soc_component_driver soc_codec_dev_wcd938x = {
 	.endianness = 1,
 };
 
-static void wcd938x_dt_parse_micbias_info(struct device *dev, struct wcd938x_priv *wcd)
-{
-	struct device_node *np = dev->of_node;
-	u32 prop_val = 0;
-	int rc = 0;
-
-	rc = of_property_read_u32(np, "qcom,micbias1-microvolt",  &prop_val);
-	if (!rc)
-		wcd->micb1_mv = prop_val/1000;
-	else
-		dev_info(dev, "%s: Micbias1 DT property not found\n", __func__);
-
-	rc = of_property_read_u32(np, "qcom,micbias2-microvolt",  &prop_val);
-	if (!rc)
-		wcd->micb2_mv = prop_val/1000;
-	else
-		dev_info(dev, "%s: Micbias2 DT property not found\n", __func__);
-
-	rc = of_property_read_u32(np, "qcom,micbias3-microvolt", &prop_val);
-	if (!rc)
-		wcd->micb3_mv = prop_val/1000;
-	else
-		dev_info(dev, "%s: Micbias3 DT property not found\n", __func__);
-
-	rc = of_property_read_u32(np, "qcom,micbias4-microvolt",  &prop_val);
-	if (!rc)
-		wcd->micb4_mv = prop_val/1000;
-	else
-		dev_info(dev, "%s: Micbias4 DT property not found\n", __func__);
-}
-
 static bool wcd938x_swap_gnd_mic(struct snd_soc_component *component)
 {
 	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
@@ -3295,13 +3241,15 @@ static int wcd938x_populate_dt_data(struct wcd938x_priv *wcd938x, struct device
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get and enable supplies\n");
 
-	wcd938x_dt_parse_micbias_info(dev, wcd938x);
+	ret = wcd_dt_parse_micbias_info(&wcd938x->common);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get and enable supplies\n");
 
 	cfg->mbhc_micbias = MIC_BIAS_2;
 	cfg->anc_micbias = MIC_BIAS_2;
 	cfg->v_hs_max = WCD_MBHC_HS_V_MAX;
 	cfg->num_btn = WCD938X_MBHC_MAX_BUTTONS;
-	cfg->micb_mv = wcd938x->micb2_mv;
+	cfg->micb_mv = wcd938x->common.micb_mv[2];
 	cfg->linein_th = 5000;
 	cfg->hs_thr = 1700;
 	cfg->hph_thr = 50;
@@ -3457,11 +3405,7 @@ static int wcd938x_bind(struct device *dev)
 	wcd938x->sdw_priv[AIF1_PB]->slave_irq = wcd938x->virq;
 	wcd938x->sdw_priv[AIF1_CAP]->slave_irq = wcd938x->virq;
 
-	ret = wcd938x_set_micbias_data(wcd938x);
-	if (ret < 0) {
-		dev_err(dev, "%s: bad micbias pdata\n", __func__);
-		goto err_remove_rx_link;
-	}
+	wcd938x_set_micbias_data(dev, wcd938x);
 
 	ret = snd_soc_register_component(dev, &soc_codec_dev_wcd938x,
 					 wcd938x_dais, ARRAY_SIZE(wcd938x_dais));
@@ -3550,6 +3494,8 @@ static int wcd938x_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(dev, wcd938x);
 	mutex_init(&wcd938x->micb_lock);
+	wcd938x->common.dev = dev;
+	wcd938x->common.max_bias = 4;
 
 	ret = wcd938x_populate_dt_data(wcd938x, dev);
 	if (ret)
diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
index 85730ae40c2c..59c920c50c00 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -28,6 +28,7 @@
 #include <linux/usb/typec_altmode.h>
 
 #include "wcd-clsh-v2.h"
+#include "wcd-common.h"
 #include "wcd-mbhc-v2.h"
 #include "wcd939x.h"
 
@@ -191,6 +192,7 @@ struct wcd939x_priv {
 	struct wcd_mbhc_config mbhc_cfg;
 	struct wcd_mbhc_intr intr_ids;
 	struct wcd_clsh_ctrl *clsh_info;
+	struct wcd_common common;
 	struct irq_domain *virq;
 	struct regmap_irq_chip_data *irq_chip;
 	struct snd_soc_jack *jack;
@@ -201,10 +203,6 @@ struct wcd939x_priv {
 	u32 tx_mode[TX_ADC_MAX];
 	int variant;
 	struct gpio_desc *reset_gpio;
-	u32 micb1_mv;
-	u32 micb2_mv;
-	u32 micb3_mv;
-	u32 micb4_mv;
 	int hphr_pdm_wd_int;
 	int hphl_pdm_wd_int;
 	int ear_pdm_wd_int;
@@ -1919,17 +1917,6 @@ static void wcd939x_mbhc_micb_ramp_control(struct snd_soc_component *component,
 	}
 }
 
-static int wcd939x_get_micb_vout_ctl_val(u32 micb_mv)
-{
-	/* min micbias voltage is 1V and maximum is 2.85V */
-	if (micb_mv < 1000 || micb_mv > 2850) {
-		pr_err("%s: unsupported micbias voltage\n", __func__);
-		return -EINVAL;
-	}
-
-	return (micb_mv - 1000) / 50;
-}
-
 static int wcd939x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 					    int req_volt, int micb_num)
 {
@@ -1969,7 +1956,7 @@ static int wcd939x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 	cur_vout_ctl = snd_soc_component_read_field(component, micb_reg,
 						    WCD939X_MICB_VOUT_CTL);
 
-	req_vout_ctl = wcd939x_get_micb_vout_ctl_val(req_volt);
+	req_vout_ctl = wcd_get_micb_vout_ctl_val(component->dev, req_volt);
 	if (req_vout_ctl < 0) {
 		ret = req_vout_ctl;
 		goto exit;
@@ -2021,10 +2008,10 @@ static int wcd939x_mbhc_micb_ctrl_threshold_mic(struct snd_soc_component *compon
 	 * voltage needed to detect threshold microphone, then do
 	 * not change the micbias, just return.
 	 */
-	if (wcd939x->micb2_mv >= WCD_MBHC_THR_HS_MICB_MV)
+	if (wcd939x->common.micb_mv[1] >= WCD_MBHC_THR_HS_MICB_MV)
 		return 0;
 
-	micb_mv = req_en ? WCD_MBHC_THR_HS_MICB_MV : wcd939x->micb2_mv;
+	micb_mv = req_en ? WCD_MBHC_THR_HS_MICB_MV : wcd939x->common.micb_mv[1];
 
 	return wcd939x_mbhc_micb_adjust_voltage(component, micb_mv, MIC_BIAS_2);
 }
@@ -2895,28 +2882,16 @@ static const struct snd_soc_dapm_route wcd939x_audio_map[] = {
 	{"EAR", NULL, "EAR PGA"},
 };
 
-static int wcd939x_set_micbias_data(struct wcd939x_priv *wcd939x)
+static void wcd939x_set_micbias_data(struct device *dev, struct wcd939x_priv *wcd939x)
 {
-	int vout_ctl_1, vout_ctl_2, vout_ctl_3, vout_ctl_4;
-
-	/* set micbias voltage */
-	vout_ctl_1 = wcd939x_get_micb_vout_ctl_val(wcd939x->micb1_mv);
-	vout_ctl_2 = wcd939x_get_micb_vout_ctl_val(wcd939x->micb2_mv);
-	vout_ctl_3 = wcd939x_get_micb_vout_ctl_val(wcd939x->micb3_mv);
-	vout_ctl_4 = wcd939x_get_micb_vout_ctl_val(wcd939x->micb4_mv);
-	if (vout_ctl_1 < 0 || vout_ctl_2 < 0 || vout_ctl_3 < 0 || vout_ctl_4 < 0)
-		return -EINVAL;
-
 	regmap_update_bits(wcd939x->regmap, WCD939X_ANA_MICB1,
-			   WCD939X_MICB_VOUT_CTL, vout_ctl_1);
+			   WCD939X_MICB_VOUT_CTL, wcd939x->common.micb_vout[0]);
 	regmap_update_bits(wcd939x->regmap, WCD939X_ANA_MICB2,
-			   WCD939X_MICB_VOUT_CTL, vout_ctl_2);
+			   WCD939X_MICB_VOUT_CTL, wcd939x->common.micb_vout[1]);
 	regmap_update_bits(wcd939x->regmap, WCD939X_ANA_MICB3,
-			   WCD939X_MICB_VOUT_CTL, vout_ctl_3);
+			   WCD939X_MICB_VOUT_CTL, wcd939x->common.micb_vout[2]);
 	regmap_update_bits(wcd939x->regmap, WCD939X_ANA_MICB4,
-			   WCD939X_MICB_VOUT_CTL, vout_ctl_4);
-
-	return 0;
+			   WCD939X_MICB_VOUT_CTL, wcd939x->common.micb_vout[3]);
 }
 
 static irqreturn_t wcd939x_wd_handle_irq(int irq, void *data)
@@ -3186,37 +3161,6 @@ static int wcd939x_typec_mux_set(struct typec_mux_dev *mux,
 }
 #endif /* CONFIG_TYPEC */
 
-static void wcd939x_dt_parse_micbias_info(struct device *dev, struct wcd939x_priv *wcd)
-{
-	struct device_node *np = dev->of_node;
-	u32 prop_val = 0;
-	int rc = 0;
-
-	rc = of_property_read_u32(np, "qcom,micbias1-microvolt",  &prop_val);
-	if (!rc)
-		wcd->micb1_mv = prop_val / 1000;
-	else
-		dev_info(dev, "%s: Micbias1 DT property not found\n", __func__);
-
-	rc = of_property_read_u32(np, "qcom,micbias2-microvolt",  &prop_val);
-	if (!rc)
-		wcd->micb2_mv = prop_val / 1000;
-	else
-		dev_info(dev, "%s: Micbias2 DT property not found\n", __func__);
-
-	rc = of_property_read_u32(np, "qcom,micbias3-microvolt", &prop_val);
-	if (!rc)
-		wcd->micb3_mv = prop_val / 1000;
-	else
-		dev_info(dev, "%s: Micbias3 DT property not found\n", __func__);
-
-	rc = of_property_read_u32(np, "qcom,micbias4-microvolt",  &prop_val);
-	if (!rc)
-		wcd->micb4_mv = prop_val / 1000;
-	else
-		dev_info(dev, "%s: Micbias4 DT property not found\n", __func__);
-}
-
 #if IS_ENABLED(CONFIG_TYPEC)
 static bool wcd939x_swap_gnd_mic(struct snd_soc_component *component)
 {
@@ -3252,13 +3196,15 @@ static int wcd939x_populate_dt_data(struct wcd939x_priv *wcd939x, struct device
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get and enable supplies\n");
 
-	wcd939x_dt_parse_micbias_info(dev, wcd939x);
+	ret = wcd_dt_parse_micbias_info(&wcd939x->common);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get micbias\n");
 
 	cfg->mbhc_micbias = MIC_BIAS_2;
 	cfg->anc_micbias = MIC_BIAS_2;
 	cfg->v_hs_max = WCD_MBHC_HS_V_MAX;
 	cfg->num_btn = WCD939X_MBHC_MAX_BUTTONS;
-	cfg->micb_mv = wcd939x->micb2_mv;
+	cfg->micb_mv = wcd939x->common.micb_mv[1];
 	cfg->linein_th = 5000;
 	cfg->hs_thr = 1700;
 	cfg->hph_thr = 50;
@@ -3444,11 +3390,7 @@ static int wcd939x_bind(struct device *dev)
 	wcd939x->sdw_priv[AIF1_PB]->slave_irq = wcd939x->virq;
 	wcd939x->sdw_priv[AIF1_CAP]->slave_irq = wcd939x->virq;
 
-	ret = wcd939x_set_micbias_data(wcd939x);
-	if (ret < 0) {
-		dev_err(dev, "%s: bad micbias pdata\n", __func__);
-		goto err_remove_rx_link;
-	}
+	wcd939x_set_micbias_data(dev, wcd939x);
 
 	/* Check WCD9395 version */
 	regmap_read(wcd939x->regmap, WCD939X_DIGITAL_CHIP_ID1, &id1);
@@ -3613,6 +3555,8 @@ static int wcd939x_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(dev, wcd939x);
 	mutex_init(&wcd939x->micb_lock);
+	wcd939x->common.dev = dev;
+	wcd939x->common.max_bias = 4;
 
 	ret = wcd939x_populate_dt_data(wcd939x, dev);
 	if (ret) {
-- 
2.50.0


