Return-Path: <linux-arm-msm+bounces-61883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A3BAE18DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 12:31:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28C4B3A2947
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 10:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EEBA284B3A;
	Fri, 20 Jun 2025 10:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xm2UK1op"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C4D2874EA
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 10:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750415447; cv=none; b=rtlcdRaxx/hryIgtpOWTQcvQ0BvKXyjfU/XFd7KU9QtDMRPSpcq2GVz3Omf+w2GEgJPyS6+DXE1FHh3HDd8tWpscWAgpTJGRVFeZrsIFsBHduXViDxgOKqaGzrk5Fmrve901PKjHG/I+EormINBHx5vOf8zfWSZ7g1JfAz/QMAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750415447; c=relaxed/simple;
	bh=bbxaUsU/ka58nAhmBhenyOaPkSWvg3S0shWSJ/g+NV8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fR0eL8DjuSpA10J2e2yb6tj0qkV4pVt/N72QAbloXItj1/0THUzj5UPAgb7CiSlSQaVEBhYKAt8+4feEspXsbXlpaFBAbb2zQZEgOK1kV/GYTrjIZ9sqkL4aHxajlNI4nNXWa3eSoNBmu+5evJLFL/lrES85igtETMkFpmbj3mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xm2UK1op; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K5bKG5020136
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 10:30:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TU8mtSZU0G3
	e/vpytaHll2AVzRvf35xT6/rG2wBi1+U=; b=Xm2UK1opIwo2VuHAhy/7NgUMzok
	XIgk6n7VC60ycGcRim/Pjv/lJNhiH9yksLLb90NOxkYrWrMIlarp8nRbTZxB54YP
	AieQcG6/nRA2oW09EzE/GdrJALeJbGCCpmq7OPIZOVHQujUKGoQ4RO+grvkB1x5D
	Jl+0q26gbrSvyXYyKmKwJtJSGEbfUsZXenbNvo1gbAGC2YyDnA3zvgnn9JeGckeW
	FuMSR7cWA91SLNL7T+N5q9TEAlIuPDV9zhkj+fbniMFIWp0UtRDYJxYeHG7W45Pz
	ncyclO5s5NpDH0mcbl/DnPm3qOaAbaJUdGuznsGlFq6WEq03ns8tKZ+QZRg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 479qp61kcm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 10:30:44 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-74834bc5d37so2729154b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 03:30:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750415444; x=1751020244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TU8mtSZU0G3e/vpytaHll2AVzRvf35xT6/rG2wBi1+U=;
        b=UWdxYOORH1zSq5D/4h0gwKusuivCj8rEfqFpzRvjKCGovJcHUFWq8sidSDERYsa37a
         PWaabZkK/I1vjnGMc3zH9VR2OTW/CAdXRI5wO+kTjBXKNDY42E81PFc5kdhhvhoKa+wT
         crt6dLeaGY9Rtx0l0n4SDTMP+PmLhSjvSr/PD6njqY1Zv7solyZ+Z8fIV8KgNRxN7KMt
         w69NZkg3vc+DpSvnCwY68Krr9uLcHbVbAquqWHDxfCdJ5Ohz/goK2L43TcQ8aHvhv3r8
         ZuMKbICqYybNDociCdPBrTffqwabqePeW6EHdDoToRJ05EaVeg8WhU8G1XziuT2GrjbN
         ttUw==
X-Gm-Message-State: AOJu0YyFhkSapBKzEBjXoO4HZIDxffNNr9wf8ewNJ/mUotcdMhLK2kkT
	FCi4vqQibjBiNxp4exqbha55aHkKGoDlYbdkwiaPnqpLd8O9MfHhy4okSF+7rVo1WFCeMxdkVVj
	irTbhv+rOFPu33Be2uaT18OO1YDLUg9LLWkL2MyLFGxfFV85BM4yVw1ahUlPPki9l2xJX
X-Gm-Gg: ASbGncvAJKzwwp9mn8/7x/q/5lrTdlk9uPVTLVaMfyctCsBlq4/Z7GbfKWApH/bXcEf
	7TzOrqgeXD0I6toH3yAEYl/fXpHHxlF+MAbxf7waWATMrHOkA9cB1vJ3E/5pjC+97nOMtaz6mV7
	KAmSs65IIp0Usi8muuzldpokcj2myGMwy1Hl1ckJjROhmzv7fboP7G+QlrnP3dUe/MGqoANHThY
	BShJ1BgCGP7iHRL+K/Y9jqlsIfZAQhiQE60+hTTiytX4uL8Rr8Pez+yw148gMB5vCLpogBpHXEx
	WFOrz2DDL/j5RMhQtnAIBsjYqrxUO7Vy3WRm3/SFYfzWOYF1/XUiFe2pj6g=
X-Received: by 2002:a05:6a20:e616:b0:1f5:8a1d:3905 with SMTP id adf61e73a8af0-22026d2a7ddmr3949869637.7.1750415443810;
        Fri, 20 Jun 2025 03:30:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbABCw6JW0Oz+95JAMsrKVWxcJJvpq0lO029mDpH7UZsS9QxxUAUwGtMnwmvH7CIQbnMGnow==
X-Received: by 2002:a05:6a20:e616:b0:1f5:8a1d:3905 with SMTP id adf61e73a8af0-22026d2a7ddmr3949816637.7.1750415443400;
        Fri, 20 Jun 2025 03:30:43 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a69f3e2sm1651347b3a.159.2025.06.20.03.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 03:30:43 -0700 (PDT)
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
Subject: [PATCH v1 2/2] ASoC: codecs: wsa883x: Handle shared reset GPIO for WSA883x speakers
Date: Fri, 20 Jun 2025 16:00:12 +0530
Message-Id: <20250620103012.360794-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250620103012.360794-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250620103012.360794-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3cKwGXFBDO_xEbCLYvHLwSKImRJg1CEa
X-Proofpoint-ORIG-GUID: 3cKwGXFBDO_xEbCLYvHLwSKImRJg1CEa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA3NiBTYWx0ZWRfXyYNqBz88CJLy
 U4oz/E7OwCATwfpIkyAUU6yNWzrcPePKUJIJqrChzlhnZ9hhUUv1+wlVaxpRzlABfsnyq5CcXr3
 798b22iHti0ICTQ8RpcOD6Gw14FbeVs40BiULvr4Dt6WrU53tEqDFqkk4BIgiKGYJ/IoegKEnJp
 qI0nqAMUwoL6Mi2jFI0DM5VnSAIeWnM6bVE722ZL5rSANMRnQ2whC90fFDnZXHHMlbSJo5byiEI
 8YoCnhUFf/SrN8NfkVl1uLV3BbHo8MyV3YZkLAY4zHYYQOhCqjOscF2r6IqL2rgYcnsm4vl4kKg
 rrdiWMO0rkc699O3goW6R/goabxjO8we1Bb80wfdurBniUM6pvw+LxATLeHFSjcgTzkQw+0iTW2
 RuzL5qFBhewodGPlclOApEMjiRTVGjg0zom+7vCH+l0FRh6/J5aA156SK683JDo866azhPfB
X-Authority-Analysis: v=2.4 cv=fMc53Yae c=1 sm=1 tr=0 ts=68553854 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=pGReym1pqKqKmaA-xlUA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_04,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506200076

On some Qualcomm platforms, such as QCS6490-RB3Gen2 and QCM6490-IDP,
multiple WSA8830/WSA8835 speakers share a common reset (shutdown) GPIO.
To handle such cases, use the reset controller framework along with the
"reset-gpio" driver.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/wsa883x.c | 57 ++++++++++++++++++++++++++++++++------
 1 file changed, 48 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index 13c9d4a6f015..b82b925c1f8d 100644
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
@@ -1547,6 +1549,44 @@ static const struct hwmon_chip_info wsa883x_hwmon_chip_info = {
 	.info	= wsa883x_hwmon_info,
 };
 
+static void wsa883x_reset_powerdown(void *data)
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
+	else if (wsa883x->sd_reset)
+		return 0;
+	/*
+	 * else: NULL, so use the backwards compatible way for powerdown-gpios,
+	 * which does not handle sharing GPIO properly.
+	 */
+	wsa883x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
+						GPIOD_FLAGS_BIT_NONEXCLUSIVE | GPIOD_OUT_HIGH);
+	if (IS_ERR(wsa883x->sd_n))
+		return dev_err_probe(dev, PTR_ERR(wsa883x->sd_n),
+				     "Shutdown Control GPIO not found\n");
+	return 0;
+}
+
 static int wsa883x_probe(struct sdw_slave *pdev,
 			 const struct sdw_device_id *id)
 {
@@ -1567,13 +1607,9 @@ static int wsa883x_probe(struct sdw_slave *pdev,
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to enable vdd regulator\n");
 
-	wsa883x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
-						GPIOD_FLAGS_BIT_NONEXCLUSIVE | GPIOD_OUT_HIGH);
-	if (IS_ERR(wsa883x->sd_n)) {
-		ret = dev_err_probe(dev, PTR_ERR(wsa883x->sd_n),
-				    "Shutdown Control GPIO not found\n");
-		goto err;
-	}
+	ret = wsa883x_get_reset(dev, wsa883x);
+	if (ret)
+		return ret;
 
 	dev_set_drvdata(dev, wsa883x);
 	wsa883x->slave = pdev;
@@ -1596,11 +1632,14 @@ static int wsa883x_probe(struct sdw_slave *pdev,
 	pdev->prop.simple_clk_stop_capable = true;
 	pdev->prop.sink_dpn_prop = wsa_sink_dpn_prop;
 	pdev->prop.scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
-	gpiod_direction_output(wsa883x->sd_n, 0);
+
+	wsa883x_reset_deassert(wsa883x);
+	ret = devm_add_action_or_reset(dev, wsa883x_reset_powerdown, wsa883x);
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


