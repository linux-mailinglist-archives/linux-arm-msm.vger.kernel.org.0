Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D5F32CE618
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Dec 2020 03:58:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726964AbgLDC5Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Dec 2020 21:57:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727179AbgLDC5P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Dec 2020 21:57:15 -0500
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A99AC09425D
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Dec 2020 18:55:41 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id t22so4959250ljk.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Dec 2020 18:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cQztbxK1Ul8qaWaR/dfV1ihb27TV5RrrFg5jVaIwTlY=;
        b=ppMDdkPv6udiyG/aGZMzg3vSty++0qSJXxB0u9HRVR0IyfGHABbYv5YCJ+BUEKZePQ
         tKgSuN23uArBpeRoODHSI1bsRJtzYhjZmMK6SBI1FDy3jEGBpXJ4T2nVId8nX0RSHAGf
         HdhRsevW9wFli96AqGyyFcJzu8uR5ptXW5TfuxgSkmFPWEsuaXL4Z4iacZZhw0UiXfO8
         VBNoEBNkFKbQv89yyuVTmDcW1o5pkmgbU2fTx4p13ON+keoPLgJ/EVEf48LEWzuzRqbn
         NnS6e2G8CY+aaBe3DR1kgr4k8eiYG2knRgIOxtayHUqKTKlpkfyRNE/H+byHluDGdtVJ
         ZS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cQztbxK1Ul8qaWaR/dfV1ihb27TV5RrrFg5jVaIwTlY=;
        b=RDKbdUxoj+JMuTxCjr0cy9hXRgoagAPTcS/GVyeelFWJ88EwrOcZUrOnHgfxB/PoMk
         d4mq9ymYgOL64O42M7XQawpf9fJTCEHTo1ikacrG+hB2KZYTU+HA1l/Wdrc1gvB8+OX6
         1crfZu9V/xDyyOYxOstUjwWoJSn8QtiEYzN9WE/UJfdn6crsb+HvrwgwBFfLqg4b/8xa
         gt5vNQXNlCazLss8mDGsPabG4ZBPWaEQaVZQ6/AMA7OgCZubUxYBwTN/oJ4i1f/fbilS
         AT1imREKDmeu5nyM48OEoray4nL9vvcf8s2aWWCit1fRbHOnRwxCrRH0nXXfDZDgiy1w
         EwSw==
X-Gm-Message-State: AOAM5325s3s6JUB/pUs/wgNcJPJhGNyibZL7oy5//OEqrGHEjYCay/vW
        2WuEtNxHXVNZKCB8QBJG6Dgwog==
X-Google-Smtp-Source: ABdhPJxbTypi6X4afvwqrYcm54FNQjzvLe5DEXk/NGkSY8U5tzu+UYmdlxWCe/8PYaZG8peboDeh7A==
X-Received: by 2002:a2e:b4c6:: with SMTP id r6mr2473517ljm.248.1607050539730;
        Thu, 03 Dec 2020 18:55:39 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.64.117])
        by smtp.gmail.com with ESMTPSA id b8sm1131667ljo.68.2020.12.03.18.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 18:55:39 -0800 (PST)
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
Subject: [PATCH v10 10/15] iio: adc: qcom-vadc-common: simplify qcom_vadc_map_voltage_temp
Date:   Fri,  4 Dec 2020 05:55:04 +0300
Message-Id: <20201204025509.1075506-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201204025509.1075506-1-dmitry.baryshkov@linaro.org>
References: <20201204025509.1075506-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

All volt-temp tables here are sorted in descending order. There is no
need to accout for (unused) ascending table sorting case, so simplify
the conversion function.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/iio/adc/qcom-vadc-common.c | 21 +--------------------
 1 file changed, 1 insertion(+), 20 deletions(-)

diff --git a/drivers/iio/adc/qcom-vadc-common.c b/drivers/iio/adc/qcom-vadc-common.c
index 0c705bb473fe..441843827f05 100644
--- a/drivers/iio/adc/qcom-vadc-common.c
+++ b/drivers/iio/adc/qcom-vadc-common.c
@@ -346,38 +346,19 @@ static struct qcom_adc5_scale_type scale_adc5_fn[] = {
 static int qcom_vadc_map_voltage_temp(const struct vadc_map_pt *pts,
 				      u32 tablesize, s32 input, int *output)
 {
-	bool descending = 1;
 	u32 i = 0;
 
 	if (!pts)
 		return -EINVAL;
 
-	/* Check if table is descending or ascending */
-	if (tablesize > 1) {
-		if (pts[0].x < pts[1].x)
-			descending = 0;
-	}
-
-	while (i < tablesize) {
-		if ((descending) && (pts[i].x < input)) {
-			/* table entry is less than measured*/
-			 /* value and table is descending, stop */
-			break;
-		} else if ((!descending) &&
-				(pts[i].x > input)) {
-			/* table entry is greater than measured*/
-			/*value and table is ascending, stop */
-			break;
-		}
+	while (i < tablesize && pts[i].x > input)
 		i++;
-	}
 
 	if (i == 0) {
 		*output = pts[0].y;
 	} else if (i == tablesize) {
 		*output = pts[tablesize - 1].y;
 	} else {
-		/* result is between search_index and search_index-1 */
 		/* interpolate linearly */
 		*output = fixp_linear_interpolate(pts[i - 1].x, pts[i - 1].y,
 						  pts[i].x, pts[i].y,
-- 
2.29.2

