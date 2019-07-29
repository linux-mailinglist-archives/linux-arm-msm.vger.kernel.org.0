Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59441790F3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2019 18:33:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729097AbfG2Qd2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jul 2019 12:33:28 -0400
Received: from mail-vk1-f196.google.com ([209.85.221.196]:39537 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729096AbfG2Qd0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jul 2019 12:33:26 -0400
Received: by mail-vk1-f196.google.com with SMTP id o19so12141100vkb.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2019 09:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=a/t4nyA1Q5Ire67bzt1cmZdzjlm5dY9UznxFZlUXgxs=;
        b=cJ+QBiHtj4joLDdWo3ko8KyT7anFWu3nS4m2R2ggcQLExoCvgemhSOm4R3MGuuAS+R
         UUhc3FfMLQFaMQgUK+4pz2vGHUcoT733fpPJWC4x4SfKh57m73DCBNz2hmcx9rBziXUg
         edFE+J9YCSGbq4oUZUl4T7C5YbRj+6BQ+d2hMJVE07S1s642wHolqPQPivrxotpNlkus
         9nDE/wQb2YGhOMUK6aHNATji2FQZfwxOlPW6lRM+E0eAE0vN9vED3F6wfKgQCXumybj+
         ekk40r5L0I1F6AfGNmDiOJAI3mU/o4QQJQrdGoQkswdjtUNiQzqdTvk3PkHCozetl/C9
         ka/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=a/t4nyA1Q5Ire67bzt1cmZdzjlm5dY9UznxFZlUXgxs=;
        b=VsKmV2ORabqbiqiE8PpJ+zWiL3MPoezKcBUZO1FFskGNp2VaWkz3mYatgDO8UwGc4W
         L4HQA3HU3pktsuToIMuNbvywhN52Qvs5WRKCw5izewSMr5zeYEbDbWa6beWJfT+cRx6c
         4iXz9/CEuBrRtUtVBN9HgejqqHXuaG2FiuNRGyJmBlhKgDNdXflHeFaB39+dWfj3wSu8
         upC3pHpeiJLQOUQ0VeVd/3mJMS+eI1iIqwH7iAvVJLpuVINBMePREUTq/3cDn7ItOkI/
         A0IFljicGVV0Ys6osh0ffvLO7nGn2gai3mtA0h/pon9GXagFw5fDYnYqHcchAl4IHMBR
         IhJw==
X-Gm-Message-State: APjAAAXZ2yUcWyYOb4Q3OjX5l4m2tXcst4Fe2KP7lvJw8/CHaONR7a/s
        2v8Lg17K8CFewIHGRfzEU7OsRYzZoVw=
X-Google-Smtp-Source: APXvYqxruim+XfgMG1TgZXYZ4llcXHm+qO2F5Xfw42zvdX1iAL6Pruu/xnt08WS99QNb5hXXF7Tcpg==
X-Received: by 2002:a1f:b552:: with SMTP id e79mr26613652vkf.90.1564418005133;
        Mon, 29 Jul 2019 09:33:25 -0700 (PDT)
Received: from Thara-Work-Ubuntu.fios-router.home (pool-71-255-245-97.washdc.fios.verizon.net. [71.255.245.97])
        by smtp.googlemail.com with ESMTPSA id o9sm39762738vkd.27.2019.07.29.09.33.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 29 Jul 2019 09:33:24 -0700 (PDT)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: Extend AOSS QMP node
Date:   Mon, 29 Jul 2019 12:33:21 -0400
Message-Id: <1564418001-24940-3-git-send-email-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1564418001-24940-1-git-send-email-thara.gopinath@linaro.org>
References: <1564418001-24940-1-git-send-email-thara.gopinath@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

AOSS hosts resources that can be used to warm up the SoC.
Add nodes for these resources.

Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 4babff5..d0c0d4f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2411,6 +2411,14 @@
 
 			#clock-cells = <0>;
 			#power-domain-cells = <1>;
+
+			cx_cdev: cx {
+				#cooling-cells = <2>;
+			};
+
+			ebi_cdev: ebi {
+				#cooling-cells = <2>;
+			};
 		};
 
 		spmi_bus: spmi@c440000 {
-- 
2.1.4

