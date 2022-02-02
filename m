Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C5E64A7A4A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Feb 2022 22:24:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347691AbiBBVYs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Feb 2022 16:24:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347570AbiBBVYZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Feb 2022 16:24:25 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C9DAC06174A
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Feb 2022 13:24:22 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id h125so569413pgc.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Feb 2022 13:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Cn5bTxD+y0u/cuoyspIF5KY9HBsgsURj9OKkTRdQlHM=;
        b=SNurvubUTpRw3jzJLUyEpOcSnGu3nC0+AdjsMxlqqRXoBD3zWOBMjvfFONFTi6JaQU
         yes2UUkv+fyfGE3KDXCTqUGNQlzVoRNqF9RjMBytTsNSDsLqGiFbpl/gxYhTT5bs0R2y
         xYPK8kMKrBTPYhmML8aT1i61Zwfk6+eLXzp2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cn5bTxD+y0u/cuoyspIF5KY9HBsgsURj9OKkTRdQlHM=;
        b=REUFUG66dHp/GLB5NNK0WTMdcVC92KFPn6K+jof9jtp++ulyIXfAIz8doIpyuiNp5a
         w4CNZoqNlfwt/eE9LFm2A6fhh3+v2Ssb0kmrmBYs0JySsn0w4oj9o0rkRhQ6T60i75U0
         u0q/sYgrp2GS421S3gkPm2xXADDVUjkaSN5h/kADDwwvvZWBNNdok9B2grYRCiwE8w2J
         OSFvCobRHfOEle+NnHMgLIbmhoAlTzs2eKVck4PnaVI1uvyy31PitZPQWiCaDqE0Rs8s
         LK/i76Uc+/ScrHy9/q+U1jk8MOP3S0Si2wgcjWP7J10Tdbrb2bk7uH96YbYOh5d5ZcQn
         OuwQ==
X-Gm-Message-State: AOAM5311lIWHvrD9blRve6n2RANavfBsztq2IVjoUfPF2Hw827qCg+8g
        2GrkL3hMZk3JrLZebRsAb5rJiQ==
X-Google-Smtp-Source: ABdhPJzxTbAGRg1diy8LkKtzJUjrTUGZT77WrRaGr4wMKnEH/SV3zdH93xFEfOcrDNhBgXtzcW6eiw==
X-Received: by 2002:a62:1643:: with SMTP id 64mr31080879pfw.55.1643837061733;
        Wed, 02 Feb 2022 13:24:21 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:f1c4:10b6:b4ef:16e5])
        by smtp.gmail.com with ESMTPSA id on9sm7627983pjb.16.2022.02.02.13.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 13:24:21 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     pmaliset@codeaurora.org, mka@chromium.org,
        quic_rjendra@quicinc.com,
        Shaik Sajida Bhanu <sbhanu@codeaurora.org>,
        kgodara@codeaurora.org, konrad.dybcio@somainline.org,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        sibis@codeaurora.org, swboyd@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 08/14] arm64: dts: qcom: sc7280: Move pcie1_clkreq pull / drive str to boards
Date:   Wed,  2 Feb 2022 13:23:42 -0800
Message-Id: <20220202132301.v3.8.Iffff0c12440a047212a164601e637b03b9d2fc78@changeid>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220202212348.1391534-1-dianders@chromium.org>
References: <20220202212348.1391534-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Pullups and drive strength don't belong in the SoC dtsi file. Move to
the board file.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- ("Move pcie1_clkreq pull / drive str to boards") new for v3.

 arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r0.dts | 5 +++++
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi                   | 5 +++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi                       | 2 --
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r0.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r0.dts
index 918352c097bc..82c3c8f0342b 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r0.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r0.dts
@@ -826,6 +826,11 @@ &usb_2_hsphy {
 
 /* PINCTRL - additions to nodes defined in sc7280.dtsi */
 
+&pcie1_clkreq_n {
+	bias-pull-up;
+	drive-strength = <2>;
+};
+
 &qspi_cs0 {
 	bias-disable;
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
index 23e656e51904..6e20e8c07402 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
@@ -366,6 +366,11 @@ key_vol_up_default: key-vol-up-default {
 	};
 };
 
+&pcie1_clkreq_n {
+	bias-pull-up;
+	drive-strength = <2>;
+};
+
 &qspi_cs0 {
 	bias-disable;
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 3f9837921c17..a2e3aa6ecdd3 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3293,8 +3293,6 @@ edp_hot_plug_det: edp-hot-plug-det {
 			pcie1_clkreq_n: pcie1-clkreq-n {
 				pins = "gpio79";
 				function = "pcie1_clkreqn";
-				drive-strength = <2>;
-				bias-pull-up;
 			};
 
 			qspi_clk: qspi-clk {
-- 
2.35.0.rc2.247.g8bbb082509-goog

