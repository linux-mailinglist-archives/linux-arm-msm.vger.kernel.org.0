Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B7245BF040
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Sep 2022 00:37:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229471AbiITWhz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Sep 2022 18:37:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229764AbiITWhy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Sep 2022 18:37:54 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92E2B63F21;
        Tue, 20 Sep 2022 15:37:53 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id h194so3626589iof.4;
        Tue, 20 Sep 2022 15:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=hJ/3F+3Q/iQ4fM5YaCBMqVUY89/aMeDjr8XJkGMcano=;
        b=mRS40Ca7NRdzrnra0s9lPotNSUSMx3ZEmbuO4Z3Bvbc7NNc7rmJOH0v9tz7eZ3URDQ
         aUFXUlQJke9a9pe79qDoBu8TpZIO/OQio6/5kvAaMg+zVJaiQWI7qSfWoGVSnnSLkPsB
         VAnT6wLdXhTipI5cGLOWvOoR14ZeiAOh71IMUBIiXd3J+sfxY3dAFMuXM8wIOgFF79ir
         8c6wGhkk6GCPuW99Xt9X5IvIsdufQZZvx+0qgUgKBtl8exGJ6/W8RF9OSdSjo7PpI8B/
         01SbYKgVJep9Rl23pHKOaTXtpN1dNWYeuIa1RZ0x/pZqbkjbMKNihX1AVTQDXvenkXTO
         ssAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=hJ/3F+3Q/iQ4fM5YaCBMqVUY89/aMeDjr8XJkGMcano=;
        b=6/Zna5367WdWuXM1yPcRQULaLc+j9vAyDtGCCpbUwG8blxXHGP2XQ2PKxQjQ0VoIfN
         YojvOVlgv0s57+LiaqujI6ti9K5E6SBP6fVJlNUSPuANbRgDim/8IykSkyWUNsjfceb5
         u75CVOe7TCi/5k1079skcPmVjk2AFn0P7F8fJw3L1Efe+8tKCOW6DzO+LhlsCe1qGeGR
         OoBG4y2W4RniXWQj8E+0YG6RG5D+jbuy7foMpCVAK8siKRonghaM5w34oBmjeXoDe4vG
         Wdrjb4fdU1lW3FceWz1Z3lCqFh89ADkDmG7zgo6axoneXJxo1btDy90qusoJBbJUeQF/
         438w==
X-Gm-Message-State: ACrzQf3ZQEEOZzqs/g0x9lZzFB5WOIcqsQ9Xv63W2Kn0KX+LUTwvfelV
        XlOWsZ6mdi2XOG+KdIXxiwy8O1aYBk8=
X-Google-Smtp-Source: AMsMyM5aS4KZjjteSH2GaMW/zJDP1lxKqhLY9CbzPtAFMPwux505ypYHIMJlTcdrMNAd9a2fSV4TKg==
X-Received: by 2002:a05:6638:2414:b0:35a:b7f0:492a with SMTP id z20-20020a056638241400b0035ab7f0492amr7595115jat.78.1663713472773;
        Tue, 20 Sep 2022 15:37:52 -0700 (PDT)
Received: from localhost ([2607:fea8:a2e2:2d00::a533])
        by smtp.gmail.com with UTF8SMTPSA id g38-20020a028529000000b00350682ba05csm389340jai.30.2022.09.20.15.37.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 15:37:52 -0700 (PDT)
From:   Richard Acayan <mailingradian@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <tdas@codeaurora.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: clock: add rpmhcc bindings for sdm670
Date:   Tue, 20 Sep 2022 18:37:33 -0400
Message-Id: <20220920223734.151135-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920223734.151135-1-mailingradian@gmail.com>
References: <20220920223734.151135-1-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Snapdragon 670 uses the RPMh mailbox for some clocks. Document its
support.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 8fcaf418f84a..437a34b930e3 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -21,6 +21,7 @@ properties:
       - qcom,sc7280-rpmh-clk
       - qcom,sc8180x-rpmh-clk
       - qcom,sc8280xp-rpmh-clk
+      - qcom,sdm670-rpmh-clk
       - qcom,sdm845-rpmh-clk
       - qcom,sdx55-rpmh-clk
       - qcom,sdx65-rpmh-clk
-- 
2.37.3

