Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C0C768842D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 17:20:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232923AbjBBQU1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 11:20:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232145AbjBBQTy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 11:19:54 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CC1266FBD
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 08:19:52 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id n28-20020a05600c3b9c00b003ddca7a2bcbso1826089wms.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 08:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VtgKBnPRCwb98a3FyvDw8aR7YxIqb2SNRFrW+A++kN4=;
        b=RC8duqK7n91NBKeQMiIyph7LDzlPaClogDiFaNToN/m6hkm6nUraHVjI5ZrmBmAK4i
         fKP14QUUMsTvhSzHFZ+qbr5wOZ18UShuriq2jgToiZNDT9mol1C7OcWeFYyBcaAD1jBY
         j6LUhNuSurEB+eugEqSv4k4/UNsVqKMuTsnPRR9TxRIFka3WyuPSFNTi44q0FQB28PHc
         h8l9Rg4wUOFCmqm0EhL84oxLJrfQmsvYB8YTy+iRuRR9qa7xjkWmpy90V48BBQ9lO/wB
         +3TFJLcYZJBHG/hoXV1q//lJSW/SKPxBwPLsxdmmjT7nXISaQq+m3bV1Kg8vQrWAaxQa
         VtOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VtgKBnPRCwb98a3FyvDw8aR7YxIqb2SNRFrW+A++kN4=;
        b=c9jt3lTzf6omY+K1ymGIvrpWgSMEzKoJ4uq8BDdFp8LD8Un3VJL764CV5c6SYnQNnp
         CxZr2IMEA3TuEebbN0v2Bisrwf+TWeNisAJ40H/5R4BJYL8oUNsemeDro9Silsfn1AGN
         8sF84ZoR3bYX8WWR5O1dx6dzc0F8fL/xqv4Z+Ry5WR4JmS5rCn2stYWXeYdDDDo9qDoO
         OBe0eAKDkdKjpEq0kc16KAcb+iZFlmnSlW4ODK6fazs/Yzh1XtbVss6SQ9qlYbDnQ7CT
         aKRzpRKpxWLtftEOVLpb570JzhGNtnIbRHRnmBtZ6b643u+oXM49ksV23BkhUdtUrc5u
         4Hew==
X-Gm-Message-State: AO0yUKVWswGFOZboR3MMSS/fsPRpDdCkoeEu3z7iWMJMvjCRm7+0azNs
        yxTWJDhOr7V4B5X4ixxfP2NGEA==
X-Google-Smtp-Source: AK7set+vIk6UpkuGODD1j0SYtAncrTjWyvRYc/zd/hzQaegDljSJXvxzHTMGQvuuSIvf2Q2vqUUnZw==
X-Received: by 2002:a05:600c:354c:b0:3db:1a41:6629 with SMTP id i12-20020a05600c354c00b003db1a416629mr6392726wmq.22.1675354791974;
        Thu, 02 Feb 2023 08:19:51 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h16-20020a05600c351000b003dc521f336esm212416wmq.14.2023.02.02.08.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 08:19:51 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 13/13] arm64: dts: qcom: sm8150: add compatible fallback to mailbox
Date:   Thu,  2 Feb 2023 17:18:56 +0100
Message-Id: <20230202161856.385825-14-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202161856.385825-1-krzysztof.kozlowski@linaro.org>
References: <20230202161856.385825-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SC8150 mailbox is compatible with SDM845.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index fd20096cfc6e..6c6fea74d438 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -4097,7 +4097,8 @@ intc: interrupt-controller@17a00000 {
 		};
 
 		apss_shared: mailbox@17c00000 {
-			compatible = "qcom,sm8150-apss-shared";
+			compatible = "qcom,sm8150-apss-shared",
+				     "qcom,sdm845-apss-shared";
 			reg = <0x0 0x17c00000 0x0 0x1000>;
 			#mbox-cells = <1>;
 		};
-- 
2.34.1

