Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F4D55A92DF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Sep 2022 11:15:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232995AbiIAJPC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Sep 2022 05:15:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233532AbiIAJO6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Sep 2022 05:14:58 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3100715A36
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Sep 2022 02:14:57 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id n65-20020a17090a5ac700b001fbb4fad865so1921306pji.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Sep 2022 02:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=u2QS6fg72hwaCjD3sPqvtQp+8aS8fo77aTYpyXjXL8Y=;
        b=PZ+CH7EXjkNOGhZq8PDnXpvC/rs7V5KmsN+G9ndQPrmNIwdLfdESoA8UJ+InSHTsez
         4SuPCXQ8LlFheSraJQcoydEcyKZOyxxciV+8TuAKKvzNcibV42y+eTFtDaDDJ5513JTL
         kPWjBsieaCYl5n5YG/cXLiVkTFw9uX5Msk88LjpWvtLRvl/oUKgh5054t8zAH8GRju+y
         6P57VLWb3kQaHU1Va2AHi3/y/v/rgNmH1pgQbp3LHeiN4UdsQVF3ESwzp5CApQa7HwJ7
         ZgBVtiWLrwiKGlJ0h5wj2KZ3uxMcmgqsvvkf2W24dRxma2qaDG+edK0Bv+HwocR+ZHHp
         g/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=u2QS6fg72hwaCjD3sPqvtQp+8aS8fo77aTYpyXjXL8Y=;
        b=c5mbw5atVvT6fLKaq4dvktfxvT9FBF7EHyy6zUPoEf1+bMDQ3j5mYn/zE+mtaOcia7
         O1dm/IVdNV8Drypp7k/Sw/eA8/0rTDOQ5Vy9c0CLbE36V8qLe/OracRPzelpVaii1EMD
         PbOwn12i6hNKHSk44epNpvLTNAk7JdNxssLWq40zfheCYJhGmBgGsTmwjxYEyF9E8fgh
         xDdFoPPEASxCpUhgYb2alWAoefDTEW0jcyu4U4IZjx/4smwb3rcGQQ9lqEzZeP7avzaX
         mCyy2rtaGVGQJbUoWJTcKWHgFfNbBb+0oNUNez86Eb9U2640eo9GMmV36a3faoBLLAvk
         0eZQ==
X-Gm-Message-State: ACgBeo3kIKbD8/jeQ9sMg3gt9iUELhhIZgL8pedoouuvslZtL+IMYqeR
        Hz3pVkkmAxv+1M7NGuJ0ytAeng==
X-Google-Smtp-Source: AA6agR46ay4uWAyG0W62enE08jDIaDsaC4/Vabm9eAdkyK0tCeaSUZg3V9EQHH3duG/T7jtqgADLxA==
X-Received: by 2002:a17:902:694a:b0:172:bd15:3ece with SMTP id k10-20020a170902694a00b00172bd153ecemr30260732plt.116.1662023696569;
        Thu, 01 Sep 2022 02:14:56 -0700 (PDT)
Received: from liang-Predator-PH517-52.. (60-250-232-247.hinet-ip.hinet.net. [60.250.232.247])
        by smtp.gmail.com with ESMTPSA id n12-20020a170902e54c00b0016efad0a63csm13553284plf.100.2022.09.01.02.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 02:14:56 -0700 (PDT)
From:   Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     mka@chromium.org, dianders@chromium.org,
        Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: arm: qcom: document sc7280 and evoker board
Date:   Thu,  1 Sep 2022 17:12:53 +0800
Message-Id: <20220901170958.2.Ief93544cd0cbfa412092f5de92de10d59a2a5b3a@changeid>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220901091253.93333-1-sheng-liang.pan@quanta.corp-partner.google.com>
References: <20220901091253.93333-1-sheng-liang.pan@quanta.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This adds Chromebook Evoker to the yaml.

Signed-off-by: Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
---

 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index fb1d00bcc847c..d4b2d947859d4 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -565,6 +565,11 @@ properties:
           - const: google,piglin
           - const: qcom,sc7280
 
+      - description: Google Evoker (newest rev)
+        items:
+          - const: google,evoker
+          - const: qcom,sc7280
+
       - description: Google Herobrine (newest rev)
         items:
           - const: google,herobrine
-- 
2.34.1

