Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C0CF4F5625
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 08:22:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244107AbiDFFiy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Apr 2022 01:38:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1579973AbiDFEQg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Apr 2022 00:16:36 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A64982B5181
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Apr 2022 17:26:54 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id d5so1282726lfj.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Apr 2022 17:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c/JxrbhWAHjw8ckYVJv9DMMKqM3jkzyjVUcpKG0Ot64=;
        b=YHme6/dYNhKGUqCrEPWzHCLTcjA7OCaIsgtFOHXXC4MKo+zNbynRP3oNmCu9LCMo8e
         rtHip8KrPvxmzkobav1QkcuOu8vWqiqFvMr6ZjAR4YnnH0RmVyO1tc3668bJWM9U3TAx
         OU5ETsFwZRpvlNg0IrL18PsOyroEWxtUtI/T7Ke8nSd3driMDVCfqGetXAgaDwA+TADG
         1U+CDpHeqTOVwMan9SNlxWhk8scHto1y3FvzYzedhgF6W4Y21WbAf1/fWuphxyQPAa4O
         Hh09zQcLJ1mtYI4+bcOAFimmbOAyifV3NYzlj/pd9Zwy3qHW4vmdsniSkuLGhkIWFq9V
         NZeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c/JxrbhWAHjw8ckYVJv9DMMKqM3jkzyjVUcpKG0Ot64=;
        b=D93XU2gAT8hjC+HqnhH6v1YRd0eQ3rNvJC6PLCin36GrNLg7YKCxBrnTes/ApgMsNj
         3DKQ9paO3dQ5zETtTBYJyLyKQ9KXTuWExtTXY9HC8sQE97NZpZ8nkOcCajewjaU/EmbJ
         LBpNjcCDv3WZ8dzm5AUtf1c5mHKqngpERqBS5g0a4sy67O+7xjX98dvFBS9k60TiZx/u
         VyOE+5P9e+3oQ8MkR3tT+gLiez+xVm/APxS4H0I9wMGn/soL8+Bk7IwAC8Ts+HWhdTTq
         G5RcpIwoHgyqLxIwiVIUrOYFSXnj+tl5pwAbAkrPKaXrIzQ0mB43I5IOQ44uDHTXRG8x
         gUPA==
X-Gm-Message-State: AOAM531tso95QjAisWX/Ka4UwE+r6akqg+taBcIktsIAWYblpfAjEjv8
        N+ek7QGQkgLwxC7HnhT7GvFiwg==
X-Google-Smtp-Source: ABdhPJxdcY/sUnOuISW2xEaYO0Jn3VmTn5lPNatDYBWEseO7aF5hOIGiEV4IWzOD6MANWxyvB0nEDA==
X-Received: by 2002:a05:6512:2351:b0:45d:cabf:778c with SMTP id p17-20020a056512235100b0045dcabf778cmr4253806lfu.412.1649204812266;
        Tue, 05 Apr 2022 17:26:52 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c21-20020a056512239500b0044aa21dadeasm1660270lfv.60.2022.04.05.17.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 17:26:51 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 2/4] thermal/drivers/tsens: add compat string for the qcom,msm8960
Date:   Wed,  6 Apr 2022 03:26:46 +0300
Message-Id: <20220406002648.393486-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406002648.393486-1-dmitry.baryshkov@linaro.org>
References: <20220406002648.393486-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On apq8064 (msm8960) platforms the tsens device is created manually by
the gcc driver. Prepare the tsens driver for the qcom,msm8960-tsens
device instantiated from the device tree.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/thermal/qcom/tsens.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
index 154d3cb19c88..7963ee33bf75 100644
--- a/drivers/thermal/qcom/tsens.c
+++ b/drivers/thermal/qcom/tsens.c
@@ -979,6 +979,9 @@ static const struct of_device_id tsens_table[] = {
 	}, {
 		.compatible = "qcom,msm8939-tsens",
 		.data = &data_8939,
+	}, {
+		.compatible = "qcom,msm8960-tsens",
+		.data = &data_8960,
 	}, {
 		.compatible = "qcom,msm8974-tsens",
 		.data = &data_8974,
-- 
2.35.1

