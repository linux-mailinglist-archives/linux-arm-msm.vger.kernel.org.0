Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22C2D6C329C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Mar 2023 14:22:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230472AbjCUNWV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Mar 2023 09:22:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230301AbjCUNWM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Mar 2023 09:22:12 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6E7C28E58
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Mar 2023 06:21:50 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id p16so9540579wmq.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Mar 2023 06:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679404909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6rVvABTU02+Rtyy/Qih7T8rgJ/JIJYUn4nN2d26Tjag=;
        b=D1e3kjwRbremSTztqTEK2Nl78e3myPW+4NVxMGR79Yl7w968hDavd5+nrdY1GP3XM5
         J5+d56RZGhgCUUoyT1uSvgsJ9wLHlNAcVpVZWpP/xQQt7wQ+R+tnauB0NFNNjQr64kT5
         gJ+MR3TtH2lHN0l0wabndvVkA8+82CvK+Juc+nDGAFhHRlnVQWDd9NnTpBx0ITy8irYA
         kECUZiobzUBfqDPnFHNHy4Wq7ODsUL54y3eR4AurqCncF6EaJabKbBsHq63O0lcGg2Lk
         aFNA9Amq3P+b1C8oMSEmYri88EhSbP/Ej8OQKxZTb0S4YAPyrj4iakmUB4AbkGBrKCXy
         Y57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679404909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6rVvABTU02+Rtyy/Qih7T8rgJ/JIJYUn4nN2d26Tjag=;
        b=ip4o6YBnB9w8468Uv04qU/Ho6keqGdmBS2poR4mL4ajCvlK9qIi+LGxPph6CZ9rpsn
         GoRGIltXNy9nTczP6J9q30Nr3os1HHcTasYz89BOTOAlDSt02E7Rkf/H3ED+BFJ6bABb
         D5vG2fxb4XUDFllTJYnRyVYYpbV6s71NTQQcNqLhOvqfmgA+ZbvVkfDU0uDhyP5mc5+f
         rts44t3nM66EdK3Q3S7hIzyplqdkjH5IlahQsz77GcxoeOdvxhyxtkz6ST3wroKYz66/
         6UtISA3W9ferzgX2pxngUj7ib2EYLZkKRTyMK/jCXdTtUFDKfPNtXWoREN7vFNY/cRZ1
         bTDg==
X-Gm-Message-State: AO0yUKWql58K1WbymMlD60DXON54Eyih16tLXeX0OwF8CDQ4SWehp63r
        0qq5/6NQn8O7BB1erfhvKYO95w==
X-Google-Smtp-Source: AK7set8hpDUckQt0l9ZezyB1CBBV8hWR73J365gkooeRbnkTI/4tGwhHhuEQs2jzhA62Ih86jmeI0w==
X-Received: by 2002:a05:600c:4e09:b0:3df:9858:c039 with SMTP id b9-20020a05600c4e0900b003df9858c039mr10837822wmq.14.1679404909067;
        Tue, 21 Mar 2023 06:21:49 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id v26-20020a05600c215a00b003eafc47eb09sm13393016wml.43.2023.03.21.06.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 06:21:48 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Tue, 21 Mar 2023 14:21:47 +0100
Subject: [PATCH v5 07/12] arm64: dts: qcom: sm8450: add port subnodes in
 dwc3 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230130-topic-sm8450-upstream-pmic-glink-v5-7-552f3b721f9e@linaro.org>
References: <20230130-topic-sm8450-upstream-pmic-glink-v5-0-552f3b721f9e@linaro.org>
In-Reply-To: <20230130-topic-sm8450-upstream-pmic-glink-v5-0-552f3b721f9e@linaro.org>
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
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add ports subnodes in dwc3 node to avoid repeating the
same description in each board DT.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 69695eb83897..d92d49a1ca2c 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -4170,6 +4170,25 @@ usb_1_dwc3: usb@a600000 {
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

