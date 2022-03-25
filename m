Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86D584E7109
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Mar 2022 11:19:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358778AbiCYKUj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Mar 2022 06:20:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345973AbiCYKUi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Mar 2022 06:20:38 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 245666929B
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Mar 2022 03:19:05 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id r13so14382699ejd.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Mar 2022 03:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=txfMDWQceDbgmOrEc+CTlnZSlzPPay3e29bbmFGpskI=;
        b=aY/UlNLKFcwQI01npAcjm/L7wOLzS2xJ9Zw+MT1p3HNACImlKg70WPLKtmacFC5gTb
         Xoc4FrJdHP7PQLoY0UEuhuaX5Vwyqrktj7Wa2sBTQwFhDG6gUhJ3ul8LMrL4sCHZ68sd
         l+aY4QkwQfvVu5ngmZ70I9/AhkbFbwIkCrLZqSNqZh8notZEpsidKFpSagPFlPM33Qrh
         MCCSJuO/jpN81ZAdQdvKAvnW8yjUimN2YyiH5G933lvB5D89+1LvRivokfNBdrebDj1/
         oG1UgkYqp4+32YQtoBGYC7OQstec+bwYQfqoXyQj5uTSkDt7jZ/3mDQzNEahw80oQ6vn
         pKrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=txfMDWQceDbgmOrEc+CTlnZSlzPPay3e29bbmFGpskI=;
        b=ROzIaPqZLA5A+IywZOkR2XIPcgtjJRn3vs2hjPqBbjxfO1boYkLjdWU4NT26KvqLO2
         aO+ZzKYBEkClh2qwNitZHqwm3oSCH3yfF+Kc6yr+yiP8yNsO6zA5q6c+0jXc3/GnEbTQ
         OB1VGn9OVokAgbVg+XkiAUre6L0jTpL70CSLjhHMF48T9cbLic0O3+yezOkbeL8rLPgm
         2bTlNQ7OwAD6Usx7tCPgfFai8RXOLGJV7FcO7NpqEJnvVYrYH+8qL0+G4i9VejUthaSQ
         DMmZUYcdeh/w9iCqY2X2bZKC9NpRqUTGh/REelc9YFZKuAQs1ilfTNFB+xGfS3fwXrBa
         WBKQ==
X-Gm-Message-State: AOAM533xaaDX3vcF225/Ct2ysYSsjfeZSl4vxYiNm9zbVM1vLprtQebu
        dyzreXL5C+fhfgiigOhNih9bgq/viXJ4tg==
X-Google-Smtp-Source: ABdhPJyIbsV/hWkQgXdZIzsB8nheQMLmBqixJtiigslgQjtIJpHte/2eaEQGBql+3YZPSHhcRqh45g==
X-Received: by 2002:a17:906:5245:b0:6b8:78e0:5649 with SMTP id y5-20020a170906524500b006b878e05649mr11152534ejm.520.1648203543499;
        Fri, 25 Mar 2022 03:19:03 -0700 (PDT)
Received: from localhost.localdomain (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id hr13-20020a1709073f8d00b006dff3a69572sm2122695ejc.5.2022.03.25.03.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Mar 2022 03:19:03 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: qcom: sm6350: Add wifi node
Date:   Fri, 25 Mar 2022 11:18:40 +0100
Message-Id: <20220325101841.172304-1-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.35.1
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

Add a node describing the wifi hardware found on sm6350.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 9ad30086cfcd..1e2810021b30 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1267,6 +1267,28 @@ frame@17c2d000 {
 			};
 		};
 
+		wifi: wifi@18800000 {
+			compatible = "qcom,wcn3990-wifi";
+			reg = <0 0x18800000 0 0x800000>;
+			reg-names = "membase";
+			memory-region = <&wlan_fw_mem>;
+			interrupts = <GIC_SPI 414 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 415 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>;
+			iommus = <&apps_smmu 0x20 0x1>;
+			qcom,msa-fixed-perm;
+			status = "disabled";
+		};
+
 		apps_rsc: rsc@18200000 {
 			compatible = "qcom,rpmh-rsc";
 			label = "apps_rsc";
-- 
2.35.1

