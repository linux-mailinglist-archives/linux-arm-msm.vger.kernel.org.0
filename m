Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EF0F279986
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 15:10:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726956AbgIZNKO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 09:10:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbgIZNKO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 09:10:14 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD32EC0613CE;
        Sat, 26 Sep 2020 06:10:13 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id e17so1975340wme.0;
        Sat, 26 Sep 2020 06:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bl53+IHBE7yXiOLq6WRfnfhUTBMnGEZtbf1LqSaqfOk=;
        b=ZnSoyNQkiRiDnKis+7gq4gVhcbPSrj9eiOj1ylZaZfDdIWqPR245/ny46XRV7/5ZfJ
         p3qv4N2DsenX+E4dHs3u9T8vWtuPhYewSXOYbotPBML7J9FUk4FCRsm2g9KOZwYrmXQT
         gFyKNuxSr4/8LzoSMJsaaUPpIsiaVubGst9xA7l9AVaUIdQ4dVVYLxKdE7zLTWQfRwqv
         wxwtwRsCutaJBQmkBKg27sZdkMR6rCwzaYRuR8drngEjQTDiUzZZrmVCLPU99QlrZmU2
         tX7+Qx0HC2aTt5+P2oy35eBEvNyR853VOjsSIUzv0hPdKYMh2W0FiDPuCqHTFyfKV0W0
         McvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bl53+IHBE7yXiOLq6WRfnfhUTBMnGEZtbf1LqSaqfOk=;
        b=Pv0fvJ7FzEj/41Yefmk9nH3zbRW/hXn3Ib1aKmS/CAg9S0+sW5qqy7/NiB8zc3Az5D
         otX17tbEsXlKJmmMqiaEdCeC+Os+ZZErKiWCaYrXpza6iJ87VARIDiEtH1dJSbtFlvRi
         fL8dwN+9qiG8S4mF3mhxqC9jwWkj7TDeq/hAXlU/GmktOyisr3H0WsXq871bshJigBp6
         2zUyqvqkBtJ7Uwg//Yika7Ua8GuWRGmibChlkYW2FKaH/W0xtSgqoBA1Q2OmeQwk6yXl
         lZwyc4KAUhNVjsd6MY9EzwWK2wwvXAIuA1Nj2/QQwNHZjKpd46rEQGZLmrHzyePdsRqI
         ZjCA==
X-Gm-Message-State: AOAM531G2odd85adCuaI0hvYTlb+fcQeawAEry9d4QqYzzW8hi92IgMg
        FJ8ZHUpmC7bqx+eWeRtcm5I=
X-Google-Smtp-Source: ABdhPJxktGhTd1wTlxJzhDwl+9RINT3g0L/tuSOd7zA+tzc7U7+yuOK85la/ZCWhUgEsWppDJ4RYvg==
X-Received: by 2002:a1c:7308:: with SMTP id d8mr2585996wmb.55.1601125812329;
        Sat, 26 Sep 2020 06:10:12 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id h17sm7196806wro.27.2020.09.26.06.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 06:10:11 -0700 (PDT)
From:   kholk11@gmail.com
To:     agross@kernel.org
Cc:     bjorn.andersson@linaro.org, jic23@kernel.org, robh+dt@kernel.org,
        kholk11@gmail.com, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] iio: adc: qcom-spmi-vadc: Use right ratiometric range for 8998,660,845
Date:   Sat, 26 Sep 2020 15:10:08 +0200
Message-Id: <20200926131009.14483-1-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

The ratiometric range for MSM8998, SDM630/636/660 and SDM845 is 1875mV
instead of the standard 1800mV: address this by adding a new compatible
"qcom,spmi-vadc-8998" and assigning the different range to the machines
declaring this one.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/iio/adc/qcom-spmi-vadc.c   | 10 +++++++++-
 drivers/iio/adc/qcom-vadc-common.h |  1 +
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/qcom-spmi-vadc.c b/drivers/iio/adc/qcom-spmi-vadc.c
index b0388f8a69f4..59a94ea7bf78 100644
--- a/drivers/iio/adc/qcom-spmi-vadc.c
+++ b/drivers/iio/adc/qcom-spmi-vadc.c
@@ -101,6 +101,7 @@ struct vadc_channel_prop {
  * @dev: pointer to struct device.
  * @base: base address for the ADC peripheral.
  * @nchannels: number of VADC channels.
+ * @ratio_range: ratiometric range for ref points.
  * @chan_props: array of VADC channel properties.
  * @iio_chans: array of IIO channels specification.
  * @are_ref_measured: are reference points measured.
@@ -114,6 +115,7 @@ struct vadc_priv {
 	struct device		 *dev;
 	u16			 base;
 	unsigned int		 nchannels;
+	unsigned int		 ratio_range;
 	struct vadc_channel_prop *chan_props;
 	struct iio_chan_spec	 *iio_chans;
 	bool			 are_ref_measured;
@@ -355,7 +357,7 @@ static int vadc_measure_ref_points(struct vadc_priv *vadc)
 	u16 read_1, read_2;
 	int ret;
 
-	vadc->graph[VADC_CALIB_RATIOMETRIC].dx = VADC_RATIOMETRIC_RANGE;
+	vadc->graph[VADC_CALIB_RATIOMETRIC].dx = vadc->ratio_range;
 	vadc->graph[VADC_CALIB_ABSOLUTE].dx = VADC_ABSOLUTE_RANGE_UV;
 
 	prop = vadc_get_channel(vadc, VADC_REF_1250MV);
@@ -885,6 +887,11 @@ static int vadc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	if (of_device_is_compatible(node, "qcom,spmi-vadc-8998"))
+		vadc->ratio_range = VADC_RATIOMETRIC_RANGE_8998;
+	else
+		vadc->ratio_range = VADC_RATIOMETRIC_RANGE;
+
 	irq_eoc = platform_get_irq(pdev, 0);
 	if (irq_eoc < 0) {
 		if (irq_eoc == -EPROBE_DEFER || irq_eoc == -EINVAL)
@@ -918,6 +925,7 @@ static int vadc_probe(struct platform_device *pdev)
 
 static const struct of_device_id vadc_match_table[] = {
 	{ .compatible = "qcom,spmi-vadc" },
+	{ .compatible = "qcom-spmi-vadc-8998" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, vadc_match_table);
diff --git a/drivers/iio/adc/qcom-vadc-common.h b/drivers/iio/adc/qcom-vadc-common.h
index 17b2fc4d8bf2..b10d5fd59034 100644
--- a/drivers/iio/adc/qcom-vadc-common.h
+++ b/drivers/iio/adc/qcom-vadc-common.h
@@ -16,6 +16,7 @@
 
 #define VADC_ABSOLUTE_RANGE_UV			625000
 #define VADC_RATIOMETRIC_RANGE			1800
+#define VADC_RATIOMETRIC_RANGE_8998		1875
 
 #define VADC_DEF_PRESCALING			0 /* 1:1 */
 #define VADC_DEF_DECIMATION			0 /* 512 */
-- 
2.28.0

