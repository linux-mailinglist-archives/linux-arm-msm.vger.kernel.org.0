Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 694C1772EC4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Aug 2023 21:35:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbjHGTfZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Aug 2023 15:35:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbjHGTfX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Aug 2023 15:35:23 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F3951726
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Aug 2023 12:35:21 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3fe1a17f983so41422155e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Aug 2023 12:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691436920; x=1692041720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XSsBSVLtrUYlv/MGrIezXmSe6WOfaa1FZe1kCeq6Zm8=;
        b=L7uC2z1HR78duqiRFC3J5QmDk0rcMFKv+OS9eicsmH1tv4MLrXE2uEgfPWWfUlB9CU
         1y9fVJob1NzP2h6EsLC65fc+wae+BPL4KrjdW3lO6SjKS9Gs09G4sAo3f52or5ggzM+M
         kCe8y/iFwsHevNDhyQLdaYm0vKqp3xV8YfAVPHS/csMHyHWSAM5g8sqX0/rlMGI5KMzG
         ufaoABATQYUEjKP2z64V4fiRIX055xgNogypA+OeV63ZwwiT/nzcMjVF6U5ugu32LO8l
         KFMvQRgRNtT/1LlLViC56Yu1iwiVhtzPH0/0WbWnQd+Kg6g5lX1GvxDHpzz6c0MOiIuO
         rb3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691436920; x=1692041720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XSsBSVLtrUYlv/MGrIezXmSe6WOfaa1FZe1kCeq6Zm8=;
        b=jl4Onl5IHXevoY0jJ8qej0eR5s1EIHJiUvnbZPj7LTyoh23SZC6cxoSUSaGXIg7uR6
         frXCsV4+3NJ4IWPg4OXXDjpK/uj6vYcBsMAPOkgw9ah8o3wVyrLzPvwVgsFioZxPVwJB
         92qVt7xeHZFNWCxsatwGkJ6pfZTdQekE1NTPBrGp6H5u63xKdMdbJrxbhqvlEPUFiG8L
         6rrBynrBhjTZLIBpVsETkCexxIIlHsSo78Jax/dRYIH1Hf+nIrn2l/Tfe5eFdMXartq/
         yJKF07CahNWzTiRLmVgZmDpgnkyVlYYOO0FCjYW8sG6pTQLvxW22I84VUv2qe/l7PsbC
         PL6A==
X-Gm-Message-State: AOJu0YzPOs/LDd0tyCD0vbNuOaULY2cjmMkZPEsVWo8cDe8PfUemNihs
        YVQF7xlyzwDQgEoBFN1+M6i2Kw==
X-Google-Smtp-Source: AGHT+IG+SkBKOfidcaodaO1gm6lOflL8wEWK21n8mUiUo5jekg7Zu0ZNOtuA8Mr6YGy0n+zByHfAKQ==
X-Received: by 2002:a05:600c:2a50:b0:3fe:63ca:ccf2 with SMTP id x16-20020a05600c2a5000b003fe63caccf2mr11136wme.33.1691436919831;
        Mon, 07 Aug 2023 12:35:19 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:b3d6:9e6:79d9:37cd])
        by smtp.gmail.com with ESMTPSA id q9-20020a1ce909000000b003fc04d13242sm16061488wmc.0.2023.08.07.12.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 12:35:19 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alex Elder <elder@linaro.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Andrew Halaney <ahalaney@redhat.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 1/9] arm64: dts: qcom: sa8775p: add a node for the second serdes PHY
Date:   Mon,  7 Aug 2023 21:34:59 +0200
Message-Id: <20230807193507.6488-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230807193507.6488-1-brgl@bgdev.pl>
References: <20230807193507.6488-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a node for the SerDes PHY used by EMAC1 on sa8775p-ride.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 7b55cb701472..38d10af37ab0 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -1846,6 +1846,15 @@ serdes0: phy@8901000 {
 			status = "disabled";
 		};
 
+		serdes1: phy@8902000 {
+			compatible = "qcom,sa8775p-dwmac-sgmii-phy";
+			reg = <0x0 0x08902000 0x0 0xe10>;
+			clocks = <&gcc GCC_SGMI_CLKREF_EN>;
+			clock-names = "sgmi_ref";
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sa8775p-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x30000>,
-- 
2.39.2

