Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 763E06C965B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Mar 2023 17:58:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232087AbjCZP6A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Mar 2023 11:58:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231671AbjCZP57 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Mar 2023 11:57:59 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63A0310E6
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Mar 2023 08:57:58 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id ew6so26166996edb.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Mar 2023 08:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679846277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KOxLTVXPQ9AYAdZCVOpfJ7Gu9nxcuITjuyN2ENbFdg4=;
        b=dd3Naus/cgwBsgZSchftaaKmtdYsQ1MIkfiaEn8yGSEivQm9QI43Ux4OFC77hr0GMu
         jgepSBQypsl3fDfdGO1TDmuJCtov+h8vHmWj395yjWJ+fYm/tGJAp5WTaJQGWyLE0epU
         ZN4rG/Um+t7LFFVFgOMNozGy/JrjKaYYvWqFFwnjCTob7zcSOIKEJoi9ROXlg7U1J1vS
         ALhywtjUiBm/m0CRJ+gEb7Ma3He2UseS7FDAjiea47ral4Q3RC2C37rtTvNURz9A0VBw
         JjyEmUhvF1m9MJUoPOGd0t7+Hwhwqsv4POX3Wpk8wE3QCTAPsNlJLBtnU2ob8U7HB4bG
         l5aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679846277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KOxLTVXPQ9AYAdZCVOpfJ7Gu9nxcuITjuyN2ENbFdg4=;
        b=2hxUmwBRI/tugXm9r0kUIa8G3aebRffpOxMBiRV+yVmfpbsvDgLmTcuhAvOMKc3+Vf
         j2JLPAxTIw0sN/XdDZCmvb6XxnWCFL+M23+abDB+Q8aiJWFL7m44QkCrM4xTypC9KHRU
         2ohH5N/QxmH1BaQLNcV5avwjw5qcqgK9dAXph88cpncboI5ohAcNq8t5z2z0XSzhRuX1
         uzzr5K4uBtgtFxl/C5ktihkug8G0cSbKfOtosOw/MMGkk4wQj15HUtJAdqR9V/yGNHon
         eA5WrsWwtnh3GXt09UBb5qOV+NEE6YYADszQrUVUiWOMgKoG4dRuyzyDb/pn5peRdtZM
         nWJA==
X-Gm-Message-State: AAQBX9cwkOurYfTz0LuEWpckkzx6bTAFilF2AACWHxBOeOiXrmO2QRem
        Sx+RMKvTpiQ4ImzO6bR5pdfZQw==
X-Google-Smtp-Source: AKy350anxCVwbZC5BtR+tV+luXTT5V1kQbKSVhcr9NA857OvJbrgxTJcETyXkyEHeJRHgsYDHWIjyw==
X-Received: by 2002:a05:6402:1641:b0:4fb:953d:c3d0 with SMTP id s1-20020a056402164100b004fb953dc3d0mr8891541edx.20.1679846276905;
        Sun, 26 Mar 2023 08:57:56 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:eca3:3b8f:823b:2669])
        by smtp.gmail.com with ESMTPSA id q3-20020a50cc83000000b004fc86fcc4b3sm13705502edi.80.2023.03.26.08.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 08:57:56 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 01/11] arm64: dts: qcom: sdm845-cheza: use just "port" in Innolux panel
Date:   Sun, 26 Mar 2023 17:57:43 +0200
Message-Id: <20230326155753.92007-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The panel bindings expect to have only one port, thus they do not allow
to use "ports" node:

  sdm845-cheza-r2.dtb: panel: 'ports' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
index f2b48241d15c..59ad6a8403d2 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
@@ -135,11 +135,9 @@ panel: panel {
 		backlight = <&backlight>;
 		no-hpd;
 
-		ports {
-			panel_in: port {
-				panel_in_edp: endpoint {
-					remote-endpoint = <&sn65dsi86_out>;
-				};
+		panel_in: port {
+			panel_in_edp: endpoint {
+				remote-endpoint = <&sn65dsi86_out>;
 			};
 		};
 	};
-- 
2.34.1

