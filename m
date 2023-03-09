Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94C1C6B254B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Mar 2023 14:28:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231165AbjCIN2P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Mar 2023 08:28:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230293AbjCIN2M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Mar 2023 08:28:12 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F65E1CBCD
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Mar 2023 05:28:08 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id l7-20020a05600c1d0700b003eb5e6d906bso1211923wms.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Mar 2023 05:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678368488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IIb+jAhfv8fpqr/ySQLDnUq5V6TTEcYb4TdjBUBn+tY=;
        b=bhCG0oMF3z86mRtaSL7R/GR6Y/x4SbLUy7FxMUboHtbdK/GkudTkcTJD07eFUoPpTy
         VVKfv4+PCYrbKF3FVbeoMnC+Y7iFtwx13dWSPbmMjs0CZrz56dynRQUYLDuMyrMFY09G
         hk4RIzkbgyWHH2WWxXwLsTokq6WR+d/hbp6FDboWiQLlUgSf7xUUvtgxAj2uiZ+fJzhS
         L5yGdaRYqA4jXPJBlnipHI2aFHYazHrzl+Z0akhMFylkGLRyRytGaxDW81W+AxgvbmZI
         3n0k4FJzb9qJkN/BNkUP5Q4PSm8i0sJM+zddngCP7jAr9PkiXMtmARlz3LTI97M3nVoa
         QuGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678368488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IIb+jAhfv8fpqr/ySQLDnUq5V6TTEcYb4TdjBUBn+tY=;
        b=Gk/lrZjAjcHOtFY+pZ129zOkHMFGBf+TQCViz4teZn2QONvbwbhsw2JW7A1m/ovsSa
         wj9YM1kRVPIDaEi8GkxFymqTqTTSAK/ddu1ekDcPhJcQT4ijumJwl/9KhTTAYLrMlABv
         H5/8/vlOfAWPlLd6Ke/dTA4dlj2neFE5OfvuvtA+Hp4gVJbug+AbDl+mvunMpItJjlyL
         TkuudRjn7rBOKlsgruP52S6dGrZMhAXzWRfCO3Fklj4g/N7A/5rThBvk6eYhMvkIKZFu
         2OQ1CIjhUTKijsIoAOPuj7VD0wzV1pQuMxNHC2abjc1/ynVNSx3amy2IcnGWlp02vmOr
         PNKw==
X-Gm-Message-State: AO0yUKVC3+wExyIM7GEzDIgkzW0jpKntts86MoqkRHgwPdsvpJbl4GgR
        w55fQxKBK6tu2wwEaP690UxCPg==
X-Google-Smtp-Source: AK7set+HN2OLWNXgd1pKkmJ4+ARit5gbjmGyCJACu2dEzVrBukajWRcNmErYbt87vGh1/lpedn/bpw==
X-Received: by 2002:a05:600c:34c8:b0:3ea:183b:a525 with SMTP id d8-20020a05600c34c800b003ea183ba525mr19847456wmq.36.1678368487981;
        Thu, 09 Mar 2023 05:28:07 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id r7-20020a05600c458700b003eb966d39desm2926714wmo.2.2023.03.09.05.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 05:28:07 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Thu, 09 Mar 2023 14:27:58 +0100
Subject: [PATCH v3 07/12] arm64: dts: qcom: sm8450: add port subnodes in
 dwc3 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230130-topic-sm8450-upstream-pmic-glink-v3-7-4c860d265d28@linaro.org>
References: <20230130-topic-sm8450-upstream-pmic-glink-v3-0-4c860d265d28@linaro.org>
In-Reply-To: <20230130-topic-sm8450-upstream-pmic-glink-v3-0-4c860d265d28@linaro.org>
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
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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
index 1a744a33bcf4..ccda73426ee2 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -4155,6 +4155,25 @@ usb_1_dwc3: usb@a600000 {
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

