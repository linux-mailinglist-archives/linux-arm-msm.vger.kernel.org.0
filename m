Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5444C231DED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jul 2020 14:01:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726857AbgG2MBN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jul 2020 08:01:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726353AbgG2MBK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jul 2020 08:01:10 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D342C061794;
        Wed, 29 Jul 2020 05:01:10 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id r4so18412873wrx.9;
        Wed, 29 Jul 2020 05:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IyAadO7Kj4svE/f2q3Z4e23jYOH8YNibv5HEpOFyPnU=;
        b=CD0/QxB9mBf+NTzosNohe42lcZIfXDYQY2Rd8Px+Oer6gRe1nHnWYhJb9NEhK7YMes
         I+ts1dXG8hBbHfd9mnO/E7XwONZAKW8IVDiz4w04gKmxWhAIGQJBqdGDDUu4i3ztH9NY
         hjJyxdSrlIsgs28uOrkub8lkRfmh30CS1LVvWGIrCESwsyZym0p8ePMnvYUTft70fLh8
         8iU1nQSTdzFGRZJfxJPQNftIbaVIAePMWZCZhUk4NsRwmfFABrJbNyc/xXHHEFLft5B5
         /V6DiQj/fz7LyiAjbYxE2wo6hNYYWimJez8Lz45iWADPT9qviqJgxCZyCxPFlnZ3PlAE
         VIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IyAadO7Kj4svE/f2q3Z4e23jYOH8YNibv5HEpOFyPnU=;
        b=tY0UVXcOOqSbHATeTcetOMUeRjY2UKrFEsa8h0mwmhkg5W5e3YhefAiGC35CZuFmGo
         rALC7n4xxvB8G+nZJsYQ352nIQHjoBEzjU+mhDg5zo0kGnakbyXD/o3SolMiJoxYJwB+
         6sB9AUYZnsu5tAvSSQMKQoKqzIGBiPAviA9OIs2sHZrr6BtFb1fNsmZjUY47IjszTPj/
         BNyCr7TFmSixXaa4HOWzu0L2lue3/jVWIrilWAyC/QERt//t3iX9B3lVaHHiAi1vTZm7
         +dBlFWbyWoK89EhVhQx/Upn+R2iX+2zsPY29F3yVdKOTmxpgEqOVsMz3E5vhJptTKR0b
         8tag==
X-Gm-Message-State: AOAM533iExWNhKO46f36I0dkq3ALbmZqWderUhWuamdpjlFaqncL6X8g
        4utcVb6QMwyUh4FzXIlrUnw=
X-Google-Smtp-Source: ABdhPJzVKTxrC7sh1y9rKVLz/vxh3ZwFojV3ITq1aNkQcsq7vM+n2G7ZMwHh29wRW0wbDw2mF6tDuQ==
X-Received: by 2002:adf:9c8c:: with SMTP id d12mr28786755wre.369.1596024069040;
        Wed, 29 Jul 2020 05:01:09 -0700 (PDT)
Received: from localhost.localdomain (abad207.neoplus.adsl.tpnet.pl. [83.6.167.207])
        by smtp.googlemail.com with ESMTPSA id l67sm5426000wml.13.2020.07.29.05.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 05:01:08 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     konradybcio@gmail.com
Cc:     lauren.kelly@msn.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 03/10] arm64: dts: qcom: talkman: Add Synaptics RMI4 touchscreen
Date:   Wed, 29 Jul 2020 14:00:49 +0200
Message-Id: <20200729120057.35079-4-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200729120057.35079-1-konradybcio@gmail.com>
References: <20200729120057.35079-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This adds touchscreen capabilities to the Lumia 950.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 .../dts/qcom/msm8992-msft-lumia-talkman.dts   | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8992-msft-lumia-talkman.dts b/arch/arm64/boot/dts/qcom/msm8992-msft-lumia-talkman.dts
index 3cc01f02219d..c337a86a5c77 100644
--- a/arch/arm64/boot/dts/qcom/msm8992-msft-lumia-talkman.dts
+++ b/arch/arm64/boot/dts/qcom/msm8992-msft-lumia-talkman.dts
@@ -32,6 +32,34 @@ chosen {
 	};
 };
 
+&blsp_i2c1 {
+	status = "okay";
+
+	rmi4-i2c-dev@4b {
+		compatible = "syna,rmi4-i2c";
+		reg = <0x4b>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <77 IRQ_TYPE_EDGE_FALLING>;
+
+		rmi4-f01@1 {
+			reg = <0x01>;
+			syna,nosleep-mode = <1>;
+		};
+
+		rmi4-f12@12 {
+			reg = <0x12>;
+			syna,sensor-type = <1>;
+			syna,clip-x-low = <0>;
+			syna,clip-x-high = <1440>;
+			syna,clip-y-low = <0>;
+			syna,clip-y-high = <2560>;
+		};
+	};
+};
+
 &sdhc_1 {
 	status = "okay";
 
-- 
2.27.0

