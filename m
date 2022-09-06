Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A2D95AE7B8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Sep 2022 14:20:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239851AbiIFMTx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Sep 2022 08:19:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240224AbiIFMTW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Sep 2022 08:19:22 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C02426543
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Sep 2022 05:17:07 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id k10so2469780lfm.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Sep 2022 05:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=4JDAwEZQcoLKI1Gf4ZPXihH24xb2UdAVE7Vfa8ywfLg=;
        b=jIHJBCvwFRT8UkMJIUSjzxulkLzAHD8JZCtNnbMHOcFyExAj/+3oVWtCEYz7G78wJr
         L7QIX5ZFGIyWXlxStknm9T+2YtokbVSjH6uPbRzyvUfKtH0blGIEIOwIxKrAp4W8Ao3S
         T/P6YkT2v+r+ZeRxLNv6G5YzDy8t9P2pfBjYYN3aEFOOjaj2EF8cwzA37RhhmSfGHqPb
         dSP4oGiurD+bK1MNGcrR/p/alnmlBciVCWHM6td/CHwxIxoefNyaeEsDXFfwj3wx5zGx
         XwW554fzB+fMtEvToJKCWjYy4gyY1m3TNQMENbssKGHzfXz730IhvctCHOmH2LLDjRRK
         +3RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=4JDAwEZQcoLKI1Gf4ZPXihH24xb2UdAVE7Vfa8ywfLg=;
        b=OpOc9TQ9tzE1+xpqSoih03levI20akZCvY5uJcZRLgYrUaoCehmJLVpFbvd3XqoDxB
         TLMBzDnK2RpPM5KH8SEy4Qcl9pZ2VSKHIyZVS3TioqU/E3qMNmTIDoJZba/jVJaPLR0y
         Vu/tBHpaIrkafzZDM+PRZT0/6FsmzhaCu0nRwBL+nLaxPmOIyyj60v3Jz1bPYg5yZAzn
         ZXGDjOB1kiooBGQMyUKYWxf+yi09deB+JLUCpymLqOUis25HsICSAe6bYMsACUcnPbpx
         8jC2BA4DlJBlcQotCBrZZZe/ng9KOA2rQsD+2LbcC9bR08BCUCUVHXmYH6Q9fpB4qhxf
         TyGg==
X-Gm-Message-State: ACgBeo1lmqPZYgDb00riWyRjy4l0PHuM4fYFhKITYkXl4cW0hvFBj2mu
        DgBqPPUL7G2rTZpebY5Z7Q7KiQ==
X-Google-Smtp-Source: AA6agR6i73k9qW5HNQcpSZoKLIbwt/o1xO7wVL8odgzciD21w6PoqcPDvxG3NXi4l6UtirxHECBlvg==
X-Received: by 2002:a05:6512:1051:b0:494:8e93:bf6f with SMTP id c17-20020a056512105100b004948e93bf6fmr9769680lfb.320.1662466621256;
        Tue, 06 Sep 2022 05:17:01 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u17-20020a05651c131100b0025df5f38da8sm1882802lja.119.2022.09.06.05.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 05:17:00 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 02/12] arm64: dts: qcom: sdm845: align APR services node names with dtschema
Date:   Tue,  6 Sep 2022 14:16:45 +0200
Message-Id: <20220906121655.303693-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906121655.303693-1-krzysztof.kozlowski@linaro.org>
References: <20220906121655.303693-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DT schema expects APR services node names to be "service":

  qcom/sdm630-sony-xperia-nile-voyager.dtb: remoteproc@15700000: glink-edge:apr:service@4: 'dais' does not match any of the regexes: '^.*@[0-9a-f]+$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 98d34b5e1df2..8e7b577f78c2 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -767,13 +767,13 @@ apr {
 				#size-cells = <0>;
 				qcom,intents = <512 20>;
 
-				apr-service@3 {
+				service@3 {
 					reg = <APR_SVC_ADSP_CORE>;
 					compatible = "qcom,q6core";
 					qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
 				};
 
-				q6afe: apr-service@4 {
+				q6afe: service@4 {
 					compatible = "qcom,q6afe";
 					reg = <APR_SVC_AFE>;
 					qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
@@ -785,7 +785,7 @@ q6afedai: dais {
 					};
 				};
 
-				q6asm: apr-service@7 {
+				q6asm: service@7 {
 					compatible = "qcom,q6asm";
 					reg = <APR_SVC_ASM>;
 					qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
@@ -798,7 +798,7 @@ q6asmdai: dais {
 					};
 				};
 
-				q6adm: apr-service@8 {
+				q6adm: service@8 {
 					compatible = "qcom,q6adm";
 					reg = <APR_SVC_ADM>;
 					qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
-- 
2.34.1

