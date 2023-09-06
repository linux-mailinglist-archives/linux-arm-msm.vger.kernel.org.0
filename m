Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3FC8793813
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Sep 2023 11:25:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236614AbjIFJZF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Sep 2023 05:25:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236558AbjIFJZE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Sep 2023 05:25:04 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B41241708
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Sep 2023 02:25:00 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-50091b91a83so5670227e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Sep 2023 02:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693992299; x=1694597099; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mJcgYLWSDIphTOxwJ5BuSUvMakeC7znWV3Q4BRoGpho=;
        b=xoJfiZ1EiHZbR6rajBlIdqllieDCqs6U2HKjg7X78UxB/uoFETGR/XxyI8Fm4++7be
         D3wQaved4IQ/i7ayWY1W0DvGc6iwnd5bF/348LU4UIJar+KrR6JrH8isRo0VkNhV4urD
         0WPnXkfaN+ruLTTGli4Vbf0NRxKMf1MawShuyEpxCyyFjJCwedZdJSGgK3/0gPniT45Y
         V/CpBo75pgRKgg/EAH3X3OMvWG//iUfk5Pw62UqVeLs2Ggj3X5hMd6ORSVmWsbk+ktqA
         J3FxrmH9tecO36ompI+b7uDTkwhr2WkNL9Cz+sDHEOGJxmqOgNm8eRmgEpwNHiPumK9Y
         SZGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693992299; x=1694597099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mJcgYLWSDIphTOxwJ5BuSUvMakeC7znWV3Q4BRoGpho=;
        b=gjWPVK51i/OpW5QbzD8tWIOjwEkTDii5sQthvrY/2tmNdmWujpDSO6FZ5whilCBX1R
         mpghs1+0WNmefJywvRz7C+IDWckDdlmtL0rI6/JkQDzYersbKUb30Ok1t4JRw/xW38S+
         ccRLx+dRQ7irPjdHD3tjisRNyMxdpAyEzd+oJblgWS2PJmcAayaPAIvF/59vaasqrAdu
         HD5/GYcHDD063CNlnnU771jMfsowuoUrRZNMrxtgDNihP+q1VY/5s9gqkGN4yCkBDPvc
         M1vNCxPakK4lPfjbfvE7PwYiwTYyeJ5hiJrfi6EOOyP6YlakaxeTmtohRiTnmzU5CJ82
         uFQg==
X-Gm-Message-State: AOJu0YzMyMG5XexVf3QSdgpqiXi76/+Dj9Fc+ym2ss/p7O9fO5ba8wbR
        bU7C8UcXQ+coGNs89d6E1upQwA==
X-Google-Smtp-Source: AGHT+IFoX1Npgkf71zsR7IeuQz0DY4JRSVdyTXwIXK9fXh2un6wtZWVpCXttWSH5uAxtqkfUyXrCRQ==
X-Received: by 2002:a05:6512:707:b0:500:aaea:1494 with SMTP id b7-20020a056512070700b00500aaea1494mr1723138lfs.41.1693992298928;
        Wed, 06 Sep 2023 02:24:58 -0700 (PDT)
Received: from [10.167.154.1] (178235177204.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.204])
        by smtp.gmail.com with ESMTPSA id q10-20020aa7cc0a000000b005232c051605sm8096155edt.19.2023.09.06.02.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 02:24:58 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 06 Sep 2023 11:24:55 +0200
Subject: [PATCH 1/5] arm64: dts: qcom: qrb2210-rb1: Swap UART index
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230906-topic-rb1_features_sans_icc-v1-1-e92ce6fbde16@linaro.org>
References: <20230906-topic-rb1_features_sans_icc-v1-0-e92ce6fbde16@linaro.org>
In-Reply-To: <20230906-topic-rb1_features_sans_icc-v1-0-e92ce6fbde16@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1693992295; l=1144;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Xif6UdomCGSQPtwk0BJ/phPNrNvcvHqx0EtrYHlqhc8=;
 b=5Y5Q2Y0NJTALIxnjTsqAMNygPREAqepvMJ381vGllcBARJwvjcE6w0G55UhV+enTYylQlHmyU
 Cmyv5jdpzLiD/AUZi5MY3FM/LluzXr7IBRzS1iUo2Qk/XNpFIg7kJSn
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Newer RB1 board revisions have a debug UART on QUP0. Sadly, it looks
like even when ordering one in retail, customers receive prototype
boards with "Enginering Sample" written on them.

Use QUP4 for UART to make all known RB1 boards boot.

Fixes: e18771961336 ("arm64: dts: qcom: Add initial QTI RB1 device tree")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index eadba066972e..5cda5b761455 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -13,7 +13,7 @@ / {
 	compatible = "qcom,qrb2210-rb1", "qcom,qrb2210", "qcom,qcm2290";
 
 	aliases {
-		serial0 = &uart0;
+		serial0 = &uart4;
 		sdhc1 = &sdhc_1;
 		sdhc2 = &sdhc_2;
 	};
@@ -357,7 +357,7 @@ key_volp_n: key-volp-n-state {
 };
 
 /* UART connected to the Micro-USB port via a FTDI chip */
-&uart0 {
+&uart4 {
 	compatible = "qcom,geni-debug-uart";
 	status = "okay";
 };

-- 
2.42.0

