Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BB146B2554
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Mar 2023 14:28:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230416AbjCIN2S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Mar 2023 08:28:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231221AbjCIN2P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Mar 2023 08:28:15 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66E473C791
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Mar 2023 05:28:09 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id az36so1153586wmb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Mar 2023 05:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678368489;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y7uAEq2TyKPhC0hnHOKkhkUFcLViZrukZ67+qR1wCW4=;
        b=RcSeibF5jTfFoLcLRn9u1iEpv9nekNW/d3R1mLLs6x4O8xQ794BZC2mBQqq7RZvFO9
         0h8vt3KZ8jU7nM/50d4/uuqav0zRRI+aPfx+x/rJc1Cf1Bi+OTkRvDt2xWUdJUTwDmYN
         FixSm82S7ilVgvhx2BnDFFVWZvXzEsrKerm9S4CUIF5cMcXCn6Q05YJ/wIT2G2wh4Sgm
         upp5zLsG6R4u9fQL8pvfSs+LRUidwswZsuoiYwFIhOypCv4Pk3Whd5xSWfLTym0U8CGC
         M9YbDR6Z08sRx4JLiRidi6k4loGXTPipYRBq+VTDO2eHcci4W7DYnQ/KBxu376c5VQFI
         xNHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678368489;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y7uAEq2TyKPhC0hnHOKkhkUFcLViZrukZ67+qR1wCW4=;
        b=cD3ppXRkLMtFg37OI7rS5MEaY2vKVhis/FEABgBKslSvJkTXkBVEnW30uX1RY7x8bT
         qh2fZrcW1JTU5hzxxm3EFzF4cRROLO9cxCJx5PWfrzeAtKXn2gftXv8gLW7mWQSDOtQj
         82+zHuXxfPyzFxWFqOWdzoRdGNtEPGvmzPRhMfzbsOudRr2A5UUHFjt6cIvP4DnjFdgA
         6o+tcVfYEvFAYhQxKiqTmUFVQmZR9f+NSB1LKH9jA193hpFK5PhfkFXNMVdIqmvlqAjq
         MoehZUEBlr52y9yiC2YG20/utTXB7hz8UfWVtMaIG2j/XrzCKOxyQnPLYk836sybHiTD
         gxZQ==
X-Gm-Message-State: AO0yUKXIKlB8pZGO7z54yj85CjzwqBDXdKJmD8bFJ+LCBC0xStLnp4Gc
        rMCPRvFhvf4ULP/WVOJfcgy7ng==
X-Google-Smtp-Source: AK7set8agEIuyZHhm3Ae9uVC754ljdQ41hdv0zYBi46QDJcccdlEumNqtKsTRbap11JDAL5fIaEayQ==
X-Received: by 2002:a7b:ca59:0:b0:3eb:966f:5811 with SMTP id m25-20020a7bca59000000b003eb966f5811mr16513880wml.3.1678368488961;
        Thu, 09 Mar 2023 05:28:08 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id r7-20020a05600c458700b003eb966d39desm2926714wmo.2.2023.03.09.05.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 05:28:08 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Thu, 09 Mar 2023 14:27:59 +0100
Subject: [PATCH v3 08/12] arm64: dts: qcom: sm8550: add port subnodes in
 dwc3 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230130-topic-sm8450-upstream-pmic-glink-v3-8-4c860d265d28@linaro.org>
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
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index ff4d342c0725..283163eb01a2 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2467,6 +2467,25 @@ usb_1_dwc3: usb@a600000 {
 				phys = <&usb_1_hsphy>,
 				       <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
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

