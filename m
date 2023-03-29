Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8462C6CF362
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Mar 2023 21:43:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230449AbjC2Tmz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Mar 2023 15:42:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229679AbjC2TmY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Mar 2023 15:42:24 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D1AF728C
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 12:41:53 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id y20so21688687lfj.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 12:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680118894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SmZj7yRWUpoMIDfb41CfUAIvoFrZh9+cy87Sw/s82+Y=;
        b=Nb11QpwUy++E8dYGSHuBgO+ILAEDHxRc7rpqNcwI3/pQx5lLhg+RYlA+4Qmelqkjmp
         2Z+Rw9w9jaUVKl/oqG1TSF5g9VIIPDU0FXvAhP+vmtHHClDANcte0nGQquXRa6iw4r9h
         o3Lh4TsEK2iaHSsIl+ajXIlRqPxpWzHPDsRQ7DbbXlCODEwEkF76oYg7VzxWIgX5Y00Z
         TBfI3hSCQEX1yKiuDxpY7EvXqC4lEp74/9W5JtN3T7X8HYc5TE4rAnceAwUlPO5ewExe
         OZ+NqFrJmgiIDFixm8GwMZG8Goa7+ds/25Ut2cDyl7EiXijNY06cPB4Vf2rTOHXrk53W
         1ZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680118894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SmZj7yRWUpoMIDfb41CfUAIvoFrZh9+cy87Sw/s82+Y=;
        b=cp8q2+Ajbp+NBaNhvlMMzLrT9gNswa7oK9vrD4a8CYqVf98rSrrBIYVcIkbkLW7TCA
         R8L5t0ZMlT9kf5RRwQ9xJXHlMDMdoOcePOJqvzEyFWIM361ToF6jnrCnm5Y/n0ivV1az
         qEM9818rscTLhwsiuypiykXHBDBCZcEdBUjYt8P+P1HT7OvkROnOB/Ly8Qw94OdjOrLI
         Vz/9Id2m5S6g3tTVJELtyi2VTF3TT316I6ulnns2UqOKbLsfk+bS8jfu3T4cXHZF7Guc
         p55AOawVYiMhgQduAz/cD1HkKluUsBRjnx441EaNaKfp85+Ec3xfn8tN+aMHy01RxqCg
         C0+Q==
X-Gm-Message-State: AAQBX9dhm7+ZeSBRPAfjzOjrJY1AiqA49WiOORgLqmX+Lv74r1jvLllR
        /VEHvtzQQCJfWT0EC4vLosQGcE9sYiHxhz3jVKI=
X-Google-Smtp-Source: AKy350YNSVVLOixVRhTHlFmu3wo6flHyFyj3FYH0Vsy1y/KwATKlVxMsPBkJDzSneNJn/itc5I2nRg==
X-Received: by 2002:ac2:4c18:0:b0:4eb:79:fa5 with SMTP id t24-20020ac24c18000000b004eb00790fa5mr5826294lfq.25.1680118894216;
        Wed, 29 Mar 2023 12:41:34 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id q22-20020ac25296000000b004eae672e96bsm3955048lfm.255.2023.03.29.12.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 12:41:33 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 29 Mar 2023 21:41:21 +0200
Subject: [PATCH v3 4/6] arm64: dts: qcom: sdm845-tama: Enable remoteprocs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230313-topic-tama_disp-v3-4-2b1567c039d7@linaro.org>
References: <20230313-topic-tama_disp-v3-0-2b1567c039d7@linaro.org>
In-Reply-To: <20230313-topic-tama_disp-v3-0-2b1567c039d7@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680118888; l=1234;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=X0E+A0aZzBt7boyvMtSN98h00zS7k5X737nmRCsRUX0=;
 b=oOdrq3FwwueqeP8njqJ5iWGS/nBG7El8n0pIT4Y0U7L2C5COcRdF6Dk41mXBCtz4AQtAngIXGpLw
 +Foqvp6NBndYfHj3JmH3hUyHldEwFWP9PVmeyWtQcLIoRj0cEE/N
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

Enable ADSP, CDSP and Venus.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
index 208ed466081d..48916a3216e5 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
@@ -98,6 +98,11 @@ ramoops@ffc00000 {
 	};
 };
 
+&adsp_pas {
+	firmware-name = "qcom/sdm845/Sony/tama/adsp.mbn";
+	status = "okay";
+};
+
 &apps_rsc {
 	regulators-0 {
 		compatible = "qcom,pm8998-rpmh-regulators";
@@ -358,6 +363,11 @@ vreg_s3c_0p6: smps3 {
 	};
 };
 
+&cdsp_pas {
+	firmware-name = "qcom/sdm845/Sony/tama/cdsp.mbn";
+	status = "okay";
+};
+
 &dsi0 {
 	vdda-supply = <&vreg_l26a_1p2>;
 	status = "okay";
@@ -659,3 +669,8 @@ &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l12a_1p8>;
 	vdda-phy-dpdm-supply = <&vreg_l24a_3p1>;
 };
+
+&venus {
+	firmware-name = "qcom/sdm845/Sony/tama/venus.mbn";
+	status = "okay";
+};

-- 
2.40.0

