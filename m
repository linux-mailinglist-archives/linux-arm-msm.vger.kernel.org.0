Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30DB4671E7B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 14:52:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbjARNw3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 08:52:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230285AbjARNvj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 08:51:39 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13A6C2A145
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 05:22:59 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id ud5so83237471ejc.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 05:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BQXELW2Do44btByeSJJTILU+sMVZVBVp+PBgWqh0iPQ=;
        b=mdlQpnPf+uKgvSYoCCHJ/a33KtYz7Y/Z91Keh7J1dVduTh+DVWviEa7bfa+49wHu6U
         XjrdGvOWaikxGOrenkW4klkxNFQaO6IW6f7MjBG6/680yL+aBU6J9nCD00cV08qFTA46
         DqL0eqKskZkO+mYgQLtns5Vn/bX1CpirCtj1frA+wuOFVqUyBWyXaLYJTSs//0wIiZax
         g8QBmppPDRSTF2WGTaulWHljkIBxB/gg3lKrtd1bxx2LLXx0kbycZw5WQg6pyE8grr6J
         iHGs9kQZtpanuG7WPuIj9c8YBKcwcI6pI9budQ8ntLeJ6WoQMvuY/234Vz0Bwg+YZ9YS
         6O4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BQXELW2Do44btByeSJJTILU+sMVZVBVp+PBgWqh0iPQ=;
        b=biizjAkPlG0zGLhPRkULmbno0Vz2g5DZVaZVe3dN4Vu3tbIxN5iWRzRBGww923slr/
         KcxjpamoAxweTwIdI0FsyskTFtMFIR+1gZNH9twA9GRSPxp4W9qtHiPsKYSEnTUXFeBv
         07r8Q9Eausr+cyQ270ZgZLCZSa0vMfEqN0p+lkOAEUvlsz31F0CywAnvYcMM8TwazCDY
         FTohVU2um8Bi2JHh9FuAnE9ZmkJYgdjMyGlfg8aMIjAYtI2/UdXI66hCro/v4n5+P2lk
         NKlt1VEOXK3FAchm6055qxvCNuFzzHxw+UKY85bYYir2YFvo9ETJ8vpQnUtZZOLAXKJo
         EPvw==
X-Gm-Message-State: AFqh2kqzqpfNkAhoCteKDsmMr1tMGKoialz22nTItIga5RAfyIl6l4cp
        FQzmc/VhNl7igJHo9bber/BUuQ==
X-Google-Smtp-Source: AMrXdXu5CSOCJza++NFweL6KpfKXKYInRWlUyYp9fYiDkiK6c0iahxTAEyYET9kPGEz0jBuXBSRamA==
X-Received: by 2002:a17:907:2135:b0:86f:fe8a:be with SMTP id qo21-20020a170907213500b0086ffe8a00bemr6880577ejb.4.1674048177546;
        Wed, 18 Jan 2023 05:22:57 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id u2-20020a1709061da200b0083f91a32131sm14633831ejh.0.2023.01.18.05.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 05:22:57 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/7] dt-bindings: mailbox: qcom: add SDX55 compatible
Date:   Wed, 18 Jan 2023 15:22:48 +0200
Message-Id: <20230118132254.2356209-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118132254.2356209-1-dmitry.baryshkov@linaro.org>
References: <20230118132254.2356209-1-dmitry.baryshkov@linaro.org>
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

The commit 0d17014e9189 ("dt-bindings: mailbox: Add binding for SDX55
APCS") added SDX55 compatible string to one of clock-selection
conditions, but failed to add one to the main schema's compatible list.
Fix this omission.

Fixes: 0d17014e9189 ("dt-bindings: mailbox: Add binding for SDX55 APCS")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index 943f9472ae10..36deddca1524 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -39,6 +39,7 @@ properties:
               - qcom,msm8953-apcs-kpss-global
               - qcom,msm8994-apcs-kpss-global
               - qcom,qcs404-apcs-apps-global
+              - qcom,sdx55-apcs-gcc
           - const: syscon
   reg:
     maxItems: 1
-- 
2.39.0

