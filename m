Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B6F9629D67
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Nov 2022 16:29:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbiKOP3B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Nov 2022 10:29:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238035AbiKOP1s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Nov 2022 10:27:48 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 603A82DA8F
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 07:27:47 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id ud5so36949302ejc.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 07:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FIKwiZufvJH5nrQuxrW8TWphTglnKJX8yB1ZUtB1Ni0=;
        b=WbJ/AdDJ6Ul5EzDIiQFrTOPdMWfdVqOkbgIzN1zCTrIeiFAL0ejuXvR33Vf1NGuRLD
         NUKbJlAqgHfM5QvDuXn8Sb/Riipdgbx/v+wd/t/I8nh1c59Z+JaC+abDvu/PTu8ODMMG
         b4FSrXjoLi2f0Z8oKBg+EL0Aw5bF2mI89RJ3m0A4sdjobMkcOoQlVwcLsng7yFhiU7Nx
         Ml+cBvMAw8l/QfENBP7SE4bk69j8SFoUjOUJ77gL3/WJZ9ibJns0B2sFjQyepF5ZB8t5
         nzBcPxrxLN9gZT97sdzQ3kbgQZZjeD8Y6B3quDSIfI/F56VZ1DX+l+omECaoW55KE4KK
         sQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FIKwiZufvJH5nrQuxrW8TWphTglnKJX8yB1ZUtB1Ni0=;
        b=cDCd+1Kv+aEyvrbQfYD57xcyo5najPRSQuf/CbgSO6tcW0h15XrBJwBVmEhtui73Gn
         ZbHFAWSi21WsuGbo31XIPWosW8X0r+3TBUradygqXzyl6Vo6utfSdqVNRwUiItY1rtQu
         py3AMcNxiZpKXo7IJBq1veElX++mOHR6Z4tTLW8WcJi+sczPE4hMZ3m59VtTLvzjKBpy
         9gu4AtdzjGGB80RofGvWBM3tHePm9mtkI5bDafosdVGC+1IFSdhIBz+F/TYqLjyPA8KB
         b2g0p/gwzXyXlfJ+Q6bu0vNx/n6Cvk9tnAzvWeyTideC1+XsOoEKVAC03E9sEtnuC0G8
         lUkQ==
X-Gm-Message-State: ANoB5pml6BOpBLRyBht0VoJzpatEmHa+5g0Q2V40yd2A6FcvxwniefTE
        tqmLsCxtiR7TmNJnWIqgJeZHcW2iHO1skMBG
X-Google-Smtp-Source: AA0mqf4hIyLG4Pf0Fz3JkTUdQiNuYkTCRxujsNr1VZbDdcfotqcviVtGWqqqRzAJXDTBQgi/UTxIUA==
X-Received: by 2002:a17:906:2b10:b0:7ae:c1af:a034 with SMTP id a16-20020a1709062b1000b007aec1afa034mr14499830ejg.346.1668526066675;
        Tue, 15 Nov 2022 07:27:46 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id ku21-20020a170907789500b007ae1ab8f887sm5750679ejc.14.2022.11.15.07.27.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 15 Nov 2022 07:27:46 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/9] arm64: dts: qcom: sm6375-pdx225: Enable QUPs & GPI DMA
Date:   Tue, 15 Nov 2022 16:27:24 +0100
Message-Id: <20221115152727.9736-7-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20221115152727.9736-1-konrad.dybcio@linaro.org>
References: <20221115152727.9736-1-konrad.dybcio@linaro.org>
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

Enable QUPs & GPI DMA on the Xperia 10 IV.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../qcom/sm6375-sony-xperia-murray-pdx225.dts    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dts b/arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dts
index 450d4a557df1..6a0f4c0bf7ad 100644
--- a/arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dts
+++ b/arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dts
@@ -65,6 +65,22 @@ vph_pwr: vph-pwr-regulator {
 	};
 };
 
+&gpi_dma0 {
+	status = "okay";
+};
+
+&gpi_dma1 {
+	status = "okay";
+};
+
+&qupv3_id_0 {
+	status = "okay";
+};
+
+&qupv3_id_1 {
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <13 4>;
 };
-- 
2.38.1

