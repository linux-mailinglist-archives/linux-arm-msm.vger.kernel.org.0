Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FCA06B5362
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Mar 2023 22:50:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231948AbjCJVu5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Mar 2023 16:50:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232480AbjCJVuY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Mar 2023 16:50:24 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08848149D0E
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 13:47:45 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id s11so26088617edy.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 13:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678484762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zfueC8Ud+TxsewqPkS/fDVgjDJwxhwka0PgPS2fY1z0=;
        b=K90kT9LAH347IN7aaGanwpD1pGk+lr2nq1GFiAMOUVwmIajNMd6FSgYobHYmDVe9x+
         Xp0RTAY0qIzp8AoHNjDiPlu+3mDAZfq/Vr8asnGZVsr79W36eaRS8WnYAvQX2tbrOEFh
         2DKmocArpikKUh3AylbFB76+tUeJo+Z+ATf1qkC299jJSQxQ0Mp9SyRFgp10jIAgx6zp
         b9IxsffVZrjR4bh4TiWORGRCvFLUvKkZcmN5ATVcoAIeDj0b9lvAAgcLhR26fXw/4hXx
         xLzxw0tUw9i1/U96VbyETa6TnMH543wkwqp7D273J5X3JKQ6uQjUThg6on6eCTDis43o
         Biew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678484762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zfueC8Ud+TxsewqPkS/fDVgjDJwxhwka0PgPS2fY1z0=;
        b=VET8V/MQKsSjGUfO1uMw5GeTN2eSEmqLVh9Pc7NYQ1FQtfI0kDl8uh+d7RNu/t26nr
         R1smC05ubi49FDnD/W6b/biRVQ8/oCskrLJGMXPOYA3h/pDFvtJjZ4m3NQyET9qLE2Sn
         kBxCPqakyc8nNajIM5ReNhcLShWhpjXH8mY9HYzckoHo/r3KPiLcswb4MRucixPKIz71
         so0iKo905MJSHjdOaMccSh+wB/2//1yfe3XdwWhrEPbQF8IXXI8yKXkuBYcj5N9tyItS
         b9GtYxY/BQlGeHYNv53wHLVSS5kUJiIc6LUiB8z45+HuKoH50JUXkvop7E4KBG3nlqlA
         Utzg==
X-Gm-Message-State: AO0yUKWUDCtlU3ff1W4/2TeNOJcyea53Wcikvp/u64TzJGdXFxDyN1ED
        NJOP2qTI/iwbemOPa5RxGGeGqQ==
X-Google-Smtp-Source: AK7set/+NUmIgbATpN/GwzCK7LhiB3l9y1iTqOcCxXGLgQn2rcQCH7j8l4FZmoegGAD3sHE0TVBUJQ==
X-Received: by 2002:a05:6402:128b:b0:4bf:4b5c:1d66 with SMTP id w11-20020a056402128b00b004bf4b5c1d66mr22987359edv.31.1678484761848;
        Fri, 10 Mar 2023 13:46:01 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id u7-20020a50d507000000b004be11e97ca2sm471873edi.90.2023.03.10.13.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 13:46:01 -0800 (PST)
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
Subject: [PATCH 5/9] regulator: qcom_rpm: Drop of_match_ptr for ID table
Date:   Fri, 10 Mar 2023 22:45:49 +0100
Message-Id: <20230310214553.275450-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310214553.275450-1-krzysztof.kozlowski@linaro.org>
References: <20230310214553.275450-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
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

The driver is specific to ARCH_QCOM which depends on OF thus the driver
is OF-only.  Its of_device_id table is built unconditionally, thus
of_match_ptr() for ID table does not make sense.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/regulator/qcom_rpm-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/qcom_rpm-regulator.c b/drivers/regulator/qcom_rpm-regulator.c
index 3c41b71a1f52..602526669648 100644
--- a/drivers/regulator/qcom_rpm-regulator.c
+++ b/drivers/regulator/qcom_rpm-regulator.c
@@ -991,7 +991,7 @@ static struct platform_driver rpm_reg_driver = {
 	.probe          = rpm_reg_probe,
 	.driver  = {
 		.name  = "qcom_rpm_reg",
-		.of_match_table = of_match_ptr(rpm_of_match),
+		.of_match_table = rpm_of_match,
 	},
 };
 
-- 
2.34.1

