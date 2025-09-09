Return-Path: <linux-arm-msm+bounces-72760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6D7B4FA9F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 14:21:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D43661C26E3C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 12:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A814C338F33;
	Tue,  9 Sep 2025 12:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VgQKm5RD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD55E338F32
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 12:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757420430; cv=none; b=XxIIyuu09qtscZEVMDSWKcmjXftF2O0qa/zrsC0Wu6etcHic+UGWfAnS9ncMTM05vFjLlM88NtAR0nK4lAvdSGwDOqD6MkiO3VtVi/ZQs+Usl/IZUuOWRYt2J+cyY4obr/Hkb8MEqhkb7zMHae3BasyTNjF3zMjK+ED+7abW8FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757420430; c=relaxed/simple;
	bh=OYar4OqOoJWodf9p8IB1NwWFtaFEZHfVBZWnl1rzcTk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jmXFFif7VQmW0agLenIVGcr0I+IZb2k4RF0NOwSFnnfH4/hCVoqH106WaYFvqZs0ohxatqLtAPp5KdqnjctlkgyiHU6MBdN0W+YKOUklvNMcu+fnehOZqFPcI5pfYtjFVgwkmsG3qqs16B+0M6ygx4fRjL2giJbaSP3DYvf5luA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VgQKm5RD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LSCO030498
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 12:20:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Jwwqnlj1Kx/
	ViSnEHsSeI2j74M7xqTIHEhg/eNadxmI=; b=VgQKm5RDHfzTv93aqGXsnkSIpF9
	5e+sRpTux/zAb5zE1eONc3qOc3VWgOatzJYlxS8A079X+NkmJvnGXH5C/Jq+e7qY
	WEZg5OjHuFmowQDlGK7kQSKRl2PkKksOvaoBJooDA/Bue073eXIkjPZ8Jpy/r9+E
	7abW8NMNCLzLK3MDpPTsuVY2++Ft/FB2RIPUStBGmw4daESEacDHUSDI7vrpIYEN
	HSqbQA7zB3ZBeAvyHXFPVLOBgj//NbVszFIMAyDpXCzXgjgo1MVzm3gNLC/6aJ0Q
	mZaUAQpUVT9ytidP+yYeSE82iILG9ocFcmUIky/OAl3fXAdu13uhQ0IW9Ow==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490c9j88t7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 12:20:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b47b4d296eso138089651cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 05:20:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757420426; x=1758025226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jwwqnlj1Kx/ViSnEHsSeI2j74M7xqTIHEhg/eNadxmI=;
        b=rLJcfQgGswY+6Dtz0/muOP9J5EJPyoW8wur11qUdQvlNvXjsHjv9ocC0nqJ4fc87b6
         t5rNv6QB5uKL2bAeg4DZ88wQmb+o2POnPggLKYAHRNRhFiAjbrmSvF+lhHgBNuM/yrmO
         ZlvER339f1kn2ebb/41xdROu24Py0HpaJ6oF1LIRRSyvw1kOGlfKiayscJv7vWTk2WHo
         01tzjAQoIRK7yDI+RGFo9NYiSc8UOvRXqRhGUkK4pUKs7WbYbNAuLMabqCea71c5Fo7+
         gZoCJAo3UfnpQTzK71UOWWlk7lB5y7dPwLIBUwteDADcXFA0CIrbzopNnSzZk8HQnVse
         5SAA==
X-Forwarded-Encrypted: i=1; AJvYcCW8Vpy2FPUE5lbsgQsIkJsIM1j1y22R/djErEUiJPiUERIe/l77j7i5V+X0N3ay9218CH02ENnIWFJ9+mW6@vger.kernel.org
X-Gm-Message-State: AOJu0YxjygFDQ2XRyVha+jmxFF8ljcAh+xJuHPquwnUVRsIefA0OKYed
	0ZnC0SwKlWr97syHGvet+vAU7UndZNYGDvbMfe7+qRmdEXe+D0MvJOJo1Z8GguLmAB8M9kBp9dx
	rXLQUOUT90a9+850r2lv6o6qy9f8a/wxuIgzfkYzj04RCUk6ugiX3Czf6r/pMzeSJqLtN
X-Gm-Gg: ASbGncvUyNfTk0B9ZGtrn9OUilTDEfgJVww+5CImvkAAeXoZbbbRruCQyRLGK4gtCyC
	gA6M+VWOeX6bHvT9eqWIcJD5AKtjioAvztdetlRc3iU1s0xTYp07zJJozSuc9dWIstTZpWcdpL3
	KQd0gZpK653uWObgTniZPNgL5VoeH1vNCuwKLo49RsUVmsdcht0EeEnjE5RjFaVuznpgHmyR+2R
	oNPwgyN26OHfrh5ftdp/Ihzizbm8+aZuTPyb6VHBqwR170Pst/xzSvJh8h5V6Tt1LZX9NDuq1TM
	RJotLqXxHzI4MSy+qQ0a0fH0CvCzGppWESWhi02BUnw1b6TriDs/Ww==
X-Received: by 2002:a05:622a:24d:b0:4b5:ed9d:7bbe with SMTP id d75a77b69052e-4b5f843c5b6mr123547511cf.39.1757420426226;
        Tue, 09 Sep 2025 05:20:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgR3KQsvIS7f3jk8K6SsPgPRrKYz8k9kI+mHNfTdyh/OKYPvKwg51XoYXXyEm92vDBMXAhEQ==
X-Received: by 2002:a05:622a:24d:b0:4b5:ed9d:7bbe with SMTP id d75a77b69052e-4b5f843c5b6mr123547031cf.39.1757420425584;
        Tue, 09 Sep 2025 05:20:25 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e75224db20sm2414629f8f.60.2025.09.09.05.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 05:20:25 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v5 08/13] ASoC: codecs: wcd-common: move WCD_SDW_CH to common
Date: Tue,  9 Sep 2025 13:19:49 +0100
Message-ID: <20250909121954.225833-9-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250909121954.225833-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250909121954.225833-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMiBTYWx0ZWRfX609jB3Fx8cwq
 azBsBX1fza1SciRa1rRY6YPRnpcCP3zwO5W+pigrmS2E5ddLylTN3by2CPWPm9fg0g7+4eq0lPD
 do+c+wV0JcO2Je/DWCH8D4xVOvytfcPrOcpYZJAVvK7xyu017dnkSy23bxxqJscfdP4cadyXrEw
 V0KVGZQdFiwtcTg4u3Hrb7/OdDowcrukbtjqsdw3yaLrhI4EWL8swwY7JcpERFOMBWAj0G5QLcI
 Se3VMK2pQmRDZImjOz2t8UTrudi1/OWuhs+HVe5NbJJM9u3nF0QtLU0RXeuudM2rr2gCYPsRmd6
 2qX/1Ndba/3Y0pMhCzetHXerwUyxu6OfaySyD/5SFcXk5umXItfLBrGmvK5HyI0PkGlyB+3fOkR
 9rRkWM95
X-Proofpoint-ORIG-GUID: n-fcqXtaWEc9w_1Dm2I_EmDrDj1b9crQ
X-Authority-Analysis: v=2.4 cv=PpOTbxM3 c=1 sm=1 tr=0 ts=68c01b8b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=jyQ4PTnIHhbLQwYoN9cA:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: n-fcqXtaWEc9w_1Dm2I_EmDrDj1b9crQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_01,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060022

sdw_ch_info and WCD_SDW_CH macro is duplicated across wcd937x, wcd938x,
wcd939x soundwire codec drivers. Move this to wcd common driver to
remove this code duplication.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 sound/soc/codecs/wcd-common.h  | 13 +++++++++++++
 sound/soc/codecs/wcd937x-sdw.c |  4 ++--
 sound/soc/codecs/wcd937x.c     |  2 +-
 sound/soc/codecs/wcd937x.h     | 16 ++--------------
 sound/soc/codecs/wcd938x-sdw.c |  5 +++--
 sound/soc/codecs/wcd938x.c     |  2 +-
 sound/soc/codecs/wcd938x.h     | 13 +------------
 sound/soc/codecs/wcd939x-sdw.c |  5 +++--
 sound/soc/codecs/wcd939x.c     |  2 +-
 sound/soc/codecs/wcd939x.h     | 13 +------------
 10 files changed, 28 insertions(+), 47 deletions(-)

diff --git a/sound/soc/codecs/wcd-common.h b/sound/soc/codecs/wcd-common.h
index 611f06cdec55..d94e8879a1d7 100644
--- a/sound/soc/codecs/wcd-common.h
+++ b/sound/soc/codecs/wcd-common.h
@@ -14,6 +14,19 @@ enum sdw_slave_status;
 
 #define WCD_MAX_MICBIAS		4
 
+struct wcd_sdw_ch_info {
+	int port_num;
+	unsigned int ch_mask;
+	unsigned int master_ch_mask;
+};
+
+#define WCD_SDW_CH(id, pn, cmask)	\
+	[id] = {			\
+		.port_num = pn,		\
+		.ch_mask = cmask,	\
+		.master_ch_mask = cmask,	\
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
diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index ffe6508fd84c..4c040e3862f4 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -1183,7 +1183,7 @@ static int wcd937x_codec_enable_micbias_pullup(struct snd_soc_dapm_widget *w,
 static int wcd937x_connect_port(struct wcd937x_sdw_priv *wcd, u8 port_idx, u8 ch_id, bool enable)
 {
 	struct sdw_port_config *port_config = &wcd->port_config[port_idx - 1];
-	const struct wcd937x_sdw_ch_info *ch_info = &wcd->ch_info[ch_id];
+	const struct wcd_sdw_ch_info *ch_info = &wcd->ch_info[ch_id];
 	u8 port_num = ch_info->port_num;
 	u8 ch_mask = ch_info->ch_mask;
 	u8 mstr_port_num, mstr_ch_mask;
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
index 8bcd8396f375..1dc13b6fabfa 100644
--- a/sound/soc/codecs/wcd938x-sdw.c
+++ b/sound/soc/codecs/wcd938x-sdw.c
@@ -18,10 +18,11 @@
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
 #include "wcd938x.h"
+#include "wcd-common.h"
 
 #define SWRS_SCP_HOST_CLK_DIV2_CTL_BANK(m) (0xE0 + 0x10 * (m))
 
-static const struct wcd938x_sdw_ch_info wcd938x_sdw_rx_ch_info[] = {
+static const struct wcd_sdw_ch_info wcd938x_sdw_rx_ch_info[] = {
 	WCD_SDW_CH(WCD938X_HPH_L, WCD938X_HPH_PORT, BIT(0)),
 	WCD_SDW_CH(WCD938X_HPH_R, WCD938X_HPH_PORT, BIT(1)),
 	WCD_SDW_CH(WCD938X_CLSH, WCD938X_CLSH_PORT, BIT(0)),
@@ -32,7 +33,7 @@ static const struct wcd938x_sdw_ch_info wcd938x_sdw_rx_ch_info[] = {
 	WCD_SDW_CH(WCD938X_DSD_R, WCD938X_DSD_PORT, BIT(1)),
 };
 
-static const struct wcd938x_sdw_ch_info wcd938x_sdw_tx_ch_info[] = {
+static const struct wcd_sdw_ch_info wcd938x_sdw_tx_ch_info[] = {
 	WCD_SDW_CH(WCD938X_ADC1, WCD938X_ADC_1_2_PORT, BIT(0)),
 	WCD_SDW_CH(WCD938X_ADC2, WCD938X_ADC_1_2_PORT, BIT(1)),
 	WCD_SDW_CH(WCD938X_ADC3, WCD938X_ADC_3_4_PORT, BIT(0)),
diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index c8b6e543986d..e495f98972f1 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -394,7 +394,7 @@ static int wcd938x_io_init(struct wcd938x_priv *wcd938x)
 
 }
 
-static int wcd938x_sdw_connect_port(const struct wcd938x_sdw_ch_info *ch_info,
+static int wcd938x_sdw_connect_port(const struct wcd_sdw_ch_info *ch_info,
 				    struct sdw_port_config *port_config,
 				    u8 enable)
 {
diff --git a/sound/soc/codecs/wcd938x.h b/sound/soc/codecs/wcd938x.h
index 54ee56b7fbd6..c18610466d7d 100644
--- a/sound/soc/codecs/wcd938x.h
+++ b/sound/soc/codecs/wcd938x.h
@@ -587,17 +587,6 @@
 
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
@@ -649,7 +638,7 @@ struct wcd938x_sdw_priv {
 	struct sdw_stream_config sconfig;
 	struct sdw_stream_runtime *sruntime;
 	struct sdw_port_config port_config[WCD938X_MAX_SWR_PORTS];
-	const struct wcd938x_sdw_ch_info *ch_info;
+	const struct wcd_sdw_ch_info *ch_info;
 	bool port_enable[WCD938X_MAX_SWR_CH_IDS];
 	int active_ports;
 	bool is_tx;
diff --git a/sound/soc/codecs/wcd939x-sdw.c b/sound/soc/codecs/wcd939x-sdw.c
index 477d6cf27d32..97a829e3ce4f 100644
--- a/sound/soc/codecs/wcd939x-sdw.c
+++ b/sound/soc/codecs/wcd939x-sdw.c
@@ -20,10 +20,11 @@
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
 #include "wcd939x.h"
+#include "wcd-common.h"
 
 #define SWRS_SCP_HOST_CLK_DIV2_CTL_BANK(m) (0xE0 + 0x10 * (m))
 
-static const struct wcd939x_sdw_ch_info wcd939x_sdw_rx_ch_info[] = {
+static const struct wcd_sdw_ch_info wcd939x_sdw_rx_ch_info[] = {
 	WCD_SDW_CH(WCD939X_HPH_L, WCD939X_HPH_PORT, BIT(0)),
 	WCD_SDW_CH(WCD939X_HPH_R, WCD939X_HPH_PORT, BIT(1)),
 	WCD_SDW_CH(WCD939X_CLSH, WCD939X_CLSH_PORT, BIT(0)),
@@ -36,7 +37,7 @@ static const struct wcd939x_sdw_ch_info wcd939x_sdw_rx_ch_info[] = {
 	WCD_SDW_CH(WCD939X_HIFI_PCM_R, WCD939X_HIFI_PCM_PORT, BIT(1)),
 };
 
-static const struct wcd939x_sdw_ch_info wcd939x_sdw_tx_ch_info[] = {
+static const struct wcd_sdw_ch_info wcd939x_sdw_tx_ch_info[] = {
 	WCD_SDW_CH(WCD939X_ADC1, WCD939X_ADC_1_4_PORT, BIT(0)),
 	WCD_SDW_CH(WCD939X_ADC2, WCD939X_ADC_1_4_PORT, BIT(1)),
 	WCD_SDW_CH(WCD939X_ADC3, WCD939X_ADC_1_4_PORT, BIT(2)),
diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
index 59c920c50c00..a414cd99b946 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -413,7 +413,7 @@ static int wcd939x_io_init(struct snd_soc_component *component)
 	return 0;
 }
 
-static int wcd939x_sdw_connect_port(const struct wcd939x_sdw_ch_info *ch_info,
+static int wcd939x_sdw_connect_port(const struct wcd_sdw_ch_info *ch_info,
 				    struct sdw_port_config *port_config,
 				    u8 enable)
 {
diff --git a/sound/soc/codecs/wcd939x.h b/sound/soc/codecs/wcd939x.h
index e70445b1a4bc..ca6353222ea0 100644
--- a/sound/soc/codecs/wcd939x.h
+++ b/sound/soc/codecs/wcd939x.h
@@ -844,17 +844,6 @@
 
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
@@ -909,7 +898,7 @@ struct wcd939x_sdw_priv {
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


