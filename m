Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89DDE65B14D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jan 2023 12:42:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232597AbjABLmL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Jan 2023 06:42:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232884AbjABLmF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Jan 2023 06:42:05 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE6EBF13
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Jan 2023 03:42:03 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id q2so28850839ljp.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jan 2023 03:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DFU9bGFCZAQ4eLz1sLnNYm1aOcmTTJdAlfZrDIj/g7Q=;
        b=A3bjAiUWya/xZ0diRWE5yhrbPaolWEfSBNiTHT+PTnFaDdZfa6Fw1MqqqS2WfEBbVU
         hwoLb9aP/0r5F8DV0wo9CcyqAIWXWMSY7CaXRnCaxPobzkC12Q/xj0pVb8/SPNwXR6Ge
         9QqCeye/rbd5a2C9i7E++QaV2H9KtHRZhIe5FqJYxjK07+g7GPJns913GKdwbDF6m6kH
         zWLT8h4t3Ki0vMQcgRpVbu/naTjx5JTcvnTrT9Ijo1iZbjh0HSt7jLs6357IYGVdKOMG
         q8CKCWhdzzI+t7/sufVgFF0biouhOZAQ11D85X9Udd+2NXW+AoeAcNM1aJxcslNpTzhE
         TfhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DFU9bGFCZAQ4eLz1sLnNYm1aOcmTTJdAlfZrDIj/g7Q=;
        b=E1HCtglh/jm1et4iw6NvAYrz8DaGV39T5uig7t9sQU/79UJ4Y/sag0SJibEsX97V8s
         Nx+IpreKjNrVJ0/6xwlVFW9OHUCcTmVQlKSQ8yno8P4d3Q63CDZDHWFX9pAp3HMgByYM
         u1eqXdk64vwhiCNI5Ks7F5oJQNVPHUzs/rhLvzPdtEAFCeGEtgy0EABpQRqg1XOmpses
         Niiv5XKpNVweE0lJ7e/SoP1crXv2BULpA80nHNl9r+Xj1fkeXqaKrIFGN1znN4z6Isq5
         aiLfZ7n1VBR5RBFlQIga6+l7Z8ZTbUKHpgkBmHZsC6rl3Goe/EHlMtcINE1z7j/RtHob
         WeLw==
X-Gm-Message-State: AFqh2krPaZ4+dVHG52SezoLh64Og3AApVGnTPht/tUK5jQItoPfLk+Ee
        5cA/kKMEVa6Wv7IT06o/PiOmrw==
X-Google-Smtp-Source: AMrXdXvanEqAmzrAU8cnms8NzY+XMBTyfywvWRDhSrQR7ouPlYxDspszcull6A3Kcw/Q592iYn6Vyg==
X-Received: by 2002:a2e:a54d:0:b0:27f:c95e:7619 with SMTP id e13-20020a2ea54d000000b0027fc95e7619mr7240352ljn.13.1672659722099;
        Mon, 02 Jan 2023 03:42:02 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id c20-20020ac24154000000b0048a8c907fe9sm4356397lfi.167.2023.01.02.03.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 03:42:01 -0800 (PST)
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
Subject: [PATCH 5/8] arm64: dts: qcom: sdm850-lenovo-yoga-c630: Use proper WSA881x shutdown GPIO polarity
Date:   Mon,  2 Jan 2023 12:41:49 +0100
Message-Id: <20230102114152.297305-5-krzysztof.kozlowski@linaro.org>
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
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index f32b7445f7c9..25d167cb5e7f 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -788,7 +788,7 @@ swm: swm@c85 {
 		left_spkr: speaker@0,3 {
 			compatible = "sdw10217211000";
 			reg = <0 3>;
-			powerdown-gpios = <&wcdgpio 1 GPIO_ACTIVE_HIGH>;
+			powerdown-gpios = <&wcdgpio 1 GPIO_ACTIVE_LOW>;
 			#thermal-sensor-cells = <0>;
 			sound-name-prefix = "SpkrLeft";
 			#sound-dai-cells = <0>;
@@ -796,7 +796,7 @@ left_spkr: speaker@0,3 {
 
 		right_spkr: speaker@0,4 {
 			compatible = "sdw10217211000";
-			powerdown-gpios = <&wcdgpio 2 GPIO_ACTIVE_HIGH>;
+			powerdown-gpios = <&wcdgpio 2 GPIO_ACTIVE_LOW>;
 			reg = <0 4>;
 			#thermal-sensor-cells = <0>;
 			sound-name-prefix = "SpkrRight";
-- 
2.34.1

