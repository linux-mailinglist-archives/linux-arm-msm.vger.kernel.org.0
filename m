Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78DDA692171
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Feb 2023 16:02:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232584AbjBJPCl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 10:02:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232430AbjBJPC1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 10:02:27 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0026D70CDA
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 07:02:15 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id u10so4021026wmj.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 07:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zvl8xTLdHdG45pgxCOz2gnmdslKfXq8P1Yli+TaHvT4=;
        b=LUJ4HuZrhcJ1bw29gWQUvJVyEDtVdssEAG8Ib6ts3UBslux9ON/ZufgOhYsJrBbjCV
         hlnviG1GNoRAiCWJ7fN5xC55SxvLL3DQEnCk9jHwuNOUhTbUq+EPA/6jJw1kHceLFVig
         zyO5j9ROJaptpFmwlD6xObCIyMZTCGqXksJ6dFV/cRXE2pRyAljxpYr8lLeAulMtshyz
         9hmJfsKnCWR2VgzcK2E94tvEYYMzuWrpz02W86iCbmeXAXAavsX0RJL4WYcsw+vxwbEn
         rzFW8hDegSD62xCbItEhfE8b3VKVZIN06HyWSKwK/ixwQ3Th+jHXu82GyiEJohXAVoLx
         bWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zvl8xTLdHdG45pgxCOz2gnmdslKfXq8P1Yli+TaHvT4=;
        b=zgY1dzHAgjYy85jT6viZZ1rTK+z/B2xUa/9Xw+AN6JibkwKHeV53WB5GpxgF46Y7kl
         VnHEemb+CQ/DjsTjxXKQkRYOMdmjoevvNCqXRU68qWnsH3n7bmrMna9aJNtDP+z7mf9H
         ETWAaY1HcmhvSNSopYXXvwR/RYfwfeiNq/q9YgabG8QbdlTzNCYfQ8NtLm3GxaJZpF2n
         rMRPrLumwPQoHWAIztovBXpsSQENosBH+luZmzUi3esiWOkLFIYAFCXTXxwcAxVngBBQ
         1INCgk3DQSIhZf03epeRCPPN3t679jnmlJmwYUvuOeGMlSDsNN9kshsZp+ZSThZeXIUz
         xjXw==
X-Gm-Message-State: AO0yUKVZyZfTQ+AQopk8kwtsXHKW5XWG8LoEMZPMRGVTRD2fDBO6rsIU
        iKtVJ2g0veVwLLMMLtTXgMypqQ==
X-Google-Smtp-Source: AK7set/gkn1FV54twbkFpChl0hRZ1mlXaJm5x6e+pKe1fePcWmH1KV5uzIPNMIMluyfEwbUFi2g16Q==
X-Received: by 2002:a05:600c:810:b0:3de:25f2:3aee with SMTP id k16-20020a05600c081000b003de25f23aeemr14218837wmp.31.1676041335117;
        Fri, 10 Feb 2023 07:02:15 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id w23-20020a1cf617000000b003db1d9553e7sm8282482wmc.32.2023.02.10.07.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 07:02:14 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 10 Feb 2023 16:02:08 +0100
Subject: [PATCH v2 05/11] arm64: dts: qcom: sm8350: add port subnodes in
 dwc3 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230130-topic-sm8450-upstream-pmic-glink-v2-5-71fea256474f@linaro.org>
References: <20230130-topic-sm8450-upstream-pmic-glink-v2-0-71fea256474f@linaro.org>
In-Reply-To: <20230130-topic-sm8450-upstream-pmic-glink-v2-0-71fea256474f@linaro.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add ports subnodes in dwc3 node to avoid repeating the
same description in each board DT.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 0a422637b61f..3f4631e06187 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2727,6 +2727,25 @@ usb_1_dwc3: usb@a600000 {
 				snps,dis_enblslpm_quirk;
 				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
 				phy-names = "usb2-phy", "usb3-phy";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						usb_1_dwc3_hs: endpoint {
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						usb_1_dwc3_ss: endpoint {
+						};
+					};
+				};
 			};
 		};
 

-- 
2.34.1

