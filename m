Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E68A65FC88
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jan 2023 09:12:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232222AbjAFIMq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Jan 2023 03:12:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232361AbjAFIMX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Jan 2023 03:12:23 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D38F07A93A
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Jan 2023 00:12:11 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id bn26so620239wrb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jan 2023 00:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZRTSLPAbue4Um+MgvQ/BKV8J3CThyZ1NI4K+wpxRKTo=;
        b=xENk31DEptz+5hKVOh6sODx9JGJ8m6agO20liO4YqD4avvcycc1vrXxCSj4l3G/F7+
         Q6wIyJZ4iHQaYctbBO0IVCqIGOa+cVoTI7OLWj3d4b+owVkfh/u9Ad0IMDP3m8Y8TExJ
         lN73xkCu5mouXlmVWU9oQXKx7Ntpm/K+TvngrVIGVWef5eDFt24iBhtRet7jF6lCSvq0
         liqV0ivNfDalFNq6qojxf/pGhGdV1XmrCrcEANJIR/+czzV+aI7XLYDaGG47NGsmF7G/
         XJ3cARSDdPRaBSyTbG9KroiHAX3UnHA0gR+17G5JU+Yc01bzGvZPmMJiQG7LU05A2pq0
         iMtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZRTSLPAbue4Um+MgvQ/BKV8J3CThyZ1NI4K+wpxRKTo=;
        b=wvZDCx6RyPN47mertVguwlg3phz7UFzXCGPPtmlp/10udhCp9NJTc9Z151JDckbf+q
         4f2ToTz5xrTvNYk4OqgTh2PVTeGbxw0tt8JXTRisNP5rhtje0TRjwFlZDijZdbhXe+Ss
         IYAGc1XZjlSXjVLLtLbBz4nI7PtHTfxRFO8L+GMLJOfV/rVGll8ICws2KQ+G1bJoJzGl
         +bLrJqpss8C+RFbUDA10Zg4pqU2mkmKODr2SjUY4D6cms4fc7TdzfxoPY2Cs8rq9vbpA
         YW1HMfPT+MDncJ+ka3eNHnhulaRwVdk/Vd4soIChXrwFoIX3bSMP3O3UmnO30+FlFLrb
         JPxA==
X-Gm-Message-State: AFqh2krMSA6zFHKHeMfC3Qhqcapxzvm0NDWz2KtetkqHsoqz8VeAOyIm
        yIXTRscafsCTcEWsakdS3ATWxw==
X-Google-Smtp-Source: AMrXdXsaZv5eY2i4scz2F8KId1dlkbqOzZGo8DYxNZWxWPULFK2XrWPZsF/RcyUx1NqzpL7/O4DghA==
X-Received: by 2002:a5d:55c8:0:b0:268:eb74:1857 with SMTP id i8-20020a5d55c8000000b00268eb741857mr33934340wrw.20.1672992730363;
        Fri, 06 Jan 2023 00:12:10 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t19-20020a0560001a5300b002362f6fcaf5sm451545wry.48.2023.01.06.00.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 00:12:09 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/3] dt-bindings: PCI: qcom: add MSM8998 specific compatible
Date:   Fri,  6 Jan 2023 09:12:02 +0100
Message-Id: <20230106081203.14118-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230106081203.14118-1-krzysztof.kozlowski@linaro.org>
References: <20230106081203.14118-1-krzysztof.kozlowski@linaro.org>
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

Add new compatible for MSM8998 (compatible with MSM8996) to allow
further customizing if needed and to accurately describe the hardware.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>

---

Changes since v1:
1. Split oneOf-reindent to separate patch as Bjorn requested.
2. Add Ack.
---
 Documentation/devicetree/bindings/pci/qcom,pcie.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
index 09a4e3c330f1..612feec05267 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
@@ -36,6 +36,9 @@ properties:
           - qcom,pcie-sm8450-pcie0
           - qcom,pcie-sm8450-pcie1
           - qcom,pcie-ipq6018
+      - items:
+          - const: qcom,pcie-msm8998
+          - const: qcom,pcie-msm8996
 
   reg:
     minItems: 4
-- 
2.34.1

