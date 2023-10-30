Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A63437DB69D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Oct 2023 10:49:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232806AbjJ3Jt2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Oct 2023 05:49:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232618AbjJ3Js5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Oct 2023 05:48:57 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1C57170A
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Oct 2023 02:48:24 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-507a29c7eefso6084827e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Oct 2023 02:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698659303; x=1699264103; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A+s31ZrC5VzgVWo4S6ti1Chy3hSPGjdBjn6xdECA8qo=;
        b=tu6lk8OTzLkvyCfWSW/uyUtMLXJMS0GRejHdHzACMjfRV26vi22mDV7gTqjSwU8cGV
         PdYrFkUR3mNiXAtn73TU421HQfMp20B2S0Oe+rO2LeEd0k6jICOhlpYwwYRMU5Q5iOSl
         V/rM6Z5b4vBCTfUfjfZSIR+TsKO8tPAzbiWRPV5tKppOgFNGZG0GG/GH4PCegsCZqB0z
         pZ+Z0+W9WxO57ztNSK/S6U3XzI2ITs1acAosZ03E+NIk8lSbWGznrNVz6/4lzZGUpkGD
         ccUCuzxSuX7n3bp+qAm4prKEh62WlwycyiKqXujc7TXeny3l24cR0kGJZknLkMtzu3vR
         VzRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698659303; x=1699264103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A+s31ZrC5VzgVWo4S6ti1Chy3hSPGjdBjn6xdECA8qo=;
        b=GWz56NODB4750gDZOR7rO9mLkNS1c/5IFpDI2zVFXkr/RkrpkAALKrsHqr903itH5W
         6R88dZ4BTRc2ZKDuXI9DupJ+Myx6diYrlY3S/DBQbCvqYkR68zf8oZac/vy6EZAUS0XI
         1eZHaQx9kkZuM/tClV7WVUgrlCZ+8ZGlFNvBXiVr0QOz3Nbt5FTBCaQOx0Kpl2PjSlaW
         vzQJtwbd3+N05zffh9GrJippk1l26TOvypwRoKy7oeKImuJ++wzxcFcrRPQI27FCA1d2
         N0CO/qIArRYz3kofTl6fH9FM+PKMIBVhRYjEctgjAN4nxmwvNv59d9psH3K4ySwGrv2o
         elDA==
X-Gm-Message-State: AOJu0Yw8MxWG5mN5NfxpiTR3InVetI67Ht5+x/MQwIRzzdLITEUe3W9t
        HYTlXKARa5sHDVuPlgh0rgrsJw==
X-Google-Smtp-Source: AGHT+IE8F8NNC3sPgy5q41+rKlt8zQuJ8RgN+m5KV40NAL3J9EfJYp+Lb6rShymZMHF/imCoeJZu3w==
X-Received: by 2002:a19:6551:0:b0:504:c83e:322b with SMTP id c17-20020a196551000000b00504c83e322bmr6236386lfj.38.1698659303058;
        Mon, 30 Oct 2023 02:48:23 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id x14-20020a5d444e000000b0031980294e9fsm7854256wrr.116.2023.10.30.02.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 02:48:22 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Mon, 30 Oct 2023 10:48:17 +0100
Subject: [PATCH v2 1/7] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy:
 document the SM8650 QMP UFS PHY
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231030-topic-sm8650-upstream-phy-v2-1-a543a4c4b491@linaro.org>
References: <20231030-topic-sm8650-upstream-phy-v2-0-a543a4c4b491@linaro.org>
In-Reply-To: <20231030-topic-sm8650-upstream-phy-v2-0-a543a4c4b491@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1035;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=LrivK+UeN6evTZJxEaqfZCKKVlaycsKwlIH1lL0OHhc=;
 b=owEBbAKT/ZANAwAKAXfc29rIyEnRAcsmYgBlP3vi+Rm7cTfTphKTFr6J27j4orI1KhMuGGyqWQ0J
 q1zFtN6JAjIEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZT974gAKCRB33NvayMhJ0dloD/
 dbtCFsmBpv2zGSAOcQU09xemAbSxkmEkTaFith08H/uNzJ54mPtppiweJpRMWtNX7n6xhraW5QWEqz
 w4ciAQdIOXopDD3peGR3e7/zhgadzd+zbjJWqw22tJ9+hyde2k5cWL7w4QhFTH+RBPrtIWOk6jDzoX
 QVvsGMcGNApdiRbIQRz4N6pBTWW5T27Stf4tzOgv1+G233XIqfuKlGUCYtv2yFXniOCJQU/Ya/xTot
 /qHkelCgoZH521rmQccilW6lVIVj/va7kqq8Oj7mZ6i82DYFWTfvuN37T5U7MclG0mDMG5tWRhVsgb
 pS2L4OIltLNYu2fgJdn/M8WQDHa1VIKZaK38YtMAQcjFMZUWXjh+8Inl9vszSmVE1YVUy/zFtdVBIG
 1sJzgyuPH5h+KVlWHx7dG1OxHD6KlKN4mZFhTxP/C/parvSTodHJ1Yui95qkQ3wxxgiRZ74rs8Yp2+
 5dhtvgHsWj5fQRUFaSk5GCuTJVVQrCanS4zjjA5VDa7OkbqzJAsw6Nubw3HfGNzkfZYWQDKunxbkoY
 TzOvJG+U4RLHXm810gB5JdQhwVXkduYJrXg9D/fFbStBEROAMD0Z4uja/aRGDmwAF9/2M75Dva5jTL
 QjFi7yiq03hR6tmK0+6JRNW9/UVKjMU5DAYhDvi1YGyxI+AYNakyFGVdhM
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the QMP UFS PHY on the SM8650 Platform.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index f3a3296c811c..8474eef8d0ff 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -32,6 +32,7 @@ properties:
       - qcom,sm8350-qmp-ufs-phy
       - qcom,sm8450-qmp-ufs-phy
       - qcom,sm8550-qmp-ufs-phy
+      - qcom,sm8650-qmp-ufs-phy
 
   reg:
     maxItems: 1
@@ -112,6 +113,7 @@ allOf:
               - qcom,sm8250-qmp-ufs-phy
               - qcom,sm8350-qmp-ufs-phy
               - qcom,sm8550-qmp-ufs-phy
+              - qcom,sm8650-qmp-ufs-phy
     then:
       properties:
         clocks:

-- 
2.34.1

