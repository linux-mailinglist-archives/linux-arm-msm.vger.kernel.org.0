Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA6F42681C8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Sep 2020 00:51:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725963AbgIMWvn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 13 Sep 2020 18:51:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725950AbgIMWvk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 13 Sep 2020 18:51:40 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93C89C06174A
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2020 15:51:39 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id d15so11353625lfq.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2020 15:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E4L+7WLFzPUiX36L1uk/v6qPi5pVlCFFaxlXSNGIVd0=;
        b=VWrfQ8ECW5VTiMoXSXZeDeDmoPTwWT2u8gEfy+yV7q5uI9FLFgXNXequleWTnVhOSU
         BVcvzC3XHfjpClJzRqb6MlQJo5bd9n9UpdN/E15ni6XGfnVuQMGn1t7uP/KsSHBCiV0C
         Alhb9C+s2EObOVtvF9zO9doy4tjx76roUf3OQ7hQ8A6Q54CLG8JPF83Mof10sbi+s4kQ
         KJ2FXe5FgfC4qFCZk8bgeQd6p6dDOO9h0Vz8oliiW1YIG9xe+EsGp2mxNyA7+bQa8cug
         aVDCMtFiiNMajLaREed3GDu1HbRCv6iHYQ1PiQViMMx9A+PL33ilEm+b+/RgG38HSBTm
         7NIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E4L+7WLFzPUiX36L1uk/v6qPi5pVlCFFaxlXSNGIVd0=;
        b=eqmzQLwYm+eMVuzNgGWzEclW5LWaQzFYVtyvVL2FPj2xw1edPkHyCG/oGCmm1C4sL8
         fCMC92yVmWy98c/4qrbY6UsltS+YxGUbpUrdhw695vgfI/ciJ3trjT07q+6p7w91J+9H
         zVELF/4C1mEkG4RpUsD9rMRrxUsvw9Q0JMRYwzKJO+n7wSgnoIwiGgl78pNLBwXt1Eu+
         lqEHNMZBfcTqUcSGK027cGNban/Q4h4GwL6r6rLNWiQC0uPtrpHdHfeyOnrcezOX+2Qw
         D9OjyydbeZdrayL52jkH7aCLvH0gpIdlTvX6FOzi2XJrzMW34b9h2K9cuE2IWu7fJAUI
         jPlw==
X-Gm-Message-State: AOAM530jQSZu3OcZr1Em7j2JcGdthINSWu36Vg6qw8Dw2OGlWKhsRSSV
        dD43bDcZxeo2BBT5sFtN7V7AMboif4qimA==
X-Google-Smtp-Source: ABdhPJwvPQ+/8tC+t8SVtsX6dOc7rAcT5/ho+uwEs2Id8vNIMYfuI1WTf+KOUAR5bLq7LLeTaq3uWg==
X-Received: by 2002:ac2:46d1:: with SMTP id p17mr4072275lfo.216.1600037498089;
        Sun, 13 Sep 2020 15:51:38 -0700 (PDT)
Received: from eriador.lan ([188.162.64.187])
        by smtp.gmail.com with ESMTPSA id 63sm2852399lfl.130.2020.09.13.15.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 15:51:37 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sm8250: add bi_tcxo_ao to gcc clocks
Date:   Mon, 14 Sep 2020 01:51:35 +0300
Message-Id: <20200913225135.30366-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 91797459d4b2..a2e1af726cb8 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -412,8 +412,12 @@ gcc: clock-controller@100000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
-			clock-names = "bi_tcxo", "sleep_clk";
-			clocks = <&rpmhcc RPMH_CXO_CLK>, <&sleep_clk>;
+			clock-names = "bi_tcxo",
+				      "bi_tcxo_ao",
+				      "sleep_clk";
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
 		};
 
 		ipcc: mailbox@408000 {
-- 
2.28.0

