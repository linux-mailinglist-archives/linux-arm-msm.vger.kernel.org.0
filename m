Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A292792B01
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Sep 2023 19:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235714AbjIEQqI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Sep 2023 12:46:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356335AbjIEQcX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Sep 2023 12:32:23 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E1A46A6E
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Sep 2023 09:30:58 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2bd3f629c76so45145301fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Sep 2023 09:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693931368; x=1694536168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RGaxUhsaWm/cp+r2DPolOLK8u8MC47KqNdL9YaScpsw=;
        b=t7Pw/LKCmwb+3Du4Y7aPpNOC6IdzUwMWSPAA2m4+c06MY8hk/KedQjk8UDKV3R0noC
         wqqsEDS8IZjyV8w66/o6yaaAR+7IKbZWjr+RZhELWi6kW4Q9xA3gMCdhz3UvvQhMs/7l
         K4kuWMMzU6CGPOB0i9UgUt52oxsMyo/0iAbZ6Nch8rS06bLNt6iLTtCNj/UhwAxrWC2k
         S0mrkNPYRwFJChvji/p+DP8qcrRDRBfjlmzf7ULxPwRntfoqxx9WaR3hdO9eFQwyCvgc
         6+QEtzlu+fB6Z1Edr1DKzf6h1Oj/R9aC8fTE3cdZbG/SQO1iZTA2V4oANgxCB7/tigKT
         7xhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693931368; x=1694536168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RGaxUhsaWm/cp+r2DPolOLK8u8MC47KqNdL9YaScpsw=;
        b=AjLRKEd04/s+B2Y7a3p4UMfWn++XBq+KxuIDfoWXuye9RKdjWxbmhBYmp/y5+vdQ6g
         b4dv3CFY4WwhlMFy4EraQDNFiqpcxg0cDLHK96k0ivUX4CIpp3MuLIoHdgH/Cr4nHDdR
         SqViOgjHZIGmqfQheB60jVVeYqafhTBgdm51VLEZb7K3dh9ovO4qz4BDG039+mUheOqp
         p1rvZYLbWTW72Q1OG0KCgB01ucspQ9bih7a3VUob9GaizlLo5XpQSx34B9qMwShU5xjO
         tXjgdnFqSbql5O5PhsbmpUKrbSvArCFfwzwI6PY8DmV0m9dwggvc/XyrGjtFmHJiAwK1
         fXHA==
X-Gm-Message-State: AOJu0Yw1oCSaxza9dsnAfpoM3VFTyKejN4JkGM19rN9AzJvPCbiP04Qs
        xN5JYW6Fu7S8PF5nNXO9Ili+ij51KYigmg/SjCo=
X-Google-Smtp-Source: AGHT+IEp1DTEiq7Z2Jiw52W4zhnCePvt/4EW1RpyNiAdy2vPAMIQNgxfwDn0BPDatgDGfl5TO898Pg==
X-Received: by 2002:a17:906:20d0:b0:9a5:b8c1:2ce1 with SMTP id c16-20020a17090620d000b009a5b8c12ce1mr242650ejc.31.1693930772320;
        Tue, 05 Sep 2023 09:19:32 -0700 (PDT)
Received: from krzk-bin.. (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id v26-20020a170906489a00b0099cc36c4681sm7743165ejq.157.2023.09.05.09.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 09:19:31 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 04/12] arm64: dts: qcom: sm6115p-j606f: correct UFS pad supply
Date:   Tue,  5 Sep 2023 18:19:12 +0200
Message-Id: <20230905161920.252013-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230905161920.252013-1-krzysztof.kozlowski@linaro.org>
References: <20230905161920.252013-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm UFS phy switched from dedicated driver to QMP phy driver.
Eventually the old driver was removed in commit 02dca8c981b5 ("phy:
qcom: remove ufs qmp phy driver").  The original driver and its binding
used vddp-ref-clk regulator supply, but the new one did not and left the
supply unused.

The Qualcomm UFS phy bindings were also migrated to newer ones and
dropped support for vddp-ref-clk regulator in commit dc5cb63592bd
("dt-bindings: phy: migrate QMP UFS PHY bindings to
qcom,sc8280xp-qmp-ufs-phy.yaml").

It turns out that this regulator, although with inaccurate name
vddp-ref-clk, is actually needed to provide supply for VDD_PX10 (or
similar, depending on the SoC) used by UFS controller.

Bring back handling of this supply by using more appropriate regulator -
UFS controller host supply.  This also fixes dtbs_check warning:

  sm6115p-lenovo-j606f.dtb: phy@4807000: 'vddp-ref-clk-supply' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts b/arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts
index c2d15fc6c96b..54da053a8042 100644
--- a/arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts
+++ b/arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts
@@ -344,13 +344,13 @@ &ufs_mem_hc {
 	vcc-max-microamp = <600000>;
 	vccq2-supply = <&pm6125_l11>;
 	vccq2-max-microamp = <600000>;
+	vdd-hba-supply = <&pm6125_l18>;
 	status = "okay";
 };
 
 &ufs_mem_phy {
 	vdda-phy-supply = <&pm6125_l4>;
 	vdda-pll-supply = <&pm6125_l12>;
-	vddp-ref-clk-supply = <&pm6125_l18>;
 	status = "okay";
 };
 
-- 
2.34.1

