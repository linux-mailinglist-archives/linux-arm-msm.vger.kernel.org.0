Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2F0F633842
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Nov 2022 10:23:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232667AbiKVJXx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Nov 2022 04:23:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231773AbiKVJXv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Nov 2022 04:23:51 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9F5C25EBA
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Nov 2022 01:23:50 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id h12so17245241ljg.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Nov 2022 01:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0U8XxawDGWCZzhMqQukKmwsffMYQ51SkEqy9nNuVT0c=;
        b=h0FsqIthkC8HTEetRPlBsWqyafaJq6Lm0EVShqc7hdQcLBOakjcQK/WU4rp1Pa0uLT
         LMLwe0hz/Ysn1euiYBVyZpMmtKYPqbksUk8GtjoHnzOiqyztpvPLyc6uQBcDyFdYm7hy
         Gu1UvMfRWaSOrbUotzzAi8r6vOJM6GIh07AEByviNnR1z0Ng6OFSHq3rZJlzzCMK/hM+
         QcQWWXkP9Lp87ehDHmSiKNkKk9RR1FpwkeU+/7HY3MG6R46gX8Tvm6DEle/WAAt6de6v
         Uw5NOMb6xluufDEHg/JfNoiQYaKt3mpleFpAuqezx7cqaInRLE5bTNGANVOS36Acf96Q
         9h2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0U8XxawDGWCZzhMqQukKmwsffMYQ51SkEqy9nNuVT0c=;
        b=uHTndRr0WsRyDw189gkIZV3GbE9Ued+d7zWnTmD9BEL2M0LG67PvUyzhSyX+ExCHQ7
         mz5a0+vAbeckBT0HmtIFeOpNOTPImSnEc2hKUIpIrFLHH8GS7K9yS6TurdnrUEjNuyVh
         AB117cS4gId0NOc7PhwXKbxa9TugSUgCSmfWJJntPwaWfCTOxnexviyM5r95PkQZoX2R
         COY33ZDOF9zJjtgoPMQpxzTRulUUXU0fhACUbdPbCYNAfJkZWxYJwqgWRYAZ1faAW7ZN
         NkVZZeaK8EwQKO5aOFBu+YpgjjgtyUKfIDTsF6HLISzM7oqT0eDJT8pJ50JJTm9eMrkw
         3JBQ==
X-Gm-Message-State: ANoB5pkRevru8vtmDU1cHkFS5vbD5gvp4ImHsftWgctN9EEqYFEBMfNU
        66+NqGnV6YFW8rVlUu20WAmLOQ==
X-Google-Smtp-Source: AA0mqf6vgG7Plae1Er/CfRBduDzg0qcvzJd7Hj0Nhl71bndZ4HSmKfVtly3r5rgY9vjTEkAz3tEFzQ==
X-Received: by 2002:a05:651c:1101:b0:279:73ba:8719 with SMTP id e1-20020a05651c110100b0027973ba8719mr6266ljo.294.1669109029052;
        Tue, 22 Nov 2022 01:23:49 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id br31-20020a056512401f00b004b1a5086485sm2405609lfb.2.2022.11.22.01.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 01:23:48 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>
Subject: [PATCH 1/2] dt-bindings: firmware: qcom,scm: document MSM8226 clocks
Date:   Tue, 22 Nov 2022 10:23:44 +0100
Message-Id: <20221122092345.44369-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Document the clocks (core, bus and iface) used on MSM8226 SCM.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Abel Vesa <abel.vesa@linaro.org>
Cc: Sibi Sankar <quic_sibis@quicinc.com>
Cc: Melody Olvera <quic_molvera@quicinc.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 25688571ee7c..fc986f2f5d30 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -111,6 +111,7 @@ allOf:
             enum:
               - qcom,scm-apq8084
               - qcom,scm-mdm9607
+              - qcom,scm-msm8226
               - qcom,scm-msm8916
               - qcom,scm-msm8953
               - qcom,scm-msm8974
-- 
2.34.1

