Return-Path: <linux-arm-msm+bounces-65237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 396D0B075B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 14:33:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B40950815D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 12:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 788CB2F530A;
	Wed, 16 Jul 2025 12:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QpobCLBF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BF32F50A4
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 12:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752669216; cv=none; b=jT9WR9HPJswVWOfXY609yDY/OJS+uvfQN9IMDVXEDxCI/4BrYBrEWpt+r8L3dA7gnj5V6rCheNuHUCsED8rPXg9zxsuDnwSMzAy6y0kz+NVtlTtwXznZ5m2kgQSNQM+PXxowZ+Ee7vPiLnmgLIot8MZxnKujiYFYC4/Jm874Gq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752669216; c=relaxed/simple;
	bh=pwUXcN/tYFpUKUiZQ9vbe6DzhnD4SjUoa6LqKayVcrs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N5YcR7ju/itMCJ2UT7AoxcB1OBwDo1SXhg2QMgwscwh6x/VIrjNB+H+IWQQgqZMOI892MvYKKC7HE2nuU21pwjotkAI2JwcTTmjJINb2PRNF1LK1iYqHZ4U+Yauhaeh9bOGP2i7kvAPlZEQd3LECCW8ke+OHNifaUqw4fsV5gsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QpobCLBF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G6DEs8022694
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 12:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ILZwIdqXKUz
	HsZ/3SNiY+HSM17zGHVzMqnAliKbqiUU=; b=QpobCLBFUMRP+4LZL+sabHXTMxI
	PNjbjwNBf31+kFbAk2Raa4ZyDYNcBCetrPIOLwOdnb+4pMWt9lBLYSq45obZKfu7
	1CVMFjmURJeF6L6g7k/QLuttoV1egTkBR5F4INrPgNSY99fOLPlJNFQ8B4Ypp+uc
	XSmaqsHyF5/INQIoyB3CKtZPaAFJSskobPDEwx9rngGhaWLLeheyhtyijzBWpSIk
	giF2kVcj75eMOdrUg9rC2kz30T0NBp8fJ1pULp94p7bZQlGjm/j9Be5U2NEHQd78
	EUzS//+HJrRl7URIuK6InwqOJGY3b3N5yKbLiUyRlTfC2l718dVurNwSWNA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wkrumk6a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 12:33:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ab44642abeso81500561cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 05:33:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752669212; x=1753274012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ILZwIdqXKUzHsZ/3SNiY+HSM17zGHVzMqnAliKbqiUU=;
        b=wzQ81EAUXPmd1DXpDBGMN07VX58WBK/o0ZyK2W1I6PiByIH59jiWqMDcyCSco0PLpS
         omUiY9wGhCyDwYrsV9rbUG0gQ71O9+eHNvNP3dbl4iCgqwj2E9qrzXlq+T/T5OzSJyN7
         PqKlVjFQiTEmUHhv+4Tcm+lJVBMgcb6N8a3V1Q6KGJciPMXeNvd40bg8ECOPfKVS9xeR
         Ut71cjVHO7n8hdVSMmi4VrYS1iiB1IUmTxeEV8wBQVz6Z4zYo7xDibXEmouiXGEhc+rt
         W9BKPu5/JFSf31KieSKh2CdpdKpP25xUv7UPNY1/yIdodApxP8Uc3yEJpk2KYWCaNCUX
         7NKA==
X-Forwarded-Encrypted: i=1; AJvYcCWp2ZjAiDjgKPbFuZyIH1HtIJHLnVxR54p3w/4PK6tmxwAJS+t1+ZFVWG99fmZvbaoAC+L5s0pdQFbnqY3U@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1FeqTBVrmwtBu+NUb4bmLzSN6JhRnn9mCsLolwDGFhlvUZw4v
	Wurtkv58ZCozWj0xbvndwtxYx4DmxoQwiRDeokEpxip368TKcteH6dxyaDYom5MxM0IODwNfK1I
	M1zQXqTw6GU3lWmtB5b1NWW3zlPVbKz0WOoQplWsSLLIbOwpI7LGi1EZX+RpmmnNgSb4q
X-Gm-Gg: ASbGnctGSDkf6p5yfZq8fhryk0X0MA+O4fibla4jLwoOVz42t2BGf3PQ9vXQCQyovzv
	eolXU54HxKmosT8mJjv1+IV0RskXBAeX+gIAvZSgoMsjnSsVW69TUwgh3qrBOvcRjX0fHoAc6XB
	/F2ejTPOIb17cd3TDRMnQAVKJVyhaSMNC9rkETFDLCwr31wxn3GnhRsKNd+PSIz0OF1r7euW479
	dNIF6sEhopXhIgAIBNa2OAMNgD2DVks49CcIn6TBeSq9az4CnIqbjZqt7QLi4TYq6krXnL9Mi3x
	BU/KVMvQNXXIbVDAfGF8lS9VZ5I+jWQ7G5yhu567gD8mYUgdV5VFkA==
X-Received: by 2002:a05:622a:1a8d:b0:4a3:4d46:c2a6 with SMTP id d75a77b69052e-4ab93c6d086mr39094141cf.7.1752669211221;
        Wed, 16 Jul 2025 05:33:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDy9BVKcG+tyN/VAXcRAsDaOYTfPP9joPVVd8YCEddeMx0YjTzda0WPIBrtsaF2giE4NQYcA==
X-Received: by 2002:a05:622a:1a8d:b0:4a3:4d46:c2a6 with SMTP id d75a77b69052e-4ab93c6d086mr39093281cf.7.1752669210366;
        Wed, 16 Jul 2025 05:33:30 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e89c739sm19453335e9.32.2025.07.16.05.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 05:33:29 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, neil.armstrong@linaro.org,
        krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 2/5] ASoC: codecs: wcd-common: move WCD_SDW_CH to common
Date: Wed, 16 Jul 2025 13:33:20 +0100
Message-ID: <20250716123323.5831-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250716123323.5831-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250716123323.5831-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: dvtTeThJ8Ph7lKcK_teQ0qDsmnxvViHk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDExMiBTYWx0ZWRfX5aesBefxWqud
 xhVM8FM8+LTmvNMJgewwlDPvGWi1jOP7LoMhP1KZVSMszNKCc4OB50IxMRXVilBXpoY6fBWAYST
 WM1iEAslyDUpWwaWtyC47LqkElRD1W9nWqH/qfgKFFwTUP9o7O06iUfv0lJJmHy2FJUSd4Y1t64
 yDqsB8fAxQC2wfr9N7/YJJ9YkUZqg+C7Q753C1pA8W3sif9t0tP5IFHhdNJhLMix7mHsqh3c0GW
 7UYJQ9ucVrDrFfazA0uOcVTIvUF3hPFKS49ynHfRqOah8Cpwl96KA6UaHn+60iImCOO05AHkDtZ
 QgadVWBa9OWKPCPrgwepCj9PNiHT+c58QVXm3LnjB5Rq+ZblAolAlCbAbSpW9jqUS1PJ76tl9ad
 mnX8oXM3VBwcV6mxmrg6Q+Ix35dW+zjrm1012hb88yZnazF+ipzCBUorw0npoHCjEfkpxJpZ
X-Authority-Analysis: v=2.4 cv=WqUrMcfv c=1 sm=1 tr=0 ts=68779c1d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=AbvtZVZmey0OcoHPdAYA:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: dvtTeThJ8Ph7lKcK_teQ0qDsmnxvViHk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160112

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

sdw_ch_info and WCD_SDW_CH macro is duplicated across wcd937x, wcd938x,
wcd939x soundwire codec drivers. Move this to wcd common driver to
remove this code duplication.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wcd-common.h  | 11 +++++++++++
 sound/soc/codecs/wcd937x-sdw.c |  4 ++--
 sound/soc/codecs/wcd937x.h     | 16 ++--------------
 sound/soc/codecs/wcd938x-sdw.c |  4 ++--
 sound/soc/codecs/wcd938x.c     |  2 +-
 sound/soc/codecs/wcd938x.h     | 13 +------------
 sound/soc/codecs/wcd939x-sdw.c |  4 ++--
 sound/soc/codecs/wcd939x.c     |  2 +-
 sound/soc/codecs/wcd939x.h     | 13 +------------
 9 files changed, 23 insertions(+), 46 deletions(-)

diff --git a/sound/soc/codecs/wcd-common.h b/sound/soc/codecs/wcd-common.h
index 08c8e7ce9814..ee101f8547d5 100644
--- a/sound/soc/codecs/wcd-common.h
+++ b/sound/soc/codecs/wcd-common.h
@@ -11,6 +11,17 @@
 #define WCD_MAX_MICBIAS_MV	2850
 #define WCD_MAX_MICBIAS		4
 
+struct wcd_sdw_ch_info {
+	int port_num;
+	unsigned int ch_mask;
+};
+
+#define WCD_SDW_CH(id, pn, cmask)	\
+	[id] = {			\
+		.port_num = pn,		\
+		.ch_mask = cmask,	\
+	}
+
 struct wcd_common {
 	struct device *dev;
 	int max_bias;
diff --git a/sound/soc/codecs/wcd937x-sdw.c b/sound/soc/codecs/wcd937x-sdw.c
index e7cc699bd8bc..8f2819163527 100644
--- a/sound/soc/codecs/wcd937x-sdw.c
+++ b/sound/soc/codecs/wcd937x-sdw.c
@@ -19,7 +19,7 @@
 #include <sound/soc.h>
 #include "wcd937x.h"
 
-static struct wcd937x_sdw_ch_info wcd937x_sdw_rx_ch_info[] = {
+static struct wcd_sdw_ch_info wcd937x_sdw_rx_ch_info[] = {
 	WCD_SDW_CH(WCD937X_HPH_L, WCD937X_HPH_PORT, BIT(0)),
 	WCD_SDW_CH(WCD937X_HPH_R, WCD937X_HPH_PORT, BIT(1)),
 	WCD_SDW_CH(WCD937X_CLSH, WCD937X_CLSH_PORT, BIT(0)),
@@ -30,7 +30,7 @@ static struct wcd937x_sdw_ch_info wcd937x_sdw_rx_ch_info[] = {
 	WCD_SDW_CH(WCD937X_DSD_R, WCD937X_DSD_PORT, BIT(1)),
 };
 
-static struct wcd937x_sdw_ch_info wcd937x_sdw_tx_ch_info[] = {
+static struct wcd_sdw_ch_info wcd937x_sdw_tx_ch_info[] = {
 	WCD_SDW_CH(WCD937X_ADC1, WCD937X_ADC_1_PORT, BIT(0)),
 	WCD_SDW_CH(WCD937X_ADC2, WCD937X_ADC_2_3_PORT, BIT(0)),
 	WCD_SDW_CH(WCD937X_ADC3, WCD937X_ADC_2_3_PORT, BIT(0)),
diff --git a/sound/soc/codecs/wcd937x.h b/sound/soc/codecs/wcd937x.h
index 0f96b7108a7e..3d0ba3cc0ee6 100644
--- a/sound/soc/codecs/wcd937x.h
+++ b/sound/soc/codecs/wcd937x.h
@@ -7,6 +7,7 @@
 
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_type.h>
+#include "wcd-common.h"
 
 #define WCD937X_BASE_ADDRESS			0x3000
 #define WCD937X_ANA_BIAS			0x3001
@@ -507,26 +508,13 @@ enum wcd937x_rx_sdw_ports {
 	WCD937X_MAX_SWR_PORTS = WCD937X_DSD_PORT,
 };
 
-struct wcd937x_sdw_ch_info {
-	int port_num;
-	unsigned int ch_mask;
-	unsigned int master_ch_mask;
-};
-
-#define WCD_SDW_CH(id, pn, cmask)	\
-	[id] = {			\
-		.port_num = pn,		\
-		.ch_mask = cmask,	\
-		.master_ch_mask = cmask,	\
-	}
-
 struct wcd937x_priv;
 struct wcd937x_sdw_priv {
 	struct sdw_slave *sdev;
 	struct sdw_stream_config sconfig;
 	struct sdw_stream_runtime *sruntime;
 	struct sdw_port_config port_config[WCD937X_MAX_SWR_PORTS];
-	struct wcd937x_sdw_ch_info *ch_info;
+	struct wcd_sdw_ch_info *ch_info;
 	bool port_enable[WCD937X_MAX_SWR_CH_IDS];
 	unsigned int master_channel_map[SDW_MAX_PORTS];
 	int active_ports;
diff --git a/sound/soc/codecs/wcd938x-sdw.c b/sound/soc/codecs/wcd938x-sdw.c
index 8bcd8396f375..40c6896eb781 100644
--- a/sound/soc/codecs/wcd938x-sdw.c
+++ b/sound/soc/codecs/wcd938x-sdw.c
@@ -21,7 +21,7 @@
 
 #define SWRS_SCP_HOST_CLK_DIV2_CTL_BANK(m) (0xE0 + 0x10 * (m))
 
-static const struct wcd938x_sdw_ch_info wcd938x_sdw_rx_ch_info[] = {
+static const struct wcd_sdw_ch_info wcd938x_sdw_rx_ch_info[] = {
 	WCD_SDW_CH(WCD938X_HPH_L, WCD938X_HPH_PORT, BIT(0)),
 	WCD_SDW_CH(WCD938X_HPH_R, WCD938X_HPH_PORT, BIT(1)),
 	WCD_SDW_CH(WCD938X_CLSH, WCD938X_CLSH_PORT, BIT(0)),
@@ -32,7 +32,7 @@ static const struct wcd938x_sdw_ch_info wcd938x_sdw_rx_ch_info[] = {
 	WCD_SDW_CH(WCD938X_DSD_R, WCD938X_DSD_PORT, BIT(1)),
 };
 
-static const struct wcd938x_sdw_ch_info wcd938x_sdw_tx_ch_info[] = {
+static const struct wcd_sdw_ch_info wcd938x_sdw_tx_ch_info[] = {
 	WCD_SDW_CH(WCD938X_ADC1, WCD938X_ADC_1_2_PORT, BIT(0)),
 	WCD_SDW_CH(WCD938X_ADC2, WCD938X_ADC_1_2_PORT, BIT(1)),
 	WCD_SDW_CH(WCD938X_ADC3, WCD938X_ADC_3_4_PORT, BIT(0)),
diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index 6d77cbcafa70..678e4052a255 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -393,7 +393,7 @@ static int wcd938x_io_init(struct wcd938x_priv *wcd938x)
 
 }
 
-static int wcd938x_sdw_connect_port(const struct wcd938x_sdw_ch_info *ch_info,
+static int wcd938x_sdw_connect_port(const struct wcd_sdw_ch_info *ch_info,
 				    struct sdw_port_config *port_config,
 				    u8 enable)
 {
diff --git a/sound/soc/codecs/wcd938x.h b/sound/soc/codecs/wcd938x.h
index a6fda63d7f98..a37962c4cef1 100644
--- a/sound/soc/codecs/wcd938x.h
+++ b/sound/soc/codecs/wcd938x.h
@@ -588,17 +588,6 @@
 
 #define WCD938X_MAX_SWR_CH_IDS	15
 
-struct wcd938x_sdw_ch_info {
-	int port_num;
-	unsigned int ch_mask;
-};
-
-#define WCD_SDW_CH(id, pn, cmask)	\
-	[id] = {			\
-		.port_num = pn,		\
-		.ch_mask = cmask,	\
-	}
-
 enum wcd938x_tx_sdw_ports {
 	WCD938X_ADC_1_2_PORT = 1,
 	WCD938X_ADC_3_4_PORT,
@@ -650,7 +639,7 @@ struct wcd938x_sdw_priv {
 	struct sdw_stream_config sconfig;
 	struct sdw_stream_runtime *sruntime;
 	struct sdw_port_config port_config[WCD938X_MAX_SWR_PORTS];
-	const struct wcd938x_sdw_ch_info *ch_info;
+	const struct wcd_sdw_ch_info *ch_info;
 	bool port_enable[WCD938X_MAX_SWR_CH_IDS];
 	int active_ports;
 	bool is_tx;
diff --git a/sound/soc/codecs/wcd939x-sdw.c b/sound/soc/codecs/wcd939x-sdw.c
index 477d6cf27d32..b5a35c3b22e1 100644
--- a/sound/soc/codecs/wcd939x-sdw.c
+++ b/sound/soc/codecs/wcd939x-sdw.c
@@ -23,7 +23,7 @@
 
 #define SWRS_SCP_HOST_CLK_DIV2_CTL_BANK(m) (0xE0 + 0x10 * (m))
 
-static const struct wcd939x_sdw_ch_info wcd939x_sdw_rx_ch_info[] = {
+static const struct wcd_sdw_ch_info wcd939x_sdw_rx_ch_info[] = {
 	WCD_SDW_CH(WCD939X_HPH_L, WCD939X_HPH_PORT, BIT(0)),
 	WCD_SDW_CH(WCD939X_HPH_R, WCD939X_HPH_PORT, BIT(1)),
 	WCD_SDW_CH(WCD939X_CLSH, WCD939X_CLSH_PORT, BIT(0)),
@@ -36,7 +36,7 @@ static const struct wcd939x_sdw_ch_info wcd939x_sdw_rx_ch_info[] = {
 	WCD_SDW_CH(WCD939X_HIFI_PCM_R, WCD939X_HIFI_PCM_PORT, BIT(1)),
 };
 
-static const struct wcd939x_sdw_ch_info wcd939x_sdw_tx_ch_info[] = {
+static const struct wcd_sdw_ch_info wcd939x_sdw_tx_ch_info[] = {
 	WCD_SDW_CH(WCD939X_ADC1, WCD939X_ADC_1_4_PORT, BIT(0)),
 	WCD_SDW_CH(WCD939X_ADC2, WCD939X_ADC_1_4_PORT, BIT(1)),
 	WCD_SDW_CH(WCD939X_ADC3, WCD939X_ADC_1_4_PORT, BIT(2)),
diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
index ef8def695219..6bbdfa426365 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -412,7 +412,7 @@ static int wcd939x_io_init(struct snd_soc_component *component)
 	return 0;
 }
 
-static int wcd939x_sdw_connect_port(const struct wcd939x_sdw_ch_info *ch_info,
+static int wcd939x_sdw_connect_port(const struct wcd_sdw_ch_info *ch_info,
 				    struct sdw_port_config *port_config,
 				    u8 enable)
 {
diff --git a/sound/soc/codecs/wcd939x.h b/sound/soc/codecs/wcd939x.h
index f587cf22f86f..0ee0fbb49ff9 100644
--- a/sound/soc/codecs/wcd939x.h
+++ b/sound/soc/codecs/wcd939x.h
@@ -845,17 +845,6 @@
 
 #define WCD939X_MAX_SWR_CH_IDS		(15)
 
-struct wcd939x_sdw_ch_info {
-	int port_num;
-	unsigned int ch_mask;
-};
-
-#define WCD_SDW_CH(id, pn, cmask)	\
-	[id] = {			\
-		.port_num = pn,		\
-		.ch_mask = cmask,	\
-	}
-
 enum wcd939x_tx_sdw_ports {
 	WCD939X_ADC_1_4_PORT = 1,
 	WCD939X_ADC_DMIC_1_2_PORT,
@@ -910,7 +899,7 @@ struct wcd939x_sdw_priv {
 	struct sdw_stream_config sconfig;
 	struct sdw_stream_runtime *sruntime;
 	struct sdw_port_config port_config[WCD939X_MAX_SWR_PORTS];
-	const struct wcd939x_sdw_ch_info *ch_info;
+	const struct wcd_sdw_ch_info *ch_info;
 	bool port_enable[WCD939X_MAX_SWR_CH_IDS];
 	int active_ports;
 	bool is_tx;
-- 
2.50.0


