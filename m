Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7444E58E5D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Aug 2022 05:55:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230396AbiHJDyj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Aug 2022 23:54:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230366AbiHJDyb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Aug 2022 23:54:31 -0400
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 981B767147
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Aug 2022 20:54:30 -0700 (PDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-10e615a36b0so16460787fac.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Aug 2022 20:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=iRmS9eiX84T3Eljq6nFBiYGemoOHkrIHDqMiXTc5WkY=;
        b=i76f7LSTmC2x3191zfAwPlIX3DHmSK1SSpHrmfuk0aveIhp3EAf0a8rat4UNfyrZNm
         dsyiLOQPGQlck0KIqOtoUe/FludXJXUb9g0ZumMbSH4JqkIAKzSBEp7Qtts0qxHQd6zu
         Jl8l/R48RpgDh3CM8/Db0wBa8B23u4/MGJ3a1E0ZBGZ00gG6D9CAtJDl8457yXdfEywm
         IwPWZcJgP3W0ahtlfXKufJoGAthkRpzuUxPmnkqy6CsaU9CdBLSMJ5TbM9ajQq7Iy9RW
         qLz93HOvWNlFK6y2Od5Mq7i5UaPj3ue/Z+vz+vROY5nod5rPXQvT/7+Gb8WT8+Xs2aUy
         FYEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=iRmS9eiX84T3Eljq6nFBiYGemoOHkrIHDqMiXTc5WkY=;
        b=txFok8emLuRvpsxWnL46g75MFrsR+492zpNH2pcZ1o9cVMz1uijYk36sqfWe/mNk8e
         5VK5SbOK/5p7Xvk2CbSawinjTzpO2RjkwwuLIeHAOY6B0d2kStHK0aYhxHlY/XvmvA5K
         pJylYY0iqrfHt2waot24Oq+FhEloj3q3oQd5zQ0CUe61BfDJsculVAD7Bo6DLgO97foF
         LCwhikdHVz8Ht1Q0+rMwPcKf1bduwA3ujHh6ghmDBg3q+odXxsu2ziGrr11UzDXwkgCO
         cSnm4/I3MVvKWhuggvYXTht0NyecFUq/qXdNbd6UDiz278BBolYDqH3Vs7+3/u9hqumB
         sCHQ==
X-Gm-Message-State: ACgBeo25Wxpis+UWgZ/SzqmHM/+2AY768GM3kvG2/b4Ua6+pCRRbWkGq
        FWJ43M2qb5qenvr5Tqte5WiluRMsDb9Vhw==
X-Google-Smtp-Source: AA6agR6ybtnb3nnuOWfKEttcZflNL02RQ1P+Cg6d/WG7ASEGFg1dOw5IGpBPhZlMHsc0WXBNI1DKKQ==
X-Received: by 2002:a05:6871:411:b0:10e:a23c:65b6 with SMTP id d17-20020a056871041100b0010ea23c65b6mr626373oag.93.1660103669926;
        Tue, 09 Aug 2022 20:54:29 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r13-20020a056871088d00b000f5f4ad194bsm3569732oaq.25.2022.08.09.20.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 20:54:29 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] arm64: dts: qcom: c630: Add DisplayPort controller
Date:   Tue,  9 Aug 2022 22:54:24 -0500
Message-Id: <20220810035424.2796777-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220810035424.2796777-1-bjorn.andersson@linaro.org>
References: <20220810035424.2796777-1-bjorn.andersson@linaro.org>
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

Add and enable the DisplayPort controller found in the Lenovo Yoga C630
and wire this up to the Embedded Controller for HPD notifications.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 1b9b36faea27..0e4d086cd64e 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -377,6 +377,17 @@ connector@1 {
 			reg = <1>;
 			power-role = "source";
 			data-role = "host";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@1 {
+					reg = <1>;
+					lenovo_ec_dp_in: endpoint {
+						remote-endpoint = <&mdss_dp_out>;
+					};
+				};
+			};
 		};
 	};
 };
@@ -500,6 +511,20 @@ &mdss {
 	status = "okay";
 };
 
+&mdss_dp {
+	status = "okay";
+	data-lanes = <0 1>;
+
+	ports {
+		port@1 {
+			reg = <1>;
+			mdss_dp_out: endpoint {
+				remote-endpoint = <&lenovo_ec_dp_in>;
+			};
+		};
+	};
+};
+
 &mss_pil {
 	status = "okay";
 	firmware-name = "qcom/LENOVO/81JL/qcdsp1v2850.mbn", "qcom/LENOVO/81JL/qcdsp2850.mbn";
-- 
2.37.1

