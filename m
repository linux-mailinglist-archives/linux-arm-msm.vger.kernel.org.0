Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A3812A3222
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Nov 2020 18:50:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbgKBRuT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Nov 2020 12:50:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726066AbgKBRuT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Nov 2020 12:50:19 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08BC2C0617A6
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2020 09:50:18 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id i2so16011592ljg.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2020 09:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MLJDam9YZO/BSJWiAfTXxsDL90ZL6TSe3ltuj59sqKE=;
        b=gcv1H0AT8pLx0snIkNFAlm42XQi1jNl+YXSfpukI1uB9plErCnxobO84/Qchq7NabP
         y4jOzLK4wAJ4goe5kQfGF+Pv1kiV3MA63Ty8cCRhUlNlm4IBtxRJ+oakZltPr9m8pj94
         3W9d64NmfHrK3Q3U0oHECAKlkzwOm61m/7UKngsMU3P9bLEwuuYjCUXKpXOK4PveMBQA
         izRTndXIwj3XIjj+pOmF3VDA4IDrREqcKb2eyfNYO6N0iSAM3cIql9sTlq3IWO9Se0tz
         IsydvxbuUaPj6f1FY6uGSDn4mhMvG6mwsNgAZsH5DpzEougE3yuN7V98kIubGo5JFzJp
         5FBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MLJDam9YZO/BSJWiAfTXxsDL90ZL6TSe3ltuj59sqKE=;
        b=ntedwoHJ5p3RegSpKexlwXRZfhseKUgPOmFOfvH2/M9uHBhmB63UF0yZLUXExZRCLG
         B4dy5Lpf17O/7RLRchlBOZO+dJmH8oqBhEsSh/T1f+lZT5lvKpyKw/dUKUSwEpNTQdnu
         A/fSkBnXtJgTplx6AI//mlS4PYGuTXq38mY9U+j6meSZLIwbGdO4dzMH4/nN+WdjuujD
         z7p87WkcnCFyIUHE9bjEYUo4ynxhT+363hff5Ycjo7KAPfT3YHpW+rGtPfTWhoZll+hH
         AsSXYr2bzEWAxZIwz1I0NrxA4wgEj8e2SlAVSJmxEEz16L3KPfyqjn5gDFmz08nsa9L/
         0fLw==
X-Gm-Message-State: AOAM531kC89USU4f8r4L7o2u2Q+eZnrzA6qEDopLfz9AcWjEmaVriGiL
        RAIRkI0tON+n40y4VF0WtXTyLQ==
X-Google-Smtp-Source: ABdhPJyVLov5zQjgM88vzHgWJH78NzUmCQNdx7ux75oTGFXBguFqnu1iIKG9KSrUSgRXQCvA2gXKVw==
X-Received: by 2002:a05:651c:101:: with SMTP id a1mr6573873ljb.451.1604339416547;
        Mon, 02 Nov 2020 09:50:16 -0800 (PST)
Received: from eriador.lan ([94.25.229.254])
        by smtp.gmail.com with ESMTPSA id r7sm2516163lfc.206.2020.11.02.09.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 09:50:15 -0800 (PST)
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
        Jishnu Prakash <jprakash@qti.qualcomm.com>
Subject: [PATCH v9 08/15] iio: adc: move vadc_map_pt from header to the source file
Date:   Mon,  2 Nov 2020 20:49:43 +0300
Message-Id: <20201102174950.1148498-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201102174950.1148498-1-dmitry.baryshkov@linaro.org>
References: <20201102174950.1148498-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

struct vadc_map_pt is not used outside of qcom-vadc-common.c, so move it
there from the global header file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/iio/adc/qcom-vadc-common.c       | 11 +++++++++++
 include/linux/iio/adc/qcom-vadc-common.h | 11 -----------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/iio/adc/qcom-vadc-common.c b/drivers/iio/adc/qcom-vadc-common.c
index ee94774b72e6..45a38602f66a 100644
--- a/drivers/iio/adc/qcom-vadc-common.c
+++ b/drivers/iio/adc/qcom-vadc-common.c
@@ -10,6 +10,17 @@
 #include <linux/module.h>
 #include <linux/units.h>
 
+/**
+ * struct vadc_map_pt - Map the graph representation for ADC channel
+ * @x: Represent the ADC digitized code.
+ * @y: Represent the physical data which can be temperature, voltage,
+ *     resistance.
+ */
+struct vadc_map_pt {
+	s32 x;
+	s32 y;
+};
+
 /* Voltage to temperature */
 static const struct vadc_map_pt adcmap_100k_104ef_104fb[] = {
 	{1758,	-40},
diff --git a/include/linux/iio/adc/qcom-vadc-common.h b/include/linux/iio/adc/qcom-vadc-common.h
index 03a9119edc71..1d337dd9e3dc 100644
--- a/include/linux/iio/adc/qcom-vadc-common.h
+++ b/include/linux/iio/adc/qcom-vadc-common.h
@@ -59,17 +59,6 @@
 #define DIE_TEMP_ADC7_SCALE_FACTOR		1000
 #define DIE_TEMP_ADC7_MAX			160000
 
-/**
- * struct vadc_map_pt - Map the graph representation for ADC channel
- * @x: Represent the ADC digitized code.
- * @y: Represent the physical data which can be temperature, voltage,
- *     resistance.
- */
-struct vadc_map_pt {
-	s32 x;
-	s32 y;
-};
-
 /*
  * VADC_CALIB_ABSOLUTE: uses the 625mV and 1.25V as reference channels.
  * VADC_CALIB_RATIOMETRIC: uses the reference voltage (1.8V) and GND for
-- 
2.28.0

