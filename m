Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E40E02F89E4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Jan 2021 01:24:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725854AbhAPAYa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 19:24:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725833AbhAPAYa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 19:24:30 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C293C0613D3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jan 2021 16:23:49 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id 23so15722012lfg.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jan 2021 16:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TvLCs8sLMAUpdnN+6kzCgxJCo3Pys1RW0I649Aw4wwM=;
        b=Kjo1yhXFU7U1p1nJ5sxo1afiYdbroqieR9NeQk/+ssqvcol75z4ueSbfwlBjsDEg1E
         nYGNGZCmddX2gKj9lgjTwg3AT6wZWC9uLgUbKvnxuiuxh6feUSJPHRFRohrbfm3ihsON
         P9d5+7xXRGc4XZ8QIkJm0IBIkcLXFsDuV9M0x6zlRPstjEBet5Qebl+QCqBJWl47H0sf
         KnS91Z93D3Kc5/NYNuinETH1E6R0b+VM21vwWMewdmVAnBp/I6a9SyXlHRRoBx2c+zzk
         XWJbSgYclwPD5mf4agMbn14cdC9KI2DpYuo3Kbjlu4jWHgokdHw1x0/Vc0dom3bixXZH
         FPew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TvLCs8sLMAUpdnN+6kzCgxJCo3Pys1RW0I649Aw4wwM=;
        b=Q1Mw+wL9Ejex3cJ7TGpTtJKuMi+1F46brxJ9pTR/IRRyVjg5ZNgq42FjZe9azDQ9J6
         dRE5AHd1Xkt1m3t9rhYF5g893WtGNq39ta9FyJR1M7mfg6p2VTH8fqNor2pz8pZAypV6
         vHAHsJPRpBvvqIv0/3o8RauqXAoHHYsirMVHDc+Xa1e1e7byu3BDoTmOuBHSLvnJASzx
         5DTnsj0m2Mxx9fvI4Yw83IJ/v9MYYa7vBOA2Ah2GhULqKYdGWf9gpjoItfUuUf4mPmJg
         PsKGQY+rHOq5vKqvqd8nTz9He1YLCBe1MNfLJ/KbVhJOCPaURCKjyE34DToaI7S/nzIp
         ZuJA==
X-Gm-Message-State: AOAM532RZ7lSsNmI6U4TjTkbL7YtFsWpi+m0rJCcSeQUcTyy1UZdxt9Z
        MD9W1kTxX08xNmQGM/nO8C8U61QFySQ1EotC3bA=
X-Google-Smtp-Source: ABdhPJxa3a13E5So0CqpKS+4um6HLpxbRfkXyOIOxRhz46Brintd5qzpc0t567ON8L8nhVAkiasqVg==
X-Received: by 2002:a19:848f:: with SMTP id g137mr6448864lfd.622.1610756628019;
        Fri, 15 Jan 2021 16:23:48 -0800 (PST)
Received: from eriador.lumag.spb.ru ([94.25.229.245])
        by smtp.gmail.com with ESMTPSA id l21sm941633lja.35.2021.01.15.16.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 16:23:47 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: qrb5165-rb5: sort nodes alphabetically
Date:   Sat, 16 Jan 2021 03:23:46 +0300
Message-Id: <20210116002346.422479-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move swr0 device node to keep alphabetical sorting order of device tree
nodes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 40 ++++++++++++------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 4a0c3edf87e1..a424595da8b0 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -664,26 +664,6 @@ &sdhc_2 {
 	no-emmc;
 };
 
-&swr0 {
-	left_spkr: wsa8810-left{
-		compatible = "sdw10217211000";
-		reg = <0 3>;
-		powerdown-gpios = <&tlmm 130 GPIO_ACTIVE_HIGH>;
-		#thermal-sensor-cells = <0>;
-		sound-name-prefix = "SpkrLeft";
-		#sound-dai-cells = <0>;
-	};
-
-	right_spkr: wsa8810-right{
-		compatible = "sdw10217211000";
-		reg = <0 4>;
-		powerdown-gpios = <&tlmm 130 GPIO_ACTIVE_HIGH>;
-		#thermal-sensor-cells = <0>;
-		sound-name-prefix = "SpkrRight";
-		#sound-dai-cells = <0>;
-	};
-};
-
 &sound {
 	compatible = "qcom,qrb5165-rb5-sndcard";
 	pinctrl-0 = <&tert_mi2s_active>;
@@ -780,6 +760,26 @@ can@0 {
 	};
 };
 
+&swr0 {
+	left_spkr: wsa8810-left{
+		compatible = "sdw10217211000";
+		reg = <0 3>;
+		powerdown-gpios = <&tlmm 130 GPIO_ACTIVE_HIGH>;
+		#thermal-sensor-cells = <0>;
+		sound-name-prefix = "SpkrLeft";
+		#sound-dai-cells = <0>;
+	};
+
+	right_spkr: wsa8810-right{
+		compatible = "sdw10217211000";
+		reg = <0 4>;
+		powerdown-gpios = <&tlmm 130 GPIO_ACTIVE_HIGH>;
+		#thermal-sensor-cells = <0>;
+		sound-name-prefix = "SpkrRight";
+		#sound-dai-cells = <0>;
+	};
+};
+
 &tlmm {
 	gpio-reserved-ranges = <40 4>;
 	gpio-line-names =
-- 
2.29.2

