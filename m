Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80511571AB3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 14:59:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232000AbiGLM7d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jul 2022 08:59:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231249AbiGLM7b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jul 2022 08:59:31 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B5521FCC3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 05:59:30 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id d13-20020a05600c34cd00b003a2dc1cf0b4so4755942wmq.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 05:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kkxbV+B3WMd1DjIBRGBdfeKS/OGxhVXxBNkoeXI2Csg=;
        b=hd5Uv+ajhaia4dX9kaMuT98yejbkOs1267PkX6pTLNmlDK7dZGbB6vz5Ha4WkZZbUB
         /hIeCZUqM/aXtIEIW4MZafp4JCPiuni4B2VqZiJDgU4qO8Gw+w/tz6+GkfShs4/J8/34
         EqWRFQohnYWl4WwnvSNvhFQ1M3tq0hCUMW+kmxRdMjJ6ZI1NWNYVvKctvK6vkoxluhon
         wAzs8XAqLROrLjoNkMHx6ARKvXFkSx3nz3D+xCVBlc/xkR43Lo0Ad14aLXo/ydmP9RGy
         3IibfvOlHA+hp3taO21ZtM4faU2IYrREteRwH7awEROq1zl4HnDRYPFjilyCIuucgo5P
         aA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kkxbV+B3WMd1DjIBRGBdfeKS/OGxhVXxBNkoeXI2Csg=;
        b=3DARzqpJu86B7mJCtoLO3b6uVtI7sWovB8+FrVepwHwXe7U+kCbhNPs34KgZV6G7cf
         v0gps/Qp+SEMz2YuCXzhSzj1QXDPfbeAZfJaRYa7rdxaGnm8c04zXJsNyxBh7Hdp0Wky
         PE4OPGzyWAjdVCS8EzITsuqZZB8tr5FXej9FAWuhjGWl00Qa+IJgAu64ZmmHW1QQ/6Wx
         gx0anYkhSldspn1G+6OA9yt5+KZvfXbDJW/5Cvu3IGFojbaDdodcE7Uohv2Ev/O5wH+4
         7EKmJryQMgeOYXM829u+sTArhAjbbZtBYq4nuA2JLZ/o4UPpAXv79I/DuHce9HqEDOMf
         /KWQ==
X-Gm-Message-State: AJIora9bJv++Ov9xCDLBQ1M8n+bZTDnOz5diTxNdZ2XD9bqYxNvAh0v7
        NOUYEn4Kgjgrszgzrv/fJ43LDw==
X-Google-Smtp-Source: AGRyM1sOQSR3am676eEoCEdB1bNSJYq6CdQ5WMVQtI254AIGAbRQC5U42AGfvJBCQzgbGVhbXvFQTA==
X-Received: by 2002:a05:600c:1908:b0:3a0:bfaa:38c with SMTP id j8-20020a05600c190800b003a0bfaa038cmr3812855wmq.130.1657630768706;
        Tue, 12 Jul 2022 05:59:28 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id t123-20020a1c4681000000b003973c54bd69sm13008627wma.1.2022.07.12.05.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 05:59:28 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        konrad.dybcio@somainline.org, mturquette@baylibre.com,
        sboyd@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 4/6] clk: qcom: gcc-msm8939: Add missing CAMSS CPP clock frequencies
Date:   Tue, 12 Jul 2022 13:59:20 +0100
Message-Id: <20220712125922.3461675-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712125922.3461675-1-bryan.odonoghue@linaro.org>
References: <20220712125922.3461675-1-bryan.odonoghue@linaro.org>
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

Reviewing the qcom msm8936.c clock frequency tables we see

static struct clk_freq_tbl ftbl_gcc_camss_cpp_clk[] = {
        F( 160000000,      gpll0_out_main,   5,   0,    0),
        F( 200000000,      gpll0_out_main,   4,   0,    0),
        F( 228570000,      gpll0_out_main, 3.5,   0,    0),
        F( 266670000,      gpll0_out_main,   3,   0,    0),
        F( 320000000,      gpll0_out_main, 2.5,   0,    0),
        F( 465000000,      gpll2_out_main,   2,   0,    0),
        F_END
};
which is a super-set of the msm8916 original definitions.
Add in the missing frequency definitions now.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/qcom/gcc-msm8939.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
index 2aad40dbef8e6..6b265b68524f2 100644
--- a/drivers/clk/qcom/gcc-msm8939.c
+++ b/drivers/clk/qcom/gcc-msm8939.c
@@ -1143,6 +1143,9 @@ static struct clk_rcg2 csi1phytimer_clk_src = {
 
 static const struct freq_tbl ftbl_gcc_camss_cpp_clk[] = {
 	F(160000000, P_GPLL0, 5, 0, 0),
+	F(200000000, P_GPLL0, 4, 0, 0),
+	F(228570000, P_GPLL0, 3.5, 0, 0),
+	F(266670000, P_GPLL0, 3, 0, 0),
 	F(320000000, P_GPLL0, 2.5, 0, 0),
 	F(465000000, P_GPLL2, 2, 0, 0),
 	{ }
-- 
2.36.1

