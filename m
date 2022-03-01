Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28C144C83D2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Mar 2022 07:15:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232478AbiCAGPv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Mar 2022 01:15:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232555AbiCAGPt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Mar 2022 01:15:49 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14BB866225
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 22:15:09 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id g39so25084351lfv.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 22:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h+L3faZOti6LGcPoY6+HqkRU/QXPVzbe+S6GftVJRjc=;
        b=jC2WabLPwyJ9Uixvql18TZWriXIK6G6CebSQJRe2lm9hiXdDBiRk8pz2zKAdC0XhZD
         qexQ5pTK0OCbHT6Tv+jhjNnE7PRiK8Py1tTWdfB7r4ADwzHIKWyfS1eOSfFWKr0YhGXd
         ZfyhWmfYjTtsAFcMEAxUplb7O+m9WG2Y/rRGim/tnFHAV6N/lKHZmGwUrhFTP1m36Pi/
         HMl3MQFBtxKkDDMU42maXaGX/ZzoF2AtAay3I5iHzL1NNSwe1UNZEDqnJacqfR9b0lW7
         DedHh5jVY0oAhvBG+ukQH8nVD+CtNz+gwvrzSUlnvD1BUX9s6UoZV+4cbEFiHwUDJzFP
         0rOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h+L3faZOti6LGcPoY6+HqkRU/QXPVzbe+S6GftVJRjc=;
        b=iui6EPbwjXDzHfXKJHpJk73wrKBpF1DabjWG459hxZc5A/zeaSqX7E6tz0E3mhPd9Z
         rf6vKWoeMB3xxasHkQPCU5HgbOTl4IdXD6toUEzLprGxeKK0NghCDU1hK3qJ3P8agStg
         1jSwGw8FjQBr0l+FFK5BAC0kuwWcGyo3iBMwUNIPUZcVhUyPSPq4XtFps69ECFLJZvF6
         WrukbI9f0cYMTXOHWem/tC8pDEpIwHnLIsRQzLQhy22qocsuOZsu/yDlAOK7YtnHmizy
         sFXYiho/qsn5IsyeSEVRzeRlI9YO6DXVq3EY7JvtNjlQR4PwfDKtF7qHeAW4LvfgxMiK
         6dQw==
X-Gm-Message-State: AOAM530lxBNyJXX1aJGoax198dnYC6+2azT5Ovz7nBBK4S1WcJtBE7p4
        7vcV66JlJ9xd0iDzAIe3UTL62g==
X-Google-Smtp-Source: ABdhPJzVG2+ic7rlCnFSlHvY5KJREy6Zh9cKvS8YgzMjT/BUdo7wp2HTchOJBqjVJ6VaI76BZpTx6A==
X-Received: by 2002:a05:6512:34d4:b0:442:a9c5:8e37 with SMTP id w20-20020a05651234d400b00442a9c58e37mr14925102lfr.362.1646115307434;
        Mon, 28 Feb 2022 22:15:07 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f15-20020ac25ccf000000b004442220c67fsm1318898lfq.27.2022.02.28.22.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 22:15:07 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 7/7] arm64: dts: qcom: sm8450-hdk: add pcie nodes
Date:   Tue,  1 Mar 2022 09:15:00 +0300
Message-Id: <20220301061500.2110569-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220301061500.2110569-1-dmitry.baryshkov@linaro.org>
References: <20220301061500.2110569-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree nodes for PCIe0/PCIe1 controllers and corresponding
PHYs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index f0fcb1428449..5d6de95a3a84 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -349,6 +349,27 @@ vreg_l7e_2p8: ldo7 {
 	};
 };
 
+&pcie0 {
+	status = "okay";
+	max-link-speed = <2>;
+};
+
+&pcie0_phy {
+	status = "okay";
+	vdda-phy-supply = <&vreg_l5b_0p88>;
+	vdda-pll-supply = <&vreg_l6b_1p2>;
+};
+
+&pcie1 {
+	status = "okay";
+};
+
+&pcie1_phy {
+	status = "okay";
+	vdda-phy-supply = <&vreg_l2h_0p91>;
+	vdda-pll-supply = <&vreg_l6b_1p2>;
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
-- 
2.34.1

