Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F38DB3BF347
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jul 2021 03:06:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230121AbhGHBJg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jul 2021 21:09:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230123AbhGHBJf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jul 2021 21:09:35 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6FEEC061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jul 2021 18:06:53 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id i94so5264840wri.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jul 2021 18:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L18azrwFyoptGIEYIWz4nD01VfhinXc3JMH8ke/EdqU=;
        b=zSlPWvWxFWwStd4svDYpSPO9zLKhhIY5gWm22oVhQLDexG7e2eDmlQa2OWAJPlcUO3
         Ym8U3mixkQVLfYIUPj8YO8yhx9wEc6OvaEEKFF/eGQZj5id4H7/yJ9ZUpZsmpePKYH9w
         tax5mgo3+mLWYy6dInoslXduTgWFX1J3RgLsV2C3Jw5IgK8wV4s+mbXovaSiGc1GKl8E
         /4vq4/Goo8WjfGf9B4StmqcOkPT7taoYKeqeoEjsBOs6wYRaUyK367IIt0fJSUOmnGKe
         RKB9G3eyF0D7K/Qh3r4nkaum4uovIicNGL/98jZDoSsEzYbzUC9SujdVxmqpRFhE5F5z
         S2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L18azrwFyoptGIEYIWz4nD01VfhinXc3JMH8ke/EdqU=;
        b=EfUpL6qEzn+FyEgqASsdiPwrWhaMBo39o9xR5krjYbI/+XsbOv0/KaqvJAcwEHg9gT
         jLRVQY+n9mdk0jzM1KW3pO2gI8lPtoFIQyWZPQ8GbwpEyFG4hhueCi8t6ekgd9RqF7uR
         tDO3WmBoNC9PLmyXYVfbOvUDUAlSjNN4iyWj0jcRB84gCOaG556dbcSrgEzfYwIWKReJ
         GVPHMZf69PiiU8MSNSINDAI+JZC60J72SmeSPOtE/IDGDNVa8xyvDKNNWWB3FnqWKWpS
         6WfQGte9sq6TqLhmVPqcyVpQuUMutmeiemXyJOC7FCBE8XpMtghU6ptuhTY8RuO9VGxx
         la6g==
X-Gm-Message-State: AOAM530vxXcjdNXWfXrRFLge6PplAWe2uKSeOfQvXxKMv8dndSbnKk76
        QhsnD/iOE2tRIzSeoCbDbDaXnw==
X-Google-Smtp-Source: ABdhPJzg50KqYsEHqX3lE3nbmxnrv+KURkb3on0jHu8a+ew9DdZx8yJ6m/SWiyxWjjXbpBAyOUr6iA==
X-Received: by 2002:adf:f346:: with SMTP id e6mr13838777wrp.28.1625706412517;
        Wed, 07 Jul 2021 18:06:52 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id g3sm537368wrv.64.2021.07.07.18.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 18:06:52 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     dmitry.baryshkov@linaro.org, jonathan@marek.ca,
        robert.foss@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH 2/2] arm64: dts: qcom: sm8250: Add camcc DT node
Date:   Thu,  8 Jul 2021 02:08:39 +0100
Message-Id: <20210708010839.692242-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210708010839.692242-1-bryan.odonoghue@linaro.org>
References: <20210708010839.692242-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the camcc DT node for the Camera Clock Controller on sm8250.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 4c0de12aaba6..7ac6ae50779c 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -18,6 +18,7 @@
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/thermal/thermal.h>
 #include <dt-bindings/clock/qcom,videocc-sm8250.h>
+#include <dt-bindings/clock/qcom,camcc-sm8250.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -2369,6 +2370,19 @@ videocc: clock-controller@abf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		clock_camcc: clock-controller@ad00000 {
+			compatible = "qcom,sm8250-camcc";
+			reg = <0 0x0ad00000 0 0x10000>;
+			clocks = <&gcc GCC_VIDEO_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>;
+			clock-names = "iface", "bi_tcxo", "bi_tcxo_ao";
+			mmcx-supply = <&mmcx_reg>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss: mdss@ae00000 {
 			compatible = "qcom,sdm845-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;
-- 
2.30.1

