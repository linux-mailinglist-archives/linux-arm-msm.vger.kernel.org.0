Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C759D670BDC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jan 2023 23:44:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229889AbjAQWoL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 17:44:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbjAQWms (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 17:42:48 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 450C65D923
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 14:30:17 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id mp20so32310368ejc.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 14:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N7bEFoFbOUtsSE/6ZuuEBc3RCFNCiMzDE8TXDtdWn6U=;
        b=XeDsQQcWwPmi0pb4U7JUVvQaF/SuEoPvG+yj2lxCH1zA0apDK3k+1hy1JMp0WiPJv7
         8wdBBOeXm1/c45mVf44ES/yXhNsxb5orX1s6ogfKNX4VRz5oN5Iq2moKEE+xb8pmz4g7
         UNCNoyt1Fk8PL5zUcPCB7m93ks1jvFZnSN3eOerKDV+JqfmFMu4hIgkg1P/X8J6Es59g
         0GGlG+GVWtYHs+8QxZoDCOs9anqqDPhsp6Ulk9HHjwvGROob8o85qVMahiugpkCqruat
         UA7bVSpjGuSaTj1wlkT1SAhR56IZDlX3ORCWuGNcv8O0p+ybUwjNO41QWLJamZ7O/3lt
         ihqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N7bEFoFbOUtsSE/6ZuuEBc3RCFNCiMzDE8TXDtdWn6U=;
        b=F4N3GXKoBExtwXogdS7nTCvEScBQeBR78TNJiG7NYgIh7nMyUxo8palRUnqMDgms3Y
         VPJRzygyyWu4ZSBPaFxoRbYKH6/Dij8ywR26lUr+mi17zRjbcULeRDpRHN4T2XMrLhOz
         wMKUfU/SYx/gDSzaYjLCgLmH+a/5g3RaiFYMNhqQKVcF08Xjm34b9pdbp8FRHHZ0ZXXC
         l12AJhQtX8aIVtWNR6vMn/uEeIUI1JI683Sivd9ZbQWIXpZ+KFsNrznafSVDppY3f/x4
         UroFMCAwBLRZsiG/dPcM3epyj2oRfjXzlfT0z5y7HzgI7wpdXDmwRaC27GQiovZztmHU
         Ltaw==
X-Gm-Message-State: AFqh2kprQPcO1OXV4VmsKKcjCDfe1OhoZAj/om7R1cA6MjjwVwYJ0GA3
        AMDeb8NFHrfWUFll6YDKaLimFA==
X-Google-Smtp-Source: AMrXdXuGW7kOm7Q0K5Drssz2TXNa/0t0VkmEB96wiRTVFo/F7/KkA3siLMXKBe2AIG3hwIkRxvGrVA==
X-Received: by 2002:a17:906:eb8e:b0:871:6b9d:dbc with SMTP id mh14-20020a170906eb8e00b008716b9d0dbcmr4640462ejb.21.1673994615878;
        Tue, 17 Jan 2023 14:30:15 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id ec20-20020a170906b6d400b007c0f5d6f754sm13835189ejb.79.2023.01.17.14.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 14:30:15 -0800 (PST)
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
Subject: [PATCH v3 1/6] dt-bindings: mailbox: qcom: add SDX55 compatible
Date:   Wed, 18 Jan 2023 00:30:08 +0200
Message-Id: <20230117223013.1545026-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230117223013.1545026-1-dmitry.baryshkov@linaro.org>
References: <20230117223013.1545026-1-dmitry.baryshkov@linaro.org>
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

