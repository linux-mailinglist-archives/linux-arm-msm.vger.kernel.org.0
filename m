Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F4556511DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Dec 2022 19:30:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232375AbiLSSab (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Dec 2022 13:30:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232300AbiLSSaY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Dec 2022 13:30:24 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6066113E0B
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 10:30:22 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id d15so9866888pls.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 10:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=USFa3vv6r3M6at72+GYbrAEuQqTIcmw3cLL2W4/Vhuk=;
        b=mxs/QURMh4Fchj/EQo9a4AGEN62JMD4qI4PsAb5DECS/FWcz6SEegn5LTPabE2SnAZ
         aqr/d+Vl/CV7+kvD/6L9Qlxo7EEAx6k7r0k+HTS+WCSHrb6dea46bmVMgZtpfXDOgjRR
         rJqcMYrrmHivbMDQ38bYFhbgngB04BRMW8rStF0cx+U9BW2wSrkLFNENNdtdQ7fpQMvd
         nNcznUgwpLBV6h8sajGjHUKbf+hliLlOKuLcQMeBsCoWBJ9Lr1xFYW+fqT+z/lqSwAPp
         SSxwJuPPX/LzqswbbKl5Q2GLkosy/nb9FHL79u/8IEOTDSs9oIBkhHsxr099vmFW8/B6
         +VHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=USFa3vv6r3M6at72+GYbrAEuQqTIcmw3cLL2W4/Vhuk=;
        b=O4hdk/SUtQoufu7MoQigjFr8QBNaInu71Dg6rW4EYDMyYK7O4kDC5ooyiKNA1QaJC0
         iB6b/rpHC4IAJcbWPTZIgOZrNmYlZ7KNLjrh+PJN7rlEJa5H2cBViX+UQPketWzc19iL
         NDkXlqIKFG76iMNjVf/YHUN5zLM+XvRRbRmWa0dFMIR9q4sg8cy+gSvPfr8MDhGNco6r
         jL48HAohCruq1cAGpEtq7JwYk+EkBd6hU9vzombyx+ED3AdMMcnFGUx6/yrYAIz8+MVf
         FmeHRBOYIRCuUsj+wnV9KiO03Mk5UXu+lgqp4Fpm7GCecl9/HlAtZVuojHUuGsmpESE7
         wiVQ==
X-Gm-Message-State: ANoB5pnr9h60KvmsgUT3CUmqtzkvZnAsWc2oyCt0LmUgYxw7Y0KIrHUC
        NEQr5USOyAe5kVmNKoqXMP5i
X-Google-Smtp-Source: AA0mqf5v+vtHo5VuKIcrEBj8EX9SIFPOt/nqRBd8N/jVTS5jLillcOEfaAPUTVUM87uT3teTCIhpCw==
X-Received: by 2002:a17:902:6bcc:b0:188:5256:bf60 with SMTP id m12-20020a1709026bcc00b001885256bf60mr42148384plt.25.1671474621807;
        Mon, 19 Dec 2022 10:30:21 -0800 (PST)
Received: from localhost.localdomain ([220.158.159.17])
        by smtp.gmail.com with ESMTPSA id d2-20020a170903230200b00186e34524e3sm7480979plh.136.2022.12.19.10.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 10:30:20 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bp@alien8.de,
        tony.luck@intel.com
Cc:     quic_saipraka@quicinc.com, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        james.morse@arm.com, mchehab@kernel.org, rric@kernel.org,
        linux-edac@vger.kernel.org, quic_ppareek@quicinc.com,
        luca.weiss@fairphone.com, ahalaney@redhat.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 01/15] dt-bindings: arm: msm: Update the maintainers for LLCC
Date:   Mon, 19 Dec 2022 23:59:44 +0530
Message-Id: <20221219182958.476231-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221219182958.476231-1-manivannan.sadhasivam@linaro.org>
References: <20221219182958.476231-1-manivannan.sadhasivam@linaro.org>
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

