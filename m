Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BFF1288D17
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Oct 2020 17:45:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389444AbgJIPpS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Oct 2020 11:45:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389224AbgJIPpQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Oct 2020 11:45:16 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6604FC0613D2
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2020 08:45:16 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id a7so10071050lfk.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2020 08:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SyrNRlrzgocwFtm4m1D+vgyjZWlJZcz7p/Dz+/oWD3I=;
        b=a/NyN1qBHmwcjyJPMEHdonVDKXS7DWlZT4d2U6JHV1IpNhHPzldV8MlqOoalcSg1o7
         wP7ZM2ZjDX2xuQQPZ6tiOoC1DMuDODzVvubHE4+UiiVYa+Z4KoF0dueQcfjClCvF8htV
         RT3cQjm/revmjP/04IigW/3kt9Emqc4r6TwrviAbLEnT89/+JGBOWGIWydBCiwZxlD4s
         fuCdLoaEqRWPJymODD3VMw6Lg32WofShzxPapIcIAbNp9kmmc008k7iCj1ArU1tW7ISb
         S9ZnYEAY9T8VQmU867y1Cgr3VA2jF9w8w//KbalsQV29ed9WUH3ZCG+5kykuJR/Ws/GY
         beaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SyrNRlrzgocwFtm4m1D+vgyjZWlJZcz7p/Dz+/oWD3I=;
        b=l8ePQ4MsGLEFGsQIwtU+vXjK3nTRntWtKWA8Nqtrx8C48suwEF6NzXN3X7h8nQu8hU
         wghzrtGJvXZPQfDopNmgEdcW5aAPxSTfcWQrTgYYRAfQltIv3ePscPuXXy0FyvdC7Rg5
         layUfjbsFvFXZptWl7jZA/W4ZdI5ce/+4hG2KLHsbQl0xEu4vLRQ46+rTjsEjTgP3a9m
         uXwv8ahBgQbq7rcdSV/UsgcM6AkPeTEzsSTe0e9oX0/SiqdLrt0wysim6Flkf6ybAn98
         ZIevHxrk4vwFDHr1OomprLVcBIinR9PmjQmudlkvBD+hHOptlzMoqr4bQs8QDkA5MCpX
         hIqA==
X-Gm-Message-State: AOAM530J1sLajme1mUuOrs/UQL4bVtxGRhD3HZyyx6+G3DCh5yyNZcYF
        mo75Q8b782S0mlC4NxfrY5mZpA==
X-Google-Smtp-Source: ABdhPJxxrCCHXMIr9nzhNuBFrehzppK5IHHmaW65LXYkXPafToY0k0uv9q5i+ToAbCEPA0OZfWUAKw==
X-Received: by 2002:a05:6512:1182:: with SMTP id g2mr2033086lfr.198.1602258314846;
        Fri, 09 Oct 2020 08:45:14 -0700 (PDT)
Received: from eriador.lan ([188.162.65.231])
        by smtp.gmail.com with ESMTPSA id r4sm1505597lfc.162.2020.10.09.08.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 08:45:14 -0700 (PDT)
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
Subject: [PATCH v8 04/11] iio: adc: qcom-vadc-common: use fixp_linear_interpolate
Date:   Fri,  9 Oct 2020 18:44:52 +0300
Message-Id: <20201009154459.106189-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201009154459.106189-1-dmitry.baryshkov@linaro.org>
References: <20201009154459.106189-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

