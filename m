Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDBE2734CE0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jun 2023 09:59:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbjFSH7E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 03:59:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbjFSH6r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 03:58:47 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28ED4E77
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 00:58:44 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f8c65020dfso33957615e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 00:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687161522; x=1689753522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hXgCX8dNw6x02jPRHVLJkaCju40zMsClluJj0tjYPUQ=;
        b=goniO1Q5zS6Qc1WMtyGyn/H6GrqFKUSeqHS8qorKEZJ3xuHR7ddVFLAsZAA4eWcR4h
         Q2oTdeYJGGBtQLv5N+8qp/3pmck+H/w6Y1eJdXVqqRITGbK9jeHjXOPiZNSRbZfg33bR
         n6rKmRc13+LT4EFtJMl/O5e7k7FoVjpAPr7wkHl2erypzSbfKCs26tRTUvovoQFiM+c9
         5vLA5HuBjCqxdMlon3rQIrjzLuiPrv/c3DoB+FHH947d5HeJ8OL4hzsugDrV0xH1nA9n
         LZlDdWoSTajTCOkDmkaj+TCKYUs/dADacH94TBLCFNU/wrqBRGMWuPmvcwAUKfrGNCJ5
         Bnmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687161522; x=1689753522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hXgCX8dNw6x02jPRHVLJkaCju40zMsClluJj0tjYPUQ=;
        b=V9QRp+hARVED3AlHS059YedkC3XW+f13Y/eC8sBf/ZEmHjJby+RWFeI9ghbn0GDqyi
         u225t1GPgczuvGpg5iBqZyA/FzxWCQupWteCTmySbIKFOtdUYQC6MLLTT/nmEIuwZXqj
         o16jpigplyA2MWi6KBiY2LMb0k8PB1yQsb6oV3QXc+5otm3fDEWAAmo9pXG9KLp/XhsW
         9X2N9MyhQl/trPllRety/pkuLBoI/ui8gK2ka9j4hcdlvTvy26adFMOedEsZs48OwBP+
         +bWQHpGodmH5bGbMjE5LYI9JuRA3Co+mZ6ZkGiEPJYFlxLJrbDojhTCfDdWtYoKz3BND
         DSrQ==
X-Gm-Message-State: AC+VfDylJ5Oe04+Qlcoq+uD+DDqUmkWgxVfq4a1EQofpdG+uyRYcFXcn
        cX/N8qrXTjb4oc7EUo+mb3G+ig==
X-Google-Smtp-Source: ACHHUZ5bbMpTQUZNWoi72b+2cAS378+3f6948vxdFglsfrrxGzQEE4DuW9tdeMGbzZoTPuStk8qaJA==
X-Received: by 2002:a05:600c:25a:b0:3f6:76e:604b with SMTP id 26-20020a05600c025a00b003f6076e604bmr7993832wmj.0.1687161522536;
        Mon, 19 Jun 2023 00:58:42 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id v5-20020a05600c214500b003f7f87ba116sm7091491wml.19.2023.06.19.00.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 00:58:42 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Mon, 19 Jun 2023 09:58:19 +0200
Subject: [PATCH v4 4/6] arm64: dts: qcom: sm8550: add ports subnodes in
 usb/dp qmpphy node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230601-topic-sm8550-upstream-type-c-v4-4-eb2ae960b8dc@linaro.org>
References: <20230601-topic-sm8550-upstream-type-c-v4-0-eb2ae960b8dc@linaro.org>
In-Reply-To: <20230601-topic-sm8550-upstream-type-c-v4-0-eb2ae960b8dc@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1083;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=YCpe2uXLy9w3nWR5fQNPmqhcnIYVQV3CZ+KVZfbwGls=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkkAqsfY/f1YwkWKHE8b7CB+66jp+kswZcDcUlJYyK
 1Wt7e2KJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJAKrAAKCRB33NvayMhJ0cTTD/
 4s3uWX5fZ1A3rs0bIcfpjPqE7nfAqGs6SHtiGmCJjMMdHek8eDVy38pv4GHb8vQN7TGOr6GB0+ybhm
 t/gkigHPTLTPhA40BMA4ZH3wTEYUZWGIHiZiOQKg+f79wHMsH+U2CvP8MYS6U/62bpqpa8bzH3zPT7
 yIZoZ/hltvxPnDygDGcPYRayX1cJYFyQwcqtK0l+UX4qXo2j8k2sLajUKMVT8bXtmepwKv1+dea/iP
 /3Zi/STQefkJUAlgMudQHjI4x9jBoWcNFmwABHH+wmKBv32nWQgOq7cl1glw/gfCcoRo9SZo1fHIvb
 zo48y/1yNm8wSKt6ZMiPJIGXqzyUMqZC4dSORc4KfTTB9HeFg2OXslBZjZu2GyUDwXldxmQSl7v1/+
 8TzIOxBnSG3XyLa0ML12mSxEa7oME45nUj/NjGrqOY0ZtMhS3B5eazbmCRlbcW0gFrMiRX+1OFu9/P
 bov61F3EwpSvPNWtFk0Lg2O2gV34pwVLws5kFvv0vfOKU561PC17ZBilMfncPLro5ZtraoHSnQ0Ln7
 b6tv5tPtjLtn1MqMpD76zAqnrynQLUSnnaqqG3NcdBhTROTbmH3lDuH/0ZPFd3OKZaRL5Dt0lYAv++
 954bx78QMykVf28zqnG9pFmYlM+BoWjgDJljCjMfRwIHTOfO5qxXHUKHTLOw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the USB3+DP Combo QMP PHY port subnodes in the SM8550 SoC DTSI
to avoid duplication in the devices DTs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 41d60af93692..54636f475306 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2838,6 +2838,32 @@ usb_dp_qmpphy: phy@88e8000 {
 			#phy-cells = <1>;
 
 			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_dp_qmpphy_out: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_dp_qmpphy_usb_ss_in: endpoint {
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					usb_dp_qmpphy_dp_in: endpoint {
+					};
+				};
+			};
 		};
 
 		usb_1: usb@a6f8800 {

-- 
2.34.1

