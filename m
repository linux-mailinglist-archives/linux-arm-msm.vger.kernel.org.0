Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6C146B535E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Mar 2023 22:50:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231401AbjCJVuz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Mar 2023 16:50:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232299AbjCJVt7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Mar 2023 16:49:59 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DC2214FE04
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 13:47:05 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id s11so26089394edy.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 13:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678484767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QldUnB9DK++r9IeP/7G8h+f/oI23uHDDVTXX+AKTbM=;
        b=VSJs/E5dMhRtlW23myb9CxFaOl67MqXlhDSjdI07vDkatFJhqu6CTSFwx9q3jk4IJ0
         bLNsXnJ6+2s9GtGXkd7GBt5x7sYZ+LJ6dmr6h43+y3oDVroQezV7kUy1CcFnFU1Llg/E
         YC+gYRYEU29XI9Kozo9ZU3HdP4ifHCmd+GZJpqZhPLNUhkCMU8yoesRPvOZr46kDXbTl
         /d1ly+BVNEqnEm1enL7nmd86UITqH1KUu17WoOU9FI/k//BzGg0h0nFednZCVIzwHxQf
         xeGKlzIl8oKtLGBZlAVJHz3+hBVez+oQZG+JsgLigZTWVhOLq3G62m+NVQLBRN3DsFja
         D0cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678484767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7QldUnB9DK++r9IeP/7G8h+f/oI23uHDDVTXX+AKTbM=;
        b=1g5uJ8V7y8yrMPEbDDLoSaunAq1YbnISFu6AIWcTya8npCvwrVW6WblxaR067oMHQx
         s+p2yuv1ERfv5dFEleGRsdgnVbrrXMIdzHDS6TniRw3VosHPm6xk0RJ4RWisd1IXxc0e
         nDTfJcwMWZmSX1333A3F2uRkQ0JVoBA08R43yrMi2aleoDgUOAK4ht6AW/cPxFiX27eC
         uVVyZ3FUGjdkAeZ28Mmuo9frA3PAOvr12PhdtgPkpjv7Qo1InNJQWVK6/r6mVma5gWqC
         knm2OdeifiLnJIh0Ulb/PF2ZfMBV+7+joxwNzr2l0luOmY0JkRc8rJKWwlI0zZfH4o9e
         SgQA==
X-Gm-Message-State: AO0yUKVMHm7AO05nct1AWYLILBKt9BM+8tdwQqhzM/QpeiNC9gBDPJPB
        jlBvJEgPnCjlJgSKu6dUTzT/FQ==
X-Google-Smtp-Source: AK7set/TN6HEHcHKgSpnaQNAvcq6/J9mJlM0Vmdwb6gRlrMLE7hUWXDBNwCju/6Q/6+EyoGExFlw2A==
X-Received: by 2002:aa7:d683:0:b0:4af:75fd:8214 with SMTP id d3-20020aa7d683000000b004af75fd8214mr20546242edr.38.1678484767172;
        Fri, 10 Mar 2023 13:46:07 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id u7-20020a50d507000000b004be11e97ca2sm471873edi.90.2023.03.10.13.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 13:46:06 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Tony Lindgren <tony@atomide.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 9/9] regulator: twl6030: Drop of_match_ptr for ID table
Date:   Fri, 10 Mar 2023 22:45:53 +0100
Message-Id: <20230310214553.275450-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310214553.275450-1-krzysztof.kozlowski@linaro.org>
References: <20230310214553.275450-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The driver can match only via the DT table so the table should be always
used and the of_match_ptr does not have any sense (this also allows ACPI
matching via PRP0001, even though it is not relevant here).

  drivers/regulator/twl6030-regulator.c:646:34: error: ‘twl_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/regulator/twl6030-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/twl6030-regulator.c b/drivers/regulator/twl6030-regulator.c
index f3856750944f..be798f3c129e 100644
--- a/drivers/regulator/twl6030-regulator.c
+++ b/drivers/regulator/twl6030-regulator.c
@@ -765,7 +765,7 @@ static struct platform_driver twlreg_driver = {
 	 */
 	.driver  = {
 		.name  = "twl6030_reg",
-		.of_match_table = of_match_ptr(twl_of_match),
+		.of_match_table = twl_of_match,
 	},
 };
 
-- 
2.34.1

