Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF6FC66635C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 20:15:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbjAKTPQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 14:15:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235030AbjAKTO7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 14:14:59 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 102493DBED
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 11:14:58 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id g14so17014386ljh.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 11:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qnO47DUEwN//XThycfEdpAbdWEvh77T3LIosKiAxmXQ=;
        b=rIShkYakHyEndgpFPEx8c/mV1M7z06AugUVKSo7J4Pya1+TGDnRWXk4vX66XQAWLtE
         lx6DIi+y8VGUZIVjL522QS2T/Lw28zY0rS5qZ8DheJvCMUNMhHFEN61nGjAWRCkMWjBk
         kbvpj2lBiu/jPIbHxT+6y+9jwG8laWIrRwPGFFi4E78+O9VQ8B4ywgzgtfDwfzRqbzAa
         R/Q3ZElOtA3cB3NCMtN98FuB4PpDIPu6HDvBozNlCnE8RtLY9kKv9UIy/VicQv1leLAL
         /2IEs6GHjxj1uzVrXUeolvnpC/N3pLxpzeN4QImDiXzMR1dHlB5ekDYrNIyA6n0jhJTn
         PBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qnO47DUEwN//XThycfEdpAbdWEvh77T3LIosKiAxmXQ=;
        b=1o1zFxmZIYlkr1Hp+hpB2V3U3O3JsuAGHsfKIZn/7eyZa3iU857vcz2tRN1BsiWMjh
         WMlOwqhCahq+tsxpVxq7UoltCt0W3DPOgGq0d/6CS+xx05Wxc16LyDdwtGMADyqxF1Pe
         fp1krfiyQBm2V5Tv0BObweXS5WvW74B6dCmG3zooN5YyjttM7Onk64GeLDxb1+FEb+Ks
         uOew/UqIHA1x9rbGA5q9izU5CkPJY7iLEJlXubwTb0tIYQWNDPzypbCh/Vv7VmLuf31Z
         ZzdDRb3Uu8AeCPTWqJiO+0Cfyq/g1wj0kkfy2Agmzj7Af3+loXYfAmg61p2hdCD7Qcpr
         dWgA==
X-Gm-Message-State: AFqh2kqOypPB+mbG70FYQmFWW4PVwfdmmFDwV6e6Kw/aH3SQ608ujYrN
        O8VSwToM7EEKXqESH3wMZw9pVA==
X-Google-Smtp-Source: AMrXdXvx0DRu2+CA6xRA5IFr/WBd1wZwaDOy+Wzlq5t+NYgswAsi1LDZw6/CIT0a55v8qx0dbbcnbQ==
X-Received: by 2002:a05:651c:220b:b0:279:f1df:97a6 with SMTP id y11-20020a05651c220b00b00279f1df97a6mr24826788ljq.7.1673464496242;
        Wed, 11 Jan 2023 11:14:56 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id r7-20020a2e8e27000000b00289873cce0bsm76343ljk.14.2023.01.11.11.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 11:14:55 -0800 (PST)
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] dt-bindings: mailbox: qcom: add #clock-cells to msm8996 example
Date:   Wed, 11 Jan 2023 22:14:51 +0300
Message-Id: <20230111191453.2509468-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230111191453.2509468-1-dmitry.baryshkov@linaro.org>
References: <20230111191453.2509468-1-dmitry.baryshkov@linaro.org>
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

Add the #clock-cells property to the MSM8996 example, as the APCS block
is going to provide the `sys_apcs_aux' clock to the consumers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index b8a44ef0540f..5e7c83345774 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -141,6 +141,7 @@ examples:
         reg = <0x9820000 0x1000>;
 
         #mbox-cells = <1>;
+        #clock-cells = <0>;
     };
 
     rpm-glink {
-- 
2.30.2

