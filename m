Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FDF15A5993
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Aug 2022 04:55:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbiH3Czk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Aug 2022 22:55:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbiH3Czj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Aug 2022 22:55:39 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D63BD56BB3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Aug 2022 19:55:38 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id i7-20020a17090adc0700b001fd7ccbec3cso641780pjv.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Aug 2022 19:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ecs-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc;
        bh=U0nZ3+uAvlRMqEL93tIb2WEzxc3KpOg/eA3TIVLY4A8=;
        b=dgDPeKeOSDA219rI2iUDR4QVI8IU2C9X+Fb8SHMDTqw8xxI5qJCF3WUf8i3UMCXwWX
         iyCgQC9yQZDa3tQ9AfO7IT6UdI5yhJPDZBCzYqQjrJqIxVP4WJTorPWcoospIjn1D9Lr
         gi0QOpasFuB4g44CEwIIeLPrFgnlpfNwxsEjI87qQHjp+wySgOZ5QQu4BHvjxrc9a62P
         SkIYzeC3Ohqeu5Rm3QAeB7zY8aoKGNXWdeuvv+j4GqQbBFZzG3bWBNSYN7/shGEhcF6o
         fpjDLHTu7GSd1Ge+vAYXdOqO3dxnRfhzRydi8aYiFgfvkxsHaeoOZNe4gtJpSjt5ehN6
         WiSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=U0nZ3+uAvlRMqEL93tIb2WEzxc3KpOg/eA3TIVLY4A8=;
        b=5Uo6O37IPvDuu0Nu27RggkaUzeuKwIXdGftCeW8LoqK+bxA7FNUy5swjXCxd1Z933z
         oTsUUyDHg4Y3/EkazbMpHX5zajW4w/01j8JDgCuIKAG/ydcnneYDdEEkwiLAjMaaXpLr
         Tc6rEzvwKATfH+sxHag4Z2/IS49oXCKuX+xg5Vg/zFZJgItz7NRKqP6v8Cs5T7qqlqAY
         Rxmp88p//BH5BxnTV0d1kaYTLOge0jbN/yyVpFESvLSTTOLaTZSly6HoKmUhNDIzb7pa
         Hby+R479AUL+Q9OtN8x3JIpM2seuvUloEEljivnhza5n65l+0sXm5vrlZsqUdX1mAJKv
         +JEw==
X-Gm-Message-State: ACgBeo2+7E1CvNNaDP10cKSn7pIIimY0bXIlkePpbLf9pnJ+Ovt7zBDx
        Uo5r7t4QJnfjJOoxlSvvdWd2UA==
X-Google-Smtp-Source: AA6agR5gqKLKE+BMyJrcl5uwTv9ej5G4Cl6dury6w/+t2tttd3P7/Y+P9KkvL1FHLDL8XE55xj7z+Q==
X-Received: by 2002:a17:90a:8a15:b0:1fd:bcad:2471 with SMTP id w21-20020a17090a8a1500b001fdbcad2471mr9905906pjn.38.1661828138356;
        Mon, 29 Aug 2022 19:55:38 -0700 (PDT)
Received: from localhost.localdomain ([103.150.184.130])
        by smtp.gmail.com with ESMTPSA id y125-20020a626483000000b005368fcfb7f8sm7919125pfb.89.2022.08.29.19.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 19:55:37 -0700 (PDT)
From:   Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Henry Sun <henrysun@google.com>,
        Bob Moragues <moragues@chromium.org>,
        Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: Document additional skus for sc7180 pazquel360
Date:   Tue, 30 Aug 2022 02:55:25 +0000
Message-Id: <20220830025438.v2.1.Ic4d4e0777115011544dbc2ab07ed4d7b408c003a@changeid>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

pazquel360 is an extension project based on pazquel.
We create 3 sku on pazquel360:
   sku 20 for LTE with physical SIM _and_ eSIM and WiFi
   sku 21 for WiFi only
   sku 22 for LTE with only a physical SIM
 Both sku20 and sku22 are LTE SKUs.
 One has the eSIM stuffed and one doesn't.
 There is a single shared device tree for the two.

Signed-off-by: Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 Documentation/devicetree/bindings/arm/qcom.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index fb1d00bcc847..851cf5edb582 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -459,6 +459,17 @@ properties:
           - const: google,pazquel-sku2
           - const: qcom,sc7180
 
+      - description: Google Pazquel360 with LTE (newest rev)
+        items:
+          - const: google,pazquel-sku22
+          - const: google,pazquel-sku20
+          - const: qcom,sc7180
+
+      - description: Google Pazquel360 with WiFi (newest rev)
+        items:
+          - const: google,pazquel-sku21
+          - const: qcom,sc7180
+
       - description: Sharp Dynabook Chromebook C1 (rev1)
         items:
           - const: google,pompom-rev1
-- 
2.17.1

