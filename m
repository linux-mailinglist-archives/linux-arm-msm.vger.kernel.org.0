Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFECD5B457E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Sep 2022 11:15:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbiIJJPM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Sep 2022 05:15:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229706AbiIJJOz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Sep 2022 05:14:55 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5385E237D6
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Sep 2022 02:14:47 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id f11so6704401lfa.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Sep 2022 02:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Om7NL/8n/AZHbaNF9gisHUFy/iTMOZIGCGU/AWMpqjM=;
        b=shixtIhBSAZGcGZxoWGvxbe94FCKP7YSUgKsBA+rsiVc1TNpTivGMg2TRyabz7coMR
         jV4cawvAYBdMCi29AkwxoEbUe2qGu8t9Ik7Zq8i8cLKdaV/sxnJyxiiyoXpZEoELiA1v
         AGMCzIejMjD1Ts1xNVvtJfkqYoimBVjSsvLhab7sGSGO6OxRTIAKI4Wt/hEk663pVo8X
         VmqDckdFXxdI9U0UShm4yqrc1Aqf6370/kjPPQHRrhI1cxQiCBKWaZpfwkJ3wM+RyAvC
         XDbjqPdkaCAmprKKysIOKL1RpwYhuMOeB7h0x9XIBoqlykC2dDMXecckjxRKRSFr+jVx
         1ECQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Om7NL/8n/AZHbaNF9gisHUFy/iTMOZIGCGU/AWMpqjM=;
        b=iincS0xLgR+WusPnNzHo87v7wqwIXGcFFRUTocvdCA0gud/JU8dMEbhHQitFhgggbf
         ZNJOlKmx3GRZGM9A43ht1rtw6WBO7UAhAdIUSvv76FeSPk3WCtIMw2OWInpvbM3RmgJ2
         A/b+NIpLjLOmYnrZ5jQC+Xv/gLxf8zVTTxDP9k/E8MLaO+dlnuq99B17a5v2+M2glyxY
         0xMJLgfn2rB6DQY0XtWhJxJNOal46vOyuXRo15ozt8/5TkL46tCW9LxMwsgRdMcV36oU
         Zf4IxgbxXJTIgdeMASdORmagcHC07Bs4jk0enrgVLu/Fzb8ZnumatAmfgap1NpUcaqVj
         FiMg==
X-Gm-Message-State: ACgBeo35i+YpGq6m6scRbVxgRcgc3w7LC8bwaPHe9YrCmJVt43V0CYnz
        cNovj800kBXQuzlIEQAiPNog+Q==
X-Google-Smtp-Source: AA6agR65F1UZGoG65loqPXfIrJaLts3AmGwOQ+PcGtwW4XTYY0dznF07HfSCsWDWPNHFdSwvMKEi0Q==
X-Received: by 2002:a19:910f:0:b0:498:7212:10c0 with SMTP id t15-20020a19910f000000b00498721210c0mr4374129lfd.39.1662801285269;
        Sat, 10 Sep 2022 02:14:45 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id x22-20020a19e016000000b0048b26d4bb64sm201552lfg.40.2022.09.10.02.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Sep 2022 02:14:44 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 07/15] arm64: dts: qcom: qrb5165-rb5: align dai node names with dtschema
Date:   Sat, 10 Sep 2022 11:14:20 +0200
Message-Id: <20220910091428.50418-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220910091428.50418-1-krzysztof.kozlowski@linaro.org>
References: <20220910091428.50418-1-krzysztof.kozlowski@linaro.org>
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

DT schema expects DAI node names to be "dai":

  qcom/qrb5165-rb5.dtb: dais: 'qi2s@16', 'qi2s@20' do not match any of the regexes: '^dai@[0-9]+$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index bf8077a1cf9a..d39ca3671477 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -867,7 +867,7 @@ &qupv3_id_2 {
 };
 
 &q6afedai {
-	qi2s@16 {
+	dai@16 {
 		reg = <PRIMARY_MI2S_RX>;
 		qcom,sd-lines = <0 1 2 3>;
 	};
@@ -875,7 +875,7 @@ qi2s@16 {
 
 /* TERT I2S Uses 1 I2S SD Lines for audio on LT9611 HDMI Bridge */
 &q6afedai {
-	qi2s@20 {
+	dai@20 {
 		reg = <TERTIARY_MI2S_RX>;
 		qcom,sd-lines = <0>;
 	};
-- 
2.34.1

