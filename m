Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B8F873B63C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jun 2023 13:30:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230009AbjFWLad (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jun 2023 07:30:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231656AbjFWLa2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jun 2023 07:30:28 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7309F26BB
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 04:30:22 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-98862e7e3e6so58810366b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 04:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687519821; x=1690111821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CHaK7rdeki9lfbQ0L5n5XKF0tPcuK6yq3LmKlu+Ivww=;
        b=fSaEd9srqlW02t5EJIQeM2hse3zR9gmx3WuT3NE1AjtZVL3CZf8n94Kn2z9ki1NMuI
         sGOyQIBwsuc26lpQrl0mmIqU1IIXV9Dpf29zJOg++QsDvL28tShS00zdAchY5fMlZs0d
         86tjC0uiX7U6ZwK+I0gqr5IVUo95JpdduZfL4hLIKJBYdt44ia7LHU6prA/Zz6i1zHtt
         80o6z7SFxpvFyG6+pPmACxGS/zyDKdJ1XkLS8umQdOlGU8mJzFatDynZyqhBrGhNCQDB
         BJPzQpStmicRGPzE9+w3ggL5myuXjxTA9KqMuBGDBlJv+F7tdmk33N/WnH85EgBLTNJd
         oYyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687519821; x=1690111821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CHaK7rdeki9lfbQ0L5n5XKF0tPcuK6yq3LmKlu+Ivww=;
        b=DtG+qssUtiYIVTQKZ/Kvh79IeeVtwEOx2B226SeulWRN5yUykyW/IV3TUMg2Iz0ukh
         gjmXxGAbYaXcY9N4RWqOjbX7klIJcdkMDq5xZcBeCcH0GwjJjIMKkfARghGND9tUT6vD
         S+0WZ/2wQQmlONssoficDYMwKPBUzEDGz6kUheIsYxBHiZuPvqfGuhTUp51BH7bPI467
         9PByO28HzXXeyiHMfFUx1jj6zbeKzOQj1W2Ah9C0avgqkKmMzooyAA+q1/Wqc/NWRYk1
         /ReRFJtyc37cHpTYgTC71fePP4ogYA54BI1Bnd40smflngB5qhLZMCA1+NPiK4mL83F0
         zWOg==
X-Gm-Message-State: AC+VfDzpm+U+eHBInuZ5kHsz+raugNME7InJr4CHSGrCzvCx9qO0WSSY
        6lQc/3lGnv/M1j0tWb2xjOdOiA==
X-Google-Smtp-Source: ACHHUZ50An5CQMTUNnqVpshyVZ/03Vud6u0iyBErDojjmGr50lXvYlkYcoJz9SbGBNAJCuaZE9/0XA==
X-Received: by 2002:a17:907:7ba5:b0:973:fd02:a41f with SMTP id ne37-20020a1709077ba500b00973fd02a41fmr21528891ejc.40.1687519820927;
        Fri, 23 Jun 2023 04:30:20 -0700 (PDT)
Received: from hackbox.lan ([62.231.110.100])
        by smtp.gmail.com with ESMTPSA id z17-20020a1709063ad100b009821ce1ea33sm5908033ejd.7.2023.06.23.04.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 04:30:19 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/5] scsi: dt-bindings: ufs: qcom: Fix sm8450 clocks
Date:   Fri, 23 Jun 2023 14:30:08 +0300
Message-Id: <20230623113009.2512206-5-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230623113009.2512206-1-abel.vesa@linaro.org>
References: <20230623113009.2512206-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The sm8450 has an ICE clock, so move the compatible to the proper
clocks check.

Fixes: 462c5c0aa798 ("dt-bindings: ufs: qcom,ufs: convert to dtschema")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
index 4dad3f9ba81f..0209713d1f88 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
@@ -118,7 +118,6 @@ allOf:
               - qcom,sc8280xp-ufshc
               - qcom,sm8250-ufshc
               - qcom,sm8350-ufshc
-              - qcom,sm8450-ufshc
               - qcom,sm8550-ufshc
     then:
       properties:
@@ -147,6 +146,7 @@ allOf:
               - qcom,sdm845-ufshc
               - qcom,sm6350-ufshc
               - qcom,sm8150-ufshc
+              - qcom,sm8450-ufshc
     then:
       properties:
         clocks:
-- 
2.34.1

