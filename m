Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 748566BB59B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Mar 2023 15:12:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232599AbjCOOMA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Mar 2023 10:12:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232994AbjCOOLo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Mar 2023 10:11:44 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFDAF8C958
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 07:11:34 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id g17so24500916lfv.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 07:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678889492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qusdMnJtKXxHHTo84EA0+30Zv9V58GsiRSiKQmNr8Hs=;
        b=zgFZqR7x0GtWPc4PQumOON6Ew8LePQ/3a7/31Ppw9LYwp1UWbpGKJJVyNRlQ0A2SwZ
         gsfebe0vVXsRaTsPtFjfm4ZnJXmYgmcnz1SAHfaku7eX1z10TYWmUTfeazy9xYOHsU8Q
         fHe3qTzenTkpWLjVk7zyerjwe1K8VRojiX55XUE/WSOdXvKrD5VCBQwXmJshRPQO9eya
         PTXNJL8f9/VXYZXbN+5GqXpjKD5Dfacx4/PPEziyKLHCy22VXp3Ncl4Tcj2B3M04m6Dh
         w22gtQiAFnJqF3IIGTYk5a1mR02GvxfyDzYmsFwksuh13uBV+1oyncLa+74Dr+pS/y04
         nljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678889492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qusdMnJtKXxHHTo84EA0+30Zv9V58GsiRSiKQmNr8Hs=;
        b=1Z82xBDtv7PJJbLXDPPQfxz9uk2YeiwFrraQIzeBPuP/8PG/kPbxpkxl1SMRN8yFjc
         v3gH+SqkyeFIEi//koC7pNbowkxMZsj/H2dNEkPsUSjDmSUY+NBCjaMSS5HVNkQVWkFi
         DFcvnBIPj0jMgiubYKa3u7I678qsqbfVC3o0nejVOqJB5AbNpoJbB4f/xiAwITZsw15w
         kw/WvGcIXtxCfZWe77oQd7oy/UMMFZK/btjoLNdzKHlMF6Zg26UyytqClA96UVBXjXY4
         9gxbCzhg+MpOgXi2GBVMBJ6M6QAh4G/U6cQ9+6JXrGUN9hbcRKiAxdh8en+mFoOF7fV6
         2wiw==
X-Gm-Message-State: AO0yUKU/eLZPNP7EawNp6H8yDDTmRBomvtyNSZ4ueUX9u8ZJQ3ktLEEC
        /E3lLKKU0N43IPRUcCbeMG7kMg==
X-Google-Smtp-Source: AK7set8a+XycBwtTN0I4eUm4FG1MJlgL5+3RQeTQvLROCgk6npslaReVo7BfakVsDN2gfI3vOns3zg==
X-Received: by 2002:ac2:5623:0:b0:4db:38a2:e985 with SMTP id b3-20020ac25623000000b004db38a2e985mr1909770lff.62.1678889492440;
        Wed, 15 Mar 2023 07:11:32 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id b8-20020ac25e88000000b004e845a08567sm824678lfq.291.2023.03.15.07.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 07:11:31 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 15 Mar 2023 15:11:22 +0100
Subject: [PATCH v3 4/7] arm64: dts: qcom: sc7280: Use the correct BWMON
 fallback compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230304-topic-ddr_bwmon-v3-4-77a050c2fbda@linaro.org>
References: <20230304-topic-ddr_bwmon-v3-0-77a050c2fbda@linaro.org>
In-Reply-To: <20230304-topic-ddr_bwmon-v3-0-77a050c2fbda@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678889480; l=842;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=/FA8iJU+xOaUyv9UYrNahdRUlOvSv0Jd6XSfSid+KYo=;
 b=lrQRuh8qqZeZulRS4E1XsAEx13EVi2LqqCzNULl3s1oWdRuIDyeNEw6VKRUYp3bsk7VsVP3SK2OA
 NlqXWCFhDbEDilq8MDspHfqMXrMNB25MCf85PkQOiZb/zhihU5TJ
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

Use the correct fallback compatible for the BWMONv4 with merged global and
monitor register spaces.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 8f4ab6bd2886..f15fea6cc316 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3533,7 +3533,7 @@ opp-7 {
 		};
 
 		pmu@90b6400 {
-			compatible = "qcom,sc7280-cpu-bwmon", "qcom,msm8998-bwmon";
+			compatible = "qcom,sc7280-cpu-bwmon", "qcom,sdm845-bwmon";
 			reg = <0 0x090b6400 0 0x600>;
 
 			interrupts = <GIC_SPI 581 IRQ_TYPE_LEVEL_HIGH>;

-- 
2.39.2

