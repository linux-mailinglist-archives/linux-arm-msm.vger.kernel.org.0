Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01E9E503755
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Apr 2022 17:40:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232438AbiDPPnG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Apr 2022 11:43:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229797AbiDPPnD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Apr 2022 11:43:03 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73679433B5
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Apr 2022 08:40:31 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id bg9so11240265pgb.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Apr 2022 08:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MLiyvZcLIUnaVPXblBwx9+1eET/plc8foqRJgpRSeUo=;
        b=SiCgVARYhgTmE574/ks7bfySHsHCa75Ed7+PW4wt0YORpyGdyiqXC+XNiirg0Dw9jn
         HjZpIKzu153NIOr5xxptZE/ESJV1IDLbBiMYtToZnyI5rZpKQQ+kaw7BYHmZJUDFq8u1
         p7vMHTkx1h4ydSKoB31ia0CtaAfgg/lsUab2snaIbYmDrBBxtEMx18jEnxIuyIYcjuS5
         AyExSjdS8ojML3jjv0m7jhqBHi7fpvalDEvMeEgUWrM1WBf0h8/ZeSaJ6L5VOVOQx6d6
         w+E8/I11bIYsbMipF4KtRCC64RHe8I59E8oyerooYrlJnKVVRsFCkt8EakZt7kXSnRh1
         X1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MLiyvZcLIUnaVPXblBwx9+1eET/plc8foqRJgpRSeUo=;
        b=os/eWHZjSwY2Qmhp4wgg+7JlIt2yjrzDRVvCgGi82c3mSYgfUFPQwQKjUyxMpuPl1i
         TPpioloNBFEv+8AT7bvdDzNEsxSt5agv0lMVLnKoLNsbvtB/3VU0VuV9yGUWLQR4Fu19
         aC/PDcC5IGZ+Txm3xbRrglZHqxtdPSz837+AMDa7fbq76SSXUbS2aRuXVczySOAYLVCm
         hL++/kfe/9n2PLs4cXiEwWw4jeGFoiN41hDVSxmmq4UcOolphorvISzTGwjTpkk+aptg
         0Qa4aRPnl7EI7kOC0IywEXjYnvJVvLSHTuqLPVU7cZOCEs+Cc2sSClBUs04xgvnkqn+L
         3JDA==
X-Gm-Message-State: AOAM530+lI8oKfnsc6asfI+XbHTIpRlYs2uvt9CfuB8gp1J2EbGNZJ3U
        iwRIorlIB8unnyD41awk5h3z1g==
X-Google-Smtp-Source: ABdhPJx5XKw3cl8ll2dro4UYoS+fk0a53QJruoeWYW8gH4r+D9d0PHhg/1q1oq319RL8SOJa0/iBVw==
X-Received: by 2002:a05:6a00:8c9:b0:4fe:ecc:9bcd with SMTP id s9-20020a056a0008c900b004fe0ecc9bcdmr3950760pfu.34.1650123630920;
        Sat, 16 Apr 2022 08:40:30 -0700 (PDT)
Received: from localhost.localdomain ([134.195.101.46])
        by smtp.gmail.com with ESMTPSA id z16-20020a056a00241000b004f3a647ae89sm6358681pfh.174.2022.04.16.08.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Apr 2022 08:40:30 -0700 (PDT)
From:   Leo Yan <leo.yan@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v1 1/5] dt-bindings: interconnect: Update property for icc-rpm path tag
Date:   Sat, 16 Apr 2022 23:40:09 +0800
Message-Id: <20220416154013.1357444-2-leo.yan@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220416154013.1357444-1-leo.yan@linaro.org>
References: <20220416154013.1357444-1-leo.yan@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_BL_SPAMCOP_NET,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To support path tag in icc-rpm driver, the "#interconnect-cells"
property is updated as enumerate values: 1 or 2.  Setting to 1 means
it is compatible with old DT binding that interconnect path doesn't
contain tag, if set to 2 for "#interconnect-cells" property, then the
second specifier in the interconnect path indicates the voting is for
which buckets.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 Documentation/devicetree/bindings/interconnect/qcom,rpm.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,rpm.yaml b/Documentation/devicetree/bindings/interconnect/qcom,rpm.yaml
index 89853b482513..7464a50804db 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,rpm.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,rpm.yaml
@@ -118,7 +118,7 @@ allOf:
                   - qcom,msm8939-snoc-mm
 
               '#interconnect-cells':
-                const: 1
+                enum: [ 1, 2 ]
 
               clock-names:
                 items:
-- 
2.25.1

