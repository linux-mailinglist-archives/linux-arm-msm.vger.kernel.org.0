Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A40195BF066
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Sep 2022 00:44:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbiITWnd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Sep 2022 18:43:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229767AbiITWnc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Sep 2022 18:43:32 -0400
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24C7C66A4B;
        Tue, 20 Sep 2022 15:43:32 -0700 (PDT)
Received: by mail-il1-x135.google.com with SMTP id g6so2219071ild.6;
        Tue, 20 Sep 2022 15:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=b8dyl9244tY8nMIX9q1PRZuMZkGz0f5pEOzanhucPvA=;
        b=Yk2bQf7UvCto57hCAVFg2bl5UyUOKKotFL4ZFw8RDpGbLLhs4AbHUy407v4TVsfVQH
         8VTux4naPtWhZRYAbJTQjmTgDA6Ez4qiUvR2S7tkBSb8AdffooWj+gxekCYVQXV+09G6
         Wd7XR3PAB773gmgVjZwWpC7kotPBO274tCg9ikzhGzQKBNYnNSAnUqVfFt4gl/9r35o3
         0FQzS/3YJ8p5g2d7Cv//mWWzQyhA/Ya3RUKdZ3WrbFFm7+P/3P1QN0ImmUdPu/S9ZK/N
         zOqFMChTYcyGN+VciCu8SVcemVhZxit+eeOt8+W6PN9ofZAk8L0xLxdZ4T3EZtgontcw
         HNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=b8dyl9244tY8nMIX9q1PRZuMZkGz0f5pEOzanhucPvA=;
        b=LpUP3zJ5HD4KZm689U4v9K5XgaOv0rKK/TPnFwI0BHqPZyypcGnCh1rV5Sur6MQHtE
         9Vbvfmq/0MwLxdNY5IDOt9y3fILYDhUWwh2+2BGiCEC36cwhcl3NU93Nr/x0i4oHH9uv
         WRrtztG7bZEQozhh/2Gt7sYSZXWdaOzIBnf9OkqNdapYy3dJR/1PzpiGwZ3URG7DJAWS
         jDaWQjVEszCgpHsGwBkxkgB95fum4RK0jqfl/qvlo2oWH+xX01Q8yY/XUg67OnaNTDT3
         XcRaRN9uqbChMLPF4hnRPAQhmAfmngdG2w3Ptdqa5GiT5T5OvOkmkj5/eEr2LLIQzHvk
         OZhg==
X-Gm-Message-State: ACrzQf2nMhXirtd/72CiN0itbDG4GTVgNV7bykuRn2o1OKm4rZc/NSGw
        TZt9ySSDg1t6FlXASvsCqHfHf2Ecqrk=
X-Google-Smtp-Source: AMsMyM6fCi/HU18Py5bqDsyyU69KaF/bT/2N8tT5o9m4Muc9JOL0bnJYmhIO9/Jinbwppx7rh/fLiQ==
X-Received: by 2002:a05:6e02:12c6:b0:2f6:5f42:89ed with SMTP id i6-20020a056e0212c600b002f65f4289edmr828295ilm.153.1663713811347;
        Tue, 20 Sep 2022 15:43:31 -0700 (PDT)
Received: from localhost ([2607:fea8:a2e2:2d00::a533])
        by smtp.gmail.com with UTF8SMTPSA id f15-20020a056602088f00b006896f36afecsm438791ioz.15.2022.09.20.15.43.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 15:43:30 -0700 (PDT)
From:   Richard Acayan <mailingradian@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 1/3] dt-bindings: phy: qcom,qusb2: document sdm670 compatible
Date:   Tue, 20 Sep 2022 18:43:18 -0400
Message-Id: <20220920224320.152127-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920224320.152127-1-mailingradian@gmail.com>
References: <20220920224320.152127-1-mailingradian@gmail.com>
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

The Snapdragon 670 uses the QUSB driver for USB 2.0. Document the
compatible used in the device tree.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
index d68ab49345b8..636ea430fbff 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
@@ -30,6 +30,7 @@ properties:
       - items:
           - enum:
               - qcom,sc7180-qusb2-phy
+              - qcom,sdm670-qusb2-phy
               - qcom,sdm845-qusb2-phy
               - qcom,sm6350-qusb2-phy
           - const: qcom,qusb2-v2-phy
-- 
2.37.3

