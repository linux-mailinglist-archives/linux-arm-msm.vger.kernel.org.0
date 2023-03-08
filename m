Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A35166B142E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Mar 2023 22:36:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229453AbjCHVg6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 16:36:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230289AbjCHVgX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 16:36:23 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E91E2D30BC
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 13:35:59 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id t11so23134191lfr.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Mar 2023 13:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678311359;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZubkqDM02FAiEq3eW9W/hQGkoIRi+LbMNFc2dkt329w=;
        b=U2+2EA4Y3hZZ4IySjfJI7Rl8yoiGa46ugFf4hmN9QuuP8TmiomTY4CaHr6rB8HomBu
         1d58zX7S00aWHBBZPR/9Qn0NTAtJnx4USs+nIOvlr4IZkdCbpiqX2iFUgWZhVmtjwMhF
         HwjoziRqgFYuPmfsOT0ZS+HAnLTHRS9MNFAqStOd4lVU8TSR8VgUBKPsgLLnr5hZOL/p
         aQQzjQFknH52GZKA90Mjip+qHUNF15Q2GKbuq3ZeRxgpOBgMZ742kRiF0mDniqN3ygUL
         PRE7HiM63+DplQpxJGy+qf4hW3UYDcYevICm0uYsosmmjnr9HSLo2RoMKZKCsi2leuyV
         cWJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678311359;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZubkqDM02FAiEq3eW9W/hQGkoIRi+LbMNFc2dkt329w=;
        b=THUR+r+JHCpdQNvAJZgoxBZ7NwkDEbIg31UIVOTUsaqyjXRhhoKgfsyOJz9wWa7cQo
         F693nRvIVnHTiTtUJ8Wo2UOMP30hXTBFZksSFchrlRAKg1rbjpc0gED11ekrZvUMO1MV
         ZCg5K6upDlbfuRXbh790lhePEPTpUFkkZVJSakOOd4qGfnWG22XK7tSG9WYdQIwy1jz7
         eswmGTkAytP2b3nbMFaDM4Ve2Dm5pusigaggxpEgGgJh3v/uSjZRBYLrXwNrQ6AEqthG
         zasklJ915UhrR67nikzldn0AKByrUKU+AKIY2/BR1k6RvFSupveEmnm0kjN63UTxeXpZ
         xlKQ==
X-Gm-Message-State: AO0yUKW1uCTuV3dUwktDR1/7AypPzdsQqAxmipwX4T4ygVRhylKrztFM
        f9RDTV3tF+75GpvrTeydNpUQ/g==
X-Google-Smtp-Source: AK7set+G3EUNHPXsQ1i0gem4UXH/5P0KEDgfYTdtkCno0b2iCeMPN8kRgDjX9mylfukjLAE3B1WfPA==
X-Received: by 2002:ac2:508f:0:b0:4dd:a5aa:accb with SMTP id f15-20020ac2508f000000b004dda5aaaccbmr5350543lfm.44.1678311359487;
        Wed, 08 Mar 2023 13:35:59 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id u7-20020ac243c7000000b004dc4d26c324sm2467479lfl.143.2023.03.08.13.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 13:35:58 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 08 Mar 2023 22:35:30 +0100
Subject: [PATCH RFT v2 14/14] arm64: dts: qcom: msm8996: Enable rpmcc
 unused clk disablement
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230303-topic-rpmcc_sleep-v2-14-ae80a325fe94@linaro.org>
References: <20230303-topic-rpmcc_sleep-v2-0-ae80a325fe94@linaro.org>
In-Reply-To: <20230303-topic-rpmcc_sleep-v2-0-ae80a325fe94@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678311334; l=658;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=ymIRVOgSTZj4llDzbcFS8Jduc30n2FcF0wczQdKvVS8=;
 b=7LtP5xJlOff5hrptxWCmxeFmHS62ygyBcYYVTgt92Z6PwhXkfshXJ2lTCW00E24p6ufcwyRA44Pe
 zx7PeJN/D0AhenvXl0rkAAO1hHKJfYaoWqp532nuqUb1Ua8I72gw
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MSM8996 is in a good enough state to shut down unused RPM clocks.
Do it!

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 905678e7175d..59451d87cfbf 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -488,6 +488,7 @@ rpmcc: clock-controller {
 				#clock-cells = <1>;
 				clocks = <&xo_board>;
 				clock-names = "xo";
+				qcom,clk-disable-unused;
 			};
 
 			rpmpd: power-controller {

-- 
2.39.2

