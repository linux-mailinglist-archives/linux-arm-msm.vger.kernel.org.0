Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 163972CE621
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Dec 2020 03:58:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727289AbgLDC50 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Dec 2020 21:57:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727281AbgLDC5Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Dec 2020 21:57:25 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 565EFC094250
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Dec 2020 18:55:31 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id j205so5713240lfj.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Dec 2020 18:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fdozn1iYzMMjpKJN5NGb/8zh5XeUDLh4+Oq5oqMMC8M=;
        b=EslvcfVFhIoT8ToCVYKz+uQhuz/c8/KnM+blwcA//rp3dw3yN/roLaQUDSPgPidE+E
         Yyy3tJya3ErmFZ9HepOkzjnx+XDr1pcI3daP/6TYz4VvGuO8m6cjJt2Onn3GsfI0hTzt
         2BU1Jd5E7xywiLvEouXzIkw/cA9PsFNIJqqFM9pwKGFk0ihe01/cxUEIFE41LhK3Hw/k
         n0SB05zqrt4U+x04VzT/v3or9kGSmR/6HeQVx3bfPo+HGEVnSyOKrU8M7VoCf7UAj6cc
         FPIGRt/1EERCOH1IEvcPoslslcXzf7P/Jwcg6FG30AJenUzgAFyBI1dZsKHT8xAZ15Gv
         I7vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fdozn1iYzMMjpKJN5NGb/8zh5XeUDLh4+Oq5oqMMC8M=;
        b=fk0+p3JL49kZtYeVSsU7tEOAjuBb3o7WtuDXbaUKxN4RaTnTYwZEVc+0k0u1X7MeXU
         XKQ5jqJMHfItgQODK0ON5EFeq4g10xMZjAuC1mBVbNHIs+9h3Y0lxavzsGRUj/KbNY/y
         EcPRu9Kjd3VLzogd1G5yUssvOoF1YnC6d2jlEHE0AWHU6lZKT60wY6jwGn4txSluLLBu
         yz0grtE3Wb//FTthc0CYqsoXh2YrRFUhH/VG+6QG4xnE5NYaSR1Nka7gimgh+oQ/kMaw
         HKfv9TxzsEbDM5eFOqkww46DtJtQkFqsZb0JTOIzgsGOPe+61NvNU4X5kwmwsoA4qgzL
         AZ3A==
X-Gm-Message-State: AOAM531ww5Y1vXHLTmSTYTwpqwTVPHvvpEquBcO7AnZhjTXfwluZEWNW
        akhCt4CqRe8qbZVJ6a20To9exg==
X-Google-Smtp-Source: ABdhPJzBKx0pLSJ0JkkNh2NCIHdRv4eFyd9aBQD8FA4/EDr8ikvHrc5/6jx2c3FHEpEHR6a7FQugkg==
X-Received: by 2002:a19:cd6:: with SMTP id 205mr2380277lfm.117.1607050529867;
        Thu, 03 Dec 2020 18:55:29 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.64.117])
        by smtp.gmail.com with ESMTPSA id b8sm1131667ljo.68.2020.12.03.18.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 18:55:29 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-iio@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jishnu Prakash <jprakash@qti.qualcomm.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v10 06/15] iio: adc: qcom-spmi-adc5: use of_device_get_match_data
Date:   Fri,  4 Dec 2020 05:55:00 +0300
Message-Id: <20201204025509.1075506-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201204025509.1075506-1-dmitry.baryshkov@linaro.org>
References: <20201204025509.1075506-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use of_device_get_match_data() instead of hand-coding it manually.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/iio/adc/qcom-spmi-adc5.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/iio/adc/qcom-spmi-adc5.c b/drivers/iio/adc/qcom-spmi-adc5.c
index b10a0fcf09dc..87438d1e5c0b 100644
--- a/drivers/iio/adc/qcom-spmi-adc5.c
+++ b/drivers/iio/adc/qcom-spmi-adc5.c
@@ -15,6 +15,7 @@
 #include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
@@ -807,8 +808,6 @@ static int adc5_get_dt_data(struct adc5_chip *adc, struct device_node *node)
 	struct adc5_channel_prop prop, *chan_props;
 	struct device_node *child;
 	unsigned int index = 0;
-	const struct of_device_id *id;
-	const struct adc5_data *data;
 	int ret;
 
 	adc->nchannels = of_get_available_child_count(node);
@@ -827,24 +826,21 @@ static int adc5_get_dt_data(struct adc5_chip *adc, struct device_node *node)
 
 	chan_props = adc->chan_props;
 	iio_chan = adc->iio_chans;
-	id = of_match_node(adc5_match_table, node);
-	if (id)
-		data = id->data;
-	else
-		data = &adc5_data_pmic;
-	adc->data = data;
+	adc->data = of_device_get_match_data(adc->dev);
+	if (!adc->data)
+		adc->data = &adc5_data_pmic;
 
 	for_each_available_child_of_node(node, child) {
-		ret = adc5_get_dt_channel_data(adc, &prop, child, data);
+		ret = adc5_get_dt_channel_data(adc, &prop, child, adc->data);
 		if (ret) {
 			of_node_put(child);
 			return ret;
 		}
 
 		prop.scale_fn_type =
-			data->adc_chans[prop.channel].scale_fn_type;
+			adc->data->adc_chans[prop.channel].scale_fn_type;
 		*chan_props = prop;
-		adc_chan = &data->adc_chans[prop.channel];
+		adc_chan = &adc->data->adc_chans[prop.channel];
 
 		iio_chan->channel = prop.channel;
 		iio_chan->datasheet_name = prop.datasheet_name;
-- 
2.29.2

