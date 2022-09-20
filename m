Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74FC65BDA39
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Sep 2022 04:37:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230141AbiITChY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Sep 2022 22:37:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbiITChX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Sep 2022 22:37:23 -0400
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB4AA4B0C0;
        Mon, 19 Sep 2022 19:37:22 -0700 (PDT)
Received: by mail-il1-x129.google.com with SMTP id x13so696455ilp.3;
        Mon, 19 Sep 2022 19:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=1KloQjGmkbRl50KmGneRd/ko6fDK65hd7ZW5J/tAhcU=;
        b=GfhY2RdYfxL2rj/djXVp2evFUzqmT5vCrNLYFo4aejf6ZzEy10lGIWriE/OO2e3DOg
         ram5DeryyVpAziOusT6MOLZGNlOfbpEt8YyGT91dnQ5jmKvLkX7elsAt+wVZwSREDCbk
         viWDGw83QaDcj/jDxvKvBZ23YI4nNWPidGWdCZu04iEpIMXqYiIxTksuAMSkFfkB3apk
         ZJNwgAFcYa2SzOEY3QlidhM/gS38dJOgij7rtkjVIAEvNCbD7oqDORvjtXbT75j+fMmB
         xbTY1OfTYWZV8geirAlk3vhEs4w3blN39LZCKBzOfivoqLpxV00FZVAmTFNN6YFUSW01
         +dYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=1KloQjGmkbRl50KmGneRd/ko6fDK65hd7ZW5J/tAhcU=;
        b=HbdrUFGSwlYnc3weqocyqPz9sK2vaWaCvVWWXPXiKyD3/KlffrWukq+gahVfLB8x8u
         d4ZtcAYMoMIcfouWpTq9T5Oky0afK0qEgV92r3LqD4q+iQk1YxYcyRPVGNFD5xR3sund
         UlK1ODF6CLuaP/4LU4jSztwX/cVAFEy16yRIYdLXpI8i4hB9VGNSj1UMzytdJsJ8ldqZ
         OTgf/5jdVFsxAwceW1oUR0gedG2LkZSN0umhdBS53GEfJuX+Jy3d3fjhsoDg+95G1+7Y
         LV4YCM7v5uxgsQ14JQQeWoUDA3apgLgDdgEG/pxaGz/HCfWbqR7IJPmdeH8X4xo3djoo
         k0LQ==
X-Gm-Message-State: ACrzQf18Yv8Vi8x7XK2g1obKZh2CXZhp9a+xUFTo93frzJdEu8NO9UuE
        rjJK0tdeu1gNycFW14lVvewb3f0pXFU=
X-Google-Smtp-Source: AMsMyM7OxFZI7Ep8LSSWMgqMoPJKLXAdfRQl4nOZYnPuTHIvP/qocCUOcpqnxv3+gup/AF/6mTBYaA==
X-Received: by 2002:a05:6e02:2162:b0:2ee:872b:2061 with SMTP id s2-20020a056e02216200b002ee872b2061mr8860371ilv.256.1663641442385;
        Mon, 19 Sep 2022 19:37:22 -0700 (PDT)
Received: from localhost ([2607:fea8:a2e2:2d00::58d4])
        by smtp.gmail.com with UTF8SMTPSA id x17-20020a92cc91000000b002f5447b47f8sm195048ilo.33.2022.09.19.19.37.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 19:37:21 -0700 (PDT)
From:   Richard Acayan <mailingradian@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <tdas@codeaurora.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: clock: add rpmhcc bindings for sdm670
Date:   Mon, 19 Sep 2022 22:37:08 -0400
Message-Id: <20220920023709.4865-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920023709.4865-1-mailingradian@gmail.com>
References: <20220920023709.4865-1-mailingradian@gmail.com>
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

The Snapdragon 670 uses the RPMh mailbox for some clocks. Document its
support.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 8fcaf418f84a..437a34b930e3 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -21,6 +21,7 @@ properties:
       - qcom,sc7280-rpmh-clk
       - qcom,sc8180x-rpmh-clk
       - qcom,sc8280xp-rpmh-clk
+      - qcom,sdm670-rpmh-clk
       - qcom,sdm845-rpmh-clk
       - qcom,sdx55-rpmh-clk
       - qcom,sdx65-rpmh-clk
-- 
2.37.3

