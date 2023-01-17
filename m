Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4244F670BDF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jan 2023 23:44:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbjAQWoP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 17:44:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229696AbjAQWnA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 17:43:00 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61D91646B1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 14:30:18 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id vw16so15764458ejc.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 14:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uDaDU/ND0Via+W2IIJR2FBHA+vh86Uj3CFJnQI7EtO4=;
        b=yFE2hUQomkInlgwiPt7lD4kob7aUTwltfxBciwuomujqJkHRZDYfYgRqiqaNw3vS10
         BlP9CvcYpb0QxfB9n4t45GOuxCQ56prhrDMBE6Hic7FcwNB+n9YGk9rZsIby3obweN6K
         nhvHVHoXrNP+pxWWQra5S6oRtEV2gcthFtH42nMB2GOog2mX0qEgc2ox02JudnlIoP0U
         pVEi29iNt5jeUbyIMbelsp9a1pphrMPkZt60ZT34hlsy4fChfmtxl5xaREAm55pT4sWn
         urnOWEYF6/vIgQ3fSBgqES8aKvZueBobxcogvAykzDD7bfkhV5DEx7BdoSaWfOg8zxWP
         nAnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uDaDU/ND0Via+W2IIJR2FBHA+vh86Uj3CFJnQI7EtO4=;
        b=DUKuC3yAXhrk9aL1yjZPPZML81Ye1mnJVBlHSxhoa+JDlb0kHx2g1hQhawKu9eAs6A
         +AtxEaNPKmVurFfXzrniURgj3D56gmThvJxNRQqFOKl5O+A4BqAjT5xeaR9ZjhvCNZ9B
         mt5/CO1z0hJE8gLM8L2rsAykqeQgYUiyZiCi1MBTQme5JOh6lJjrBCV+iiIYa0ABHIu4
         gis44PdpGp/tZh18RMrXTdfXXNqUkD0RyZPlnDLf+OiG7PHshKn4QWDG43OwFsMt0EW7
         g0PoF7hm/TaSACq9wibGDO5EBB38itRNRxMYqy49vjX78joaj3XpgCwbI2go5ZwqHhOB
         rxOw==
X-Gm-Message-State: AFqh2kplreTLH6f5R0GN1QUhZQo1V1NoSTPWG8g0ggfQGv5WZA48Yd9d
        7wKoMomKsSxV2Alo7iPumBRb9A==
X-Google-Smtp-Source: AMrXdXtcD2KelzevLES83MtDShW+hs9Oy/AY8ul2ohWGgdXILh4VDxtR8tQRvVBsuLme0L5+sB2hBA==
X-Received: by 2002:a17:906:e259:b0:84d:4923:366d with SMTP id gq25-20020a170906e25900b0084d4923366dmr4270003ejb.44.1673994616935;
        Tue, 17 Jan 2023 14:30:16 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id ec20-20020a170906b6d400b007c0f5d6f754sm13835189ejb.79.2023.01.17.14.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 14:30:16 -0800 (PST)
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
Subject: [PATCH v3 2/6] dt-bindings: mailbox: qcom: enable syscon compatible for msm8976
Date:   Wed, 18 Jan 2023 00:30:09 +0200
Message-Id: <20230117223013.1545026-3-dmitry.baryshkov@linaro.org>
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

On msm8976 platform APCS also uses syscon compatible, so move it to the
block of compatibles using SoC-compat together with syscon.

Fixes: 60545466180e ("dt-bindings: mailbox: qcom,apcs-kpss-global: Add syscon const for relevant entries")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index 36deddca1524..ecc286ab49ef 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -20,7 +20,6 @@ properties:
           - enum:
               - qcom,ipq6018-apcs-apps-global
               - qcom,ipq8074-apcs-apps-global
-              - qcom,msm8976-apcs-kpss-global
               - qcom,msm8996-apcs-hmss-global
               - qcom,msm8998-apcs-hmss-global
               - qcom,qcm2290-apcs-hmss-global
@@ -37,6 +36,7 @@ properties:
               - qcom,msm8916-apcs-kpss-global
               - qcom,msm8939-apcs-kpss-global
               - qcom,msm8953-apcs-kpss-global
+              - qcom,msm8976-apcs-kpss-global
               - qcom,msm8994-apcs-kpss-global
               - qcom,qcs404-apcs-apps-global
               - qcom,sdx55-apcs-gcc
-- 
2.39.0

