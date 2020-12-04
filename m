Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 380C82CE613
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Dec 2020 03:58:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727186AbgLDC5N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Dec 2020 21:57:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727179AbgLDC5M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Dec 2020 21:57:12 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5467DC094255
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Dec 2020 18:55:36 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id j205so5713404lfj.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Dec 2020 18:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TWDLud9pksRg9HazTAZv15V734bI01T2Ycit6ziYb2Y=;
        b=LWgQGT9gwFAhiUltNIB3UaJlXzNe24yhRqXaSgwz9KmOyj9dMStWph5NO/Ay9L7Sfz
         YOugXj1f3n3H7CiDk3629wNruxOE+QUMRxgd0QA1Q5uRocA9ncPWJhp843AwO0d30DEs
         NfACj5Ki62es8b7B3Y3jUIA/eprunRWuySkzqqxc5cKMrvGXAbg27OKixruCfbVnX20r
         DdJRURWDMPCLle/4WSvrOM58qF4RZYxdtj4QZbqxUB7JXA+aQvhId6OtmRZ6YWC5Ogek
         hDKZ+IiXj4lWIur1AZt1uXHpGONpRvbXlnBpYpoO6yZddnVF/FxBYiNjWigwGKycuYsk
         8fWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TWDLud9pksRg9HazTAZv15V734bI01T2Ycit6ziYb2Y=;
        b=CcSbeyNkQjju++t3LdK0iQCJ4bxSxBB6J0SqJ5FfyU+7v+udI+hiaQ8TCYzCcpBkSJ
         VmP12nSJFx1rosOkIaztFRVPazPRVAJBUblGd5bH4d1Jf4x1wgMxDbLxqUuaeY9fRtf8
         vvKRacgAcoyj+y4ZLCN/xyTuUtEnBelnfZQOM7W8wJfB5yLsGjnt3JyQLSSx9CETgBQD
         Ps+yiafTiAMA+soLp2DNl3XOfQ7dNR73hcwUcqDqsS3gOFTM9/ABVjaChyo6nEitbQGR
         IA254ttmp1/CcbWAn0cwDDe0NGjJ0Vi0ChKy+4R2nlbLYfgeSCu73I596Ist9N74EjyP
         OqRg==
X-Gm-Message-State: AOAM5324TS1c/GwaUrJPuuNX3tMYdAnwH+/EpAKaiT+lh5n1xGu5yZUx
        pUPce3CUtI7TRGfJATXLbLEmFQ==
X-Google-Smtp-Source: ABdhPJz921qUVfZaQWKaA0aJ8EMgr+akoEG6gjaINvBRK8PttaOsNaV+x5312bcho3WcypquqrM3dw==
X-Received: by 2002:a05:6512:3453:: with SMTP id j19mr2446184lfr.182.1607050534867;
        Thu, 03 Dec 2020 18:55:34 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.64.117])
        by smtp.gmail.com with ESMTPSA id b8sm1131667ljo.68.2020.12.03.18.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 18:55:34 -0800 (PST)
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
Subject: [PATCH v10 08/15] iio: adc: move vadc_map_pt from header to the source file
Date:   Fri,  4 Dec 2020 05:55:02 +0300
Message-Id: <20201204025509.1075506-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201204025509.1075506-1-dmitry.baryshkov@linaro.org>
References: <20201204025509.1075506-1-dmitry.baryshkov@linaro.org>
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
2.29.2

