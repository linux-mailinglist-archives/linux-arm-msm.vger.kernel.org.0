Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9036B734281
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jun 2023 19:16:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236059AbjFQRQS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Jun 2023 13:16:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346266AbjFQRQD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Jun 2023 13:16:03 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CED731BE5
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jun 2023 10:16:01 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-970028cfb6cso301183966b.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jun 2023 10:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687022160; x=1689614160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dNUvEkbK/CibkrjYamEabSFmvdm4uRr71HgfYETJG7c=;
        b=SL6rudUunoHtKlkI6cFXBZ+PBgtY9nrPydmdhWwNVK6pDz7wqtkUIojAn7hpY9BzKi
         S6DivpK3rHn75N5AuqCVBOFa8ltVhLiR5gFu0fT91proZ3r815r0Uhj3tqPtvetP0VGD
         ImCk2hEQPaaqGkO+KcN/9IBg0OXNW7hG3/OAGhb2w8tDgXal5K4AJSstyItI9nkhbkeL
         4Bcg9rLAGSi3DtTf+IfAMKUxoxNS25kVHPvfnJ6PYCMt9qqJb58EZIgEFI9Lyfm3rvjx
         BntSjSgoxXTc/MjLETWhznXNQOxPc60JkBKG8uO5/qbqAo5f+rOYVqaHkAsyoG7fg+A4
         /UzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687022160; x=1689614160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dNUvEkbK/CibkrjYamEabSFmvdm4uRr71HgfYETJG7c=;
        b=LOlgLgUA8PdUKZQ7lwxM0XfSYYZ46l0k/7d3zXI7WrlExZb96m/f2MnahFSLx0qjkn
         h3+kGQK//rnaCKsfUutzjMd2MCU5ZBkZNWqmSdKLjthKpNso93E8ZJO78PMHWN32qxoZ
         3VQ93ow7ps6Y/4zSALqHH4Z/2K55ZHY4btSknDg5Hoxdfgopg1ApMQ7ldfts170lZ/4V
         +yh4xpA5UGZ+vL/NuKl9W+pY5XRBDAD0HVZ7TRwp9OlMCwjkNOCyuwgYkIf0i4VvDmu+
         JLIS4iQDyQFfTSV/NL1+CA92jPz1CESdFmRFQbuLd5rg8TI0/Ow5mltal5QpktXVq3Zu
         bjQw==
X-Gm-Message-State: AC+VfDxvMdrmGTFYZ4U8KQb6eyqcqRbYbn6uTqihoI7Emf1ODtJ0eIyJ
        qaGvEmXf5QUNsJN5WtbDFrfKeQ==
X-Google-Smtp-Source: ACHHUZ5f2XCumFXaTh2SnplkzTzlTngX5uKfERb64QAKJvtoLClAL58T1vdNfC51Rf/UjxqhWAxLkQ==
X-Received: by 2002:a17:907:3e16:b0:978:a186:464f with SMTP id hp22-20020a1709073e1600b00978a186464fmr5628884ejc.39.1687022160380;
        Sat, 17 Jun 2023 10:16:00 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id os5-20020a170906af6500b009829dc0f2a0sm3841897ejb.111.2023.06.17.10.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jun 2023 10:16:00 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Nikita Travkin <nikita@trvn.ru>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 12/15] arm64: dts: qcom: sc8180x-flex-5g: correct panel ports
Date:   Sat, 17 Jun 2023 19:15:38 +0200
Message-Id: <20230617171541.286957-12-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230617171541.286957-1-krzysztof.kozlowski@linaro.org>
References: <20230617171541.286957-1-krzysztof.kozlowski@linaro.org>
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

Panel takes only one port:

  sc8180x-lenovo-flex-5g.dtb: panel: 'ports' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
index b12e0a61b3c0..39c6ef0802aa 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
@@ -298,11 +298,9 @@ panel {
 
 			backlight = <&backlight>;
 
-			ports {
-				port {
-					auo_b140han06_in: endpoint {
-						remote-endpoint = <&mdss_edp_out>;
-					};
+			port {
+				auo_b140han06_in: endpoint {
+					remote-endpoint = <&mdss_edp_out>;
 				};
 			};
 		};
-- 
2.34.1

