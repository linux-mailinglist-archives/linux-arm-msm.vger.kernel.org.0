Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5ABFD5B99B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Sep 2022 13:36:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229866AbiIOLgG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Sep 2022 07:36:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbiIOLf6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Sep 2022 07:35:58 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 436BF985A2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 04:35:57 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id bj12so41364703ejb.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 04:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=tc0xiA0Fwrt0tr5qIWgvRfBTzVbLIFg6idBAE+8WU/I=;
        b=UdhlByvOOIEZcWyzkI63iyDfrAbG8EujZhjIJPchJIWGMsQrgfKyhK5hScvEyRzbK3
         wHTdCAk/hIE8PVXNCt5Zj7x0mFREs/Jew5pmtu5FMmUAwiKFGs84rSnrFnpP2vX8W4B+
         SvHK/ngnjdw7tSvM7uWihgtO6i1ywnuq/P0j2VC2ViRgDstV2+QNc6wwRr+IbO1YkO3l
         nzzx+2sM2td+Q7DibKY+uVPnwe02wadaog2imNTk8I0JRCqVEibu7TnwRxoaqxdTnqyg
         0fQddevMbNgoYoAZtuqBMo1FHXEhJ6XbtHIG20T5+mkJJe2st+3F3xzCy+wpOaPJ5+Il
         ELMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=tc0xiA0Fwrt0tr5qIWgvRfBTzVbLIFg6idBAE+8WU/I=;
        b=bcboG/gQn4W0evPneMK+e83EIqTZwSrVeK2o9EoxWKWcpUFdAs8VNltdDMwaBiwyF0
         M40StTF63zO/hNy9hBKUj6osiweI1/gjF0HCZP0grUlMOQgvhrk7m0nmNiy+KYWQsN1+
         cEhN2PBprMtznB7VbNwClwoyEXsJmaSUMSeFDFoiCjQQvZIDZvQVx/L9R5gRemBGOy0m
         34l4Vz73fV+6FM4K4zGTnmpP8Cm9mkJKWUv6Vs2HnPllVI/Yv3eOs4WVGALA81wbIEOq
         BMvHLEKAfCX8s1mjq1k6I+Q+2iF80ToXfwSGyOpJj1yQOxJrQSMZSy7cV3HcEURjTZ0Z
         3HPg==
X-Gm-Message-State: ACgBeo1xXzhXABkmqR9a0vogkucjFUEDoPRz91YxVv9C3LUMIdeEd+Fi
        M0WPk5sofi6wajzD8R6HGQWBfFal3tU46g==
X-Google-Smtp-Source: AA6agR523eREVuiFhSt4qHKnQ25GTFAQ2xdd14LRUxO2aGmYQVlEroNaRDIw81THUGy4j4inSaePaA==
X-Received: by 2002:a17:907:a413:b0:780:1ca3:5424 with SMTP id sg19-20020a170907a41300b007801ca35424mr7338817ejc.671.1663241755411;
        Thu, 15 Sep 2022 04:35:55 -0700 (PDT)
Received: from otso.. (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id fi24-20020a1709073ad800b0072af4af2f46sm8910424ejc.74.2022.09.15.04.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 04:35:54 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Lee Jones <lee.jones@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] mfd: qcom-spmi-pmic: convert hex numbers lowercase
Date:   Thu, 15 Sep 2022 13:35:20 +0200
Message-Id: <20220915113523.44074-1-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There are some IDs that are written in uppercase. For consistency
convert them to lowercase.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes since v2:
* Split out to separate patch

 include/soc/qcom/qcom-spmi-pmic.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/soc/qcom/qcom-spmi-pmic.h b/include/soc/qcom/qcom-spmi-pmic.h
index 72398ff44719..fde0148d0077 100644
--- a/include/soc/qcom/qcom-spmi-pmic.h
+++ b/include/soc/qcom/qcom-spmi-pmic.h
@@ -29,9 +29,9 @@
 #define PM8998_SUBTYPE		0x14
 #define PMI8998_SUBTYPE		0x15
 #define PM8005_SUBTYPE		0x18
-#define PM660L_SUBTYPE		0x1A
-#define PM660_SUBTYPE		0x1B
-#define PM8150_SUBTYPE		0x1E
+#define PM660L_SUBTYPE		0x1a
+#define PM660_SUBTYPE		0x1b
+#define PM8150_SUBTYPE		0x1e
 #define PM8150L_SUBTYPE		0x1f
 #define PM8150B_SUBTYPE		0x20
 #define PMK8002_SUBTYPE		0x21
-- 
2.37.3

