Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28F44792CBF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Sep 2023 19:52:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233514AbjIERwY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Sep 2023 13:52:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238422AbjIERwR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Sep 2023 13:52:17 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD7952DFA5
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Sep 2023 10:38:01 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-401c90ed2ecso27988545e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Sep 2023 10:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693935393; x=1694540193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wa8S3640iWUkpmAXcApvED+QJgBuG0siUdi8y84+QOg=;
        b=ZhRf9PDROxcdF/zM+n5q6PpL1XWbBMZDIDMKLfdRnnj9pkgz/80wpDrpqUb4nUp+XC
         8lecCpnrftXmH1U5d5QzApQKtlg1HdJ0x7nbGECOob5sXKJrdtAc5zL5+HIgTOa/z7tr
         VZqdMUWZNJT3JDiBNp/g3HpCQhmmGhdBXmxe7yw4jIChNhNrdpZ2B0xP4TS2jku3mqfh
         eoLOASv9uNY3kHLL60AxhVinZIh8HTmUYe6AEJzTeuOLAMfrFfOUKKOZgIm1WQgYRYzb
         qNl+SCooFiRbeTEAlj6SzCu/dS6fdNFjv51nAbNL01LxX6gKtMa+70Ps6RqLj63JbIJE
         c05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693935393; x=1694540193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wa8S3640iWUkpmAXcApvED+QJgBuG0siUdi8y84+QOg=;
        b=OR8fHOZgzXstCeUzFwXYRHmgTji/5+XNljapr1I44cRE2ggk0mzL0l9BnKabgXvi+k
         Qb0+tK5NPAvmSg2ldCrtWU4cPuaTX9afzl1veBXnXCRH0/HOTE1mEw8CA0K4JH3DVFqd
         WHij6oSG0RCo89sc5BnVg//YEYax46RrpXUW8md0eivyEEqJDgaiTfS1vo047BYNNdXe
         ZU4bx5/oPdqkcAEFwUfcwCzD89jsNShHH7sGmkJVW4MZgxm2QfVxxs973a7DFEuvvF7X
         cJOMz8hsBYuqH1VgY/QJUAIWi0gZHmA4zJ0VC70Az4Bh25XY2j69/q9dty2yw8siiu0l
         gaLg==
X-Gm-Message-State: AOJu0Yz27ZSqwe7q+6w2xWKFfes0tfMlZxnSOLEh8ikBXr0uSjW1dlWt
        q2LQysFYOeLehoGKEuGkkYigARtWV85nPyMIHgA=
X-Google-Smtp-Source: AGHT+IESfv2tKGY9sWI6xhuBrGlNmksCn2wXFYAMdyLFWK3lMFwDIQDIPWPCxfg7uX/4mXrqjrYqBA==
X-Received: by 2002:a17:906:18aa:b0:9a1:d087:e0bf with SMTP id c10-20020a17090618aa00b009a1d087e0bfmr237260ejf.43.1693930780565;
        Tue, 05 Sep 2023 09:19:40 -0700 (PDT)
Received: from krzk-bin.. (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id v26-20020a170906489a00b0099cc36c4681sm7743165ejq.157.2023.09.05.09.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 09:19:40 -0700 (PDT)
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
Subject: [PATCH 11/12] arm64: dts: qcom: msm8998-sagit: correct UFS pad supply
Date:   Tue,  5 Sep 2023 18:19:19 +0200
Message-Id: <20230905161920.252013-12-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230905161920.252013-1-krzysztof.kozlowski@linaro.org>
References: <20230905161920.252013-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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

  msm8998-xiaomi-sagit.dtb: phy@1da7000: 'vddp-ref-clk-supply' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts b/arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts
index 437b30cc8bdc..0cac06f25a77 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts
+++ b/arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts
@@ -667,6 +667,7 @@ &ufshc {
 	vcc-supply = <&vreg_l20a_2p95>;
 	vccq-supply = <&vreg_l26a_1p2>;
 	vccq2-supply = <&vreg_s4a_1p8>;
+	vdd-hba-supply = <&vreg_l26a_1p2>;
 	vcc-max-microamp = <750000>;
 	vccq-max-microamp = <560000>;
 	vccq2-max-microamp = <750000>;
@@ -676,7 +677,6 @@ &ufshc {
 &ufsphy {
 	vdda-phy-supply = <&vreg_l1a_0p875>;
 	vdda-pll-supply = <&vreg_l2a_1p2>;
-	vddp-ref-clk-supply = <&vreg_l26a_1p2>;
 	status = "okay";
 };
 
-- 
2.34.1

