Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D5F85702DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jul 2022 14:41:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231717AbiGKMlG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 08:41:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231710AbiGKMkf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 08:40:35 -0400
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C9A9112F
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 05:40:29 -0700 (PDT)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26BCAAMU026688;
        Mon, 11 Jul 2022 08:39:40 -0400
Received: from nwd2mta4.analog.com ([137.71.173.58])
        by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3h76k6bj1g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 Jul 2022 08:39:40 -0400
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
        by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 26BCddgE000431
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 11 Jul 2022 08:39:39 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Mon, 11 Jul 2022 08:39:38 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Mon, 11 Jul 2022 08:39:38 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Mon, 11 Jul 2022 08:39:38 -0400
Received: from nsa.ad.analog.com ([10.44.3.53])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 26BCbVEH011687;
        Mon, 11 Jul 2022 08:39:26 -0400
From:   =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To:     <linux-arm-msm@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
        <linux-renesas-soc@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <linux-imx@nxp.com>,
        <linux-mips@vger.kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <linux-iio@vger.kernel.org>, <chrome-platform@lists.linux.dev>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
CC:     Andy Gross <agross@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Benson Leung <bleung@chromium.org>,
        "Matthias Brugger" <matthias.bgg@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        "Zhang Rui" <rui.zhang@intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "Eugen Hristev" <eugen.hristev@microchip.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        Jishnu Prakash <quic_jprakash@quicinc.com>,
        Christophe Branchereau <cbranchereau@gmail.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        "Michael Hennerich" <Michael.Hennerich@analog.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Cai Huoqing <cai.huoqing@linux.dev>,
        "Fabio Estevam" <festevam@gmail.com>,
        Olivier Moysan <olivier.moysan@foss.st.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Haibo Chen <haibo.chen@nxp.com>,
        "Arnd Bergmann" <arnd@arndb.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "Patrick Venture" <venture@google.com>,
        Amit Kucheria <amitk@kernel.org>,
        "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Gwendal Grignou <gwendal@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Saravanan Sekar <sravanhome@gmail.com>,
        "Guenter Roeck" <groeck@chromium.org>,
        Jonathan Cameron <jic23@kernel.org>,
        "Pengutronix Kernel Team" <kernel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 12/15] iio: adc: qcom-spmi-adc5: convert to device properties
Date:   Mon, 11 Jul 2022 14:38:32 +0200
Message-ID: <20220711123835.811358-13-nuno.sa@analog.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220711123835.811358-1-nuno.sa@analog.com>
References: <20220711123835.811358-1-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: OYUbTQFXNWsNX24vcEdZB3eG1zdv3REc
X-Proofpoint-GUID: OYUbTQFXNWsNX24vcEdZB3eG1zdv3REc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-11_18,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207110054
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Make the conversion to firmware agnostic device properties. As part of
the conversion the IIO inkern interface 'of_xlate()' is also converted to
'fwnode_xlate()'. The goal is to completely drop 'of_xlate' and hence OF
dependencies from IIO.

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/iio/adc/qcom-spmi-adc5.c | 63 +++++++++++++++-----------------
 1 file changed, 30 insertions(+), 33 deletions(-)

diff --git a/drivers/iio/adc/qcom-spmi-adc5.c b/drivers/iio/adc/qcom-spmi-adc5.c
index 87438d1e5c0b..a23f9293d6c1 100644
--- a/drivers/iio/adc/qcom-spmi-adc5.c
+++ b/drivers/iio/adc/qcom-spmi-adc5.c
@@ -14,9 +14,9 @@
 #include <linux/log2.h>
 #include <linux/math64.h>
 #include <linux/module.h>
-#include <linux/of.h>
-#include <linux/of_device.h>
+#include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
@@ -403,8 +403,8 @@ static irqreturn_t adc5_isr(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static int adc5_of_xlate(struct iio_dev *indio_dev,
-				const struct of_phandle_args *iiospec)
+static int adc5_fwnode_xlate(struct iio_dev *indio_dev,
+			     const struct fwnode_reference_args *iiospec)
 {
 	struct adc5_chip *adc = iio_priv(indio_dev);
 	int i;
@@ -416,8 +416,8 @@ static int adc5_of_xlate(struct iio_dev *indio_dev,
 	return -EINVAL;
 }
 
-static int adc7_of_xlate(struct iio_dev *indio_dev,
-				const struct of_phandle_args *iiospec)
+static int adc7_fwnode_xlate(struct iio_dev *indio_dev,
+			     const struct fwnode_reference_args *iiospec)
 {
 	struct adc5_chip *adc = iio_priv(indio_dev);
 	int i, v_channel;
@@ -481,12 +481,12 @@ static int adc7_read_raw(struct iio_dev *indio_dev,
 
 static const struct iio_info adc5_info = {
 	.read_raw = adc5_read_raw,
-	.of_xlate = adc5_of_xlate,
+	.fwnode_xlate = adc5_fwnode_xlate,
 };
 
 static const struct iio_info adc7_info = {
 	.read_raw = adc7_read_raw,
-	.of_xlate = adc7_of_xlate,
+	.fwnode_xlate = adc7_fwnode_xlate,
 };
 
 struct adc5_channels {
@@ -611,18 +611,18 @@ static const struct adc5_channels adc5_chans_rev2[ADC5_MAX_CHANNEL] = {
 					SCALE_HW_CALIB_THERM_100K_PULLUP)
 };
 
-static int adc5_get_dt_channel_data(struct adc5_chip *adc,
+static int adc5_get_fw_channel_data(struct adc5_chip *adc,
 				    struct adc5_channel_prop *prop,
-				    struct device_node *node,
+				    struct fwnode_handle *fwnode,
 				    const struct adc5_data *data)
 {
-	const char *name = node->name, *channel_name;
+	const char *name = fwnode_get_name(fwnode), *channel_name;
 	u32 chan, value, varr[2];
 	u32 sid = 0;
 	int ret;
 	struct device *dev = adc->dev;
 
-	ret = of_property_read_u32(node, "reg", &chan);
+	ret = fwnode_property_read_u32(fwnode, "reg", &chan);
 	if (ret) {
 		dev_err(dev, "invalid channel number %s\n", name);
 		return ret;
@@ -647,15 +647,13 @@ static int adc5_get_dt_channel_data(struct adc5_chip *adc,
 	prop->channel = chan;
 	prop->sid = sid;
 
-	channel_name = of_get_property(node,
-				"label", NULL) ? : node->name;
-	if (!channel_name) {
-		dev_err(dev, "Invalid channel name\n");
-		return -EINVAL;
-	}
+	ret = fwnode_property_read_string(fwnode, "label", &channel_name);
+	if (ret)
+		channel_name = name;
+
 	prop->datasheet_name = channel_name;
 
-	ret = of_property_read_u32(node, "qcom,decimation", &value);
+	ret = fwnode_property_read_u32(fwnode, "qcom,decimation", &value);
 	if (!ret) {
 		ret = qcom_adc5_decimation_from_dt(value, data->decimation);
 		if (ret < 0) {
@@ -668,7 +666,7 @@ static int adc5_get_dt_channel_data(struct adc5_chip *adc,
 		prop->decimation = ADC5_DECIMATION_DEFAULT;
 	}
 
-	ret = of_property_read_u32_array(node, "qcom,pre-scaling", varr, 2);
+	ret = fwnode_property_read_u32_array(fwnode, "qcom,pre-scaling", varr, 2);
 	if (!ret) {
 		ret = qcom_adc5_prescaling_from_dt(varr[0], varr[1]);
 		if (ret < 0) {
@@ -682,7 +680,7 @@ static int adc5_get_dt_channel_data(struct adc5_chip *adc,
 			adc->data->adc_chans[prop->channel].prescale_index;
 	}
 
-	ret = of_property_read_u32(node, "qcom,hw-settle-time", &value);
+	ret = fwnode_property_read_u32(fwnode, "qcom,hw-settle-time", &value);
 	if (!ret) {
 		u8 dig_version[2];
 
@@ -713,7 +711,7 @@ static int adc5_get_dt_channel_data(struct adc5_chip *adc,
 		prop->hw_settle_time = VADC_DEF_HW_SETTLE_TIME;
 	}
 
-	ret = of_property_read_u32(node, "qcom,avg-samples", &value);
+	ret = fwnode_property_read_u32(fwnode, "qcom,avg-samples", &value);
 	if (!ret) {
 		ret = qcom_adc5_avg_samples_from_dt(value);
 		if (ret < 0) {
@@ -726,7 +724,7 @@ static int adc5_get_dt_channel_data(struct adc5_chip *adc,
 		prop->avg_samples = VADC_DEF_AVG_SAMPLES;
 	}
 
-	if (of_property_read_bool(node, "qcom,ratiometric"))
+	if (fwnode_property_read_bool(fwnode, "qcom,ratiometric"))
 		prop->cal_method = ADC5_RATIOMETRIC_CAL;
 	else
 		prop->cal_method = ADC5_ABSOLUTE_CAL;
@@ -801,16 +799,16 @@ static const struct of_device_id adc5_match_table[] = {
 };
 MODULE_DEVICE_TABLE(of, adc5_match_table);
 
-static int adc5_get_dt_data(struct adc5_chip *adc, struct device_node *node)
+static int adc5_get_fw_data(struct adc5_chip *adc)
 {
 	const struct adc5_channels *adc_chan;
 	struct iio_chan_spec *iio_chan;
 	struct adc5_channel_prop prop, *chan_props;
-	struct device_node *child;
+	struct fwnode_handle *child;
 	unsigned int index = 0;
 	int ret;
 
-	adc->nchannels = of_get_available_child_count(node);
+	adc->nchannels = device_get_child_node_count(adc->dev);
 	if (!adc->nchannels)
 		return -EINVAL;
 
@@ -826,14 +824,14 @@ static int adc5_get_dt_data(struct adc5_chip *adc, struct device_node *node)
 
 	chan_props = adc->chan_props;
 	iio_chan = adc->iio_chans;
-	adc->data = of_device_get_match_data(adc->dev);
+	adc->data = device_get_match_data(adc->dev);
 	if (!adc->data)
 		adc->data = &adc5_data_pmic;
 
-	for_each_available_child_of_node(node, child) {
-		ret = adc5_get_dt_channel_data(adc, &prop, child, adc->data);
+	device_for_each_child_node(adc->dev, child) {
+		ret = adc5_get_fw_channel_data(adc, &prop, child, adc->data);
 		if (ret) {
-			of_node_put(child);
+			fwnode_handle_put(child);
 			return ret;
 		}
 
@@ -858,7 +856,6 @@ static int adc5_get_dt_data(struct adc5_chip *adc, struct device_node *node)
 
 static int adc5_probe(struct platform_device *pdev)
 {
-	struct device_node *node = pdev->dev.of_node;
 	struct device *dev = &pdev->dev;
 	struct iio_dev *indio_dev;
 	struct adc5_chip *adc;
@@ -870,7 +867,7 @@ static int adc5_probe(struct platform_device *pdev)
 	if (!regmap)
 		return -ENODEV;
 
-	ret = of_property_read_u32(node, "reg", &reg);
+	ret = device_property_read_u32(dev, "reg", &reg);
 	if (ret < 0)
 		return ret;
 
@@ -886,7 +883,7 @@ static int adc5_probe(struct platform_device *pdev)
 	init_completion(&adc->complete);
 	mutex_init(&adc->lock);
 
-	ret = adc5_get_dt_data(adc, node);
+	ret = adc5_get_fw_data(adc);
 	if (ret) {
 		dev_err(dev, "adc get dt data failed\n");
 		return ret;
-- 
2.37.0

