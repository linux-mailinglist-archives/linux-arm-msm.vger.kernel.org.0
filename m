Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62F585E7180
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Sep 2022 03:43:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231976AbiIWBnt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 21:43:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229779AbiIWBns (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 21:43:48 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7A1A118B19;
        Thu, 22 Sep 2022 18:43:42 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id c4so9257434iof.3;
        Thu, 22 Sep 2022 18:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=cmlo/wojh5Vp9+J8FgpPphc/JtfpcSJwctIUg2QPCZE=;
        b=WqmkzT4HasAp+GIzkY8KPTD8IarV+9i6jykrBWTmQtOTXBFvaqDB4P3LmH1ga5Q323
         4HPb+dvhiRNnoctIYZN5bPOjjlwlaKCnYMGIgktR8/OjvTQzTTk+6kFMDNi5KleAMtIv
         nUZL/LoNF3rOCvMlk4ssp0lF6bbHFYd9W5siQbl5Up2Aa/VKVvOU80jHW/N2f1MFb+tJ
         tMWsLeBUgS99qoDSLiW5ZG6lZdWbpShNQEwgs2d+7nsEF4iU1mkFaLPROfd4LviJnx5y
         EWdjQTe2a6Vqq36lZ+ZRqSgroxMQzeMX+GC0H0bUhNdQZthPyVcTqACIxSlPkCrm6VAv
         ruLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=cmlo/wojh5Vp9+J8FgpPphc/JtfpcSJwctIUg2QPCZE=;
        b=Wny2pxPCWvS6IgXCc+lZXCA6PbdbxKU95i05iaB12b8p8juw/ipRFDjcdqa7ZAr/W3
         vZm0UxrNbEnKVqk2lF/lFY4MoQkKrbTHMLH6xVo6Ts/Z8f9u/c1lmjzpQMMIcHO35nk5
         fASZ1RYYvhQhgzURPGclH248bdzgPcn38Q9pjLmwE35BkiZkmy1gNQJbxDkSXKlzBHW5
         0kt6H09qXYxKZl98pkdexutbm4Dv9MbB0atA3yoDvygiiaw7+i1l+WuXNIGKnagh2f2E
         25fKDvWu+R0Juhv8vqJ7go33rQv2s+LreaACYSPCJsWFEAMO++1BVaUUhxaClVrus3Mk
         r35Q==
X-Gm-Message-State: ACrzQf1sX7PnahNUg57AcsX1n3NaPITEeCsBNK9vYBYeOnF+yGky3kDc
        eK8y/dgB0sATtqk4+Koed9cxpuJxgaY=
X-Google-Smtp-Source: AMsMyM5vwWgMXzazek9vqaYERsqbF63cirApd9wtIcfNsRI+aRHA0LdmUJ2+j0YymRNlxfo6RSwmIQ==
X-Received: by 2002:a05:6602:1687:b0:6a4:d44:74bf with SMTP id s7-20020a056602168700b006a40d4474bfmr1628679iow.80.1663897421637;
        Thu, 22 Sep 2022 18:43:41 -0700 (PDT)
Received: from localhost ([2607:fea8:a2e2:2d00::1e16])
        by smtp.gmail.com with UTF8SMTPSA id m41-20020a056638272900b00352a7f96772sm2823832jav.38.2022.09.22.18.43.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 18:43:41 -0700 (PDT)
From:   Richard Acayan <mailingradian@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 1/2] dt-bindings: mmc: sdhci-msm: add sdm670 compatible
Date:   Thu, 22 Sep 2022 21:43:21 -0400
Message-Id: <20220923014322.33620-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923014322.33620-1-mailingradian@gmail.com>
References: <20220923014322.33620-1-mailingradian@gmail.com>
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

The Snapdragon 670 supports eMMC with an SDHCI controller. Add the
appropriate compatible to the documentation.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
index 775476d7f9f0..a96f143479c7 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
+++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
@@ -38,6 +38,7 @@ properties:
               - qcom,sc7180-sdhci
               - qcom,sc7280-sdhci
               - qcom,sdm630-sdhci
+              - qcom,sdm670-sdhci
               - qcom,sdm845-sdhci
               - qcom,sdx55-sdhci
               - qcom,sdx65-sdhci
-- 
2.37.3

