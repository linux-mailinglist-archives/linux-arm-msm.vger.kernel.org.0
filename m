Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 319BC655FE6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Dec 2022 05:22:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231653AbiLZEWi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 25 Dec 2022 23:22:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231658AbiLZEWN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 25 Dec 2022 23:22:13 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8E0E5F43
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Dec 2022 20:22:06 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id bq39so6883125lfb.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Dec 2022 20:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oaGBZm9XOHdhHqe4KYTQ28e7yXtOmnBOw61TUxGxm5k=;
        b=qLsODe8ZuxYPrZAbOtyb38xp9A89wzwHpEyrUQYCs6ckZrrWVMhGl8dZCPZOTGH8eR
         m7BqgjioD8Fej5vIysG6MkdS8LSVZsfsmv2aMnOrC7zEdEWWFnHWRa81vpepshAmrE4N
         e9v0Eda3CvBhEffCGSxZuZHiqAlYsDfRV55NaVs0vuqGIRfpsPEWM9emzRJ4iA4AYdle
         4//qzUqXQsWrMB29Fz0Dtruv1OOeB5AXoJHKNsX3ku1ouUx/9SWqnwrfpDWq5e6Yhm+x
         QAdfQqT/u1vQuukvy629JLDf7M9Pe/WCd7iMtzAFFE3LXhtdBd0KzDqEZyuhon382ePH
         8rfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oaGBZm9XOHdhHqe4KYTQ28e7yXtOmnBOw61TUxGxm5k=;
        b=5d4QHlZHq47qW0mnAEyEewr1T9o8oyxuHe0uaW2IY5NYuqc6kBnmBF27Sudx446VSC
         fNY+GJExRIRNiQ8Px0je8QlE0o2Y1Msb1RmZlpFkQPG5ROJecgN8OO4z7EMgKtp/HHaX
         AK6Ci8EU+3Ug/la5PbdLmCsVAN5x3NSI43kiQyfx6fmS4VHTih6O/1MIy9X4xi4bsx/h
         pEyvlvCzMSmHftu/t7uwOjo3/MsJn/vBH/LpAMexrdMEkonu0Dx0lDKkqSRa+Rk2LCZL
         0c4V5phq2Mlkr2p7Bw1J2zI/x0JGIu2QBp51uBzCNz7M11oaYVNRnNHpETHnpOcemRUD
         SF6A==
X-Gm-Message-State: AFqh2kq791r1ELLZ+UO3w1gQxLO3slMLBKBeG35odJpdbRpXJo9ui7F0
        rt5fm6QLDn5QVyrhJwTTRhIWUA==
X-Google-Smtp-Source: AMrXdXvtiRo+vqrragM5g1xfti7wxlrI/SLa8CIobg4X6HXpizWrlLQhDUPkAHap8ev/H68xOLQXYg==
X-Received: by 2002:a05:6512:1094:b0:4a4:68b9:19e7 with SMTP id j20-20020a056512109400b004a468b919e7mr5402453lfg.15.1672028526406;
        Sun, 25 Dec 2022 20:22:06 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id o9-20020ac25e29000000b004b4b5da5f80sm1641129lfg.219.2022.12.25.20.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 20:22:06 -0800 (PST)
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
Subject: [PATCH v2 16/16] arm64: dts: qcom: qcs404: add xo clock to rpm clock controller
Date:   Mon, 26 Dec 2022 06:21:54 +0200
Message-Id: <20221226042154.2666748-17-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221226042154.2666748-1-dmitry.baryshkov@linaro.org>
References: <20221226042154.2666748-1-dmitry.baryshkov@linaro.org>
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

Populate the rpm clock controller node with clocks and clock-names
properties.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 9206ab13977f..4721b3139df0 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -230,6 +230,8 @@ rpm_requests: glink-channel {
 			rpmcc: clock-controller {
 				compatible = "qcom,rpmcc-qcs404", "qcom,rpmcc";
 				#clock-cells = <1>;
+				clocks = <&xo_board>;
+				clock-names = "xo";
 			};
 
 			rpmpd: power-controller {
-- 
2.35.1

