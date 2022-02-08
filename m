Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA77F4AD03F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Feb 2022 05:16:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346829AbiBHEQN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Feb 2022 23:16:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346775AbiBHEQL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Feb 2022 23:16:11 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52801C0401EE
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Feb 2022 20:16:09 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id x193so19436896oix.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Feb 2022 20:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xlF31uWDKkUWKU7M7nwupRIZm+leoMsZ2bZGat9Ac10=;
        b=M1ZZSewWQ0e4/EOHTZbm052rfxsrwvR/6tryH2qvZpDOWxa/Rc8VgNxHS/04ryq+kU
         dEtRvwCxoy9V7ic9NaYPzjEQtKaSVmUFea7CL4VSSY/QOeuyTQFo4Uu820ZsJlY16KfH
         IAE16VJ9fOQ6guIjoGxrlea8S1sy9yngTLljD1THq2Q/ffnJ8NIhw7a/ZlgjF9/fjxau
         7eXTK0oLNkwgJA28XgXU0S9mwrmfA+reUZrVsRt+FIkeL85/F81AnEeFVFZQdUm77+Cc
         faS9UEUx0Fr5FeR4lJZPMNiztH9Pk4e4ucv0u5KZuZOZ2VN/qEcycDB6BvLX/27t+hZk
         creg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xlF31uWDKkUWKU7M7nwupRIZm+leoMsZ2bZGat9Ac10=;
        b=3RK7LEBk4Yr5Aurz+BVjEWgXZeiFsm8/TuelBujNn2ozvu5EC4OJd6Jv1VxFXg2Ear
         1wEUyDNSa+AUk/iANaWPpsHcAqLkfL1aBfc8jh8Y4DMXQIFFCGX7uRoq9SJIk5F/cZQb
         A3J1SVIaVZr34h8Gm2/wlLA+AZ+MgYGTqUL9GrK51/x1Q4oSDjHZw+dWAU53kqqn/uAE
         TTfPIee+whY7orhSu0uoKF4zrtfr54GtvqqNLNTdKA/ddViICrJ6iUAm7jhbBZfOxd34
         kMaa+Xqq+V+aWZW472zn2IUapB3zGJdcwS4exKXnWT2kEq0tVUekq0bax4tKEgEcvpF2
         NawQ==
X-Gm-Message-State: AOAM532VF57vfGcV60u3Igu+moTJRA3j3pY6Vf+biMNgRsc1sC/R1Hpk
        5HUL5FXYTc38+iaCFtG/PChMvw==
X-Google-Smtp-Source: ABdhPJwF9qF7O277ASabbS4tlDo+NLc9zi4x9bJxDc19uGMygj7LCUsT6CW/rBgN9sWWC4uuOds5rg==
X-Received: by 2002:aca:f03:: with SMTP id 3mr951952oip.102.1644293768685;
        Mon, 07 Feb 2022 20:16:08 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id u3sm5009970oie.30.2022.02.07.20.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 20:16:08 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Steev Klimaszewski <steev@kali.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: c630: Move panel to aux-bus
Date:   Mon,  7 Feb 2022 22:16:06 -0600
Message-Id: <20220208041606.144039-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220208041606.144039-1-bjorn.andersson@linaro.org>
References: <20220208041606.144039-1-bjorn.andersson@linaro.org>
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

With the newly introduced aux-bus under the TI SN65DSI86 the panel
node should be described as a child instead of a standalone node, move
it there.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 27 +++++++++----------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 55fb7302245b..fd1261901ab5 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -56,20 +56,6 @@ mode {
 		};
 	};
 
-	panel {
-		compatible = "boe,nv133fhm-n61";
-		no-hpd;
-		backlight = <&backlight>;
-
-		ports {
-			port {
-				panel_in_edp: endpoint {
-					remote-endpoint = <&sn65dsi86_out>;
-				};
-			};
-		};
-	};
-
 	/* Reserved memory changes for IPA */
 	reserved-memory {
 		wlan_msa_mem: memory@8c400000 {
@@ -446,6 +432,19 @@ sn65dsi86_out: endpoint {
 				};
 			};
 		};
+
+		aux-bus {
+			panel: panel {
+				compatible = "boe,nv133fhm-n61";
+				backlight = <&backlight>;
+
+				port {
+					panel_in_edp: endpoint {
+						remote-endpoint = <&sn65dsi86_out>;
+					};
+				};
+			};
+		};
 	};
 };
 
-- 
2.32.0

