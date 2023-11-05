Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 502A67E12FF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Nov 2023 11:20:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229455AbjKEKUZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 5 Nov 2023 05:20:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjKEKUY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 5 Nov 2023 05:20:24 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84DF6E9
        for <linux-arm-msm@vger.kernel.org>; Sun,  5 Nov 2023 02:20:21 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-50931355d48so4661989e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Nov 2023 02:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699179620; x=1699784420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ASuoihSIUKaqHBs9DjtyoGbQtXdvykq9XUQb9kp37eU=;
        b=V2FGxWal6CR6pdq+PmUqyy5VCF0ektiC6WnypNwI4YQ9Sz2ghfyFO2SVggw7oOcVwK
         IcF3AZ+vUMIvf1RPXD3xqLaTn+0T2pTFmJcSAicY+VJLNls4F58G1WrMMmKfvjsaylCl
         2Mh9BcNYj0OqAI4m3hUTVMGpQgv6+l84c2bzF69qDkpt0XSmXKgpuhAtxig2Ew0xhcJw
         mEhzVLXabC9lNsT2kclaM76kubmYJubReiVB3OCsue8sw/BVPp0cvrtgh2nmItyGvGyM
         hHzi16Og70cjvJWuy3LiVMQBf+wAENM0tltybpsl1dv9HyLB4CVL4FmZIKQPscq2P1vx
         NMzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699179620; x=1699784420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ASuoihSIUKaqHBs9DjtyoGbQtXdvykq9XUQb9kp37eU=;
        b=YkMUi8eoRAitaH3MAS+UqBy+LpqIIF842tJcvUf7INvFSklUtdThP8lc5GSfd+NNz/
         o3Iva0xC9IWu60iWcfwF3lYB8xcDms5CTwFrgfgwG+0lrRX3CA1uuf23PV44OM8UX4Z3
         sjjweNfyDvTSBqnDa7CCIG01sbvT54MEd1jOA+4J1fV8b+OJU8RQFIHBQ/kTmrljH8do
         kSysVpxCCAtDjVAZxJLupaMAAnlXAba4s70eCNVJ4ZRnosrj9Ir4EJ4dE+UkIUEbq9dS
         nStoROlEpunwJStp70NlIbZfkj8UzLx/xh3Qb2I9E8LYrxwfBYUFVxAFuiSNT/QwqwIt
         hMug==
X-Gm-Message-State: AOJu0YwMT3ciVN8X7d764/HmjW25cSSkDYKURvWBgAgxW71jDOxruyRq
        o06a+e+/cVLvQrnDPy0GM5Gn12Qay7lGL9b3p6A=
X-Google-Smtp-Source: AGHT+IFawZqB8yudfteW76oYipYXbd03J0xfErr4uEYj1y92zxKGb/0jPJPTNE7T7nXMPXTAZWpjRA==
X-Received: by 2002:a19:ca0d:0:b0:507:a1dd:5a86 with SMTP id a13-20020a19ca0d000000b00507a1dd5a86mr17393282lfg.13.1699179619690;
        Sun, 05 Nov 2023 02:20:19 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id u16-20020ac248b0000000b0050336e38735sm790997lfg.92.2023.11.05.02.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Nov 2023 02:20:18 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: qrb2210-rb1: add wifi variant property
Date:   Sun,  5 Nov 2023 12:19:25 +0200
Message-ID: <20231105102018.1546057-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
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

The RB1 platform doesn't have board-specific board-id programmed, it uses
generic 0xff. Thus add the property with the 'variant' of the
calibration data.

Note: the driver will check for the calibration data for the following
IDs, so existing board-2.bin files will continue to work.

- 'bus=snoc,qmi-board-id=ff,qmi-chip-id=120,variant=Thundercomm_RB1'
- 'bus=snoc,qmi-board-id=ff,qmi-chip-id=120'
- 'bus=snoc,qmi-board-id=ff'

For the reference, the board is identified by the driver in the
following way:

ath10k_snoc c800000.wifi: qmi chip_id 0x120 chip_family 0x4007 board_id 0xff soc_id 0x40670000
ath10k_snoc c800000.wifi: qmi fw_version 0x337302d3 fw_build_timestamp 2023-01-06 01:50 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HL.3.3.7.c2-00723-QCAHLSWMTPLZ-1
ath10k_snoc c800000.wifi: wcn3990 hw1.0 target 0x00000008 chip_id 0x00000000 sub 0000:0000
ath10k_snoc c800000.wifi: kconfig debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
ath10k_snoc c800000.wifi: firmware ver  api 5 features wowlan,mgmt-tx-by-reference,non-bmi crc32 b3d4b790
ath10k_snoc c800000.wifi: htt-ver 3.114 wmi-op 4 htt-op 3 cal file max-sta 32 raw 0 hwcrypto 1

Fixes: 9692ccc49583 ("arm64: dts: qcom: qrb2210-rb1: Enable remote processors")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Initially this patch was sent before Konrad actually sending the WiFi
support patchset for the RB1 board. Afterwards we didn't synchronise and
the calibration variant wasn't squashed into the relevant patchset.

---

 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index 66062006ef4d..a7a744bafc45 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -536,6 +536,7 @@ &wifi {
 	vdd-1.8-xo-supply = <&pm2250_l13>;
 	vdd-1.3-rfa-supply = <&pm2250_l10>;
 	vdd-3.3-ch0-supply = <&pm2250_l22>;
+	qcom,ath10k-calibration-variant = "Thundercomm_RB1";
 	status = "okay";
 };
 
-- 
2.42.0

