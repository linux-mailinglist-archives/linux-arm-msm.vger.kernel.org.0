Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2234687EDF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 14:38:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231463AbjBBNit (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 08:38:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232552AbjBBNik (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 08:38:40 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA6658BDED
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 05:38:35 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id k16so1416636wms.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 05:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7KwClGhcR7TdVaebtx7GjNjFtUcNjguDWac1KgeKIdY=;
        b=sirCRHdUNdmk19NjuwIv+KzZf/T/MflaVX5bG7x8jouHLbSLJM/uG+QxsjCo4xZ3hY
         1mC/m9W5hCJDtPt2LxHwuuRe4YF2GY/af9llJZU8/EbD60AXQChgZKZ+6eVQIp5Qi2lt
         iZmmIQmiA3/EDKFUZjMOBtnHzs4LfJnj5EoFQBgYD7Y9GZU7CPQfPPgvvD0PCrvqZICN
         Y8fQ0nWn8ZdU9HPlheAEQYvNetcKY5YssqYayjS2VTsm3fP1ADHNDYF8BL2orq7hLym1
         6ddVOX5BIrKwaw9No1kxBC50VOl9YG5HivL/LsIeOuJ/BfEtxGO/pYyff+c0ctfJOuuw
         34qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7KwClGhcR7TdVaebtx7GjNjFtUcNjguDWac1KgeKIdY=;
        b=zNCeN5iNDM5YfYbN7YsdBt8e3cPw/YCFfEAh8PWEC/IW1re8+ezY0Ycnx5VYfWMdbp
         cwYSzSmaFbm7Sp++Bzs8Opalft1DTC/cMLO5ey6oVrH1ra8VJkxD4LdkSoz+3XUnpeO7
         +qSW+aTupr5wP1RaFzAeEtsrxxQONZXzC7xq/Jj/18abYe0yLnwKNMTbXGxNA2C9xV9I
         Nurg/1YxhJ2TB1K6wd6lOY+PC1ONBnAp4uRfIen7W6UrJZ2PlejI5p2Tq7w24HVaezIo
         cx2NOaT1EFu7/+wQBNmnB19hshOPvdFExTDt/XqAd9prpSq2k0tcwNnGwI5eWerxu4gt
         efxQ==
X-Gm-Message-State: AO0yUKVZ7APCYaUam2b6IHfrGyd4N1gR6MJ6WP0oklC27plFYhZhtphm
        yDHY6twtwhEOQpHllLVafWjTTg==
X-Google-Smtp-Source: AK7set+PfKRoh/N122x8wKuwZjQQWzOVhywZf4QE6geVIDyMtQDdYSvmqsewNAcIn2OovgUXp9arlA==
X-Received: by 2002:a05:600c:3b26:b0:3de:3ee3:4f6f with SMTP id m38-20020a05600c3b2600b003de3ee34f6fmr6056336wms.8.1675345115442;
        Thu, 02 Feb 2023 05:38:35 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id y10-20020a05600c364a00b003daf7721bb3sm4672657wmq.12.2023.02.02.05.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 05:38:35 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-phy@lists.infradead.org
Subject: [RFC v3 7/7] arm64: dts: qcom: sm8550-mtp: Add eUSB2 repeater node
Date:   Thu,  2 Feb 2023 15:38:16 +0200
Message-Id: <20230202133816.4026990-8-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202133816.4026990-1-abel.vesa@linaro.org>
References: <20230202133816.4026990-1-abel.vesa@linaro.org>
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
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index 03862132fe41..9aaddafa0088 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -456,6 +456,11 @@ sdc2_card_det_n: sdc2-card-det-state {
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
@@ -562,6 +567,9 @@ &usb_1_hsphy {
 	vdd-supply = <&vreg_l1e_0p88>;
 	vdda12-supply = <&vreg_l3e_1p2>;
 
+	phys = <&pm8550b_eusb2_repeater>;
+	phy-names = "eusb2-repeater";
+
 	status = "okay";
 };
 
-- 
2.34.1

