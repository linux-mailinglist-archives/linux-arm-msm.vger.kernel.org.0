Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87E0A792CDB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Sep 2023 19:56:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238233AbjIER45 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Sep 2023 13:56:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236918AbjIER4e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Sep 2023 13:56:34 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1FBE1576F
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Sep 2023 10:50:10 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-400a087b0bfso27613315e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Sep 2023 10:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693936157; x=1694540957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mMNkXS33DtIakBT8aVq/Dj6pUL81sh6O1LziCE6q1vo=;
        b=mRBnFaJrlLd9mB1phH9qVRbWLCMF1vHap2Q06s/+bjrmt1gK3zkwusPccjjqxFsv1M
         Ic9/BKZu0KSOHNpMBYJlf0A3+8OcGrL3s02gmRNh4dM0qOUdebXCKLpJDUusz7EtAZ8o
         gLfLsqoM5gg1+Zfla/U5k+7obU9VMi8ooj9sDt4a4fPh/WjhBdISwpSaB9lvGHj5DrrL
         CBK0Q+bd5eVtnu6nMpF+vnR0rJuN48AVeS34l3m0lKmCcb2R3C3iF1mmG+zv96Mi6O8n
         ERwWhbE7xVmoEuVrfCNquPfqCMntYwoJygDLIy+X62t3MyDCCIlEpyYqHHSe5GBejuEl
         NPPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693936157; x=1694540957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mMNkXS33DtIakBT8aVq/Dj6pUL81sh6O1LziCE6q1vo=;
        b=X3YjjXuRyViEieMNTMSVClE9/Xcy25cXZDQjSnQ5db/ZqNd7HFoR5AZTveaSzkJVR5
         kcwW6WTLHaD0KUSu1K8HjL7o2T40IpfLlOYDO5VGlznzSni2Z5KEEcJRvNu2Ctt5ygRt
         aY2z0shdac7bhKyl9echHqTDDmzTGbZaZZn4DT54GtDSWKdGxa/iWwVV/V8NP0ko+uvV
         j/PTYBMFx/mul9aIEfjzf1xdcG4epzN0jUmY5vvvbSWgsepqaCLmrQ4zaTjjwcLF6tCk
         4CjnIDJYLq1+5na1pBZYwwldc5aOrYMtwX8JU2QZAMstugGeL/Q37gVhnoE/i/zyg2El
         Gf6g==
X-Gm-Message-State: AOJu0YxqkcVS7w8jZrfEORRXBUmX6a1WNUF6YEsjLaG068iB3PireKcD
        qN+eLY8mXJ4GNvP9zzFq3viJY0niEB/tnEkoFIE=
X-Google-Smtp-Source: AGHT+IGmyLK/Hbbm+7HnS3z13fq4dV4e1JrpqkFp8l1qPK6NmNZOQkho31QqBdTtFI3mKQSlm7zjcw==
X-Received: by 2002:a19:2d55:0:b0:500:94c5:6e06 with SMTP id t21-20020a192d55000000b0050094c56e06mr191521lft.56.1693930774506;
        Tue, 05 Sep 2023 09:19:34 -0700 (PDT)
Received: from krzk-bin.. (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id v26-20020a170906489a00b0099cc36c4681sm7743165ejq.157.2023.09.05.09.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 09:19:34 -0700 (PDT)
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
Subject: [PATCH 06/12] arm64: dts: qcom: msm8996-oneplus: correct UFS pad supply
Date:   Tue,  5 Sep 2023 18:19:14 +0200
Message-Id: <20230905161920.252013-7-krzysztof.kozlowski@linaro.org>
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

  msm8996-oneplus3t.dtb: phy@627000: 'vddp-ref-clk-supply' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
index ec5457508fe6..38035e0db80b 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
@@ -772,7 +772,6 @@ touch_suspend: touch-suspend-state {
 &ufsphy {
 	vdda-phy-supply = <&vreg_l28a_0p925>;
 	vdda-pll-supply = <&vreg_l12a_1p8>;
-	vddp-ref-clk-supply = <&vreg_l25a_1p2>;
 
 	status = "okay";
 };
@@ -781,6 +780,7 @@ &ufshc {
 	vcc-supply = <&vreg_l20a_2p95>;
 	vccq-supply = <&vreg_l25a_1p2>;
 	vccq2-supply = <&vreg_s4a_1p8>;
+	vdd-hba-supply = <&vreg_l25a_1p2>;
 
 	vcc-max-microamp = <600000>;
 	vccq-max-microamp = <450000>;
-- 
2.34.1

