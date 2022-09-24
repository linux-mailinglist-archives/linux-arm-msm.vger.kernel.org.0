Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 501F85E89F8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 10:17:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233912AbiIXIRC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 04:17:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233532AbiIXIQm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 04:16:42 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5608B1E72A
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 01:13:33 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id b24so2319438ljk.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 01:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=3E/vXC3blnuzzv4sR8DbmrJrzeGRRPWTozdNuvlljF0=;
        b=KGdryZHcIklcs7LkCJlhLQNWugVPPlHvTyNd1jLtAKgkzeFJxj+TkGAmhYvSfV5Gqj
         uzoh+Dgg9Gtsva/4nNYZmqWPW1OGUnr6c96Hy95J57ekrhueF7KynK2psX1qb9ALaz0a
         rTLRCkQ+j/ri2lSPWDKENw1q5KT67t3pIz5PQWQO8WkLMzorhg8tnaOpmhOpMGIsNsg2
         F7JRi8QN35AwsoJlTByZMeaEkNIbqJZBVpiS6Hqu0iVnD2VoXEFemqFi3KyjrsKB16uA
         Mv6ffxhke9y3INwwQXDctjvT8l4/1dG+1gli+rxnqKYvWiQOuTNRC3EfBuBnEmDPpFTL
         bBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=3E/vXC3blnuzzv4sR8DbmrJrzeGRRPWTozdNuvlljF0=;
        b=GITJVdBrzKBAUNVaE43qraJteTUXg3ifgQRGiGRaKK8YMd8wdukm1XfOt/AVB7YzwN
         9pbhFDmJBtDFWaOyOv4Ge6Kb8jzlwRUUEW6IX0Dl3ykJSmSpmSU5QQ/8ab/1c0QVhmFE
         RcTDa1ZCjPz1czB6nAHySBIgyRXkBSvrT8RDj+sPOThaR4MAZJ6FPPL2nTcIPVr7sISM
         fRYJ2nrIyKpTleJEBGTJx2585RTu69KROiBorKmxD/m6mnPkoa5HKr4aUe5AxkrAVrih
         MjL6KGOt4qhEGI2VPYF8+nNffx/5ewL5KR0mh7huJKFgyJp1WBzqy0f2kQK3oEea66yT
         jKoA==
X-Gm-Message-State: ACrzQf2phQq9dmg25nbgVmkVdl6VYUEAjH2njw/C8VX/5EQkuRI719/z
        i6v3otui5HpF63CUpvi8BLBfYQ==
X-Google-Smtp-Source: AMsMyM5CW28K2L03jHx6gXlzmObLHn0vVNxy9eIx+mhXQq56UFcJTMP3hZ7vIkOoBjNQQUfi5JTXZg==
X-Received: by 2002:a2e:99c2:0:b0:26c:3fb1:4c5a with SMTP id l2-20020a2e99c2000000b0026c3fb14c5amr4028203ljj.460.1664007211746;
        Sat, 24 Sep 2022 01:13:31 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u10-20020a05651220ca00b0049c86ca95bfsm1825818lfr.52.2022.09.24.01.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 01:13:31 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: clock: qcom,a53pll: replace maintainer
Date:   Sat, 24 Sep 2022 10:13:29 +0200
Message-Id: <20220924081329.15141-1-krzysztof.kozlowski@linaro.org>
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

Emails to codeaurora.org bounce ("Recipient address rejected:
undeliverable address: No such user here.").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,a53pll.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
index fbd758470b88..a479f24d95e2 100644
--- a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Qualcomm A53 PLL Binding
 
 maintainers:
-  - Sivaprakash Murugesan <sivaprak@codeaurora.org>
+  - Bjorn Andersson <andersson@kernel.org>
 
 description:
   The A53 PLL on few Qualcomm platforms is the main CPU PLL used used for
-- 
2.34.1

