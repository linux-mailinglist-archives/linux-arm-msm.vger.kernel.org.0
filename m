Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1C7864F635
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Dec 2022 01:24:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230234AbiLQAYM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Dec 2022 19:24:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230319AbiLQAXQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Dec 2022 19:23:16 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 439057E29B
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 16:17:43 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id m29so5659435lfo.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 16:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Hsa31ymOeybHDD6Oy0urHW3AuIWlU3Je1yr2qvFGAY=;
        b=VgI3nLWS3nexAa4ub9/UR1Rq9pDey2EJDDSCbEaJGoAbQrscscKiVHeDBy4rN/8D45
         24b4WLE1T/MjA0CTpYkbcgZEcXETxTDNgaSzLeF+Tfm4Znlinn41mi5ut55njZCad/us
         +WXufuTh45XyAQXqrpDRadg7NEh/7ElZMbPbdGXwtW1kL/cDi2z0lAF9dXCoPl62enkD
         oSw8A0a/hcL2iCtukYBPNg4GiBKjn+BMmhGF4jlBMsqs/toBWH+s6qYvWhgOjdZy7sRX
         IXjEDpt3oMwNgwvweMokV7iXv7b0gOLtzCcfjfd3L2Y0BEyIylAUYk55EPCfqZStzrbZ
         lXgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Hsa31ymOeybHDD6Oy0urHW3AuIWlU3Je1yr2qvFGAY=;
        b=T7IJekondQWZH41/5GHQpRTOJuQcmciOswocY+/HzhSc7pJMjAFpW8MFvRzWrxXrHL
         a980K9O6qb+wvikyaMpfAD+9qxFTHO9Qsyz8e51me4aGWYjfhCqay9xM6cW2wuzwpgwF
         DkNk985FJivEZsIIfm/sICqlRbXSExMhhjF7z3J32E6GOwMxrKvozXupAQ7waBgiUOv+
         a/uj4VyThPmkd1nfids7ImkKXDNR7Fq1Nv1w7QuNGbeULE3XeFKc9fZjbAseObfGpN+2
         56wWxeKxQyERoeK6dx0anNaLID2rtlNqHF9QBJwUqa8fVv7qr8Mvy70sURzKnic8Jwvm
         i40w==
X-Gm-Message-State: ANoB5pknaNDSRnetUe095csM1Q+cPEm3K5Y+P5pfv6lB+xyKiI+E0dtj
        OMKOWzAUIPsjHWdjcbWd5Kpkng==
X-Google-Smtp-Source: AA0mqf5bsvN6t916su3JhYhq1Z8++hWXdyWEbPhMmOtVCvinfLd2TxCbGNZ6yrEJEBeEg+NIA3y/WQ==
X-Received: by 2002:a05:6512:acf:b0:4a4:68b7:dec0 with SMTP id n15-20020a0565120acf00b004a468b7dec0mr10439992lfu.28.1671236262850;
        Fri, 16 Dec 2022 16:17:42 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c19-20020a056512325300b004b5adb59ed5sm341228lfr.297.2022.12.16.16.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 16:17:42 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 14/15] arm64: dts: qcom: qcs404: add power-domains-cells to gcc node
Date:   Sat, 17 Dec 2022 02:17:29 +0200
Message-Id: <20221217001730.540502-15-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
References: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As gcc now provides two GDSCs, add #power-domain-cells property to the
gcc device node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index ffc4b081bb62..b72542631337 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -729,6 +729,7 @@ gcc: clock-controller@1800000 {
 			reg = <0x01800000 0x80000>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
+			#power-domain-cells = <1>;
 
 			assigned-clocks = <&gcc GCC_APSS_AHB_CLK_SRC>;
 			assigned-clock-rates = <19200000>;
-- 
2.35.1

