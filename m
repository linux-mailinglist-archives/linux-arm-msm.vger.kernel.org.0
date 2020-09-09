Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 432F12636F1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Sep 2020 21:57:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726883AbgIIT53 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Sep 2020 15:57:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726714AbgIIT4u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Sep 2020 15:56:50 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB786C061786
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2020 12:56:49 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id i22so5338055eja.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2020 12:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p+ciS2qx7n0ML41xAjv+I0OnFKOUx8aqQW6A20J9zqg=;
        b=YWJGljpf6NqYCyEmRgtbIZnfmxtQRL2RKLYngIzZ2jDJjdidTUCMeZRJMtFhQreFwq
         TP0r1FRpEv/FfCtu3K1RrvWtFR4jWuGk17OJWqe0hUZSwZ4HnUprBNslVduG4uSHy15M
         PJSd2Y+tCUTZovb00YO/d65nK4kHuk6Z+IDk4MkJOWn++H3aqT2iCAd5imuVFnJeopXO
         j7Sbm8Zp/C43qZ+BEcOha8jNMA5rtncsluXZzdlm6oUuxprHTmQjW0esNnGEw/+3shB7
         bUrllq4x3J1hUq6FkGvNrrxfCC218MHDGsvbuYbC88BfzIFK+Dh52hgetyfVgc6G2Qsk
         sA1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p+ciS2qx7n0ML41xAjv+I0OnFKOUx8aqQW6A20J9zqg=;
        b=EL+AwufdjlsswHyXiVAJ79rBwfr84FNhfczCzCpBdcs3fORZfjoozE/mp1dXiHmICX
         DHugRHhrbhzP7zg3YtEVwUCxv0MBHb+KRSdlw9jLduo+Kz14agP6Y4OjMhwHxpmd6z+J
         n7z2dN8GtqCAtmBVSAEgWwIsV/gnkSQqKFO1F7fPkF5reItj0Q6FEjA9RxVmX0t1Ue8t
         ddqVLu4HBDJWsfXLCwO3JWxvM6j0Y1ZcjTdIJgMjd0GMqZqzEZ9P6GuQ8tHu11HbxGSo
         5WGKKiq2xfLuETcweY5Owomi+Fd/Banltyf+HnKZa1j3fWKty6TePDMn9rqHDtykKOjQ
         LC+A==
X-Gm-Message-State: AOAM531eSr94CQOcuiw5L4QpAV7BtE1Gs13X8Tou0vb0KKwNtzjeuMVX
        L5f+lCKh3fNgk7p2WFtzMwEeyA==
X-Google-Smtp-Source: ABdhPJwZbg1ozv4MBW3qXWyJexh1RbCAIMd9u8UwGfFdGj0KXMnOru2pC/yh0FOO9gXyC16imsu3Ew==
X-Received: by 2002:a17:906:e88:: with SMTP id p8mr5705006ejf.134.1599681408354;
        Wed, 09 Sep 2020 12:56:48 -0700 (PDT)
Received: from localhost.localdomain (dh207-97-133.xnet.hr. [88.207.97.133])
        by smtp.googlemail.com with ESMTPSA id n26sm3510870ejz.89.2020.09.09.12.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 12:56:47 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH v2 1/4] arm: dts: qcom: ipq4019: add more labels
Date:   Wed,  9 Sep 2020 21:56:37 +0200
Message-Id: <20200909195640.3127341-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200909195640.3127341-1-robert.marko@sartura.hr>
References: <20200909195640.3127341-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Lets add labels to more commonly used nodes for easier modification in board DTS files.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
---
Changes since v1:
* Drop include that does not exist

 arch/arm/boot/dts/qcom-ipq4019.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
index 3d056aada8d1..7bf1da916f25 100644
--- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
@@ -190,7 +190,7 @@ gcc: clock-controller@1800000 {
 			reg = <0x1800000 0x60000>;
 		};
 
-		rng@22000 {
+		prng: rng@22000 {
 			compatible = "qcom,prng";
 			reg = <0x22000 0x140>;
 			clocks = <&gcc GCC_PRNG_AHB_CLK>;
@@ -310,7 +310,7 @@ cryptobam: dma@8e04000 {
 			status = "disabled";
 		};
 
-		crypto@8e3a000 {
+		crypto: crypto@8e3a000 {
 			compatible = "qcom,crypto-v5.1";
 			reg = <0x08e3a000 0x6000>;
 			clocks = <&gcc GCC_CRYPTO_AHB_CLK>,
@@ -396,7 +396,7 @@ blsp1_uart2: serial@78b0000 {
 			dma-names = "rx", "tx";
 		};
 
-		watchdog@b017000 {
+		watchdog: watchdog@b017000 {
 			compatible = "qcom,kpss-wdt", "qcom,kpss-wdt-ipq4019";
 			reg = <0xb017000 0x40>;
 			clocks = <&sleep_clk>;
-- 
2.26.2

