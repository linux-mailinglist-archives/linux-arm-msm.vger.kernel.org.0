Return-Path: <linux-arm-msm+bounces-69398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2D2B284EE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 19:25:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06176AE4110
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 17:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6566C30DEDC;
	Fri, 15 Aug 2025 17:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZM34pGx5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA62B30DEB7
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 17:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755278678; cv=none; b=X/sQ7aJzRfeIF7LnxyOU+2hj5PZltek9ypDo2s79i20mRx5J9A48tyL9x2TF5jjma/maNZzbRXLZfE2j9PGbj+GItwJTFJ2lRPUGVRCHjQkCr1UsKU7fTqWKOaq7kEnyQbZTWC/DA31EN/ziFoy1fUyFqxu9TRikb9Ie9VuPK7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755278678; c=relaxed/simple;
	bh=X6mUCGLXCPXZ9t8C01RTNe140Dm018SiDsqQ7M1exFg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eij/RraOHDvvZtE2u01bb9RClmmTbu/Zgk7pLoWC1OXRME/CjVtAbKufjY7QxTay6vE4+TN4gE3sFMF4DWJK+fwWUmvibJmneTfuOUvg1VJPm7DnRbX03NcfgzuM2bQImzECHT7GWZObYOGi78v2gAPrF6MIUdoRi6tF5EudVfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZM34pGx5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FEIlb9030013
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 17:24:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=917KwB9AZyy
	ub7R3lVyuzy+/KECDcgd+v/M3WrVKgC0=; b=ZM34pGx5xVASEg1Y2rfax/dwS4j
	gr99wDyp074RK7d5y5hexk5zwND9q7nDlbhWp9OM1uXgkEYm3GVc5vXtgjXmMqj3
	ObtOzoL6ANuWUsC5MDZSNU+EZZNYFsSjW91J9BYEEB9tUFRYhDCSXrhefgfGiDPT
	bXbSb+KSQ0oh+On/ucqvo2paGLwsQ8jFVsVFGyQIBdlEy0DAbRc4Mdm/A/AkG898
	4AIngwXHpHOw87j6mVs6q1bbmeIfIISljB7OwjhY/EvHFr7oB3oXDMkHrizwo1rC
	m4UbsbXfLLiTNePTpIV9ikhA4AU2j64a4yfDUP3KXUtgVEw2WFW2owdkjcg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fm3vxjr2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 17:24:35 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-244581ce388so44332335ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 10:24:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755278674; x=1755883474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=917KwB9AZyyub7R3lVyuzy+/KECDcgd+v/M3WrVKgC0=;
        b=p89ntgftF6ILFkchistc83y4qVwW9oZZ3u6ovwHGDIHniGie8jUXZ+JZ80z6tPLCTD
         PoiBuxs2Q1fWugxWdXX/I5gxErcC/B4P1TIcshQUg5wA/3AtfExw1V9GW7A3JX9SboJJ
         9Yr5CwbM0J++onWri7ahTh8OPfcL+tmP5uJqkLbBIOoPsffw9//732ssquQebhzinQbu
         PhendHxXtZMu5pDGq13xX7/3aoaHQn8PCB9knigZTjN4v1H67pdutopI3fN/VI6tUk0T
         ZHUiaecOg6E9dDC/V2dBHsFxyhWn5fOga4T/BTC8sN+WTEiGcDeNXhwj4XOf1pduwvo8
         kdtQ==
X-Forwarded-Encrypted: i=1; AJvYcCV43IY5SdDGWL0LZfY9qgT3TOrouSNFApxXzYV2VPH+VmZbxSr17quZ+bMvTJIZlhJUrq6l6MP5/Xm3VY/6@vger.kernel.org
X-Gm-Message-State: AOJu0YywFGSEbD7oEDRW04sk4iN/7G1iEVO9/gO2ubjJUNFiItUQugnl
	NjlwutNL1PR0TjRMXHo9lEHN0TvD7flUgPJmwXxvD1kgI1+FF5FclhVk51ZL8yvLwNZkZ4qldb1
	uVVm4lD/A17JJk/F7w7FmDwW+hnY8Had/kDnjSFqLLIWTm54APpTYfBuU5YyMgojD0OD6
X-Gm-Gg: ASbGncvPMKlIk+I0GAARA2eEdZvqRoe4qwswC3gMfjPJf7X9SNszpzNhbN9fPpcq77W
	WQXQLbhJBoxZ+5dHeGC5r82beaVEj7Xz0ida9ruUSRqmttHDDWPuovoTAEc9yHsknt3m6ofbrc7
	kPDEFwGyIkyRRpFuaMgA4FyB2JlfR4WjZKy4pf9/PqJ2PFKpwS4LZ0XgHQqvShpS/qOkDu3SZpa
	6aFpKAVVfgazcYf8/aihFWFzrsLQW4ATAnDp7k9QK4bGZZlgwWSB5LNcnPbQ0lLGbVupqK7Shg6
	CNIDQK6l5bWDjm5VOhOpvbMg/CGB/t+aAaHj6WG1EXBun7bKJqiJUCeFM6TAXvLHt/xdHC56zJy
	n
X-Received: by 2002:a17:902:db0e:b0:240:2281:bd0e with SMTP id d9443c01a7336-2446d6d3b3dmr45294785ad.2.1755278674235;
        Fri, 15 Aug 2025 10:24:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEu+dypPdoRPI5M25tQHiGVlFs/92TTwxXAZ+MG06yr4C2RER7lW0qJf7bffIDT8gC+8iWWsQ==
X-Received: by 2002:a17:902:db0e:b0:240:2281:bd0e with SMTP id d9443c01a7336-2446d6d3b3dmr45294195ad.2.1755278673487;
        Fri, 15 Aug 2025 10:24:33 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446cadff5asm18404025ad.42.2025.08.15.10.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 10:24:33 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, kernel@oss.qualcomm.com,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: [PATCH v5 2/2] ASoC: codecs: wsa883x: Handle shared reset GPIO for WSA883x speakers
Date: Fri, 15 Aug 2025 22:53:53 +0530
Message-Id: <20250815172353.2430981-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250815172353.2430981-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250815172353.2430981-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDEwNyBTYWx0ZWRfXw7/aH6OcSzox
 yZj9E3fBdkkRyyiSPatT9Fl/OIXAwnz4K0KX0eY5PxrCggHz2XgHixgejMG6mvNcdzitpwa4G9V
 HHJHfGRwcT8lP6JgJIBNZWlVAoOt6DeNTZN5fwaLprBuisOFPNJeLKQi/Jh7uEQj6BV/806hBks
 r/3VTyvxKq1tqQPxgtEmRtuI22lHtDP8gWHDmI9DPizB2PDNrJzcK1bGX4P6kUAYOP/ZzNoHFzF
 nTBXkji3tjuiWx/JZvHnhKJrFJBYuHVb8g1+w6JP+hQKKAgpIfRxRgkW+djYHhb7sVrnIm7C9rv
 sVACb5elv+/zrpURvXLPcv2yZ2nNSdHj/oLOGL/DmVGJ11ACRGujrEH3TC1NfbbWYhhOp9094bd
 Qub3Ypf0
X-Proofpoint-GUID: BRbKU5DeFJRyz9kuQlbXYfYWla00Sdet
X-Authority-Analysis: v=2.4 cv=A+1sP7WG c=1 sm=1 tr=0 ts=689f6d53 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=Ks4s8hASHHiSU9sHUrgA:9
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: BRbKU5DeFJRyz9kuQlbXYfYWla00Sdet
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_06,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110107

From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>

On some Qualcomm platforms such as QCS6490-RB3Gen2, the multiple
WSA8830/WSA8835 speaker amplifiers share a common reset (shutdown) GPIO.

To handle such scenario, use the reset controller framework and its
"reset-gpio" driver to handle such case. This allows proper handling
of all WSA883x speaker amplifiers on QCS6490-RB3Gen2 board.

Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
---
 sound/soc/codecs/wsa883x.c | 57 ++++++++++++++++++++++++++++++++------
 1 file changed, 49 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index 188363b03b93..ca4520ade79a 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -14,6 +14,7 @@
 #include <linux/printk.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_registers.h>
@@ -468,6 +469,7 @@ struct wsa883x_priv {
 	struct sdw_stream_runtime *sruntime;
 	struct sdw_port_config port_config[WSA883X_MAX_SWR_PORTS];
 	struct gpio_desc *sd_n;
+	struct reset_control *sd_reset;
 	bool port_prepared[WSA883X_MAX_SWR_PORTS];
 	bool port_enable[WSA883X_MAX_SWR_PORTS];
 	int active_ports;
@@ -1546,6 +1548,46 @@ static const struct hwmon_chip_info wsa883x_hwmon_chip_info = {
 	.info	= wsa883x_hwmon_info,
 };
 
+static void wsa883x_reset_assert(void *data)
+{
+	struct wsa883x_priv *wsa883x = data;
+
+	if (wsa883x->sd_reset)
+		reset_control_assert(wsa883x->sd_reset);
+	else
+		gpiod_direction_output(wsa883x->sd_n, 1);
+}
+
+static void wsa883x_reset_deassert(struct wsa883x_priv *wsa883x)
+{
+	if (wsa883x->sd_reset)
+		reset_control_deassert(wsa883x->sd_reset);
+	else
+		gpiod_direction_output(wsa883x->sd_n, 0);
+}
+
+static int wsa883x_get_reset(struct device *dev, struct wsa883x_priv *wsa883x)
+{
+	wsa883x->sd_reset = devm_reset_control_get_optional_shared(dev, NULL);
+	if (IS_ERR(wsa883x->sd_reset))
+		return dev_err_probe(dev, PTR_ERR(wsa883x->sd_reset),
+				     "Failed to get reset\n");
+	/*
+	 * if sd_reset: NULL, so use the backwards compatible way for powerdown-gpios,
+	 * which does not handle sharing GPIO properly.
+	 */
+	if (!wsa883x->sd_reset) {
+		wsa883x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
+							GPIOD_FLAGS_BIT_NONEXCLUSIVE |
+							GPIOD_OUT_HIGH);
+		if (IS_ERR(wsa883x->sd_n))
+			return dev_err_probe(dev, PTR_ERR(wsa883x->sd_n),
+					     "Shutdown Control GPIO not found\n");
+	}
+
+	return 0;
+}
+
 static int wsa883x_probe(struct sdw_slave *pdev,
 			 const struct sdw_device_id *id)
 {
@@ -1566,13 +1608,9 @@ static int wsa883x_probe(struct sdw_slave *pdev,
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to enable vdd regulator\n");
 
-	wsa883x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
-						GPIOD_FLAGS_BIT_NONEXCLUSIVE | GPIOD_OUT_HIGH);
-	if (IS_ERR(wsa883x->sd_n)) {
-		ret = dev_err_probe(dev, PTR_ERR(wsa883x->sd_n),
-				    "Shutdown Control GPIO not found\n");
+	ret = wsa883x_get_reset(dev, wsa883x);
+	if (ret)
 		goto err;
-	}
 
 	dev_set_drvdata(dev, wsa883x);
 	wsa883x->slave = pdev;
@@ -1595,11 +1633,14 @@ static int wsa883x_probe(struct sdw_slave *pdev,
 	pdev->prop.simple_clk_stop_capable = true;
 	pdev->prop.sink_dpn_prop = wsa_sink_dpn_prop;
 	pdev->prop.scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
-	gpiod_direction_output(wsa883x->sd_n, 0);
+
+	wsa883x_reset_deassert(wsa883x);
+	ret = devm_add_action_or_reset(dev, wsa883x_reset_assert, wsa883x);
+	if (ret)
+		return ret;
 
 	wsa883x->regmap = devm_regmap_init_sdw(pdev, &wsa883x_regmap_config);
 	if (IS_ERR(wsa883x->regmap)) {
-		gpiod_direction_output(wsa883x->sd_n, 1);
 		ret = dev_err_probe(dev, PTR_ERR(wsa883x->regmap),
 				    "regmap_init failed\n");
 		goto err;
-- 
2.34.1


