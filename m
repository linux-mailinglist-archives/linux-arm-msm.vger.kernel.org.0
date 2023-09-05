Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EADF792DAD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Sep 2023 20:48:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231886AbjIESsz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Sep 2023 14:48:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236990AbjIESsy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Sep 2023 14:48:54 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4FEAEA
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Sep 2023 11:48:28 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-52a49a42353so4179837a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Sep 2023 11:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693939626; x=1694544426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eDCWmN0mPD6hCatLBKjMrDlxIVWIUgJK7MJJd+ho5Vc=;
        b=U35sfAXLI8FQkdrHXfdBh/P0ZOzNiavlvgJIQRYcTtAlFecni5DNo7iKoorl2KHwmx
         jC4aOCaB8hJKrZhSDRgIGxpe1jKRSFEAr3cacGZjZIS9QnR6k3ucyzJkZUI5sc1uuVlU
         ZoZrbk15LYirxQt73UacuyMa0nsQ3Yj6W/e6cJntMoDLfB8ZSlkAHrcQh7xwdpzxJaUT
         Mj+2kfAwfy+niR8GT9+OkHqrTZrXE+qHjqwJbVzhU/h2BfYREN7+68qCasWTW+ujbWZj
         iARU5n7pICMErb5F4f2o0dUHJKhsuHS4ZVOlKWQGLKuvcB9knmWet+0N4HK/KzpOf2Xv
         CK9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693939626; x=1694544426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eDCWmN0mPD6hCatLBKjMrDlxIVWIUgJK7MJJd+ho5Vc=;
        b=DGBfOSiC+ZX+0t9oNSxG4g8DJep7lXcAJMECK3+ZdQNtYBNUcOH5JC66p4FSKokmsb
         3+pKhYR4dWcIMJDLF0TXHabxPEC521sa4tkzxRUHjNiQHYRXn5vBRIwoW1EEOKKNwkwv
         Y2pIaguzSWHUUvK24g7KGQ0Nsu1FTdTg5SD4MQQ2i3tUUrsgwiruFtZYH8Of18EEoFeD
         MWdEsen4/cS1QDnQQPRvgChU3o9hSHVPHhxTu/TKMzxLFh2l40sIYIMAopcODxzmcn+/
         S7oRmcmBd2UMCgbYZ357SCMhxC04DwfMhzC45iwnz6noH2X82atbmB3nrrC77cgt1caV
         h6XQ==
X-Gm-Message-State: AOJu0Yy9ILC00f501MbitB+fpLzOqxt+JhXcNKJUbFKVTxpRBpygO2rP
        XH4Pn4pZ953ppBsLQ81oNtfWZWKXk+yFMBLWr5w=
X-Google-Smtp-Source: AGHT+IHP6OBBOhp2XqNXHnK7pnzjbPCbx0swl8k5IRAOAeEg9BeQC0c2Z0DhbmOKSgrSC4rz+j6yMQ==
X-Received: by 2002:a17:907:2cd8:b0:9a2:2635:dab6 with SMTP id hg24-20020a1709072cd800b009a22635dab6mr235384ejc.47.1693930781780;
        Tue, 05 Sep 2023 09:19:41 -0700 (PDT)
Received: from krzk-bin.. (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id v26-20020a170906489a00b0099cc36c4681sm7743165ejq.157.2023.09.05.09.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 09:19:41 -0700 (PDT)
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
Subject: [PATCH 12/12] arm64: dts: qcom: sm4250-billie2: correct UFS pad supply
Date:   Tue,  5 Sep 2023 18:19:20 +0200
Message-Id: <20230905161920.252013-13-krzysztof.kozlowski@linaro.org>
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

  sm4250-oneplus-billie2.dtb: phy@4807000: 'vddp-ref-clk-supply' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts b/arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts
index 75951fd439df..2c7a12983dae 100644
--- a/arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts
+++ b/arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts
@@ -225,13 +225,13 @@ &ufs_mem_hc {
 	vcc-max-microamp = <600000>;
 	vccq2-supply = <&vreg_l11a>;
 	vccq2-max-microamp = <600000>;
+	vdd-hba-supply = <&vreg_l18a>;
 	status = "okay";
 };
 
 &ufs_mem_phy {
 	vdda-phy-supply = <&vreg_l4a>;
 	vdda-pll-supply = <&vreg_l12a>;
-	vddp-ref-clk-supply = <&vreg_l18a>;
 	status = "okay";
 };
 
-- 
2.34.1

