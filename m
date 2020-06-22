Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 402A22043A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2020 00:28:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731075AbgFVW1r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jun 2020 18:27:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731029AbgFVW1m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jun 2020 18:27:42 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB163C061796
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2020 15:27:41 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id t6so14559906otk.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2020 15:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=np06MBoJ0AuPrMypeIwHblD2LOFOM+rqs7EtZrEx3Pw=;
        b=r0rg84zIbL8kV63uOUn5+t2IYIe5xGcfcJIXWWbnqpMFBmhHPYvLmbvKLz3bI49DpB
         9GCapPYUnEg2FOGhkvUKxsoUfr7PZ43oOihybXzLwMCVY5h2qfjTnQwjxeSfWIgQ26pF
         amaqn8BNJzRVInEJvpxSJI9ZPQpULYN+d1wZV0Z26Hk6moQY2PvJpfCRqKu7rSqFqwmI
         Z0Hec+pOHqbc+XQ3rSA9P7T3cyRbn7BCfoO8Ptf2Q9IiMBGv0o/t4dv9VrbqJ0WUxpdK
         AmTHI+baqgMXQcoVK3D9/RbbH7ALZISQb87ZFDRlTuZ67MZJTOd72f8KCBKtTVsECcag
         1UMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=np06MBoJ0AuPrMypeIwHblD2LOFOM+rqs7EtZrEx3Pw=;
        b=TzsE7JsDphwJAGs7Vfk0MHXlbCtDHbTGiOhdyUd1DhXdJGCO+L5IaFDHlpx7Jx5c4b
         wXza8wehm3c4JD2SMx6QpcSukZrJvJ+GlpZ1YPPU04URG6XwNnkPKXmCaIsxgw8Ucoes
         4wFzSoKHx+BEGtxGWV4e0WLVWgZNlRKv2H6W3P9TzdbIlpmae3Jjx30WlmTkaTpo7hdM
         49PSW9UqEXYGKHMH+78Ww1s6iNpbvRHdcooZGdMzGbtdsDRoifnl9ZbUJwpBM/jpQTD6
         8TtBJ0MQznQCa6vb2TtSiQH0R8wnZmLjA+rw0rqaCrllQOEevKNkSqQyuOeWM30bmEOY
         0fig==
X-Gm-Message-State: AOAM530+IowWeAhjUAKDbbZ/5I+wueK2j234iiYcZ181HUOIuOEmzfST
        fj/7QxtfQ7gxeCNSzCfKA8xaFg==
X-Google-Smtp-Source: ABdhPJyFaBDzpgqSiNBG+6lr3jq8HwxV1odT6pvGc+rG78De/yGfdOA1I/wF9744YHOjfDcVOHmURg==
X-Received: by 2002:a9d:aaa:: with SMTP id 39mr15107908otq.269.1592864861102;
        Mon, 22 Jun 2020 15:27:41 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h36sm3589304oth.37.2020.06.22.15.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 15:27:40 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/6] arm64: dts: qcom: sm8250: Add QMP AOSS node
Date:   Mon, 22 Jun 2020 15:27:44 -0700
Message-Id: <20200622222747.717306-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200622222747.717306-1-bjorn.andersson@linaro.org>
References: <20200622222747.717306-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a node for the QMP AOSS.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 74a7ca96177e..246e6f279aa8 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/clock/qcom,gcc-sm8250.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
+#include <dt-bindings/power/qcom-aoss-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 
@@ -989,6 +990,19 @@ pdc: interrupt-controller@b220000 {
 			interrupt-controller;
 		};
 
+		aoss_qmp: qmp@c300000 {
+			compatible = "qcom,sm8250-aoss-qmp";
+			reg = <0 0x0c300000 0 0x100000>;
+			interrupts-extended = <&ipcc IPCC_CLIENT_AOP
+						     IPCC_MPROC_SIGNAL_GLINK_QMP
+						     IRQ_TYPE_EDGE_RISING>;
+			mboxes = <&ipcc IPCC_CLIENT_AOP
+					IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+			#clock-cells = <0>;
+			#power-domain-cells = <1>;
+		};
+
 		spmi_bus: spmi@c440000 {
 			compatible = "qcom,spmi-pmic-arb";
 			reg = <0x0 0x0c440000 0x0 0x0001100>,
-- 
2.26.2

