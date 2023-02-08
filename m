Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C35968F7AE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Feb 2023 20:02:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231618AbjBHTCZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 14:02:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231549AbjBHTCS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 14:02:18 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25DD5552B6
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Feb 2023 11:02:16 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id j23so2608316wra.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Feb 2023 11:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MhSD2EYMzeYmp4lc7JlIcu+kMhKbNZUjdV/v58pmN/I=;
        b=LMc4BxAQ7oZVRUuNxPjR5pWqTFbCCwaFhO5KTA1zkMPBzmtlm55CRbxr9bIFtwBe0g
         AVN1/LfqbG4JeWn/7ROoyQ4GBvJIXVffmWosMBZxFm3FvrcNIApzBlGpv0KqSqeRA1Zc
         T+Agpkmlfwa5Xx2ifhi4bVx/D+QsWBHTgYR7kQa75kQwmc1NoHDLuPRNzFY+GESJcgZH
         5nJ79Uv3NLy7NWhJq8+vMg3yItAXxejZoLzXGct0etsyVJcTS0SM2Fn+D1kNcET/nfMf
         4mDgdDyBugnux9n4VG9nrK3yDKLWwn3nb7+nT/+bHXTBLm0FQ9DVs41juW8Kiv9cZSSm
         Ifag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MhSD2EYMzeYmp4lc7JlIcu+kMhKbNZUjdV/v58pmN/I=;
        b=w/ExPWVgkNHuGsum+x5aK8aJnDgYFBcxotoD1N59fivujwRkV5DtEfpsF0wjFxhBBY
         PKzPcgWQsohpBnm5WY8Kq6zq9CckY50EdK+ExPTL/yMjuMToPUrro2Bal3wbnQijnasf
         tUC5qG3NX60J8FBcBBayClucz10Oihh7Kyg+INIPRNMl4mq2r0fXqNjhmAQ0VtgEUb0G
         JENLJrA1QjBgFw3mQZi+UvOhSs5lMSLGRVKjCH5pXqtDsJIo9T0XUBloFJ9mhgS4fjel
         vFxXHrdvRlDhvEtWzRBXLyyXd0i8doIyHrQrHSF+kMNpBX31e6Xx4nBfdQcKFXR+wqJr
         v+ZA==
X-Gm-Message-State: AO0yUKWhONtHRfVuX38uo44GMBoiOVmH/tfH3k006+9p9cNSxS86Duef
        HQmDzjjuNt8wx0Iitfkgu5W6Qg==
X-Google-Smtp-Source: AK7set+q01pJi05o5iDlEX6osfNZc0O0qfck2gCOu6I3wlt9jssBIk9OXQNFKR95bJ9+q3PIQi2utw==
X-Received: by 2002:a5d:60d0:0:b0:2bd:ee0c:26a3 with SMTP id x16-20020a5d60d0000000b002bdee0c26a3mr7632764wrt.8.1675882934685;
        Wed, 08 Feb 2023 11:02:14 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id n16-20020a1c7210000000b003dc1d668866sm2650327wmc.10.2023.02.08.11.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 11:02:14 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 7/7] arm64: dts: qcom: sm8550-mtp: Add eUSB2 repeater node
Date:   Wed,  8 Feb 2023 21:02:00 +0200
Message-Id: <20230208190200.2966723-8-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230208190200.2966723-1-abel.vesa@linaro.org>
References: <20230208190200.2966723-1-abel.vesa@linaro.org>
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

Add the PMIC eUSB2 repeater node and add the usb-repeater
property to the eUSB2 PHY to allow it to be controlled by the
PHY driver.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---

The v4 is here:
https://lore.kernel.org/all/20230207135551.1418637-8-abel.vesa@linaro.org/

Changes since v4:
 * none

Changes since v3:
 * Dropped the phy-names property from usb_1_hsphy, like Dmitry suggested

 arch/arm64/boot/dts/qcom/sm8550-mtp.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index 56aab7cafcbc..6b6ec0fe5e5e 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -457,6 +457,11 @@ sdc2_card_det_n: sdc2-card-det-state {
 	};
 };
 
+&pm8550b_eusb2_repeater {
+	vdd18-supply = <&vreg_l15b_1p8>;
+	vdd3-supply = <&vreg_l5b_3p1>;
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
@@ -563,6 +568,8 @@ &usb_1_hsphy {
 	vdd-supply = <&vreg_l1e_0p88>;
 	vdda12-supply = <&vreg_l3e_1p2>;
 
+	phys = <&pm8550b_eusb2_repeater>;
+
 	status = "okay";
 };
 
-- 
2.34.1

