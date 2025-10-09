Return-Path: <linux-arm-msm+bounces-76690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F3EBC9902
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 16:40:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F25EA3A987B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 14:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A05E2EC082;
	Thu,  9 Oct 2025 14:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hr2Dd4Z0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7751C2EAB8D;
	Thu,  9 Oct 2025 14:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760020778; cv=none; b=aGK7ydBO1bNhVJR1wyrNQl6x24Bp16+si2Q1OELAr6d7VoHBHu32U6fcFkvUkWflP/vSpZWS3iAOky+DmGxjvf74mmlpK5wHInt3PifY+9SqNd9UNeoVEPIyHheHXcydUgHHkCvazQcVSR+mf76Q0ZV+VpHhnX0olk9H3X7Sqtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760020778; c=relaxed/simple;
	bh=3VbYtYxmH5z7VfLwHDIVPNyEeztkexh7yImalDyKyvo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AQuUpXNpjcoOEB29jC0/ww454JaoesQk9Q7Or9rDMyDMGpYc747knhj9+T9yvBV77paTTeCRzBObjummWeCZ8hmd4mQSr+R1A2hUSyWbCaoLkB/nQtXIu1G6eAUT4US4dwBYLq7UpBruxqzWTTBt4kC3YmU56ZXkQQJRkmbSo6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hr2Dd4Z0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599ENftD028481;
	Thu, 9 Oct 2025 14:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pA8V8aIxHSX
	Ph/ZtIdo/9t2d5lWU2nC6TUnuoq8uowc=; b=Hr2Dd4Z0RtFfxGCwopsr91qBKUx
	XsFxzuiySPhoDraAijfTr7R2rk2J6F92XhBCoEZEurtlD/b6cYFdYznkYbeITzuJ
	HpWWEiPC6QVtljl5emXy0YGk+O6vID4NoR8TKxbWVSj7ZqKQNKsfrqW+SzxWj6sb
	ZbbX3KTo4AEVVPk4PYmYU/ZID4HrFpPl4V65FsOGFWpUY08VwwX73Z45AexaoU4M
	c8sAhnmyIzQSYmMZC0zSHUNBkpq1WynC0V0QkggEulBR8NomZsHQ8CT7Gc3Wn0BX
	/GVZGIwW4DzJAgb66rdJBE4YurddJ+W/ZZ9W6bnHZZtidO3xwSnUFTTqZuA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4ku6vs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 14:39:25 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 599EdKFN012509;
	Thu, 9 Oct 2025 14:39:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 49jvnmddpd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 14:39:20 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 599EdKUl012481;
	Thu, 9 Oct 2025 14:39:20 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 599EdKJH012472
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 14:39:20 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 318D741F; Thu,  9 Oct 2025 20:09:19 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prasad.kumpatla@oss.qualcomm.com, kernel@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        jingyi.wang@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Subject: [PATCH v2 1/5] ASoC: codecs: va-macro: Rework version checking
Date: Thu,  9 Oct 2025 20:06:40 +0530
Message-Id: <20251009143644.3296208-2-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251009143644.3296208-1-prasad.kumpatla@oss.qualcomm.com>
References: <20251009143644.3296208-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX6VgD3UdCYtcb
 mN+/XBC9nt4ytHT0+oTtJV5XomAP1PSSEdrmZeNhfuDuADNrF6NHGfrwkb1eu09L3gXaKe3C7Sn
 zE3oZONGXRsLMQZTUA4pZ3f9BeXuWMrawkyNquWnfa3QESzM7PdTVsBGqPaA3LbWUTf0wVpQaVY
 JfU0IaayxmJWz/6b8CAQHPD8t7S6Iibzxq1EOduwtGbHDCTUsUtGq1iOIWC7bNutaJGwYxsSmzq
 d64wSqfmWhGQT0FeaIVd0sCfI1qrXz23T3Gua5EOzzuSw0Bg47zQIPK8sarPFpAh2bzRj4qMrDr
 l3wwnERMpoZow2P29Jz5jS2hzOw1QVCS4eh50JZ83B6zzH7uNrQxRF16LkuQo1YMrqHAslvgzcv
 7PeLapvfQtnt7QxucRyz+Uq1eT1E4A==
X-Proofpoint-GUID: No_OhsX8jcMTldP946W4K6i7fk3t-qyc
X-Proofpoint-ORIG-GUID: No_OhsX8jcMTldP946W4K6i7fk3t-qyc
X-Authority-Analysis: v=2.4 cv=SJxPlevH c=1 sm=1 tr=0 ts=68e7c91d cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=u-qv99s1o6jZDIvgRHYA:9
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Open-code some of the registers to make the checks anywhere near human-
readable. Error out if the version is unsupported or if the VA macro
isn't supposed to be present within this LPASS instance (since we can
check for that now).

Note that previously v2.0 and v2.1 assignments were swapped, but v2.1
does not even seem to exist (as opposed to v2.0.1) and there is no
difference in SW handling anyway.

[Prasad Kumpatla: fixed a spelling error and resolved a checkpatch
warning related to return value handling]

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-va-macro.c | 90 +++++++++++++++++++++----------
 1 file changed, 63 insertions(+), 27 deletions(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 2e1b77973a3e..eb4981255f2b 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 // Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/init.h>
@@ -64,8 +65,15 @@
 #define CDC_VA_TOP_CSR_I2S_CLK			(0x00A8)
 #define CDC_VA_TOP_CSR_I2S_RESET		(0x00AC)
 #define CDC_VA_TOP_CSR_CORE_ID_0		(0x00C0)
+ #define CORE_ID_0_REV_MAJ			GENMASK(7, 0)
 #define CDC_VA_TOP_CSR_CORE_ID_1		(0x00C4)
+#define CORE_ID_1_HAS_WSAMACRO			BIT(3)
+#define CORE_ID_1_HAS_RXMACRO			BIT(2)
+#define CORE_ID_1_HAS_TXMACRO			BIT(1)
+#define CORE_ID_1_HAS_VAMACRO			BIT(0)
 #define CDC_VA_TOP_CSR_CORE_ID_2		(0x00C8)
+ #define CORE_ID_2_REV_MIN			GENMASK(7, 4)
+ #define CORE_ID_2_REV_STEP			GENMASK(3, 0)
 #define CDC_VA_TOP_CSR_CORE_ID_3		(0x00CC)
 #define CDC_VA_TOP_CSR_SWR_MIC_CTL0		(0x00D0)
 #define CDC_VA_TOP_CSR_SWR_MIC_CTL1		(0x00D4)
@@ -1462,39 +1470,63 @@ static int va_macro_validate_dmic_sample_rate(u32 dmic_sample_rate,
 	return dmic_sample_rate;
 }
 
-static void va_macro_set_lpass_codec_version(struct va_macro *va)
+static int va_macro_set_lpass_codec_version(struct va_macro *va)
 {
-	int core_id_0 = 0, core_id_1 = 0, core_id_2 = 0;
 	int version = LPASS_CODEC_VERSION_UNKNOWN;
+	u32 maj, min, step;
+	u32 val;
 
-	regmap_read(va->regmap, CDC_VA_TOP_CSR_CORE_ID_0, &core_id_0);
-	regmap_read(va->regmap, CDC_VA_TOP_CSR_CORE_ID_1, &core_id_1);
-	regmap_read(va->regmap, CDC_VA_TOP_CSR_CORE_ID_2, &core_id_2);
+	regmap_read(va->regmap, CDC_VA_TOP_CSR_CORE_ID_0, &val);
+	maj = FIELD_GET(CORE_ID_0_REV_MAJ, val);
 
-	if ((core_id_0 == 0x01) && (core_id_1 == 0x0F))
-		version = LPASS_CODEC_VERSION_2_0;
-	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && core_id_2 == 0x01)
+	regmap_read(va->regmap, CDC_VA_TOP_CSR_CORE_ID_1, &val);
+	if (!FIELD_GET(CORE_ID_1_HAS_VAMACRO, val)) {
+		dev_err(va->dev, "This is not a VA macro instance\n");
+		return -ENODEV;
+	}
+
+	regmap_read(va->regmap, CDC_VA_TOP_CSR_CORE_ID_2, &val);
+	min = FIELD_GET(CORE_ID_2_REV_MIN, val);
+	step = FIELD_GET(CORE_ID_2_REV_STEP, val);
+
+	if (maj == 1) {
 		version = LPASS_CODEC_VERSION_2_0;
-	if ((core_id_0 == 0x02) && (core_id_1 == 0x0E))
-		version = LPASS_CODEC_VERSION_2_1;
-	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x50 || core_id_2 == 0x51))
-		version = LPASS_CODEC_VERSION_2_5;
-	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x60 || core_id_2 == 0x61))
-		version = LPASS_CODEC_VERSION_2_6;
-	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x70 || core_id_2 == 0x71))
-		version = LPASS_CODEC_VERSION_2_7;
-	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x80 || core_id_2 == 0x81))
-		version = LPASS_CODEC_VERSION_2_8;
-	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x90 || core_id_2 == 0x91))
-		version = LPASS_CODEC_VERSION_2_9;
-
-	if (version == LPASS_CODEC_VERSION_UNKNOWN)
-		dev_warn(va->dev, "Unknown Codec version, ID: %02x / %02x / %02x\n",
-			 core_id_0, core_id_1, core_id_2);
+	} else if (maj == 2) {
+		switch (min) {
+		case 0:
+			version = LPASS_CODEC_VERSION_2_0;
+			break;
+		case 5:
+			version = LPASS_CODEC_VERSION_2_5;
+			break;
+		case 6:
+			version = LPASS_CODEC_VERSION_2_6;
+			break;
+		case 7:
+			version = LPASS_CODEC_VERSION_2_7;
+			break;
+		case 8:
+			version = LPASS_CODEC_VERSION_2_8;
+			break;
+		case 9:
+			version = LPASS_CODEC_VERSION_2_9;
+			break;
+		default:
+			break;
+		}
+	}
+
+	if (version == LPASS_CODEC_VERSION_UNKNOWN) {
+		dev_err(va->dev, "VA Macro v%u.%u.%u is not supported\n",
+			maj, min, step);
+		return -EOPNOTSUPP;
+	}
 
 	lpass_macro_set_codec_version(version);
 
 	dev_dbg(va->dev, "LPASS Codec Version %s\n", lpass_macro_get_codec_version_string(version));
+
+	return 0;
 }
 
 static int va_macro_probe(struct platform_device *pdev)
@@ -1594,10 +1626,14 @@ static int va_macro_probe(struct platform_device *pdev)
 	 * old version of codecs do not have a reliable way to determine the
 	 * version from registers, get them from soc specific data
 	 */
-	if (data->version)
+	if (data->version) {
 		lpass_macro_set_codec_version(data->version);
-	else /* read version from register */
-		va_macro_set_lpass_codec_version(va);
+	} else {
+		/* read version from register */
+		ret = va_macro_set_lpass_codec_version(va);
+		if (ret)
+			return ret;
+	}
 
 	if (va->has_swr_master) {
 		/* Set default CLK div to 1 */
-- 
2.34.1


