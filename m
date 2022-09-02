Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DB5B5AA989
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Sep 2022 10:09:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235698AbiIBIJs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Sep 2022 04:09:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235705AbiIBIJj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Sep 2022 04:09:39 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D6CBBD77B
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Sep 2022 01:09:34 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id bh13so1330528pgb.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Sep 2022 01:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=TsbthZgLvAYe17fw60+pG9xosVWGqtIqgAG+s4O3QPc=;
        b=uaDxAZrJvMRiwIW/0SmUYycr006V9AKO3Mk3Vp/LTXsXx74tJjzMUa3my9VN1LkWJL
         n96t1Hu2/hYs4hWPOofiALW4WG6ls8gGasnciBX12/pXaGNdlcxcJ+0pN4NKoA0ZMQKG
         1HUggudio0KdDPjJQoQ/g58NDeZukkS9i9oKRpJz0WI3qZkavJH6ElKgFDpGq0fFlwOo
         fBtqG7LgLgIEYLfs3DJOMD8DTCTmQZ/o0yByyGJvpbS3cRi1wc14YylrXccTBLy3zcJs
         sxCud76XA+P3oxmnVF1lN2EYpV5DqRHLfca/ogDTfdOSl7/pzBLrRNpJkZR1/iY3qgR2
         6IHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=TsbthZgLvAYe17fw60+pG9xosVWGqtIqgAG+s4O3QPc=;
        b=qKqPPwn3iKofaax3+mHkUUa0+btNyZH3z8n9JIPwI/BsT3mhkMjg6ta8Hh0d73KU9e
         7+mOTwJ4kYYXXZl2X8Q10brZzDIWCktLrvdq9idkT7nBWUrNDHIk5wgQLRr9mruvuE23
         volLt3QSnn3o9UjEJ2ODFeDWzqMe6S/ChyFHe09WdI9Q6AZyPvVhdrAWj8PIYXtD1vCK
         owAQFCqUIIqXce8ZkwlF3Gbxp3Zq2gLljgaclvmxLNf2s6MvNSzWISe0Wa8EsrLGDbNp
         6hIkGZLgZ8TC+jmYYx3tj/4SKzVXJPzFgR6lw39ErEtfpbuYulL9Y9Fb9Z2ZtReCQTpN
         2arA==
X-Gm-Message-State: ACgBeo2gSr8EKAvOTVHkCtbNff8gKSvCJTeS+QCAH986u+vOOPIXU3ld
        VHVhDL7gAYzxZHaD2EIGkFNZRw==
X-Google-Smtp-Source: AA6agR4M+jk8p6aJdHPWCbFd6OjOBxfJeqgwp7tvtD0xqC8wkIY6z7LGXAUj7EsixYb+fKzUVbt+nw==
X-Received: by 2002:a63:9d0c:0:b0:42b:6821:bbb2 with SMTP id i12-20020a639d0c000000b0042b6821bbb2mr30346302pgd.299.1662106172633;
        Fri, 02 Sep 2022 01:09:32 -0700 (PDT)
Received: from liang-Predator-PH517-52.. (60-250-232-247.hinet-ip.hinet.net. [60.250.232.247])
        by smtp.gmail.com with ESMTPSA id d14-20020a170903230e00b00174849e6914sm943447plh.191.2022.09.02.01.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 01:09:32 -0700 (PDT)
From:   Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     mka@chromium.org, dianders@chromium.org,
        Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v5 1/2] dt-bindings: arm: qcom: document sc7280 and evoker board
Date:   Fri,  2 Sep 2022 16:09:10 +0800
Message-Id: <20220902160845.v5.1.Ief93544cd0cbfa412092f5de92de10d59a2a5b3a@changeid>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220902080912.118592-1-sheng-liang.pan@quanta.corp-partner.google.com>
References: <20220902080912.118592-1-sheng-liang.pan@quanta.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This adds Chromebook Evoker to the yaml.

Signed-off-by: Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
---

Changes in v5:
- Got the version number correct

Changes in v2:
- Bindings patch added

 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index fb1d00bcc847c..d4b2d947859d4 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -565,6 +565,11 @@ properties:
           - const: google,piglin
           - const: qcom,sc7280
 
+      - description: Google Evoker (newest rev)
+        items:
+          - const: google,evoker
+          - const: qcom,sc7280
+
       - description: Google Herobrine (newest rev)
         items:
           - const: google,herobrine
-- 
2.34.1

