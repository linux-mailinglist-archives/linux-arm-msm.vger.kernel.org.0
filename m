Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B1167173C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 04:34:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232202AbjEaCeW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 22:34:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233887AbjEaCeU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 22:34:20 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6293C118
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 19:34:19 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f004cc54f4so6049781e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 19:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685500457; x=1688092457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3c6yMNCBo2Th5nKj9JcDZUyMz8f9ppKaXvygn50ATHs=;
        b=NyiS4StnKsQuB+sUdX/bQ1GdTGAS1YaHpbvTfV85nacavoRtGRwlyy/dAkHtQf3cie
         nNblZ3ma8WHEFUdxbeB9bhrJ1mJm7GxtYHyF0vkwvX79yRIKDdgfTial3t+azlinEOrh
         Rpay3Dkcb0z1Pv/cQ8I5JNd4s+l79JUgRZPfKdsmQN2M/SUGq+Yp3bG9GCcN5g/Y3f5o
         WqV0UWQPFKkuauNGErGTmLhgtg218Yv5zp8Fgga62LeAf67hayTg/908SXeWTP+gbF5z
         nj8c0fGYrUHFJO0vCQc6dU/THyLz7vEFB7l739GPfgW9KPSBLz/ibNf5h6eyKGlB/5+E
         NOfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685500457; x=1688092457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3c6yMNCBo2Th5nKj9JcDZUyMz8f9ppKaXvygn50ATHs=;
        b=iXOFqnrMyXmQkL7iaNkjScvQqxS3jk8ttTwXIsdwu0X8QecEX6zGYzvIvrbIUCnMaJ
         +XB4UW2nolp+brHhnvnAvomqwC9XO1VJhINGFrYM55CpVH3vZMCD1ic7azd5ALyOvzAH
         oqkcJHSRd2wceoNahzJwjrzttanGNBhUUzx+ItqniiIihMtDmQMxdgZHlcvketMJuQNZ
         Og8FDvpZmkjk8jwvTn0RH/viDc1yHa/If+fiazPSZ2bZIrMAORRttLEWjvEDY3MFS7Ez
         VEMMU1BVvFBp7/CU3TE+pocAVwRiULRxmjtc1Pi4D6EsSz2MyrCXcs4LuwVTiFlVKFO5
         zhBg==
X-Gm-Message-State: AC+VfDybW6o2WLTp2o+Mc+EjPkkBsjUiId+LaAPmAZND9Eo9wPRZ511N
        +YcZ6S43mfNkV9Hv1wrABUJ/QehiLcBzHHarBro=
X-Google-Smtp-Source: ACHHUZ7oWC3y8Digzkl8eFkWeOswzNn/lZnKUVLFya7/BcYYrFW6hzBQjKuBq5JlJ11O4ziS2OVRFw==
X-Received: by 2002:ac2:515e:0:b0:4f3:bb14:6bac with SMTP id q30-20020ac2515e000000b004f3bb146bacmr1743330lfd.56.1685500457769;
        Tue, 30 May 2023 19:34:17 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v24-20020ac25618000000b004f3787d8006sm524096lfd.128.2023.05.30.19.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 19:34:17 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/5] dt-bindings: phy: qcom,sc7180-qmp-usb3-dp-phy: add sm8150 USB+DP PHY
Date:   Wed, 31 May 2023 05:34:11 +0300
Message-Id: <20230531023415.1209301-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531023415.1209301-1-dmitry.baryshkov@linaro.org>
References: <20230531023415.1209301-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add bindings for sm8150 USB+DP PHY. These bindings follow the older
style as this is a quick conversion to simplify further driver cleanup.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml    | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
index 0ef2c9b9d466..a2ddf718ba76 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
@@ -24,6 +24,7 @@ properties:
           - qcom,sc7180-qmp-usb3-dp-phy
           - qcom,sc8180x-qmp-usb3-dp-phy
           - qcom,sdm845-qmp-usb3-dp-phy
+          - qcom,sm8150-qmp-usb3-dp-phy
           - qcom,sm8250-qmp-usb3-dp-phy
       - items:
           - enum:
@@ -192,6 +193,7 @@ allOf:
         compatible:
           enum:
             - qcom,sc8180x-qmp-usb3-dp-phy
+            - qcom,sm8150-qmp-usb3-dp-phy
     then:
       properties:
         clocks:
-- 
2.39.2

