Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37AAA644F7A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 00:18:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbiLFXSe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 18:18:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbiLFXSd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 18:18:33 -0500
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 322CBD117;
        Tue,  6 Dec 2022 15:18:32 -0800 (PST)
Received: by mail-io1-xd2e.google.com with SMTP id o189so5126022iof.0;
        Tue, 06 Dec 2022 15:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cre6nZSUVoXSGiGw303piLfAyt0eln7OQe/31K4zAAg=;
        b=XepLHlYR/c1jdAaDsSuKcmUCZ1DfGYZE5u/kVUQwGmFvq87bAaCbBuwDVRDOkQ5weV
         0InV3lB2nv0t0HgsTG5w4j3nWwPoRX1MyZMZT1K2QWFWBOLcXAZchJlWa410L9XNKck1
         gzhwRHgIhQ4QLE7j7zvqYIlrhlM0z5EihPry5uDv4KiUZiSETZ5XN8m8HaIvOGDqnrfJ
         Tg3vruFTvAoLx1rk2CXqqzXAupoVYpRIDbpInHOKqxWV0g8f+2q3Lvsj1V2HwYgX9lLK
         IYMgSAKWK6/qzxOhWZaZpOxa1fwjnO5/CGW/dlaRCTKw7FWAY2CLPWOJCb7duVJYu+vc
         Subw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cre6nZSUVoXSGiGw303piLfAyt0eln7OQe/31K4zAAg=;
        b=g07Lyob2h1qk6UaDAsqGPByBWjaXjhgjm00o4oPuyhBr7WwfTSD37EDxQUFZReQ56D
         9EULLSkaPAo0IFwXbqcjuclUSp/fz3MDGLTc6jaW1DQ6PoDbmX/sVunKiVNS8G9wKLxH
         pSc3ebrkePtGWpI3N3nJJqMPyiylh1bjikX7EwLsqwH3sHAs226uJcq/IQ4pYOUQvsVr
         wCHoZLRy1gczgdzd8P5UqIhEBrgUIGTMs6htQmc/rIAYN3mP++qkPV9Ak1z4iGjjOrdy
         AmZy/3xjlZkTqJ6YKr3PPdQx3PCf90GWXPSg2XoCS/tvdfqhK0XU2sb9xeIfDfdlBGKY
         ukUQ==
X-Gm-Message-State: ANoB5pmWG44a5M6xJpzDM4+F2R+GdbHHar1YJr4qwWPs+6Fu+PC38kmQ
        89OT4Lsa9hkE9Bzbpc2Fetc=
X-Google-Smtp-Source: AA0mqf6qf20kC/mQzJp9+jZEhnO6XuhvTblZf2r9pYJQLyvrlYUduY8BQLG9LLZXhdNZD6aWj8+9QA==
X-Received: by 2002:a6b:3102:0:b0:6bf:e923:388b with SMTP id j2-20020a6b3102000000b006bfe923388bmr42439122ioa.105.1670368711655;
        Tue, 06 Dec 2022 15:18:31 -0800 (PST)
Received: from localhost ([2607:fea8:a2df:3d00::32c2])
        by smtp.gmail.com with ESMTPSA id x27-20020a0566380cbb00b0038a0eff63d0sm6374271jad.155.2022.12.06.15.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 15:18:31 -0800 (PST)
From:   Richard Acayan <mailingradian@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 3/3] arm64: dts: qcom: sdm670: add missing usb hstx nvmem cell
Date:   Tue,  6 Dec 2022 18:17:32 -0500
Message-Id: <20221206231729.164453-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221206231729.164453-1-mailingradian@gmail.com>
References: <20221206231729.164453-1-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This nvmem cell is present on SDM670 as well as SDM845. Add it in SDM670
so there is proper tuning.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
Changes since v1:
 - remove "primary" indicator (SDM670 only has one USB controller)

 arch/arm64/boot/dts/qcom/sdm670.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index c78156e03d93..fcea26ba7fe9 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -736,6 +736,11 @@ qfprom: qfprom@784000 {
 			reg = <0 0x00784000 0 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+
+			qusb2_hstx_trim: hstx-trim@1eb {
+				reg = <0x1eb 0x1>;
+				bits = <1 4>;
+			};
 		};
 
 		sdhc_1: mmc@7c4000 {
@@ -1418,6 +1423,8 @@ usb_1_hsphy: phy@88e2000 {
 
 			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
 
+			nvmem-cells = <&qusb2_hstx_trim>;
+
 			status = "disabled";
 		};
 
-- 
2.38.1

