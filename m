Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EAB3649EBB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Dec 2022 13:33:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232210AbiLLMdv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 07:33:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232211AbiLLMd1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 07:33:27 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ADC263A2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 04:33:26 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id v13-20020a17090a6b0d00b00219c3be9830so12032453pjj.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 04:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=alhK3ndi55Pn+UAZvehWSr5HT0WJYLohN8j26G14+mg=;
        b=qQu0KWtTsFZWdV2sgVCoDF3kIQeVcPNBTz1gprS37Trlf5kvhITuKFb77t0cE2+p0X
         ZrHStY317cD6gGjT64Jv9Hs+NJC1Kt8FMbQrJLmJWO+fbzjSkIXQj4xIq9171qJfb54c
         /bgEAeuR1jxftiiHNG961TjiKDzHELKKP9LIiGhP0K5hOgSWbjV/J84RAqRsuVahWzpD
         cKlgfh4+JAHYm+nmzxDZBhw1ELNJ+kyoIdFNUzbRbaAmGuuWf0w6b/1M/Fr2faKOzeJQ
         nIaYxdQQ9WtePfcI2YFxuOIbpk2pzKi59X4wy53mqLHUnp4cx4WVHYitfVc697GcFkYP
         FJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=alhK3ndi55Pn+UAZvehWSr5HT0WJYLohN8j26G14+mg=;
        b=cNPRxx5m6xRFuO6QJO6oUtnKekNyyVgiKqa2rXrQOSHeeh2/s9qzmWFH5Fny5nzkYH
         MIZREswDSozSnTDN808bS6xa8XULzV23a8sV7t2kwh+WUI8FV8O8fr4twJf2IABkr7Ik
         jykqdAoONaMXnMF0ec/2aQYD5W1sBLDGH/Qfc/rfKQJy+/qtpUNDHUzKzzGvIfQ5Yy/C
         C5tepTuKg9AKC41AawPCCKzLC85BQQUZz1lMOPjF2QjRSH2sQr0v+AI35x5YMzBPaOu7
         c2vkU4uDORnhz4AtwKODaqmeR9K4vdW1G/YxSiE7fqw/h2bGrFdKoPtYCUzhtQsdOhmf
         OqYg==
X-Gm-Message-State: ANoB5pm2mu+BMM4S+gk3JYm/RZaWA6KHatq0sB8QU4u230hla5vB1qzc
        xwzSFzeeAWb5lgVmMogtxw/J
X-Google-Smtp-Source: AA0mqf76W0vYctaP4uQGyTxz6lzA6fM+RGW0zYYAEweKJgILQ/VqIjWxTs1rUO32oLY1EHGDhJaxmA==
X-Received: by 2002:a17:902:9b97:b0:189:9e91:762e with SMTP id y23-20020a1709029b9700b001899e91762emr15738614plp.57.1670848406037;
        Mon, 12 Dec 2022 04:33:26 -0800 (PST)
Received: from localhost.localdomain ([220.158.159.33])
        by smtp.gmail.com with ESMTPSA id j14-20020a170902da8e00b00189c93ce5easm6252557plx.166.2022.12.12.04.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 04:33:25 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bp@alien8.de,
        tony.luck@intel.com
Cc:     quic_saipraka@quicinc.com, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        james.morse@arm.com, mchehab@kernel.org, rric@kernel.org,
        linux-edac@vger.kernel.org, quic_ppareek@quicinc.com,
        luca.weiss@fairphone.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 01/13] dt-bindings: arm: msm: Update the maintainers for LLCC
Date:   Mon, 12 Dec 2022 18:02:59 +0530
Message-Id: <20221212123311.146261-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221212123311.146261-1-manivannan.sadhasivam@linaro.org>
References: <20221212123311.146261-1-manivannan.sadhasivam@linaro.org>
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

Rishabh Bhatnagar has left Qualcomm, and there is no evidence of him
maintaining with a new identity. So his entry needs to be removed.

Also, Sai Prakash Ranjan's email address should be updated to use
quicinc domain.

Cc: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Acked-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml b/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml
index 38efcad56dbd..d1df49ffcc1b 100644
--- a/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml
@@ -7,8 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Last Level Cache Controller
 
 maintainers:
-  - Rishabh Bhatnagar <rishabhb@codeaurora.org>
-  - Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
+  - Sai Prakash Ranjan <quic_saipraka@quicinc.com>
 
 description: |
   LLCC (Last Level Cache Controller) provides last level of cache memory in SoC,
-- 
2.25.1

