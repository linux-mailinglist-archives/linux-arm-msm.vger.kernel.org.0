Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4D3D65B14E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jan 2023 12:42:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232807AbjABLmQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Jan 2023 06:42:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232427AbjABLmI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Jan 2023 06:42:08 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC035E92
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Jan 2023 03:42:07 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id 1so41237733lfz.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jan 2023 03:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhbiyazKqrVG6CgQo0Lo7FTo8Pu36wyTx9eEnoPfuPs=;
        b=KPenZeSbjXIiU2I1mwvFnabRBJSzvy4GXBXa8vjN1r0VIuumtfAXVFLeumSTbBxbFD
         qCghJbdlfn+GmQ3dym2GQW7cIVES2d/hQp6ItUTb8Ib2i/Oi4WvLcbd3dIePeuA37MNg
         xxn8dFloOYzWkWHGCQ7dNNmrV+Q1noZsHqwrvwK583jCFzVSz9i775OMzFIjmVk0Hto4
         8qzd9AIYtReGsWFxqfoP2MDYnbdHkqdhIzUE5Bbl33F5pHvh6KRUn3gtCAyvfChJM3Cz
         +DtCECE6eZINTvzzrEEd+dTDTTrGcuNwIt8dIBYve1T7Dem4fFREPLPQcq7VS1IF5htf
         nQxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qhbiyazKqrVG6CgQo0Lo7FTo8Pu36wyTx9eEnoPfuPs=;
        b=H3tgBqkXtrQ3rYX4obWBT0fCgaBzipzETuysOx9RfXt0cmA5RnLwiNgNTIwNz/VHZV
         esOfswM0pd9OpcLeikAdn2zDihlPjElUgaSaxnMrIzbkTQSNl/z40YEfTf4B/6HXZLFs
         LtjRWRZewMNf91V2s0ASF2JFx7ECF1ama3BIuJKEAxk7Dhx5Cii9TUF2yrWSPvi6gwdO
         kZQJ/DdncxqOWpn2X97I0suJQHFu1a8JKE2bSqele2shO2SXXwNnzP2lA1htOOdvXvn5
         avltcCDDC6lRYh04M2IsCCl9wBTUtXK2N1tPjzWKCyqLAhiB8OpnpYXIbaj+j7bUWYum
         Ykrw==
X-Gm-Message-State: AFqh2krTrANNmxnP+XmnbgqqvYs7EKoAUquzcxImFXJ/0i7IH+PkbtcI
        NLy70tIUDJlKvgYAkxeCl3n9zPGkXQQ18v0Y
X-Google-Smtp-Source: AMrXdXthvx+Tv+Pa7lEwdml7FHR3ul82K2m0m6TNS12fV3YlrUqv4uDKYlm0E/geyZfaWdwgBVRUJw==
X-Received: by 2002:ac2:599d:0:b0:4b5:b8a9:b42c with SMTP id w29-20020ac2599d000000b004b5b8a9b42cmr10424407lfn.17.1672659725890;
        Mon, 02 Jan 2023 03:42:05 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id c20-20020ac24154000000b0048a8c907fe9sm4356397lfi.167.2023.01.02.03.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 03:42:05 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        alsa-devel@alsa-project.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 8/8] arm64: dts: qcom: qrb5165-rb5: Use proper WSA881x shutdown GPIO polarity
Date:   Mon,  2 Jan 2023 12:41:52 +0100
Message-Id: <20230102114152.297305-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230102114152.297305-1-krzysztof.kozlowski@linaro.org>
References: <20230102114152.297305-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The WSA881x shutdown GPIO is active low (SD_N), but Linux driver assumed
DTS always comes with active high.  Since Linux drivers were updated to
handle proper flag, correct the DTS.

The change is not backwards compatible with older Linux kernel.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 8c64cb060e21..5c510d59c054 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -1010,7 +1010,7 @@ &swr0 {
 	left_spkr: speaker@0,3 {
 		compatible = "sdw10217211000";
 		reg = <0 3>;
-		powerdown-gpios = <&tlmm 130 GPIO_ACTIVE_HIGH>;
+		powerdown-gpios = <&tlmm 130 GPIO_ACTIVE_LOW>;
 		#thermal-sensor-cells = <0>;
 		sound-name-prefix = "SpkrLeft";
 		#sound-dai-cells = <0>;
@@ -1019,7 +1019,7 @@ left_spkr: speaker@0,3 {
 	right_spkr: speaker@0,4 {
 		compatible = "sdw10217211000";
 		reg = <0 4>;
-		powerdown-gpios = <&tlmm 130 GPIO_ACTIVE_HIGH>;
+		powerdown-gpios = <&tlmm 130 GPIO_ACTIVE_LOW>;
 		#thermal-sensor-cells = <0>;
 		sound-name-prefix = "SpkrRight";
 		#sound-dai-cells = <0>;
-- 
2.34.1

