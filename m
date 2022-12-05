Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C31464386F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Dec 2022 23:52:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232118AbiLEWwr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 17:52:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230450AbiLEWwp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 17:52:45 -0500
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8E9C658B;
        Mon,  5 Dec 2022 14:52:44 -0800 (PST)
Received: by mail-il1-x133.google.com with SMTP id s16so5780293iln.4;
        Mon, 05 Dec 2022 14:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oj8eAjDnDlvWoM48S+3smPWtkFQiM0Ns+EyA+iPBhQs=;
        b=kuFiWen/FsqQNEH1nCOmmeVPeYR1IBswq0Q/IvB9aMDpSurNFfES9zJFk7DXNQJ8zy
         V5uASHczcHPB2u1GEmtH7Hie5qmVPNTDxvMHPR66TfP7NhJ57FVka4lHoilNFGKHbrnQ
         D20qHOVq/04qhrjBZw6z6dqCDHS7cmb36CRCZNB/kmuIEJGkLPpG0mMIsceZnmQKV3Is
         hucNqyJ2XQYOwcZIoALG33cLRq71eLceoiWErtnvls/KZwOYasODVlkE6/YoQse3U6P1
         Vi8X8Bq3nX2JUAD5pqsS8XLXN8/g+mbAhNzSivFvFaDn3mTSbXz49jRRfr4iBWQmKMf0
         Xhhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oj8eAjDnDlvWoM48S+3smPWtkFQiM0Ns+EyA+iPBhQs=;
        b=i4aolK/zDb2yYX6LWG9cR+stjpHQ4whMMAHrPPCFRkM/nENqPhbZPGofEbnkIc/m4V
         tdRJvKEMCnC0i8M9fETStBjYLlwAbqUSI9GjoVGHHn9mUI8ttohlFxbs+oDSFqBT8OFI
         3+hZrowNooznyJ9MX6m2O9h2auJJZGGcXxWvT6/IVUepiSdKbXE7zyfK5QAkqHVwIog8
         SopMcaMfAB4dshQKW25iqBEHtq+NAWJMs/gSfX2OHT4u59CkXeFzq5sIzB2SR/gJmmx9
         jYZepDecslkXsGE6ZrroLiy6iAcy3ltoqXeTQ1G4Rpelv7vsmlgbwpmN1aC4vxgasiwr
         rX0w==
X-Gm-Message-State: ANoB5plD/lqTrayBMVUip0zO+akHbAD6DYNXkU/i45b3LLd1LIBfyef7
        HivNz8arF/IECdwc8k7Tum8=
X-Google-Smtp-Source: AA0mqf7hl5FsVq7DmxyQMxcmuOzW6Z6FjoGzAi8MEbNVKGdgV4eLlvGromT96YCpf5hvr5rVImrU/Q==
X-Received: by 2002:a05:6e02:194b:b0:303:387f:2ac0 with SMTP id x11-20020a056e02194b00b00303387f2ac0mr8960078ilu.122.1670280764233;
        Mon, 05 Dec 2022 14:52:44 -0800 (PST)
Received: from localhost ([2607:fea8:a2df:3d00::be63])
        by smtp.gmail.com with ESMTPSA id y6-20020a027306000000b00389d6a02740sm6036104jab.157.2022.12.05.14.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 14:52:43 -0800 (PST)
From:   Richard Acayan <mailingradian@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH] arm64: dts: qcom: sdm670-google-sargo: keep pm660 ldo8 on
Date:   Mon,  5 Dec 2022 17:52:37 -0500
Message-Id: <20221205225237.200564-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.38.1
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

According to the downstream device tree, the regulator that powers the
I/O for eMMC should not be turned off. Keep it always on just in case
the eMMC driver fails and doesn't enable it, or unloads and disables it.

Fixes: 07c8ded6e373 ("arm64: dts: qcom: add sdm670 and pixel 3a device trees")
Link: https://android.googlesource.com/kernel/msm/+/9ed6ddbe955d3b84d1416a1cf77e83904d1e8421/arch/arm64/boot/dts/google/sdm670-bonito-common.dtsi#105
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
index cf2ae540db12..e3e61b9d1b9d 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
@@ -256,6 +256,7 @@ vreg_l8a_1p8: ldo8 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-enable-ramp-delay = <250>;
+			regulator-always-on;
 		};
 
 		vreg_l9a_1p8: ldo9 {
-- 
2.38.1

