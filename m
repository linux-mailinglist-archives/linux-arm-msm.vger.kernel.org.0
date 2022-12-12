Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0F1664A4DD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Dec 2022 17:36:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232594AbiLLQgL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 11:36:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232446AbiLLQfy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 11:35:54 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E4ACB489
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 08:35:48 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id p8so274881lfu.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 08:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ia4cA1vx2IqyP/QEu1kChdMwB4AXGKKPR5Tc1iQGBb4=;
        b=Wj8ap0z92hjS0ArFWMRRVGwdGepOjJyro25gBudd4/DtxMZxKopgJFN5VpyeHRZzrc
         G1KbCv49L6QvF3EvMJBwVkNeIDMMZiFi7C4vGWTpR/NdA9NbyHRq4sK6LzciZcj86Pf1
         357uNPwa/rIiTVbJY1L58R3RxtIwhQTJEztpsKyVUVwKToeRZxOV+PhT2SK/zUKGF4hD
         cSmo8PNUkvApENCVCeZ1MKmfqr4Az8quq4e5agy8v379Y85uHgVgH2+oU+W2h78Xz+Wp
         FzCzCdskV5RTRaEnHN+CoButmUXP6n85fLk5XbibwTWIGPEagrqidjVBweTjIgZPIWKj
         6xjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ia4cA1vx2IqyP/QEu1kChdMwB4AXGKKPR5Tc1iQGBb4=;
        b=11cN7MGGUQwqKfG4lh0kFFBb19s6qjdajU3SUIJlig+Ie4hjsZLwkIwtSGmuSzDrIa
         ZpFUWMMpeyuLCfsi4VnhIQiYqrZtw9XfjDPwbBfX7AXfRKmd+EKbmAy6QkRUKxkwwt5e
         fgk26HyAP5g1bviCuW2RAF61Vsa7cpDcAyl4cK8w4OdqGnn8fOiOCDINwNCIL5AMSaKi
         7P/0ZU5XfilzePA1rIJqW+pt9+3JNM+1If+r1zSkdrS6STXqFiApxwMKOrdO0zZbI/jr
         7ro1/F3MAnJuX+1gmccqDq8atXFNStTVlNm6/UIBwKo8RNXeGWIINM7uzrdbv3Q4Gepz
         SCbg==
X-Gm-Message-State: ANoB5pkPgKGSE7IAJwkfGvsTB0y6dCZ8sQbN/OX10go6VsfeHPG9I4Xt
        W2xMETnJ++AwMDqwZtOhQLHntA==
X-Google-Smtp-Source: AA0mqf5yS6J45ME+qXzRRzbYXdNI+r9KZMvU0IsBsr6ZoB/ftlP2ZdQuAvPCGwcvdvj3Lnp3RPzb4w==
X-Received: by 2002:a19:f610:0:b0:4a4:6af4:43b7 with SMTP id x16-20020a19f610000000b004a46af443b7mr3838171lfe.69.1670862947622;
        Mon, 12 Dec 2022 08:35:47 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id v16-20020ac25b10000000b004acff58a951sm29209lfn.133.2022.12.12.08.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 08:35:47 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 09/12] ARM: dts: qcom: ipq8064: drop second clock frequency from timer
Date:   Mon, 12 Dec 2022 17:35:29 +0100
Message-Id: <20221212163532.142533-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221212163532.142533-1-krzysztof.kozlowski@linaro.org>
References: <20221212163532.142533-1-krzysztof.kozlowski@linaro.org>
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

Keep only one clock frequency for timer, because:
1. DT schema does not allow multiple frequencies in such property,
2. The Linux timer driver reads only first frequency.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-ipq8064.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
index 9daafe9de02a..ae018a7dc6fd 100644
--- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
@@ -562,8 +562,7 @@ IRQ_TYPE_EDGE_RISING)>,
 				     <GIC_PPI 5 (GIC_CPU_MASK_SIMPLE(2) |
 						 IRQ_TYPE_EDGE_RISING)>;
 			reg = <0x0200a000 0x100>;
-			clock-frequency = <25000000>,
-					  <32768>;
+			clock-frequency = <25000000>;
 			clocks = <&sleep_clk>;
 			clock-names = "sleep";
 			cpu-offset = <0x80000>;
-- 
2.34.1

