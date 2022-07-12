Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39FFF571AAE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 14:59:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbiGLM73 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jul 2022 08:59:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229789AbiGLM72 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jul 2022 08:59:28 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06F3E1EEDC
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 05:59:28 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id bi22-20020a05600c3d9600b003a04de22ab6so4765863wmb.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 05:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tGmubJfrLjSm9JAoHZslmLyGxIMnq3hUIjCR/6pycIU=;
        b=lwu+sDij0oIDTBVhhUHAe05XQQ8hnVhOQsUf6sjeqHka24pCYDWZy8dJbO5Qyrs0WW
         y2jG8po5NMLC22R7hpmwoQ4B8a4LkffHViNYIhi7t54aMbc4MYjBwM4RF73pJB5fx+CU
         IgfxEHtJ7SMgv0eJeTBCE7BBnZwcBNeQArUTM5upkoaj3t84/56CdoqNrmMqAvUOkZm3
         RVtOiBGSs3zZt8a7Er1aQBa1VwxlHwHd1N/dlFrB1BSUjnbea9+oE7nPk42JqE4a7faH
         mavJgJyNTIlmYoXXIUvyB1IZ05qd/yW+K/IqRrZAuDzAawDiUgztpHhya/Yj7MKJsmag
         Q18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tGmubJfrLjSm9JAoHZslmLyGxIMnq3hUIjCR/6pycIU=;
        b=xnF8V1zw0GWJCthn3EDtJoGAmsmJlLNmUCVskk6kW5J/ZQ+AWLm5ILKsNc+mpJuRtN
         y3DLx/N5+hyPQpPAjMujsaTGuWFgElchAGntUwKqPC6yTdSpq/wLmE8D+BjMymZgMedv
         w8xColyXDI4EnrzKYpmNoORO05a+6yuhDQkEy4QrabMDd0+l0jLeaUbboSDJfuUA9jHG
         mMCau0OJw+gEIOkSnNNme9uGv+29nss2hr+D2/XvjKVua61CWeOhomcBqx/eRhyXcetN
         A9FMwEl3wGU0tPRjQ/txOZopSYevWJrcsI4rFaXRd+QG+y8HFo83pwOSfGQB9a9MGsWu
         eu7Q==
X-Gm-Message-State: AJIora9SCJh7qtdIlFbRIblHMXxGFURh/t49n2WcmLllQDTO6j8OJOvh
        lmfNYAh/6LKr2VIlIJMvNpWn25zz5tnfIQ==
X-Google-Smtp-Source: AGRyM1vuRmWtPxdlVOsiZ6Wbb3SfvMFi6r5RJsyUjzWdnsFZ/RdnTmnLB5wnE0oYoX5PBeqVajWpGg==
X-Received: by 2002:a05:600c:2059:b0:3a2:e5a4:ef8 with SMTP id p25-20020a05600c205900b003a2e5a40ef8mr3605632wmg.146.1657630766594;
        Tue, 12 Jul 2022 05:59:26 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id t123-20020a1c4681000000b003973c54bd69sm13008627wma.1.2022.07.12.05.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 05:59:26 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        konrad.dybcio@somainline.org, mturquette@baylibre.com,
        sboyd@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 2/6] clk: qcom: gcc-msm8939: Add missing CAMSS CCI bus clock
Date:   Tue, 12 Jul 2022 13:59:18 +0100
Message-Id: <20220712125922.3461675-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712125922.3461675-1-bryan.odonoghue@linaro.org>
References: <20220712125922.3461675-1-bryan.odonoghue@linaro.org>
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

Standard CCI bus clock clocks are 19.2 MHz and 37.5 MHz. We already define
the 19.2 MHz but are missing the 37.5 MHz.

See qcom kernel drivers/clk/qcom/clock-gcc-8936.c::ftbl_gcc_camss_cci_clk[]

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/qcom/gcc-msm8939.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
index 628b476a5468e..6a3e2326c72a3 100644
--- a/drivers/clk/qcom/gcc-msm8939.c
+++ b/drivers/clk/qcom/gcc-msm8939.c
@@ -1003,6 +1003,7 @@ static struct clk_rcg2 blsp1_uart2_apps_clk_src = {
 
 static const struct freq_tbl ftbl_gcc_camss_cci_clk[] = {
 	F(19200000, P_XO, 1, 0, 0),
+	F(37500000, P_GPLL0, 1, 3, 64),
 	{ }
 };
 
-- 
2.36.1

