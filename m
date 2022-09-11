Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D27015B4E59
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Sep 2022 13:25:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230086AbiIKLZR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Sep 2022 07:25:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbiIKLZQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Sep 2022 07:25:16 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E9A527CD1
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 04:25:14 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id l12so7417044ljg.9
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 04:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=21UAo0RYhRyCP3O6AErO2Ufh7UGzkqHnj/6wN8Fi/Ug=;
        b=K2K5asFsuISr8zYckfshnl7MGPv0QVgi54eHC8QJcpYm9t4LK97hHhq4ho+7ypRO+D
         48kKndEBwZm3scpmQO0HiWYiiaoxksoaLBmqPQJVxeeOaaQEYy1yUgOM27e+orA4MMWg
         CAwWnVvr+E1ZB/MGTyRYk3NsxEfHaNCJWSfBCbuUjM5Zm/ybDbSaMCaIxmO0VqIl28eO
         GM8t52NSHVHihqdHD/7BtML8rAmdx6hZ8dfq8yMsxHHOVDPiJim2NYqJSM6u3H2sJvSn
         AFgGdgNQeg0+tQpeRcugBc+nPdfjebvAycBWekGgmDpgz//38wKNFJ7AZBzFvxWdhkrG
         7bWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=21UAo0RYhRyCP3O6AErO2Ufh7UGzkqHnj/6wN8Fi/Ug=;
        b=sjlCjGdHl0X1E9CZfHdgX4DHBUZ7W5vUuHkobFFnVWdiT8cNbp4d8NSPciomtWKfhb
         eIZnxscOQ5Gd3mf4HEUqAbY+bjUOdiWMU65XoZpG8kYQl2NfJt1KEDC5gRVbQXPNHOER
         uHngzOCIyHRRXQnKQ7WvGzyOCGMLMuW8r1Vm83ZYrYhrOQ0ZVcXf1+vFnJMNw9rzfmMT
         EMpaUSUlJKbWT2m4TwmMkhFTpULB/6WYtvu1vGxo8lFQkQIskueWViLDrI1hkxwZyDLH
         /4KQxI6aT7DPI5ojlwrR7Vnj2ynIuNmzEpZE28Ur10JY4Z+ETy0LujoEdhszJrj+CpHR
         FghQ==
X-Gm-Message-State: ACgBeo0JiFGHq2Oqpn3doX2dGOGlAktC8Y9kUnXHtQCeI14PhwOASKv+
        QxDnnTOpw7npwKrS9W/wb+PQ6bfE1knF/g==
X-Google-Smtp-Source: AA6agR4Y9GxA7+hcq40DFJUOCZTcQSANfOPHmPXnKml3PqnAuetAHV5dzb2fYJOYcXBvUnk++c9xWg==
X-Received: by 2002:a2e:7019:0:b0:26b:db2a:577f with SMTP id l25-20020a2e7019000000b0026bdb2a577fmr4432616ljc.105.1662895512521;
        Sun, 11 Sep 2022 04:25:12 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id f4-20020a05651c02c400b00261d619fb16sm629007ljo.82.2022.09.11.04.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 04:25:11 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: power: qcom,rpmpd: drop non-working codeaurora.org emails
Date:   Sun, 11 Sep 2022 13:25:08 +0200
Message-Id: <20220911112508.202995-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Emails to codeaurora.org bounce ("Recipient address rejected:
undeliverable address: No such user here.").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 0ccca493251a..3934a2b44894 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Qualcomm RPM/RPMh Power domains
 
 maintainers:
-  - Rajendra Nayak <rnayak@codeaurora.org>
+  - Bjorn Andersson <andersson@kernel.org>
 
 description:
   For RPM/RPMh Power domains, we communicate a performance state to RPM/RPMh
-- 
2.34.1

