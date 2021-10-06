Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAC33424356
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 18:49:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231317AbhJFQvJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Oct 2021 12:51:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238245AbhJFQtP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Oct 2021 12:49:15 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D445C061753
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Oct 2021 09:47:22 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id r18so10751739wrg.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Oct 2021 09:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LKWPbxLo6mAAF4ujncUu3mf+YPEjPv0VvIo6LHi52tk=;
        b=b0cFkEOTbeIZOXNHB19twXRj6Uy6BxxE8D8nV4mXZNqf/Wd+KUJe3aoc6uBBXMBgEa
         Iso74BsMoYynmpwCliKFodKy8w2/eoknnGdgQf0WIUa3MUB25+vIgEjDbaxW41O0dOKE
         JHY/IzmXd5s2Q4IidHRF3UsNJoVA5aB504GYJMXhigYh62UpGXsHqZOLjv7evvig09DU
         6A08RJbNS5z/XkyKF3SGBH+rhq8Ctv2EL7n00AJvKYENMiffvDNc5eWpAabZX7tUVcpa
         PiyeM+nFdkyTayGwLqVrzz6vDe1bghb5r7PcWWNpztjdKL4hNF5xhH3hPbpncmdvsdEk
         ojcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LKWPbxLo6mAAF4ujncUu3mf+YPEjPv0VvIo6LHi52tk=;
        b=XRTr9p8IP+2pBT8MCLNWNh325V+X6NPkPE96iIPN6hT62gE5QZsiIQprI4S5oCcb/5
         0BuBI7gUTdUu2GOEDFg2JUAz51v9D0mjxEc0LHitc9zUB2HZf4G29oSCU6xEV0kRNy0N
         tQS9fkusoJcgsiXqwQP2loRo1DChITBPbb8bix18dGBgYTzLc9kNniykMKON6XDKG+ns
         u666YO/LGr2G1FNvKmFS47JB42K18PUpxreWncGHgTTntiea/8uzc3qCf+QkexEczm1m
         s3yWBarXYmO0TEXu7K7RXJOB38AUDE63ApzXriUwaIAUG7IbKV5u8XcGbV414ljkU6yg
         N2fw==
X-Gm-Message-State: AOAM533YzHqShgOjK2x7DeABxcPHGExzRa0i9+X0BfLA1S1Qb3zG3zEM
        q3Zw+Ojzp4thG5tqGbAt2IxQgQ==
X-Google-Smtp-Source: ABdhPJwGToLVuGBE9PY+PQTmWcG8RKCHuCuEcbfobRrJm2SCV9pqxUqu5yvmSPbYT3UGSfhBSNMJow==
X-Received: by 2002:adf:f946:: with SMTP id q6mr29798036wrr.437.1633538840952;
        Wed, 06 Oct 2021 09:47:20 -0700 (PDT)
Received: from srini-hackbox.lan (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.gmail.com with ESMTPSA id l21sm6785165wmg.18.2021.10.06.09.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 09:47:20 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 3/4] arm64: dts: qcom: sm8250-mtp: Add wsa8810 audio codec node
Date:   Wed,  6 Oct 2021 17:47:11 +0100
Message-Id: <20211006164712.16078-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20211006164712.16078-1-srinivas.kandagatla@linaro.org>
References: <20211006164712.16078-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SM8250-MTP has WSA8810 via wsa macro for Speaker playback use case.
Add node for this device to be able to use it for sound card device.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
index 9f6cc2fff39b..9b27053ca3af 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
@@ -648,6 +648,26 @@
 	};
 };
 
+&swr0 {
+	left_spkr: wsa8810-right@0,3{
+		compatible = "sdw10217211000";
+		reg = <0 3>;
+		powerdown-gpios = <&tlmm 26 GPIO_ACTIVE_HIGH>;
+		#thermal-sensor-cells = <0>;
+		sound-name-prefix = "SpkrLeft";
+		#sound-dai-cells = <0>;
+	};
+
+	right_spkr: wsa8810-left@0,4{
+		compatible = "sdw10217211000";
+		reg = <0 4>;
+		powerdown-gpios = <&tlmm 127 GPIO_ACTIVE_HIGH>;
+		#thermal-sensor-cells = <0>;
+		sound-name-prefix = "SpkrRight";
+		#sound-dai-cells = <0>;
+	};
+};
+
 &swr1 {
 	wcd_rx: wcd9380-rx@0,4 {
 		compatible = "sdw20217010d00";
-- 
2.21.0

