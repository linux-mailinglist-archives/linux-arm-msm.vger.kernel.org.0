Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54FCC63A858
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Nov 2022 13:28:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231182AbiK1M2r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Nov 2022 07:28:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230321AbiK1M2o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Nov 2022 07:28:44 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3418101C6
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 04:28:42 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id z4so16565331wrr.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 04:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quL6WPeERZYedqB/nklThp0WUV+KiBC4sy50mhyRH+A=;
        b=dO8rrEKSNakUsplBe22EF1VJo6lb692wT33n1MaScsBpAzQC6Xv74CEXK60Whbny6T
         2nxf6JRW0NB7Q9y8MNaw+vCTVNnzsUKAlQIm9WUe6o0MjEwJd1P1f8b0eczpLazouvqV
         0rPKBtAjzlsgMqD5gGX+92o2vYRjywTRRT7KJ5yWQmmermvkj1BsLduTfEzf+htd7d0m
         OOjW9pi2ULjTTsQWHzmFakw5EcBoCRXjjY6KQtS25NKp8FCEBj3md/7MzZML8x7m+v8X
         SDUtQ1FUdwaOFFCWm1+xU9gcmOcooePolXBQAzpfKrEYoe7HwUAUt13HEFmqtL/oSQBS
         1LRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=quL6WPeERZYedqB/nklThp0WUV+KiBC4sy50mhyRH+A=;
        b=YL/isDXBUDHDdEIWrAXB3AoNubaR0d3MHNhuvyLJq/b2/1jSvHaacYQ+xRZHs0UFBP
         YbvNvD65Y6Sw0qNGAeUb/08MsGrK0Ff81Ru90AhnziVKDKPQoi72R69fRs2iu+YjaoP5
         rigkAYLmCuwESgQqKcYt/AM/jutw0kPqZahf/YLngG9VE3YtBpw/MutKP1EZD321JhG+
         uMEVQfIuBQaR1yQu/rtmSyjxLUK+KCkMZACrGV1O4Ac4iB6lgHQbHQxij5GDUorZpckn
         LjBgTmuDy9v4PhjjJi+K06DSx4PyWUJCQLy2VqZGxE9vPVNqhs/YUXaOXaKDXcMPpKQo
         xzIQ==
X-Gm-Message-State: ANoB5pl/EWD8hjhilOvJDeTpbNj3uyivP2ywPYko9bUeIj5HJemH4y1M
        3ScsQmM2QpsKSA+/SES2sQ7gyQ==
X-Google-Smtp-Source: AA0mqf4ZfBOz6QlwRKKo/ryJmk+nrlJnAjm4/pc9CNq/fUoxUVorirPqq0MaQoWfntBg2AwNb02s6Q==
X-Received: by 2002:a5d:6503:0:b0:22e:35e8:382d with SMTP id x3-20020a5d6503000000b0022e35e8382dmr31203936wru.475.1669638522445;
        Mon, 28 Nov 2022 04:28:42 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id u18-20020adfdd52000000b002421db5f279sm598405wrm.78.2022.11.28.04.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 04:28:42 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 7/9] dt-bindings: clock: qcom,rpmh: Add CXO PAD clock IDs
Date:   Mon, 28 Nov 2022 14:28:18 +0200
Message-Id: <20221128122820.798610-8-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221128122820.798610-1-abel.vesa@linaro.org>
References: <20221128122820.798610-1-abel.vesa@linaro.org>
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

The SM8550 has a new fixed divider as child clock of CXO
called CXO_PAD, so add IDs for it.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 include/dt-bindings/clock/qcom,rpmh.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,rpmh.h b/include/dt-bindings/clock/qcom,rpmh.h
index 0a7d1be0d124..f3e0288420ce 100644
--- a/include/dt-bindings/clock/qcom,rpmh.h
+++ b/include/dt-bindings/clock/qcom,rpmh.h
@@ -33,5 +33,7 @@
 #define RPMH_HWKM_CLK				24
 #define RPMH_QLINK_CLK				25
 #define RPMH_QLINK_CLK_A			26
+#define RPMH_CXO_PAD_CLK			27
+#define RPMH_CXO_PAD_CLK_A			28
 
 #endif
-- 
2.34.1

