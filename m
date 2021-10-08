Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8FE34261F2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Oct 2021 03:25:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbhJHB1s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 21:27:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239238AbhJHB1p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 21:27:45 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77B66C061772
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Oct 2021 18:25:45 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id y26so32781696lfa.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Oct 2021 18:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eRXNWHuPd38vN0RWOcJ4q4RHGL96UR0p/zcT0YWhKTU=;
        b=sXE/eokBQnk60sMw5lWBy7jhROc6GuZGLiOdTuXJ6YRADlfelKLdAijTh9GVCPCPh9
         X5f2UvW6CMDzqkGyBaA9E/pTjKqxOqXMaBnJxiqkNzCbxnSv/Qi90sD6fjN01SjI6Ldc
         qsMqDtoHT8VswmMd01z3Fds+in+YbSjA7wV9WQ54W+GQTebOsi+sPuVkd8A+cJPmOk+P
         Y73mGGD7ec2z/tQZ7Y37BZL0qtVEdH/yZSRVbt0SipTEeINgPdG4bejlX52XxBhvGfaQ
         0fKpH7N6iTh9+0L9LmgAHaxtjhwUI6zEYcLsu5Jc/cLnGF+RbHn7MoRLSBQkMFcNorgA
         NIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eRXNWHuPd38vN0RWOcJ4q4RHGL96UR0p/zcT0YWhKTU=;
        b=2AdYIlkxFctKi0yAJUVH+J466mtWW9QvF6pxZXm2fU5N2A+IRwxRzExUqr+laLGeqM
         e1JPAGTO1vdGqjSeYKS/7OzDhhs9oaZehQyzRaP2qF0OIPCTU84EX/o7/fIBEZIRCOdp
         PSVVrMJjgXlBJwIxexm+ioYpgB4QlAfpsbImH1UH9+3Ee4PrqHnDZGSy92X7NC9Xv6e+
         aiWyoZDpyQsubK8rFin3y0AzgoY387gXBtzpcXRAVx8qbJuo7ohvfAENBkALRxxT9B5t
         2kiH1XcmTyz2Q73CnTiOelpPs+Ue+xaNsK3PnBDo+kP3wP9EZEVopNL5DM+UfJNqCDKH
         rSJQ==
X-Gm-Message-State: AOAM533dQ3Jd96pUntxDWlXUVULRkXq4d3G18NQOQmMkPfaoAMECA7GO
        c9kvso572AytygP9FizheQcSXQ==
X-Google-Smtp-Source: ABdhPJzdwYYOHak+ok2LG8aFPMRytg1r0MqaPHeikvw5/pVuEW0puGgbKabv9hmR2usFiGg0yJHryQ==
X-Received: by 2002:ac2:54a6:: with SMTP id w6mr7407261lfk.61.1633656343905;
        Thu, 07 Oct 2021 18:25:43 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s4sm112875ljp.115.2021.10.07.18.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 18:25:43 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 24/25] arm64: dts: qcom: pm8916: add interrupt controller properties
Date:   Fri,  8 Oct 2021 04:25:23 +0300
Message-Id: <20211008012524.481877-25-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
References: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Now that the pmic-mpp is a proper hierarchical IRQ chip, add interrupt
controller properties ('interrupt-controller' and '#interrupt-cells').
The interrupts property is no longer needed so remove it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8916.dtsi | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8916.dtsi b/arch/arm64/boot/dts/qcom/pm8916.dtsi
index 7d9e25dd9e3a..55a386d05809 100644
--- a/arch/arm64/boot/dts/qcom/pm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8916.dtsi
@@ -96,10 +96,8 @@ pm8916_mpps: mpps@a000 {
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-ranges = <&pm8916_mpps 0 0 4>;
-			interrupts = <0 0xa0 0 IRQ_TYPE_NONE>,
-				     <0 0xa1 0 IRQ_TYPE_NONE>,
-				     <0 0xa2 0 IRQ_TYPE_NONE>,
-				     <0 0xa3 0 IRQ_TYPE_NONE>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
 		};
 
 		pm8916_gpios: gpios@c000 {
-- 
2.30.2

