Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57E1F63D491
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Nov 2022 12:29:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235175AbiK3L3u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Nov 2022 06:29:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229865AbiK3L3q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Nov 2022 06:29:46 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E64E4EE17
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 03:29:24 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id gu23so22367462ejb.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 03:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=202AXBoRVRqqYasC07iMQKFObsXHIxNlcvK9BINa1mE=;
        b=wxxFDJzuhIbQ3eg/HwaIKk7bX50qUCdlmu3dZxjPHt6HRefelu1HtstlzXgKMyc9Bd
         ZYiWViuvwFzV+rc8pLx8GPoYFT6Pq+M1gei+mm6yX4teQh6/Qr9QFqe+sQt9QUr87PGH
         +zzsVCriInHYOFcIM0oIUvDPMHvSuzwKQw/KdrINOYRFCbcryR4pk/vjphB2C2wUvqvd
         Q1+roEn/rXw+oCRdVUiQkNrHvd1ymA8sx10NNHbY8/ZhANl6/0EgU7s3ukVwrX3F7LtX
         H+axDtjAkR6lM736o9fakkfzQm3JU592IiCSUhBb095iaSwlE5SPDMi2y7zezsWKAd9H
         d49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=202AXBoRVRqqYasC07iMQKFObsXHIxNlcvK9BINa1mE=;
        b=7GNWfpMyudgJ4nw12Q0tWg5ee+f7DooCqn4/LaJ5f/PoTbOR7p8guKyVmEfTUd7bZE
         5RcYivh+tZAIdBRNFz/ymse1FqwpaW3o8vQssNuWSZTS0zmg2a98JuwDmgMXj6GY/0Uq
         H0mt/oK3fmUs3m0VuQkcXDXs4d6qMc7LxCj+RRKU/iZTYUUWFuzUiUghMNc6tJRSQF8X
         HQLp1+m+9x1H/BA6e2V+t9bZ0we33DkS3z3xRvZKAmbc9Nnia1Lu7IqrLZsyj15drjQI
         D1fs96s+BIbj47hQK/+1JMx+K7Gl8ARD63Qrg6LTpSuM4+2m/wvmDpghBnmaNBhRhULV
         gg6g==
X-Gm-Message-State: ANoB5pk6JKUa4osn+a8kTF+Pbb57cB2tQ4zGZm1r04K1Q0PIhJXerceu
        VuQFza3ek9IOui2DFudBx+Rw3A==
X-Google-Smtp-Source: AA0mqf5Voh1/yaLr5sISjRNoWVxTSPfZw8On8YUzn+yoH4JRvKeN9UzWpmYOf/voX8R52u3CGjQUhg==
X-Received: by 2002:a17:906:bb06:b0:7ba:708f:2a03 with SMTP id jz6-20020a170906bb0600b007ba708f2a03mr28664147ejb.167.1669807763489;
        Wed, 30 Nov 2022 03:29:23 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id x10-20020a1709060a4a00b007c073be0127sm521593ejf.202.2022.11.30.03.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 03:29:22 -0800 (PST)
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
Subject: [PATCH v4 6/9] dt-bindings: clock: Add RPMHCC for SM8550
Date:   Wed, 30 Nov 2022 13:28:49 +0200
Message-Id: <20221130112852.2977816-7-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221130112852.2977816-1-abel.vesa@linaro.org>
References: <20221130112852.2977816-1-abel.vesa@linaro.org>
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

Add bindings and update documentation for clock rpmh driver on SM8550.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 437a34b930e3..d465dd691107 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -30,6 +30,7 @@ properties:
       - qcom,sm8250-rpmh-clk
       - qcom,sm8350-rpmh-clk
       - qcom,sm8450-rpmh-clk
+      - qcom,sm8550-rpmh-clk
 
   clocks:
     maxItems: 1
-- 
2.34.1

