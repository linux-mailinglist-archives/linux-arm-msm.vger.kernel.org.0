Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AF7D5BDA09
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Sep 2022 04:19:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbiITCTt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Sep 2022 22:19:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229865AbiITCTr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Sep 2022 22:19:47 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC9E9DF27;
        Mon, 19 Sep 2022 19:19:45 -0700 (PDT)
Received: by mail-io1-xd33.google.com with SMTP id q83so1131809iod.7;
        Mon, 19 Sep 2022 19:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=wszZil0TmmjTJzksbXK6Hyspwgkekkah0Pe8vOUd1V0=;
        b=TREfnewAl0msDxBcGKkdOipVhuKW6OLSI8bn47GBq9AxTJHRA5U6I73GDVYuasKFiA
         DnSu3vBs417fWW9P53lLQLnDsdTTxEu7Fiz0JpdrnlJDTxSYWYU/dRkf6xN/glVWXrpZ
         d7kMqyQjky2Mx6L/vPmCyW+cb5JQ3Suhxfcw9CvL9DW3faTgMbIcIuLSGJ8TfnW1iCDc
         iOPlyZIbVU1Ie4UxX9swDomVoRGGuFJhm66aOk9PNZUwR4HIkm1vPursdqMMcZ2iGFZX
         3l+P7nMnju87v7c/cgO1OXvwru1+ob3xPQVPLXRo+NV1JQ/VwnrIjFJAeBzVogOMIKvO
         homg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=wszZil0TmmjTJzksbXK6Hyspwgkekkah0Pe8vOUd1V0=;
        b=F8H3z6gvvrs4YFI0vMvpT7UX51bRLHEzGCzu9cMyeYp2h1mU7J73LImnvK3DaYh3rp
         JHCcdxdTqstRcnFoxQvkwTYKjIBBpd/ie6BwNLQTWOKkTQ355CnbMdnS8TQYm/9K9gHK
         XEuS1CFayFn4iIOMVjKcO3Hb/cUjBMqFe24Y9usWRmhvB+1qML6kpCnaM8+kSr/xisy6
         I886n8Ms7WNO2/+1GSHEJBM/QkF+IktgYbIAHOThxsIvkau5iJvW94X3N/4awjJdXNnX
         ele+FxYBjqzlbozzz7SL8c7P3BG41AaWZxGfpOlFkMu9bJFqbRJepqu5U4jEvfAWA+g7
         LsFw==
X-Gm-Message-State: ACrzQf2AG5U+IdG8DTDvEEAew77gArcE5mRgp6P4GDfxJO7krk0P5mfM
        PZlYSpFqwo5jOjWSKqe+2zoqsSPCCRA=
X-Google-Smtp-Source: AMsMyM5BV4yrCIxU29u4on0jhhLYz5JjSMkFA9nye3DGN6uxS5TZU0vaaBMQqbjOVuteL07ZX1VtpA==
X-Received: by 2002:a05:6638:2686:b0:35a:40db:95ea with SMTP id o6-20020a056638268600b0035a40db95eamr9952907jat.303.1663640385043;
        Mon, 19 Sep 2022 19:19:45 -0700 (PDT)
Received: from localhost ([2607:fea8:a2e2:2d00::58d4])
        by smtp.gmail.com with UTF8SMTPSA id e25-20020a5d8ad9000000b00688dd369c7esm98911iot.55.2022.09.19.19.19.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 19:19:44 -0700 (PDT)
From:   Richard Acayan <mailingradian@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: power: rpmpd: add sdm670 power domains
Date:   Mon, 19 Sep 2022 22:19:27 -0400
Message-Id: <20220920021927.2489-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920021927.2489-1-mailingradian@gmail.com>
References: <20220920021927.2489-1-mailingradian@gmail.com>
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

Add the RPMh power domain IDs and compatible string for Snapdragon 670 to
make SDM670 power domains accessible to the device trees.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../devicetree/bindings/power/qcom,rpmpd.yaml          |  1 +
 include/dt-bindings/power/qcom-rpmpd.h                 | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 5b4eda919911..2ca98bad2d35 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -34,6 +34,7 @@ properties:
       - qcom,sc7280-rpmhpd
       - qcom,sc8180x-rpmhpd
       - qcom,sc8280xp-rpmhpd
+      - qcom,sdm670-rpmhpd
       - qcom,sdm845-rpmhpd
       - qcom,sdx55-rpmhpd
       - qcom,sdx65-rpmhpd
diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index f5f82dde7399..578e060890dd 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -4,6 +4,16 @@
 #ifndef _DT_BINDINGS_POWER_QCOM_RPMPD_H
 #define _DT_BINDINGS_POWER_QCOM_RPMPD_H
 
+/* SDM670 Power Domain Indexes */
+#define SDM670_MX	0
+#define SDM670_MX_AO	1
+#define SDM670_CX	2
+#define SDM670_CX_AO	3
+#define SDM670_LMX	4
+#define SDM670_LCX	5
+#define SDM670_GFX	6
+#define SDM670_MSS	7
+
 /* SDM845 Power Domain Indexes */
 #define SDM845_EBI	0
 #define SDM845_MX	1
-- 
2.37.3

