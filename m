Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22BCB76C0D4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Aug 2023 01:24:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbjHAXYy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Aug 2023 19:24:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229952AbjHAXYx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Aug 2023 19:24:53 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB28F2130
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Aug 2023 16:24:51 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b9e6cc93c6so45541811fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Aug 2023 16:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690932290; x=1691537090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yejd9U6Gcc2r/2FX/wqBTc3BMFe3dGwJkHdTGuAhl4k=;
        b=MPownO5/r6vY/Ol/hbrWfumv4zVog3mqa1WLbuFYKD2APFn09LYIVJdLwzbhhsnMTF
         IzGBki59THy016DAw0MFh2edlfp5i0Pnge1YJoIlHFGGIVYTi3V2fXDfuzSia+tkBvjl
         Xq4iiMpRqtRMfIoWOyMNOVtorQdBdtIBbkvn21sNDZp0NZXhcdZOw3eJkqUWmxp7Jpl9
         tI+R5asg8SZ2PLX+vPWbFaS1wpoeHG6nXi4LevySBYNnHPhIEHpw507xCtItosAJT7nK
         097SIDmcKTcLb9rqZ9cHQQ/lwTznMy1j6Z+jD9e2bMM7oXO3Nr+qDox5JjW8M2cJRg4I
         f5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690932290; x=1691537090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yejd9U6Gcc2r/2FX/wqBTc3BMFe3dGwJkHdTGuAhl4k=;
        b=K8dMf7Msv7minGoKly+bMPsBToxhHe2HgqE1yzf1/HwKT1VYUlbqaaYxEE3ZN/B0MG
         bz/vhvKDeQfyDLT5xbaXKK6bsNbawEFZFR5Q5c5cPSAmIB1mZkbiKbPg6G4PrqGOEwYF
         xhj4IxZnYiiE2/T3t0q2XW5FcfR4RIKnWafcd3pfaCtG+fCObozXh+Bykn9ywLyCJMyT
         JZUxki8j9EaL03YCxtXlLvr4wtjnBtmzwd+YPvCNvGcZ96hE0N2zRJvVrbGpHdcOEROs
         3FI2a99Ws9g5RcF16fCX6Ccmry/9Rn+1coZH+ZhDq/NFtxich2IIqJUBF4wp4zEnbJLZ
         /Xog==
X-Gm-Message-State: ABy/qLZZwSkTVXt+sEut0qco5cfQXgTuGeAqwaKw/X1GsauLCo2gAE0U
        1gnbGkLC1AJUu0lLHKdzUaTKyg==
X-Google-Smtp-Source: APBJJlG9fDmLJM5W7byZy8IBCTKRn5g6ZfOrO+4qcb2bK1+ED0ZGZoCHfJbCsH72SXa/FX7yNTH6jw==
X-Received: by 2002:a2e:a0c6:0:b0:2b6:e958:5700 with SMTP id f6-20020a2ea0c6000000b002b6e9585700mr3550893ljm.4.1690932290028;
        Tue, 01 Aug 2023 16:24:50 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a10-20020a2eb16a000000b002b9fddc6d85sm433329ljm.62.2023.08.01.16.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 16:24:49 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Kalle Valo <kvalo@kernel.org>
Subject: [PATCH 2/2] arm64: dts: qcom: qrb4210-rb2: add wifi variant property
Date:   Wed,  2 Aug 2023 02:24:48 +0300
Message-Id: <20230801232448.4175662-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230801232448.4175662-1-dmitry.baryshkov@linaro.org>
References: <20230801232448.4175662-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The RB2 platform doesn't have board-specific board-id programmed, it uses
generic 0xff. Thus add the property with the 'variant' of the
calibration data.

Note: the driver will check for the calibration data for the following
IDs, so existing board-2.bin files will continue to work.

- 'bus=snoc,qmi-board-id=ff,qmi-chip-id=150,variant=Thundercomm_RB2'
- 'bus=snoc,qmi-board-id=ff,qmi-chip-id=150'
- 'bus=snoc,qmi-board-id=ff'

For the reference, the board is identified by the driver in the
following way:

ath10k_snoc c800000.wifi: qmi chip_id 0x150 chip_family 0x4002 board_id 0xff soc_id 0x40670000
ath10k_snoc c800000.wifi: qmi fw_version 0x337302d3 fw_build_timestamp 2023-01-06 01:50 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HL.3.3.7.c2-00723-QCAHLSWMTPLZ-1
ath10k_snoc c800000.wifi: wcn3990 hw1.0 target 0x00000008 chip_id 0x00000000 sub 0000:0000
ath10k_snoc c800000.wifi: kconfig debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
ath10k_snoc c800000.wifi: firmware ver  api 5 features wowlan,mgmt-tx-by-reference,non-bmi crc32 b3d4b790
ath10k_snoc c800000.wifi: htt-ver 3.114 wmi-op 4 htt-op 3 cal file max-sta 32 raw 0 hwcrypto 1

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 8a6fe297fde8..12298d446104 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -544,6 +544,7 @@ &wifi {
 	vdd-1.8-xo-supply = <&vreg_l16a_1p3>;
 	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
 	vdd-3.3-ch0-supply = <&vreg_l23a_3p3>;
+	qcom,ath10k-calibration-variant = "Thundercomm_RB2";
 	status = "okay";
 };
 
-- 
2.39.2

