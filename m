Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 747B33B0ED8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 22:32:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbhFVUfI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 16:35:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbhFVUfI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 16:35:08 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0571DC06175F;
        Tue, 22 Jun 2021 13:32:51 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id h17so464325edw.11;
        Tue, 22 Jun 2021 13:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5L9O5W6vqtHlRNNhg8y33uw5t/t1zDmxkWG7/hifX4s=;
        b=TZBvDahborAi1UNMGY6XRxFh2vH0Zu3dPPYZzelTD8D0tt8c9s8JyM8tpgdADXKa7p
         KPSeJszvQti2oEvf2h+zH9eCsxA5z0i1Sz/w1JFPcu6Qeac9kau0UGe1FFAJ3wwyERlU
         4tuYQW5E1s7D9fexVGCoqdMDzIGtZKh3cwI3cjuIeo1gR4izzQjEAxiWH7Rqlh82MbHH
         s2nfD3YQ6PwtZaNKZFQ6niLASjK9pQs3D54M7i2mjO38svMNG83s+pduPgte0rzJ9TOI
         u7hii0lv/AX+GT1/7adc+gIvQ0jBMrlEOM6F8btdh4qiUjJ0Jwswv5fCZ9BEhnjo0xbu
         G0uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5L9O5W6vqtHlRNNhg8y33uw5t/t1zDmxkWG7/hifX4s=;
        b=ag+Izusa0ZA+DI89/Si7XdoQogGL0C1c4VkVGN6R4MXihQLD1TdICsKQbyujkz8XhN
         aqIZdFb57wre6Pef8/4n/cEB5QYQnvbblgjQGmI/rB5QvNzo1+/CRn0OpzQnxAFmzA9C
         ak2R9lfb2ltCbPZOrM6Of8PvtYyWkTMW3FNKLbN2tWkokssEuasWGDXgS4pKnGuiMzr0
         RNRZ/AMChh1bFTv5u9QnaIxpwoWBWLR6d3hDyuxNNjS2pcxIYpqypqxyF5mUjeyDuicn
         5+A+aQts6od3MJZXxIashTuVeVK33dt9Ugb7+k/bfRduztK808hzkz5LHT+ovthEf19G
         p9cw==
X-Gm-Message-State: AOAM530/xWKH/3NjEXupW9T7DACUjryefe0HcBEvveLh6octX+q3ZDFX
        fWg+MSehAicuqJ/iFNxCN6E=
X-Google-Smtp-Source: ABdhPJwrnzeNol/nOOau418ZZ5VK1eAFoHJoCxe+gbyHT+Zf+yhoz1Q14KpdegTjFaU+N6ysTojBgw==
X-Received: by 2002:a05:6402:2898:: with SMTP id eg24mr7527249edb.155.1624393969684;
        Tue, 22 Jun 2021 13:32:49 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id r23sm7868454edy.13.2021.06.22.13.32.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jun 2021 13:32:49 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH v1 2/3] dt-bindings: phy: qcom,qusb2: document sm4250/6115 compatible
Date:   Tue, 22 Jun 2021 23:32:39 +0300
Message-Id: <20210622203240.559979-3-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210622203240.559979-1-iskren.chernev@gmail.com>
References: <20210622203240.559979-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This compatible string is for the HS USB PHY on sm4250 and sm6115
platforms.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
index 9f9cf07b7d45..70258540676a 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
@@ -23,6 +23,8 @@ properties:
               - qcom,msm8998-qusb2-phy
               - qcom,sdm660-qusb2-phy
               - qcom,ipq6018-qusb2-phy
+              - qcom,sm4250-qusb2-phy
+              - qcom,sm6115-qusb2-phy
       - items:
           - enum:
               - qcom,sc7180-qusb2-phy
-- 
2.31.1

