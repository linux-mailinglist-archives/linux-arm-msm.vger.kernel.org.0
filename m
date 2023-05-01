Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A605C6F30BF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 14:11:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232525AbjEAMLg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 08:11:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232520AbjEAMLf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 08:11:35 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EF6E198D
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 May 2023 05:11:30 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3f1950f5676so25386725e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 May 2023 05:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682943088; x=1685535088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=alQZN3EBOW0pmYM8axyV13mxnQjhJkefKx7+ma8G4AQ=;
        b=CAjzDY5vE4W1DBvJLsk+CzzlY1aQbMfgo7+lZ5DYxRhnjPyqr6t6VeMfOm86rL1Lo/
         yraf40T/Y5NmQXbiGkfWXkecNnY9CYIMi2QfjmlbkhmkD9rRMVADNRtzMnf3SY0esX1T
         IgE9wHtftzMI6gLphXA69TmCWR7m/mWSss7iBwLDrR4CjleAdiO1u5qFusi5k0DCfQr4
         Ox8/3YtxC4p7RkNqxujESKDC7rX0S0un++fThhD5jDGOaCFEWX9x96u9Fu3v8qtRZqGW
         P6w6dinqNMe6Slc8ldhYzL3EAdg9aVKFu0PxFG0L7gWiqyLPLLHCdt6dWRAmY8yw2s5g
         fpMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682943088; x=1685535088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=alQZN3EBOW0pmYM8axyV13mxnQjhJkefKx7+ma8G4AQ=;
        b=h+wsQfaS8LbLO3D8R60ieQgzgHpRnFFWx2+u00q2z0C77WqyIOJ9YQPSuQWgf8aT6u
         xA8SL85qM58+XFj8a6fLYmyCR885LxdeJjvvDjDK93n5BZspZZsPbVxNcLO5s+pN+7qk
         qcsknLwE9K6eDeb/MTlYt2NXeNkAPyYvgSJQGhtW+CEOQNurRflcZ53u958cjQDUdd0i
         ciZt+tGTOVLAOrybffAydm8N05Fmf63RYLJXCTl8+UwPY3qtvGhoqzWyzQE7Ft1zY/MT
         t1GMYQDVBdJKMbxosOekjFC468UXOuWK6GBBAF8Y1wr03ilJkGdsELKrnvI472kvDxnh
         Ygkw==
X-Gm-Message-State: AC+VfDw64Iga/CSGzfwdnRXMk6aQAGNp1/I1NjNOYcmeMHwue9gr/haq
        /g4ZYIxe2cqmFLK9lpyKTAuamw==
X-Google-Smtp-Source: ACHHUZ5/dGdrwEK16LrcuW86ms89WofToN2jbDDP72jUijc6w0tMNIzM3MHKdRu/TocJqMceIOyYKw==
X-Received: by 2002:a05:600c:22d0:b0:3f0:7e15:f8fc with SMTP id 16-20020a05600c22d000b003f07e15f8fcmr10197980wmg.14.1682943088454;
        Mon, 01 May 2023 05:11:28 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o10-20020a05600c510a00b003ee443bf0c7sm35856634wms.16.2023.05.01.05.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 05:11:28 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        luca.weiss@fairphone.com, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     caleb.connolly@linaro.org, bryan.odonoghue@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
Subject: [PATCH v6 12/13] arm64: dts: qcom: qrb5165-rb5: Switch on TCPM usb-role-switching for usb_1
Date:   Mon,  1 May 2023 13:11:10 +0100
Message-Id: <20230501121111.1058190-13-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501121111.1058190-1-bryan.odonoghue@linaro.org>
References: <20230501121111.1058190-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Switch on usb-role-switching for usb_1 via TCPM. We need to declare
usb-role-switch in &usb_1 and associate with the remote-endpoint in TCPM
which provides the necessary signal.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 19 ++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8250.dtsi     |  4 ++++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 1e0b6fd59abc9..b5cc45358a474 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -1273,7 +1273,13 @@ &usb_1 {
 };
 
 &usb_1_dwc3 {
-	dr_mode = "peripheral";
+	dr_mode = "otg";
+	usb-role-switch;
+	port {
+		dwc3_role_switch_in: endpoint {
+			remote-endpoint = <&pm8150b_role_switch_out>;
+		};
+	};
 };
 
 &usb_1_hsphy {
@@ -1359,5 +1365,16 @@ connector {
 					 PDO_FIXED_DUAL_ROLE |
 					 PDO_FIXED_USB_COMM |
 					 PDO_FIXED_DATA_SWAP)>;
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				pm8150b_role_switch_out: endpoint {
+					remote-endpoint = <&dwc3_role_switch_in>;
+				};
+			};
+		};
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index af16d3ba76b8e..af988328db6b9 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3740,6 +3740,10 @@ usb_1_dwc3: usb@a600000 {
 				snps,dis_enblslpm_quirk;
 				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
 				phy-names = "usb2-phy", "usb3-phy";
+
+				port {
+					dwc3_role_switch_in: endpoint {};
+				};
 			};
 		};
 
-- 
2.39.2

