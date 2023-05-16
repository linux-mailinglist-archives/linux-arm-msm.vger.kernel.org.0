Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67568705297
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 May 2023 17:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234181AbjEPPqY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 May 2023 11:46:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234165AbjEPPqT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 May 2023 11:46:19 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3CA17D82
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 08:45:50 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9659c5b14d8so2404777266b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 08:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684251943; x=1686843943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQlA3yGFk+W7iwOwNJA/IHC43J6THIUeCVeGDi4cn+U=;
        b=VK6YP2iWRxhrKJYvG7HfcKg27w19vYmQLHqpzqx7iCe3mmZQ++716UsVI0Am7GqWL+
         Mzkq4XRwVU5WBasxRCEh2Mv/SxiocZL1Kx+0ObtVX09Ioq7NjVHMRPXOGfQyZ31grP/1
         CJsVBKseo3JxnvvvyGGlYnnrExdGHWcdoprywM118VvY+4Gz2JoOMrerXTEeGOciNysf
         nSEVLR5imfRm3+ow8gYAJYrabuQbV79SVwh7N0CZM9HuguypmIMETTnPzb9XgewlFvm6
         jNl7808bOgN1Y0ztm3/Ro3FDResBHJfa2TDdrMRiNH7JXXSKw4XOUVpVdPVU+oe3IGQ+
         WHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684251943; x=1686843943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HQlA3yGFk+W7iwOwNJA/IHC43J6THIUeCVeGDi4cn+U=;
        b=RCXlwunXfL7ViI3HqTnQePQvyU+G3V3hQCh7OL3zwqTbfVnVae2qUxx8ZTv1QW5IVE
         JnjlLQBVixs48rPtVTe1vEI8lIV38H3ty9UdGJhX1mczLID7qb9wcj4NCZXBSth9Byag
         4yZkR1LjctUHTU9ysLo326YwrILqrTWklbJ9Wn1iz8V3B5a50fueAnoM9MWK29A1bbk/
         Z3AvtwViwp9Tn7d+ZsS0yYz4gSUr11A1DJWhi8bW+/M1lNXfaTu7xZyhVtRK0KHyjrZ8
         I4xRCTIUrjSBS3uIO3wq3Drt6bzSPT232cO62bmVk1+2MaP1O0xfMnFqYthRI8nvQnEm
         KeKQ==
X-Gm-Message-State: AC+VfDylx0GVtSHRuNJ4SJleo6LB1oo1UbGNr3MVcfXzi4IKs9FZC1Xr
        isvSKtbvClZu0Wa7M485PB0Ybw==
X-Google-Smtp-Source: ACHHUZ4CRZKuoHwoGmVwpJlrbkQ1LUo7Al6/SbQKg0Rx7PtzMW6yTz79nHA2GU7ki+vU9VLNEHWKtA==
X-Received: by 2002:a17:907:6eaa:b0:94a:9ae2:1642 with SMTP id sh42-20020a1709076eaa00b0094a9ae21642mr38134440ejc.46.1684251943102;
        Tue, 16 May 2023 08:45:43 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:77d1:16a1:abe1:84fc])
        by smtp.gmail.com with ESMTPSA id z25-20020a17090674d900b0096ac3e01a35sm5787587ejl.130.2023.05.16.08.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 08:45:42 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/3] arm64: dts: qcom: sm8550-mtp: drop redundant MDP status
Date:   Tue, 16 May 2023 17:45:38 +0200
Message-Id: <20230516154539.238655-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230516154539.238655-1-krzysztof.kozlowski@linaro.org>
References: <20230516154539.238655-1-krzysztof.kozlowski@linaro.org>
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

MDP in sm8550.dtsi is not disabled (although its parent MDSS is), so
board DTS does not have to enable it.

Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. New patch
---
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index f27d5c657f44..579f65f52370 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -459,10 +459,6 @@ &mdss_dsi0_phy {
 	status = "okay";
 };
 
-&mdss_mdp {
-	status = "okay";
-};
-
 &pcie_1_phy_aux_clk {
 	clock-frequency = <1000>;
 };
-- 
2.34.1

