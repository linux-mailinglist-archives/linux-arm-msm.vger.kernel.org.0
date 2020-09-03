Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18C9D25C417
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Sep 2020 17:03:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729031AbgICPDt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Sep 2020 11:03:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729027AbgICN60 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Sep 2020 09:58:26 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FC0AC06123B
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2020 06:21:27 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id c2so3605916ljj.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2020 06:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cQm3Ei3RR3aCnHJxoCJd7GJ9tvCqsDDg7qVL7cbFNi0=;
        b=oKaX/2FC4xi8AE7Tbxleo6PkivkbjAs99jM9XHwwgd/JkCPtx7AsDJpisNurdXjAML
         HV3qLDwG7aixk5Sjw9q2R46BnWfN/LmST0aWGeZxQt4xEEs2yXkB7FyD2TKZgNatA9AM
         s5lQWS3jU7k2pJUW/yF8PzRbyvDQCvzB6zuINPPYkVWfhyMZWDqEniEFtL3QDRGL1iHO
         hlGIQci4gMdWmernvAlbqwZsZ/TuI6FaqF/63gnR4jLato/32yFOvDFRwVeUbOVGGQNr
         KyszmvxYZpLU1tQM3ziJ/SvokV1dNgKFnNWoAPcIHD9NeyY9Ss7ArN294b2bL1+hUyMu
         q3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cQm3Ei3RR3aCnHJxoCJd7GJ9tvCqsDDg7qVL7cbFNi0=;
        b=igCBPV7jyqJhETdJaHfFTp3KHU3rcGKalc0QIhFOwZi1PF5AWFAUTHD8hzkI5B7FcY
         m/6CcwSM5YX7OM6Kyv1RswZsk4QkJgiF9NNVeVlDTB86cOIU6n1jav+2TmffL9I7wmrO
         FoSVTEnVtUJ9sNqTmY4L8w5yKMQ3hT9PxlvCj3g7i1OYVijljxtI1HYoeSWpvLQXSjtj
         6nEO6AEJhq0lxqa1n537FThBdsHMTL2xq2JjaH4eMfHWaWL/keV/NfNslz3kA2ufU+ng
         dK3OHpvc1/1k5yQXXeI5sNgAMHISsiJt1sisIPWZ6uQ3ElP6Br3jnndc6yO28MH62WPd
         bAOA==
X-Gm-Message-State: AOAM530cx4kXXOzBHXe5V5TVAXNevk3nLZSBRhdhqD8NP0K6F+uVaZ0z
        zseP+yEX7nIBjS7zcIhWtk39Lg==
X-Google-Smtp-Source: ABdhPJzjF8ZPvpGo04UHTx/UIh+OfSiygAYlTKZKHI2sYRwiJrGhasv1wAzqFMrbfhl0R4dK4V3fNg==
X-Received: by 2002:a2e:9d95:: with SMTP id c21mr1263833ljj.359.1599139285839;
        Thu, 03 Sep 2020 06:21:25 -0700 (PDT)
Received: from eriador.lan ([188.162.64.138])
        by smtp.gmail.com with ESMTPSA id e23sm584220lfj.80.2020.09.03.06.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 06:21:25 -0700 (PDT)
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
        devicetree@vger.kernel.org, linux-iio@vger.kernel.org
Subject: [PATCH v2 4/9] iio: adc: qcom-vadc-common: use fixp_linear_interpolate
Date:   Thu,  3 Sep 2020 16:21:04 +0300
Message-Id: <20200903132109.1914011-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200903132109.1914011-1-dmitry.baryshkov@linaro.org>
References: <20200903132109.1914011-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use new function fixp_linear_interpolate() instead of hand-coding the
linar interpolation.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

