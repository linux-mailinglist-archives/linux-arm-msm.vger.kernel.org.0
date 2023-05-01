Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCD546F36B5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 21:25:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233224AbjEATZ3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 15:25:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233152AbjEATZQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 15:25:16 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5A4130DB
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 May 2023 12:25:03 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-63b4a64c72bso2016661b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 May 2023 12:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682969103; x=1685561103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+pBeS9Hy93exDLsefkYuUxrFqOWBmhI2jVtFARaSEE=;
        b=AtgDoBpxQSSDh44UdQty/vRuFhtjwIi1zEb7gyHEee8aUWm/K8YfYJM9CHrDpODjT0
         TbBMQEPZ7HzEHk3F6D/+K3gIJOXGljPAQ+G+a8TDomSKajd+E8OaPNrV7JrKrsKrC5PI
         ExR3HZmpzOvSlLK5R9XcpI1WcHIHZ1/UDP/Jl1xaloym8h9kOmm0HaM7t0rnkfrYhnA+
         6XfpXA7JIsocxXAp/kZAjzeZYwa+5tBnPLP9kjJq1I6C40dRtKuEROkqpJQYJgjennxq
         J94v8LRftoRudirrGwZPcGMcCT2KcFIwsoqa1Ivbdg3t7jlqGgPq/S8uFPmG9Pa/YZrJ
         lF4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969103; x=1685561103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G+pBeS9Hy93exDLsefkYuUxrFqOWBmhI2jVtFARaSEE=;
        b=Pchat3Htejf4aNBdB56B0xhJW/yYpow/CN8ug25c6FGqEcjDgzwtY46+UG9U3iUBFE
         SaE9hohD6xoRK5PgsAWFbx8D90hAHGptBf7rSJn4BtTUqghPnYn9+oE00bq5Y7888X6P
         ytaDVHjxtfzph2j420V4s21PKsvQHsGCVAi1vfQMQDw6PlwLr8YcbB2Rz0JXDdCc/0A4
         vUABpSTnsLL/Q0wROQLasEJVvc04JBp/3fK2N4rnCzVL59UuAbqAP7A/J6uNfJaHaApd
         h9s8dkvUd5HBFO8uH2+cZpO+sHDSrOodTr/d+M9C64/uX9kqUeW9lomYqhSJJa9HxQOw
         3oQQ==
X-Gm-Message-State: AC+VfDxfVyA4QAFNHkZvAmrT4GQAUsncdMdkKBLD9i7Fq6DeROvpx/br
        exgWUDQIM28kJ0DKx1zLNlmKHlTtKKER2SoOxlE=
X-Google-Smtp-Source: ACHHUZ6xyg2O1/EMe1Wr477hSgi90x8ELhqHkP3l2KJE5og8af3/3zXZQdVNa2e/Pud+s5N9uRkw4w==
X-Received: by 2002:a05:6a21:1584:b0:f0:b6e3:90f2 with SMTP id nr4-20020a056a21158400b000f0b6e390f2mr17699356pzb.13.1682969102858;
        Mon, 01 May 2023 12:25:02 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1f3b:58fa:39f6:37e1:bb9a:a094])
        by smtp.gmail.com with ESMTPSA id 189-20020a6304c6000000b00513cc8c9597sm17459144pge.10.2023.05.01.12.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 12:25:02 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-phy@lists.infradead.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        andersson@kernel.org, bhupesh.sharma@linaro.org,
        bhupesh.linux@gmail.com, krzysztof.kozlowski@linaro.org,
        robh+dt@kernel.org, konrad.dybcio@linaro.org, kishon@kernel.org,
        vkoul@kernel.org, krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH v9 4/4] arm64: dts: qcom: qrb4210-rb2: Enable USB node
Date:   Tue,  2 May 2023 00:54:32 +0530
Message-Id: <20230501192432.1220727-5-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230501192432.1220727-1-bhupesh.sharma@linaro.org>
References: <20230501192432.1220727-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the USB controller and HS/SS PHYs on qrb4210-rb2 board.

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index dc80f0bca767..eae3024ce003 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -222,6 +222,30 @@ &uart4 {
 	status = "okay";
 };
 
+&usb {
+	status = "okay";
+};
+
+&usb_dwc3 {
+	maximum-speed = "super-speed";
+	dr_mode = "peripheral";
+};
+
+&usb_hsphy {
+	vdd-supply = <&vreg_l4a_0p9>;
+	vdda-pll-supply = <&vreg_l12a_1p8>;
+	vdda-phy-dpdm-supply = <&vreg_l15a_3p128>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&vreg_l4a_0p9>;
+	vdda-pll-supply = <&vreg_l12a_1p8>;
+
+	status = "okay";
+};
+
 &xo_board {
 	clock-frequency = <19200000>;
 };
-- 
2.38.1

