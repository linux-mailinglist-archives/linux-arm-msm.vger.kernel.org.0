Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEFFA6CA4B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 14:53:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232689AbjC0Mxk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Mar 2023 08:53:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232477AbjC0Mxa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Mar 2023 08:53:30 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 728FA19A9
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 05:53:28 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id l8-20020a05600c1d0800b003ef6708bbf6so3157948wms.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 05:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1679921607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RVPd6z3eFRROHSFksVoIxkaOXyB+uKNiEShdPaS7GUc=;
        b=F0g51YkdfgZH856IiwVk8kBXYUu6ZxbfUncT/ytqXJ9OgkB1cIVPBSFhgBMKCT7hbQ
         h8oUV4f9pl4JfcM59ZAndni4E9zz+bZ/pdArsi40Z6xagcdF6bdc8qLN1SIgfMRT7w4z
         hkZgiLja5xj1ylv6NSZvhp4vhuhYGQ5U73P2Ptv77WP9AyMzNlEDTxbHXQNHmSaU5n9n
         pVfCdu6ek9L5OTAmTeHCpmZLFsLXYx6IPn8iIQqQYuhrE/tVKjxwVYztYPox3pmIAwTo
         htX3wUdM5OJ4CSGiNU0pNuYRnWfWppO/CZ/FzgUomm0cfITKdzzRiREiWUj7AaY8XDop
         nkgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679921607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RVPd6z3eFRROHSFksVoIxkaOXyB+uKNiEShdPaS7GUc=;
        b=ag3khfFRrTEDF+gIsCBoZXYkJJpO26XhOMbJ/ytfptJCjfyweuyb+/D3gbGUm3q4c9
         dOv/qKYXEmlDxmEKc0UChvn6tyw5mZZmK66lsueZdR/eBGKB798LF+FlS8+1cR8rBfOr
         GIko85J65DJtLrZB+VyKoRXToaGGc66lsI5aJ/yGhrAZVQmHbBcB8UvTeYtarLbGJA1m
         P5IDtVNAQKE1++9CsvVYL33whXM27QSrKjYsUFGX6vEZ17c+euIwaLh7qPOTlCqEtk3Q
         /T4nC1nztixU/7g/3hoSORMjtwsTisVX2tf0bcWhUqnC9IHG5lKt93ifPPI1soxSLydm
         N/+Q==
X-Gm-Message-State: AO0yUKVkYgXyE2UzKjJQmt53NjRSDWxWzZhtUxk+ZHT52FJ5V+pE1ufK
        LK3dUgqVxEqdijHIdiPBs/sK1Q==
X-Google-Smtp-Source: AK7set//qBvMWzr7mNo9bh0ioOCY2bcCR4QqyYS4f0sqDiCeuj76qVu/o/rcSU1AaAtZbvD8yy1hsg==
X-Received: by 2002:a7b:cbd2:0:b0:3ee:3e07:5d26 with SMTP id n18-20020a7bcbd2000000b003ee3e075d26mr9230339wmi.24.1679921606951;
        Mon, 27 Mar 2023 05:53:26 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:313d:a304:2790:a949])
        by smtp.gmail.com with ESMTPSA id q25-20020a1ce919000000b003ee58e8c971sm13572220wmc.14.2023.03.27.05.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 05:53:26 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 08/18] arm64: dts: qcom: sa8775p: add the Power On device node
Date:   Mon, 27 Mar 2023 14:53:06 +0200
Message-Id: <20230327125316.210812-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230327125316.210812-1-brgl@bgdev.pl>
References: <20230327125316.210812-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the PON node to PMIC #0 for sa8775p platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
index afe220b374c2..dbc596e32253 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
@@ -12,6 +12,14 @@ pmm8654au_0: pmic@0 {
 		reg = <0x0 SPMI_USID>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+
+		pmm8654au_0_pon: pon@1200 {
+			compatible = "qcom,pmk8350-pon";
+			reg = <0x1200>, <0x800>;
+			reg-names = "hlos", "pbs";
+			mode-recovery = <0x1>;
+			mode-bootloader = <0x2>;
+		};
 	};
 
 	pmm8654au_1: pmic@2 {
-- 
2.37.2

