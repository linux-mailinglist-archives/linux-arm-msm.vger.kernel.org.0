Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B12F06DDCC2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Apr 2023 15:49:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230458AbjDKNt1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Apr 2023 09:49:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230401AbjDKNtZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Apr 2023 09:49:25 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 139BC2736
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 06:49:24 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id z8so12308705lfb.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 06:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681220963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uHtWgJFHIhaJVA6LiMJBMJU0hICshc5Lm8ByCpWkf/w=;
        b=KTJSSGL0yuAsLkW0Ws8NUpXCYKloY0mQEaB9RREuwahxQ72lqe2vz2ZgsA4rN2PDCi
         U3EdyCjvIApkBpmw/N6jiPlbQN3vlPbj+cOHBWRLwDfVTlaMIgCQzT02Ou23ulJ/E2s6
         WCEhVNbO/4n6xEE5D+PtHlCaVwkiErKQ/HfTs6F0ze/tpwzQG6jXG4cW40WDxQmKgMWK
         4g+kt8TpB45+HnkbMBLolAp3n3GNlVI5tvYdx8XIpMG3tCu2pcUP/87UTnZK7EEun+Ck
         UUvcofYFie8GlkisWxghfczBwgxtSK4xr+55NCftBZ/vPt33SQ3Jh/0FqqVcA42J5wxB
         mV6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681220963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uHtWgJFHIhaJVA6LiMJBMJU0hICshc5Lm8ByCpWkf/w=;
        b=GI8KmMeoqAcIxOlI1l4jnjtUQ6UyprkEx2kqaZLJ5rf7poWGCaeTctAFh/vp86g+nF
         iypjaidieCyREbPwlFViZMEdzJ+8iz9RiH/6k6A8Hzz20Iqvnj/JpFc0O+MgsQgOQ4x4
         yL9t3XsNZ1rdmub7s9aGD2M20hiuGjj9IVnPbZhAmR7DaVDLvisg1qz1TM5dMTvuzmxD
         Z5Us2G0/1iSCItT3kaxglxJ6MHUwn9mUVws9cEHztr+xdKGEouEsbCrPj+eVeSHFE6Kb
         +/nM+uzqZW5lunAlSFQJ06KnhHyq9+gJw0FQ98i/pbQxVRayNGWQheIv3Kh2VKtlmnbI
         kNWw==
X-Gm-Message-State: AAQBX9fjb9yojKZbOL3AYLLCx4ZTk6OP25mXaRmDznt0mvMdPoYaOwbt
        SiJbf9mpR7UPYTgEJDSTYZdAjA==
X-Google-Smtp-Source: AKy350a1PFzOwUfLsdcxQQ1pdCVrf7WhWBjcq5r1wi0ojAgjZbb9DJfubVyraaH/otwwY4xiVBUUow==
X-Received: by 2002:ac2:4c81:0:b0:4e9:6097:add3 with SMTP id d1-20020ac24c81000000b004e96097add3mr4731332lfl.61.1681220963648;
        Tue, 11 Apr 2023 06:49:23 -0700 (PDT)
Received: from [192.168.1.101] (abxj23.neoplus.adsl.tpnet.pl. [83.9.3.23])
        by smtp.gmail.com with ESMTPSA id y9-20020ac255a9000000b004eb2d6160a4sm2563707lfg.32.2023.04.11.06.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 06:49:23 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 11 Apr 2023 15:49:18 +0200
Subject: [PATCH 4/4] arm64: dts: qcom: sm8150-kumano: Enable SDHCI2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230315-topic-kumano_dts0-v1-4-f1852c2a2378@linaro.org>
References: <20230315-topic-kumano_dts0-v1-0-f1852c2a2378@linaro.org>
In-Reply-To: <20230315-topic-kumano_dts0-v1-0-f1852c2a2378@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681220957; l=921;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=gxjJ6YGpLan1OIOLNTh/xyzJg8bMee6dGyJiV+tpg98=;
 b=rqX9idewh+MKrObT4whA4e2QmK0L5hgfn542WlrlHCE88WamDPMQBItmcIGikS3F7gpmkSdLyX50
 oVjpPCV7A6mwC5Lc5Ol9Mj6CSzoRXfRHakxaTIelrmZ2GCNGbOuo
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Konrad Dybcio <konrad.dybcio@somainline.org>

Set up and enable SDHCI2 to enable the microSD slot on Kumano
devices.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi b/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi
index 5fa0a83a4b2c..9dca22cf3eb6 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi
@@ -618,6 +618,17 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
+&sdhc_2 {
+	vmmc-supply = <&vreg_l9c_2p9>;
+	vqmmc-supply = <&vreg_l6c_2p9>;
+	cd-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	bus-width = <4>;
+	no-sdio;
+	no-emmc;
+
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <126 4>;
 	gpio-line-names = "NFC_ESE_SPI_MISO", /* GPIO_0 */

-- 
2.40.0

