Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A53FD69217F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Feb 2023 16:03:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232641AbjBJPC5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 10:02:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231904AbjBJPCb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 10:02:31 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41EF274980
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 07:02:21 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so6496436wma.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 07:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jnVE5oHbrNCa61uue3my5vlToN3MnGtsH6Z1KRFTiTw=;
        b=Z/K4ZF2GjwPLZb51+22DhqgGlZ3RmB0BVmHYvcix1/BtQbMoryWWuifC0yC6Ks70EG
         CvYdWPeLQsGeNrmbKyWXlnzX3Na+yCwsfrYsjlg6yYoV1+a2Xbk5Llh49L94w4Ym5LmR
         zNTt0KJrZxJfKb8fLkj9coybnIIt1BivqZsx3BcnHG6YJoQ+cnPROaz4rJvl/msKZ1tW
         erCdHNRXdRMVCLdHD4+1SYpNyBZ7WbDkHnYFCDVTeOg9yYa4PhopvR19l9tG+4CLRZpH
         9JyZrUzeJ5G9X2Tns4HuQjzaE0ufS+v9Cf/dzTsp+DR3/Zx4+xCkjOOJF22eUi3UsBT0
         gKtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jnVE5oHbrNCa61uue3my5vlToN3MnGtsH6Z1KRFTiTw=;
        b=k9ia4MmBij95IEwYGjaGgYu8FR6kz9F3KdLSS+OpN8POe9/U5a6JpaS+0hYyU5ALaw
         3/4yA73r+mLhBb+gU+j1VLIP1BSTGCXslIYvj05t+jKzVxH+h8tlgWr6XROtOcjfwrmB
         m8jFPHvS0uxiStu8E9vtIe70i+Yr1KWCorKn0BqpWeIDEa/cjJb4RCiSOzRKdNgWDK/T
         91tXTVxGY3JsCtmNqGwyL4NKYCwBDGPmmeC0ATsKmS8AuhoSGmD7vE8XHxnfa+fBmsH3
         RrsqBa7wGdQJnUmS+wKDniOcV+7HVE1aQGPBmZF6rJzfYXxqEASnhrFgtARP9eb82IpE
         ek1Q==
X-Gm-Message-State: AO0yUKUwckh84uzOkEfOVuuvbwt+nTIVrRdpX3q0foyw3moGTD9yxq3a
        5nx9aNQNtjA2W+FGNxjSbH184w==
X-Google-Smtp-Source: AK7set/xG1seqqzr8/s4zqmsCD3kya6SXKvVpYp1JRp5VPbK8Rp0raL8fyOGxQs94Wl2ZK2HRdgVQw==
X-Received: by 2002:a05:600c:18a6:b0:3d3:4f56:62e1 with SMTP id x38-20020a05600c18a600b003d34f5662e1mr13260585wmp.27.1676041339821;
        Fri, 10 Feb 2023 07:02:19 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id w23-20020a1cf617000000b003db1d9553e7sm8282482wmc.32.2023.02.10.07.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 07:02:19 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 10 Feb 2023 16:02:12 +0100
Subject: [PATCH v2 09/11] arm64: dts: qcom: sm8450-hdk: add pmic glink node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230130-topic-sm8450-upstream-pmic-glink-v2-9-71fea256474f@linaro.org>
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

Add the pmic glink node linked with the DWC3 USB controller
switched to OTG mode and tagged with usb-role-switch.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 45 ++++++++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index feef3837e4cd..1755ee3aa04c 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -87,6 +87,40 @@ lt9611_3v3: lt9611-3v3-regulator {
 		enable-active-high;
 	};
 
+	pmic-glink {
+		compatible = "qcom,sm8450-pmic-glink", "qcom,pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_ss>;
+					};
+				};
+			};
+		};
+	};
+
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
@@ -724,7 +758,16 @@ &usb_1 {
 };
 
 &usb_1_dwc3 {
-	dr_mode = "peripheral";
+	dr_mode = "otg";
+	usb-role-switch;
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
+&usb_1_dwc3_ss {
+	remote-endpoint = <&pmic_glink_ss_in>;
 };
 
 &usb_1_hsphy {

-- 
2.34.1

