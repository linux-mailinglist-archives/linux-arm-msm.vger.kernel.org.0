Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 705F356D7D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jul 2022 10:26:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbiGKI05 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 04:26:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbiGKI04 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 04:26:56 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E22221ADB6
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 01:26:54 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id bx13so5334012ljb.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 01:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bDvOe+jDFuxeFOi7NMAghZSqnGcsdbV5SgLJF4YYu8M=;
        b=Qw1HaX/e3Vt3mmvIiKruzfZlktyvWAW03DuKH3McC0VTZlWdBmdFLN1/fYW4c/4odp
         WZOWXL+sX7ZUrSrQSBDUxfbGo17gQkc/acCKhIP2loO0YqSVJ7ewERVPRlrQfHqmfOJe
         /nwkFBS32/4h6YqC9LawB9edLQ9UwciKnyIoL1aQYvA8op7qV8I0NdeyW2WvlJunh6jc
         pVdgX9G4ykoEDkqMdT8w2TQro3b5joVcUOYPEMC2bLOOY9Q2bguzeAtChcGyUqvNKOoh
         sS3JB/Ru4k1SB3Nxd7SfrJSDSfFxc3ZBVKYXzLnrdrPZRAhqRCECVwlsznUCXemRBR6n
         jvRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bDvOe+jDFuxeFOi7NMAghZSqnGcsdbV5SgLJF4YYu8M=;
        b=mR6Xv0zctKr58lif7d+vAxFjlbNm2/f69J8Ay32VA7lsr9MD8K9+G1EJLX/ZNJ3qT4
         GYQ5BSAkmjr/lxhpSaqQHVKN9OlJNoCrlJjj1OLnUryzScFIbVD+CsWWroVPZr9p19WY
         pZFi+Mipp4KAV012xZiqqyXgYkkhDyuo5pPHf4m8xrIXpnTu2pckSR1qKXkkSUA+lsjC
         F+dsxMwSbktKKzNq40pq+akJU92LVaISMxIHLWlPlcuwPerZg4/dbnJ6VDZX56egozjA
         XTTtU+Vw7HxqweG4EtimRwUQBdapEzEh4HNSXLghaZjBS2vT3yGtPm1iOBl2VZRGoh1O
         83sw==
X-Gm-Message-State: AJIora9Yl9LhGq4AeKmkfyvUa7eX3R4Eg8npctwCdm1OQO7gpmFESzRB
        o5p8i0+vRmW+2Nd7ViSeK7/Y2A==
X-Google-Smtp-Source: AGRyM1sE0bac6lwUbQyIdpmnaHcdUr51KH+sBjOb36Z7JOrrfsqxkoSaJY4V6hjj2q8zbNvIHZ+Ubg==
X-Received: by 2002:a2e:bf0f:0:b0:25d:4594:6bba with SMTP id c15-20020a2ebf0f000000b0025d45946bbamr9866686ljr.116.1657528013214;
        Mon, 11 Jul 2022 01:26:53 -0700 (PDT)
Received: from krzk-bin.. (fwa5cab-55.bb.online.no. [88.92.171.55])
        by smtp.gmail.com with ESMTPSA id l9-20020a2ea809000000b0025a8c1b5fe2sm1603906ljq.17.2022.07.11.01.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 01:26:52 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Douglas Anderson <dianders@chromium.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH RFT] arm64: dts: qcom: sm6125: fix SDHCI CQE reg names
Date:   Mon, 11 Jul 2022 10:26:48 +0200
Message-Id: <20220711082648.38987-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SM6125 comes with SDCC (SDHCI controller) v5, so the second range of
registers is cqhci, not core.

Fixes: cff4bbaf2a2d ("arm64: dts: qcom: Add support for SM6125")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Not tested on hardware, but no practical impact is expected, because
supports-cqe is not defined.
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index 77bff81af433..7664ef7e4da9 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -438,7 +438,7 @@ rpm_msg_ram: sram@45f0000 {
 		sdhc_1: mmc@4744000 {
 			compatible = "qcom,sm6125-sdhci", "qcom,sdhci-msm-v5";
 			reg = <0x04744000 0x1000>, <0x04745000 0x1000>;
-			reg-names = "hc", "core";
+			reg-names = "hc", "cqhci";
 
 			interrupts = <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.34.1

