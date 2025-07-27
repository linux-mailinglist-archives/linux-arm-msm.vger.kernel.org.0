Return-Path: <linux-arm-msm+bounces-66779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8041B12E9D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jul 2025 10:32:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 735A61729B6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jul 2025 08:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 736B71F17E8;
	Sun, 27 Jul 2025 08:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R9yhgxtj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FC41E98FB
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 08:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753605118; cv=none; b=hpKrCNIaXKIwTGqCRfxBxzHsVJGgzHu7q3CRMNrNvD3tub7X/fj0flyzLKoKgr5cPytvUMCGA25WT2SkcXPazvzpkVe+bMFhNQV2SHqQHmsEEBY+jF9mu7mYZcIf79E1YncndxXPT8IyapSF4mgqLfUVpKJuzXN4bKAxK9yiBcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753605118; c=relaxed/simple;
	bh=KS66tluy4UNZlmHCFuA1cw30RD0JWLP8MtnyXo+u9GA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pJxmRomLy3e9HPAFKiHP5srjzemg62I/PDwnHmOqeTIoC0lB9Yws5EnB6iEl2X1ZNlO+P1M2LCMFxU5FX4kQYEj/B7NrKJlpjGJ7viYa0UY9Dt2RKAaeRxVKQy3nF7KI9NcE/+mkxAB2Cpkv2OW0NDG++OmTd4DW6o5HOv2pvcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R9yhgxtj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56R6NNkI003095
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 08:31:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cMKigYxoZi3
	tizeIAUWIbs/u9lcIMeC06tjZsjaEh/w=; b=R9yhgxtj8p2SJHFnhQziYYWVcu5
	Tg1pBXHiHwN+ScVb4Gt85ZZzCx0WU+ujkY9l31oWNucuo5htmwIzDLBKaM7H26Rm
	lmsKKxLmpvp/161Ug5RQ+ONdqi1PncV+fhwKQMTLoBp2gaKH3LTMEZ2fmU2WrnOt
	+BOVXn/F9f3yhGfNLiloE++IRbcXdPPnh7Za5XrnABtSst6CEYoJ/BtNRPWA3/t/
	I/CVBlkID9fJSR60wKqcdKkzjsMGId8cqiWXEOIF9AVXZHmuxa+r+d5LlRdIaQJk
	m9Hcd+m2TjnnOhzHRuI/rj2LXavl2eblxcYXy3/VJnMsISdxiKSeFPvaEMA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484mqk23p2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 08:31:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24011c9da24so1060125ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 01:31:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753605115; x=1754209915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cMKigYxoZi3tizeIAUWIbs/u9lcIMeC06tjZsjaEh/w=;
        b=Kmw7sVc/VgoEaPh1JrfzSe3zuPRfoHvuObvOUuTLk2V8bbNdTojFaN0MNOGiXodotK
         zF0ue5YcnpQnJ3wX1jkgpCyeXWVYQmI1OuWN/hRbn+DjWwn+ErUlmwsnL5HdMxsZ0GCX
         QgPWISUhcV01UlMbgB0w9GjJoQ8rMXnPEcc9elCWUpAJ3WxyJ97B50k+uGiQqdxQjtdf
         VhTlvu5lNJv8hjYxtqJo50YE3ehmOHcx6mEbRhn+MfUKwCAj10VycZMxeGbSRCVaWPwI
         UG1n4ygJejXYlC97QrUA1mNo0CVs3dpAmhbOgdnr3qcW7E9GJ3TyUY+Th810+u5B06e7
         AdCg==
X-Gm-Message-State: AOJu0YwyqGdNKdAMPCN6T6n0rnOvzVXRYyFtmnJ1y2K4C+V5l16SGufe
	VKT+ISEGVwcuSHpEVGfNY9WDc1Xw09gvRzWJVAEujPHv/z8tjRSRowHOt53Bxf64RftPa4w7W7B
	o1UqLdzYE1wc/lX65qGXWAyYm3udJy13WVftaNUwOag2dS3Jv/Vz3WzcNMjmnF5hFgbMU
X-Gm-Gg: ASbGncvnOMaauBjhyHkl2NQiSBmMTLz+chkU8H9pVAveQPS3h0+PhDzLFwcIU9JRv8n
	WbFarJjgQeyYu/70nepcIv+3lKps0AAQKJFcHJGHdOE23ztbb6EjFLwYboceFuKlvRAFzlmLAF2
	m+uwFxWdVj96udopaTYTWiDeukgeTXBzNSyTU1QaM9Q3gA3IpSjbaggw5Ywmz3FSDjmJxKjGeL+
	mR01GZsl1ZBFchNIrfHedcWkmPEUdoCJaodvnDP+8AD8j96nkwt+DkAXEC2b8tRMypOjrApXY3w
	cawosAPGiJLcIBR+cXyr2mSCjFOOcw6yoHfI7g1S8rNtQHLPS0vxycMrZ1wWwmjGo+5yLlmRFbA
	A
X-Received: by 2002:a17:903:1cb:b0:231:9817:6ec1 with SMTP id d9443c01a7336-23fb2b9994dmr119238265ad.17.1753605115070;
        Sun, 27 Jul 2025 01:31:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQLeWWGe0S+6T/div3h9wg1voIC4vD+r6Hk3Ex4qK4VN/YEmTNOdFlLef3X4nDqrDugTV+ZA==
X-Received: by 2002:a17:903:1cb:b0:231:9817:6ec1 with SMTP id d9443c01a7336-23fb2b9994dmr119237915ad.17.1753605114619;
        Sun, 27 Jul 2025 01:31:54 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2401866c2c3sm2848645ad.30.2025.07.27.01.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 01:31:54 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com
Subject: [PATCH v3 2/3] ASoC: codecs: wsa883x: Add devm action to safely disable regulator on device removal
Date: Sun, 27 Jul 2025 14:01:16 +0530
Message-Id: <20250727083117.2415725-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250727083117.2415725-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250727083117.2415725-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI3MDA3MyBTYWx0ZWRfXyWSDDLLhB9p7
 MYukWRe/ZJkhOfpdbKCpTwv0eZ8QUrsT13NU17aY8gFjodAIhwwnCrFhTKopkUkiINX6sXoOn4q
 b6odbcGumtvYGMZX+sN2Zlx4Qromg91Pd/mBy+BfHoP+tdHNfr9CUyqSXjcH3lemO5R3/4CFGam
 OLqCM3Phao4vmKJFsFWRwe3PsRpkQeUQiIzrP8hhvJUc1vB52ZzNyHl4cmoPpql84hZn0EmUqit
 UG6DTbLCZCHDHzbCMhW23DZmCQZhzqd4EQpVE+8L+pK5x6OeybmALrxIyWtG59bE689y6XLk2Fd
 H2RHCSrNwCXqzOM5b5O/meRnQrYfkRFTVWlzNttqLiJZ/b0hQrXZoDVwe+neN8W5mF8UkP9tbRL
 2Ss1r7ImlUVeGSKCF9jW1pfSE4H9zpTAevplPDqAZKdjZMyoV83WmaxmsyZOeMQ+itbpLI0l
X-Authority-Analysis: v=2.4 cv=fqPcZE4f c=1 sm=1 tr=0 ts=6885e3fc cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Jm80cirAj_4qYY6Vn38A:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: b3GjF0BllWy7uCSq28wF4j9Mbuuhq_L3
X-Proofpoint-ORIG-GUID: b3GjF0BllWy7uCSq28wF4j9Mbuuhq_L3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-27_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 impostorscore=0
 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507270073

To prevent potential warnings from _regulator_put() during device
removal, register a devm-managed cleanup action using
devm_add_action_or_reset() to safely disable the regulator
associated with the WSA883x codec, ensuring that the regulator
is properly disabled when the device is removed, even if the
probe fails or the driver is unloaded unexpectedly.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/wsa883x.c | 44 ++++++++++++++++++++++----------------
 1 file changed, 25 insertions(+), 19 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index 188363b03b93..d5bc71b28a3a 100644
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
@@ -1546,6 +1547,13 @@ static const struct hwmon_chip_info wsa883x_hwmon_chip_info = {
 	.info	= wsa883x_hwmon_info,
 };
 
+static void wsa883x_regulator_disable(void *data)
+{
+	struct wsa883x_priv *wsa883x = data;
+
+	regulator_disable(wsa883x->vdd);
+}
+
 static int wsa883x_probe(struct sdw_slave *pdev,
 			 const struct sdw_device_id *id)
 {
@@ -1566,13 +1574,20 @@ static int wsa883x_probe(struct sdw_slave *pdev,
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to enable vdd regulator\n");
 
+	/*
+	 * Register devm action to safely disable the regulator on device removal.
+	 * This prevents a potential release warning from _regulator_put().
+	 */
+	ret = devm_add_action_or_reset(dev, wsa883x_regulator_disable,
+				       wsa883x);
+	if (ret)
+		return ret;
+
 	wsa883x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
 						GPIOD_FLAGS_BIT_NONEXCLUSIVE | GPIOD_OUT_HIGH);
-	if (IS_ERR(wsa883x->sd_n)) {
-		ret = dev_err_probe(dev, PTR_ERR(wsa883x->sd_n),
-				    "Shutdown Control GPIO not found\n");
-		goto err;
-	}
+	if (IS_ERR(wsa883x->sd_n))
+		return dev_err_probe(dev, PTR_ERR(wsa883x->sd_n),
+				     "Shutdown Control GPIO not found\n");
 
 	dev_set_drvdata(dev, wsa883x);
 	wsa883x->slave = pdev;
@@ -1598,12 +1613,9 @@ static int wsa883x_probe(struct sdw_slave *pdev,
 	gpiod_direction_output(wsa883x->sd_n, 0);
 
 	wsa883x->regmap = devm_regmap_init_sdw(pdev, &wsa883x_regmap_config);
-	if (IS_ERR(wsa883x->regmap)) {
-		gpiod_direction_output(wsa883x->sd_n, 1);
-		ret = dev_err_probe(dev, PTR_ERR(wsa883x->regmap),
-				    "regmap_init failed\n");
-		goto err;
-	}
+	if (IS_ERR(wsa883x->regmap))
+		return dev_err_probe(dev, PTR_ERR(wsa883x->regmap),
+				     "regmap_init failed\n");
 
 	if (IS_REACHABLE(CONFIG_HWMON)) {
 		struct device *hwmon;
@@ -1623,16 +1635,10 @@ static int wsa883x_probe(struct sdw_slave *pdev,
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 
-	ret = devm_snd_soc_register_component(dev,
-					      &wsa883x_component_drv,
+	return devm_snd_soc_register_component(dev,
+					       &wsa883x_component_drv,
 					       wsa883x_dais,
 					       ARRAY_SIZE(wsa883x_dais));
-err:
-	if (ret)
-		regulator_disable(wsa883x->vdd);
-
-	return ret;
-
 }
 
 static int wsa883x_runtime_suspend(struct device *dev)
-- 
2.34.1


