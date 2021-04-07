Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34728356FA4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Apr 2021 17:02:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353254AbhDGPCT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 11:02:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349063AbhDGPCT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 11:02:19 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F3E3C061760
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Apr 2021 08:02:08 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id r20so21095229ljk.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Apr 2021 08:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UReEYo213vcg++rM9BnCxXvPAz9Gqu2yc6+O99aZXpU=;
        b=t9yU4v5QFQrksboxmgqw9CMDc3UhgK8w4UHj6YAEjjuUlA3SO4xhp+ykJv0YgaITyz
         3Pdf3NFCMzVvv0eypJIvSgnU+2f2n3Cq56lpUguxIW/KX92KPBXyQUDjViBk1wYvLklj
         syAqMQK2rL79Ln/PLRrMFDLbMHGjMiNxJfhN2NeRyIWdgkFtReSHJmGsRg1F2ZNHXdgz
         Lh9BkKyAD40vLGzi3lWY+kpDHuOxxg9n33ACAimjJTsat3A0eniO7TV8ZcQ4IKb+R5dK
         Jyhzp/oN7XKwI4oyByu6BUEbiEOaECCXcLTTlNzIcDxMuSagrGUzNhSFIC29gX9sHplk
         vxXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UReEYo213vcg++rM9BnCxXvPAz9Gqu2yc6+O99aZXpU=;
        b=MzjWU/e1WOlmqRnOOj3+g1djxThOkkNApZvsXvUr294Qz0QBxdpmGcednZTuRb/EvN
         85vU4QdJjwevYTYd3N1ulYdIcDsQmrChQwwvU6SUAV+dtszgMkDwxQQ2grWPQurfOdAo
         StLHIKBcwQEhGLmo+NlFkDf3t6gRyP/tqNAhS7qNWMXslZe41MiqnloS/a2ggFeicmb7
         r6ZPR+doCj+p7jodTWnqsLweMROYxuhNxLuXU4bWjp8YDDfYkuqVYqxJ7qiBMaGeaNmw
         Csz/24U5IzZtlETktCdWi6SZFaK6Zv8hL/g8MWk9nenuo/h051iequCwUSZpCFrH0k+f
         OK0Q==
X-Gm-Message-State: AOAM532jlFyMDhRxwRY/QG3avUAoIR7S3Lv7Nv+CfSNiktaCucnqKdgl
        vpNt7+uxtYjEBJqppX3F6Jghng==
X-Google-Smtp-Source: ABdhPJxSlyf28SdfZfzsSLBQwJ0rK4f8aI77/+PnV7y9HKV9YtL3A4USpqOmNrcRfil2GQu8M9xpyw==
X-Received: by 2002:a2e:a60a:: with SMTP id v10mr2479817ljp.267.1617807724545;
        Wed, 07 Apr 2021 08:02:04 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o11sm2552142ljg.42.2021.04.07.08.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 08:02:04 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 4/4] arm64: dts: sm8250: move bus clock to mdp node for sm8250 target
Date:   Wed,  7 Apr 2021 18:01:57 +0300
Message-Id: <20210407150157.801210-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210407150157.801210-1-dmitry.baryshkov@linaro.org>
References: <20210407150157.801210-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move the bus clock to mdp device node,in order to facilitate bus band
width scaling on sm8250 target.

The parent device MDSS will not vote for bus bw, instead the vote will
be triggered by mdp device node. Since a minimum vote is required to
turn on bus clock, move the clock node to mdp device from where the
votes are requested.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 394973e778f7..60fe2eaf06c5 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2294,10 +2294,9 @@ mdss: mdss@ae00000 {
 			power-domains = <&dispcc MDSS_GDSC>;
 
 			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
-				 <&gcc GCC_DISP_HF_AXI_CLK>,
 				 <&gcc GCC_DISP_SF_AXI_CLK>,
 				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
-			clock-names = "iface", "bus", "nrt_bus", "core";
+			clock-names = "iface", "nrt_bus", "core";
 
 			assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
 			assigned-clock-rates = <460000000>;
-- 
2.30.2

