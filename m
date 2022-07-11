Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E21DF5702D0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jul 2022 14:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231752AbiGKMkh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 08:40:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231904AbiGKMkT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 08:40:19 -0400
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28B493C8DB
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 05:40:12 -0700 (PDT)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26B9UG2d026759;
        Mon, 11 Jul 2022 08:39:25 -0400
Received: from nwd2mta4.analog.com ([137.71.173.58])
        by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3h76k6bj0c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 Jul 2022 08:39:25 -0400
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
        by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 26BCdNqc000428
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 11 Jul 2022 08:39:23 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Mon, 11 Jul
 2022 08:39:22 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Mon, 11 Jul 2022 08:39:22 -0400
Received: from nsa.ad.analog.com ([10.44.3.53])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 26BCbVEF011687;
        Mon, 11 Jul 2022 08:39:13 -0400
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
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Zhang Rui <rui.zhang@intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        Jishnu Prakash <quic_jprakash@quicinc.com>,
        Christophe Branchereau <cbranchereau@gmail.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Cai Huoqing <cai.huoqing@linux.dev>,
        Fabio Estevam <festevam@gmail.com>,
        Olivier Moysan <olivier.moysan@foss.st.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Haibo Chen <haibo.chen@nxp.com>, Arnd Bergmann <arnd@arndb.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Patrick Venture <venture@google.com>,
        Amit Kucheria <amitk@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Gwendal Grignou <gwendal@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Saravanan Sekar <sravanhome@gmail.com>,
        Guenter Roeck <groeck@chromium.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 10/15] iio: adc: qcom-pm8xxx-xoadc: convert to device properties
Date:   Mon, 11 Jul 2022 14:38:30 +0200
Message-ID: <20220711123835.811358-11-nuno.sa@analog.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220711123835.811358-1-nuno.sa@analog.com>
References: <20220711123835.811358-1-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: 4Nn9wTRGEfKN_uiG-ACzcJdWMxnHpffh
X-Proofpoint-GUID: 4Nn9wTRGEfKN_uiG-ACzcJdWMxnHpffh
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
 drivers/iio/adc/qcom-pm8xxx-xoadc.c | 58 ++++++++++++++---------------
 1 file changed, 28 insertions(+), 30 deletions(-)

diff --git a/drivers/iio/adc/qcom-pm8xxx-xoadc.c b/drivers/iio/adc/qcom-pm8xxx-xoadc.c
index 5e9e56821075..eb424496ee1d 100644
--- a/drivers/iio/adc/qcom-pm8xxx-xoadc.c
+++ b/drivers/iio/adc/qcom-pm8xxx-xoadc.c
@@ -14,9 +14,9 @@
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
 #include <linux/module.h>
-#include <linux/of.h>
-#include <linux/of_device.h>
+#include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
@@ -694,8 +694,8 @@ static int pm8xxx_read_raw(struct iio_dev *indio_dev,
 	}
 }
 
-static int pm8xxx_of_xlate(struct iio_dev *indio_dev,
-			   const struct of_phandle_args *iiospec)
+static int pm8xxx_fwnode_xlate(struct iio_dev *indio_dev,
+			       const struct fwnode_reference_args *iiospec)
 {
 	struct pm8xxx_xoadc *adc = iio_priv(indio_dev);
 	u8 pre_scale_mux;
@@ -706,10 +706,10 @@ static int pm8xxx_of_xlate(struct iio_dev *indio_dev,
 	 * First cell is prescaler or premux, second cell is analog
 	 * mux.
 	 */
-	if (iiospec->args_count != 2) {
-		dev_err(&indio_dev->dev, "wrong number of arguments for %pOFn need 2 got %d\n",
-			iiospec->np,
-			iiospec->args_count);
+	if (iiospec->nargs != 2) {
+		dev_err(&indio_dev->dev, "wrong number of arguments for %pfwP need 2 got %d\n",
+			iiospec->fwnode,
+			iiospec->nargs);
 		return -EINVAL;
 	}
 	pre_scale_mux = (u8)iiospec->args[0];
@@ -727,34 +727,34 @@ static int pm8xxx_of_xlate(struct iio_dev *indio_dev,
 }
 
 static const struct iio_info pm8xxx_xoadc_info = {
-	.of_xlate = pm8xxx_of_xlate,
+	.fwnode_xlate = pm8xxx_fwnode_xlate,
 	.read_raw = pm8xxx_read_raw,
 };
 
 static int pm8xxx_xoadc_parse_channel(struct device *dev,
-				      struct device_node *np,
+				      struct fwnode_handle *fwnode,
 				      const struct xoadc_channel *hw_channels,
 				      struct iio_chan_spec *iio_chan,
 				      struct pm8xxx_chan_info *ch)
 {
-	const char *name = np->name;
+	const char *name = fwnode_get_name(fwnode);
 	const struct xoadc_channel *hwchan;
-	u32 pre_scale_mux, amux_channel;
+	u32 pre_scale_mux, amux_channel, reg[2];
 	u32 rsv, dec;
 	int ret;
 	int chid;
 
-	ret = of_property_read_u32_index(np, "reg", 0, &pre_scale_mux);
+	ret = fwnode_property_read_u32_array(fwnode, "reg", reg,
+					     ARRAY_SIZE(reg));
 	if (ret) {
-		dev_err(dev, "invalid pre scale/mux number %s\n", name);
-		return ret;
-	}
-	ret = of_property_read_u32_index(np, "reg", 1, &amux_channel);
-	if (ret) {
-		dev_err(dev, "invalid amux channel number %s\n", name);
+		dev_err(dev, "invalid pre scale/mux or amux channel number %s\n",
+			name);
 		return ret;
 	}
 
+	pre_scale_mux = reg[0];
+	amux_channel = reg[1];
+
 	/* Find the right channel setting */
 	chid = 0;
 	hwchan = &hw_channels[0];
@@ -778,7 +778,7 @@ static int pm8xxx_xoadc_parse_channel(struct device *dev,
 	/* Everyone seems to use default ("type 2") decimation */
 	ch->decimation = VADC_DEF_DECIMATION;
 
-	if (!of_property_read_u32(np, "qcom,ratiometric", &rsv)) {
+	if (!fwnode_property_read_u32(fwnode, "qcom,ratiometric", &rsv)) {
 		ch->calibration = VADC_CALIB_RATIOMETRIC;
 		if (rsv > XOADC_RSV_MAX) {
 			dev_err(dev, "%s too large RSV value %d\n", name, rsv);
@@ -791,7 +791,7 @@ static int pm8xxx_xoadc_parse_channel(struct device *dev,
 	}
 
 	/* Optional decimation, if omitted we use the default */
-	ret = of_property_read_u32(np, "qcom,decimation", &dec);
+	ret = fwnode_property_read_u32(fwnode, "qcom,decimation", &dec);
 	if (!ret) {
 		ret = qcom_vadc_decimation_from_dt(dec);
 		if (ret < 0) {
@@ -820,15 +820,14 @@ static int pm8xxx_xoadc_parse_channel(struct device *dev,
 	return 0;
 }
 
-static int pm8xxx_xoadc_parse_channels(struct pm8xxx_xoadc *adc,
-				       struct device_node *np)
+static int pm8xxx_xoadc_parse_channels(struct pm8xxx_xoadc *adc)
 {
-	struct device_node *child;
+	struct fwnode_handle *child;
 	struct pm8xxx_chan_info *ch;
 	int ret;
 	int i;
 
-	adc->nchans = of_get_available_child_count(np);
+	adc->nchans = device_get_child_node_count(adc->dev);
 	if (!adc->nchans) {
 		dev_err(adc->dev, "no channel children\n");
 		return -ENODEV;
@@ -846,14 +845,14 @@ static int pm8xxx_xoadc_parse_channels(struct pm8xxx_xoadc *adc,
 		return -ENOMEM;
 
 	i = 0;
-	for_each_available_child_of_node(np, child) {
+	device_for_each_child_node(adc->dev, child) {
 		ch = &adc->chans[i];
 		ret = pm8xxx_xoadc_parse_channel(adc->dev, child,
 						 adc->variant->channels,
 						 &adc->iio_chans[i],
 						 ch);
 		if (ret) {
-			of_node_put(child);
+			fwnode_handle_put(child);
 			return ret;
 		}
 		i++;
@@ -884,12 +883,11 @@ static int pm8xxx_xoadc_probe(struct platform_device *pdev)
 	const struct xoadc_variant *variant;
 	struct pm8xxx_xoadc *adc;
 	struct iio_dev *indio_dev;
-	struct device_node *np = pdev->dev.of_node;
 	struct regmap *map;
 	struct device *dev = &pdev->dev;
 	int ret;
 
-	variant = of_device_get_match_data(dev);
+	variant = device_get_match_data(dev);
 	if (!variant)
 		return -ENODEV;
 
@@ -904,7 +902,7 @@ static int pm8xxx_xoadc_probe(struct platform_device *pdev)
 	init_completion(&adc->complete);
 	mutex_init(&adc->lock);
 
-	ret = pm8xxx_xoadc_parse_channels(adc, np);
+	ret = pm8xxx_xoadc_parse_channels(adc);
 	if (ret)
 		return ret;
 
-- 
2.37.0

