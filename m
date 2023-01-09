Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19BA5661B69
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 01:29:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234729AbjAIA3q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 19:29:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233780AbjAIA3l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 19:29:41 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66AD5C74B
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jan 2023 16:29:40 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id s22so7362847ljp.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jan 2023 16:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZxC3nS7QizZnlIOV4bLBN1CHzdnFWYIRIQhLbjYXt6I=;
        b=gRRo9zGaqITJDuJjllWblPN+TsJAgVKjwYcqixSfrWxH/fFrt4Am1hchcE02hkIOZX
         tZ8NP5vJ7COPscB2sF71j7Wn3Nic1mVrTe2n3aBdBpg4I4ORthfSkxPMX+LF0ie0DzEk
         pbpSqymxJz74NBa7ZdYxPzy2KxZoXh0i4mShCQouyKA8QIHI2Qa/g3+XWDIMQ1t7vNQD
         HbRHaxH3l2VHXxsJJtjbbI2sUQN/5gBavGktE+FylkSA13yNx8rpWfvisVP4YHzcTXQd
         BAbI+j1q5vhI7mVchhAA2jWl/cwxF8CnltZX+LEqh+//kSq1LKk2dxvdWUKen4VIcFhU
         cA4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZxC3nS7QizZnlIOV4bLBN1CHzdnFWYIRIQhLbjYXt6I=;
        b=aMcQVc4YEXU8zVWxaRrdCZZZ3TIz/uJ17Gujfb+mTGfJog9Y+5QPnkM65vutSI9hQi
         zMbeH8zlcjFcs7qK2H3TKrnRhyhbELh4CR1kJzi3FjVJ4kuQQHmAGAvF+KYWzsL+bXIG
         vSSbFlJWavGmuDO1zb1PGRtTVtB9lLEHnTJVVh1mw2MaRO6JK5Ldb8ZF+khHBN75TJ0U
         F8pA7ha6XA2UENfUb0sOKQuxZ51g66L0xvHB6EwG0uDOd7cvqdxLnnFu5pFYqn8bBXZ+
         RPcsGigzwFj92bn130hY6LdyTjsBcMjOZTPo3yOG9NWkU/BrT7bDHgE10mLNVlAqc9OK
         CNFA==
X-Gm-Message-State: AFqh2kr3FrDmfT0qblzkfjnoBAtteTHJR7VXJAo3xwYISzO2phfuM6GT
        aFhygUelQwULDXWWDWaz+FRHBg==
X-Google-Smtp-Source: AMrXdXsnkfKZuht0AuuR+x5cPBI8cVqRzT+dU1UCs8maGGWXP/JqnrsSpsSlEhPDDBAHJ1r4S66wAA==
X-Received: by 2002:a05:651c:2103:b0:27a:1535:6277 with SMTP id a3-20020a05651c210300b0027a15356277mr20676314ljq.50.1673224178752;
        Sun, 08 Jan 2023 16:29:38 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id a22-20020a2e9816000000b0027fc54f8bf0sm706626ljj.35.2023.01.08.16.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 16:29:38 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     Georgi Djakov <djakov@kernel.org>, Alex Elder <elder@linaro.org>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: [PATCH v3 03/12] interconnect: move ignore_list out of of_count_icc_providers()
Date:   Mon,  9 Jan 2023 02:29:26 +0200
Message-Id: <20230109002935.244320-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109002935.244320-1-dmitry.baryshkov@linaro.org>
References: <20230109002935.244320-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move the const ignore_list definition out of the
of_count_icc_providers() function. This prevents the following stack
frame size warnings if the list is expanded:

drivers/interconnect/core.c:1082:12: warning: stack frame size (1216) exceeds limit (1024) in 'of_count_icc_providers' [-Wframe-larger-than]

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/interconnect/core.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/interconnect/core.c b/drivers/interconnect/core.c
index 25debded65a8..df77d2f6215d 100644
--- a/drivers/interconnect/core.c
+++ b/drivers/interconnect/core.c
@@ -1079,15 +1079,16 @@ void icc_provider_del(struct icc_provider *provider)
 }
 EXPORT_SYMBOL_GPL(icc_provider_del);
 
+static const struct of_device_id __maybe_unused ignore_list[] = {
+	{ .compatible = "qcom,sc7180-ipa-virt" },
+	{ .compatible = "qcom,sdx55-ipa-virt" },
+	{}
+};
+
 static int of_count_icc_providers(struct device_node *np)
 {
 	struct device_node *child;
 	int count = 0;
-	const struct of_device_id __maybe_unused ignore_list[] = {
-		{ .compatible = "qcom,sc7180-ipa-virt" },
-		{ .compatible = "qcom,sdx55-ipa-virt" },
-		{}
-	};
 
 	for_each_available_child_of_node(np, child) {
 		if (of_property_read_bool(child, "#interconnect-cells") &&
-- 
2.39.0

