Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12263617739
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Nov 2022 08:10:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231158AbiKCHKI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Nov 2022 03:10:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230348AbiKCHJ4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Nov 2022 03:09:56 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4F4C10069
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Nov 2022 00:09:52 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id d13-20020a17090a3b0d00b00213519dfe4aso1022157pjc.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Nov 2022 00:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sNnO/JypOAt/4mb47yViotiM/3nDhVevoD9t+FcxiWU=;
        b=gB/XxAjBKF+5AjI0SAFaNnpDy8e2aX+xn6H5xJI6S1lPc/4om5sj5iGnn7J2+l281y
         KfqjtBol3mM/bkr3+E6gGp/Bt8bch0nuhpbS0qrDBkTjJ980T/DwSi4ynwq8DqYGLt83
         1drc0WDeI4aZpg9B7Q8r27yIyuLPobsRd8wXyOgLJoZUb5N2f7oM3Z2GItokAvxTKK9h
         P4lTYWODdWoLx2vDghJ5ip7KELUunLeInAt51isGxZOrb+g+yaNyyNsb/qF8B0wb789t
         jOtry401XUuI8hoj+TS5Rmv85h35Plp6OaWbmkrXhh40zqLB/JCyQ3QKALy29T0pKaMw
         Ub6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sNnO/JypOAt/4mb47yViotiM/3nDhVevoD9t+FcxiWU=;
        b=4XnRdPj/eZDQqSMTUZLX2ZOATvo/3xe7kTrWL9mctZsKK2UrWGVA4RsGTNsdqYFpQu
         /csuJfHhotM1PHMWq/lEjeO9mEnXSbyPTlR+QPmcx9B+CJRNKoRNlO3R42SNyAY8lN23
         XNJpau4+PZGHFtLrZzBUDKgJR50msHOyNkCgc+fBfU2mLm+xPzrEkqlvOMaTZPnJ682M
         LsVENEm0BIV2RKGh3HHCoyZzJtXlU/rfPDOns9eKxRSj8uoD68JNm7Dk4iP4SRzxJjru
         t4N/xJ63JE6N6XSw2/ZwuP34FZa2v+X4+jRRExfa8fOPfC4erQ8v6ELS0QxYF/VnOiWe
         YV8A==
X-Gm-Message-State: ACrzQf1lPUeGrHyU/04vJdYeTnuJEQQn8zm7DAwCxbG/RQmILeqE6PTs
        jHO5hJB32seO/tcjUgsgPTop
X-Google-Smtp-Source: AMsMyM5jOZKtLsy/lSqi141RLNUaylntx5dv/WkYDP9v6GhBElj6sCtTGzdAYCnHkf7l2xFXX/z65A==
X-Received: by 2002:a17:90b:438e:b0:213:c985:b5dd with SMTP id in14-20020a17090b438e00b00213c985b5ddmr24985395pjb.116.1667459392187;
        Thu, 03 Nov 2022 00:09:52 -0700 (PDT)
Received: from localhost.localdomain ([117.193.208.64])
        by smtp.gmail.com with ESMTPSA id s9-20020a170903214900b00186748fe6ccsm9451244ple.214.2022.11.03.00.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 00:09:51 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, johan+linaro@kernel.org,
        quic_jprakash@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        steev@kali.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 04/12] arm64: dts: qcom: sc8280xp-pmics: Add support for PMK8280 RESIN input
Date:   Thu,  3 Nov 2022 12:39:03 +0530
Message-Id: <20221103070911.20019-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221103070911.20019-1-manivannan.sadhasivam@linaro.org>
References: <20221103070911.20019-1-manivannan.sadhasivam@linaro.org>
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

The RESIN input can be used to reset the PMK8280 PMIC. Enabling the
RESIN block allows the PMK8280 to detect reset input via RESIN_N pin.

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
index 397ff4995003..4a3464f5e6e9 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
@@ -68,6 +68,12 @@ pmk8280_pon_pwrkey: pwrkey {
 				linux,code = <KEY_POWER>;
 				status = "disabled";
 			};
+
+			pmk8280_pon_resin: resin {
+				compatible = "qcom,pmk8350-resin";
+				interrupts = <0x0 0x13 0x6 IRQ_TYPE_EDGE_BOTH>;
+				status = "disabled";
+			};
 		};
 	};
 
-- 
2.25.1

