Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9976B7B2D9B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Sep 2023 10:17:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232819AbjI2IRw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Sep 2023 04:17:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232838AbjI2IRu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Sep 2023 04:17:50 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E14C1B4
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Sep 2023 01:17:48 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-522bd411679so17052754a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Sep 2023 01:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1695975467; x=1696580267; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mjg/OOV1lyu0ZM76luSIdSZTlINxZsnRT51fNeIzO0U=;
        b=Dcxs+rnrZty+b//dIuZKvPTfWJMfmKXVScj1GQkgMPsGerYPmoFzenof9iDFnPKf1k
         WwhX+g+ydt+exuUDp04YO5JKdW6xvEjnkUCnGKgds+ji3dDp+lQ7TqM2goeU/NwJw0Ui
         ZLTHHW10cNsA/G3CQH6lhmRfzYY1I6L5fMdlVEsBZbFxl/PGIIaHjp9kgPkSshBR459e
         HRU9oYh9U7bnypGQItDuZbiADq7k6yA3G6wLcw5+qci+zcq6GZ3DO9LrAgXqXcb6fuD+
         ytRBmFDCR2zVNc1OCLC/gZxQrV3SRFtrBCICRA6aL9WIq1nyGTo706JCYJ0H2zXgG5JO
         VdVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695975467; x=1696580267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mjg/OOV1lyu0ZM76luSIdSZTlINxZsnRT51fNeIzO0U=;
        b=MMAESkFIVJxMbgYPimxG9zFYniiYZK/OoeVrmae3/DuHUlgcg2njUF6lAItQjWib4j
         krt2IOPeNGymuOEfGbPcnbMIY+KsFMa6QD5U5n/Ew/RAX+EjfpHKyNRznAXbh0SO2XTs
         YkELxsN+eJ9+mCGkP/ECfycPgdHIjIgNHnwV/aGqho5oEpuJFCIJgPwGXHeAT6yQ+iwO
         7oR9eyIm43iNsots+rlm3gaIyW2RKZZgN+Q6N98E7U0C6o9F1Sc92DHogcr76mSWbTuO
         aKoQv9rSqpMqFK0pYUCFmZ2uN5rAq2u2OJWHePiAM4YixbNDUR1nLAAmXkCfx0+Lcw/e
         k6Qg==
X-Gm-Message-State: AOJu0Yxv3Fo+fawkJNiecEPXoS3uZP3all2RAM/+28qWLhd67LGI2I1t
        RY+VErGKqrrghRZ9c+UIKgPc7Q==
X-Google-Smtp-Source: AGHT+IGNMF9dq96zmzBvLwRdTFAD5BaFsUEit6AtZ3ewgeB7NiMDeOLFUa0yLHiABLhGW6vTFYwtmA==
X-Received: by 2002:a17:906:cc0e:b0:9a9:ef41:e5c7 with SMTP id ml14-20020a170906cc0e00b009a9ef41e5c7mr2967227ejb.8.1695975466889;
        Fri, 29 Sep 2023 01:17:46 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id y22-20020a170906449600b009adc77fe165sm11873803ejo.118.2023.09.29.01.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 01:17:46 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Fri, 29 Sep 2023 10:17:39 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: pm7250b: Use correct node name for
 gpios
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230929-pm7250b-gpio-fixup-v1-2-ef68543c1d3b@fairphone.com>
References: <20230929-pm7250b-gpio-fixup-v1-0-ef68543c1d3b@fairphone.com>
In-Reply-To: <20230929-pm7250b-gpio-fixup-v1-0-ef68543c1d3b@fairphone.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use gpio@ instead of pinctrl@ as that's the name expected by the
qcom,spmi-pmic.yaml schema. Update it to fix dt validation.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/pm7250b.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
index df0afe82f250..3bf7cf5d1700 100644
--- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
@@ -148,7 +148,7 @@ pm7250b_adc_tm: adc-tm@3500 {
 			status = "disabled";
 		};
 
-		pm7250b_gpios: pinctrl@c000 {
+		pm7250b_gpios: gpio@c000 {
 			compatible = "qcom,pm7250b-gpio", "qcom,spmi-gpio";
 			reg = <0xc000>;
 			gpio-controller;

-- 
2.42.0

