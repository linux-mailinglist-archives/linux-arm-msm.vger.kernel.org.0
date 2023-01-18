Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB6E76717EE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 10:39:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229882AbjARJjY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 04:39:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230306AbjARJhW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 04:37:22 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ED1683846
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 00:55:40 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id r9so10386762wrw.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 00:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TUkyFlJusLSnwIIR/wf8AL5ONjMFRSNPV9rHtyU1Zww=;
        b=NAf6PRUgzKvJUO8QfuTGrMgcpMo8+M42aliYlHmVuYWbmM2f2jZXACU6nRO8PGbRtJ
         uksqyLd0/hoagkwrNZnc9XhksEIn7pbaivNbKo7ThXrKCybbkc8vqVIJb350JYt4wgJh
         JPOFdcCkpsyW+APag+xhQDIZAFbCM7bxKcN0iAuCpfKmlRpueA+inftPj8avYVRu0TD9
         8RIqf4sA2wJAF2QidsB0UR3/Un0Mx5Rzk9LO4Pst02KQVV+bArFbgvPr5/tpgF31TNeF
         qp632+rQzGXIAlsfR7NBo7bb0xObpMc8V2srszSR8Wq1LTMo3thK+hAldNqIaZFMsGxQ
         KVCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TUkyFlJusLSnwIIR/wf8AL5ONjMFRSNPV9rHtyU1Zww=;
        b=4MJIvwDJaoQQ7GxVtFg7Cqhtqhg1i2k02wDzWQTLz4kyKwCe7Yow8UAWe4BxRea9N6
         04iC3s9s7Y52sosfjqcLWFqfg/ncMscSb0zqILe6elxvpwLkMVT3OsEtw3cTLfODLf5T
         2VuJPxUP2xtKHZ1OnfiswXEs4AjUCM11OwJH7mFZ0nITuFCVXq3w+K2eJHnb+OWkCWDI
         DNkrCE7ly74EV/l8klTRs3kc2xun2k952NQf+25qNm/Tn8jyOEe0YkR0GqvYxB2hCJE7
         EszY7iHLzOc1/LDqf8kM2t27xht0x12Sq4toZgpQPOR921O8SC1jBlJGbV7ES7WNb3Wq
         zjlQ==
X-Gm-Message-State: AFqh2krw2NkUnuR0TrniEdTj0BuHcgjPYBLDM7KJNlRSPNTbx5RGEi46
        NlCbaa6kDMdKHNxoW3Pxecw1IQ==
X-Google-Smtp-Source: AMrXdXueWivmk+UIm5eeWgNmUrPIsk+sVehKOBKy2JrxdNgb9uTTXwP3icLfXn0agr0LmCgO1u3zvg==
X-Received: by 2002:adf:e196:0:b0:2be:1ea2:54d0 with SMTP id az22-20020adfe196000000b002be1ea254d0mr4839878wrb.11.1674032139012;
        Wed, 18 Jan 2023 00:55:39 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id m15-20020adffe4f000000b002bdd155ca4dsm16480212wrs.48.2023.01.18.00.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 00:55:38 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 18 Jan 2023 09:55:34 +0100
Subject: [PATCH v3 2/3] arm64: dts: qcom: sm8550-mtp: enable display hardware
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230104-topic-sm8550-upstream-dts-display-v3-2-46f0d4e57752@linaro.org>
References: <20230104-topic-sm8550-upstream-dts-display-v3-0-46f0d4e57752@linaro.org>
In-Reply-To: <20230104-topic-sm8550-upstream-dts-display-v3-0-46f0d4e57752@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.11.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable MDSS/DPU/DSI0 on SM8550-MTP device.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index 81fcbdc6bdc4..0dfd1d3db86c 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -359,6 +359,28 @@ vreg_l3g_1p2: ldo3 {
 	};
 };
 
+&dispcc {
+	status = "okay";
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l3e_1p2>;
+	status = "okay";
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l1e_0p88>;
+	status = "okay";
+};
+
+&mdss_mdp {
+	status = "okay";
+};
+
 &pm8550_gpios {
 	sdc2_card_det_n: sdc2-card-det-state {
 		pins = "gpio12";

-- 
2.34.1
