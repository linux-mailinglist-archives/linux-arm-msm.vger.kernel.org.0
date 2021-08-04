Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB3783E01F0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Aug 2021 15:28:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238428AbhHDN3D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Aug 2021 09:29:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238108AbhHDN3C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Aug 2021 09:29:02 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E25A5C0613D5
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Aug 2021 06:28:49 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id t68so2680093qkf.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Aug 2021 06:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QFLJoMXDhEHLGcdtkF5dL2y+7dGxyAlRAtgvl9mW6Tw=;
        b=oLPA8doLkq8mTryx6byEUyfPcDftA5boAK9TdrX1I4VX30Yaif3f7cYCTYMm7hMQZi
         mIqsYFJWNKaOrY7HAFerGVPsVDYN6f1/jHPutnsVjSLEa/xT2y/gYA/1nZ8pyFgOMq2j
         zi0k2Csj36CNw1lw67DsWKVwj6mhpWXoViK8GpuuKWzbUS7uKxrYgMlO9hmFktSawJRz
         QnAFgZoQsAZwiHBx85H7xeHo5fsMwkHU020uT82QosoQhlsOH2Br7opC5l3TBouKTE+r
         pGT5e0pSWpnBU+qXxK4uv4iil2YvKbw2AXRzrONRb+7ee5S4bREEYB8X4ukL1jXPxgB5
         NwPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QFLJoMXDhEHLGcdtkF5dL2y+7dGxyAlRAtgvl9mW6Tw=;
        b=Umq6WIoOllmyhaHhu3/o5FZGLrk3+fdpPlLtFW66Kfcnw5R/U4Q6H7+jcdKoQ7cEey
         ivmle71/KFBWd1Zgiy9X199IMjo4ndTfCKKUcRLXSDPanrMdgvD4CCIkQqPY8S3NXJ46
         62XtiDxW6hrGcjCt2g2ZKLhy0eqisiHvFeTrs3bvDTOUlULvY5EaMV2JYqw8kUBQ+iV+
         ixQ/abeB6t0/+oVUWvWafmHD2137n/VjhaK4qWR1/GqSyQUEiyWsvKmkfxiPaLbYhHIa
         bzu5st6zsr706/pLelkuocaagbxFZhrFY6F/KCVlm5rjKfH583cnHgfcpz/ZlpS4uUJT
         fPqw==
X-Gm-Message-State: AOAM532zUt4m4QWCc7OcHB77ObPrDmViL4eX0KsVWsD8kYoccNouXI2/
        zNVkEakaA2xnuqWcQ3bok3634A==
X-Google-Smtp-Source: ABdhPJwyeggZTlJqzKdDaWXJ+Ft1mPz5g6bWBjVq/b7qflnOgpdzYCVkml8dHDVDI3Z8vjShMgHYdQ==
X-Received: by 2002:a05:620a:1398:: with SMTP id k24mr25691862qki.12.1628083729029;
        Wed, 04 Aug 2021 06:28:49 -0700 (PDT)
Received: from pop-os.fios-router.home (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.googlemail.com with ESMTPSA id d82sm1342054qkc.86.2021.08.04.06.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 06:28:48 -0700 (PDT)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sm8150: Fix incorrect cpu opp table entry
Date:   Wed,  4 Aug 2021 09:28:47 -0400
Message-Id: <20210804132847.2503269-1-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

CPU0 frequency 768MHz is wrongly modeled as 576000000 hz in
cpu0_opp_table. Use the correct value 768000000 hz.

Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index cbf0d8d7d76d..5e6471e5e2fc 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -319,7 +319,7 @@ cpu0_opp5: opp-672000000 {
 		};
 
 		cpu0_opp6: opp-768000000 {
-			opp-hz = /bits/ 64 <576000000>;
+			opp-hz = /bits/ 64 <768000000>;
 			opp-peak-kBps = <1804000 19660800>;
 		};
 
-- 
2.25.1

