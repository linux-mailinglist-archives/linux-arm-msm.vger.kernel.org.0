Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F2C35174AF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 May 2022 18:43:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384381AbiEBQqv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 12:46:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1385338AbiEBQqu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 12:46:50 -0400
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFFCE64F0
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 May 2022 09:43:20 -0700 (PDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-ed9a75c453so4256199fac.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 May 2022 09:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SSVL4L7sJ4GCUMQJSUr4QEbXvDglQPIWtkAgagMg5GA=;
        b=qjThrHfYibUgg3Pn32zlcaEfNZPtN59YJM/5pGTSC1oCDGS2jj1atashyUleKz6j8+
         bU/iB6vPEEwtOzLe8Dz//5KSF5M2OZbESduYiT3x2CHj90hdZfk4UuyM+wABykiYgCYQ
         WD2QE50nOaA3KQvWYUo4Bkk14VbrOXGk1pAxlTgr6Tbm+c9YlWGAxHVmOYx1DfBPZEQI
         7CAcGDVapqXZEXqjU873C0wXsD1o09qkpnluDoZKKSCVOSuyHpp9DaOT1veiuvmeGCe9
         k/EcY3aMg+gft109LFQmP0ZDpCgcaf6NTrLt8Ok6sKYpyCuy1cv3XN8ZPJsE2BZ18i7u
         gi9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SSVL4L7sJ4GCUMQJSUr4QEbXvDglQPIWtkAgagMg5GA=;
        b=klQ6WazHgZb871I6l4U+PsSYdzk1s//BeISFZ8gCPV8CDk+2Wl4zal8MFxBU86EdXa
         RgDM36CQgyeaJmN0xZx0zvohmWhsfCkTOgl1F+LaQ355jPt0+4xDS6LapW0GF+VQRKtt
         fgckB6llSdif5pqTBd46F7cnMX5heGCK8MUMYk0iROs8b7uQdDOuUVuGWPTBly3eQqpY
         tPWeyDsEgo5DXW9pQRgPLeRNk/Ytbz+oHP9kohYtDHPCO4mV52vmXZ+n5y1ELuDdxQ0V
         dxbX5wwsGdbirII9lFRKf6A8il1TqtFgznQu4Id26oLJWmkM0PA4rdfiqijWJeJUcJrL
         76YQ==
X-Gm-Message-State: AOAM532cOc+QfPFArzAG5lAcagLdGeCBLeAWJg+y+pXArz7Zjo/LXGi2
        fXtxN95ce3oMujEgMm0LMGTePw==
X-Google-Smtp-Source: ABdhPJzu/WvwdXZNGlKws7RIfvy63zIrGOA8N/G95ei07bQN8rk/wkK4qvhpgYIAqP8ajvCCl0h1KQ==
X-Received: by 2002:a05:6870:a107:b0:ed:9a88:88b8 with SMTP id m7-20020a056870a10700b000ed9a8888b8mr3674418oae.298.1651509800305;
        Mon, 02 May 2022 09:43:20 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id dx4-20020a056870768400b000e686d13897sm6012889oab.49.2022.05.02.09.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 09:43:19 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: thermal: lmh: Add Qualcomm sc8180x compatible
Date:   Mon,  2 May 2022 09:45:04 -0700
Message-Id: <20220502164504.3972938-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220502164504.3972938-1-bjorn.andersson@linaro.org>
References: <20220502164504.3972938-1-bjorn.andersson@linaro.org>
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

Add compatible for the LMh blocks found in the Qualcomm sc8180x
platform.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 Documentation/devicetree/bindings/thermal/qcom-lmh.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
index a9b7388ca9ac..e1587ddf7de3 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
@@ -18,6 +18,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,sc8180x-lmh
       - qcom,sdm845-lmh
       - qcom,sm8150-lmh
 
-- 
2.35.1

