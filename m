Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0F972690CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Sep 2020 17:57:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726296AbgINP5T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Sep 2020 11:57:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726239AbgINPsd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Sep 2020 11:48:33 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 259BDC061220
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2020 08:48:31 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id x69so13974680lff.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2020 08:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SyrNRlrzgocwFtm4m1D+vgyjZWlJZcz7p/Dz+/oWD3I=;
        b=NDjOuKuq0ir6imwOA3BARFgMik89YDK4R/uxZnkdax0YDfc0nrWUbA7C3SYaWWJjm/
         DMOwc5DDkuEKFdcd9o5Qd8M+G2xp8OqqdTDwlu2xVylKW4suTKLoJdbW/cp546payEQg
         wS9JgwqQFW/LLynwetNH8vHnJuJ/69KtgANHCPx8d447klqqSPGJw1a/ER3nyxeYiwtr
         Q/SLCMOAP/ZjhXlCX4ozanJpJtmxgBTLYgaSO6oNHNjtdNe5XTnz9h5+ZfNq+kR8Lafe
         bRcTcf3n2xVZ6x6Ddk2tn99EUePeODiAUfEW7DSJlat1ov/mSzSCWKQ/g/DsgPOIyqUJ
         QGVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SyrNRlrzgocwFtm4m1D+vgyjZWlJZcz7p/Dz+/oWD3I=;
        b=Aoqv1vpFpRCBMaixe93vsuEov09X/SM9QaqAHQ5sWV2HDRMLAU9BueXU0SGu0fcM9t
         GEa4BNQ1vdY8PFY22o4cTp8pBZEyzdT1mWUjoQruY+8lpJyBFE5d5/+/558AfsotcH83
         OzJvIsfeAT4X4Bmi03BRL13yq353hd3GeKgxu0il7BmXNwMYnN1pmrX35XYyWFz77XTf
         nkzdb9n+ifBhoX9Axp4xM3HAVxeT7XG/PABCefp7ya8M/4OGwmcUUTEbkaxjyZjEoFpf
         gpds1Ipq8W3lSbXlFbau6YA0O5NF7SdUPEHkjByo5ZxxZJEM2iadrczXeUTsGOTFAJgO
         tw5g==
X-Gm-Message-State: AOAM5326KR7wjBvC/4qDRnR1S0+HPMSZnLaJmZciSsMRoDz1kqVftGTC
        c5vyjFMgSLdm68yowCshgUh+pw==
X-Google-Smtp-Source: ABdhPJx8oyBJT0AivzVhkW6/0QdA3t2Lg4Oc9CjKM0/HsAL0AaGJL1UOLAg2Wpj8H8OFw2Ad0Mo+LQ==
X-Received: by 2002:ac2:4903:: with SMTP id n3mr4161358lfi.588.1600098509573;
        Mon, 14 Sep 2020 08:48:29 -0700 (PDT)
Received: from eriador.lan ([188.162.64.187])
        by smtp.gmail.com with ESMTPSA id f19sm3834650lfs.85.2020.09.14.08.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 08:48:28 -0700 (PDT)
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
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v5 4/9] iio: adc: qcom-vadc-common: use fixp_linear_interpolate
Date:   Mon, 14 Sep 2020 18:48:04 +0300
Message-Id: <20200914154809.192174-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200914154809.192174-1-dmitry.baryshkov@linaro.org>
References: <20200914154809.192174-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use new function fixp_linear_interpolate() instead of hand-coding the
linear interpolation.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 drivers/iio/adc/qcom-vadc-common.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/qcom-vadc-common.c b/drivers/iio/adc/qcom-vadc-common.c
index d11f3343ad52..40d77b3af1bb 100644
--- a/drivers/iio/adc/qcom-vadc-common.c
+++ b/drivers/iio/adc/qcom-vadc-common.c
@@ -2,6 +2,7 @@
 #include <linux/bug.h>
 #include <linux/kernel.h>
 #include <linux/bitops.h>
+#include <linux/fixp-arith.h>
 #include <linux/math64.h>
 #include <linux/log2.h>
 #include <linux/err.h>
@@ -368,10 +369,9 @@ static int qcom_vadc_map_voltage_temp(const struct vadc_map_pt *pts,
 	} else {
 		/* result is between search_index and search_index-1 */
 		/* interpolate linearly */
-		*output = (((s32)((pts[i].y - pts[i - 1].y) *
-			(input - pts[i - 1].x)) /
-			(pts[i].x - pts[i - 1].x)) +
-			pts[i - 1].y);
+		*output = fixp_linear_interpolate(pts[i - 1].x, pts[i - 1].y,
+						  pts[i].x, pts[i].y,
+						  input);
 	}
 
 	return 0;
-- 
2.28.0

