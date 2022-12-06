Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 796E2644F76
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 00:17:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229449AbiLFXRy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 18:17:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229788AbiLFXRs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 18:17:48 -0500
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C087410EE;
        Tue,  6 Dec 2022 15:17:47 -0800 (PST)
Received: by mail-io1-xd30.google.com with SMTP id q190so5681501iod.10;
        Tue, 06 Dec 2022 15:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FyuIGJKwW6b9EoAfMlQAn9kCBCi3ouQb7vdXBTYMw3o=;
        b=LcBXMk1/YTashAe75xSu6NRXBnKaJ/Yn55m6xCSmhuzqs1WDRNzTVqt/TOlinrS8tN
         mmeo5kojF5w/VTp43ZYGWUq3TXP16m8lihv2wKlUbsw1IbkzvcoiK8QvNNorjbjpcg7m
         UnBUgjj/9KQk/MOEkMVNShEf2Ps19Sf+8FObVm/uIDUNJNzya+QfnJ+ZrOUT+csS8svp
         OH0y1lQYOARaqTFtGNwzt/TrHwLsyE1vwmad9nlXNEOKzjHQ7QnkR4A6MdJeRBPVvpQL
         XqD7dCVuebvZ1DcMGe+QLJ7wcc08XqZkiYCdgn883uRz85UVO/6xXcswAXdv8x16ZVwE
         jDmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FyuIGJKwW6b9EoAfMlQAn9kCBCi3ouQb7vdXBTYMw3o=;
        b=uhk9t5aZx1e74xbOFAp9rsos4BaAR5cKjbDb1TpqAJm//FUh6B1OOlMQnLJ6U1D8Iq
         cteDdXr0qJq8HehP2VpHhmPw3j2gyVe/SsZJf2dZEntozQ8I7S18oYQaAIH9Abavd/X7
         32CMslQc3o4ezeBj1XBHlVcUI0Pdjni5NaAU0UmSNrNwzAU0J0U4HarT9ME4YrIh77Wl
         P/zOkKKwYqHr+w+6E0SFNI0ubx32G9p2pVsH6pD5GzHVfRIWhute450nCNlPoGtCXddz
         ct42BQygl8sqvHDkl+nw5fpuY4qWozlc2MpBgh3wU/e2GdcjDYqEcyTIiEpIOAlXAFT4
         AKRw==
X-Gm-Message-State: ANoB5pniNjnrBw1Ns2VZWZ7g256u6bzJErz9qmsUMvz3hcaNKWS+lzGQ
        QlFpXRYxE5puDjoMYt+OSKs=
X-Google-Smtp-Source: AA0mqf4KOY/FXYl3ARxU3LWM9AS0eqPw4ryqdFErsBbaz1Mo/nLgrzN7BjrXRBbJ/qKSVCvG9dBYqw==
X-Received: by 2002:a02:6662:0:b0:363:69a0:837f with SMTP id l34-20020a026662000000b0036369a0837fmr34941769jaf.57.1670368667178;
        Tue, 06 Dec 2022 15:17:47 -0800 (PST)
Received: from localhost ([2607:fea8:a2df:3d00::32c2])
        by smtp.gmail.com with ESMTPSA id m16-20020a92c530000000b002e939413e83sm6514007ili.48.2022.12.06.15.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 15:17:46 -0800 (PST)
From:   Richard Acayan <mailingradian@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 1/3] dt-bindings: nvmem: qfprom: add sdm670 compatible
Date:   Tue,  6 Dec 2022 18:17:28 -0500
Message-Id: <20221206231729.164453-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.38.1
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

There is some configuration in SDM670's QFPROM. Add the compatible for
it.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes since v1:
 - add ack tag

 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 2eab2f46cb65..01ec2143a3b5 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -27,6 +27,7 @@ properties:
           - qcom,sc7180-qfprom
           - qcom,sc7280-qfprom
           - qcom,sdm630-qfprom
+          - qcom,sdm670-qfprom
           - qcom,sdm845-qfprom
           - qcom,sm6115-qfprom
       - const: qcom,qfprom
-- 
2.38.1

