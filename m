Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E5583FAB0B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Aug 2021 13:18:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235139AbhH2LSz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Aug 2021 07:18:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235110AbhH2LSy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Aug 2021 07:18:54 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09DF5C061575
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Aug 2021 04:18:03 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id 2so9821397pfo.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Aug 2021 04:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8okuw2i2gPCnfaWf95lgXpEu59gG7ex2eCsuML2DL6A=;
        b=QSE3uw13jKeUYYk+uqifiB+83SGOgghrwJutk3Cn5A5Vuz4oYBU/6FMNrBlgKdudxT
         +IqdiH/wsPjFZCL0K9RyILKgylbbxKOy1Z9lofhD93FSuY9BUsyHl8N0dpn7YjOPY67I
         kCX+/IgWWxeZoKdXavnyleXju8mV+TdPZTNiWsut3uZjiPEhIX2iIakjYxzagISdycOV
         lD65VtK8UBAW5ZxAHU8MiqctHJgSqydglXrxfjNMZkE9kIvn0ueA6K2e7lfJ9l2nGQ5r
         ajDDKuNGMZhUqeZM/ONB75IH0qfMV6pkc/n3aa8/jIP/vhiltGAi8xGojpqIfCehWETB
         I9pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8okuw2i2gPCnfaWf95lgXpEu59gG7ex2eCsuML2DL6A=;
        b=RoVHcUamBPcvrdIl4Ve3uzESvZqhifV7BxqNACFYLWb6vM+pMisUMYh3Odc0B0Oiw6
         bW6paSsEE+DyS3UZUYNog9mlbi/59wVOBf6BLNCfgcbNKAGpJ37D+TAfq/QBdMPz/3Ka
         35h6JOqdf+BDxi+zM7znTybs8g3TXkj0BFNHJFyZiq3gt0W9Ad13dfDGWQcb4AYBQw3+
         or1xkrX43HwqGEKy5JzXGEgmxAPB1wYYSgDI02vDWn0VuZxX/3e6Y4N40tgkhrRcTYtc
         ShJVFpu5/cHCwHinDD+8XRaErjZ/Wha+4KV7NguhHKBYzWLi7oR/OdE+h5mixYVrVfr8
         jE1A==
X-Gm-Message-State: AOAM5332GgVU7W+3rXj5MWbhp4yyqLd1+2EkArJF7JH+0UmYtYe9zhcZ
        gcLKCqQYmkOqTTLHSQFdkOpBLA==
X-Google-Smtp-Source: ABdhPJy0LT4n2ycGaxCPFVDPOBVgl84naMcnihSsOKRJ4ovHXie9zLb6Sj0ltfu8i4kUZqe2Yz2RUQ==
X-Received: by 2002:a62:e116:0:b0:3e1:57a4:e501 with SMTP id q22-20020a62e116000000b003e157a4e501mr18127475pfh.36.1630235882547;
        Sun, 29 Aug 2021 04:18:02 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id gn12sm16857115pjb.26.2021.08.29.04.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Aug 2021 04:18:02 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 2/3] arm64: dts: qcom: ipq8074: Fix qcom,controlled-remotely property
Date:   Sun, 29 Aug 2021 19:16:27 +0800
Message-Id: <20210829111628.5543-3-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210829111628.5543-1-shawn.guo@linaro.org>
References: <20210829111628.5543-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Property qcom,controlled-remotely should be boolean.  Fix it.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index a620ac0d0b19..2843bcbce778 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -220,7 +220,7 @@
 			clock-names = "bam_clk";
 			#dma-cells = <1>;
 			qcom,ee = <1>;
-			qcom,controlled-remotely = <1>;
+			qcom,controlled-remotely;
 			status = "disabled";
 		};
 
-- 
2.17.1

