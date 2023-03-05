Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E15CB6AAF7A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Mar 2023 13:24:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbjCEMYg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 5 Mar 2023 07:24:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbjCEMYg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 5 Mar 2023 07:24:36 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 985E36A4F
        for <linux-arm-msm@vger.kernel.org>; Sun,  5 Mar 2023 04:24:34 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id u9so27882923edd.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Mar 2023 04:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678019073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sGaUFmZmEPj6wjVZzqORlm4Vchur/nfexKJxUxV14Cc=;
        b=bZyHcH617xd3qYRVsQMgkGFFwDrHr2l6GSnuO2/kk0SIu91z9kGvqpWx46g/FZfd0Z
         WHpmiw58UaTwEGVJM82pEy1597CRc8X7jTtPdBr2oJ3ZfkZT/J/x9TfoCxcFXqbi9a6b
         pR763pnCIztGEFr1fkkECnJkqRjkE0q2InCEl5SRl9C/+q4vN/OJalqchCzoctb8e52R
         GP2j+PFeOV+4yTmTXDjdhwrWpFpu7Sx5UC4Jppd5dKLDgdYrCOTmJKjtb1AFBJc3tmeM
         gW2C1PGc+BGt/YcpX3A6RU0PwCr815NUlhEqrSk94WoBbaQOfJiqE4N5qu77XHvwrIEy
         8oyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678019073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sGaUFmZmEPj6wjVZzqORlm4Vchur/nfexKJxUxV14Cc=;
        b=SGwWo/VIX7FcqfiNnr9qLTx1veRRSPQPCXu7N+rpdk+G+WS7axsBlY9Fpm2sZ+cQZm
         IVkyNkHlaCMNLwS677RUuRmvRr9d/6SLhalF7RkFhSFWrgJDhCgxhWmA0jDoSM/ILCpd
         15B66+i4/j6OX+e48rtyX5Dh9W/CEKLa+xz5qBBlFnkSW4rLHt+IIiJaPMcppReocpaA
         qqpKLg0SitQmZaf2Foifdu0mFjRMD+E7ItqPAtbHepExhhS7amJttrexpNFQreKL+xLi
         lLH1i5i5jpKHU6Dar4lHyM0uYo65zhAPFfvmhiPbNEvCYQ/O0qdjjkzvuhlEc2BU4gXq
         qjDg==
X-Gm-Message-State: AO0yUKVrpHmmpg2/ShBnX7jtjeibqcx0E4kk8bL5m/iixGL6US24FWSn
        bwchchmpQZ2tG+V9nfWD19TO/g==
X-Google-Smtp-Source: AK7set9gt2HUS9+fvU1DUep1ABAuIXeNzq4i233SNrJScC52wtEoWP/F9lt7wMNFPGQvBsn33LRkcQ==
X-Received: by 2002:aa7:c242:0:b0:4ab:4c5e:b0ed with SMTP id y2-20020aa7c242000000b004ab4c5eb0edmr6465546edo.21.1678019073090;
        Sun, 05 Mar 2023 04:24:33 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:71e7:13d:1c29:505f])
        by smtp.gmail.com with ESMTPSA id t26-20020a508d5a000000b004a9b5c957bfsm3621682edt.77.2023.03.05.04.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Mar 2023 04:24:32 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: soc: qcom: smd-rpm: re-add missing qcom,rpm-msm8994
Date:   Sun,  5 Mar 2023 13:24:28 +0100
Message-Id: <20230305122428.167580-1-krzysztof.kozlowski@linaro.org>
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

Re-add the qcom,rpm-msm8994 compatible, dropped during conversion from
TXT to DT schema:

  apq8094-sony-xperia-kitakami-karin_windy.dtb: smd: rpm:rpm-requests:compatible:0: 'qcom,rpm-msm8994' is not one of ['qcom,rpm-apq8084' ...]

Fixes: f935a752f229 ("dt-bindings: soc: qcom: smd-rpm: Convert binding to YAML schema")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
index 16fd67c0bd1f..3580b209cd4a 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
@@ -40,6 +40,7 @@ properties:
       - qcom,rpm-msm8953
       - qcom,rpm-msm8974
       - qcom,rpm-msm8976
+      - qcom,rpm-msm8994
       - qcom,rpm-msm8996
       - qcom,rpm-msm8998
       - qcom,rpm-sdm660
@@ -84,6 +85,7 @@ if:
           - qcom,rpm-msm8974
           - qcom,rpm-msm8976
           - qcom,rpm-msm8953
+          - qcom,rpm-msm8994
 then:
   properties:
     qcom,glink-channels: false
-- 
2.34.1

