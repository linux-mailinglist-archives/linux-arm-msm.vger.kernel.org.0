Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B910152FDA5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 May 2022 17:14:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241662AbiEUPOt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 May 2022 11:14:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345756AbiEUPOr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 May 2022 11:14:47 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6129556214
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 08:14:46 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id t25so18792738lfg.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 08:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qCBZ0j+ES0QNdxwqckFAUR3wGLW9E7d1PkVjGCIYt/4=;
        b=hzG9FNEkMe+dTUP2kJxaSwv6J4SipHrlqe1p0Pz8ZXmAGWn+hH0N4v4EEAzbn0J2Uu
         cBu9FsyMTQJPIqQYu/pXkch6p/l6hIp9ij9r+IMUaafA73aQ+BjKKq4HQ27HpJ0umSqL
         oGzyKzOe29KGTLQj8AA6kYJGTapyJKZXJVmb7SNsz++Ra6D697zsfQKMvWL8QG5uR40W
         Wpyzn2+ZKCfrooPMXbq5WSz/dKbxwiAlpicz7owCMZssQ0FT5DgcXg0tv7zcEjtyKh3T
         rROuFmfE+mcqNnCmu5fr5hVin2MqHuz1VsSQsqvOZqb4Tmc6fb1r2AejH6prrExiu0bx
         XZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qCBZ0j+ES0QNdxwqckFAUR3wGLW9E7d1PkVjGCIYt/4=;
        b=3zs1pNGh3NpJPC5ojwIy+6YnCcBibHbiFT4vo9AUcwInz+jtvaQjmkBMxwzeNwWkDY
         JfcfOanKJap0NPSNxQsX5f5oEZ+i+izRLar3QXp/0g24bOK9cR6eh3KgjJsjQqqhfDRk
         yGPE5Z5t85giUSvehJhA8ZxEHAJwEubr9pjhcX/VEea3aYiRqot4ncO6rF1zQ52CvH4J
         hgH0tLy0YOmp5piKnUjweOIOwKLzonkQc9vDtaHXx6mH7QgaJ9tzYUS8q7imvrH91uk1
         2FBalkWMVMVnFXLbM0xAyld6jKGiyjDhoKtN4jZzzPQ9oafIZnEde6gVifSd8FnQ2CK2
         FUQw==
X-Gm-Message-State: AOAM533khvvkE6NX/UF3eGwJIHfJpfHOWqOqkZw7OIUU3bDGIzAKRkrY
        VDsbfNNDLavM0M6YpVL4OzxwUA==
X-Google-Smtp-Source: ABdhPJx/0yIIyAnQHBUfRGiVS5yqAF9VpDKkIoDrjdRFBF0oNiDlId4enthaB42ekdhjApUQ+KHZww==
X-Received: by 2002:a19:f818:0:b0:472:3d96:bd2d with SMTP id a24-20020a19f818000000b004723d96bd2dmr10647863lff.329.1653146084762;
        Sat, 21 May 2022 08:14:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([94.25.229.156])
        by smtp.gmail.com with ESMTPSA id v22-20020a2e7a16000000b0024f3d1daedfsm716849ljc.103.2022.05.21.08.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 08:14:44 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v6 3/4] clk: qcom: gcc-msm8960: create tsens device if there are no child nodes
Date:   Sat, 21 May 2022 18:14:36 +0300
Message-Id: <20220521151437.1489111-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220521151437.1489111-1-dmitry.baryshkov@linaro.org>
References: <20220521151437.1489111-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently gcc-msm8960 driver manually creates tsens platform device
manually. It would be better to follow IPQ8064 approach, where tsens
device is defined as gcc's child device in the device tree. If nothing
else, it removes gcc's dependency on QFPROM, thus allowing clock
controller to be probed earlier.

Don't create it in case there are available child nodes (tsens) inside
the gcc's device tree node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-msm8960.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-msm8960.c b/drivers/clk/qcom/gcc-msm8960.c
index 051745ef99c8..a6e13b91e4c8 100644
--- a/drivers/clk/qcom/gcc-msm8960.c
+++ b/drivers/clk/qcom/gcc-msm8960.c
@@ -3641,6 +3641,9 @@ static int gcc_msm8960_probe(struct platform_device *pdev)
 		hfpll_l2.d = &hfpll_l2_8064_data;
 	}
 
+	if (of_get_available_child_count(pdev->dev.of_node) != 0)
+		return devm_of_platform_populate(&pdev->dev);
+
 	tsens = platform_device_register_data(&pdev->dev, "qcom-tsens", -1,
 					      NULL, 0);
 	if (IS_ERR(tsens))
@@ -3655,7 +3658,8 @@ static int gcc_msm8960_remove(struct platform_device *pdev)
 {
 	struct platform_device *tsens = platform_get_drvdata(pdev);
 
-	platform_device_unregister(tsens);
+	if (tsens)
+		platform_device_unregister(tsens);
 
 	return 0;
 }
-- 
2.35.1

