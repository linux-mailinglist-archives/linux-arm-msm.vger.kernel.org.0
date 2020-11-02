Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A7D62A3217
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Nov 2020 18:50:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726027AbgKBRuM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Nov 2020 12:50:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726083AbgKBRuM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Nov 2020 12:50:12 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83DFBC061A47
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2020 09:50:10 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id m16so15989851ljo.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2020 09:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ppiJR77c+oyF2YPqQViuqav70ajnTqRX4XIvZy2HLv8=;
        b=P/MG9Tv8yKh05V+RGDwsfeCaBAy5/EMDL8aqOuQT9DN4ijQpresf3gAV32WrEvUssV
         iVqB5kEkmwfiIB9KAW/FXdAlmunC8CDcG4STquVzRFZ/cNPmq2aUU/Io43tO0kwTBn94
         6isKoUY8MR6L9KCN3roYwIiZgc/SgqMlgYpupkFm4NT2hwpLrDkvRSFM0sGbORSdy9C7
         Z3/iLoDdzUp1bHAQDtkF2vzVpuFHd1Bhzz+IJoigTlDuJ+F9hOW1XAOLgU8skRnAtvYr
         insuKh2K5Jbd/le/Ny7z7opspcMyhsRnqGvBoUMp5zgVHNGlXuxZvPl97QdNhK5BPQ3l
         GyVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ppiJR77c+oyF2YPqQViuqav70ajnTqRX4XIvZy2HLv8=;
        b=L4bk/h8wJ4bRJUJLAZm+8cG/wAv4qXMKXh+TbQFStqG+zWir2AYLs2p7jjJlNp/9K8
         raUmNZ/i6FeWbWfERNcRDpKHjrtHNG2gs6hdHal9zRVfkQWqmq8vrBhd/DHTyq5+Xxjj
         nGTAnQsL+bM3gZJRk8el7Hr1JdcS8mwa1Nuzkw589V9ivvEFJXRb7+87cn9T3l1sKXJQ
         I/5YCjIVuNI9GntO9KHWmE3mJrF7D889X/d019GD7uRmu9G9GDKpcNa+QHYa7VmF34s2
         IDAyn2/Kcw4RF9PYkUifDXatJPEmDqMzNQxB5ir+DN5pT5Uj9wOvKXc2cvR1azNK+xS4
         SnAA==
X-Gm-Message-State: AOAM532O6X6xICG+SnImHMQkqLrk3JDAxp6fv590CR6WObFjHB3jRmRE
        rXhkO5xnMg8flFovRGZ2IEmYqg==
X-Google-Smtp-Source: ABdhPJwYaksJTUNQRk459sHWzLk+fyKa8oM0/yErm94oBk1D9iu+vV7mncVbGFOT59WFGQB2ur5TfA==
X-Received: by 2002:a2e:8145:: with SMTP id t5mr7367577ljg.311.1604339409029;
        Mon, 02 Nov 2020 09:50:09 -0800 (PST)
Received: from eriador.lan ([94.25.229.254])
        by smtp.gmail.com with ESMTPSA id r7sm2516163lfc.206.2020.11.02.09.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 09:50:08 -0800 (PST)
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
Subject: [PATCH v9 05/15] iio: adc: move qcom-vadc-common.h to include dir
Date:   Mon,  2 Nov 2020 20:49:40 +0300
Message-Id: <20201102174950.1148498-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201102174950.1148498-1-dmitry.baryshkov@linaro.org>
References: <20201102174950.1148498-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

qcom-vadc-common module will be used by ADC thermal monitoring driver,
so move it to global include dir.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/iio/adc/qcom-pm8xxx-xoadc.c                   | 3 +--
 drivers/iio/adc/qcom-spmi-adc5.c                      | 2 +-
 drivers/iio/adc/qcom-spmi-vadc.c                      | 3 +--
 drivers/iio/adc/qcom-vadc-common.c                    | 3 +--
 {drivers => include/linux}/iio/adc/qcom-vadc-common.h | 2 ++
 5 files changed, 6 insertions(+), 7 deletions(-)
 rename {drivers => include/linux}/iio/adc/qcom-vadc-common.h (99%)

diff --git a/drivers/iio/adc/qcom-pm8xxx-xoadc.c b/drivers/iio/adc/qcom-pm8xxx-xoadc.c
index 7e108da7d255..0610bf254771 100644
--- a/drivers/iio/adc/qcom-pm8xxx-xoadc.c
+++ b/drivers/iio/adc/qcom-pm8xxx-xoadc.c
@@ -10,6 +10,7 @@
  * Author: Linus Walleij <linus.walleij@linaro.org>
  */
 
+#include <linux/iio/adc/qcom-vadc-common.h>
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
 #include <linux/module.h>
@@ -21,8 +22,6 @@
 #include <linux/interrupt.h>
 #include <linux/regulator/consumer.h>
 
-#include "qcom-vadc-common.h"
-
 /*
  * Definitions for the "user processor" registers lifted from the v3.4
  * Qualcomm tree. Their kernel has two out-of-tree drivers for the ADC:
diff --git a/drivers/iio/adc/qcom-spmi-adc5.c b/drivers/iio/adc/qcom-spmi-adc5.c
index c2da8f068b87..b10a0fcf09dc 100644
--- a/drivers/iio/adc/qcom-spmi-adc5.c
+++ b/drivers/iio/adc/qcom-spmi-adc5.c
@@ -7,6 +7,7 @@
 #include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/err.h>
+#include <linux/iio/adc/qcom-vadc-common.h>
 #include <linux/iio/iio.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
@@ -19,7 +20,6 @@
 #include <linux/slab.h>
 
 #include <dt-bindings/iio/qcom,spmi-vadc.h>
-#include "qcom-vadc-common.h"
 
 #define ADC5_USR_REVISION1			0x0
 #define ADC5_USR_STATUS1			0x8
diff --git a/drivers/iio/adc/qcom-spmi-vadc.c b/drivers/iio/adc/qcom-spmi-vadc.c
index b0388f8a69f4..05ff948372b3 100644
--- a/drivers/iio/adc/qcom-spmi-vadc.c
+++ b/drivers/iio/adc/qcom-spmi-vadc.c
@@ -7,6 +7,7 @@
 #include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/err.h>
+#include <linux/iio/adc/qcom-vadc-common.h>
 #include <linux/iio/iio.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
@@ -20,8 +21,6 @@
 
 #include <dt-bindings/iio/qcom,spmi-vadc.h>
 
-#include "qcom-vadc-common.h"
-
 /* VADC register and bit definitions */
 #define VADC_REVISION2				0x1
 #define VADC_REVISION2_SUPPORTED_VADC		1
diff --git a/drivers/iio/adc/qcom-vadc-common.c b/drivers/iio/adc/qcom-vadc-common.c
index 40d77b3af1bb..ee94774b72e6 100644
--- a/drivers/iio/adc/qcom-vadc-common.c
+++ b/drivers/iio/adc/qcom-vadc-common.c
@@ -3,14 +3,13 @@
 #include <linux/kernel.h>
 #include <linux/bitops.h>
 #include <linux/fixp-arith.h>
+#include <linux/iio/adc/qcom-vadc-common.h>
 #include <linux/math64.h>
 #include <linux/log2.h>
 #include <linux/err.h>
 #include <linux/module.h>
 #include <linux/units.h>
 
-#include "qcom-vadc-common.h"
-
 /* Voltage to temperature */
 static const struct vadc_map_pt adcmap_100k_104ef_104fb[] = {
 	{1758,	-40},
diff --git a/drivers/iio/adc/qcom-vadc-common.h b/include/linux/iio/adc/qcom-vadc-common.h
similarity index 99%
rename from drivers/iio/adc/qcom-vadc-common.h
rename to include/linux/iio/adc/qcom-vadc-common.h
index 7e5f6428e311..03a9119edc71 100644
--- a/drivers/iio/adc/qcom-vadc-common.h
+++ b/include/linux/iio/adc/qcom-vadc-common.h
@@ -6,6 +6,8 @@
 #ifndef QCOM_VADC_COMMON_H
 #define QCOM_VADC_COMMON_H
 
+#include <linux/types.h>
+
 #define VADC_CONV_TIME_MIN_US			2000
 #define VADC_CONV_TIME_MAX_US			2100
 
-- 
2.28.0

