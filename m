Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DF075258A3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 May 2022 01:44:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359677AbiELXoQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 May 2022 19:44:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359616AbiELXoM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 May 2022 19:44:12 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACEE428ABA2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 16:43:57 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id a23so276233ljd.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 16:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Mfq8artsCmgPridHwXtCTWz4VD26jC/9nXCO2mqCNlk=;
        b=nk+O2VF70/VkFvaqUpHyDSM3PyW8u4BeOP4nAkdnQGsuzo4aaBPp0vcPpC+ESYSNPM
         kGY1rBZCJWZzczefk5MDQ8UY2kZk/a8gUJifIDFxtCn20NEnAR9YLb+2NLplwjFyFWiz
         ntequ5Texs+odZWuQDpDrXY/Sqygrr/raBQpkt//ipGDeY8971AP3ReVe1J9g07eAgsM
         EHbinKd1PbSZUMO5cojXPqe8w2PfClM1B/4xfBYqVP0pEKa/bQz2ujMSqAzS5q/kFRT1
         o1nRNn3ClTJDiTcB50yDB5D8USXMT2nZA5NLS7p4Qk6/c2Qjf6kQR12ygUZc3yLcFOsA
         64qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mfq8artsCmgPridHwXtCTWz4VD26jC/9nXCO2mqCNlk=;
        b=3JvAL8KEKpOccvlraff0QhCkVcdgILxer6hbIuDGzVgqjLQincVCEAhKuMb9p9W1CP
         7tMPQN3StKGapNNwnwaQm/oc1NHPFPy34hcEA74UEareOnbRHFmRZ8TVMb5NJ8bC9f/Q
         sh8O6k4pF3pJ43vmTX3EAzGB7L6IfOvURcwti5vvylBmKb0nlarc7jDE2C4ro/vZyBqS
         3Q6zqcmhum5eCHnfCTUoB3bsyod4/RA+jlI4HpPFyc0BoeQjoxRL1s62xkxNpqgi0egq
         LZlL02u8V4OXn6v6/qhrS/ND2q85u8T6MBRFNyv1hdFyd/lhOc4J+yssOa7SUjniSvZo
         iNaA==
X-Gm-Message-State: AOAM533EvOXcNjBzBwMsldlxwqdrM9ARKoCU+10sMnnzZbXMCBu30k6d
        di65eSyiBmxwvmCAZ3aCM2g8MQ==
X-Google-Smtp-Source: ABdhPJyZNJTdASj3mJCq9oemHQzr/4AV5ZKfhlamEN/YJACEPxe64G+htUDPyzeEDPKdJHT+6aZ0zQ==
X-Received: by 2002:a2e:88ce:0:b0:24f:fff:603c with SMTP id a14-20020a2e88ce000000b0024f0fff603cmr1418276ljk.527.1652399035828;
        Thu, 12 May 2022 16:43:55 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u10-20020ac248aa000000b0047255d211b8sm129976lfg.231.2022.05.12.16.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 16:43:55 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [RESEND v2 8/8] dt-bindings: arm: qcom: document sda660 SoC and ifc6560 board
Date:   Fri, 13 May 2022 02:43:49 +0300
Message-Id: <20220512234349.2673724-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220512234349.2673724-1-dmitry.baryshkov@linaro.org>
References: <20220512234349.2673724-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add binding documentation for the Inforce IFC6560 board which uses
Snapdragon SDA660.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 129cdd246223..ac4ee0f874ea 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -41,6 +41,7 @@ description: |
         sa8155p
         sc7180
         sc7280
+        sda660
         sdm630
         sdm632
         sdm660
@@ -225,6 +226,11 @@ properties:
               - google,senor
           - const: qcom,sc7280
 
+      - items:
+          - enum:
+              - inforce,ifc6560
+          - const: qcom,sda660
+
       - items:
           - enum:
               - fairphone,fp3
-- 
2.35.1

