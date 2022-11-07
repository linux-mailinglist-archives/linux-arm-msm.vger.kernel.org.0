Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D300620439
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 00:57:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233067AbiKGX5i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 18:57:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232897AbiKGX5O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 18:57:14 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AED3286C2
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 15:57:09 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id cl5so18495872wrb.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 15:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lWf+1tPKxrizfVKbVIwm+ElM3zRx4sxO8we1amX+jKQ=;
        b=k98/M07ggH+yKl8QsTnSyy7Brep1w9rZmqV/B8rOq31DbRKp+IzTDi0sQYKUSRDgwV
         OXpvAbmzwVqQRfmwwk6S7F/aUpzSFxORr6Gw42GJFr55ccsOT1zoinL3OsZwV5PUCxiW
         mW9WzsSxo7Gxq6qZCZ60a3o2BZL4Z2/z+8vQ2H7+MsGb3t5UU7dJi0vYNPGZY8/whmTF
         wIRFED0mfUM+XhilicoQnAONcNjacyFzMDrTYtd1Hk5M2eoj/Vdg38t+yGdV7dF3q4s0
         JIBiBKz8eF7A/jdRtjk5vaWFbLBhP00DE8KciEMkYDodzI7cGqWvBPoG8KsxKOZfwrq1
         iOCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lWf+1tPKxrizfVKbVIwm+ElM3zRx4sxO8we1amX+jKQ=;
        b=rb6OCmcPULZ0HzZGyyJw1zLg9dBcoK7sCOe6F/Wovgk5iaNmWIcnGqE00k2hTxMZRX
         v7CjGGS27fOjwV5Rr/khShxzfuPkKwH2UkwkJNo0YxXW+ZhFMIWEubPzkd+mIMTzwXDV
         ePfpnyAL4Fr5ETbIc/J0z3DvBy9imvdPS2CrvVad+NKjD+yiF7x9wcHLDUMHh0FBP6Fg
         T62EwgOAIo3yXGEa73TJJN0Ww2L1FJaHge8aQXnlCoLbefKmQs3zdFcPy572XLfUbwS0
         2FC6HcSSx1sZg5EjSRJ1TSqJPs8dQyVtuTVtt5kgrHSE8UPf0oPVtxdixm6ClZfy2EzL
         21wg==
X-Gm-Message-State: ACrzQf3uS/sPDreqqVGu1/B6X9Hp2TMB8AlzUkrK9AAcBijNTl0VceCX
        Rsui8/rVX18XYbrEL6h0KiFovbhBNNjQ9A==
X-Google-Smtp-Source: AMsMyM6nxLrc2eoPrME67OOAx46N/5mfNKipwhQAg1Tr6jW99dcQjsrfFD2fCY0wDx8tfUxkDnHGsw==
X-Received: by 2002:adf:e748:0:b0:236:e034:b024 with SMTP id c8-20020adfe748000000b00236e034b024mr24566167wrn.314.1667865428155;
        Mon, 07 Nov 2022 15:57:08 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id b18-20020a056000055200b00236545edc91sm8386161wrf.76.2022.11.07.15.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 15:57:07 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, quic_mkrishn@quicinc.com,
        linux-arm-msm@vger.kernel.org
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 11/18] arm64: dts: qcom: msm8916: Add compat qcom,mdss-dsi-ctrl-msm8916
Date:   Mon,  7 Nov 2022 23:56:47 +0000
Message-Id: <20221107235654.1769462-12-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
References: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
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

Add silicon specific compatible qcom,mdss-dsi-ctrl-msm8916 to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for msm8916 against the yaml documentation.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Stephan Gerhold <stephan@gerhold.net>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Amit Kucheria <amit.kucheria@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index c1d8a1b388d27..febd151318a23 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1021,7 +1021,8 @@ mdp5_intf1_out: endpoint {
 			};
 
 			dsi0: dsi@1a98000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,mdss-dsi-ctrl-msm8916",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0x01a98000 0x25c>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

