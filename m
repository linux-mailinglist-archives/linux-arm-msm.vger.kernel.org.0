Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CE49577872
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Jul 2022 23:37:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232593AbiGQVhF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Jul 2022 17:37:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232906AbiGQVgy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Jul 2022 17:36:54 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 562E511A29
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Jul 2022 14:36:53 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id bu1so14589419wrb.9
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Jul 2022 14:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vfUHl65v7HlcSyZWgGiMRi0rmU87KVTlmidLO43ZaUM=;
        b=p+86Et9aqYZjke2hUO2kH37Ui4fIWCLJompXJu0OfQ3lqsv7O3H4fDPOnZT6TnKbu+
         hlqdka4HB3qyZPG//A6q8xszslIAb1wABWuv9LRuEj3/6J2ytaRXsaw4PwQy35lXB8e2
         nTAYQ9cSwmljI8Px5jAfZpo75j67hAxqxpTbBKFpxi0BgSkFgoXoIa8W1DZEh1/RowoH
         ESpOxbwKiWolkalhuF4RBIi62aCuJYlkn8e9IzSFD5YyZbH9HEtbf0aU9RGhRM9MOUrv
         YgkC318U7J5Vhp2kuXZi9jYZttt09I0ZzkeVBMy8o9nUDXVCVGjIG/qpCo1u3bWv+xsz
         nauQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vfUHl65v7HlcSyZWgGiMRi0rmU87KVTlmidLO43ZaUM=;
        b=dLFxXn1bsOUUcKYpdJ8iMnnGE6B414HhsjciGJe5u+LxEeLcB7j9HLub6Po94OY+ge
         hDxhB8ZZYjNKmPfK+roKmAQslCo7ppwTq8om+1Rp3Rl7iJTWaNhI83OiAPxACxOy/igq
         rg9FqSsmxAhbbS02jz7gl5DI0WMV36DUDnUS0yBFZKY/KNoqEoOM7Q+F0ZLtzv7WmEJE
         DdTctKmYHX/boh2J0TIXn410pcwjGJspGypLk6CYq8vKPWkVVLYBC2YQjwbKMv02Ng2Y
         l1uDCgxg0b7RwGf+ota/+helH7JSG/9OBXtFVIrvW32XM4vPUfel1W60wLHODJZ8tVaa
         8QnA==
X-Gm-Message-State: AJIora84yMDOOzxKCz3dAd9NIvmJKmtYTBN9iuG1+cG4NQvcVKIW6HpQ
        dgNM3hWtd2drBhjufzw4uPWhKA==
X-Google-Smtp-Source: AGRyM1u9jNqk4ffT+RN6Xn3mhuTKrZeAcKfyTta7b5Z0E8aYxs1Mpw8BvHoDPbBKiU7h980uwEiNsQ==
X-Received: by 2002:adf:f345:0:b0:21d:6927:ec8f with SMTP id e5-20020adff345000000b0021d6927ec8fmr20662654wrp.490.1658093811874;
        Sun, 17 Jul 2022 14:36:51 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id k21-20020a05600c1c9500b003a3187a2d4csm3715956wms.22.2022.07.17.14.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 14:36:51 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, jassisinghbrar@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        shawn.guo@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v3 0/2] Two apcs-kpss-global.yaml fixes
Date:   Sun, 17 Jul 2022 22:36:43 +0100
Message-Id: <20220717213645.1147342-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
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

V3:
- Include Rob and Krz Reviewed-by for patch #1
- Defines maxItems 1 for the clock-output-name
  I missed this error in the dtb check for V2.

V2:
- Fixes example which threw an error in v1 - Rob's bot
- Updates the patch prefix - Krzysztof
- Fixes broken non-DT schema syntax clock-output-name - Krzysztof

V1:
Adding in msm8939.dtsi and running the binding checks is throwing up two
errors for me.

In the first instance we use syscon on the 8939 and should declare it in
the compat list. Doing a quick grep it looks like that fix should be
applied to a number of existing declarations too.

In the second instance we just need to document clock-output-names for the
a53 mux PLL.

Bryan O'Donoghue (2):
  dt-bindings: mailbox: qcom,apcs-kpss-global: Add syscon const for
    relevant entries
  dt-bindings: mailbox: qcom,apcs-kpss-global: Add clock-output-names

 .../mailbox/qcom,apcs-kpss-global.yaml        | 53 +++++++++++--------
 1 file changed, 32 insertions(+), 21 deletions(-)

-- 
2.36.1

