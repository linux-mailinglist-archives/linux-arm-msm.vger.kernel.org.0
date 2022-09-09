Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B7145B3945
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 15:41:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231366AbiIINlF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 09:41:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231405AbiIINkx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 09:40:53 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D7316D57D
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 06:40:43 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id d2so2833343wrn.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 06:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=/JHla0F35IozkiqQIzTjVO2NcrigeN2J9tZgph/xMOA=;
        b=xYS02JxKcU8z9lsEwG+80y7sOqwKKgMVwCBmJg9JOM60JsMnjHv9V2RuPC7qxs87Om
         tZ4hzIINi+dzyOwyNAEtaC/lVGT7c5dgJ1I18w6s99dPWq2YrtJxwjtvfASjWxb1A2+F
         ZJ2H9l0vCg63xymiqntsVDvt6rE6ooPYoWGAMCTHeZUPuVzaSX9MxxlUbcOqHP+Mwu8Q
         sixBfceNipqP2ccDug6YkH3kFXEJtSYl43g8AUv5FLJpwLUfBughdG6YKbKx0ZzVD6wh
         fzf0/XknGUTc1CWidf21Pm6rLxbEriS9LKgNWnLeC7vR0rkV2FJRkauzgzMXpwqQZQ1y
         gKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=/JHla0F35IozkiqQIzTjVO2NcrigeN2J9tZgph/xMOA=;
        b=UsYLYGf0IQMxacq31jFAvjBiLTPNA9VP/AEcU3JcMi75kDiZJv/eREClLuBxCuJtGy
         FN2F6UKUnC1jY0KsD4OsoMSNcangP3lHqrhdbHc9UHo2x8PNCt5kKK1zrjQpC6n7TKlz
         xWdCbzr2kp4eqeJuMEMq0jmS+BQjDrGzUKHA4D5O6taVxr7MkeF6aqD75gK0osG7ATAF
         HJ+2869dlAFexPuYUS2B2kiGZcJd2KipcwOS8Ynzbp4gex5N7yNenzZWl8Y/NmLUofJJ
         v8/gmwLxao7moo2vjnf+f1PspFPCzhljemZFkMwYzgrzWYuziy2OpkusZP+v2N889VJc
         0mNg==
X-Gm-Message-State: ACgBeo10CQQ2zPX2yOFck6tWkvfUAzWPt+sXNjLjKIQj1/8YLxYGJmr7
        zcOVWeH5ficJEaaAR1Wzvq3IRg==
X-Google-Smtp-Source: AA6agR6XWBSpwXLYjMZyN5U5ayd2lacGsWUZoiyhYHBfQziKSJVbUVNcgqqnvTkFCv3EiK5ZvzO4bA==
X-Received: by 2002:a5d:4285:0:b0:228:6321:c6e with SMTP id k5-20020a5d4285000000b0022863210c6emr8082125wrq.433.1662730842211;
        Fri, 09 Sep 2022 06:40:42 -0700 (PDT)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id q20-20020a1cf314000000b003a604a29a34sm660622wmq.35.2022.09.09.06.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 06:40:41 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Ekansh Gupta <ekangupt@qti.qualcomm.com>,
        Bharath Kumar <bkumar@qti.qualcomm.com>,
        Himateja Reddy <hmreddy@quicinc.com>,
        Anirudh Raghavendra <araghave@quicinc.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org
Subject: [PATCH v3 03/10] dt-bindings: misc: fastrpc: Document memory-region property
Date:   Fri,  9 Sep 2022 16:39:31 +0300
Message-Id: <20220909133938.3518520-4-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220909133938.3518520-1-abel.vesa@linaro.org>
References: <20220909133938.3518520-1-abel.vesa@linaro.org>
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

Add memory-region property to the list of optional properties, specify
the value type and a definition. This property is used to specify the
memory region which should be used for remote heap CMA.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---

Changes since v2:
 * addressed Krzysztof's comment by specifying what's the use of the
   memory region

 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index f25924d33fa9..62c8a553b120 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -27,6 +27,11 @@ properties:
       - sdsp
       - cdsp
 
+  memory-region:
+    maxItems: 1
+    description:
+      Phandle to a node describing memory to be used for remote heap CMA.
+
   qcom,glink-channels:
     description:
       A list of channels tied to this function, used for matching
-- 
2.34.1

