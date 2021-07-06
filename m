Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65B133BDF8E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jul 2021 01:05:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbhGFXHz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jul 2021 19:07:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbhGFXHz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jul 2021 19:07:55 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD1EBC061760
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jul 2021 16:05:15 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id p8so823824wrr.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jul 2021 16:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZS9eSBzf7oMT7niMx+DkLzUKHx+ngK5Yq4k0GX/hQik=;
        b=koPKEiSdiRlAQbZ2faLxK3HWhvpvv36DkP+iba3gGnHL8I9hgdexpS9Is/0zvVtQca
         Ryr7XnnBJW/2ZoMrkHFamMjGyrP4Tv4F+t/eaZSjBPwwJiVjBGXA/M+wB3pKvtm4rc1W
         wBqo7ilBtG3qyIxqvYftjZhw+HIZwYx/Q96ukjOSvmlMeZgC2N8+NcT0+cgxukYGNOVs
         l4pJTi7B/BUddwfUCAa7yv+tQHEsFW5yZ60g1Gu8N11CdW0t0EXfOaS4XdNNgoHPdXpV
         MV2kbMzHEQdTd857EfjH/MQ7qVJUOqZJZcEVPaGqkvdN6AL4PLgR3MewlYT++3iSGr5J
         6TzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZS9eSBzf7oMT7niMx+DkLzUKHx+ngK5Yq4k0GX/hQik=;
        b=mcbFXTEwq5P58jFMeR5BtcZRe6NvfGjbvb8znCwzTcpLCpNCCEEtRzSY+YckqPWv+Z
         ARIwxpHXNwiBjtYZg5ScqkgNnOY1iAZey8cY40htiZyr6+X2IQdFs5ji8n3ZQYsgUdqh
         DxzFZyeZBLEweMzB+1zBil57oE/k2qq9+DiQFZ3cO7xQ+6fLhlYxOPhjj6+Bh3Zl01kt
         LF6JXoYP5kXoHzJtRF/evFqgREHZZxkGdCDUVfSSFpoyJfVSo1J2+9dpbmlcaOta9ODf
         7NBpdZ/7VhLJ1VN8m5aF+h0Ebm6Wses/ol/mjmA/LqLVXlayYi+o+Z0RoIlYv++nPjOj
         LWEA==
X-Gm-Message-State: AOAM530NckB2rRl2UzrfABwj3T/vom3qTAur9Q40MAvApah33LK77Nlx
        tHLFTfuZeaCrL55OF59zisHz4g==
X-Google-Smtp-Source: ABdhPJwD7QjJ40WHE2rPUkBAA7dNmwSkssV2IMNCrPF6l8XoprKbp0mUXXzGCJAGhG3niOYAoQkREA==
X-Received: by 2002:a5d:6c69:: with SMTP id r9mr23670257wrz.8.1625612714199;
        Tue, 06 Jul 2021 16:05:14 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id g15sm14241866wmh.16.2021.07.06.16.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 16:05:13 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     vkoul@kernel.org, kishon@ti.com, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org
Cc:     robh+dt@kernel.org, jonathan@marek.ca, bryan.odonoghue@linaro.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        devicetree@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: qcom: sm8250: fix usb2 qmp phy node
Date:   Wed,  7 Jul 2021 00:07:01 +0100
Message-Id: <20210706230702.299047-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210706230702.299047-1-bryan.odonoghue@linaro.org>
References: <20210706230702.299047-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Use 'lanes' as SuperSpeed lanes device node instead of just 'lane' to
fix issues with TypeC support.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: be0624b99042 ("arm64: dts: qcom: sm8250: Add USB and PHY device nodes")
Cc: robh+dt@kernel.org
Cc: devicetree@vger.kernel.org
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 4c0de12aaba6..270d7ff59ec1 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2123,7 +2123,7 @@ usb_2_qmpphy: phy@88eb000 {
 				 <&gcc GCC_USB3_PHY_SEC_BCR>;
 			reset-names = "phy", "common";
 
-			usb_2_ssphy: lane@88eb200 {
+			usb_2_ssphy: lanes@88eb200 {
 				reg = <0 0x088eb200 0 0x200>,
 				      <0 0x088eb400 0 0x200>,
 				      <0 0x088eb800 0 0x800>;
-- 
2.30.1

