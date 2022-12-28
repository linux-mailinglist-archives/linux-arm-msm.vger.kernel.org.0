Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52DE1657413
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 09:41:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232733AbiL1Il6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 03:41:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232661AbiL1IlT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 03:41:19 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA44AFD01
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 00:41:13 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id 82so10219386pgc.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 00:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=USFa3vv6r3M6at72+GYbrAEuQqTIcmw3cLL2W4/Vhuk=;
        b=kpqldBi40qr6VGpY4wIciIgIpry8ox+hTxyKAge6AX9QRyA7AAeM4uKrICN21Ek/NB
         EpxfHZd78zqiNNERABmX4jaGzGGQ3MF5KetlMnqlzpTbjNLQfRY2pLM0ogMMpk7wVcPZ
         LNxJqGsWgDQ1Y5HGeHze/TDe3rHfLFzktxduIOkD2lRHt/ZDbac6fnNLgrVlFiUaAym0
         rkxiezXfc4OFwPt2q3iCSm95FVv9djSK0FbhNuW4AcFmIAV622ibpB+M1XIDCT6zprKK
         mMv09WZP2jedMbEOgDzL/xdVBeSbC+NGXqpoGWvhDXqkawAd2bN63Kr9Om77SCFRiXVQ
         NZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=USFa3vv6r3M6at72+GYbrAEuQqTIcmw3cLL2W4/Vhuk=;
        b=ref2dGC4wIkuW7SLWwniQAVwbFYE9Zum9w+IYtug4gDDzzanBi2zXdJt+7NYF/uprR
         HQc1b9RaC2PEVxGHBhk4Oudi7T7HY23Sm64TItKODKOHvC2ajwe67XvFfljmPL9d4wim
         w5CjUKQp3L6JOrs2MhwLbu4Lb64kuRvipBlYkADXTdYPe+eL8xN9apV/0LmSZrT5w/0H
         E609i9Ke/g4Vxlmcl8OSuTjCb85EDWqij0dt8Y16J0OnHiKZHZ/N5nGkoGsIIq01I0bT
         sqrxb0CQQNZkrTc5EdWYjwxYJWOISh3Phesl059Mr33RD6g4tJofq0AdWDCwSZKJCrGw
         IPVA==
X-Gm-Message-State: AFqh2kpbGTLEJTx4cyTq8qiIpi0BcJEw+QudFLv2x1Ft0SUOtpiOVCZ2
        UdLmY3e+EeY5H05rGzQgjz/1
X-Google-Smtp-Source: AMrXdXttzAeX7SG+Jw9+MV91sz3bAxNDR5fgdUGZ8cafi5MRu6SswAWEpMziT8o2hrU+n9jRVEWSrw==
X-Received: by 2002:a05:6a00:1885:b0:580:9a80:6e37 with SMTP id x5-20020a056a00188500b005809a806e37mr25225588pfh.25.1672216873572;
        Wed, 28 Dec 2022 00:41:13 -0800 (PST)
Received: from localhost.localdomain ([117.217.178.73])
        by smtp.gmail.com with ESMTPSA id d188-20020a6236c5000000b0057a9b146592sm9786286pfa.186.2022.12.28.00.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 00:41:12 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bp@alien8.de,
        tony.luck@intel.com
Cc:     quic_saipraka@quicinc.com, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        james.morse@arm.com, mchehab@kernel.org, rric@kernel.org,
        linux-edac@vger.kernel.org, quic_ppareek@quicinc.com,
        luca.weiss@fairphone.com, ahalaney@redhat.com, steev@kali.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 04/17] dt-bindings: arm: msm: Update the maintainers for LLCC
Date:   Wed, 28 Dec 2022 14:10:15 +0530
Message-Id: <20221228084028.46528-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221228084028.46528-1-manivannan.sadhasivam@linaro.org>
References: <20221228084028.46528-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

