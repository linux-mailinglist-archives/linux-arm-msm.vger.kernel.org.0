Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 367B84DB30C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Mar 2022 15:24:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356715AbiCPOZe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Mar 2022 10:25:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358070AbiCPOZM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Mar 2022 10:25:12 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B7DF29CAC
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Mar 2022 07:23:57 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id dr20so4455899ejc.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Mar 2022 07:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o/d166yo9TtkM4+c7x0I89HNNMPO2K1Na/pBqagV1Y0=;
        b=rtOZwPphsgu3uyMdbDd22OSwK0+6n4ikP1CJyx8sfRFjUfbayyOyrRmOhyoT1GBR44
         ZniGhIHAVDL3dSapM9xbrY12VMlr898KwPehPGNDYj+vTKEj+3tiIxeMDaiPkuOhPN4C
         Q1RaQgCi8DZfFawh7+0dlXLLChSo6hw8qW6OiuYAkw40YGMrXdQiX/hMU+H6rGjiYkdz
         pFC/t7gahe1ffw5zRcEKw79hX/XDAyg4CY8h4RdefnM/VJcQioFwWRydvKpUXz4wAiqb
         TTjBcpDz3QV1jjnwyP3Tm6h8yBpvHYznMqrl0ZLt/7i/qJPAGmgRpseReBMMCEuzfcvk
         wt4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o/d166yo9TtkM4+c7x0I89HNNMPO2K1Na/pBqagV1Y0=;
        b=FWhXYpVBNthA7VWkPkA7dJiDhoPALKZCSCepkBvEogKk8dB+fWcR/Ip/RWsD7SvAhZ
         LfoSUsltlZip+EH59A02JABprkqayIXtVseuiIQYtvP2puLAVf27m/vf6/i30Ndf4NaZ
         GELK1+rNVL4Md6RRqtOdqwxSUgzBD7pfljgQDMcDscfzHJN3gSGgNB9m9VZGucbs61Fb
         cTMMU0oMwuPvqp+TCDAjrNVZ47zQEnMbIfOGdhQdywrdqPXTtgH5ksuAlV5N57DRyYje
         vU6vcfO7BrC3TvIzz6voT2ypP7Ug9ymcDj0+neOP6sGLCP6pQ0iL7GVjs5TR/FZ8Jqco
         xVSA==
X-Gm-Message-State: AOAM530ijRwYqLGE0OgkhhLaVYMwNUJhks1HNGLvlgpUlsBdMkC0JAVw
        joz5+RWI1qk+ALRi/kXdgBNQFw==
X-Google-Smtp-Source: ABdhPJw2qu4DcOhZ4JSbpuz0Twf1IPTT/v8q0TqAbAuBWwNaOiJx1OITfd7y9SZQruN+0/Z5QVcnhg==
X-Received: by 2002:a17:906:2699:b0:6d0:9f3b:a6a7 with SMTP id t25-20020a170906269900b006d09f3ba6a7mr161238ejc.397.1647440634210;
        Wed, 16 Mar 2022 07:23:54 -0700 (PDT)
Received: from localhost.localdomain (cpc78119-cwma10-2-0-cust590.7-3.cable.virginm.net. [81.96.50.79])
        by smtp.gmail.com with ESMTPSA id kw3-20020a170907770300b006b2511ea97dsm952263ejc.42.2022.03.16.07.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 07:23:53 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
To:     caleb.connolly@linaro.org, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     sumit.semwal@linaro.org, amit.pundir@linaro.org,
        john.stultz@linaro.org
Subject: [PATCH v12 8/9] arm64: dts: qcom: sdm845-db845c: enable rradc
Date:   Wed, 16 Mar 2022 14:23:12 +0000
Message-Id: <20220316142313.92371-9-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316142313.92371-1-caleb.connolly@linaro.org>
References: <20220316142313.92371-1-caleb.connolly@linaro.org>
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

Enable the Round Robin ADC for the db845c.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 13f80a0b6faa..1c452b458121 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -595,6 +595,10 @@ resin {
 	};
 };
 
+&pmi8998_rradc {
+	status = "okay";
+};
+
 /* QUAT I2S Uses 4 I2S SD Lines for audio on LT9611 HDMI Bridge */
 &q6afedai {
 	qi2s@22 {
-- 
2.35.1

